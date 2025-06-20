Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp877692njc;
        Fri, 20 Jun 2025 06:07:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV8HsrZLQVwWiOgvfjdtyOEKz4PPcdXMNc5Lh0P/Oz2sNPHzEmvo0Cr2ErIQ/GdBjvUIl44lxvDCWhgtg==@linaro.org
X-Received: by 2002:a05:600c:3b14:b0:43d:2313:7b49 with SMTP id 5b1f17b1804b1-4536539c469mr27259965e9.12.1750424877570;
        Fri, 20 Jun 2025 06:07:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750424877; cv=none;
        d=google.com; s=arc-20240605;
        b=L5hG2khsTOKedEYa36blzsLp0LjjafnGjtVu6lDK7cL1IznCcwqDA4N6o5k5f1Nozl
         gnxjacYsd7zQ65GdpnzttUEnE8cUIux85KTjOHeAJ4Arh2+sDSPngPgS6A/7d0tOXGok
         Q4KqQES7CLApxvZOkpeV11S53LVRPFtRHpULTWlI+1U74I2i57pnXF1B1rnr01u/+Nen
         y4HnmeXiM67Ra/Aw/eU+N19pyo2FHzZ54Jx1adbio72O8wpHo0YVy6+Wo9Y8DVUVuI96
         3VdsbTHjA3sQPd4hlUQsxa9BtTLXI1TO05M1Ibood/SwucmprCzmnGRmhfLFEuGiVybx
         HIYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qyHQEfn6inWyZRMUVI/8b1HegzN318xDx/IKxFDD3c0=;
        fh=enEs65DrSm0ArNoT8XlqXLOno1IEuZ2iR2ZnxCgQlzE=;
        b=Y0jsJzpmBUP4vK48b0Nc2iCKAvagId25w8xo1oKUCAwakEkm/eeG3WeMlmtQ4xz2iI
         fwEGDnjZjSq8o9oalKpBaew51Ixsum7ImdCl6SLZfBVeqo61JrXntAFg/x/KoVBhbQJK
         n1zKhkOWKnBDLNUQ9yQZz144EVOsW/XkxI68Ts/SeArimnp3de1fdoBvbSOCdQ4wr/Ge
         YRIWUKCmsI/sapvH1lg1rQaadBnR5wmgSKp05cMXEYLNvKzAQXzJuVFx9pvh2TLOaiy/
         PKFkvkq2LTi19QxXsge+9qC0DgvG8InpaGc3e+zIpK4yExs3e22jpq4mNjoD6fCsKa3Q
         IyRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O1twCKBq;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-453646699b9sor7781555e9.0.2025.06.20.06.07.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Jun 2025 06:07:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O1twCKBq;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750424877; x=1751029677; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qyHQEfn6inWyZRMUVI/8b1HegzN318xDx/IKxFDD3c0=;
        b=O1twCKBq5OkppVTYtxbPkC+wmb9H2AR0SjoEi9Z4JFSFZGGsWlf8Z6tFgs9u3GgfQb
         mH7v92K4S1tJVexaGa6oW0zNtjO/o8NRSF/oC0sdP4RAHQOCJ54licbJoJJIURtTiVk/
         ap/g1cArmgCk5/CKI6wpQQSa8mfkHydgdHWLweK8MtvqYI144SZoI7f43jhNkPNSLL56
         Za0Kz3KZB4J7fHmCj37d3iTsvGxAUfif+BB01PCLCMciEgWChU55pU0QMjeNo8fYOxVD
         PD/gu3UDNgIVupYDYC0f3lndG4rgxwvFtI6GKgkVaiyd+eGTdHBXgKjj+SwK4n49aEhE
         xsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424877; x=1751029677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qyHQEfn6inWyZRMUVI/8b1HegzN318xDx/IKxFDD3c0=;
        b=f2YGvwALns/0/fk6OBjm7CfnTNpwBop1teCL3Oc11Lr+iWXMXIznIVpiJ5FmeC7VtJ
         KqZDW5++ducQeAzzmyTTI1K6Gdf4ZLh3lxBpmtclFlica4WjFkgg6i8AJkGa5yGOXSbq
         4ajO/3DFZ+drq3NDduh3sJ7eKI8jSGlGHB0slJBxhAi2rSCUWmai1UOpUHVL5kRdoer6
         VvI9XpjL1L4xQhRZO32cpB/dTL50qwkzLmPOhFADqSp51sM+FAgGwXwHxo9B7l3o3bT5
         xZesAgWl2Mghrv8r+xcNTp+Z/vPBc1ENwZhCgEWudEN5699BTmxiygOXmq9Iv9yx/s3d
         Y8xg==
X-Forwarded-Encrypted: i=1; AJvYcCX6wvjy9hh/31f/3UTdJmbczKKem9vl8nYCHPBvrMHTVbCpZJ13kVcAiI9cXCuaHnCdNvpQYeJYNcU4Iw==@linaro.org
X-Gm-Message-State: AOJu0Yw5sCmKgykTe6xrtSbHpACkZ60ZI145TAjHcTr94r4Avq7ckTSE
	OGGKSWjOwOWr56nkpZ5Bl4Wa/MHQ9uwhJTxl35Zh2rZ82wY4CLzWJzzGg7gsSsNzezw3RA==
