Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1027351ejo;
        Tue, 12 Dec 2023 08:33:23 -0800 (PST)
X-Received: by 2002:a05:600c:1f8e:b0:40c:53ba:172c with SMTP id je14-20020a05600c1f8e00b0040c53ba172cmr511781wmb.137.1702398803780;
        Tue, 12 Dec 2023 08:33:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702398803; cv=none;
        d=google.com; s=arc-20160816;
        b=fGxm6ifxWCHz+venpiYV7yKe9CSV4VEM/xx0GbSsh1TpFf6wtKIibTo6gYOM8JGQm5
         7CmXMANRtIJZrXuDVGY9GOmIL4n3gwJJzzxggWlElscnJzwRRitEf8Rnq7Pcfq1Pg+v6
         e6ww6ZloYvdT0g5uMbNDtGty/Deax12RDNb8NrZERbqBoBH6ALFhKCFUv8d2Hii8FkUH
         jX1K01XtyetQEvql3mdRWt4CM3041aO8VlxEfP5JGSI5TSQ4nllbO0/8Ne01wajua/V2
         jWNE8ab9dyUnHqwlSm5oulK11nU+qxZHgXiMzv9BZenKdHJVRRsEmACKOZ1C1a78NENM
         Ab7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9op8cKrG0JyypF+RCA+q2X8QDxEkarjB/JQ0egU7oTo=;
        fh=CkupYgn1Qmdh7jizui9HJgGegpqbRR5NXz1VyjRE1Hs=;
        b=H+fFk1pCKCkjmSOk/77eMPbPnwKZNyjmunbPk/5h3wu5pRx54kMhnY8w4HQgE9RTkS
         wyTOn8vcEeJmc2LPLOc1kUu5t7QAlnQ0k0VWATwR/Qolna6Daj/OURNQYldw7WezS9Gq
         QR1gcsd3lZr7HH++1BX0vAF2V+i7HAu3Zz7npiYQr+6ePg5y5bX3Q5vcofsvvugL4AR4
         9QzXi6imiBYdMx/tqCF/c0oHt38g5OsjvX8vnbKIy2QQiS3w6n92MR1U+QnvGAq+kbEy
         UhfNU9uHViAd9pSbw52Ajwr78Q42cwJw3bou87WXlO5dZlncPBnrET9H4DmJzL2dkFtH
         1tHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UJlfFTyX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y11-20020a1c4b0b000000b0040c23f6b0cesor3683140wma.12.2023.12.12.08.33.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 08:33:23 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UJlfFTyX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702398803; x=1703003603; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9op8cKrG0JyypF+RCA+q2X8QDxEkarjB/JQ0egU7oTo=;
        b=UJlfFTyX49ALWEN+/CZVXeKMOUPk504qadt/PkSQ2fa2Tf7xWBj4EzgCspRTAaSnhr
         /bjg9NBzEXu+ZIBDLudENs77S8dc1PJDCahRF+KjSwYMWECMzNkaICd03os7/uBioanT
         0TEyWT/3GdCE8CkOo4rSP8lhrdlJiWfM3siKbRpvxqtSQ8s6qccKQ3oYOHN4dIb3utqy
         7nWlTAHXy2aw89V8MYAmXwPVX58v+0YMOI4Nx6WaPIfYs9FwN1Kum4KlsQCy0sgcDS8R
         i7rC3uivqELz0ZcQx2Ef5Xtneu9butrx4ARbQArdQHLQAT+hKEDSIv9t4MzYcAsZPy+K
         smxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398803; x=1703003603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9op8cKrG0JyypF+RCA+q2X8QDxEkarjB/JQ0egU7oTo=;
        b=qr4frfzr7vRMUuvk3Q/Nop/b6z8xOpDlZlNkCc7PC2nW47WB2yTlOfYQDgg2zFseyV
         CTn6r3nTeC98UK1ozumV9N4m5JLG2JI6jsXiZMOBCjCWA+2mXH8cQDhionWAUS2Jo+6Z
         xyVjFJ2cFEXIBfxTNmiOLognA9/Feo4o0vYhRIMTWxCNyDg4kS5VRXoZVeYwOYBSk0wF
         x3la0PTtLxyWNvm7s6ujw+jF1vCtMuMUY4qhwoQtQGTvQJW8yom2QvHvzXyz5XOjwmkU
         xRSSDUdYS3Z2IGb2IWzyKFhxouiBZ84HjFp98kIMGVNfO6BD6nCG1pu3wD63RYdoA86p
         RnWw==
