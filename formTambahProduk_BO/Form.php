<?php
class Form {
    private $action;
    private $method;

    public function __construct($action, $method = "POST") {
        $this->action = $action;
        $this->method = $method;
    }

    public function start() {
        return "<form action='{$this->action}' method='{$this->method}' class='p-4 border rounded shadow bg-white'>";
    }

    public function end() {
        return "</form>";
    }

    public function inputText($name, $label, $placeholder = "") {
        return "
        <div class='mb-3'>
            <label class='form-label fw-bold'>$label</label>
            <input type='text' name='$name' class='form-control' placeholder='$placeholder' required>
        </div>";
    }

    public function inputPassword($name, $label) {
        return "
        <div class='mb-3'>
            <label class='form-label fw-bold'>$label</label>
            <input type='password' name='$name' class='form-control' required>
        </div>";
    }

    public function inputRadio($name, $label, $options = []) {
        $html = "<div class='mb-3'><label class='form-label fw-bold'>$label</label><br>";
        foreach ($options as $value => $text) {
            $html .= "
            <div class='form-check form-check-inline'>
                <input class='form-check-input' type='radio' name='$name' value='$value'>
                <label class='form-check-label'>$text</label>
            </div>";
        }
        $html .= "</div>";
        return $html;
    }

    public function inputCheckbox($name, $label, $options = []) {
        $html = "<div class='mb-3'><label class='form-label fw-bold'>$label</label><br>";
        foreach ($options as $value => $text) {
            $html .= "
            <div class='form-check'>
                <input class='form-check-input' type='checkbox' name='{$name}[]' value='$value'>
                <label class='form-check-label'>$text</label>
            </div>";
        }
        $html .= "</div>";
        return $html;
    }

    public function select($name, $label, $options = []) {
        $html = "
        <div class='mb-3'>
            <label class='form-label fw-bold'>$label</label>
            <select class='form-select' name='$name' required>
                <option value=''>-- Pilih --</option>";
        foreach ($options as $value => $text) {
            $html .= "<option value='$value'>$text</option>";
        }
        $html .= "</select></div>";
        return $html;
    }

    public function textarea($name, $label, $placeholder = "") {
        return "
        <div class='mb-3'>
            <label class='form-label fw-bold'>$label</label>
            <textarea class='form-control' name='$name' rows='3' placeholder='$placeholder'></textarea>
        </div>";
    }

    public function submit($text = "Simpan", $class = "btn btn-primary") {
        return "<button type='submit' class='$class'>$text</button>";
    }
}
?>
