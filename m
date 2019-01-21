Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6399410wrt;
        Mon, 21 Jan 2019 11:17:53 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4qv7j9/08HcPrrXcPN3vs2pKfhm//XjTdhRI0mh4GKkS3eRm/nmL3tapJLbkz0oy2dX5LV
X-Received: by 2002:a5d:4250:: with SMTP id s16mr29664591wrr.253.1548098273487;
        Mon, 21 Jan 2019 11:17:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548098273; cv=none;
        d=google.com; s=arc-20160816;
        b=DkHdLiFF9Yv12CEN7556wh234NU+xFg/nJuU6oTItLNmbwdFd46gb7i5pgN5b5EbeO
         qI+6bAm610fss+efzQ4VETyh3/VWB7vkrwMfZI4j/8A+gBVofpD7LImhbxy6k8WRkv0s
         te3ghWLYTNT5JCkc8TLdLOfUCB78dPYiFPxlWa883DUhp7VNrUVnKnPRBBXj2tXvx3xK
         t1BLCnUgdHm7qmqKzMsxGUMfl75TCQiyyi0p9Jzj1odQhayM1HKS+yefO3eYbHCGvJjM
         8H9MLdWRWgNGqYZ4Tgeyy5o8wKVibixldkVgsXMFXREzBuVVWnTrGfCLAuvzKh5TqUSI
         vp2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=5oXNf8YbRJ27W92QaQUg2Jg/rlBLxD7V8QWz6bSn8Tg=;
        b=T44geqaKiXookKjE5Ss2EHhOsoJuBeRZDbyBVnzWuC3iU4izG3SfnhzPIIdIO2hxbL
         eOWiwR+Aae4M2RCslWV63v2b6SWnnt31O++yyJQL5jnCFDpYhneVtkeQrZOdD34ABtIe
         r4kz0fNH3UW2Puo00xmi9p+wKaWuvT4L44yXyvsZ4CQsOwrKv9FmjH86SEvJ6JVVpCfM
         DWmP+aQjthdnnI1hXLgdeX6JttZU8yUvmJT30phSXWvicPO5MFWEGGVnqyMJbBLwZJAt
         hISqH8ec5CtrpWK/bLfWJZ65Rn+X+x5G74bhWIzDkg6xfu1V8lNY5hwYErtDV6DbdLlA
         CXSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NMEiUA6j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p12si65421179wru.276.2019.01.21.11.17.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 11:17:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NMEiUA6j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58477 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glf4y-00082z-Ci
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 14:17:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glevS-0008OH-TI
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 14:08:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gleff-0002sw-7C
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 13:51:44 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:46216)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1glefe-0002rt-OT
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 13:51:42 -0500
Received: by mail-wr1-x441.google.com with SMTP id l9so24546233wrt.13
	for <qemu-arm@nongnu.org>; Mon, 21 Jan 2019 10:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5oXNf8YbRJ27W92QaQUg2Jg/rlBLxD7V8QWz6bSn8Tg=;
	b=NMEiUA6jC+0+m1CiYmjfyxKZWyJRx0xr6H4P9drgvZ5QPfqBhY/BKSqZk/IPbrU/Xf
	OGNPviQ/5fYaPqA18k0svK4vT1RQaKgBapMB2EvRQiEnTxO/pZJ0pETAcz0p12JMtNLg
	bx580M/WbdelgqUl1aoX8/tCqBjJSdjgqtGlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5oXNf8YbRJ27W92QaQUg2Jg/rlBLxD7V8QWz6bSn8Tg=;
	b=a9/7mjPvnnG83e5bXMciFibHfIO82iaK1QQDr3FBU/ztB1kGwq5erb5u1ekpws5d6M
	mSJme5ilWAQFqAwp0xSsHeAMuAjdyJyF4fIXsDUlbqwfOT6pjVxnmXfYeNj0G5yVdYNN
	PedFys/xe4MvlUevuhmWNY/yCpni5r8Ado4jklasUOCZy8bV83DdXZJcCojHGkef9zW5
	IW3O+sRHL99fAE7Yhnyi7nVPsihmKnt1Zged0AuCw+vwQJCVrl/adrrxuxA0/+BMVwNW
	TG1LguC2MaatEzO2kDi8Rp22UIngTTO3aoEbeNBeSJ2vlJQhEVClb52e5cellyzST/qk
	5CrQ==
