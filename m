Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp877981njc;
        Fri, 20 Jun 2025 06:08:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWFZdGSFyeWNf0ZfBFh/FX3CFTMuc7bi9uiiZjRNTsbYncP6iD5GWapQEFCynPQE9AuAZ6Dy1F1qZlvKg==@linaro.org
X-Received: by 2002:a05:600c:4e8a:b0:43d:1b74:e89a with SMTP id 5b1f17b1804b1-453659ca684mr30245385e9.9.1750424895282;
        Fri, 20 Jun 2025 06:08:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750424895; cv=none;
        d=google.com; s=arc-20240605;
        b=g2Bm4+FlnACjsprGfqEi89taNYHHtEp01HSnXP0/NM4XaVKcvMjFHKaSh5PLQhkyf9
         KwPbAMk3MjnUqldd81g6lbpl7ItrQ0wFPsvpMeel6WT3Q91rUpsDtRKJsqwdnjXj749y
         Z3CAuMW81gb1A6D0fcJIKkG5Y00Nlp2NdE87N2vojsGZ3Uwx/k9JVUIm/cH3679Vb8YV
         XTcBKNMvEFeC1qGMkS0z0em67nGuSxwTmIMy6O1Od/9jtmhfIFUf85rTnVvR5VWfFpyX
         5XP3IgGlCfWm9fvC6o4sg5ZTDNeIl7CiA4+w2SmU65nOqt/aceOSryz7gZngIT1KS0bX
         UFEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fZYVTt5RemOQGhErk/wxiT1GRcR8x45vVeqGw/eKctk=;
        fh=HEvFpOzblrFJ2DCvduFjHddo+xFOVwffhJx9/Xed4MI=;
        b=jjifQTZLKMr8xeu3zQnPqVsLX/ZxmE6sdt+tloxWNAyDXRDZw4xRunvUMwaI2rqi1V
         bc5xbZqhbbAZm5rKdgPRUGexDv6nn6Oq8f7sSmabSxHr9mBq+lZvYN9Wii7zxTQdDqPN
         wsilPSMaUO2j63rt04vGDhNguvInd3MNpz9+5ViLSU1RBMWJnQR10qgz282Pp+q1eNJX
         Yz8mV2Q4P0tMJztP775deE/KbwDWzsAJ9AzWNi9y6ld9AH5EDXnIQ/Hd7FLbs2VcHXbG
         FBhxrQHsxZviPkDVWdNgt+Kq5X26Ab+N8PHB7rcqALLZaJCS23BN0KC0AJ6d+AAHplmH
         Kp9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QST8mvji;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-453659db95esor6585075e9.1.2025.06.20.06.08.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Jun 2025 06:08:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QST8mvji;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750424895; x=1751029695; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZYVTt5RemOQGhErk/wxiT1GRcR8x45vVeqGw/eKctk=;
        b=QST8mvjiJjQa3PDwp7doEgfMJ4ycG2lt+TAkKi2onFXAA4bTdcBijlcFxBTsYWhcQs
         Vcqbsy5GGZfc2qwl2Rde+N2RtBwzPqVYoRLqjoOIjFastRJg5dTuL7elbEETFvveMGgO
         ON/QRcci4kVQxQqeP0hAiwvD75T/iXnB/jPGgoUSOlmlN6MYVMM2DkhFLAhOvlocxcIj
         mYlTx0z3yHLD16TlHvXZ5S3rAuZMiUrWMSKIhjGUqgbuDMSfMPeVhzPvy930Xtxfwh8X
         M09zB9jGE4BGmCHnhV0/MN9mTIVKKExjRUoJs0vBg5ju4CqAmsbadG6ZWrRJ/K//BCdt
         mOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424895; x=1751029695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fZYVTt5RemOQGhErk/wxiT1GRcR8x45vVeqGw/eKctk=;
        b=l4YnbcuufDfkkgQ2HkRw6RRv/tz0WtN8dO2mGGYwpDKdn0SKYLrxsmBPvUJQN5FfnS
         7rvCapr03IOV8yDuUKJeG8TmyAIY19pbu/7zmxtZ6Zj3oCwkOW3bwrlD4QKFo/rDa5i+
         qooWyHPGY0GVqkAaZoyoW2zx8YwgUj5HhBwyUBlpYhCbqcLxTT6l6nLcSIA9YL6lzjlz
         zTQz/2ZvsDnMkXylyPvLFwCOn5/GIoZ+La0Vb4WaDsp5brjLCmal0PSHAovD1DozsJbO
         QQtq00Aok2f+LiyzU39+CosahoVkOj0qu/IKhST6qBqiQ9+SCCwynfJoG6rWwORH5oYz
         gtyg==
