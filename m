Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp476241njc;
        Tue, 20 May 2025 05:54:43 -0700 (PDT)
X-Received: by 2002:a17:90b:5628:b0:2fa:603e:905c with SMTP id 98e67ed59e1d1-30e4dac971cmr31811604a91.2.1747745683220;
        Tue, 20 May 2025 05:54:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747745683; cv=none;
        d=google.com; s=arc-20240605;
        b=GeUBgC+0KYKuAj0lrn0bAYMMhRpkUjWF8s+bFfarO+bVJrMXog88doCPvO5wOHwrHA
         OaD1NImLZs+JbAXGl4gIdIfxqPD9rd729CLAUmB3Z8t0cFyvf6Y+dMqwaOd+5bsyAj93
         WbCyK5epCyEuAiTJSNoh3DRdZy1JxqPAr43UxgO3iI3oLMGVK3869D6le6m0wOJ1UV1I
         FxDcFE+Kzu+VIadlPDlNqVucl+sJbZl8pbN+xuB+8UlBxHyf7Ewsp2AGxqzzsp5POP5H
         Gbx/jeumzcE4KxXFXQdAP447KZwbrBNVwCpUwP2oLWFVsTM9KIYONIwwP1+zqCCADmUe
         f6ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=VMl+BLj6shot1+8OfcaCTtS5NXf/RyeuCk4yd6sbvuo=;
        fh=dcoBxPz0yka847pDAPcel/LtQhRaeok1fKjOmAE9Ul0=;
        b=WcVV4biRAxqzk7Ax2aAxSSW2WDZZX/5u6zM+/R/FK2AqeMP9+5AwrtQWqAX1IdNB9q
         ABQc6+srU3RlF3yq3YErrb3Vs5mGXQNp192MPAO49JVh8yrrAUM+4J+uSvabdIN0O6st
         tQOvBjOz8xrT3kVMkvuI280NB5/yPj2d14/chk+tLHc9104Yfu+lqLSv6QuTLYYjDTCI
         GReimJWoi4Ze2jhHZB4PS6X03k7RChti2bURRhLOrw4ZbU29AYAKo2r4ljRJXWklf+Di
         voy7IZkBD3Tbv69UWC2HdLMtJ5B/t2HV7uTkNMd5/PaPjT1vRek0g0lNmr5dsj0MC3YV
         CCCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ApbvKa7u;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30e334c7ef2sor6204963a91.4.2025.05.20.05.54.42
        (Google Transport Security);
        Tue, 20 May 2025 05:54:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ApbvKa7u;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745682; x=1748350482; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMl+BLj6shot1+8OfcaCTtS5NXf/RyeuCk4yd6sbvuo=;
        b=ApbvKa7uel/dZqMlLPgvJ9L0hNW78azrw4bpuKWgi00oJGqV/qZNNZox/47Wd4TUmM
         USF+K1TCpAXXAtMuEw6LWmkOVWGTT/sdgw1N8uwRsa+98m+509UFJt64KuHxw149kpHg
         mkWujccVOPcZ/4jLcTaD43+X4FAJpAa1t7QHF3wjcI3k8dK4L5Zk7qDrw1cpzUyqW45d
         92lBfcDut7A0cQMFJvvrRSYmQ7RgOYSlRXq73AUnYR6VhDSfVp91ekeYcnMMsnTN3idz
         7hirYHgsgEpBh/lxfAkUqKhe5tHObILf4UM/mUVMJGT+bRe1bQKeGzOgEAlPghWaUA94
         VzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745682; x=1748350482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VMl+BLj6shot1+8OfcaCTtS5NXf/RyeuCk4yd6sbvuo=;
        b=XqxoJY1Wi151YlVMiGmT5okfFQkNdoSCdHX8YoHqEJm7pUG5Hi6zZEwdnDsI11m5pg
         nnqT58YbJtETwYJf+JiRspmXS4z7WWx+deNVZn8kphtOGQ1M5aX0/gMDPT/ayZ293cnJ
         /E9y1fDsFKheUpup5Z2dqoQEyWfvfSTZOtARbM2nsFyFhpK2nO7Izj+7wEM0l6QId4Sl
         W3Gp9erz9eUWJecO+8KazOpayIbYytGFWTgIUPtIrRebPIHlur+TMqc/Pcv6p0CHOpn3
         TgYdY/RY8G/5cAO8suXXZbW7mvvRvtZCFJpMgIFF6jq5yWsEjYtzU/f5hpr48APmi2q+
         1nhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEHDa6CYabloM76BV5jJG44alJz3naJwl6k94HfX/owKQfINgOZ2XqZ4lrSkzSICIijkfg943l9+vielgXe1mMdw==@linaro.org, AJvYcCWwgurse8jIj4pgudLndGUHy9EOYRlBI9V5wLhXaKoutNk/a7cA6zgX57OnRUsAodL5aKinkJU=@linaro.org, AJvYcCX39oiefnjn72BpFhdemHDjx56p4qZp4jmqQvCoVbGyVg5GEyQV1am1/irkiRH8Hbc4Ia8NeGsSkoAymQJqBOJDUIM=@linaro.org
