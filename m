Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp24532njc;
        Tue, 21 Jan 2025 03:41:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUHC5OqYppu4pNHeCb+9aNVyjpIDa7KQk+YG2ox/CcwWDOyhuovXOlC6n3TwsmXtfmzqMarEqk0fUte5A==@linaro.org
X-Received: by 2002:a05:600c:3484:b0:434:f8e5:1bb with SMTP id 5b1f17b1804b1-438913e48fdmr161687225e9.12.1737459699929;
        Tue, 21 Jan 2025 03:41:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737459699; cv=none;
        d=google.com; s=arc-20240605;
        b=BK0ginQd6h9f8Iq1od/qc8umSGcRMK8WDY1htVz3Qy9nPZDCDiIfR5qmQe60YeCPrj
         mcCJbnBYjxomFw/pmbG70OItkcFvBNwKxcxqyiHDD5eUKEcmEmKD1IlQC+oWbLY6plF4
         BUHVPWW+A+mufmn36z3vKVRFeExbOUCRsOZcIEIOOAyvGXzjLCnCSJBwQAJzc/fS2m30
         ggI2376wg4Y7p0soHQEDLkdeGFcpIHTQ6KRXzQLAIZ5LjRdfi/gdEtnnXERQum2nLVue
         VlvZOrFl6e/qhu2r70512Qyzd15uFMQdJZjN4XhaJyixhZOq4+wfcIHMd7g1sXgxMoe+
         DnoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=sbmqBhov6nOW5WRBICFiiuCzE2uEl3xQcd3ZviTByWc=;
        fh=Bn4UA1WTtaItbCg9i5LqVK7Y6gcM2gSfI4L4zbcE/7U=;
        b=ZF28uM/43Wp7v8PCnNkWV/AtmqfdSCEUsL+a9CG94i/QlqdNZbR4+3dOT9a0C7Sbf9
         MOX+T93pvye5UK86BfkYrxLSFiP5JL8D/R2bdo4s+Ys8hi2qAiyurc6afL7VJsVlhxIb
         KeW4hKaIRa+9CtKrmIpKWZVnR00xxHTzyutWmz3W4CM+26QqfQojy7CllZpGObK79vyt
         +06bph0QPXU/nfQovtt44sBFIUFgsUvWN3i18qeCBEoh/uR5cBMpYkxWnUdoIv8PEkby
         IFuw4wEZLrbgTtn67d6wE4B+rdse32L7DVA+oU5ndzXJK9GVGDLuVf/zmNv9S9ValdH0
         xV2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pafCQpnT;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4389048f5ccsor35628745e9.7.2025.01.21.03.41.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Jan 2025 03:41:39 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pafCQpnT;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737459699; x=1738064499; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbmqBhov6nOW5WRBICFiiuCzE2uEl3xQcd3ZviTByWc=;
        b=pafCQpnT+CfnbKMq7F64/km0UnapCnNBk7OsbJx+fR04Rw9+DesPOBx5dKTmAeDEtb
         5Gqi+R0bJSK4jsNdficDNAU+TPjR6t7HxVlfsDIO1ZH5g003Gaye5biebrRsNEhkZCAK
         iHc773WB7wAyLiK1dzm66BzRmWnVx2PUl0le75fW5zTL1bFIboukqrzVs/g/krRrd88N
         YYtrmJBdSIlkw9vVbcxrpBNkaw7LBa6p6H4SabToNdhB3+WMXIyzfE1OjNOREDqaJLCm
         JbLj8HahMaU5St8x6WbmMoh5844oe0D8cvvHBJAl1LP06P5KuJwH3bgZhNWOp996zmyE
         sm7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737459699; x=1738064499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbmqBhov6nOW5WRBICFiiuCzE2uEl3xQcd3ZviTByWc=;
        b=WrFD5ZDo7KhgcFaIbEVxsnCokTvQgTuaXemhggj8XG5NU48w7Fllr3s/o4DXSHE6Rw
         g87X9UcvGSBk/Oq2h+tE3DIuUKXdQLDdrKF2ZiP6T1dusCI4B4kqS2lfVyNWiT6uW9w3
         LSOvoqK8TSfTI0b+MN+YRIudDHKSiWR3NT4yGdST0fB34UszJosG22uT9vXvY9q5EU3j
         666PsjDgPYtUrmya0oybpk6IAsYcuS+lcedHZCnwY1qBlqVqg6ZIf2HiBg5c4lPogz7W
         inTh/QY/fD2sy+Tl7MPmST/XgKbcfnJExBWlJJr+wUr5l10fcYYBsZclX9XsrlG47KEz
         yXQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzKkoyZsRgbFvtZJqWM5xkUdrOd4I9RlmMQygGVauU+coFOqPneoZ259bNND2YvTlgSa+mjZ4logN1tQ==@linaro.org
