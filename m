Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02D61091912
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Mar 2026 19:54:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3JRM-0008Us-Vr; Thu, 19 Mar 2026 15:53:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matyas.bobek@gmail.com>)
 id 1w3Ip1-0004in-0D
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 15:14:22 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <matyas.bobek@gmail.com>)
 id 1w3Iov-0000o9-6S
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 15:14:17 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-439b9b1900bso829737f8f.1
 for <qemu-arm@nongnu.org>; Thu, 19 Mar 2026 12:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773947650; x=1774552450; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lG34KLIz8Yh+mBr+AkPrQLstqlq/You8bypDWPVEkXk=;
 b=h1bNvzFuN+2chdsuzpRZFrJ9NT1JzG5a6744uqRXn1YPJ3ldHKUQf/+hezsAfjQdzI
 rkaVm9gugziHWTosH+NSz4UKkbPWJW46tUf+nRo6gJcWEsjSkRlg7+mZanNWhab1nhvj
 ktDPVP74CO0TgRljiwZI+yFgzOMKItig4G6J3XqimcauAEYj9cd73KlyqGpCin2Ihpgt
 BxtRVcHJhwbWO2ViymfhWxTbNEeDNdwAXoisE8DqMq2sBlrLntjXIBR0TzvmnggIlI7q
 ZUjSmJmO+KVjzLMZkeV0OXeNgUd5yebdoEP83hgy/DDwe051boPSdTc5rftG8gEuL2Rk
 ICpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773947650; x=1774552450;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lG34KLIz8Yh+mBr+AkPrQLstqlq/You8bypDWPVEkXk=;
 b=OnD5Ho0xhXmiSzKqHgJSzGRqdRrkxGSzo4Kbq7EWGJAl0c1KMVFl9cIHs6nD0MQ7Rp
 +L+73JCuELkN0cs0rP0xBcH7EDVPVdwaBcMa3VTUD9quo+JAtDvxQzO7EYug0YsfZa7k
 X67N7a6qiF9TWWar4V9Oh9Cnf2UJP2wX6Js+doMgHk0cL9LyapqNZUuiB5+uqMG/eILD
 4XTuUq9VFceW/OshQUyiFCFjBO9k4odrZBhEd/GrkE7xkb/xQ2O2jTrrk/NjbemQBkXo
 bpCiSc3s6aP7Xgsl+riQNu7ag+6VY/7IeRjtPByYEQauEGjbGj4NSK32LlCFuOYD2Q4b
 CcMA==
X-Gm-Message-State: AOJu0YzNxbGYahiB5qA+GpkEO+aDYgAp5OSrDvG1tLbLWbmrikj6VJ8a
 Qf91iuRrXbvU8N7zZqtccjUfwvNCeSQPANruI7oAnrdFfMIkvFxQZrjr
X-Gm-Gg: ATEYQzwO5JPdOHZtepP0VylkR2e0iYYhggx6/qM5rspU5rF0BlF+iAjllsWT/OrvDHU
 6nUUQE33QKG9Cqugz4OqEWuvCF9oenHPGQFoyJab5TXPU7D62Lry7S/6NXdn9V6ovnsGkHpaNmw
 yWhdydKtdxDe9DXH7l4sHpXkE9s6IQgLSkkj7at3aXqlbyNlrxAF1PTLzpNBUjfBqjr09bjZtdq
 M3UP6pMBRhDgwL2UUhHnZ9Br15wvAfD9Mea+PWtOgOu1PHOHOW1015x8yRGb1gCWU+BKcuG/gm3
 C1ruIdBZkMftIFGlTjeQgh6zfU+bKinLK+Jgx2P+Migdl+ac5VunuDMTbVkfZQZ6Iwl8bLKZPHi
 a1InX/j3o4yR6ptHryUBMUgUNvLQWv1eUJtL+4T77fo7JWpB3dDbYxUtuvGBbwnunZf6xwvcPLY
 A+yTSbFsAYKqLiIIp3yB1JwML5lsTF4RlJc5+XTsFePlXi+jPGRJ39BA==
X-Received: by 2002:a05:6000:2486:b0:43b:4e01:4aab with SMTP id
 ffacd0b85a97d-43b642812a5mr848909f8f.37.1773947650337; 
 Thu, 19 Mar 2026 12:14:10 -0700 (PDT)
Received: from acidburn.pod.cvut.cz (acidburn.pod.cvut.cz. [147.32.90.2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64714e2esm635921f8f.32.2026.03.19.12.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 12:14:09 -0700 (PDT)
From: =?UTF-8?q?Maty=C3=A1=C5=A1=20Bobek?= <matyas.bobek@gmail.com>
To: qemu-devel@nongnu.org, Matyas Bobek <bobekmat@fel.cvut.cz>,
 Pavel Pisa <pisa@fel.cvut.cz>, Bernhard Beschow <shentey@gmail.com>
Cc: qemu-arm@nongnu.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 Oliver Hartkopp <socketcan@hartkopp.net>,
 Nikita Ostrenkov <n.ostrenkov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Maty=C3=A1=C5=A1=20Bobek?= <matyas.bobek@gmail.com>
Subject: [PATCH v2 7/7] docs/arm/sabrelite: Mention FlexCAN support
Date: Thu, 19 Mar 2026 20:13:14 +0100
Message-ID: <278347c16b34c91499166d3c52ad9b2c1ce3266f.1773866323.git.matyas.bobek@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773866323.git.matyas.bobek@gmail.com>
References: <cover.1773866323.git.matyas.bobek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=matyas.bobek@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 19 Mar 2026 15:53:55 -0400
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
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
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
2.53.0


