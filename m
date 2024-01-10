Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1259078ejs;
        Wed, 10 Jan 2024 11:54:57 -0800 (PST)
X-Received: by 2002:a05:6000:1369:b0:337:7086:b70c with SMTP id q9-20020a056000136900b003377086b70cmr4802wrz.81.1704916497547;
        Wed, 10 Jan 2024 11:54:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704916497; cv=none;
        d=google.com; s=arc-20160816;
        b=MYMnUDKFmtGpGo+Nab9YaNHeStHKg5bLgW9Gyl3g31xPXGeC6zCynyy4M3EHdbdCeK
         CR+DIJ3xCTMoPHt+IwXMi9Xe6I56NXsMulGlYwEzZQgG27WehdphQ++l0nnZqQkl70Py
         qON+yQSfNQv5CtUVFQG8LMqPCMNvwUyu16+UW9QIXI0rTP8J70efF7fEPaGOzIiTz4Ke
         Nd+sPDeaV7HKsLDsl3hv5GcwNabyPGL6LIVTotzMf5cWn5r6c70fkJeqk0urK2G9Zk4x
         y/2FkcqTajdTrYxGnPqi0RgBehAgXtualDbw/w7b7+wg64BWHydLHqBFgHYlwSs2gwYD
         QP5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=H2YEvqYxr1jwORUy1H416YdJDByH1Bti5dkUqmMcrho=;
        fh=0Bn9ysFO5uhdOoEvdDNDnkwY7yFMuDt2XLw3k0zcWt8=;
        b=D2IClUEnZ0X+TzZ0ZtphpGDSla3oEgdVQ3Lob39jgzlsUwRqAMq4MHvd8bt0ISEhIU
         wudVYqNucsiYgfOBCNd+vk3UCo7tbN6JK1zts+3jM8XliX/laR1eWupyavlGN8RLUOn4
         /k+YFTjlYlChKPbLEM0b2m6sGhVjitXyckZyIvv/eVCcC11OESvnf+IgZo8xT567Qk6h
         kXpPBHxeaWZU6BJvlmYx5GpdKc+lK1FRtmAHq9+Qce8rk3qeN/+1dSfV49PH4R4djW5i
         E2LwxQ6LdhXEkTTOiLf6PWrnbnygDR8esapv/a5cPkhSPh2ImGtAdWLl2MQ5OqYu3/xn
         0kNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xhkgIfYO;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q18-20020adffed2000000b003367beed7a8sor435206wrs.4.2024.01.10.11.54.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 10 Jan 2024 11:54:57 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xhkgIfYO;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704916497; x=1705521297; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2YEvqYxr1jwORUy1H416YdJDByH1Bti5dkUqmMcrho=;
        b=xhkgIfYOeJ8OH/xNIgU8zEWX/A1sTwWKJ6Tzqgqo4lcHGXq8LdlR9fqf5+D+y4h+o5
         BuaBmEG3/eXjy/KEnjtOzxnTWc/cy2+lXIVGnIMFK1214LokSghxS6NHM9WCp8zrlsLf
         mwOg3NfbR9uVeCwIKs/lCZLU2Ag/Ver2lAvEhcLrVia+plMiJvozuqCt2sQb3jtKe7x1
         oRcs6NkKio+SmlP27OmzzKIkmyiNktYanWc9psQkk9WbLcVYJ69ReHq1mPvBqp4IDP28
         RG0iaDDYWeDAbbMsFmBCdbHscjxaV3HOyD7HHpwfMrOzSPXOCojPFuuxqNZWfT0TDpao
         1ADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704916497; x=1705521297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H2YEvqYxr1jwORUy1H416YdJDByH1Bti5dkUqmMcrho=;
        b=mu4aHBAuQ+oh5dF6PAdXpnKD6O9Jd45A4j/5Ct9/F6Nj9okoePPlv7zamvjMaRJRo7
         3xYRqipWzcsQKDKUIAM5W/cZOJku9sOcvMvSTszlHSrdappWG1yVSpaiUeuPn74UHgdu
         WXQ8k/5IKXaGMxQajTSiKRa5noEAQFvNvKHuWipVP/sjhftqWEqgbBDI9JMPwlv+sGy0
         fe530wj8xxg1kIwyXPib2zgFRdZ3/w6vmH0ckqMB8BPlg7XqHXc6rmHJ+9XmmMfTPRAI
         TbK2joOZPAqxPtoqMYiLzXRCvx5bk/qLhqn3CbEyqJCSpwuuUMNyC7/9sAJyGCkz8KL0
         ORDQ==
X-Gm-Message-State: AOJu0YyLS7zvfs3ZTCSeKbX/pI+KZa0QoNSZDZ4Aa7d+mAk7gcECpk5q
	XqM0CXr0A3wIxhI+fbPKMGy4jrMzqLAoG4C6
X-Google-Smtp-Source: AGHT+IHQIfFBBMTYrGuA2Z7LZ0BoaPN7z/xVJtfC+knKSfqFG55a4WX2lBDF0b0ZD9Mqg27tWGP88w==
X-Received: by 2002:a05:600c:4387:b0:40e:511c:ce85 with SMTP id e7-20020a05600c438700b0040e511cce85mr866737wmn.57.1704916497248;
        Wed, 10 Jan 2024 11:54:57 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (vau06-h02-176-184-43-236.dsl.sta.abo.bbox.fr. [176.184.43.236])
        by smtp.gmail.com with ESMTPSA id l17-20020a05600c1d1100b0040e4a2b36bfsm3188298wms.22.2024.01.10.11.54.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 10 Jan 2024 11:54:56 -0800 (PST)
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
Subject: [PATCH v3 12/14] hw/arm: Prefer arm_feature(GENERIC_TMR) over 'kvm-no-adjvtime' property
Date: Wed, 10 Jan 2024 20:53:26 +0100
Message-ID: <20240110195329.3995-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240110195329.3995-1-philmd@linaro.org>
References: <20240110195329.3995-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: OiLwQpRQkMms

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
index 6d1cb24a6e..49ed5309ff 100644
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
