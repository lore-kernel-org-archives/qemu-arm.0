Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2509447dyb;
        Mon, 23 Jun 2025 05:19:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUkHY4tM3ho1DKN1pLjibR/30Zs7/305zkb7e3ZLmS8Ya3HBxb7vQKYYhz/3vWeEpgOB5N3wdgPqZ7Mwg==@linaro.org
X-Received: by 2002:a05:600d:114:b0:442:f482:c429 with SMTP id 5b1f17b1804b1-45365c15866mr68801375e9.8.1750681159330;
        Mon, 23 Jun 2025 05:19:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750681159; cv=none;
        d=google.com; s=arc-20240605;
        b=JDTKS0ml3Jhe3H2Ucv1jvgE0hejDGLvkp2S+/xPHHhtBx0gNEEjJH2kBNSFeujdZVu
         QeBrQYZ+Ud0/DDIN5mNs/bfWFILmYLmEiD3m0YyVm6auneP733CRpmUgmtBpYrZwjf1V
         OmY67t8G4yjMP/ZYTu/1jva0vR4AJbt07LyzeFpz5LINBAoRRUZu4hDqrw07iP8uaICf
         T99gcNmhLy+F4Npq8PsCm0MfBKvzp3FRuazNomuPRFdxwtzUcmQgIUKZzkWw9ouOpJGD
         OSZHE01bulRjegHEo8rtD5KHZC81q+vNy9LxuESVtxknPNRF1IJaWNWxLDtEaJUaJ5Eu
         BHJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FtS7m+vqlh7Qr+Y7luF/PvAhAhpP9RBj3It7GX3FL/4=;
        fh=N0kPfTl0R4kSansD8Oalklw+ZjmaURG7DlocWmwVKog=;
        b=CI8BH0n27eA22ZmVO3PmKo1A9b2T0YC9r+hTQHJ/6rRCVvnqrd7cRWheADgcsEAXOK
         lzPQr+8FleKecx+mDiluN8goRs8DVM2nRTZjzUYpe+2q4lHKUz6oNGljnV6H2dmHjnbb
         WzTx0aPOy2sj2QL8EWqFbVUBZY9ukaZr23cXr0NzJZfVkJGiAbLHZiu4+cZBcNL5piZX
         7fppM1jc+tpXtnjA1wBsBTM3Oz67x4vsZyiSveoqCVuEoIGkTAMa58TK1HaeFdAeQJTX
         AhYhHLIGXRDMKdDLLmiVgQ5mqBfr9dJoJCQ6f0wAbS0Iqf6vCkmROM2zMGyyqC0joTGU
         ktfA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aZ5ybmPS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-45365d8db98sor13305945e9.3.2025.06.23.05.19.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 05:19:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aZ5ybmPS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750681159; x=1751285959; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FtS7m+vqlh7Qr+Y7luF/PvAhAhpP9RBj3It7GX3FL/4=;
        b=aZ5ybmPSpQ+ud24PO1Z/QTnQ0VqqYXrAIwuQdRH/pVXKw05BHbsxM5X2MOGNbFwUw1
         B2HAGgTuXGA2gTrCVSU0YE6ZEOnRD6T/+jcCV/OQiFGqs1KZZxz7Y//A+gMrHsQnlroP
         HtFCkrus3WLy2JI1chbFjJUx1/PF0pHjIT3s6UD5s3B1ZPwOct13Crefm5kuJxNOf8tZ
         ZWubuETjQ0xtCG93MkeYfDgJcaZRg8O5Scs75hjtY7dGTY9PckwBbiRaikzrB6EEgEBx
         aT3aX2qAqe9dDcx7hPnqXOXoA79qbP7lzF6LCNXMYEgmlECL7l9W9m+Djb33a7PnTD7F
         fuPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681159; x=1751285959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FtS7m+vqlh7Qr+Y7luF/PvAhAhpP9RBj3It7GX3FL/4=;
        b=MoOLC1S1rtw+LuiOs0mW2jJiHn/h4P48CsogzrgDDIC9JvZMyiPRUd0eZZONVASgsK
         mpFAmBb9wtm21psKkvGDK2Ap0U4WFtAT4vQO9DB9UqI8R90NkkfMcSRtpQ8otpR7Wx5w
         GC+BSxHRXQG0XLwsltvjRRl/HGXF/Sg7UZF2F4KulpmOffcEDvyu73jVuj7x+va0xHGA
         P0fS6bPx5Ke7v8SeGieGqM8Fj8+UGHBxydi0rWmRMjFCHh7+9PFJF+nfi+YmR6U+HHdp
         e9VYFXtcVoU7PFgEa4v/rV1NB7TJAN7EPphu/m0TzLvU8Jsp9y39Pynt84KKsm5nFgjG
         miAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXetegGN1GuoIZquXkcCxI8LO5lSQT+IK0pEkQLlYKJsn+fAjBdoaj+5WaPtzxOH47dZr3aDDyOy5GLSA==@linaro.org
