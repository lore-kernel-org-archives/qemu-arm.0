Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp900191lfb;
        Tue, 12 May 2020 00:02:45 -0700 (PDT)
X-Google-Smtp-Source: APiQypIQEDxT8fem22h6W47/M5QkpVmHwxvKyr842K/2CNbzWoFA9Z3YjddQaXDFDQVxnN1jy5X1
X-Received: by 2002:a37:dc6:: with SMTP id 189mr8227683qkn.279.1589266965135;
        Tue, 12 May 2020 00:02:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589266965; cv=none;
        d=google.com; s=arc-20160816;
        b=oT5e4u9vxjv7gYbL6Mi/5u5x7eFlL18q5Vu1vsA+2uDrTS1+IE8FRKsMG9qpE2Mpvc
         OXYZEJH1zWt5/2oIQc6B7YPfYPo0qm79MMDqHECVnWTzcvZNeeySb5K2frg9rEgCBjJj
         q0XvZk1lfVMBqxAQzuZCc80Y6nI09rZYr9U5FPo0rmRHYKPIZUWA0fUlDTZVHL/6l9eA
         1Vm4y70Xsaj9EJ/LDqHELDUO2TbktWb4Qu1ZhU5HZUawjAuu0tONwCfZN9ChtvNahs9W
         gZObSSdq/KCtZVbfLBl2or1TcLjxtXfSWuytxdJq5hBUaJwjjuPFlZ8aqixwk/6UXdvg
         YBTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=txIDyB7XC8tZKLfnlalgGrEM/4fVGjUtnwmnJEocRGA=;
        b=c5YQ5c3tF+JbXYJhy0yphlcxMalx4ithM+1i8bqpvN0lxJ/fp+LmdyPZqQmWTOfUnu
         rQeLCq9l9YqHU5Hfccnae7j8OYnoNZrbUjlVyJzCgOYkKxly4lnDQpCGwS4vwWziPbJx
         qdyLvyG0Ie2V+7qd5f+eZ37+o2bT7RiVZ0/ERZyhImRupeHz34GK4GhH4PcivKdK4kcs
         xl4oNSnwYvFqr8/iKEWf26LN2lWsU7LSjHnTqBBI3clIyc6thSlJ80zgBYin3MeY0+KR
         eZzAEJgGQLZaWuFcddCVQBMz5rzxKqWQ21LX+3U+KoqMFkzPdomg30XkvGxJN1hw5LDI
         vB/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BUmdZMez;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e21si1518349qta.230.2020.05.12.00.02.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 00:02:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BUmdZMez;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:52080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYOw8-00063k-IE
	for alex.bennee@linaro.org; Tue, 12 May 2020 03:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jYOu4-00046Y-Ez; Tue, 12 May 2020 03:00:36 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:35379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jYOu3-0005cq-Bx; Tue, 12 May 2020 03:00:36 -0400
Received: by mail-wm1-x32f.google.com with SMTP id n5so7077482wmd.0;
 Tue, 12 May 2020 00:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=txIDyB7XC8tZKLfnlalgGrEM/4fVGjUtnwmnJEocRGA=;
 b=BUmdZMezX1+Z5MKQa9G7TP6V/232cCpjbA6TQUHmvPfH6RjhjqjWRwVYH/NFRReXvh
 R/9gEFCAIepjicSrtqaLV3k3jM6FT7+u3R6Jgbff7mLr4eQ/aBT4AjbxdGFxKeOHpE/1
 OZctIeOuzbH5ZIseuZ9mjbtL/MqFJqOqFCURnWNrhoCkYfZaPKM8WOWYNosQlpCwcCrB
 U0Ggsy3SBNsNOr0lb5CAQ/EoGyxjvqWAWIpkg7DvEb9/NLTd9xXqqnZoMwGzGB5qI966
 3XiAONBjxmg2n1UcePsLclE2GhSywWgJtcmSpEBGdsDWHr7kmFCFWNh57w/5tZT3kg85
 ZkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=txIDyB7XC8tZKLfnlalgGrEM/4fVGjUtnwmnJEocRGA=;
 b=jN0KN+8H5ebmW7d5MXNVhI8QxDZ+ldTQ8pS7CP9dLrX+aI2o0Nf3Nsyjlha8PqnF2e
 GnSy+YJIiPUouTj2RUHK9Sc0AdF5n2jI5QMO0BzgKlMpw9uZV2XqVjt5ds3TTcZN3t/c
 Tz2FB3ztC8q4aJQ/hxthgn0rMRg162QWVngiVvhBweIYcvnnjnAa6aO6QVa1H1/oWCRV
 kqAdFHdd1RA1WAf6lIxj1A1h7a6quzSSOY8kxLFb5igeQ8fIUK5aXMxNgJ7IY75Wl9Fn
 QrFNYn4yMyjCv5LeFeh54Eq6smma7TgaQN8AYAaOcnab0+t1w1BRaTuxbwk9W2J0mnLx
 dv4Q==
