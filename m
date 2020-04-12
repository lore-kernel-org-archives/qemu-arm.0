Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3083250lfm;
        Sun, 12 Apr 2020 14:13:34 -0700 (PDT)
X-Google-Smtp-Source: APiQypIOj7zMBSAXyP7cvdfTqMZ00yYO6nbPICf2EvNPDuAt5OnfOMOKv7T0+t2IUTBsN6ViEhKy
X-Received: by 2002:a05:6214:434:: with SMTP id a20mr14848752qvy.80.1586726014430;
        Sun, 12 Apr 2020 14:13:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586726014; cv=none;
        d=google.com; s=arc-20160816;
        b=ZFctwzik/iahcQu2WZSa8ZBjScukCOdrQdQ800+iUfswR//rWWR58pquRBXCiGPU7k
         0NtBDi3ImKrZ7FFM8AD9zlxXvHwdcKxxgsK2Kgc9Mz0eRkD8EENhLqo9/itEDQeEAat9
         3Ofletb1/kLDECaem5ZYX0VYaNthsFBUKqnwz91tmRrU5bIaGqVwslM/mRBTg3DbZxW+
         kw8k+jwg3mBu13VaAtppwogGFedm1XZDWFBVP5QwgjWvd+N4783AVMSYPnTZ0ehz3TnO
         w9slpg4/wnH7ye5j9BO544PP+RXovoxuGd/hk20fB/yCAsIjhl8oLqDZB3GJv48yLoIZ
         oIgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gsYbEjd4TD9Bp8EbfBEbuZbEWy++c7aKNJLdJ3YG81s=;
        b=jARqf2JOhUymhbL/NAS5rIzDBZj7CI54Y+O+3Isz28734VG7PvgpDoYbX7qlu/d9Br
         5+dt0Zynvf2BH4bCGBX+KIM2A5xoMq2Z0SgCmOvEUbFrQPVu2KxoX6NrNRIx32wXnDhh
         d3wqF1yjAs9tGqtgT30YOCUrrT/7aOqsYJF6b205Tb+BSlHNWx4tA1VHjrO1GwE5GnoG
         pbGZykj25ZW03m7sXaRjqoGQmi3EoCPl5eEJwhaSOB+peivyUbbPGv3yIq0UJobDPbL7
         fFuSClFd90jbPerkyxgOYCESyanKRkKwmplwbpqDhRU62ebccd257dQvpRMmVczbXbVm
         RTOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=F6MwD2LX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z36si4828692qta.279.2020.04.12.14.13.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Apr 2020 14:13:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=F6MwD2LX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:37072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jNjv3-0004g8-T7
	for alex.bennee@linaro.org; Sun, 12 Apr 2020 17:13:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41018)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNjrm-0008JY-4s
 for qemu-devel@nongnu.org; Sun, 12 Apr 2020 17:10:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNjrk-00057e-PW
 for qemu-devel@nongnu.org; Sun, 12 Apr 2020 17:10:10 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:39879)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNjrk-00057D-Id; Sun, 12 Apr 2020 17:10:08 -0400
Received: by mail-wr1-x444.google.com with SMTP id p10so8395505wrt.6;
 Sun, 12 Apr 2020 14:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gsYbEjd4TD9Bp8EbfBEbuZbEWy++c7aKNJLdJ3YG81s=;
 b=F6MwD2LXNz5qSiQ9U7sN6titbvBTVPwW+WPnxAgReHxGMCEM+dPMLI2rDyI1SBuexA
 8X4en7LsPicU3CvVdJfUwpaYkWQJx/9JDE36m/vCG9tt4oNnclZvSGLtxDh9g2nqvVen
 egUlGG7jm5W4bkUTTQyk2IrVD5095MR2BaBB1nrA2tWvi4Uo2j7P5Aid8G1fMkGhrHgp
 3JcUjkFFHKzGHqOa5WPhvPjQa5uJtWQqbZ7u6YajqffuNp4Y4eS18QQqe3TejYDaLL/v
 NSSfd4k/Trj0zKPV1XsX0isvHEDohvQeLjdKEdbJp37tNHLfgAKiMGDBvJ9cRKFn6wia
 3pRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gsYbEjd4TD9Bp8EbfBEbuZbEWy++c7aKNJLdJ3YG81s=;
 b=ArWyfHRZPAWK9h68e1cyJtyuxs3WN0twd0bVZ6SJ0DsusELTLoaK2eVoFoi4ye0M/3
 HoMR/rZaxM0svsmG9axEJgdKYcmrTSSFRn1KFYCj9p/oRcUY6joEW8bpuI9YxsalDrQZ
 vl6we4kfIgnyCLXGNXHnWV74ELBik2m90HpDa+Y34RH4+gPYrjrIiZ44XmLAvykvtCEA
 v+d5sJ108/8kLvgB0be6jATURXYfN2U1b2I1TTa1TSvHzOc2Spt1ccARSSGKIKqNo+Im
 0Ihjpjqk/oooHKczmTEg46N4R4pTtsEPG5wqVP5useK5LXBdbbydKCtqGDrD+OdmLRpk
 tYig==
