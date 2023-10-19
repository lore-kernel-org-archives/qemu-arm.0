Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp734637ejb;
        Thu, 19 Oct 2023 12:10:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0VzVcX9tA/eyDEiSqclxBLq1H+SwwMvO465ELFCbz7WP4oeULZaqXZbT70luZDNfxDy4O
X-Received: by 2002:a0d:d146:0:b0:5a7:aa7b:cb9f with SMTP id t67-20020a0dd146000000b005a7aa7bcb9fmr2921158ywd.14.1697742626821;
        Thu, 19 Oct 2023 12:10:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697742626; cv=none;
        d=google.com; s=arc-20160816;
        b=pmm59JvJ+NK22dwrUpqw/OnXD4BP9D2P5UOTxsuJN5RVgJYMdtXQNtYJiPDQHzrE9B
         0fiCu1mfnwZEblyViAnkKU8QZW2pC6WdWIOekC4sAlxao788rPXRz1B7uUTNhhWx3c77
         x4c0fMkbcaxByPITn8Stl9mNVHdrxQqtx2r63u1lO8SsCrD4WyxcUesU+PM3VLUbrKvU
         0D6BEEudwy7m6MMCjX2qEidC1UGi2d1mw1vSZ7RvqGGb34aYmNkWy6MsIWF6M7WJIgZx
         uwhYvc8Jey0SlJySU/GDnE19b98MbVTVlWSkcWEneqfn/W3rTOvA4GigbiCy7HO7yuDh
         EvrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BWujscRM8+aWcF0nTSqKgyNKyjeFasRA2h8oLoqgdv8=;
        fh=Xlf3et2nYyn6Dffgqd/l95XMDkc357MJlcbLmxiOqZU=;
        b=CHIbpDRVpuQqzpTWnJ1FSw/B+Jwab46NTecWPw+eYhQOv6Sr4m9p8Tp6oD/ZiS5gJ5
         +jnFXjJC5RM2ICl9lo7HXIl2mGS/orbEEc0ORsroBounW+XlkOU7dTt+qa3YAYYUHtnO
         1GIvh9qubfbI0z5puPahWuyyJ1J5m62vk0lD9AJYVWkU3FoDYWFBfnSaeonRE5uikvWc
         Mw76ebpL4V46qdAe9hiSz1UOTeNeA7JrYZtWE1sB2SYz+8cBwtQnltMFHIT+YxRIR/7Q
         qGHYfkeCoBfQraOqNJj6qoynB8X+wAjJlbe3QZZhgk8cJmTGk8IxyUpOIuSHiOE19faG
         ODkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hvRYapsE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g24-20020a05620a109800b00774067d659csi79394qkk.92.2023.10.19.12.10.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 12:10:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hvRYapsE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtYOc-0007ps-Ok; Thu, 19 Oct 2023 15:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtYOO-0007bN-BE
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 15:09:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtYOL-0003ls-TC
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 15:09:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697742549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BWujscRM8+aWcF0nTSqKgyNKyjeFasRA2h8oLoqgdv8=;
 b=hvRYapsEPNXf676Z4V4/wS5h3VnED3+0OpR6Jlr3M8Q62ynpOtWwssf30geFoALZmhC4NB
 vXiVZDh9vmrTZ2OwDHoVnp1ULXdbFVZrKuOTY0iEhfSGEuqdjC+SXXtKGElvTLA/mpVkOx
 2uU+fuK0MAiZbflIa0KBsfe4/3obWZI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-0BfHBklaNhmTmbzqSSvhQA-1; Thu, 19 Oct 2023 15:08:53 -0400
X-MC-Unique: 0BfHBklaNhmTmbzqSSvhQA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9078710201F4;
 Thu, 19 Oct 2023 19:08:49 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A27781121314;
 Thu, 19 Oct 2023 19:08:44 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Fabiano Rosas <farosas@suse.de>, Eric Farman <farman@linux.ibm.com>,
 Peter Xu <peterx@redhat.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, qemu-arm@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Corey Minyard <minyard@acm.org>, Leonardo Bras <leobras@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Halil Pasic <pasic@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 02/13] migration: Use vmstate_register_any()
