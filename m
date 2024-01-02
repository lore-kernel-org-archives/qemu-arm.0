Received: by 2002:a05:7022:7e0d:b0:70:a3b7:dfe7 with SMTP id ut13csp6659461dlb;
        Tue, 2 Jan 2024 08:05:31 -0800 (PST)
X-Received: by 2002:ac2:4254:0:b0:50e:74c6:8960 with SMTP id m20-20020ac24254000000b0050e74c68960mr5827323lfl.96.1704211531598;
        Tue, 02 Jan 2024 08:05:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704211531; cv=none;
        d=google.com; s=arc-20160816;
        b=qcDBcgwgEb1pAziHxb2KIOiI6Q3X0JFOudGO2A4X61WjRSVuTNVx9ggjFn+npOxAMb
         RxHXLSAYoLoqMXq3XfP8BQrH3pGHr41gnLWUVG6KI4Kegr8Ugh2UFWpint1xi7OFCpLd
         o1pBxyHbs2wWVsPwfYw7hSfgoGBz4iYBmWY5ODiK3kxvFyp+lEc5IkFDKiCEHpaUzI+R
         tEkjb+BHP6X/QaFzeoaccy7G7CygnMKwZMyQp10Ob5tynUBj04H8ek3baq0d7Z8c6M4K
         c24oAQDb3OnJHPpK/aQFd05FllwUIscAy8QruYAnvyMHiBdhKINX7UAMRD1+fDUktg5z
         3Cmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nwq5yDKl13Ts01PyVa9GJG2AkfcsezIrZC8dB60lDmQ=;
        fh=Fbl4rt7vNadFyu+mhE5sPZ2m5GJmVL0UTbP+h3uuTlY=;
        b=va+LfyQ6XiFVrQHJo+fWjkbIk3QZKbwACVrUVpLi1UVoJ3dSNYBpp3Lm4cMYNWkLKx
         AuUhn9O372LVsHXqUjnVSrhnJ4yIbUnr80kBYXgnYodbrNWAZTw37Bxwmu4KzpiMyNej
         eARb6obCVuPhDDzIF/yOmggsVBiCYr+sR2eGOmYdp2snOArcNnLE2lR8z3DX5cDHFKSG
         Ij3AIJPpvjkxMIPXK7hUkp6FZOPESk+FWs8sVQK54v9THTn3maaq+LrBsrgfXKFqZXqI
         xB6VwyTKruc5rrUaLdzAq4wWyQXxEwzooatUqGlTmqQDUFO3Q7jyHbEvZY5Ln6u0PoSs
         /e8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=usuft3O3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e2-20020a196742000000b0050e7b691540sor13904lfj.9.2024.01.02.08.05.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 02 Jan 2024 08:05:31 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=usuft3O3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704211531; x=1704816331; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwq5yDKl13Ts01PyVa9GJG2AkfcsezIrZC8dB60lDmQ=;
        b=usuft3O3TrU/9YT+7cJ/Nwj6NPESyN8/cROTqXV1eRTKlr5/0pTGKjtM4OizBY897X
         iADOmTZm2hJUb/QpqLw8VQMGrRsFXRJyWWMeai4P3Ip78mPi6LxD6tOljM6d/dQwtQ2s
         BAVgLdkpW2SO0HBKok41JEIYikQFx9F0aR6CqCdnM4xrgbnkCBdF191hvESxBwLrejCq
         T1moIJ3ZY8p7wfU38JWyFdfb20e+Yb1M+MtYvY04BPrpTneHbOIwN3dWgPgD5i4/ijoL
         LWOuzz/29asxqmLzn0wcgr+2DknKF4UkKceqXUeGzQbqpGp9+wBlXqPZ6dtn1GMIRhj8
         BctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704211531; x=1704816331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nwq5yDKl13Ts01PyVa9GJG2AkfcsezIrZC8dB60lDmQ=;
        b=HaazLRzQvUCEiZWGFRxzJcJR1r8cslIzI1EBlHtAEUfEGiXuGikH9dtNFO7pUjy1Xa
         bdG5I6P6lxui1an2BSF41J3rB0FYZ45jf5L0+VwfxR4mABHSPlhwaN2W6mvrNuywAIhe
         yyBBSuzbeQF05pQf4khq1Dljl7AMjBILE5vNe+yhlmkA0EJZBv47Ff/f9JyyLMhdPoeV
         +o5TJ/Jr9ZQ8vOaSO6S2cWix804vzMiaAh3aSjFBpoAomx+0716bo7G564BdKuPBLZEw
         DF5wPH7pQnju9Mw6udVXXtHFarZDx1mFOzF4ERRpK902vOtEBjyECs4VfWQ2h5MZcH/F
         n7zA==
