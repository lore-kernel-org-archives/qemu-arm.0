Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp252839njc;
        Thu, 19 Jun 2025 06:14:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXEuhzSCRKfGba0UrFw0WpW2cyKZ8HV0uTPT0gKMeO9QRurNV7thWZHICC2BOxv9x0bME0UkZzR8Cqypw==@linaro.org
X-Received: by 2002:a05:600c:1ca1:b0:450:d3c6:84d8 with SMTP id 5b1f17b1804b1-4533ca837cdmr197912195e9.14.1750338846080;
        Thu, 19 Jun 2025 06:14:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750338846; cv=none;
        d=google.com; s=arc-20240605;
        b=e4C6vg+uSBr/RVG8tFBGx+c6nCDI0EoqQpY5+BBvCPeBx1ubpmaPhhjLuKNrxBgHCo
         9KvRbcCMSPz/+Ddx1Aa8qcrOabsfY+63/Dmarg71Y4kyMGVDuGmwgSI9Ylhu4eAgN3If
         JWXFmLhfVsjbRMv6nrM6OgYx46/xuo5WUqoE7yGV+NiQaYbynFlFZBnaV+uLCwyx9A7+
         hrRKrNH5WXpiDEctcuTnCDRWHuNk1wCMTifo0x28euRwi0fHGZOZwHJwa1K/Iy8FzFy4
         5u/SPNcSg24UOpOJid6kK/UmRqXjigEhdu8xLLrg5I63Yh9A2RhzXXU7+WjeEzYTyqWA
         D2Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=V3vxCB8AF1OexrFi26RMBcdit/f0pHUtl0WDW3lo3q4=;
        fh=txJSs1rlYnGPOGU+zd8sEG0GrnThEkl85TVbtQFuOoc=;
        b=hZ2QU8RxV6OuK7X4wOPxek69CuxkOJ8IctPqctRczeH9ejkzzc4sbWjs7/ahIobdZp
         NjF0OAux8c0QC65mx8034nV8Z8lS+hS32zwX2IjmSEECnzcQYGr7Yt2RFrfmyBnGg+jM
         EWiXPAVxI0ej+IZ+oLq+zlf5F1DQmfS0KmGE5YSMWDSEzhDXfaUd/wTox0aJzT8D2Hy7
         uPzQFWLWRIs7BNDhrqWUymiUOdXOFK13HT07od40abB+jq+5TDDj4P72pWur2O5Xp+p4
         G0eGPYuolfvQVw+Ca/8/NpaVEuVbyTR3RuLXXCbV4sx2genb5JD+55waHGb0S/LVL4/F
         pCkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GUSoz6w8;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4532dbb539dsor69490675e9.10.2025.06.19.06.14.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jun 2025 06:14:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GUSoz6w8;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750338845; x=1750943645; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3vxCB8AF1OexrFi26RMBcdit/f0pHUtl0WDW3lo3q4=;
        b=GUSoz6w86yWOUtrq7Fesu+3h+BapNLSl5D3k13727rm33RMpgLV+4ZzFpuF/Bv7lOu
         MYeFhBjxaSM1zmMT6rFRM0YWNuBgjlAitEO9IlDZz1Te1by5oslcSeopfIX/JjYJ7hY1
         6avfNYurawUwx7Lgn+fSzG0WSfyR9lqw7qRp1F/7SotbagAwFlHy2egixR07DP4ImtIO
         ieE4hMgEF8vxXrsiHdUoqqNMei8XVn8Q72UaYueMqxG0dOBXdWu9IiYwtCVyIDOuKpgY
         L+5WYQbsSONJGoFNCqNnh/gygvWfw4UOpUKvSSKXYDYh8zbPURZbKjL0l2y6uqivPW7l
         MWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750338845; x=1750943645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V3vxCB8AF1OexrFi26RMBcdit/f0pHUtl0WDW3lo3q4=;
        b=u2LDlEiqI72SQJL+clmC7GxgJ/qECSlUPDH/XLrI08NYxvQtUiaHMytqeQiceqTYLj
         Mkfph4e54MrKik7Nb9njkGwR4D9XC2Bhpp+j9rUp0h7q2V4aBlolED/0BPBWhfOajakl
         luH2NCtqv90/7T0hPGT3OIIK3Qyq1lXRVDzjAiBRROghuH9m+do7ImIy6NJrj2DUn31/
         BHo5+y62IYSrLKaHbjT1PrC794QyiV4/1lQVtvtGGR5YOQMj42mLgM6G9hgTt3pPictw
         pNl9DkXMPge4AsfshqD0YmsOcDF7lZnbM6avTEywJ3lCsaR4FDWLgVZcyeEnGYhLqZyM
         fr8A==
