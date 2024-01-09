Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp553505ejs;
        Tue, 9 Jan 2024 10:11:04 -0800 (PST)
X-Received: by 2002:a05:600c:5493:b0:40e:4aef:26bf with SMTP id iv19-20020a05600c549300b0040e4aef26bfmr1412249wmb.30.1704823863915;
        Tue, 09 Jan 2024 10:11:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704823863; cv=none;
        d=google.com; s=arc-20160816;
        b=qTubXHikgk9DKngt0qeBE0YLs52oZCbRI7SJIjoA46IfP+ISmOCzjq772dZ6+MwpwI
         Q4v/rhVvgGrV0qm7PGvBrT09hyHdPFcxd0GVcq/+hFayesFXhkECiI6K/qZP7m0Uv084
         eSh2bXvjTNev0AUemruKbFqDK4wG7Gzy0aiyGh78O2k3TGqDAT7cyKOWUNF3hSgG+9Iw
         SwBolAAp1fpDX6bC5Y0Ypu+0jwjiLneTHEhK8D7QY07vKwYxLCkUnVwkcupThNKJ3dA9
         yxgkRj//vRfsQAy4GJT1CGOkFxaXbYVR8r8DosaL8H/tpZ/61jNtaTkW5JCW6XcW5HKn
         fWlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZHN1WAhVwI6VDlIQMYmKaw16w5C6ru8lwNtKGuzaAIs=;
        fh=v69mdd+nxs/0WeTIWzLZOPCx0ynE2o0vtvId2fSwkBY=;
        b=NVFk7GFXKqMBrQJsNqcSUrlOMc3T38ff1ls/r1GV5JarD9jKQ6Xzg1rUZOICFit6HL
         dovXJnQ7IQx5riUSuumeAKqf7vRsXmhWw6pTCK0AeWos2OpQ2RHoUwPPHg2DnCL+HJZQ
         XBpLvCfj4uS75OsDdiVyb9YduPMvjG3v5ZoFXeGovGm1BrLpbOeFiGCNrzBCaxDjnQ6h
         WupTGt4eqQ0puMVxcc4ShS1G1pO2NM+FWEp7Luu9J0kykYhzO7ToM3fSy9ogx4FeUCR+
         P3/u/gkTGCUuYvqnT1Xz89s8uDn++a7UNaitMWZu2pDJpEY4rJsriF4+NbjjLzKgoUJh
         HynA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cg+WQ3cd;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m10-20020a05600c3b0a00b0040e3535307dsor924641wms.1.2024.01.09.10.11.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jan 2024 10:11:03 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cg+WQ3cd;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704823863; x=1705428663; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZHN1WAhVwI6VDlIQMYmKaw16w5C6ru8lwNtKGuzaAIs=;
        b=cg+WQ3cd+rWJMISoYz6PMuuqVDzOmGJzYBElO/Yn4MBFlMTbtlhsg+zQtLIALGHDRg
         32UQMGy2DcMw91orYpfB634PN7XVD1BcF953dCRJNyAB2DZxzoMke9frgucL+IxBq9eW
         VUGXQFOtH6Oq0fZkH4DdcAfnfLv6TOnkq5NjjtgIfuXVlev3rz9QmHlBsUw1uMHrv2hT
         HCuh+K8rIKivilaKC8JS9eFmEedz3OJ0YZrH+hLPXzR9kLCf3KLQyEytGibW+XnzyB29
         AJJ3H7gl5einH6Wwm+K6gSjs1+KszUjJZ+R4CihMj3yNYFRzopaJgpA7uRC+0lJYkbNm
         u78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704823863; x=1705428663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZHN1WAhVwI6VDlIQMYmKaw16w5C6ru8lwNtKGuzaAIs=;
        b=ip0V6u2WOBQuIYylxSQ/Qrc9D2Ckyo71FCdq+IBQdbphY7+SC83LdHN1Ae+AF3Co8D
         myTjUiWAXanM1WNlr9tHHlIrHRxq6DYm5HaF8yxhjRSTniu6ntxnq09YWp9TyMvzaQkT
         YxObRU3S8OZtZGSE/t+WHtASRQPy+dvdiOWLM2pP2+wjaxgLHHTCDv70QV2ASs+gWsQV
         vG2RmxDkypajHvtpOliWI2Y7nqjVvUbBUiwBy7mgE2YIoDRDzSWIjOM2d+/xkEzlPCEZ
         TtvrVbS+p+zcu1VhR1cLIiCtxuBG+V2JTMxoR4v+F6g3BTVLUU3c9ijbMz0lkYnJSat3
         MjMA==