X-Forwarded-Encrypted: i=1; AJvYcCWhiW99pdICM5Q1Rs8yu1fk3vUqmEztcUbr9iAoxPGDjzC21ba+2aMCObd4SHF+f2pq4DA438V39EB/8A==@linaro.org
X-Gm-Message-State: AOJu0YwgflgRrVcAc9GVvefEHO+QmLlo32j1/IY3UkFW6HYCs38i7U3w
	xLBaZyC6D4cSxxUUuEhJgZf53bL09nRKzd8tMQkPF75nsmricCkd8gQCj9zrZlPfYXvXLg==
X-Gm-Gg: ASbGncvmISDD9ayxZWH/iFJHJTZ1WEHXmDjazW/S+0avwX454N2F5Jf5/38KbWlkOXx
	M/DgCDnLJW0vszT5WMQhxICDFx4d1gw4ayATn022NMg2seP1K8ArZNRsKFebMAUkrRMr8kCDBrm
	O3ifYAb3RK55lT8Li3uJ7u5oKcFfKYhndkA8sxbS227WLBtPZy7UAtzllHk1NhSFY/tdllIt7xn
	MLeUBx6hxQc7nawFhoJDgDU0mNUvw1SxpHMG9Vd7/ORmtgURkD7LqHlQ8rhZYjmHsf7itoS9bng
	9KcmucYS4gEMm1WcSicfVvfmEFC1vPEgZb9JYtaXc9Q+8I39OCqqOULVerU3rjEK01KxpMwrlpE
	UvbYysfwrE55tfxIlYMa/bNqInOj0sHxJ6NldJPj/tpiEoMw=
X-Google-Smtp-Source: AGHT+IFVLdhGyOe5Gwiz0JlxZs0z4PUuLavXcnnSLq49twNgh52Q6RjdjYzWXSk1EhN5FYPARRZVKg==
X-Received: by 2002:a05:600c:1f94:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-45365a05192mr27153005e9.30.1750424894423;
        Fri, 20 Jun 2025 06:08:14 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d117c663sm2084326f8f.64.2025.06.20.06.08.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Jun 2025 06:08:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Alexander Graf <agraf@csgraf.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bernhard Beschow <shentey@gmail.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Eric Auger <eric.auger@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	John Snow <jsnow@redhat.com>
Subject: [PATCH v2 11/26] target/arm/hvf: Pass @target_el argument to hvf_raise_exception()
Date: Fri, 20 Jun 2025 15:06:54 +0200
Message-ID: <20250620130709.31073-12-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620130709.31073-1-philmd@linaro.org>
References: <20250620130709.31073-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 59eU6OXorbXn

In preparation of raising exceptions at EL2, add the 'target_el'
argument to hvf_raise_exception().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 5169bf6e23c..b932134a833 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1089,13 +1089,13 @@ void hvf_kick_vcpu_thread(CPUState *cpu)
 }
 
 static void hvf_raise_exception(CPUState *cpu, uint32_t excp,
-                                uint32_t syndrome)
+                                uint32_t syndrome, int target_el)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
     CPUARMState *env = &arm_cpu->env;
 
     cpu->exception_index = excp;
-    env->exception.target_el = 1;
+    env->exception.target_el = target_el;
     env->exception.syndrome = syndrome;
 
     arm_cpu_do_interrupt(cpu);
@@ -1454,7 +1454,7 @@ static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint64_t *val)
                                     SYSREG_CRN(reg),
                                     SYSREG_CRM(reg),
                                     SYSREG_OP2(reg));
-    hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
+    hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized(), 1);
     return 1;
 }
 
@@ -1760,7 +1760,7 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
                                      SYSREG_CRN(reg),
                                      SYSREG_CRM(reg),
                                      SYSREG_OP2(reg));
-    hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
+    hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized(), 1);
     return 1;
 }
 
@@ -1963,7 +1963,7 @@ int hvf_vcpu_exec(CPUState *cpu)
         if (!hvf_find_sw_breakpoint(cpu, env->pc)) {
             /* Re-inject into the guest */
             ret = 0;
-            hvf_raise_exception(cpu, EXCP_BKPT, syn_aa64_bkpt(0));
+            hvf_raise_exception(cpu, EXCP_BKPT, syn_aa64_bkpt(0), 1);
         }
         break;
     }
@@ -2074,7 +2074,7 @@ int hvf_vcpu_exec(CPUState *cpu)
             }
         } else {
             trace_hvf_unknown_hvc(env->pc, env->xregs[0]);
-            hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
+            hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized(), 1);
         }
         break;
     case EC_AA64_SMC:
@@ -2089,7 +2089,7 @@ int hvf_vcpu_exec(CPUState *cpu)
             }
         } else {
             trace_hvf_unknown_smc(env->xregs[0]);
-            hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
+            hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized(), 1);
         }
         break;
     default:
-- 
2.49.0
