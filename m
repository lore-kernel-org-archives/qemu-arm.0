Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp2472287njb;
        Mon, 3 Feb 2025 16:23:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU0oSm0ddiHl1v6GpZtdxE50y55s+fzsMg3aw9fROBatmDink9mwS34kXzu7FQWeD6JFFNs7fvVPI8E0w==@linaro.org
X-Received: by 2002:a5d:64e9:0:b0:386:3e3c:efd with SMTP id ffacd0b85a97d-38c5208fe70mr23385406f8f.44.1738628581547;
        Mon, 03 Feb 2025 16:23:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738628581; cv=none;
        d=google.com; s=arc-20240605;
        b=cTazfHeOCQ3DQ7oti+idEjVNfosgnLqLkEKOk1YTIT5pwacDD9fyNxpN9eclk7eqJw
         BzKzZ4xZXHSawh4gbH7bnciMv2mhwd47cmcfGBFyShBW378c/rT8vNHt6zREG3c6YQzP
         D8u7YIFGhDNVPdk6/QJhNqO1QlEG2OqIJ4m4uOwXUGspb++SCnPhvcXVdDejH+wqlYZM
         usCocJOk1L9otCb2cFTmLdJw/uTfWDAN6V7FyebD28sFrbx39NvLkzG5HYiExpWHO+Sk
         jnsJIRbWMGCGLgNFMdBp9yu+3rcAYDPVmVkm70Lye4k9w3OKoYy4tjGYrqd0EkD15/AO
         8wdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nVNCwynGFIOtISxx5EetqRZMocUYGnGpNyGbXMYbhl0=;
        fh=wkULP1ARkLOsbXwhob+uKict+75qWt5HRBxN3JGU2V0=;
        b=R/F/D9SSJr25oK3K6zZ1Smt+m6GJNbpckD0wx8loIWj1P3FOrWmwiXpuCD4Sgp8N4N
         TBtOBDhiYRZG7QvBmg1aKPP6CRbeRXLiIdO2Y75ral6fxh5Y+qG6MSH1c1snHp7F58S9
         MRQy9G36eP/CuzAks8WQwTv3mltRsz4OKMKRJTwKAofgrBlqQPNxrCFytiMp/NMmH3Rw
         UQ0vcLHoR9Z1NYYg7rD0f3luM6nui1z3K6OJ3KBwrH4RrN1VaNmQBA2FwU//nSde1mLa
         Ktu9v1PjVMA3ncu1BdQHwWddl+qf1riidCRFRx8AtLqTjA0M9AZserRf4DwLifT2GC12
         /EEg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DspAYuqr;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438e730af9csor34686725e9.5.2025.02.03.16.23.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 03 Feb 2025 16:23:01 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DspAYuqr;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738628581; x=1739233381; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVNCwynGFIOtISxx5EetqRZMocUYGnGpNyGbXMYbhl0=;
        b=DspAYuqrci1WWWn/p/okeGudL1WIZkOXmWoHN8MF1yQAchFE6lbJ1dpE36eGglbbDz
         yDt8GycBiAiWaZBh0mOkK3mmO2MHOfbYrNHMtB+AUU973xUzfCD/WsYZylcswcEIi51g
         geCSh8NIGN0Lerx7xv3GgM8EtvbKreLhBhKY209vJiCDojNY2QFBaZoM/jozQbo6BR1o
         sJ3BEtAuGqrENqpoOK1p0WQsKmKV+iE+r40Ru+3bYCWt58lAgS7L6Npgi36BYoZYD3ad
         YZ2Gw/L+ZXyucR6VvL9BexvPnmapU0H+Hos1F9vieFDG42rAQQDElCTUmRlvoKXBl3pH
         0oqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738628581; x=1739233381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nVNCwynGFIOtISxx5EetqRZMocUYGnGpNyGbXMYbhl0=;
        b=KfMNocQ54yhfie6K9jvk8gnoAVMSSh+LTQHlkrRpUM7o0rE+FRUQy24P4NJnIN/ni5
         BdsXb+7CszV0UeASqcpOMfd4EoMHoyM1iMesMuo6LLlZXwYH4agFFuPqAHkfBnZtK7rf
         jiaQsNEpD0Aq2QNVaNpBuE2SgsFq8i4+0XJmauP991EO2Nz8oVvXrKj3fH1HpoO77xb/
         BSvhKFE7SWNAwCyDdmilSXA23iKerIDQuyV2UEXTR/UihJwNKYQAIkgnbk5J6G2nvc9f
         4mW3WRy/GsjQGUeYsyZYyCB+Mv/yTO25bK9vePtk70ajl+0EhBKPnVSEe+dWj0Xx6f1e
         P8oA==
X-Forwarded-Encrypted: i=1; AJvYcCVlvZP5WCmg/VOQ3fXxJgvAo6JoFwVuJZPYQOaakRPczf4oJqII8hYpTqBHvXsMx/q1IN3yY4ROXqt2RA==@linaro.org
X-Gm-Message-State: AOJu0Yx1OGlfBRw8+hJWRwpeRFcz6svVEFiO7ZMkygH984anq22C36IL
	he15/EHFy3IFjlQgS4kXonTwt4jh9rbNtrzETIXD3rzMloc37JCRrmP9aqZ6I01pP3wOcL/VyPT
	nZzVmIQ==