X-Gm-Message-State: AOJu0YytnJH5VsgQZb1Bjbyzt3+1JTXIrxOt1llbMdafyFY6/DNXbDCB
	Ms8jWmnubnBgOR/QYuCV5S0nlI+P
X-Google-Smtp-Source: AGHT+IFM8sVIxOwsMQed6dWF7GPucchYQXs6EPCRdxoPwVV305JmnfVXkblCQVtRYW4o2yBOYddirg==
X-Received: by 2002:a7b:c5cc:0:b0:40c:53d1:4c6 with SMTP id n12-20020a7bc5cc000000b0040c53d104c6mr474119wmk.166.1702398803479;
        Tue, 12 Dec 2023 08:33:23 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id g12-20020a5d46cc000000b003335c061a2asm11202196wrs.33.2023.12.12.08.33.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 08:33:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Anton Johansson <anjo@rev.ng>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Hao Wu <wuhaotsh@google.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 31/33] hw/cpu/a9mpcore: Remove legacy code
Date: Tue, 12 Dec 2023 17:29:31 +0100
Message-ID: <20231212162935.42910-32-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212162935.42910-1-philmd@linaro.org>
References: <20231212162935.42910-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: UpiuTMVsWsi4

Now that all boards set the "cpu-type" property,
the legacy code can be removed.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/cpu/a9mpcore.c      | 8 +++-----
 hw/cpu/cortex_mpcore.c | 8 +++++---
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/cpu/a9mpcore.c b/hw/cpu/a9mpcore.c
index ffdaf392fc..4e2fdb8321 100644
--- a/hw/cpu/a9mpcore.c
+++ b/hw/cpu/a9mpcore.c
@@ -41,12 +41,10 @@ static void a9mp_priv_realize(DeviceState *dev, Error **errp)
     DeviceState *scudev, *gtimerdev, *mptimerdev, *wdtdev;
     SysBusDevice *scubusdev, *gtimerbusdev, *mptimerbusdev, *wdtbusdev;
     Error *local_err = NULL;
-    CPUState *cpu0;
-    Object *cpuobj;
 
-    cpu0 = qemu_get_cpu(0);
-    cpuobj = OBJECT(cpu0);
-    if (strcmp(object_get_typename(cpuobj), ARM_CPU_TYPE_NAME("cortex-a9"))) {
+    if (!c->cpu_type) {
+        qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-a9"));
+    } else if (strcmp(c->cpu_type, ARM_CPU_TYPE_NAME("cortex-a9"))) {
         /* We might allow Cortex-A5 once we model it */
         error_setg(errp,
                    "Cortex-A9MPCore peripheral can only use Cortex-A9 CPU");
diff --git a/hw/cpu/cortex_mpcore.c b/hw/cpu/cortex_mpcore.c
index 65309636d7..c5de6c3ae4 100644
--- a/hw/cpu/cortex_mpcore.c
+++ b/hw/cpu/cortex_mpcore.c
@@ -57,6 +57,11 @@ static void cortex_mpcore_priv_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (!s->cpu_type) {
+        error_setg(errp, "'cpu-type' property is not set");
+        return;
+    }
+
     qdev_prop_set_uint32(gicdev, "num-cpu", s->num_cores);
     qdev_prop_set_uint32(gicdev, "num-irq", s->gic_spi_num);
     if (k->gic_priority_bits) {
@@ -85,9 +90,6 @@ static void cortex_mpcore_priv_realize(DeviceState *dev, Error **errp)
 
 
     /* CPU */
-    if (!s->cpu_type) {
-        return;
-    }
     for (int i = 0; i < s->num_cores; i++) {
         Object *cpuobj;
 
-- 
2.41.0
