Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7C4CDB471
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Jun 2026 16:10:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wbhDN-0007Fn-2c; Mon, 22 Jun 2026 12:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matyas.bobek@gmail.com>)
 id 1wbhCN-0006OH-GZ
 for qemu-arm@nongnu.org; Mon, 22 Jun 2026 12:08:36 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <matyas.bobek@gmail.com>)
 id 1wbhCL-0006lu-VV
 for qemu-arm@nongnu.org; Mon, 22 Jun 2026 12:08:35 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-49249707788so16494305e9.2
 for <qemu-arm@nongnu.org>; Mon, 22 Jun 2026 09:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782144512; x=1782749312; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iVoIwb+vhh8sM7msaYY87Ws0rtfErG1nVoKxO5ce55k=;
 b=iKu4NqaUliNxaCbaz3EhFC1jSt2Ss9A+qyFSwqMrtnAkML65qZVi84f/FNdGw2kPTL
 I2D93AaLtEwF+PcHVyxCMNRWoKo3GFszPtQaLlEt+8sX861KIJXGsh0K/c/wF9iklFpj
 WJG8TyCt1MaLUQy0wg5V0oAclqgJQxungu80yKwc5XCMSmvwkgvrcBjqGkDehYye3P+L
 Cdq5ui3N3Odzx1UIHuVYq8NyiWaNwmtbHqfYzLiGvaxoNnUXjPyvunXvTx+yZM0mOIlM
 5xDHaGr9Ol1ALEjrEQBqXe94mLVBQdSpwT3EnPHV/heto6At0w0m7if67fTDG/cCAV1I
 eMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782144512; x=1782749312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iVoIwb+vhh8sM7msaYY87Ws0rtfErG1nVoKxO5ce55k=;
 b=a7l6rPdrbLhe0mf58h19CMfqhV4HxuFQwEMYg6OMXC2b9ixHwhfViRLptAFeDFJyyz
 nmNI/b5/NgyGk8470p37Mo7ZYZ2NhBe6DH1SfvYF3EZBioMuRPGY1S4KfczNilQ28ZX7
 kWaaZcbxaqx3ve8CULnAFA+lNgZ8+iUjcu3Yy3EVj+DRR3ZK50fJYT22dDtFnuR6HdCw
 Fvj1BkmynEw5g4ASzCMXQcbQ/b6u8E+HGqW03ku3w9sX1rqJ1rLNQ5HxueDPdUdcpzxc
 26E76oKyvkQx6n3fBzJ0D8UXyujkgriBlGXMFeC4GCKLfSxrs46L8dfyNJYZiEK+IUuy
 VYkg==
X-Gm-Message-State: AOJu0YyC5DGzRUJbVlnabjQMjfXRIDBV7hU6JYOo30N1ODGy6KVDpmrw
 ibnm32CH9reF9z5j/T3u10DyTSqWGyIKBUPmLYM70jF6RS1A8w+kHVAo
X-Gm-Gg: AfdE7cnm3Y8vMLpw1dQPg7BZwIQ0zwHAlEHF1YwV4YPXGuenzQ4Hk+up4pi6puxEMgq
 /aKq6oa3EzK0QA5DlnPMQlipX8mn6fajzKDznzdl0AzUR3TxdnAaBJIdTnm2ndxxgBZMsDBWlXs
 vHYP647ea4hfOpcD1wXB7J6K6nrrV3BdP1qkTCxxb+6eY7hJcZpQ/ZqhraA1IqyOcyMcpeZC1lH
 Jl2/9+aefDQPPr8rA+ki1M1+UnJVQTcKApNkjjTLOnNTwI3NoXLejxeqPSVa/PKcHbYU5bhQagX
 ZfvSmlaXoR50NDSZ0pF4WqO4orPm/6i9yxl7pBcL3wlP2m53jraRc/dt9nDX63Rbjr8hFw9lsSi
 Wb23SxJ8ud4PQqk7iYHorbOikb8BkPEx/M2jppgrJ1QycgGBJir5PDkR2cohZddnR9M0/VmtEU0
 AGQAQG0B9t6XvhL0SFJpHDg23BRyrCi9INZXrBdoQ2Akk=
X-Received: by 2002:a05:600c:8b38:b0:492:40df:d49c with SMTP id
 5b1f17b1804b1-492490a7783mr178804885e9.23.1782144512480; 
 Mon, 22 Jun 2026 09:08:32 -0700 (PDT)
Received: from acidburn.pod.cvut.cz (acidburn.pod.cvut.cz. [147.32.90.2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492494496d8sm225062545e9.9.2026.06.22.09.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 09:08:31 -0700 (PDT)
From: =?UTF-8?q?Maty=C3=A1=C5=A1=20Bobek?= <matyas.bobek@gmail.com>
To: qemu-devel@nongnu.org, Matyas Bobek <bobekmat@fel.cvut.cz>,
 Pavel Pisa <pisa@fel.cvut.cz>, Bernhard Beschow <shentey@gmail.com>
Cc: qemu-arm@nongnu.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 Oliver Hartkopp <socketcan@hartkopp.net>,
 Nikita Ostrenkov <n.ostrenkov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrey Volkov <andrey@volkov.fr>,
 =?UTF-8?q?Maty=C3=A1=C5=A1=20Bobek?= <matyas.bobek@gmail.com>
Subject: [PATCH v6 7/7] docs/arm/sabrelite: Mention FlexCAN support
Date: Mon, 22 Jun 2026 18:08:12 +0200
Message-ID: <19407fc30bdf6b264d1c093a82903609e9cfee48.1782140438.git.matyas.bobek@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782140438.git.matyas.bobek@gmail.com>
References: <cover.1782140438.git.matyas.bobek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=matyas.bobek@gmail.com; helo=mail-wm1-x332.google.com
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


