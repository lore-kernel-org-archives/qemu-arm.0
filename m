Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA1ACD5BD5
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 17:18:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSeMh-0006bg-Ma; Thu, 28 May 2026 13:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matyas.bobek@gmail.com>)
 id 1wSeMU-0006Vj-5b
 for qemu-arm@nongnu.org; Thu, 28 May 2026 13:17:39 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <matyas.bobek@gmail.com>)
 id 1wSeMQ-0004A7-N9
 for qemu-arm@nongnu.org; Thu, 28 May 2026 13:17:37 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-49042aeeb75so84760925e9.1
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 10:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779988652; x=1780593452; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iVoIwb+vhh8sM7msaYY87Ws0rtfErG1nVoKxO5ce55k=;
 b=I6sGbx3QnzIB/J9qRcyxfivyYYRTiTlvArFN290aMyMBVV/Us4CNNkcNL805DJIXO6
 GGZPC4VULJwbqnw8olY0MsoQFqBGUscloB5PvlONHV4A2OSP2A9SaV+0Jk/uSx23jzxh
 uvpw23Dqmei/z/Do4wQcC3C3Bt5dGrRPtJCMe95ZUFdnzNOGfxAoBfud0ARZuq3a8NtO
 CP645lLYLqtWthMorU4KxsNztE5vicLhHKxWGrtREMdDvXqwSHc6Yjrbri+6Rncvkwwa
 PnV1d9YhJSMoGgnRA8CraTl5S7/LTMu7S3DkPEakQMk2Ljpbf8PC0uiDW3T09/Iauwgr
 8xMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779988652; x=1780593452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iVoIwb+vhh8sM7msaYY87Ws0rtfErG1nVoKxO5ce55k=;
 b=UhJJTKGQas2DbtXZ0AMuHKzPHFDR+bOBgz94QKzFopYZMrNqJjF4ry7yg1TC8q9QYl
 h9nlS3dOwXwD/3hlvQnVH0PNEu27ztQtbW3cJXpBIucMw++krrGShIeSljImyCeWNK6e
 fMCLA6ukSoAUdMgl+3ACiGalXRgy7SBOrBdQV2NEEhtpizXiZclSLC3UAp32/hUGtu1N
 XMyi/n2gVvJuwWdq42xADcJi6ShZDgiuZJ2RgOdrZJoRI8cNnXmCdJdr6JVSYLo+KkMg
 fkYqiUopA8U/HVMS+E4UY4VXgRamCuVuf4qqJOSnFJYod+OVwmEpjD9rWywo1y3yyXiN
 eQKw==
X-Gm-Message-State: AOJu0YyxtESi4SAsvkvos7PycZ4BZLhRXm8cZDkxJUCitq61Pq8g4+F4
 lFM4pJW3Mzq7lh2BR2UomfD84quaUmzGF15OV2R7jZD7GNpoWsFL2ubb
X-Gm-Gg: Acq92OFxDEVQXCxSddke2mw1sWcRhDA50oNepLbyUSYYNHJxYOI4yuhFC7FOQluhaK2
 4fR+AFOS9p9v57wU79YYygikkY3ofXb++q44j3Y08z2L+Wo3hEfqhBlDkY3OJWXL7faoPOPdqzI
 bBjnJRCjp8aDmIJt86+oYLoVYquNIUaAIp2qtMGq1AuwoH/yFsHYrIdefmXFYaXeEvK32wWBJUG
 FGTMHPkmJnnbuEO62n434jo4uYFTrUyII5PnuhoLVT/V78chx3vBmktBlFeFSwZ/DZkVf77GARS
 TWCqaZjps1gZYsHFtBcHbEAUi4DK0cMy2R45vlilvuaftAQwvEoEzP/oxyWgdHaHP4zgyHebmi6
 wSnqNqyLte/Q4h5z8miS+u5ndiNj74lHcaRDovCzfQz4JeqLwhK5krNXFMGFRRTdv1lceaab0tp
 mOEESmeDpMnX9sS5brVCzFf68BZkKAIXTmIwrsx28GMMlqQI31INjgd9PlTIgO9qN9/Bf/wGSX+
 TQ=
