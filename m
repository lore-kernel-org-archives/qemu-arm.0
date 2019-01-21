Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6399049wrt;
        Mon, 21 Jan 2019 11:17:24 -0800 (PST)
X-Google-Smtp-Source: ALg8bN555bcDRDLxe1GxLTvaMRgd27LoJBwm9BGnHh+qYzYV+RmgX/RvWg6cbDFSDdR++lydMOvz
X-Received: by 2002:a05:6000:104b:: with SMTP id c11mr30080282wrx.303.1548098244776;
        Mon, 21 Jan 2019 11:17:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548098244; cv=none;
        d=google.com; s=arc-20160816;
        b=BI6efBOoZZPKon4rhY6XH7hjYhLefaAg/R8PMRucDRU3iuOQgJ8Q+dvAM9q7rOgh52
         kx1ZLjmJ0QQxixWIG3n0BkDCMxkQKcQlwXrzdGTJBgYvpm/AEGCrrjOAI+PMehTnRskf
         DX26a8+CVwjqRFAeyn9PoVlen/GC6FvLV4aRQNyk1RILr304fycnTXqrcukNFGGeZf7W
         /889X4SCiDjk3J7b6QM+ywsV0zKyOvclUDJ/CBej9169z/FSXKNH8yxPc/oZEHLsOh3P
         /Rtt8V7UarG1h5ezp2srd3Lw6if+S0QCdguB2YZp/QRUsEeMOjzG0F67yuU9mXTQqh5E
         1bYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=16YcVXkNI0qZQIE9OU/93mNUdU9hbKw0nKOMHfNAYQc=;
        b=ApiAnqHs84rbi/bphrIZ75G/o6CjNZNI07UP5g7QxJRuE/9WS1S41upWGASPHAy3SI
         rOpzSzYiPA9XxdII+J6jDV/0ZFUi9zG0iirmrHWPLdFbXfcbZdVgzcXU6rK4/3aHot3r
         Lm+5neFqXd+IYD9ArwSLx219Jr0gTwCd8J+MrjJ7kAdWcfuFqJBOovfqEcPzDt7pVpDW
         gxCVQEtAmVN0wl4ZAU1+s5AxwmyMmGQnHgITldVYR27fdqaSXM1X0TB5XLua6h1nBE6H
         qrLCtz0Rrj1+vNnVT+huhQlumWvbo7wagL3CtNdUYCmfqy4E4yKP4jbecr1/u2GHI1FO
         gr6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RRyB9+r1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q62si5551740wme.179.2019.01.21.11.17.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 11:17:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RRyB9+r1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58470 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glf4V-0007j2-Ph
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 14:17:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39518)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glevR-0008OY-QE
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 14:08:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gleff-0002tv-Jc
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 13:51:47 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:34467)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gleff-0002rC-8a
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 13:51:43 -0500
Received: by mail-wr1-x443.google.com with SMTP id j2so24705747wrw.1
	for <qemu-arm@nongnu.org>; Mon, 21 Jan 2019 10:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=16YcVXkNI0qZQIE9OU/93mNUdU9hbKw0nKOMHfNAYQc=;
	b=RRyB9+r1E4aTDZK4X/LljGD24LU6DFmbEl+Dgrb40u5v9tttO5ToKm4rgdX2rqxkva
	MG4hVDu6AjK+kHLE+cm/K6IFt8oEkvGIwAGAzFvNk7hRCsCneFHVaitePfhvv+SIVwJ+
	tLGN+7vZBz4ooX1E2WevPKd7kr9YEsQyHzccw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=16YcVXkNI0qZQIE9OU/93mNUdU9hbKw0nKOMHfNAYQc=;
	b=ULDv95dXQzXpyls1pKr/ehBGsPJPFucHAZYsulyyZycHgBHN9Iy6Q6TGlpTYPAq7sH
	JEDtQt+GQTOzMVia/sOGz7UUPWrftE3Dczg5mraIdNV5Tk4cQ5drkfplE7k3n0bL86m4
	1xxzXLG8fe8BAe4L6wtbEP9W2YCpUjxXQRxpBATSixoNrfsR3UyT3+dB7l9VFJ1N/0Oo
	uOTyCPS0NU2A8lt1Qt3HEUNX+2y8diN6vrYpSI58KsC+ewIXHKrjSrBk3LlY8dqMpSVc
	d5aaXPrXru5dQtf3mwxMR2nssxW9r7qfxzLBIV2tugqPDkgAfQ9is6fByEv9k2gBO0dy
	cFqQ==
