Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1259010ejs;
        Wed, 10 Jan 2024 11:54:50 -0800 (PST)
X-Received: by 2002:a05:600c:4714:b0:40d:6288:400b with SMTP id v20-20020a05600c471400b0040d6288400bmr979673wmo.174.1704916490732;
        Wed, 10 Jan 2024 11:54:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704916490; cv=none;
        d=google.com; s=arc-20160816;
        b=ArW8PyIcgIobX6/nUlzfJrTXgauyfWPD4fScB6uIHWMRKE1xVaN+f+QBNV6ljxIEn3
         u11GLZBu0jjkWN6K6LEtv8Lah2Y/esDwsYLhr6BtatGjGcM+3a/27b+WogD8FnxxgO8y
         l2C6amtt1E8lHbmD11oI4GgLprJ1F6uf51D3Q1WJHSMF++UnBCbHFlS5rBSi7Iz8kOoy
         ohubiAig1N5OSQYRtTp0ueKZzHnrMeO0DNOhYOtlDuMBTvI7wu6mEpwcFQse8gHkFtmO
         DiUwNevrueY4/bH69HDhOldKMoBcN0CPFaAquqibvHgi2wdzLq+kHVu/PRJvonrL80YK
         8xLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6/Hk2SmJl7pABngKVtRs+8Jo9OKAAK/e6Yxa8zZeHcw=;
        fh=0Bn9ysFO5uhdOoEvdDNDnkwY7yFMuDt2XLw3k0zcWt8=;
        b=ENbkG1VUcFkhecKzgjoNR+TJFCGO6JUG9eXNqNyNsZ4vQeTkVuDLPow2svD9YaY2KF
         MMmmXP285DUszG+2lesMgLV/8NO9LYbXSJB8vlEtmHki6hkITCMcLaB3MnbflGaF70xQ
         mFLpWAxrtRd5+3E7yKN//ymnandyht1/iZWfdPBMG+1cgALm8JDoLfb3MPzTsaLwaOUc
         tMVl/yMHeoboNeSRP3QE6IAUmllZDxVf8UK7oK+9xvt111A4CD+M78wN/q0Iwzx8bpmE
         EF3NVwnnZHe1XAWB0PS4CGGmNkI8/H6CA6rche24wxOEW/D1BlSMTNw3GwIINKyJ3LIL
         UqSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=usHevq+2;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o26-20020a05600c511a00b0040e5493dfc9sor1220699wms.1.2024.01.10.11.54.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 10 Jan 2024 11:54:50 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=usHevq+2;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704916490; x=1705521290; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/Hk2SmJl7pABngKVtRs+8Jo9OKAAK/e6Yxa8zZeHcw=;
        b=usHevq+26uLRG5fDpAxSZjZ8ZuJXDChyPgUegiinlWQENNLQKejF3O8O6CdtFwKtGb
         L40mWKl9egbLa3La4usSqDJfH0xc5ScQUXhZ6JYLI3VI+kc9ih2eKFulzuGfqWryHIPj
         7Oa6u6fIzBwl/iIdvITILkypN20YBUhUJ7cfc2GHwAXyKEH/BsmU0rP7xyRMfLQl6xO7
         cFRzFwtUO0oRUiKvifZk7NEZVTZK3EKht2KghhBAm5hCwECTKm8wc3vSOwdgBQjQwD+2
         dkBXo72Xssj4HQ1qYRwnAYq1XUJSLeI9AF/nOz4SZ/1uMBGbEfAN/vMIeWv2n7App4So
         YPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704916490; x=1705521290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/Hk2SmJl7pABngKVtRs+8Jo9OKAAK/e6Yxa8zZeHcw=;
        b=AEYg5bnERxAQbTYzle7UKSMK/FcxEvJwEcO4x2v26Ri1bcZZab2VWUq/ksfeRWpbpP
         o+By/s9mnBndzExkzj9z/W0PeKpaLhZDmSWtn2/45ka5+1mcEKlXV8PiaXRzulABY61V
         0O/MD4qIFNmKvGrVooUHG1WBJdTwgq+eQEJSqQ0KLlZ0SvdHIzCjmf1MfPISXi4HoFUC
         5qc4+CHmdMEz7Fr2I4UKHSSTMzAGlVCVUQCH9r+RT/PSkORQfzLEPoGFk//JbLgIhc5g
         hgeHfQqpFm9i+nSXM1tKyKGlY8Pkw2Z3cdM/fdPzyR1JiE7BnydVN1zPdjTIWJQ9LSdW
         5nKQ==
X-Gm-Message-State: AOJu0YyO62HeyCkY3W8R5B2/eGGa9bGF97PbVm9G1GEGOyrD/fOG7GGG
	ES6Ykno2lZuXgi7w7KxWvsg1jbYZI0TN81+t
X-Google-Smtp-Source: AGHT+IE2GGMI/J4dfv9lDf41Ytf3T5IQRShNwrRuISaS+JEFOqfMwQ08EvwJ4Wm4/Cn8jqL/QzWuhw==
X-Received: by 2002:a05:600c:2102:b0:40e:5598:be43 with SMTP id u2-20020a05600c210200b0040e5598be43mr984802wml.29.1704916490381;
        Wed, 10 Jan 2024 11:54:50 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (vau06-h02-176-184-43-236.dsl.sta.abo.bbox.fr. [176.184.43.236])
        by smtp.gmail.com with ESMTPSA id n10-20020a5d420a000000b0033719111458sm5550921wrq.36.2024.01.10.11.54.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 10 Jan 2024 11:54:50 -0800 (PST)
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
Subject: [PATCH v3 11/14] hw/arm: Prefer arm_feature(PMU) over object_property_find(pmu)
Date: Wed, 10 Jan 2024 20:53:25 +0100
Message-ID: <20240110195329.3995-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240110195329.3995-1-philmd@linaro.org>
References: <20240110195329.3995-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: A3MSEu7eTlva

The "pmu" property is added to ARMCPU when the
ARM_FEATURE_PMU feature is available. Rather than
checking whether the QOM property is present, directly
check the feature.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7e7350fec2..6d1cb24a6e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2160,7 +2160,7 @@ static void machvirt_init(MachineState *machine)
             object_property_set_bool(cpuobj, "kvm-steal-time", false, NULL);
         }
 
-        if (vmc->no_pmu && object_property_find(cpuobj, "pmu")) {
+        if (arm_feature(cpu_env(cs), ARM_FEATURE_PMU) && vmc->no_pmu) {
             object_property_set_bool(cpuobj, "pmu", false, NULL);
         }
 
-- 
2.41.0