X-Gm-Message-State: AJcUukfeNOZqoBUvclFHIwk5hmm1RzLvDD5hMk2i+DhHT4YWRu1DjEkn
	FvwngRE2lFZYOK5szVCnSzcBl2DvHwHusw==
X-Received: by 2002:adf:9c01:: with SMTP id f1mr30514330wrc.286.1548096701027; 
	Mon, 21 Jan 2019 10:51:41 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	n82sm50386660wma.42.2019.01.21.10.51.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Jan 2019 10:51:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 21 Jan 2019 18:51:13 +0000
Message-Id: <20190121185118.18550-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190121185118.18550-1-peter.maydell@linaro.org>
References: <20190121185118.18550-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-arm] [PATCH 18/23] hw/arm/armsse: Add unimplemented-device
 stub for CPU local control registers
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
X-TUID: RhISwZrQz86P

The SSE-200 has a "CPU local security control" register bank; add an
unimplemented-device stub for it. (The register bank has only one
interesting register, which allows the guest to lock down changes
to various CPU registers so they cannot be modified further. We
don't support that in our Cortex-M33 model anyway.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armsse.h |  1 +
 hw/arm/armsse.c         | 31 +++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 9d830057d5c..961dbb3032a 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -151,6 +151,7 @@ typedef struct ARMSSE {
     UnimplementedDeviceState mhu[2];
     UnimplementedDeviceState ppu[NUM_PPUS];
     UnimplementedDeviceState cachectrl[SSE_MAX_CPUS];
+    UnimplementedDeviceState cpusecctrl[SSE_MAX_CPUS];
 
     /*
      * 'container' holds all devices seen by all CPUs.
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 41e4a781e11..9c111ac6a40 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -33,6 +33,7 @@ struct ARMSSEInfo {
     bool has_mhus;
     bool has_ppus;
     bool has_cachectrl;
+    bool has_cpusecctrl;
 };
 
 static const ARMSSEInfo armsse_variants[] = {
@@ -45,6 +46,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .has_mhus = false,
         .has_ppus = false,
         .has_cachectrl = false,
+        .has_cpusecctrl = false,
     },
 };
 
@@ -302,6 +304,16 @@ static void armsse_init(Object *obj)
             g_free(name);
         }
     }
+    if (info->has_cpusecctrl) {
+        for (i = 0; i < info->num_cpus; i++) {
+            char *name = g_strdup_printf("cpusecctrl%d", i);
+
+            sysbus_init_child_obj(obj, name, &s->cpusecctrl[i],
+                                  sizeof(s->cpusecctrl[i]),
+                                  TYPE_UNIMPLEMENTED_DEVICE);
+            g_free(name);
+        }
+    }
     object_initialize_child(obj, "nmi-orgate", &s->nmi_orgate,
                             sizeof(s->nmi_orgate), TYPE_OR_IRQ,
                             &error_abort, NULL);
@@ -833,6 +845,25 @@ static void armsse_realize(DeviceState *dev, Error **errp)
             memory_region_add_subregion(&s->cpu_container[i], 0x50010000, mr);
         }
     }
+    if (info->has_cpusecctrl) {
+        for (i = 0; i < info->num_cpus; i++) {
+            char *name = g_strdup_printf("CPUSECCTRL%d", i);
+            MemoryRegion *mr;
+
+            qdev_prop_set_string(DEVICE(&s->cpusecctrl[i]), "name", name);
+            g_free(name);
+            qdev_prop_set_uint64(DEVICE(&s->cpusecctrl[i]), "size", 0x1000);
+            object_property_set_bool(OBJECT(&s->cpusecctrl[i]), true,
+                                     "realized", &err);
+            if (err) {
+                error_propagate(errp, err);
+                return;
+            }
+
+            mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->cpusecctrl[i]), 0);
+            memory_region_add_subregion(&s->cpu_container[i], 0x50011000, mr);
+        }
+    }
 
     /* 0x40020000 .. 0x4002ffff : ARMSSE system control peripheral region */
     /* Devices behind APB PPC1:
-- 
2.20.1

