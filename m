Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4185131njd;
        Thu, 3 Apr 2025 08:19:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVHSWCHbuw8WaXn2w4lmy7xroKeRrrD0o+untMzjfSEeJ7uK9MxRuj3uAu/gFG8cU5eUVDLXF9EGus9sA==@linaro.org
X-Received: by 2002:a05:600c:c12:b0:43c:f332:703a with SMTP id 5b1f17b1804b1-43ec150b3b3mr36417965e9.31.1743693539928;
        Thu, 03 Apr 2025 08:18:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743693539; cv=none;
        d=google.com; s=arc-20240605;
        b=lMDxhuGWiT8snOaCEcj4CU5yEiSi0teBoM960VTo2gRi94EZipP+kqPtTD17smFbFI
         yCHE45GZ+wPbl1n2dj251EVsZSGaficf9ohrmkzq9eYNJad0ygz7A0E1fik7LqkA1vaF
         zlicoM5OAxkflWaWB/UW+lPKgkxQqoilTQjJmYlUaQ9CTKgSKAlQNHpJp6XDHOVheh0m
         H0ShdMnVCnRqCNCtyO1l2SvH9qs1UEevaleMJcatGd9A+tPdE5bSdqPaeX34E29MHsZM
         DBfvN4XQWhYAaUR9QLI93/ryGVufezpAam7qZ2ACcbdBrh92qpMkGnsixzKgI+WvfjLo
         kr6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OqdN6r/Pg42mUAWw+XorRCy8KmUUThhdk/vE08EOf5w=;
        fh=XbSWzI+l5ulez4wbk7Ay0qxj3uFmgF1JhXlpkCJLycA=;
        b=gbrdRTQghHkeIAu7ugTCukLOCq13TZToYr4aLLvqbtBw2w/1t+4O1Liy8T3FBjP1tO
         1+19vjwzMLC/VvERP/zrbIMg6tn/jE9rMhYTJoOUzpRCNB2r6uoXSyJRlC8RNU+7cndi
         H6V2O6SuaqQ1nzeRsyZFaFZKr5vfnTOC23BybkHz1+zAr+FIDMX+tSuIu8TfvVrixH7i
         dZ/mVu+aXmucCMm9qSvkR1H9M6f+fB7cbfInmdHMVr2qIyqiQofsgEAT/d89xMh5b/lY
         MfodO5FmyhwSlOix8oW+II0N3HwGcQhmEYGwZEfbttbfyQeCmFLE8SU1S2bbDBIF3ds4
         HW1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vca++xK9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43ec2b0157bsor7209395e9.4.2025.04.03.08.18.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Apr 2025 08:18:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vca++xK9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743693539; x=1744298339; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqdN6r/Pg42mUAWw+XorRCy8KmUUThhdk/vE08EOf5w=;
        b=Vca++xK9A4A+HDtV55bzR+eZM69GCSUONQ7ugP1gQ6I/owhRfYUJzU4dCTwWCc/RXr
         h8JWGjy3asjyIIkLkKmsePKAxcoGYg8N8nDQRGQ/CKKII9moA+XfEKwCRMkTg39Nz0tx
         lY55Ol83yzwlrdYviAAXxUa/EtNPGTSgztKD/hz03FGLcX9fYPfz9KwIzNvqJMRz7pSt
         dZcmHsQTgimMsOY3uQB6AdfkpexlM2cIV2Pl1hIrGgp1Mfw8+95LAVsb1fFCmocAZPuO
         LnoJINDTCL1rV/ZXehrt4YDUE0WSwORb4MomaE1exsy4k4e42LU14y3MFAm6fS6Sh84z
         eYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743693539; x=1744298339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OqdN6r/Pg42mUAWw+XorRCy8KmUUThhdk/vE08EOf5w=;
        b=AUmWKSxpIkeTy8qhwO8UJ9ukMeXjQrLf0khGTRhqQZ3kl719Ycpf4urByvD9CZUsLq
         1mDCrJ/RbQ+3WBOSAwCYVz3IxkUgwEEQkQG84693Hd0mz7jaoQDQsb0pBlKhSnoPuZkI
         C81NNowbEKZXhKtUvieiYjZ7JuKhS8GpsjzJOVDF3Lj51QVFRRRhLDYS1E1KnelQLewz
         Rv34nssOhSvc88TXr1LWR1v+EKv6wNyCoXfm1OQ7XdY+Y25pUdauqmr+wyesOGe/RYOT
         mxmNKBRx+F8K7hD2BMSJA8VWTy1q0A9QpNiS4sFoGX6saoynBeJvd4EnAZKwCBg0hvO7
         fUKw==