X-Gm-Message-State: AOJu0YyoIZgU3CFkJlPnOxiE1e8nLIZzyxw3pHRHNKmeZbPTHZdvEGAV
	OW2yzPg79vsua1DvOikEO4Zjoj7CSkURbNwF
X-Google-Smtp-Source: AGHT+IGIz637i+TAvNSq57H+nTqLxDg7EkXy3wFfa4jY9jgSh7ImiwDSTSWIh/OyzSTvsMIDN4DJ2Q==
X-Received: by 2002:a5d:5917:0:b0:337:5d2:f6cb with SMTP id v23-20020a5d5917000000b0033705d2f6cbmr845759wrd.54.1704823863496;
        Tue, 09 Jan 2024 10:11:03 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (rsa59-h02-176-184-32-47.dsl.sta.abo.bbox.fr. [176.184.32.47])
        by smtp.gmail.com with ESMTPSA id i6-20020adfe486000000b003368d2e729bsm2988794wrm.43.2024.01.09.10.11.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 09 Jan 2024 10:11:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 14/14] hw/arm: Prefer arm_feature(GENERIC_TMR) over 'kvm-no-adjvtime' property
Date: Tue,  9 Jan 2024 19:09:29 +0100
Message-ID: <20240109180930.90793-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240109180930.90793-1-philmd@linaro.org>
References: <20240109180930.90793-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 6oV7W13HN+PY

First, the "kvm-no-adjvtime" and "kvm-steal-time" are only
available when KVM is available, so guard this block within
a 'kvm_enabled()' check. Since the "kvm-steal-time" property
is always available under KVM, directly set it.

Then, the "kvm-no-adjvtime" property is added to ARMCPU when
the ARM_FEATURE_GENERIC_TIMER feature is available. Rather than
checking whether the QOM property is present, directly check
the feature.

Finally, since we are sure the properties are available, we can
use &error_abort instead of NULL error. Replace:

  object_property_set_bool(..., PROPERTY, ..., &error_abort);

by:

  qdev_prop_set_bit(..., PROPERTY, ...);

which is a one-to-one replacement.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 2ce4a18d73..6ac8fb19d2 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2150,14 +2150,13 @@ static void machvirt_init(MachineState *machine)
             object_property_set_bool(cpuobj, "has_el2", false, NULL);
         }
 
-        if (vmc->kvm_no_adjvtime &&
-            object_property_find(cpuobj, "kvm-no-adjvtime")) {
-            object_property_set_bool(cpuobj, "kvm-no-adjvtime", true, NULL);
-        }
-
-        if (vmc->no_kvm_steal_time &&
-            object_property_find(cpuobj, "kvm-steal-time")) {
-            object_property_set_bool(cpuobj, "kvm-steal-time", false, NULL);
+        if (kvm_enabled()) {
+            if (arm_feature(cpu_env(cs), ARM_FEATURE_GENERIC_TIMER)) {
+                qdev_prop_set_bit(DEVICE(cs), "kvm-no-adjvtime",
+                                  vmc->kvm_no_adjvtime);
+            }
+            qdev_prop_set_bit(DEVICE(cs), "kvm-steal-time",
+                              !vmc->no_kvm_steal_time);
         }
 
         if (arm_feature(cpu_env(cs), ARM_FEATURE_PMU) && vmc->no_pmu) {
-- 
2.41.0
