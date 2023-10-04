Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2821301ejb;
        Wed, 4 Oct 2023 10:39:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+C+YVS0b0pT6Mth1CjqSXpMXzFxvm77vnhDutuug/BU4ASkKcUWfX/QjSssWH1tMawnEM
X-Received: by 2002:a05:622a:1c9:b0:418:977:5e1b with SMTP id t9-20020a05622a01c900b0041809775e1bmr3233581qtw.29.1696441140356;
        Wed, 04 Oct 2023 10:39:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696441140; cv=none;
        d=google.com; s=arc-20160816;
        b=ZB2WYmXS0zcXjdVtLTtsxdEPs5zqJkb7A5v3DR5Be3IeNJICLnZObbkDN1NJUbhoUY
         oXO2vc1M7XMIF1UlklXZ0EC00tHwX9ZI8iyiPUK9VB+1ZsDgje7A/oblvUhRNgohF3RC
         Pr3lDeLG8DprqLsXkMTaYerxJ1AmL0py5AEe5lkfOmKvN4m33SkDGdwgrzTjoIQ+GjtB
         4xqJz77ecd2ILurK1IVTF0qf9/EkKbk4/SgXhrOluMngIBI+0K73mHE/QQTBtQI25MIo
         5EvA6FsRUgtxn9njk8v+V+oS4WUmeb1PeDrBZWoYWAmm8t1lzA9j+BiLA4lD3oKkz2bN
         5SUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zxIwwvtSDa6HXj+GPDZLsyAAO0jyEUx+3zbxHDZan+w=;
        fh=Dd8ME34sNf63zqkDkOMoJQjnYNPu6vWev9IExtPan2I=;
        b=EqsegyTfGAHVr3Q0YljZbfX7jxRSa+TULaBgX56BQ4ZLCwXyIYLfIgK6hmC1TkM3nm
         6zodUZSs/DuLuK5i5wer5AH0q30iOpRkH5XO6AKiBd9/Y54gL7xXheW3/D38ysX9EXUX
         7AqE+YKmHF/xjWD8Oj4g3Pr+aoA59YWoP2LU0BsZdqvzmJZjnjIbRUhk27oD73Yd0Md/
         O9vA8x+hFpNbeYcKzUxnWuGITSv+Ld+Ao0ltLOMt/fh3j88DRIhjfMm0FUlAwgEF0qGb
         ut7iePhu0XAaCgU1FXG2rrZPdOrPDqDkjtAjr3ceybEk1LNrauq6HZk7feJpDjWBBZbE
         qiLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JKSryxNa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p10-20020a05622a048a00b004181004e2f4si1693179qtx.729.2023.10.04.10.39.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 10:39:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JKSryxNa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qo5jR-00035b-2b; Wed, 04 Oct 2023 13:32:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qo5jO-00034R-P2
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 13:32:18 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qo5jI-0000rO-AI
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 13:32:16 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-406618d080eso379705e9.2
 for <qemu-arm@nongnu.org>; Wed, 04 Oct 2023 10:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696440729; x=1697045529; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zxIwwvtSDa6HXj+GPDZLsyAAO0jyEUx+3zbxHDZan+w=;
 b=JKSryxNaBE1PTWpdgxnn43dbHu+jRpoFB1yG5VMCSmWw4z3yk0tXX1juZXZNo/Ulv1
 s9aEvPDZnZkNw5xAFne54Ztuyu7C5O9ekC6J46a4d4G1cQIbaPVvR6TuFi2oaGUGyOFk
 VQo9BHG1kq3wXe3Q+yyXMpNzr8/9AKdYyj1IJUxn8lo0en2Zi/JSfZesYlNuLy7PpnRd
 I2l3x0lhI9rfb0XCgD2YbB6qaoyfbb/+NcdVucXiYHnO1fy6rVWm3e2un/XnZ54MtT+b
 tpqnNNAgsByX67YyTJSqj1HOs1C+kYLweA8bgbNxlnRsTHQsQ27DaJaQQfLC1QBBDkLu
 akQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696440729; x=1697045529;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zxIwwvtSDa6HXj+GPDZLsyAAO0jyEUx+3zbxHDZan+w=;
 b=VDGATCOXSWsfl2raYbf8LS7IxIRpAds6sZay3G4ofgpGJEQYQfzEUErSMdRp3qkCz4
 7PhjFwuc8q31x3PP5xd11O1i+gJg2FapWZ4u3T8mtj/hjJOXriy5gDEv4ACv90T71C5b
 Os5h23Sw+6nu9XS5QZw0DyzB/Euiylgg7sdXwBXKWUGiqUN5NPETkRJxE9ot378QRx/4
 PlN4ecQZzW7TCJkwV8hmoY+fCtJF0iJJMSU1ZgFXdbDq3/yzMS093avGva6yDkfODJaF
 9TjCjtnjj+PQnUrs8YmDEvFyWB2zr+WLJdiLY5HunE2igS5i87zPrF/tqprxtYckZkKE
 9I+w==