X-Gm-Gg: ASbGncvEPHYzOkIUUKKnudDXJuEM2mXMW4J5d6TI1M3B1CQm3zayaH8p+Lea/Y8sVq1
	f0KN1ab7aBcJjeoPut0yNgzZPBYehtpKbx/VQDm+pTb26qTfctxhJ3zPLBqjbD9oaS76XK/0i5u
	5VaJ675tKTjnqAd2uS/d2WYwQL0YnrB6J/PA01bUjWF1Y5Q/2yMzY6K0tyUXi2xlm5FTLb0AIFy
	9OjHkZHi21XfCDQ27KeM+ZcA8V1wC7VHlQFH1U+CL9tjSiVQLO+dZCrFM/xw9lF64TiEafEi6ld
	bfZuhsjwxuSELMFkutnnFRvQpGulP2TtJUJrHNpcxK8rtcFo9ypKseoVLzb98xRltg==
X-Google-Smtp-Source: AGHT+IEgsAQgnUdrPCSLWADKulJzu3xBQ6zfJJRjAoGf4pxTEoHxz53Qq3cDLFtkt6vLH27xW1VB3Q==
X-Received: by 2002:a05:600c:1e02:b0:434:ffd7:6fd2 with SMTP id 5b1f17b1804b1-438dc3c22d4mr217757185e9.7.1738628581014;
        Mon, 03 Feb 2025 16:23:01 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e244ecd6sm175398995e9.28.2025.02.03.16.22.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 03 Feb 2025 16:23:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jared Mauch <jared+home@puck.nether.net>,
	Fabiano Rosas <farosas@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	devel@lists.libvirt.org
Subject: [PATCH v2 03/12] hw/arm/raspi: Unify RASPI_MACHINE types
Date: Tue,  4 Feb 2025 01:22:31 +0100
Message-ID: <20250204002240.97830-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204002240.97830-1-philmd@linaro.org>
References: <20250204002240.97830-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 1n6Y2WzDA8eG

Merge Raspi4bMachineState within RaspiMachineState by
using an unnamed union.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/raspi.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 3fa382d62ce..ef94d57dab5 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -38,9 +38,6 @@
 #define TYPE_RASPI_MACHINE  MACHINE_TYPE_NAME("raspi-common")
 OBJECT_DECLARE_SIMPLE_TYPE(RaspiMachineState, RASPI_MACHINE)
 
-#define TYPE_RASPI4B_MACHINE MACHINE_TYPE_NAME("raspi4b")
-OBJECT_DECLARE_SIMPLE_TYPE(Raspi4bMachineState, RASPI4B_MACHINE)
-
 #define SMPBOOT_ADDR    0x300 /* this should leave enough space for ATAGS */
 #define MVBAR_ADDR      0x400 /* secure vectors */
 #define BOARDSETUP_ADDR (MVBAR_ADDR + 0x20) /* board setup code */
@@ -49,15 +46,12 @@ OBJECT_DECLARE_SIMPLE_TYPE(Raspi4bMachineState, RASPI4B_MACHINE)
 #define SPINTABLE_ADDR  0xd8 /* Pi 3 bootloader spintable */
 
 struct RaspiMachineState {
-    /*< private >*/
     RaspiBaseMachineState parent_obj;
-    /*< public >*/
-    BCM283XState soc;
-};
 
-struct Raspi4bMachineState {
-    RaspiBaseMachineState parent_obj;
-    BCM2838State soc;
+    union {
+        BCM283XState soc;
+        BCM2838State soc4;
+    };
 };
 
 /*
@@ -380,10 +374,10 @@ static void raspi4_modify_dtb(const struct arm_boot_info *info, void *fdt)
 
 static void raspi4b_machine_init(MachineState *machine)
 {
-    Raspi4bMachineState *s = RASPI4B_MACHINE(machine);
+    RaspiMachineState *s = RASPI_MACHINE(machine);
     RaspiBaseMachineState *s_base = RASPI_BASE_MACHINE(machine);
     RaspiBaseMachineClass *mc = RASPI_BASE_MACHINE_GET_CLASS(machine);
-    BCM2838State *soc = &s->soc;
+    BCM2838State *soc = &s->soc4;
 
     s_base->binfo.modify_dtb = raspi4_modify_dtb;
     s_base->binfo.board_id = mc->board_rev;
@@ -515,8 +509,7 @@ static const TypeInfo raspi_machine_types[] = {
         .class_init     = raspi3b_machine_class_init,
     }, {
         .name           = MACHINE_TYPE_NAME("raspi4"),
-        .parent         = TYPE_RASPI_BASE_MACHINE,
-        .instance_size  = sizeof(Raspi4bMachineState),
+        .parent         = TYPE_RASPI_MACHINE,
         .class_init     = raspi4b_machine_class_init,
 #endif /* TARGET_AARCH64 */
     }, {
-- 
2.47.1
