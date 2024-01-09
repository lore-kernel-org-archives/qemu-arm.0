Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp552897ejs;
        Tue, 9 Jan 2024 10:10:05 -0800 (PST)
X-Received: by 2002:a7b:c391:0:b0:40e:490e:8e7b with SMTP id s17-20020a7bc391000000b0040e490e8e7bmr1501565wmj.127.1704823805637;
        Tue, 09 Jan 2024 10:10:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704823805; cv=none;
        d=google.com; s=arc-20160816;
        b=bZUcFYtTR1HrXlJfd2a798CWlEA8PYurTgrJDrOIaMsV8ffpQOpzbqpKadenoiNR64
         B2SAIDk6By/zAmd3K22hbar+tDEEL7YL2dm83TyeqVe0eOeHS9yzMnDwiBPVBXdkUQQY
         l0PVnPUbf/ZXw4zSqjSglWYdCFxEf8+cz0iMfhbREFK1eJlCI7A3HgaY5iX1MJfIhLfj
         fCop1gLkeqxP8rCTgQ2sfez8G/QRB2j9cOmTaNqgSTHeJ3SOmzof5FXZZ1llBL1ZOAQV
         aFl0FHyNP4EzTAKElWWEjCsJbSgxEsUxB25k7SCha4HgkpI+OTjk33HbWFi53NBlNieo
         Ss9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fOLjDR/IKNF0Xh0mudwkf1U6/g8RGHkdFKaUB2oy+80=;
        fh=v69mdd+nxs/0WeTIWzLZOPCx0ynE2o0vtvId2fSwkBY=;
        b=a61qb4QBv2ThqBRBULoU9re4PkKn66ge3o9xplNzgcFYlC88OwPuwdTHQPVj9pB81f
         dE1A4B7KXFCoxVVTd+r+ysvWo8nCgZa7s8AX8zkgdeTrTdIP4bJpO4JZNSncLOGnASdj
         aaujM1yjN076dwDL670+X/V+gNqpYMeN9vWMGQvHR64FaVdsz5TA7sYTIDb6zao/3bX0
         z/AUn42L30ay2m/5avistMt+y0cwutjS99slgSZB0Qjr7IjsMHLhgWLXmMHk/qqUTyUq
         /do4GuD4kNJIn/uJiTcPJ0nTDPWttjxU65JKhgL4nXCmbBK/bglYZUoJJ79H1ToCQ4le
         FySQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="RnkwQqZ/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id iv9-20020a05600c548900b0040d6b4e6f43sor1176389wmb.0.2024.01.09.10.10.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jan 2024 10:10:05 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="RnkwQqZ/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704823805; x=1705428605; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOLjDR/IKNF0Xh0mudwkf1U6/g8RGHkdFKaUB2oy+80=;
        b=RnkwQqZ/D6LBbn3SLtBb10RJPCQ7tpg9XydLuffDx/HLCssN7kBMKTEoCpv+ztM4h9
         Gjo7OZTcy5in5aDBsLu45+jOlFzEBZtobK/obkzDA9TCQZCH0KTuenRPHKr6Vvm1amJe
         zobASUslRH3cZ7TJGtYs6hL6RVQw20G6ip7qpjGiEZBJQOQhH/2aWUAeJ0N1/iOP8Ub2
         WUAhv+5IgC2VknDgdQx/isfI0vT32AYLJwZNRLvCJnN9JsjIxzVwZdmg//TjKMIvHv4R
         5vLXBRBtoqQbSXDU6z6KYm1hyV5tbRO3mQYrNhKRBb1OmFSZ6n6/qT9LY50rw/wP5zmj
         LE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704823805; x=1705428605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOLjDR/IKNF0Xh0mudwkf1U6/g8RGHkdFKaUB2oy+80=;
        b=JcjyCmfMX7GRzH0PBZNrS9hiD4tNNjagZiplweaK2pT46AjcqzS5I5Nb/FKMu9mM48
         e/7P3ZqX8yqyv0oUuKm890+VRobFY/v3iShF4wb5i7O0OPVpGda13y1upbao/59fcO9L
         OGgNsPHVyWACdwgUzv/VL8BWOLBg2N/moavqKp4c7kg4zlwMnh33ot981Z8MP4ZlNf0g
         Byjfh2GDH8qojGZCUqtbDa82T+qYroW6Nw8mLAetL/OBOH6iaXyvUrhdONUrwQGIaV+Y
         dQfKhxok/94sYqbVsyXosDlXys7AD65c3Mk/QTKSLnzG0boA/S04q6YKVEnO4gEcUIKm
         KRww==
X-Gm-Message-State: AOJu0YzVzvrFGEP6z4BHTE7vYQCTMWcJ4YTWhZAyMf0FRGHSn8urHhIM
	9rDAVd/KC8nj7ewf4iRQ2gJrJxi2m6IIu+PfDonvebiy8tiJbxqr
X-Google-Smtp-Source: AGHT+IGYsbR/oWsWSjZllwttr2q5gs35AJP/ee8A1m9jKhWKPikHGd3pVejueiIhNEFR5CInfw74IA==
X-Received: by 2002:a05:600c:500d:b0:40e:4a7b:f53d with SMTP id n13-20020a05600c500d00b0040e4a7bf53dmr1293492wmr.168.1704823805372;
        Tue, 09 Jan 2024 10:10:05 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (rsa59-h02-176-184-32-47.dsl.sta.abo.bbox.fr. [176.184.32.47])
        by smtp.gmail.com with ESMTPSA id n25-20020a05600c3b9900b0040e527602c8sm2101803wms.9.2024.01.09.10.10.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 09 Jan 2024 10:10:05 -0800 (PST)
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
Subject: [PATCH v2 05/14] hw/arm/armv7m: Always set 'init-nsvtor' property for Cortex-M CPUs
Date: Tue,  9 Jan 2024 19:09:20 +0100
Message-ID: <20240109180930.90793-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240109180930.90793-1-philmd@linaro.org>
References: <20240109180930.90793-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: xTW742nmH8n4

All CPUs implementing ARM_FEATURE_M have the 'init-nsvtor' property.
Since setting the property can not fail, replace

   object_property_set_uint(..., "init-nsvtor", ..., &error_abort);

by:
   qdev_prop_set_uint32(..., "init-nsvtor", ...).

which is a one-to-one replacement.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/armv7m.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index b752049add..530729f42e 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -309,6 +309,8 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
     object_property_set_link(OBJECT(s->cpu), "memory", OBJECT(&s->container),
                              &error_abort);
     qdev_prop_set_bit(cpudev, "start-powered-off", s->start_powered_off);
+    qdev_prop_set_uint32(cpudev, "init-nsvtor", s->init_nsvtor);
+
     if (object_property_find(OBJECT(s->cpu), "idau")) {
         object_property_set_link(OBJECT(s->cpu), "idau", s->idau,
                                  &error_abort);
@@ -319,12 +321,6 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
             return;
         }
     }
-    if (object_property_find(OBJECT(s->cpu), "init-nsvtor")) {
-        if (!object_property_set_uint(OBJECT(s->cpu), "init-nsvtor",
-                                      s->init_nsvtor, errp)) {
-            return;
-        }
-    }
     if (object_property_find(OBJECT(s->cpu), "vfp")) {
         if (!object_property_set_bool(OBJECT(s->cpu), "vfp", s->vfp, errp)) {
             return;
-- 
2.41.0
