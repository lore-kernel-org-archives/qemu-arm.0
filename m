Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D66CA5FCE
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 10:19:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDfmq-0002P5-EC; Mon, 05 Oct 2026 06:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDfm8-0002EG-NG
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:18:30 -0400
Received: from mail-wr2-x0d.google.com ([2a00:1450:4864:30::d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDfm4-0000uC-KO
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:18:27 -0400
Received: by mail-wr2-x0d.google.com with SMTP id
 ffacd0b85a97d-48c54d65743so873208f8f.1
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 03:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791195501; x=1791800301; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lzRzmiq5TK1HqK9aeJmxo2rbJeUrYOMPpSSUYUtwWhQ=;
 b=Z2pI7at+vwmfOcM8XcJunA062O6FpArJCSUEOi1AyKGRJgDPBrm2XgQpBVA4zOeiGq
 UACrRk033JCn+arHPDVBNlhJIkF4EzD8OOBc2vNiFw0z4kZ+ilfZ+33JEZASOnCLp1xw
 uEbWMb7yVa6eOi9hil2Hf4DZvnB90+dR5T7W+/NALl3d3YrMV6CILa76KGouGMv6Vxq2
 VRFxzvxzEdODnglVxwxHmxPwDY1vvQ62CyktZzMZ5oZCfA5qTIPC85gRql0oDQq/bR6r
 n4Z64q/QTYe0a4/PxppookEFrbY6GqCqH0s4vI2PtOYgpboq2v1rN1q8AW7EP6Ahe/vM
 HNzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791195501; x=1791800301;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=lzRzmiq5TK1HqK9aeJmxo2rbJeUrYOMPpSSUYUtwWhQ=;
 b=oAichT2lS/ZXAlytG1oY2eQeHPRAKR4KKhSkxvxFC004wdXTl34CPBLfU6tIdgcPP5
 s3XAIeD4QoorLao7pQxex5DG1etboIucRKVzzhOSzgkPyC6RR7ka98OgtggXaOSicL3C
 1SEdpFIZViTdyKQFw59pOWQT2BnK3whn1IAM7CqZCma03BTxLdv2v2PE0sBZNc4NiNjL
 nw/AyfdyAzVhlhpCVm+4EpG8RF2z+MpjUzyVYU10sWNyDI1ZCbxaIBeKv/s8hbT6tRZR
 8eKUyyo/g/o6rAvZZ/PXDOQmCvsr9a9puqApAVrx4MSyRcVYZs+Ps3GEA74Iq744k3ph
 eomw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzBShkfbY0uJTlBkvh1ZE77ax0co0ihmOTuZeQBxoS5p+uhE00VEXusVZgsxYYfr0RnnnbJlraKWQ==@nongnu.org
X-Gm-Message-State: AFq9FYIVuv78oxx+i8a0Hq4JINBata7iXzavTm611yAODuSebIAvRQsh
 fOEJ4z/JPpocmw6ce6n20c7LQZTSc/M0yfMEwAPBY3KguEQTNO/35e7m
X-Gm-Gg: AYBFou18SiFPnGXR4IoPyOolRntTWjrg2Ct04WxsH///tc3cTbByZUYp5CZ4RGXhsNS
 M/GeLmQxDZCdILT1vCgRRyvYlH3SEIn5IOAGBWMEYI7WgjIUZW94SoRck/+6OAyJanVhSLw7BJq
 Xpm2JW/yuWbaL1gQqypnW6IuQtac3gAzWkqReSRYEKfJLlo2Ebw2XgGG1UWJRAxS5O7yZx9yczd
 b+AkIW2Dt2Ngl1snkIKUEm6pBXYo+D263NIAJRyPMSEqIQXV353KWoeQISj/yvxRYXfWFd7l6ps
 i7/uVAxLsBtwZgWG6saR6KB43szgUZPuKzeVwYBTNgm/shoHaGVTZsVMJJUvkVPCfvOxDRm5lhg
 I1RUGIVU814jDwq4h0/XZ6EffCxG8jXhw2PnqzXq0fq2UZNrlhfZGfah67FzmYjknoMKlU6YBpf
 yFIZYkYVj+p+mWzHv1TK8jMVCxcQazg8TadV3YxqTxbTqZlSla7cjCDBBY9RBE0pnKt/Xk2RbYw
 aSE0ulP17wokw70FlyMg8bxgMayNi2uIqNipw==
X-Received: by 2002:a5d:64c6:0:b0:486:e9ab:2b88 with SMTP id
 ffacd0b85a97d-48b12712fd6mr19816080f8f.24.1791195500950; 
 Mon, 05 Oct 2026 03:18:20 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c622ab7b5sm2742111f8f.37.2026.10.05.03.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 03:18:20 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org, Bin Meng <bin.meng@processmission.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 01/31] hw/watchdog/wdt_imx2: Preserve own locked bits in WCR
Date: Mon,  5 Oct 2026 12:17:28 +0200
Message-ID: <20261005101800.10821-2-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261005101800.10821-1-shentey@gmail.com>
References: <20261005101800.10821-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:30::d;
 envelope-from=shentey@gmail.com; helo=mail-wr2-x0d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Apparently there is a typo in the WCR locked bits handling: The locked
values for s->wcr must come from itself rather than from s->wicr, so fix
that. Without it, guests such as u-boot may experience inadvertent
reboots when configuring the WCR register.

Fixes: daca13d495a1 ("hw/watchdog: Implement full i.MX watchdog
support")
cc: qemu-stable
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/watchdog/wdt_imx2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/watchdog/wdt_imx2.c b/hw/watchdog/wdt_imx2.c
index c83d4107c1..3283990bbf 100644
--- a/hw/watchdog/wdt_imx2.c
+++ b/hw/watchdog/wdt_imx2.c
@@ -156,18 +156,18 @@ static void imx2_wdt_write(void *opaque, hwaddr addr,
     case IMX2_WDT_WCR:
         if (s->wcr_locked) {
             value &= ~IMX2_WDT_WCR_LOCK_MASK;
-            value |= (s->wicr & IMX2_WDT_WCR_LOCK_MASK);
+            value |= (s->wcr & IMX2_WDT_WCR_LOCK_MASK);
         }
         s->wcr_locked = true;
         if (s->wcr_wde_locked) {
             value &= ~IMX2_WDT_WCR_WDE;
-            value |= (s->wicr & ~IMX2_WDT_WCR_WDE);
+            value |= (s->wcr & ~IMX2_WDT_WCR_WDE);
         } else if (value & IMX2_WDT_WCR_WDE) {
             s->wcr_wde_locked = true;
         }
         if (s->wcr_wdt_locked) {
             value &= ~IMX2_WDT_WCR_WDT;
-            value |= (s->wicr & ~IMX2_WDT_WCR_WDT);
+            value |= (s->wcr & ~IMX2_WDT_WCR_WDT);
         } else if (value & IMX2_WDT_WCR_WDT) {
             s->wcr_wdt_locked = true;
         }
-- 
2.56.0