X-Forwarded-Encrypted: i=1; AJvYcCVSpGiGdsGSwNGdNougoPSK7vyfvEy90Gp9BnMb4osxxyU18mzogqAuAvypx15W/DagFjmoKvBm6p/YwA==@linaro.org
X-Gm-Message-State: AOJu0YyY4nuVtMFevdkyPv4McAhEpWOovz2bq7liI0je86lnDmIpDsaR
	4W/1DiyqOw2GG5jp6l6/lqHk+Y9409fQC6M85rW8X3aPN0wsZWVRQdYmgRX7/BH6SQ==
X-Gm-Gg: ASbGncubBLCSkwE5m4PAIbyRVF+vQCP1JRGo9rGCfA3IVhzLxi8rE8aFsFMYnFt2ywL
	0pqKAqHd9ob7Aq/jWwG5yWXmlwxAyAmvNLSlpxcKenpQ5T5s+kVmV0PbLFRN25BBq9Q+D7QHxgj
	bxdnjDHuXifQED9zdkSgYPs2QKdBtgrw/dkoNSxZDsdWlv79pHqKmIEnqAXgh7e9d78IihPtvn2
	mjiFPuaPY2qGxD8ZK8HIDa0G1uLIbIuFGckjw2z6v0Cj/O8xJ0x02JlTH2t/8Vtl5U5ENhAWDbe
	exk+gkG5KooxjorK+Wjw4xv1s70bvaDtS2GFVhaq0Q3ge+1SL15z8U8iijQWHI/NxfWpECyDMzv
	GBiA6masOmoqBZDnJD30=
X-Google-Smtp-Source: AGHT+IEh9BvdhrVdanGsG8YWk+WZOjfYAlp+ePwfpgMmK+XVGGLeYRoL93GEDzbW7CbwvD3OG6Pyfg==
X-Received: by 2002:a05:600c:4688:b0:43b:d0fe:b8ac with SMTP id 5b1f17b1804b1-43ec150afc2mr36198405e9.30.1743693539308;
        Thu, 03 Apr 2025 08:18:59 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (145.171.88.92.rev.sfr.net. [92.88.171.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34bbd9csm21247865e9.20.2025.04.03.08.18.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Apr 2025 08:18:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Udo Steinberg <udo@hypervisor.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>
Subject: [PATCH-for-10.0 v2 04/14] tests/qtest: Skip Aarch64 VMapple machine
Date: Thu,  3 Apr 2025 17:18:19 +0200
Message-ID: <20250403151829.44858-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250403151829.44858-1-philmd@linaro.org>
References: <20250403151829.44858-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: yDUBgO0wHrfW

First, the VMapple machine only works with the ARM 'host' CPU
type, which isn't accepted for QTest:

  $ qemu-system-aarch64 -M vmapple -accel qtest
  qemu-system-aarch64: The 'host' CPU type can only be used with KVM or HVF

Second, the QTest framework expects machines to be createable
without specifying optional arguments, however the VMapple
machine requires few of them:

  $ qemu-system-aarch64 -M vmapple -accel qtest
  qemu-system-aarch64: No firmware specified

  $ qemu-system-aarch64 -M vmapple -accel qtest -bios /dev/null
  qemu-system-aarch64: No AUX device. Please specify one as pflash drive.

Restrict this machine with QTest so we can at least run check-qtest,
otherwise we get:

  $ make check-qtest-aarch64
  qemu-system-aarch64: The 'host' CPU type can only be used with KVM or HVF
  Broken pipe
  ../tests/qtest/libqtest.c:199: kill_qemu() tried to terminate QEMU process but encountered exit status 1 (expected 0)
  ...
   7/26 qemu:qtest+qtest-aarch64 / qtest-aarch64/test-hmp     ERROR      24.71s   killed by signal 6 SIGABRT
   2/26 qemu:qtest+qtest-aarch64 / qtest-aarch64/qom-test     ERROR      71.23s   killed by signal 6 SIGABRT

Suggested-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/libqtest.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 2750067861e..fad307d125a 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -1788,6 +1788,7 @@ void qtest_cb_for_every_machine(void (*cb)(const char *machine),
         if (!strncmp("xenfv", machines[i].name, 5) ||
             g_str_equal("xenpv", machines[i].name) ||
             g_str_equal("xenpvh", machines[i].name) ||
+            g_str_equal("vmapple", machines[i].name) ||
             g_str_equal("nitro-enclave", machines[i].name)) {
             continue;
         }
-- 
2.47.1