X-Gm-Message-State: AOJu0YykHiOjxgp5dVGvZrnCVPKL7hbCgeUOCiw/eSNlne7nY84iKnTn
	m8mL19ZaVCnzO6sG9/F0Fgq7o1zCjaWx4YwOcTv3omoTuYqbj+3Sh13i2PkbOIRWdeVIrw==
X-Gm-Gg: ASbGnctrEjHRkrdOWDgR7DMimbY+f6SH61GWcVvtnzSIiALRGDl5/aovYxwjaH3VYCo
	2sZkpAA1ZGYU0SdvuylxVIsCbmK/HwZJoCneaBXl6505+2hy/9/LyKuhhoA6c14xi2psa0m4bq+
	apXSb/F4tnFmKQIPQqJtUKVJ7h/nxWoCZ9xzpVEYTF3KlafGa4pYENjF69lIFpJRI6gLA9fHttm
	9xtHqFq8/s3MOc8OYp/un7+cqnhnSo0w2UdBtqEfjnDRLvjI2qPbM12i4n+eQNS7Lh8KLVtGeC+
	jgRT9k7qNFOBYp5rjM3JGolwnCn7giZ8JvjqvFHUsJ+tBeYvmSG7hNtwBGowyF2k/uU/2yHfNCx
	i0xFeXquHshoxmBGk1S4VJP63K2Vq0futs+Nr
X-Google-Smtp-Source: AGHT+IFl2eAC2wXLNGcTcgz9pBye6T6IVeM4BN03TDgb6Vv2/UKfmtbrc+hijHKDuuTiPnREIJvcsA==
X-Received: by 2002:a05:600c:314f:b0:43d:8ea:8d7a with SMTP id 5b1f17b1804b1-453656c313fmr101273355e9.28.1750681158702;
        Mon, 23 Jun 2025 05:19:18 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4536fefd2b4sm51673585e9.36.2025.06.23.05.19.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Jun 2025 05:19:18 -0700 (PDT)
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
Subject: [PATCH v3 06/26] target/arm/hvf: Trace hv_vcpu_run() failures
Date: Mon, 23 Jun 2025 14:18:25 +0200
Message-ID: <20250623121845.7214-7-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623121845.7214-1-philmd@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Tp0EAhOqTCzW

Allow distinguishing HV_ILLEGAL_GUEST_STATE in trace events.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c        | 10 +++++++++-
 target/arm/hvf/trace-events |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index ef76dcd28de..cc5bbc155d2 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1916,7 +1916,15 @@ int hvf_vcpu_exec(CPUState *cpu)
     bql_unlock();
     r = hv_vcpu_run(cpu->accel->fd);
     bql_lock();
-    assert_hvf_ok(r);
+    switch (r) {
+    case HV_SUCCESS:
+        break;
+    case HV_ILLEGAL_GUEST_STATE:
+        trace_hvf_illegal_guest_state();
+        /* fall through */
+    default:
+        g_assert_not_reached();
+    }
 
     /* handle VMEXIT */
     uint64_t exit_reason = hvf_exit->reason;
diff --git a/target/arm/hvf/trace-events b/target/arm/hvf/trace-events
index 4fbbe4b45ec..a4870e0a5c4 100644
--- a/target/arm/hvf/trace-events
+++ b/target/arm/hvf/trace-events
@@ -11,3 +11,4 @@ hvf_exit(uint64_t syndrome, uint32_t ec, uint64_t pc) "exit: 0x%"PRIx64" [ec=0x%
 hvf_psci_call(uint64_t x0, uint64_t x1, uint64_t x2, uint64_t x3, uint32_t cpuid) "PSCI Call x0=0x%016"PRIx64" x1=0x%016"PRIx64" x2=0x%016"PRIx64" x3=0x%016"PRIx64" cpu=0x%x"
 hvf_vgic_write(const char *name, uint64_t val) "vgic write to %s [val=0x%016"PRIx64"]"
 hvf_vgic_read(const char *name, uint64_t val) "vgic read from %s [val=0x%016"PRIx64"]"
+hvf_illegal_guest_state(void) "HV_ILLEGAL_GUEST_STATE"
-- 
2.49.0