X-Gm-Message-State: AOJu0Yzs5nKF91rPUo+4YH0hVfvxhNOi81SsyQ23OWuU8Rl4YKm2EJU1
 qcvMIi8CSFSOV3hwmcQOsVe+Rg==
X-Received: by 2002:a7b:c4cb:0:b0:401:cb45:3fb8 with SMTP id
 g11-20020a7bc4cb000000b00401cb453fb8mr2874935wmk.38.1696440729211; 
 Wed, 04 Oct 2023 10:32:09 -0700 (PDT)
Received: from m1x-phil.lan (5ep85-h01-176-173-163-52.dslam.bbox.fr.
 [176.173.163.52]) by smtp.gmail.com with ESMTPSA id
 m15-20020a7bcb8f000000b003fc0505be19sm2002229wmi.37.2023.10.04.10.32.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Oct 2023 10:32:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH 01/21] qapi: Inline and remove QERR_BUS_NO_HOTPLUG definition
Date: Wed,  4 Oct 2023 19:31:36 +0200
Message-ID: <20231004173158.42591-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004173158.42591-1-philmd@linaro.org>
References: <20231004173158.42591-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: okqTyI7EP/+n

Address the comment added in commit 4629ed1e98
("qerror: Finally unused, clean up"), from 2015:

  /*
   * These macros will go away, please don't use
   * in new code, and do not add new ones!
   */

Mechanical transformation using sed, manually
removing the definition in include/qapi/qmp/qerror.h.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qapi/qmp/qerror.h | 3 ---
 hw/ppc/spapr_pci.c        | 4 ++--
 softmmu/qdev-monitor.c    | 8 +++++---
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
index 8dd9fcb071..1a9c2d3502 100644
--- a/include/qapi/qmp/qerror.h
+++ b/include/qapi/qmp/qerror.h
@@ -17,9 +17,6 @@
  * add new ones!
  */
 
-#define QERR_BUS_NO_HOTPLUG \
-    "Bus '%s' does not support hotplugging"
-
 #define QERR_DEVICE_HAS_NO_MEDIUM \
     "Device '%s' has no medium"
 
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 370c5a90f2..7f063f5852 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1550,7 +1550,7 @@ static void spapr_pci_pre_plug(HotplugHandler *plug_handler,
          * we need to let them know it's not enabled
          */
         if (plugged_dev->hotplugged) {
-            error_setg(errp, QERR_BUS_NO_HOTPLUG,
+            error_setg(errp, "Bus '%s' does not support hotplugging",
                        object_get_typename(OBJECT(phb)));
             return;
         }
@@ -1671,7 +1671,7 @@ static void spapr_pci_unplug_request(HotplugHandler *plug_handler,
     SpaprDrc *drc = drc_from_dev(phb, pdev);
 
     if (!phb->dr_enabled) {
-        error_setg(errp, QERR_BUS_NO_HOTPLUG,
+        error_setg(errp, "Bus '%s' does not support hotplugging",
                    object_get_typename(OBJECT(phb)));
         return;
     }
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 74f4e41338..3a9740dcbd 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -656,7 +656,8 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts,
 
     if (qdev_should_hide_device(opts, from_json, errp)) {
         if (bus && !qbus_is_hotpluggable(bus)) {
-            error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
+            error_setg(errp, "Bus '%s' does not support hotplugging",
+                       bus->name);
         }
         return NULL;
     } else if (*errp) {
@@ -664,7 +665,7 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts,
     }
 
     if (phase_check(PHASE_MACHINE_READY) && bus && !qbus_is_hotpluggable(bus)) {
-        error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
+        error_setg(errp, "Bus '%s' does not support hotplugging", bus->name);
         return NULL;
     }
 
@@ -904,7 +905,8 @@ void qdev_unplug(DeviceState *dev, Error **errp)
     }
 
     if (dev->parent_bus && !qbus_is_hotpluggable(dev->parent_bus)) {
-        error_setg(errp, QERR_BUS_NO_HOTPLUG, dev->parent_bus->name);
+        error_setg(errp, "Bus '%s' does not support hotplugging",
+                   dev->parent_bus->name);
         return;
     }
 
-- 
2.41.0

