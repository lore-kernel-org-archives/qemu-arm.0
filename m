Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp552973ejs;
        Tue, 9 Jan 2024 10:10:11 -0800 (PST)
X-Received: by 2002:a05:600c:468e:b0:40d:9032:1920 with SMTP id p14-20020a05600c468e00b0040d90321920mr3144513wmo.38.1704823811614;
        Tue, 09 Jan 2024 10:10:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704823811; cv=none;
        d=google.com; s=arc-20160816;
        b=qQkqlsXbhOMyN2DnzkEbyHFecarUVsBgX1/VbE73V7+YWPueUl6u598Ivf7kWT+mkV
         7TiJ00yreAy4ieGgRxbtnZMbUQivIrpZh8BroyUjNpV4gKYT7kSBqbQVnQPY4WJ9GrKK
         wkVSeiFloWBgzcgaI2/LbcPdr7gQWWWSP9GvfUXdmhCY9nyF5lNPx+xfVNxnWrcLeIRT
         ohh4ThKed6A8MkeybexbR0jTG/fjFM951flL4cVC74d+L8XGp6oexYJMHrl5g2jgFAzJ
         6H6kyzV+tQBkDdBmTyY/wUY+ulJ8ndoBMWv9UjxecVs2lymHTBCTWVx0amHi5YuAMNT/
         PZAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+Lqyw2xeJxP0nadk2efU9Sx5aGl4DyqfaFeDtt0siLg=;
        fh=v69mdd+nxs/0WeTIWzLZOPCx0ynE2o0vtvId2fSwkBY=;
        b=Te17q7cpwamjTofuHzoLtbvggG7TqreZfw6h0hmd4ikNpoRJJ5/Iu0EI+eXg8DA5wb
         wr7bPOJE1j/eSntSJ2tIPhRjsdjD7Yqn9CRqWynTtZkQLBb9/FZRnlppp7cGwdYixNMS
         uC2raFDPSwFMPfLitvN5trY+U/WBq+CYbLtfbkebe/SsvFMdW83tNTUXfiP4PqKTVMmN
         4gbAt03ethIaNlOu3q9Cr0lDZNGdNAVx/6XIm06pNmxNcamk1lkX3NjvGO04dkOuSE9+
         I9rCWd9QpCr8ngAAG52bbWLND50STcMHR/leKrCUW9OKTo7QkDv1+fD53pRA64jZyLwR
         oPkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L8mpgaK7;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 24-20020a05600c025800b0040e455808e8sor917378wmj.12.2024.01.09.10.10.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jan 2024 10:10:11 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L8mpgaK7;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704823811; x=1705428611; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Lqyw2xeJxP0nadk2efU9Sx5aGl4DyqfaFeDtt0siLg=;
        b=L8mpgaK7Z2Z+9YU1FeiIbB6dYEvoCs1lQfPtgeUMWg/TeZnmt/2KAna3ohvJP6T5ix
         d5MXmwLu6SaZsSut+yhicFEgfMjpI4a3+EB4uP/XH6h3TmPVFTvYLPPMIkxB74SP/md7
         4GYJDrFHRJ/1UIO/peoF/fdlB1wUGeVS/cAeIhpvYi4TBj9Y+ZNxR3ujmcLQof5G3Fwu
         4qGdFX+GI0AAJHkd7y53Fv9vsiGxVkpELmRxkq5vLmmfeuJEm6hNXxwYJPb5jMa/Gew+
         44naoNvQ0FJ8wFb/lhERdq/+n0J3C1sSIDqAq48ENrHVsotXtqo6a7d7qQ4LyX5mAlnl
         0uvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704823811; x=1705428611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Lqyw2xeJxP0nadk2efU9Sx5aGl4DyqfaFeDtt0siLg=;
        b=aWcYKGPkfe7dIStMtF6RVJ9W6mshPLxd0oQgrm72obl+KT/0gk1vkoyal00ilMNfKU
         96CCwjjoI+U+Z1Dehp3QiO580Rl9sRwoySBoYrCAxbPkdNSwoRrQ36ndN+WuMr2KzUMp
         3qIuZujvNfkLCjpD/I4GAsfZwRJjAq+i43Z3l9P5u8RrHCdY1VhljChLttNiwEtmDdxX
         OtEpykdEimCbcqqaYRb/uk3F8GN5QAUDatY3z3BYTwFRK2QeAQGMdbYEDrukOHmGJDYw
         IxzHgKgaz1Bcc7M7uwkOPj6o/tm2Y7s8CZWlz07rAdh6/NqJl+KYmaUTZf4xf7RBtSOY
         EEJA==
X-Gm-Message-State: AOJu0YzV7PquMadPplhIRCr3FpJ6QJL2UitZQqAGGFV65DGQeNa52PZl
	2BQwbecAzP9XGxdPx5o4NUIcbaot0cMgae31
X-Google-Smtp-Source: AGHT+IEkV3EqOMZBiyi/x5ctMwIwgQqB9cTJaNXPdfadCTidyHUkVC6QTsodAd4u42EfBemrXHw2rw==
X-Received: by 2002:a05:600c:b97:b0:40e:4985:ba63 with SMTP id fl23-20020a05600c0b9700b0040e4985ba63mr1545900wmb.107.1704823811362;
        Tue, 09 Jan 2024 10:10:11 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (rsa59-h02-176-184-32-47.dsl.sta.abo.bbox.fr. [176.184.32.47])
        by smtp.gmail.com with ESMTPSA id gw24-20020a05600c851800b0040d3276ba19sm4549145wmb.25.2024.01.09.10.10.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 09 Jan 2024 10:10:11 -0800 (PST)
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
Subject: [PATCH v2 06/14] hw/arm: Prefer arm_feature(M_SECURITY) over object_property_find()
Date: Tue,  9 Jan 2024 19:09:21 +0100
Message-ID: <20240109180930.90793-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240109180930.90793-1-philmd@linaro.org>
References: <20240109180930.90793-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Ux2ufLPCww1q

Both "idau" and "init-svtor" properties are added to ARMCPU
when the ARM_FEATURE_M_SECURITY feature is available. Rather
than checking whether the QOM properties are present, directly
check the feature.

Since we are sure the "init-svtor" is present, the
object_property_set_uint() can't fail.
Instead of using &error_abort, replace:

  object_property_set_uint(OBJECT(s->cpu), "init-svtor",
                           s->init_svtor, &error_abort);
by:

  qdev_prop_set_uint32(cpudev, "init-svtor", s->init_svtor);

which is a one-to-one replacement.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/armv7m.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 530729f42e..8350267d96 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -311,16 +311,11 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
     qdev_prop_set_bit(cpudev, "start-powered-off", s->start_powered_off);
     qdev_prop_set_uint32(cpudev, "init-nsvtor", s->init_nsvtor);
 
-    if (object_property_find(OBJECT(s->cpu), "idau")) {
+    if (arm_feature(&s->cpu->env, ARM_FEATURE_M_SECURITY)) {
+        qdev_prop_set_uint32(cpudev, "init-svtor", s->init_svtor);
         object_property_set_link(OBJECT(s->cpu), "idau", s->idau,
                                  &error_abort);
     }
-    if (object_property_find(OBJECT(s->cpu), "init-svtor")) {
-        if (!object_property_set_uint(OBJECT(s->cpu), "init-svtor",
-                                      s->init_svtor, errp)) {
-            return;
-        }
-    }
     if (object_property_find(OBJECT(s->cpu), "vfp")) {
         if (!object_property_set_bool(OBJECT(s->cpu), "vfp", s->vfp, errp)) {
             return;
-- 
2.41.0