X-Gm-Message-State: AOJu0YzySWFeSQPCvjiUmDYZVcVtUjBG1zCg3nEMGOXFgAs2JdIQl3Ww
	YUxMqwRTR+fmErluM8AK94mdYP6EtFCAaE3KHMI/MWtEMp+KF8Q1MZMS
X-Gm-Gg: ASbGncvwlacIslsgV+AG6hlKnArX1sL/EkAR4/5VRfa9JfFmEZez05AG5LOryjyNKk7
	vccrdtkbtj+ch/XS5oe+8UCFfxJq0rM79TqJNXyznrRPeMPS7H+QAmCLWJqOvaAZgGt5AmPnmOt
	3WifI+u2w7ptoxaaNRNKUetBVTBk4C7VoIJ43b4eqZFGiWt877Fj0q+jkLr88t0WGFFimBN7LWG
	EeOvkIUHK5FsB1bkg7XWiXYhJo4iAJdDHAE5moH3g5n1AQhfL2J/tmFZo4YYPLnsmDJU2E3ZrTj
	y4douvvW16FQuA7T/hmWiKLLtBiGc3kygaijPvaqrq6wojMu9DrMu+lRX/oRPQ==
X-Google-Smtp-Source: AGHT+IFLR9WZD1ZfyejmhDg0dIA5O+JyaV0hB93IqpSi5hqodoOEgtN1hNTLUEDuyzBJRJYgqpPyVg==
X-Received: by 2002:a17:90a:e7c2:b0:2ff:6e58:89f5 with SMTP id 98e67ed59e1d1-30e7dc4ed52mr24245041a91.6.1747745682506;
        Tue, 20 May 2025 05:54:42 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:1bde:8310:e993:5dcc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36364f9asm1625916a91.4.2025.05.20.05.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:54:42 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	WANG Xuerui <git@xen0n.name>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Stefan Weil <sw@weilnetz.de>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 26/33] tcg/wasm32: Add initialization of fundamental registers
Date: Tue, 20 May 2025 21:51:28 +0900
Message-ID: <0e9635f3bd25e31fd39eea32242101c2b847784d.1747744132.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747744132.git.ktokunaga.mail@gmail.com>
References: <cover.1747744132.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 6k794nJvXILI

This commit adds initialization of TCG_AREG0 and TCG_REG_CALL_STACK at the
beginning of each TB. The CPUArchState struct and the stack array are passed
from the caller via the wasmContext structure. Since TB execution begins at
the first block, the BLOCK_PTR_IDX variable is initialized to 0.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/wasm32.h                | 10 ++++++++++
 tcg/wasm32/tcg-target.c.inc | 17 +++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/tcg/wasm32.h b/tcg/wasm32.h
index 1944249891..ab23e26eca 100644
--- a/tcg/wasm32.h
+++ b/tcg/wasm32.h
@@ -22,6 +22,16 @@ struct wasmContext {
      * Buffer to store 128bit return value on call.
      */
     void *buf128;
+
+    /*
+     * Pointer to CPUArchState struct.
+     */
+    CPUArchState *env;
+
+    /*
+     * Pointer to a stack array.
+     */
+    uint64_t *stack;
 };
 
 #endif
diff --git a/tcg/wasm32/tcg-target.c.inc b/tcg/wasm32/tcg-target.c.inc
index df34097267..4b7cd784cb 100644
--- a/tcg/wasm32/tcg-target.c.inc
+++ b/tcg/wasm32/tcg-target.c.inc
@@ -3258,6 +3258,23 @@ static void tcg_out_tb_start(TCGContext *s)
     init_label_info();
     init_helpers();
 
+    /* generate wasm code to initialize fundamental registers */
+    tcg_wasm_out_op_global_get_r(s, TCG_AREG0);
+    tcg_wasm_out_op_i64_eqz(s);
+    tcg_wasm_out_op_if_noret(s);
+
+    tcg_wasm_out_ctx_i32_load(s, env);
+    tcg_wasm_out_op_i64_extend_i32_u(s);
+    tcg_wasm_out_op_global_set_r(s, TCG_AREG0);
+
+    tcg_wasm_out_ctx_i32_load(s, stack);
+    tcg_wasm_out_op_i64_extend_i32_u(s);
+    tcg_wasm_out_op_global_set_r(s, TCG_REG_CALL_STACK);
+    tcg_wasm_out_op_end(s);
+
+    tcg_wasm_out_op_i64_const(s, 0);
+    tcg_wasm_out_op_global_set(s, BLOCK_PTR_IDX);
+
     tcg_wasm_out_op_loop_noret(s);
     tcg_wasm_out_op_global_get(s, BLOCK_PTR_IDX);
     tcg_wasm_out_op_i64_eqz(s);
-- 
2.43.0