X-Gm-Message-State: AGi0PualaK9JG7tpUVY5zswJBLy8zZT4MCZaS2hyd9drKVYDhunYgGdF
 txNXMp6tAM1ZMwNwJtlahvALPwtPRh8=
X-Received: by 2002:a5d:69c9:: with SMTP id s9mr15764392wrw.307.1586725806483; 
 Sun, 12 Apr 2020 14:10:06 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id o16sm12553602wrs.44.2020.04.12.14.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 14:10:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 2/3] various: Remove unnecessary OBJECT() cast
Date: Sun, 12 Apr 2020 23:09:53 +0200
Message-Id: <20200412210954.32313-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412210954.32313-1-f4bug@amsat.org>
References: <20200412210954.32313-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1wyASZDbpOKb

The OBJECT() macro is defined as:

  #define OBJECT(obj) ((Object *)(obj))

Remove unnecessary OBJECT() casts.

Patch created mechanically using spatch with this script:

  @@
  typedef Object;
  Object *o;
  @@
  -   OBJECT(o)
  +   o

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/bus.c                       | 2 +-
 hw/ide/ahci-allwinner.c             | 2 +-
 hw/ipmi/smbus_ipmi.c                | 2 +-
 hw/microblaze/petalogix_ml605_mmu.c | 8 ++++----
 hw/s390x/sclp.c                     | 2 +-
 monitor/misc.c                      | 3 +--
 qom/object.c                        | 4 ++--
 7 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/hw/core/bus.c b/hw/core/bus.c