Date: Thu, 19 Oct 2023 21:08:20 +0200
Message-ID: <20231019190831.20363-3-quintela@redhat.com>
In-Reply-To: <20231019190831.20363-1-quintela@redhat.com>
References: <20231019190831.20363-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: T+2DmF9Nztid

This are the easiest cases, where we were already using
VMSTATE_INSTANCE_ID_ANY.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 backends/dbus-vmstate.c     | 3 +--
 backends/tpm/tpm_emulator.c | 3 +--
 hw/i2c/core.c               | 2 +-
 hw/input/adb.c              | 2 +-
 hw/input/ads7846.c          | 2 +-
 hw/input/stellaris_input.c  | 3 +--
 hw/net/eepro100.c           | 3 +--
 hw/pci/pci.c                | 2 +-
 hw/ppc/spapr_nvdimm.c       | 3 +--
 hw/timer/arm_timer.c        | 2 +-
 hw/virtio/virtio-mem.c      | 4 ++--
 11 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/backends/dbus-vmstate.c b/backends/dbus-vmstate.c
index 57369ec0f2..a9d8cb0acd 100644
--- a/backends/dbus-vmstate.c
+++ b/backends/dbus-vmstate.c
@@ -426,8 +426,7 @@ dbus_vmstate_complete(UserCreatable *uc, Error **errp)
         return;
     }
 
-    if (vmstate_register(VMSTATE_IF(self), VMSTATE_INSTANCE_ID_ANY,
-                         &dbus_vmstate, self) < 0) {
+    if (vmstate_register_any(VMSTATE_IF(self), &dbus_vmstate, self) < 0) {
         error_setg(errp, "Failed to register vmstate");
     }
 }
diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index 402a2d6312..8920b75251 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -978,8 +978,7 @@ static void tpm_emulator_inst_init(Object *obj)
         qemu_add_vm_change_state_handler(tpm_emulator_vm_state_change,
                                          tpm_emu);
 