X-Gm-Message-State: AOJu0YwMPIvgxse9JNr7g8buHGMmDG5GWLKxU/MCe9SqSHiszGt0pkNE
	SpiuVdApAVv83TuyKHBObUPE8Q7KYVaKv3ZE6oFChIyma1ccYAa/x2eskto+jRjvumnh8bej51S
	Upb0tLA==
X-Gm-Gg: ASbGncuiKCIw+tN6G8FM6YqVbb9QjI6PVcnoSHl1CV5+m2La2Rkx6FUwet4cMvVnj54
	3MOXN4fqG9jQOZJLPwFl8rYJNV/DnmDbk8Ka9JIantRMcGDgNC0EIdSeZgMFfejF3sNGEVY+Qes
	5yB17pZ7sDdYvX+yAo6/iBhicYpG3Ec007DsDugYQkeZZ6xBbyj+cGefQ9sQffI8TysZyx2BBbN
	wSQb8/3y+GzEgLzWjxqqjSwb52MFhGTp7p0Xj86QP79A1sI8NpKLR4VEHJG12NLhwWHBsazIZhj
	FTl1faE5DLwTopz6X4Ad8A5BCuQ3BEhNvroZTrer/dVR
X-Google-Smtp-Source: AGHT+IFvrLae6bJODFDwt+1EVnAkGSeOwOakfLBXI2a6CaNkQA7Dm+nSRgUsdOq69rgIxYGYYEYnSg==
X-Received: by 2002:a05:600c:4ece:b0:434:f609:1afa with SMTP id 5b1f17b1804b1-438913c6787mr153654015e9.4.1737459699396;
        Tue, 21 Jan 2025 03:41:39 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221b70sm12914454f8f.26.2025.01.21.03.41.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 21 Jan 2025 03:41:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 09/11] target/arm: Prefer cached CpuClass over CPU_GET_CLASS() macro
Date: Tue, 21 Jan 2025 12:40:54 +0100
Message-ID: <20250121114056.53949-10-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121114056.53949-1-philmd@linaro.org>
References: <20250121114056.53949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Yx2flf4NWuhp

CpuState caches its CPUClass since commit 6fbdff87062
("cpu: cache CPUClass in CPUState for hot code paths"),
use it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.c         | 3 +--
 target/arm/tcg/cpu-v7m.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index dc0231233a6..048b825a006 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -846,7 +846,6 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
 
 static bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
-    CPUClass *cc = CPU_GET_CLASS(cs);
     CPUARMState *env = cpu_env(cs);
     uint32_t cur_el = arm_current_el(env);
     bool secure = arm_is_secure(env);
@@ -946,7 +945,7 @@ static bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
  found:
     cs->exception_index = excp_idx;
     env->exception.target_el = target_el;
-    cc->tcg_ops->do_interrupt(cs);
+    cs->cc->tcg_ops->do_interrupt(cs);
     return true;
 }
 
diff --git a/target/arm/tcg/cpu-v7m.c b/target/arm/tcg/cpu-v7m.c
index 03acdf83e00..d2d0b94b630 100644
--- a/target/arm/tcg/cpu-v7m.c
+++ b/target/arm/tcg/cpu-v7m.c
@@ -19,7 +19,6 @@
 
 static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
-    CPUClass *cc = CPU_GET_CLASS(cs);
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
     bool ret = false;
@@ -35,7 +34,7 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     if (interrupt_request & CPU_INTERRUPT_HARD
         && (armv7m_nvic_can_take_pending_exception(env->nvic))) {
         cs->exception_index = EXCP_IRQ;
-        cc->tcg_ops->do_interrupt(cs);
+        cs->cc->tcg_ops->do_interrupt(cs);
         ret = true;
     }
     return ret;
-- 
2.47.1