index 3dc0a825f0..4ea5870de8 100644
--- a/hw/core/bus.c
+++ b/hw/core/bus.c
@@ -25,7 +25,7 @@
 
 void qbus_set_hotplug_handler(BusState *bus, Object *handler, Error **errp)
 {
-    object_property_set_link(OBJECT(bus), OBJECT(handler),
+    object_property_set_link(OBJECT(bus), handler,
                              QDEV_HOTPLUG_HANDLER_PROPERTY, errp);
 }
 
diff --git a/hw/ide/ahci-allwinner.c b/hw/ide/ahci-allwinner.c
index bb8393d2b6..8536b9eb5a 100644
--- a/hw/ide/ahci-allwinner.c
+++ b/hw/ide/ahci-allwinner.c
@@ -90,7 +90,7 @@ static void allwinner_ahci_init(Object *obj)
     SysbusAHCIState *s = SYSBUS_AHCI(obj);
     AllwinnerAHCIState *a = ALLWINNER_AHCI(obj);
 
-    memory_region_init_io(&a->mmio, OBJECT(obj), &allwinner_ahci_mem_ops, a,
+    memory_region_init_io(&a->mmio, obj, &allwinner_ahci_mem_ops, a,
                           "allwinner-ahci", ALLWINNER_AHCI_MMIO_SIZE);
     memory_region_add_subregion(&s->ahci.mem, ALLWINNER_AHCI_MMIO_OFF,
                                 &a->mmio);
diff --git a/hw/ipmi/smbus_ipmi.c b/hw/ipmi/smbus_ipmi.c
index 2a9470d9df..f1a0148755 100644
--- a/hw/ipmi/smbus_ipmi.c
+++ b/hw/ipmi/smbus_ipmi.c
@@ -329,7 +329,7 @@ static void smbus_ipmi_init(Object *obj)
 {
     SMBusIPMIDevice *sid = SMBUS_IPMI(obj);
 
-    ipmi_bmc_find_and_link(OBJECT(obj), (Object **) &sid->bmc);
+    ipmi_bmc_find_and_link(obj, (Object **) &sid->bmc);
 }
 
 static void smbus_ipmi_get_fwinfo(struct IPMIInterface *ii, IPMIFwInfo *info)
diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index 0a2640c40b..52dcea9abd 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -150,9 +150,9 @@ petalogix_ml605_init(MachineState *machine)
     qdev_set_nic_properties(eth0, &nd_table[0]);
     qdev_prop_set_uint32(eth0, "rxmem", 0x1000);
     qdev_prop_set_uint32(eth0, "txmem", 0x1000);
-    object_property_set_link(OBJECT(eth0), OBJECT(ds),
+    object_property_set_link(OBJECT(eth0), ds,
                              "axistream-connected", &error_abort);
-    object_property_set_link(OBJECT(eth0), OBJECT(cs),
+    object_property_set_link(OBJECT(eth0), cs,
                              "axistream-control-connected", &error_abort);
     qdev_init_nofail(eth0);
     sysbus_mmio_map(SYS_BUS_DEVICE(eth0), 0, AXIENET_BASEADDR);
@@ -163,9 +163,9 @@ petalogix_ml605_init(MachineState *machine)
     cs = object_property_get_link(OBJECT(eth0),
                                   "axistream-control-connected-target", NULL);
     qdev_prop_set_uint32(dma, "freqhz", 100 * 1000000);
-    object_property_set_link(OBJECT(dma), OBJECT(ds),
+    object_property_set_link(OBJECT(dma), ds,
                              "axistream-connected", &error_abort);
-    object_property_set_link(OBJECT(dma), OBJECT(cs),
+    object_property_set_link(OBJECT(dma), cs,
                              "axistream-control-connected", &error_abort);
     qdev_init_nofail(dma);
     sysbus_mmio_map(SYS_BUS_DEVICE(dma), 0, AXIDMA_BASEADDR);
diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
index f0c35aa57a..bae9d2350f 100644
--- a/hw/s390x/sclp.c
+++ b/hw/s390x/sclp.c
@@ -288,7 +288,7 @@ void s390_sclp_init(void)
 
     object_property_add_child(qdev_get_machine(), TYPE_SCLP, new,
                               NULL);
-    object_unref(OBJECT(new));
+    object_unref(new);
     qdev_init_nofail(DEVICE(new));
 }
 
diff --git a/monitor/misc.c b/monitor/misc.c
index 6c45fa490f..57af5fa5a4 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -1839,8 +1839,7 @@ void object_add_completion(ReadLineState *rs, int nb_args, const char *str)
 static int qdev_add_hotpluggable_device(Object *obj, void *opaque)
 {
     GSList **list = opaque;
-    DeviceState *dev = (DeviceState *)object_dynamic_cast(OBJECT(obj),
-                                                          TYPE_DEVICE);
+    DeviceState *dev = (DeviceState *)object_dynamic_cast(obj, TYPE_DEVICE);
 
     if (dev == NULL) {
         return 0;
diff --git a/qom/object.c b/qom/object.c
index 1812f79224..9893cc5459 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -762,7 +762,7 @@ Object *object_new_with_propv(const char *typename,
         }
     }
 
-    object_unref(OBJECT(obj));
+    object_unref(obj);
     return obj;
 
  error:
@@ -1689,7 +1689,7 @@ void object_property_add_child(Object *obj, const char *name,
         return;
     }
 
-    type = g_strdup_printf("child<%s>", object_get_typename(OBJECT(child)));
+    type = g_strdup_printf("child<%s>", object_get_typename(child));
 
     op = object_property_add(obj, name, type, object_get_child_property, NULL,
                              object_finalize_child_property, child, &local_err);
-- 
2.21.1

