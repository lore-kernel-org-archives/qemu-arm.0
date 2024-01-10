Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1259189ejs;
        Wed, 10 Jan 2024 11:55:11 -0800 (PST)
X-Received: by 2002:a1c:7308:0:b0:40e:429a:81e3 with SMTP id d8-20020a1c7308000000b0040e429a81e3mr911411wmb.50.1704916511116;
        Wed, 10 Jan 2024 11:55:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704916511; cv=none;
        d=google.com; s=arc-20160816;
        b=V7YKKPC7srZX7K8Oj3+zd+A+qFRxMfkzz+lyF0qZXgq/1/jqD8Jgkj2a0PmCC+Uzsu
         /XxdzOB25g0J78oT19SAGcPqvjlR0Dpu/OfoKmjhtc6qdmK1evWBl0sLu2OZy+GyrrLn
         Zgo6YbSlj4YSJsgIp5y+3xBQcW4R2wtVqsB9BVMpyyrW+u5tJ/EF4bMwZw8CpkI0cPz4
         rHPYSMsEZy5jMWeywQrHfHN7iqNuHwLg9D23ZNDJhRcCDKtAvggVJMYefoRYc6LFIMXo
         jTfjqI1I3MGVa7RVoJb4B1ciN1qJ1c1a/a7p85VQtEKA4ZLYiSuB9/ZGF/4YLT2wnNPy
         jRQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bEBz6KLcksNDKwrjuJDS9F6r+wqfQ84qV7D0vYA4a10=;
        fh=0Bn9ysFO5uhdOoEvdDNDnkwY7yFMuDt2XLw3k0zcWt8=;
        b=I3xuTb/cbu+S3pTMuKW9olU+1G2nAfZPiocDcKOCcA/0MFSxOXEcySrOe/TQQvx9ki
         aZKW0ji8tu2tIcfTvOum2OR7ebEgtNJHOTiHaObFoy8bgdlAIUe83Osxvs52vMqJ3LI2
         m1cVfAXzoBiapHAaAzuV7qkWGLmKTYnBFgSXzGydBuxz5DCV8upn40QM0uUPnwnO5O5K
         7EWYWbEh2FlBtX+8etgcA1fJZOtCNZFb2Gn9SUTHitaAF8p7o6afusXWNPsIYq6okiUs
         18QR4KCqAr9IRqEb/Mg4nmfc3pjcmqf3iqBR+1HrbMB1lykmjHUOtQW5N5gEOeQNihRc
         neCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VocCU8yd;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j5-20020a05600c488500b0040e5493e087sor362206wmp.2.2024.01.10.11.55.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 10 Jan 2024 11:55:11 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VocCU8yd;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704916511; x=1705521311; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEBz6KLcksNDKwrjuJDS9F6r+wqfQ84qV7D0vYA4a10=;
        b=VocCU8yd2Rl4xixPkmukdlSYOJTEk/buf+2pHwWDVWD/20f5Wb5Uv5e1R/kqu5D1sW
         6d9LP0mZGakkP+mEHnGswMfmoKSm595YjhPllbbsOAFMceX+rQRlUO5nKh2fESXzaJeK
         ghLBbIsZdQYerpN+9I6GEPh892LcSJyMRBlc8IqYdaTgYrCVXvdZ6Ezw33oyMg7+vww/
         GsiA5Zd1MxWXJo7j+h/o7D3PcOzLvVr9PTd1nmFbTHhIe0lc6AYb13ZjtwUE1KWcepXc
         h4LkkdOtGwXsUZycam9KFZ1hmmndegjJbKtekCn+F497Rhyd1AN+/fV8O9phD6ruGel4
         mGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704916511; x=1705521311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bEBz6KLcksNDKwrjuJDS9F6r+wqfQ84qV7D0vYA4a10=;
        b=B4Mz4gxKZ6/pWlJQUKuF3oYnW79Y0RfTXrumMsCh27ggUO0SOdmkLRuc3+YkXqq55W
         B9R+8Ge6rQhDFpA5po6WDupIZQN/DyZbFPV5JSEJA/kI0j91H5ZKShbNRoCROCpYpgSN
         z1IrqgkZ6Kqyo6Z73gCfOubLHSI0UzCyNz3QeWk4m9ihvMvL+EE+dZZbn+bUHARsgNKr
         qf4tw7L7bCYthtsIrjV3rFO/kYdLMZHQooe2DnCsYeto0700Qg5mnxxiWs4B/hat6pP5
         WN1CdFPATZ4qzzsvrjDr45I6ClwwCk0eCkDLb+QijITzYl9JOaTh90S1Fd2G2Jp1Yiku
         P/Zg==
X-Gm-Message-State: AOJu0YwMppoREIJKdR4bZIQkjVVG9M8nxUVgd9kfBAmYpmqWa8gWNU1z
	ot0r7CAcSf9gnQ39xKkp/L4Asn3kiD9MV5De
X-Google-Smtp-Source: AGHT+IGQd32Lk+oKb8zN1vlG98owUctcXADDH4Oa7B8063z1oucGBdFgJ+DlBJYIvHCVRrc9BwWp0g==
X-Received: by 2002:a05:600c:74a:b0:40e:4cae:a3d4 with SMTP id j10-20020a05600c074a00b0040e4caea3d4mr858800wmn.184.1704916510871;
        Wed, 10 Jan 2024 11:55:10 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (vau06-h02-176-184-43-236.dsl.sta.abo.bbox.fr. [176.184.43.236])
        by smtp.gmail.com with ESMTPSA id c3-20020a05600c0a4300b0040e47dc2e8fsm3234850wmq.6.2024.01.10.11.55.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 10 Jan 2024 11:55:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	qemu-arm@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 14/14] hw/arm: Prefer cpu_isar_feature(aa64_mte) over property_find(tag-memory)
Date: Wed, 10 Jan 2024 20:53:28 +0100
Message-ID: <20240110195329.3995-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240110195329.3995-1-philmd@linaro.org>
References: <20240110195329.3995-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: XpT5lJOoWP50

The "tag-memory" property is added to ARMCPU when the
A64_MTE bit is set in the feature ID register. Rather
than checking whether the QOM property is present, directly
check the feature bit.

Since when ARM_FEATURE_AARCH64 is disabled the isar_aa64_mte
register is invalid, also check for it (see the 'aarch64'
variable set in the previous commit).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a43e87874c..7fd7173b5b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2188,7 +2188,7 @@ static void machvirt_init(MachineState *machine)
                  * The property exists only if MemTag is supported.
                  * If it is, we must allocate the ram to back that up.
                  */
-                if (!object_property_find(cpuobj, "tag-memory")) {
+                if (!aarch64 || !cpu_isar_feature(aa64_mte, ARM_CPU(cs))) {
                     error_report("MTE requested, but not supported "
                                  "by the guest CPU");
                     exit(1);
-- 
2.41.0
