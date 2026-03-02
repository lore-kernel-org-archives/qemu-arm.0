Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799F2EB363D
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Mar 2026 22:05:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxBM7-0000KU-9A; Mon, 02 Mar 2026 17:03:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxBM4-0000IT-VU
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 17:03:08 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxBM3-00016k-9x
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 17:03:08 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-43991064db8so5136274f8f.2
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 14:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772488986; x=1773093786; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a20X3LL6nOL1DHB0RkjcJ0CTq+OL5+eKSUsrTa1dqPQ=;
 b=MvjC4EyZ1YXn7IxuPGZ0gkeUXoxwkLpH2z16v8aU170tL0+/ZEcMNUhsjmcqZy7QV/
 OwHFaPYiZMjrfrWoIkvzYf2m8IWgqpsx2KWDTFA+YhB4egUAsHPnKNFjk7x0omSWEs7X
 /Ui2muAcF7DQn36QQkBRTy3p5Jdx1fqA00y97wmYLEpjz38MAtPQL37F0AlFVTdoKtrH
 CgHIReAUEJs8BSBZyRI189j8BTtsHI5ITwgXfzS3vz02tpt2qC+XvxPiBMWKgX/nZo3z
 WU8uiFryrLbEYdt89f0lATjf8hGMaOmETMuYrus7ZZLbY+cORrfDdc+W2jDMgU6tn2to
 LOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772488986; x=1773093786;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=a20X3LL6nOL1DHB0RkjcJ0CTq+OL5+eKSUsrTa1dqPQ=;
 b=uhNFt5+fEt2LBo18dI+aemlEkiTwL8Wnc8uyqpDmnvGaIfxS4LAytxxQjovtYQ8JVi
 uV07pFlm8hU8W5BITOfZDX3a1eL1NImzUlAbSS/r7i/sCOQcQE9weuuXz9+TzKmWZaOK
 enFxm1PD03DE8g+YpowWx5wnQkbAqd3FehL3hr1VwvkXTFGSuvqowl70oiHyzprp1iaR
 mTyzfF+o9cYdqlhciSprSzZ4SS2gv7ADWQ4K0VSFM3dlzzMPAof3kZwV3bvvGv9xJud1
 7apDkuzk1l+kPW+Wt10TOQJO/mAWoBCO/U/MzWgfNJaJTP+tVn2tLabKjlVcQFTeB8O6
 3wrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCViS09Yt9amE6Y5zVHeUTp8Z1XngpFCthtMHrQ/tkbaaZuku1YK7FTc0Ji6cOu2KBxqewbuDZDpXw==@nongnu.org
X-Gm-Message-State: AOJu0YxoFNuFHDGJH2WJYyQ3RxxcUM9dSvM2n7kEU16X+S6qo6QLFFRg
 R9sUlAURePHMmMwyTl7IiDgD1W36cWoWHy8aRtqBaDEczdxHdseAocSG
X-Gm-Gg: ATEYQzx9Ve1a9pBWbudlIdBkJZNbQ6iKZPCUVCj1FXCwTXySx2BFC7jDBPaMdVRs4nD
 PrgR73q3XJ4bsHepYiqoNGxWK74CME6bHoF9KXtyJFC/BJesvKuy0yQ6K6wPCX3YSNS9SG96Op3
 ScaJH9phvdBmWrbfFsG5WYMDNBbKTY2g4WynCa+1blnxYZR34YnKxtM/bEe8ICN20A5pn30cGs+
 wrFfy5zpZzrhPm6cQsV3vpc9Ih2EcLdo4Ng/GF/TM66sptrFHwgjPAvMSk8heelXkvv9TTHH3ep
 RMlLrtpg+MZqMyTLXcvYYPMqmfnOfwl/JNKR3X0dsGkhRKMAjbG/O45cWHh6g+MtJnJU0PGpYI3
 bNpNpNrP6RVltSdK/ypGe56MrNdeLPlxaBeEGdl/2w8xP6pDMoJz8akbxe0a4vCgTEvO0VRnAGM
 wNMo/WXSxZC8+TE35a9TeF8NL4cWxyhZi7EmLarKh9tJywX4Tp+H23K/CVRNLkazLd6lOJX2qwt
 cZCaGUZaHvLXKf2u4+49k92iQQaLxL9qHM03ljGrhSXc3M=
X-Received: by 2002:adf:fa52:0:b0:439:ab3d:1c27 with SMTP id
 ffacd0b85a97d-439ab3d1e51mr12575085f8f.2.1772488985526; 
 Mon, 02 Mar 2026 14:03:05 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-2a02-3100-2e0b-4800-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:2e0b:4800:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c765c38sm29308102f8f.31.2026.03.02.14.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 14:03:05 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Helge Deller <deller@gmx.de>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Troy Lee <leetroy@gmail.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 02/12] hw/char/serial: Remove explicit cast from void pointer
Date: Mon,  2 Mar 2026 23:02:44 +0100
Message-ID: <20260302220254.1166849-3-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302220254.1166849-1-shentey@gmail.com>
References: <20260302220254.1166849-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x432.google.com
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

A void pointer asks for being casted, so C allows for omitting the
explicit cast. Take advantage of that.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/char/serial.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index adbd1d1d4a..0f2e79dfba 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -715,7 +715,7 @@ static const VMStateDescription vmstate_serial_thr_ipending = {
 
 static bool serial_tsr_needed(void *opaque)
 {
-    SerialState *s = (SerialState *)opaque;
+    SerialState *s = opaque;
     return s->tsr_retry != 0;
 }
 
@@ -734,7 +734,7 @@ static const VMStateDescription vmstate_serial_tsr = {
 
 static bool serial_recv_fifo_needed(void *opaque)
 {
-    SerialState *s = (SerialState *)opaque;
+    SerialState *s = opaque;
     return !fifo8_is_empty(&s->recv_fifo);
 
 }
@@ -752,7 +752,7 @@ static const VMStateDescription vmstate_serial_recv_fifo = {
 
 static bool serial_xmit_fifo_needed(void *opaque)
 {
-    SerialState *s = (SerialState *)opaque;
+    SerialState *s = opaque;
     return !fifo8_is_empty(&s->xmit_fifo);
 }
 
@@ -769,7 +769,7 @@ static const VMStateDescription vmstate_serial_xmit_fifo = {
 
 static bool serial_fifo_timeout_timer_needed(void *opaque)
 {
-    SerialState *s = (SerialState *)opaque;
+    SerialState *s = opaque;
     return timer_pending(s->fifo_timeout_timer);
 }
 
@@ -786,7 +786,7 @@ static const VMStateDescription vmstate_serial_fifo_timeout_timer = {
 
 static bool serial_timeout_ipending_needed(void *opaque)
 {
-    SerialState *s = (SerialState *)opaque;
+    SerialState *s = opaque;
     return s->timeout_ipending != 0;
 }
 
@@ -803,7 +803,7 @@ static const VMStateDescription vmstate_serial_timeout_ipending = {
 
 static bool serial_poll_needed(void *opaque)
 {
-    SerialState *s = (SerialState *)opaque;
+    SerialState *s = opaque;
     return s->poll_msl >= 0;
 }
 
-- 
2.53.0


