Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp654980njc;
        Wed, 22 Jan 2025 01:31:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV9fbU+dzi/4WUU+hlF/WNeDr8smna9MHHdiG2JHBtpq+pS69yHt+aYgihW8hfRHvdS1TiVFYBSu8+fUw==@linaro.org
X-Received: by 2002:a05:600c:3b26:b0:434:a0bf:98ea with SMTP id 5b1f17b1804b1-438913cd4a1mr179780175e9.9.1737538276951;
        Wed, 22 Jan 2025 01:31:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737538276; cv=none;
        d=google.com; s=arc-20240605;
        b=L+2mWHeOUsf8WLhOMOkKID2YK8SBMY3+JLkYj9awtFMFbww7EEa7XzC0a/31Anlhqr
         ftMHCn16b50apqduIoM6VMsCk7MgoCaiLMD5q3JL4LpP0PqPRKX0VsO6zLW/1WTXIqtP
         gEsDzbfS4d6eXdKRw1QdvGCT3jjG+jUYXMZv7jrZM5ZvW7KS8/6qHRS/NyAyUMNeLSAP
         2fFZVrowR5SMOW17RAlkq7Dj2ix5A47a6UQ8Bvz5ygm5oNK1R0yPNxknzX3SIIHdwuYf
         lOgIGXu/2rUTA6HXroJ4dgcTE7RYcjhko2lthMAwzaOym5ImyRou/3Nr4oUP0++fI90I
         Kj/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zX6wKmzI06nCmXct1pzxbuNtoEp265I9BJm+57rS6fc=;
        fh=dlTJ6zeC8P57oPEkZZZ6rLUMe0bvPPI02pUelpUWkUc=;
        b=ThMM8xkVxfLJQH+IxFj5N7PIXn8DKagJxQiNyFj2c68EOJaSQKEJtkTlGpwVbYqzOf
         68dcxmGXKyumfx1UHtBhvPrszIs9plEUQ1m5qsSQnNQurWLvE/cUlv+K3sr2tDF6j7uQ
         V9Al9Ul1OvUVWGHQJ4yagGRywYP0ZisKjW9567G7z4MK423/4r5aUvrVGJUXV1bvNjjg
         p0MfeZu+uc8Akj6jn+IDwquc0T4mGfQNS3FaEBN88SyhpmJ4dqV8UECwPonXgrIKDX0R
         ecHDzpp+Tc9Vha32b3gC+i9rMleUIhsD3CX7peL7/CCs+XYJsfDj1Pjre3q5guWFDvAu
         Ip8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fnCWyJnl;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438a2a17df4sor35651575e9.3.2025.01.22.01.31.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Jan 2025 01:31:16 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fnCWyJnl;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737538276; x=1738143076; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zX6wKmzI06nCmXct1pzxbuNtoEp265I9BJm+57rS6fc=;
        b=fnCWyJnlabLVeiEbhiE9IK950LW31+THYPtte1La1iF+kRkPKj9HEJZo3NIGnJc4ci
         OUcSJUis4v0p59xmFUgGn24wUFc02wkJBmY1ZUgtzyjyUhdeccsY1aLgtXvsyRY6VtJZ
         zDYr/GeNyGBR/6wATAxfD4o22A7Zp/lbEO4I4VSsBKVPAkf67MU0Sgkrwn9tBgFluP2C
         u2QeiqU3v17fgZeFYS+8HraTqCczDigRTS9HhVSdJGuuEBGOsiKBH1vUOH4Sd6A9q3Fb
         iWWa+QstNbxQrMG/hpZyqX0Us/+aGbCm7xW3grPvBJT0kYxw0kY59IkSsMLA357gS0/b
         mZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737538276; x=1738143076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zX6wKmzI06nCmXct1pzxbuNtoEp265I9BJm+57rS6fc=;
        b=M3jUtZ6XMbKNTC45OCr7JOkXRADTwsbfKQZ8fStUPLyv1YQcO3Cljb9u012ua6oI+5
         Y+Hsxrj5t0sn+Uf1sDEuf4IWaHTMcdtrPkav9I76dnpvnlGRDTWd9qcA1aHW+mr+Aeuj
         OFELuFXE8yOB36X2zRH3VsqDrTVhQZNvZlVGxsFRaT/9gYxJVaa8ruUf/VVtPEgK+kWe
         mZC5ocdWS8ZfiamDvDMGdf84mYnGX2J0fHNMJ87krhehyeVUKufqnU0n3XdesJaOcBty
         33XpFvsbi5om+J0KsdCC9yK0DS+9mi2e5D3SbQqyKmn+I/QFRsmwi+2bfybH/SOfLEIe
         v8Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUqmp83Nh9b/QyV2lt90msJfudmCiqP+W7eWhTLff/6xk5Egy0Qr2+csW2svbCC6ief3TqkKBWvWnonTA==@linaro.org
X-Gm-Message-State: AOJu0YzRAA9fx2r+OIIx6zhprHHo4izbI40h6b7E1u3cPkR8Ipr+wxiQ
	RVx8JZdDMXYushci9fA0ZPCS8YFiBcAFWsyMEsiFz5ExOqJ5gSXeNPsuSCeCug1NeQ==
X-Gm-Gg: ASbGnctj2Mbu3OPeblSd5jGJ9kBcMJCh07yMx5B+UuAIDpLDOjxoDz0TIB+4KWGiayd
	Vm+Pdc8Fd1IXp+zKHJMsaOq96wA2WT7uTKzGSlFFOIwOTVQnU5/u5fuwo1/NB1QjDtJE86rIuf+
	JXn7Mwwpnv4Oh4pcjV8h8+vZeVxbyK7dOc9mjUb94S9gHaUOuHXD01gmgLEe6pR+qWZfxkxFPSc
	2zJgzvIqsY+Ly2zUTcokzgicI6aXCtWg6uvfH98hfnbHdSoUMAtzumb4QK9DF4SI4hLs4PrYTH4
	dp9FYswxmk0I2StEtLd+qih0MAzBwBdoFMX6IHYRmoJr
X-Google-Smtp-Source: AGHT+IG6O9YAZndqYHtLAOIJrxfLy8HdpLW0g3XjNE4dMucyHCtbEMrzySz5+yEgU7OfImhUVkvOdw==
X-Received: by 2002:a05:600c:83ce:b0:436:ed33:1535 with SMTP id 5b1f17b1804b1-438913e0384mr202379415e9.12.1737538276486;
        Wed, 22 Jan 2025 01:31:16 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b318aae1sm17628795e9.1.2025.01.22.01.31.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Jan 2025 01:31:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 10/10] target/arm: Prefer cached CpuClass over CPU_GET_CLASS() macro
Date: Wed, 22 Jan 2025 10:30:28 +0100
Message-ID: <20250122093028.52416-11-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250122093028.52416-1-philmd@linaro.org>
References: <20250122093028.52416-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: rmkQorFVIm/0

CpuState caches its CPUClass since commit 6fbdff87062
("cpu: cache CPUClass in CPUState for hot code paths"),
use it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