X-Forwarded-Encrypted: i=1; AJvYcCXJFFovEw/ZMLl/lrDxEWIIpmtHBX0vP7y1kCub4OurXPVlfiqsTggktIutId1as6rnXnqsNRhSwfiC/A==@linaro.org
X-Gm-Message-State: AOJu0YxUwquGBMZAqPKybAF1KemLiRpVl1agt2gNYAvaEUW4Kf3O2pEZ
	KLRasvMhALKG5SM21faKew0tOvJMFSbO7Le99y5H77lncFE+DwUHV3ATOBFUADUhGXZ6Dg==
X-Gm-Gg: ASbGncsYQe8/4W4cOlwg48g3BwrhT09xOOSG1NQS3puVUdaUADGfixkj2mCC75XCsd0
	U4uQ9/ZKnikQ3zVf87U0+KSjYwX+/jtASnYtwD/ODUG+q4ilkfgR6JArZSzQ2ujc37QixjHoaip
	hN5G1hhr+pWvZ1eSlUATRqVFPAcchTSBHiaLX05GieDNYgXn+BmLL5Ie8Ir6AsODt5V05ZXv7LS
	6eWo54TcrS6BGCXxHlolWi0y44r7fWu256Z81VXLOv+CaffAcpjpakL95SDmsoDRZHSOKayWTPb
	sAtK5gM8pqtvtrT6h7pabEqqHvBdB/qTqyNynP5cM2Q1xgf68xuBk//m8y8Xx19Xp9JdZ6Wi7Y7
	da6T0NW8HGjQ0GuxbRBKWOa7ANdQsoogrSnV/
X-Google-Smtp-Source: AGHT+IHelkidw/tQQ9RKP0VDtKPsH2g6yNSOnkNt0atUABraIjdPtrs1NJAkAu3tXReVPLd5lAEiMA==
X-Received: by 2002:a05:600c:1e1d:b0:453:b44:eb69 with SMTP id 5b1f17b1804b1-4533ca7518dmr224054745e9.13.1750338845548;
        Thu, 19 Jun 2025 06:14:05 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e97ac4asm28331335e9.3.2025.06.19.06.14.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Jun 2025 06:14:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Julian Armistead <julian.armistead@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Alexander Graf <agraf@csgraf.de>
Subject: [PATCH 08/20] target/arm/hvf: Log $pc in hvf_unknown_hvc() trace event
Date: Thu, 19 Jun 2025 15:13:07 +0200
Message-ID: <20250619131319.47301-9-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619131319.47301-1-philmd@linaro.org>
References: <20250619131319.47301-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ilYA6BtFH3mZ

Tracing $PC for unknown HVC instructions to not have to
look at the disassembled flow of instructions.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c        | 4 ++--
 target/arm/hvf/trace-events | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 1ff3ff7b91a..ccdadce4766 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2069,12 +2069,12 @@ int hvf_vcpu_exec(CPUState *cpu)
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
index a4870e0a5c4..245338c5bf4 100644
--- a/target/arm/hvf/trace-events
+++ b/target/arm/hvf/trace-events
@@ -5,7 +5,7 @@ hvf_inject_irq(void) "injecting IRQ"
 hvf_data_abort(uint64_t pc, uint64_t va, uint64_t pa, bool isv, bool iswrite, bool s1ptw, uint32_t len, uint32_t srt) "data abort: [pc=0x%"PRIx64" va=0x%016"PRIx64" pa=0x%016"PRIx64" isv=%d iswrite=%d s1ptw=%d len=%d srt=%d]"
 hvf_sysreg_read(uint32_t reg, uint32_t op0, uint32_t op1, uint32_t crn, uint32_t crm, uint32_t op2, uint64_t val) "sysreg read 0x%08x (op0=%d op1=%d crn=%d crm=%d op2=%d) = 0x%016"PRIx64
 hvf_sysreg_write(uint32_t reg, uint32_t op0, uint32_t op1, uint32_t crn, uint32_t crm, uint32_t op2, uint64_t val) "sysreg write 0x%08x (op0=%d op1=%d crn=%d crm=%d op2=%d, val=0x%016"PRIx64")"
-hvf_unknown_hvc(uint64_t x0) "unknown HVC! 0x%016"PRIx64
+hvf_unknown_hvc(uint64_t pc, uint64_t x0) "pc=0x%"PRIx64" unknown HVC! 0x%016"PRIx64
 hvf_unknown_smc(uint64_t x0) "unknown SMC! 0x%016"PRIx64
 hvf_exit(uint64_t syndrome, uint32_t ec, uint64_t pc) "exit: 0x%"PRIx64" [ec=0x%x pc=0x%"PRIx64"]"
 hvf_psci_call(uint64_t x0, uint64_t x1, uint64_t x2, uint64_t x3, uint32_t cpuid) "PSCI Call x0=0x%016"PRIx64" x1=0x%016"PRIx64" x2=0x%016"PRIx64" x3=0x%016"PRIx64" cpu=0x%x"
-- 
2.49.0
