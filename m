Received: by 2002:a17:906:14cc:b0:9b2:89ee:1eb8 with SMTP id y12csp70223ejc;
        Wed, 4 Oct 2023 21:53:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvua7HadzZj1BacQEEMNmMpCs8qzpEX7mrIJkJzw8gpJDEWQemwt1Vm7kktzSHKMAw0g2L
X-Received: by 2002:a05:622a:760c:b0:418:1a66:1c2f with SMTP id kg12-20020a05622a760c00b004181a661c2fmr3320486qtb.48.1696481593031;
        Wed, 04 Oct 2023 21:53:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696481593; cv=none;
        d=google.com; s=arc-20160816;
        b=iW7MHmHPEQx2yMiJ1y/QcddbGOKfmAL2AJzb0Z7s06YCaqCUMfaKHnVbD/+mHzcUgG
         DrF9EvR33tkC1q0W2ofEPZCmQ8oolgQbPNOcoZGZ7AunnZfcy0U5KE3gl5UiTdhzm4Zt
         49yqNcqUiPQzUZ2tPNbYP1dt/J9H5zysGAiJEi9bgGvavlAfUV1CHJ+A1eIP07FcnvB1
         p7wWTwN7Ybs/l0iYr/FAqaThWCNXuXNq2LZyIigxKmQxSOn6DrdiOTzn3sJx9H7B4Qui
         Ht1xrSoIA7NrdfmHotFDwVBhUYW8Lkn0z9UphJ2qpZ+bDv6177GLvvv9C8dXNF0VjT8F
         vHpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zxIwwvtSDa6HXj+GPDZLsyAAO0jyEUx+3zbxHDZan+w=;
        fh=c+VVz10n7KAlu8gpz6nnUtnQFNzd2eguUG1EsrUYgts=;
        b=Y7hEQLsQsOMNKia+V4XSBLwUGM6zzl0CeHRGjZt/cX3Q4hj5Vv3/rzhjEWzA9k8l0I
         08sB3qMOoCypTcGdnwwWbC38suhUVSIEhiItd/ovEr401A4li2vv7mSdr0F/AOsdhlac
         tjs5SOTYHKm/t9d3jlNIDppSwUR1Qa+KgpJQDbH/sXdFi1DMdYg+ykmlUcb00Ysc0Kfw
         vwNfzEgSek5ryI1WN6kng1X/sRoxcJFGi7qvrB9O9eTnSRcX7Qk3hWKCiIxHuhBn23eb
         XpX6jFBjCYAaLOBtWN75cbhv9F+nCrjl/GZQ9LIOBX/vNbKIwh2JtOsjJsnM4ApI+wa9
         V0Gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lYp3Rah3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ox14-20020a05620a828e00b00773a83f4736si392596qkn.585.2023.10.04.21.53.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 21:53:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lYp3Rah3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qoGKT-0005RU-7p; Thu, 05 Oct 2023 00:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qoGKH-0005Gs-BI
 for qemu-devel@nongnu.org; Thu, 05 Oct 2023 00:51:11 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qoGK9-0005RW-Nm
 for qemu-devel@nongnu.org; Thu, 05 Oct 2023 00:51:05 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3248e90f032so580025f8f.1
 for <qemu-devel@nongnu.org>; Wed, 04 Oct 2023 21:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696481451; x=1697086251; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zxIwwvtSDa6HXj+GPDZLsyAAO0jyEUx+3zbxHDZan+w=;
 b=lYp3Rah3WIR8DU2cOsjo2zMX9kyQrgP48g+O+DQ8/PHjLbTENBjoJKQy2K7W05qp8X
 w/yxFqIv/JwZaiwSDi/K/v+wblVPG2ch1Ph/SGPX/khHxTAsxN2nc6orUbwPqs6fxnhX
 QQS5j+bB7ik4qt3XSBYzF67Kvz7teWM6qFfq3Uw1QUxolyaRfaafPjlhsyM4EHmZuvcg
 gIjC3fpjupjUq+XkMKIKk2mGcAUPsA0HYFg6gy/8vIXDh1/WWn10RxmzGGrASsdP9K9q
 FgoQP2K1cGTrzp3TNm+v8ymXC+kfghBzC+kn3dCo2fHHM42NKjKRm5ZW4Adyf7ccqlIf
 xIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696481451; x=1697086251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zxIwwvtSDa6HXj+GPDZLsyAAO0jyEUx+3zbxHDZan+w=;
 b=ZVYcTr/0op3/2ZV+0WKM3QSameorVp4rRMPeb2vgWyXC3ZffgDAtkwqOF0nI36IY7F
 LbsdGEuLfy9E4QBs96PUiV6XrFRoxbFH5ykF0XVw+JajBsqRRlpVakIHmDpIm1txgCtR
 eAM/hrxDZbqXw9b9M2umVguHh3O5pbRj1VkB+ym4969gegyFi7l/kWyjokmLoX6XWbWq
 1wNvxysdWW7G+cFXadh+RJX/w84a8e5gD35/fpsqB8mN8SIwnCAOVimcHfe9nPJT+reK
 PQKsQiK475dYNpD/awZUn+YnrjCR/fqrFLAkUTU3paMlzLJJkLFJX41s0qpsMH06FumT
 roSw==
X-Gm-Message-State: AOJu0Yy+iE5P0oxPJID65aJPCTLQ1Wn7Bj/Rvk6iMaemACyZJW6PJMGm
 Qjv48hxuhckLqaxlO501BdSbjKkGp3KY9ogoZCQ=
X-Received: by 2002:adf:de0d:0:b0:31f:e759:d687 with SMTP id
 b13-20020adfde0d000000b0031fe759d687mr3578604wrm.50.1696481451473; 
 Wed, 04 Oct 2023 21:50:51 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-211-120.dsl.sta.abo.bbox.fr.
 [176.171.211.120]) by smtp.gmail.com with ESMTPSA id
 u2-20020a5d5142000000b003142e438e8csm751402wrt.26.2023.10.04.21.50.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Oct 2023 21:50:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
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
Subject: [PATCH v2 01/22] qapi: Inline and remove QERR_BUS_NO_HOTPLUG
 definition
Date: Thu,  5 Oct 2023 06:50:18 +0200
Message-ID: <20231005045041.52649-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005045041.52649-1-philmd@linaro.org>
References: <20231005045041.52649-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Dl79XfreeGL2

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