X-Received: by 2002:a05:600c:a402:b0:488:9bf8:7f17 with SMTP id
 5b1f17b1804b1-490425ad10cmr379774365e9.14.1779988652442; 
 Thu, 28 May 2026 10:17:32 -0700 (PDT)
Received: from acidburn.pod.cvut.cz (acidburn.pod.cvut.cz. [147.32.90.2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49092968066sm53774085e9.15.2026.05.28.10.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2026 10:17:31 -0700 (PDT)
From: =?UTF-8?q?Maty=C3=A1=C5=A1=20Bobek?= <matyas.bobek@gmail.com>
To: qemu-devel@nongnu.org, Matyas Bobek <bobekmat@fel.cvut.cz>,
 Pavel Pisa <pisa@fel.cvut.cz>, Bernhard Beschow <shentey@gmail.com>
Cc: qemu-arm@nongnu.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 Oliver Hartkopp <socketcan@hartkopp.net>,
 Nikita Ostrenkov <n.ostrenkov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrey Volkov <andrey@volkov.fr>,
 =?UTF-8?q?Maty=C3=A1=C5=A1=20Bobek?= <matyas.bobek@gmail.com>
Subject: [PATCH v4 7/7] docs/arm/sabrelite: Mention FlexCAN support
Date: Thu, 28 May 2026 19:17:17 +0200
Message-ID: <ed669feae05df20b5b5b3c904e830faaec3a26cc.1779986496.git.matyas.bobek@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1779986496.git.matyas.bobek@gmail.com>
References: <cover.1779986496.git.matyas.bobek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=matyas.bobek@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Also added example command line usage of the Sabrelite board
with FlexCAN controllers.

Signed-off-by: Matyáš Bobek <matyas.bobek@gmail.com>
Signed-off-by: Pavel Pisa <pisa@fel.cvut.cz>
Tested-by: Pavel Pisa <pisa@fel.cvut.cz>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Pavel Pisa <pisa@fel.cvut.cz>
---
 docs/system/arm/sabrelite.rst |  1 +
 docs/system/devices/can.rst   | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/docs/system/arm/sabrelite.rst b/docs/system/arm/sabrelite.rst
index 4ccb0560af..d3a3c01dd6 100644
--- a/docs/system/arm/sabrelite.rst
+++ b/docs/system/arm/sabrelite.rst
@@ -24,6 +24,7 @@ The SABRE Lite machine supports the following devices:
  * 4 SDHC storage controllers
  * 4 USB 2.0 host controllers
  * 5 ECSPI controllers
+ * 2 FlexCAN CAN controllers
  * 1 SST 25VF016B flash
 
 Please note above list is a complete superset the QEMU SABRE Lite machine can
diff --git a/docs/system/devices/can.rst b/docs/system/devices/can.rst
index 09121836fd..622f898952 100644
--- a/docs/system/devices/can.rst
+++ b/docs/system/devices/can.rst
@@ -173,6 +173,30 @@ The test can also be run the other way around, generating messages in the
 guest system and capturing them in the host system. Other combinations are
 also possible.
 
+Examples on how to use CAN emulation for FlexCAN on SabreLite board
+-------------------------------------------------------------------
+FlexCANs are connected to QEMU CAN buses by passing the bus IDs as machine
+properties:
+
+* property ``canbus0`` for connecting ``flexcan1``
+* property ``canbus1`` for connecting ``flexcan2``
+
+Note that upstream Linux SabreLite DTs have only a single FlexCAN (``flexcan1``)
+enabled.
+
+An example command to run QEMU emulating a Sabrelite development board
+with both FlexCANs connected to a single QEMU CAN bus (called ``qcan0``),
+bridged to host system ``can0`` interface::
+
+  qemu-system-arm -M sabrelite -smp 4 -m 1G \
+    -object can-bus,id=qcan0 \
+    -machine canbus0=qcan0 -machine canbus1=qcan0 \
+    -object can-host-socketcan,if=can0,canbus=qcan0,id=qcan0-socketcan \
+    -kernel ... -dtb ... -initrd ...
+
+Note that in the Linux guest, bitrate for the FlexCAN device is ignored,
+but needs to be set via the ``ip`` command.
+
 Links to other resources
 ------------------------
 
-- 
2.54.0


