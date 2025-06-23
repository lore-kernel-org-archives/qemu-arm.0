Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2509534dyb;
        Mon, 23 Jun 2025 05:19:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVmveN6Vb8f/CjNxbND/oDmmdj2zyppsZS5p6ZbH2LmGbBZ3R1IImOJ/A4VdKWNvhZvM9spK2hH0wCMLg==@linaro.org
X-Received: by 2002:a05:600c:c48e:b0:43c:ea1a:720a with SMTP id 5b1f17b1804b1-453659c3bbamr92493305e9.1.1750681169501;
        Mon, 23 Jun 2025 05:19:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750681169; cv=none;
        d=google.com; s=arc-20240605;
        b=JCQnRiZk2gbeYGsLeTHXrOdN0WwC8+e/f2dBrTwlLFcTTM5qYTo1DXEE8CqI+Rm6Pn
         tn9cq8euiYerYU7SASgw3g8J2g5Tq90c/XpWT7BiWNxJoBL9lVeecf2ak97PHYmub1wr
         wYs1pRUUJOUnZnkkHrDIOlIoMEa9ge0L0DU7+oMZWq3B9ScoTQeC5TyNX9eq5Aom+h1I
         uCGuzJqLnzrkDd2FUod0GKo/6nDr9XTqy+GQ1ok5/6m13XelzKeA36SEa9JCHHa5moUn
         bB0HddD3kTOfXuh7DQp45XtFY8P/HKf/fzQXlafRyCiYDOKMI8+73bMSwY/u6s9vcJBZ
         ax2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qyHQEfn6inWyZRMUVI/8b1HegzN318xDx/IKxFDD3c0=;
        fh=5kKx0iqRsy0rLIvg9jx8ezCfdE9E3ELZQSwDk5Nz54w=;
        b=NVEZhIHPd6PFnoScVYQ2xiTHVNcqOu0XhRfQoT2DTAJXTzNrPQnn9U5tVA50SRRLWt
         Wf/mNiQTVGFH9ga6a5E8Da6OL1ool0GCj1DkdVDV4VKitTEJOzFsNPzadUHWIK2biRzY
         s+aERL8UXl8B0lerx8yG+z3oqKf7UnS5TYvFXXCVQjXXSJp20cAfWBTbZrXW/0ipX99X
         EUPOa974NNMv8ePSgp36ugG92K7yDv6jKhDX3KQiLi0eafUqCfowEP0iUgjTRAO+NYrC
         /a080jP+a4p1I92tq4Ja1bPwO6FKY17hKOKiW7emEJ+lIdOe6pQXSWPVunaWAP+jUDZI
         jFDA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="RfYk/Gns";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a6d143b01bsor1774148f8f.4.2025.06.23.05.19.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 05:19:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="RfYk/Gns";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750681169; x=1751285969; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qyHQEfn6inWyZRMUVI/8b1HegzN318xDx/IKxFDD3c0=;
        b=RfYk/Gns4fG46maJvRLLfpY7S7EmarJB1OJ83acRGXIRU3FkKcD/jIw/tCJ/F015Wb
         A8QA/uMIB5ZX/Z0NJgcApykISCCFNcfgvocpHJqmhWM8YXeGrKAu6gMD2pf4d4IhjCtQ
         lhO9mkqeHPgbByTUYabMKm4IejE8FTm7Foh3ZcRFUdKNZN53ENhRe4Qn/51+peXEGu+O
         FW4x2LfQAGW4eNOXV8yfXz+fGwJRheGayhJZEROegXFjPEAFRB5REkUoUp/BdF8jto2z
         +7e7zzNoJzo3Q8ofGQ0ECoiV7SJ1GJqjqH7T+Kgm01gc4Mp2uFfnRU4JhbqqbVrnQKnz
         7flg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681169; x=1751285969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qyHQEfn6inWyZRMUVI/8b1HegzN318xDx/IKxFDD3c0=;
        b=pOVe0bSMjHfEMsCYsGj2bhqvRhGlbdDfxKyGxBpgqhovJO8oMMNZZUs63wH3mQvGTC
         +qzUq6RDcAfwaOINgyjCkrWGc43YrJVk2nblOMsTbb1O3SUx764oQ7ccsqs7QmE0NcqN
         dd6p/wi+w166YL8GQjKYpOr8shNCS2fro6SBgzyJ06uq6ghhZTcIzhM/gOCSRzBHWYzJ
         ZuAvDW+kupiThkJNzWldx9+qs/nC/7Pmj7PGIRfEjc0Vg3FN6M9IAYq06CfxnkwdObwd
         ewtop//EpSUMgJGLMcGK1dc/Mo3wGP37CcBw4VhAFItFVD2yU3q7nSFJ7ty0P5I0nU6Z
         343w==
X-Forwarded-Encrypted: i=1; AJvYcCX11USqW0Wf/CUQfyv8R77emn6KcX1XqDt0Ymw7Yu6LBGRPB3fAkhCqE/oMIvqvh93klrlDUJNVPQR1Yg==@linaro.org
X-Gm-Message-State: AOJu0Yz731p075m3dQW35AaUsO+z9AzyC7S/0jsfS5NTx5jZIlKHCw73
	v70J2Wq9nBHlmCeNaL5IIJD3HLuwh5p2pq9RIEaxzzoFSF8ALk9HKCH+qpRQpjEEZU920Q==
X-Gm-Gg: ASbGnctoHUz5sFQU0VXBZd8ukVRoWUu02NvMc5ySqeWZm0cG1z1l27lYapbbTtg33FN
	JLiz3UODXHsiToFp+Kh0hQL1Y1rXVmOaAdq/ZS/0JopY5EOkjH0HtUBX+Jb0HZdec+G1vPOMB65
	AJrYprWU4BgTZLeoVLXyZU7dvCvd/Hz2uAE3tu7LJISjDxIFiiZi3XKgCIXIKr+ukoUQJNjRgVB
	HEWSCxBMaLcbAiybtWfra8OVTlskt9JD0aVnYFABE4e4zjA1R9e+ayjDWHjVkDKR367tNgcPSkh
	CPfiqiPAukNBFSrYgDPH/f7Tf8M2I1Bcm6e2MNpgMaXGnZsyVathtYQ68shv1a+GitUlXLmgQYf
	6bMP3VW8Pa2SfQmfT/q55bD9jLBBTt0lFcSoN
X-Google-Smtp-Source: AGHT+IG0jiUUTmeqAWUri6/ZJ6x4DVSBOfaEpfSa25gPf14UgQYKRFy2gTrbK23eOovRBdpzASNZQQ==
X-Received: by 2002:a05:6000:1a8f:b0:3a5:2d42:aa17 with SMTP id ffacd0b85a97d-3a6d12d53e2mr9880614f8f.31.1750681168848;
        Mon, 23 Jun 2025 05:19:28 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646fd7aasm108552565e9.20.2025.06.23.05.19.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Jun 2025 05:19:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Bernhard Beschow <shentey@gmail.com>,
	John Snow <jsnow@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	kvm@vger.kernel.org,
	Eric Auger <eric.auger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Cleber Rosa <crosa@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 08/26] target/arm/hvf: Log $pc in hvf_unknown_hvc() trace event
Date: Mon, 23 Jun 2025 14:18:27 +0200
Message-ID: <20250623121845.7214-9-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623121845.7214-1-philmd@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8GXkFapfIcAr

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
