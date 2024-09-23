Received: by 2002:a17:505:42a7:b0:1be9:327d:8ee3 with SMTP id rt7csp2013598njb;
        Sun, 22 Sep 2024 20:57:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWBzuq0BtANNr8U1IDMr8kan5bFQahfeN7vOlmXaceKXPuRgv9HlWQiyFLxMqfCfWEY5848TwaO/hkc0A==@linaro.org
X-Google-Smtp-Source: AGHT+IFTfbUQmiWXlLudH9xJGiWJUH9At87s9PY+J5czjqZl2njN2uXGF3ie725/oLmZg4veEOTI
X-Received: by 2002:ac8:7d51:0:b0:458:4072:34e with SMTP id d75a77b69052e-45b204ef788mr179409801cf.16.1727063849166;
        Sun, 22 Sep 2024 20:57:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727063849; cv=none;
        d=google.com; s=arc-20240605;
        b=Og/zV7bwZ76teNNRhpnpi0d2nS0zNib0es1UNw/V9Kb2Ny7htqNmcp+g+nIgBDvd98
         sp/MIQG96JkY+3J9x+v/oxKmus9gJdc4cDhdfcbTcj5CKAwg+FGNSLj9YQvSH5CSzU8H
         xTwSlDIMZioSb+rmncTseE0Mt3AYJ6hkmXA+CLBfym5+JVNDu1ezZ3BzLc9Dzqdo5OW8
         WfjTNvjWd+s9xvHtcurkRXjoOpc/anESMTNjkN6B5QbnScuqG0GbEkNvthkPBH0OgIlr
         tuLbK4MXBfgLp5FKadxzaKkWuKSW8hYWVOb0li6Yhokgh8WWQ35nKXviTSWfcyTVGA/R
         UjrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=IQrh43cFhWDNHa2MltyKoKxIev7B7VTtOlH8b4u/r2A=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=Gu7DY+zJjv5GOjt9DZbFGUUa4OBbCjAAXOKe0MUbQegF8bQe9HtobFNsZY2GGx1a7X
         M8s4pNGnnkNgmDGZtTFd5ec+Gdds3NzErwEM2oxcaCvwcbxWv3mtpNeDHhQevhGGHNkE
         xNKCO8Wc9mg+8mlfD2gbx5duyLKHmORGxVRZOeuhHAWLvDdwzDM0qJt77aPKLS2olefG
         Js1D0XJJQukKdVIAUPilZ8QZiR+l4NPcbiGULd5Ju0BXYZwpl6BHe9vDPSG0dvBqDR/8
         tp+6rh9+KplLe/MoKd+HG/O3jyayfXwdFz+Bjz54Pa4cqA0KuGropQTSd5WsAPl0RBJW
         DcwA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45b1786987fsi95645381cf.8.2024.09.22.20.57.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Sep 2024 20:57:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ssaBp-0006PT-Pc; Sun, 22 Sep 2024 23:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1ssaBo-0006Mo-2R; Sun, 22 Sep 2024 23:56:44 -0400
Received: from dedi548.your-server.de ([85.10.215.148])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1ssaBm-00013D-3Y; Sun, 22 Sep 2024 23:56:43 -0400
Received: from sslproxy04.your-server.de ([78.46.152.42])
 by dedi548.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96.2) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1ssaBg-0004WH-2f; Mon, 23 Sep 2024 05:56:37 +0200
Received: from [82.100.198.138] (helo=mail.embedded-brains.de)
 by sslproxy04.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1ssaBh-0002tv-0Y; Mon, 23 Sep 2024 05:56:36 +0200
Received: from localhost (localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id 0CB27480199;
 Mon, 23 Sep 2024 05:56:36 +0200 (CEST)
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavis, port 10032)
 with ESMTP id BHj_8TPmRsSL; Mon, 23 Sep 2024 05:56:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id B4F6F48006F;
 Mon, 23 Sep 2024 05:56:35 +0200 (CEST)