X-Gm-Message-State: AOJu0Ywv3+ceO8il2Ii1L/IqEKbR2L3k6zrFqoDnRW/ON7BZmbqitMWw
	Q4PHfMPgzqiyEcB+m7lqT80X3DwDNVtAiAtC
X-Google-Smtp-Source: AGHT+IGb2XwyfuJx+sJgvN6SQmHHWUE9hIyqtWKh40xTmHinEm+AMoYcSkMlyySffPm9LMizi+tmsA==
X-Received: by 2002:a05:600c:ca:b0:40d:3a32:7d51 with SMTP id u10-20020a05600c00ca00b0040d3a327d51mr8132657wmm.119.1704211531140;
        Tue, 02 Jan 2024 08:05:31 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (sal63-h02-176-184-16-71.dsl.sta.abo.bbox.fr. [176.184.16.71])
        by smtp.gmail.com with ESMTPSA id c18-20020a05600c0a5200b0040c6d559490sm45764022wmq.3.2024.01.02.08.05.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 02 Jan 2024 08:05:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	Luc Michel <luc.michel@amd.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Eduardo Habkost <eduardo@habkost.net>,
	Frederic Konrad <fkonrad@amd.com>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 5/5] hw/arm/armv7m: Do not expose 'vfp' property if ARM CPU doesn't have it
Date: Tue,  2 Jan 2024 17:04:54 +0100
Message-ID: <20240102160455.68612-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240102160455.68612-1-philmd@linaro.org>
References: <20240102160455.68612-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: fXlZdP6qwLtY

Since the TYPE_ARMV7M object doesn't know its CPU type at the
time armv7m_instance_init() is called, we need to prepare to
forward any CPU properties there, then we can forward them in
armv7m_realize().

But then when introspecting at runtime, in the case the requested
CPU doesn't expose such properties, we can still see them exposed
in the container.

It is possible to remove an unmeaningful property with
qdev_property_del_static(). As an example, remove the 'vfp'
property when not relevant.

When running the musca-a board, the monitor output changes as:

  (qemu) info qtree
    ...
    dev: armv7m, id ""
      gpio-in "NMI" 1
      gpio-out "SYSRESETREQ" 1
      gpio-in "" 96
      clock-in "cpuclk" freq_hz=40 MHz
      clock-in "refclk" freq_hz=0 Hz
      cpu-type = "cortex-m33-arm-cpu"
      init-svtor = 270532608 (0x10200000)
      init-nsvtor = 0 (0x0)
      enable-bitband = false
      start-powered-off = false
-     vfp = "false"
      dsp = false
      mpu-ns-regions = 8 (0x8)
      mpu-s-regions = 8 (0x8)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/armv7m.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 12cdad09f9..f1f40353cb 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -244,6 +244,9 @@ static const MemoryRegionOps ppb_default_ops = {
     .valid.max_access_size = 8,
 };
 
+static Property optional_arm_cpu_vfp_property =
+    DEFINE_PROP_BOOL_NODEFAULT("vfp", ARMv7MState, vfp);
+
 static void armv7m_instance_init(Object *obj)
 {
     ARMv7MState *s = ARMV7M(obj);
@@ -271,6 +274,9 @@ static void armv7m_instance_init(Object *obj)
 
     s->refclk = qdev_init_clock_in(DEVICE(obj), "refclk", NULL, NULL, 0);
     s->cpuclk = qdev_init_clock_in(DEVICE(obj), "cpuclk", NULL, NULL, 0);
+
+    qdev_property_add_static(DEVICE(obj),
+                             &optional_arm_cpu_vfp_property);
 }
 
 static void armv7m_realize(DeviceState *dev, Error **errp)
@@ -331,6 +337,8 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
     } else if (s->vfp == OPTIONAL_BOOL_TRUE) {
         error_setg(errp, "'%s' does not support VFP", s->cpu_type);
         return;
+    } else {
+        qdev_property_del_static(dev, &optional_arm_cpu_vfp_property);
     }
     if (object_property_find(OBJECT(s->cpu), "dsp")) {
         if (!object_property_set_bool(OBJECT(s->cpu), "dsp", s->dsp, errp)) {
@@ -551,7 +559,6 @@ static Property armv7m_properties[] = {
     DEFINE_PROP_BOOL("enable-bitband", ARMv7MState, enable_bitband, false),
     DEFINE_PROP_BOOL("start-powered-off", ARMv7MState, start_powered_off,
                      false),
-    DEFINE_PROP_BOOL_NODEFAULT("vfp", ARMv7MState, vfp),
     DEFINE_PROP_BOOL("dsp", ARMv7MState, dsp, true),
     DEFINE_PROP_UINT32("mpu-ns-regions", ARMv7MState, mpu_ns_regions, UINT_MAX),
     DEFINE_PROP_UINT32("mpu-s-regions", ARMv7MState, mpu_s_regions, UINT_MAX),
-- 
2.41.0