X-Gm-Message-State: AJcUukdV4+A4JFJsTEAJg4Zilfx6EdY3Px8A1JuVIOfDzvr0SQjn4gO6
	4Csx4xv1e3zfVQ4mUPh8bpWOhDmxn1ZVYw==
X-Received: by 2002:a5d:568c:: with SMTP id f12mr27701887wrv.101.1548096700023;
	Mon, 21 Jan 2019 10:51:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	n82sm50386660wma.42.2019.01.21.10.51.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Jan 2019 10:51:39 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 21 Jan 2019 18:51:12 +0000
Message-Id: <20190121185118.18550-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190121185118.18550-1-peter.maydell@linaro.org>
References: <20190121185118.18550-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-arm] [PATCH 17/23] hw/arm/armsse: Add unimplemented-device
 stub for cache control registers
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1Legzq0mVps5

The SSE-200 gives each CPU a register bank to use to control its
L1 instruction cache. Put in an unimplemented-device stub for this.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armsse.h |  1 +
 hw/arm/armsse.c         | 39 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 9855ec5f269..9d830057d5c 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -150,6 +150,7 @@ typedef struct ARMSSE {
 
     UnimplementedDeviceState mhu[2];
     UnimplementedDeviceState ppu[NUM_PPUS];
+    UnimplementedDeviceState cachectrl[SSE_MAX_CPUS];
 
     /*
      * 'container' holds all devices seen by all CPUs.
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 280ba5c78be..41e4a781e11 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -32,6 +32,7 @@ struct ARMSSEInfo {
     SysConfigFormat sys_config_format;
     bool has_mhus;
     bool has_ppus;
+    bool has_cachectrl;
 };
 
 static const ARMSSEInfo armsse_variants[] = {
@@ -43,6 +44,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .sys_config_format = IoTKitFormat,
         .has_mhus = false,
         .has_ppus = false,
+        .has_cachectrl = false,
     },
 };
 
@@ -290,6 +292,16 @@ static void armsse_init(Object *obj)
             g_free(name);
         }
     }
+    if (info->has_cachectrl) {
+        for (i = 0; i < info->num_cpus; i++) {
+            char *name = g_strdup_printf("cachectrl%d", i);
+
+            sysbus_init_child_obj(obj, name, &s->cachectrl[i],
+                                  sizeof(s->cachectrl[i]),
+                                  TYPE_UNIMPLEMENTED_DEVICE);
+            g_free(name);
+        }
+    }
     object_initialize_child(obj, "nmi-orgate", &s->nmi_orgate,
                             sizeof(s->nmi_orgate), TYPE_OR_IRQ,
                             &error_abort, NULL);
@@ -795,7 +807,32 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     qdev_connect_gpio_out(DEVICE(&s->ppc_irq_orgate), 0,
                           armsse_get_common_irq_in(s, 10));
 
-    /* 0x40010000 .. 0x4001ffff: private CPU region: unused in IoTKit */
+    /*
+     * 0x40010000 .. 0x4001ffff (and the 0x5001000... secure-only alias):
+     * private per-CPU region (all these devices are SSE-200 only):
+     *  0x50010000: L1 icache control registers
+     *  0x50011000: CPUSECCTRL (CPU local security control registers)
+     *  0x4001f000 and 0x5001f000: CPU_IDENTITY register block
+     */
+    if (info->has_cachectrl) {
+        for (i = 0; i < info->num_cpus; i++) {
+            char *name = g_strdup_printf("cachectrl%d", i);
+            MemoryRegion *mr;
+
+            qdev_prop_set_string(DEVICE(&s->cachectrl[i]), "name", name);
+            g_free(name);
+            qdev_prop_set_uint64(DEVICE(&s->cachectrl[i]), "size", 0x1000);
+            object_property_set_bool(OBJECT(&s->cachectrl[i]), true,
+                                     "realized", &err);
+            if (err) {
+                error_propagate(errp, err);
+                return;
+            }
+
+            mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->cachectrl[i]), 0);
+            memory_region_add_subregion(&s->cpu_container[i], 0x50010000, mr);
+        }
+    }
 
     /* 0x40020000 .. 0x4002ffff : ARMSSE system control peripheral region */
     /* Devices behind APB PPC1:
-- 
2.20.1