X-Gm-Gg: ASbGncsCFVDaecHeqfMpacgIgmo0mwSc4jjwBKlstRYejbkxbMEY3uYqNubmxeFwAXq
	JyCTSVK7hDNewINTvxe79LRHp9JgmnKthbNQurOQknn9rfdMfxCacwwQ26hBT8/O6lm+9o4yY1R
	KaCjpTz+Xq4ZSvvTss+jBymKd0kBH+vZq74ZZ0T1gCA4mZ6rBoIbdDtuqy20KRQZqSB+Av/EPjE
	bYej6vHuUL0ta+CnwpNfliz0DRPMSjoWK0K68eGs4+YKxSaQZ6VycIG7QIsqaZyoTeUuXtA+DhF
	w4f7tT4GcjCoRAD0jTR+a8jZgca93ZrpFwQVqbjH+y0D7KF6LVigmlIy40m/qCOfGbuLy12IRfw
	jeLiO9B/7EOJBbYhrbrZnzymbz/RcmO4MjXUf
X-Google-Smtp-Source: AGHT+IGkXs40WMIJKGNMuEiJnfxX7/z7m/pHzk9ne+NytzMGvZpK0RzUyqBP8SLCEpCnawa9dPBjrg==
X-Received: by 2002:a05:600c:3b14:b0:43d:2313:7b49 with SMTP id 5b1f17b1804b1-4536539c469mr27259205e9.12.1750424876897;
        Fri, 20 Jun 2025 06:07:56 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535eac8c16sm58396345e9.19.2025.06.20.06.07.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Jun 2025 06:07:56 -0700 (PDT)
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
Subject: [PATCH v2 08/26] target/arm/hvf: Log $pc in hvf_unknown_hvc() trace event
Date: Fri, 20 Jun 2025 15:06:51 +0200
Message-ID: <20250620130709.31073-9-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620130709.31073-1-philmd@linaro.org>
References: <20250620130709.31073-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 4VuCNuqnVGwE

Tracing $PC for unknown HVC instructions to not have to
look at the disassembled flow of instructions.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c        | 4 ++--
 target/arm/hvf/trace-events | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index cc5bbc155d2..d4c58516e8b 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2071,12 +2071,12 @@ int hvf_vcpu_exec(CPUState *cpu)
         cpu_synchronize_state(cpu);
         if (arm_cpu->psci_conduit == QEMU_PSCI_CONDUIT_HVC) {
             if (!hvf_handle_psci_call(cpu)) {
-                trace_hvf_unknown_hvc(env->xregs[0]);
+                trace_hvf_unknown_hvc(env->pc, env->xregs[0]);
                 /* SMCCC 1.3 section 5.2 says every unknown SMCCC call returns -1 */
                 env->xregs[0] = -1;
             }
         } else {
-            trace_hvf_unknown_hvc(env->xregs[0]);
+            trace_hvf_unknown_hvc(env->pc, env->xregs[0]);
             hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
         }
         break;
diff --git a/target/arm/hvf/trace-events b/target/arm/hvf/trace-events
index a4870e0a5c4..b49746f28d1 100644
--- a/target/arm/hvf/trace-events
+++ b/target/arm/hvf/trace-events
@@ -5,10 +5,10 @@ hvf_inject_irq(void) "injecting IRQ"
 hvf_data_abort(uint64_t pc, uint64_t va, uint64_t pa, bool isv, bool iswrite, bool s1ptw, uint32_t len, uint32_t srt) "data abort: [pc=0x%"PRIx64" va=0x%016"PRIx64" pa=0x%016"PRIx64" isv=%d iswrite=%d s1ptw=%d len=%d srt=%d]"
 hvf_sysreg_read(uint32_t reg, uint32_t op0, uint32_t op1, uint32_t crn, uint32_t crm, uint32_t op2, uint64_t val) "sysreg read 0x%08x (op0=%d op1=%d crn=%d crm=%d op2=%d) = 0x%016"PRIx64
 hvf_sysreg_write(uint32_t reg, uint32_t op0, uint32_t op1, uint32_t crn, uint32_t crm, uint32_t op2, uint64_t val) "sysreg write 0x%08x (op0=%d op1=%d crn=%d crm=%d op2=%d, val=0x%016"PRIx64")"
-hvf_unknown_hvc(uint64_t x0) "unknown HVC! 0x%016"PRIx64
+hvf_unknown_hvc(uint64_t pc, uint64_t x0) "pc=0x%"PRIx64" unknown HVC! 0x%016"PRIx64
 hvf_unknown_smc(uint64_t x0) "unknown SMC! 0x%016"PRIx64
 hvf_exit(uint64_t syndrome, uint32_t ec, uint64_t pc) "exit: 0x%"PRIx64" [ec=0x%x pc=0x%"PRIx64"]"
-hvf_psci_call(uint64_t x0, uint64_t x1, uint64_t x2, uint64_t x3, uint32_t cpuid) "PSCI Call x0=0x%016"PRIx64" x1=0x%016"PRIx64" x2=0x%016"PRIx64" x3=0x%016"PRIx64" cpu=0x%x"
+hvf_psci_call(uint64_t x0, uint64_t x1, uint64_t x2, uint64_t x3, uint32_t cpuid) "PSCI Call x0=0x%016"PRIx64" x1=0x%016"PRIx64" x2=0x%016"PRIx64" x3=0x%016"PRIx64" cpuid=0x%x"
 hvf_vgic_write(const char *name, uint64_t val) "vgic write to %s [val=0x%016"PRIx64"]"
 hvf_vgic_read(const char *name, uint64_t val) "vgic read from %s [val=0x%016"PRIx64"]"
 hvf_illegal_guest_state(void) "HV_ILLEGAL_GUEST_STATE"
-- 
2.49.0