X-Virus-Scanned: amavis at zimbra.eb.localhost
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavis, port 10026)
 with ESMTP id fwJZ0RC4QexY; Mon, 23 Sep 2024 05:56:35 +0200 (CEST)
Received: from zimbra.eb.localhost (unknown [192.168.96.242])
 by mail.embedded-brains.de (Postfix) with ESMTPSA id 86FED480199;
 Mon, 23 Sep 2024 05:56:35 +0200 (CEST)
From: Sebastian Huber <sebastian.huber@embedded-brains.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 1/2] hw/arm/boot: Use hooks if PSCI is disabled
Date: Mon, 23 Sep 2024 05:56:31 +0200
Message-Id: <20240923035632.81304-2-sebastian.huber@embedded-brains.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240923035632.81304-1-sebastian.huber@embedded-brains.de>
References: <20240923035632.81304-1-sebastian.huber@embedded-brains.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Sender: smtp-embedded@poldi-networks.de
X-Virus-Scanned: Clear (ClamAV 1.0.5/27406/Sun Sep 22 10:30:52 2024)
Received-SPF: pass client-ip=85.10.215.148;
 envelope-from=sebastian.huber@embedded-brains.de; helo=dedi548.your-server.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: quHd40YqNHhU

In arm_load_kernel(), use the secondary boot hooks provided by the
platform if PSCI is disabled also while booting a non-Linux kernel.
While booting Linux with PSCI disabled, provide default hooks if needed.

In do_cpu_reset(), use the secondary CPU reset hook provided by the
platform for resetting a non-Linux kernel.

This change allows a more accurate simulation of the platform reset
behaviour.

Signed-off-by: Sebastian Huber <sebastian.huber@embedded-brains.de>
---
 hw/arm/boot.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 5301d8d318..cad7f41f46 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -720,7 +720,11 @@ static void do_cpu_reset(void *opaque)
                 g_assert_not_reached();
             }
=20
-            cpu_set_pc(cs, entry);
+            if (cs =3D=3D first_cpu || !info->secondary_cpu_reset_hook) =
{
+                cpu_set_pc(cs, entry);
+            } else {
+                info->secondary_cpu_reset_hook(cpu, info);
+            }
         } else {
             /*
              * If we are booting Linux then we might need to do so at:
@@ -1299,20 +1303,24 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *m=
s, struct arm_boot_info *info)
         }
     }
=20
-    if (info->psci_conduit =3D=3D QEMU_PSCI_CONDUIT_DISABLED &&
-        info->is_linux && nb_cpus > 1) {
+    if (info->psci_conduit =3D=3D QEMU_PSCI_CONDUIT_DISABLED && nb_cpus =
> 1) {
         /*
-         * We're booting Linux but not using PSCI, so for SMP we need
-         * to write a custom secondary CPU boot loader stub, and arrange
-         * for the secondary CPU reset to make the accompanying initiali=
zation.
+         * We're not using PSCI, so for SMP we may need to write a custo=
m
+         * secondary CPU boot loader stub, and arrange for the secondary=
 CPU
+         * reset to make the accompanying initialization.
          */
-        if (!info->secondary_cpu_reset_hook) {
-            info->secondary_cpu_reset_hook =3D default_reset_secondary;
+        if (info->is_linux) {
+            /* For the Linux boot, use default hooks if needed */
+            if (!info->secondary_cpu_reset_hook) {
+                info->secondary_cpu_reset_hook =3D default_reset_seconda=
ry;
+            }
+            if (!info->write_secondary_boot) {
+                info->write_secondary_boot =3D default_write_secondary;
+            }
         }
-        if (!info->write_secondary_boot) {
-            info->write_secondary_boot =3D default_write_secondary;
+        if (info->write_secondary_boot) {
+            info->write_secondary_boot(cpu, info);
         }
-        info->write_secondary_boot(cpu, info);
     } else {
         /*
          * No secondary boot stub; don't use the reset hook that would
--=20
2.35.3