-    vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY,
-                     &vmstate_tpm_emulator, obj);
+    vmstate_register_any(NULL, &vmstate_tpm_emulator, obj);
 }
 
 /*
diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index bed594fe59..879a1d45cb 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -64,7 +64,7 @@ I2CBus *i2c_init_bus(DeviceState *parent, const char *name)
     bus = I2C_BUS(qbus_new(TYPE_I2C_BUS, parent, name));
     QLIST_INIT(&bus->current_devs);
     QSIMPLEQ_INIT(&bus->pending_masters);
-    vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY, &vmstate_i2c_bus, bus);
+    vmstate_register_any(NULL, &vmstate_i2c_bus, bus);
     return bus;
 }
 
diff --git a/hw/input/adb.c b/hw/input/adb.c
index 214ae6f42b..8aed0da2cd 100644
--- a/hw/input/adb.c
+++ b/hw/input/adb.c
@@ -247,7 +247,7 @@ static void adb_bus_realize(BusState *qbus, Error **errp)
     adb_bus->autopoll_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL, adb_autopoll,
                                            adb_bus);
 
-    vmstate_register(NULL, -1, &vmstate_adb_bus, adb_bus);
+    vmstate_register_any(NULL, &vmstate_adb_bus, adb_bus);
 }
 
 static void adb_bus_unrealize(BusState *qbus)
diff --git a/hw/input/ads7846.c b/hw/input/ads7846.c
index dc0998ac79..91116c6bdb 100644
--- a/hw/input/ads7846.c
+++ b/hw/input/ads7846.c
@@ -158,7 +158,7 @@ static void ads7846_realize(SSIPeripheral *d, Error **errp)
 
     ads7846_int_update(s);
 
-    vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY, &vmstate_ads7846, s);
+    vmstate_register_any(NULL, &vmstate_ads7846, s);
 }
 
 static void ads7846_class_init(ObjectClass *klass, void *data)
diff --git a/hw/input/stellaris_input.c b/hw/input/stellaris_input.c
index e6ee5e11f1..a58721c8cd 100644
--- a/hw/input/stellaris_input.c
+++ b/hw/input/stellaris_input.c
@@ -88,6 +88,5 @@ void stellaris_gamepad_init(int n, qemu_irq *irq, const int *keycode)
     }
     s->num_buttons = n;
     qemu_add_kbd_event_handler(stellaris_gamepad_put_key, s);
-    vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY,
-                     &vmstate_stellaris_gamepad, s);
+    vmstate_register_any(NULL, &vmstate_stellaris_gamepad, s);
 }
diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index dc07984ae9..94ce9e18ff 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -1883,8 +1883,7 @@ static void e100_nic_realize(PCIDevice *pci_dev, Error **errp)
 
     s->vmstate = g_memdup(&vmstate_eepro100, sizeof(vmstate_eepro100));
     s->vmstate->name = qemu_get_queue(s->nic)->model;
-    vmstate_register(VMSTATE_IF(&pci_dev->qdev), VMSTATE_INSTANCE_ID_ANY,
-                     s->vmstate, s);
+    vmstate_register_any(VMSTATE_IF(&pci_dev->qdev), s->vmstate, s);
 }
 
 static void eepro100_instance_init(Object *obj)
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index b0d21bf43a..294c3c38ea 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -147,7 +147,7 @@ static void pci_bus_realize(BusState *qbus, Error **errp)
     bus->machine_done.notify = pcibus_machine_done;
     qemu_add_machine_init_done_notifier(&bus->machine_done);
 
-    vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY, &vmstate_pcibus, bus);
+    vmstate_register_any(NULL, &vmstate_pcibus, bus);
 }
 
 static void pcie_bus_realize(BusState *qbus, Error **errp)
diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
index b2f009c816..ad7afe7544 100644
--- a/hw/ppc/spapr_nvdimm.c
+++ b/hw/ppc/spapr_nvdimm.c
@@ -876,8 +876,7 @@ static void spapr_nvdimm_realize(NVDIMMDevice *dimm, Error **errp)
         s_nvdimm->hcall_flush_required = true;
     }
 
-    vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY,
-                     &vmstate_spapr_nvdimm_states, dimm);
+    vmstate_register_any(NULL, &vmstate_spapr_nvdimm_states, dimm);
 }
 
 static void spapr_nvdimm_unrealize(NVDIMMDevice *dimm)
diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 69c8863472..9afe8da831 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -181,7 +181,7 @@ static arm_timer_state *arm_timer_init(uint32_t freq)
     s->control = TIMER_CTRL_IE;
 
     s->timer = ptimer_init(arm_timer_tick, s, PTIMER_POLICY_LEGACY);
-    vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY, &vmstate_arm_timer, s);
+    vmstate_register_any(NULL, &vmstate_arm_timer, s);
     return s;
 }
 
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 9dc3c61b5a..a5ea3be414 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -1119,8 +1119,8 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
     host_memory_backend_set_mapped(vmem->memdev, true);
     vmstate_register_ram(&vmem->memdev->mr, DEVICE(vmem));
     if (vmem->early_migration) {
-        vmstate_register(VMSTATE_IF(vmem), VMSTATE_INSTANCE_ID_ANY,
-                         &vmstate_virtio_mem_device_early, vmem);
+        vmstate_register_any(VMSTATE_IF(vmem),
+                             &vmstate_virtio_mem_device_early, vmem);
     }
     qemu_register_reset(virtio_mem_system_reset, vmem);
 
-- 
2.41.0