X-Gm-Message-State: AGi0Pub1FOhfRESVRU5RELerXAV65Bgathdrt3OqpMJA9SsEfXtncIs7
 rgZU6FWrNJNoCpxG6p6sZzND3PT+Dwwdgg==
X-Received: by 2002:a7b:cb86:: with SMTP id m6mr33504111wmi.64.1589266831768; 
 Tue, 12 May 2020 00:00:31 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id i17sm30322243wml.23.2020.05.12.00.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 00:00:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] various: Remove unnecessary OBJECT() cast
Date: Tue, 12 May 2020 09:00:19 +0200
Message-Id: <20200512070020.22782-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200512070020.22782-1-f4bug@amsat.org>
References: <20200512070020.22782-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t7H7XMipOqdu

The OBJECT() macro is defined as:

  #define OBJECT(obj) ((Object *)(obj))

Remove the unnecessary OBJECT() casts when we already know the
pointer is of Object type.

Patch created mechanically using spatch with this script:

  @@
  typedef Object;
  Object *o;
  @@
  -   OBJECT(o)
  +   o

Acked-by: Cornelia Huck <cohuck@redhat.com>
Acked-by: Corey Minyard <cminyard@mvista.com>
Acked-by: John Snow <jsnow@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index ede056b3ef..4132286db7 100644
--- a/hw/s390x/sclp.c
+++ b/hw/s390x/sclp.c
@@ -322,7 +322,7 @@ void s390_sclp_init(void)
 
     object_property_add_child(qdev_get_machine(), TYPE_SCLP, new,
                               NULL);
-    object_unref(OBJECT(new));
+    object_unref(new);
     qdev_init_nofail(DEVICE(new));
 }
 
diff --git a/monitor/misc.c b/monitor/misc.c
index 9723b466cd..f5207cd242 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -1837,8 +1837,7 @@ void object_add_completion(ReadLineState *rs, int nb_args, const char *str)
 static int qdev_add_hotpluggable_device(Object *obj, void *opaque)
 {
     GSList **list = opaque;
-    DeviceState *dev = (DeviceState *)object_dynamic_cast(OBJECT(obj),
-                                                          TYPE_DEVICE);
+    DeviceState *dev = (DeviceState *)object_dynamic_cast(obj, TYPE_DEVICE);
 
     if (dev == NULL) {
         return 0;
diff --git a/qom/object.c b/qom/object.c
index be700e831f..07c1443d0e 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -762,7 +762,7 @@ Object *object_new_with_propv(const char *typename,
         }
     }
 
-    object_unref(OBJECT(obj));
+    object_unref(obj);
     return obj;
 
  error:
@@ -1687,7 +1687,7 @@ void object_property_add_child(Object *obj, const char *name,
         return;
     }
 
-    type = g_strdup_printf("child<%s>", object_get_typename(OBJECT(child)));
+    type = g_strdup_printf("child<%s>", object_get_typename(child));
 
     op = object_property_add(obj, name, type, object_get_child_property, NULL,
                              object_finalize_child_property, child, &local_err);
-- 
2.21.3

