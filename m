Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF04EC982ED
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Sep 2026 21:52:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x8lsI-0006qz-58; Mon, 21 Sep 2026 17:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lsB-0006iw-Vu
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:48:28 -0400
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lsA-0000Pq-AO
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:48:27 -0400
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49ccfd61ecaso30464045e9.3
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 14:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790027295; x=1790632095; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gB64cN+yiOS7ZiRiwWYIcDQlMZrswDc750nr2LdCOco=;
 b=EB4t1fQFGcn1MgJ68N8Jn0CkAzd6438LqzuR86VnCK0HMUy9SxWXkCPJWI5+nHdOSh
 TSob3OlQL3wnSrkkbyuihamyrkec6rtcG9+lHpwRgKYnQuCcacx01Mdjke4ruc13mtso
 r5SZMQYIgB+p7gjIxQ69kb5tIXL1d0+7chaMwUaCuyUkv1PnzkgqFEvcmseJZOGn8l1V
 tPLHHBSCgtQYLuFcgDZa6uOi1b8CPX48qe/+d9bXH01LLFt2oRVGMkQVBuYDzowt/kvo
 CcP5PnL9L/NMW4SMHcM8yAlLNV2GMushQWHiUGXNw72DPptT2/rvntlshywHP7lojkhE
 Gw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790027295; x=1790632095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=gB64cN+yiOS7ZiRiwWYIcDQlMZrswDc750nr2LdCOco=;
 b=zUnrWEJV8dCDLmj3CXytAeqCZJ5VR+dovRNra4aNTGA1e7EOVImRMVFgJPCP5arugI
 NyUEHe5dBHFt4wqQpQmHtbABY2610D0P5+gWateO9YqfeEhD3DCcpioC6RdwsRaQcoM2
 gcjIoNoGISY8HTsiMdm7GYh+UOfCAjgPwGnUADHsseM7HYlVcm8o1k1NJqTngHFfJrmQ
 7ci904fno7oyac+Ye1CLWbxCW7959+TGiQThIXav3YHZtthOSxcy75xqcuRqCWyN7mwe
 py4drdgp12nGyicPDEXPWRJxmAGbXAfcXPFRGESelL6x+rwyAtG0Eqbt5sTbdbS7QF/l
 JZdA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzEKFx4EKLFI5DV6KyXw1m8wublqaDwGYA7mEynm37zA9l4vmv895URvHi45Xo7k7JUSBI3vqEOsg==@nongnu.org
X-Gm-Message-State: AFuF++m44W8nYoya65J2Hqqr3LMt2uES7wW8UquvupaCEfSTSOuFPSI+
 LP/5N6UqUDNiLCDFYQv4FxdVVdLqwl82gO8Irlhg5y/pr3K5fr5sOYAL
X-Gm-Gg: AYBFou2wRuOY9dXMbmhpUZ0rhdJ8WUaZSkpgq9tSQ65ap2XnQDxplvk26252TuoNM4o
 B1bQ4yoonCR5qdQv1QiDC8lizEu6BCD1DLwlJ/e3bjvG+zs2HA6mFhfyAhxsxJrcxSzQbEQrtz2
 qFSZ1pS+xbyJa6McFsxrkQokVi0nYYgdYSeigC+ygo+DelH4mis5jkP1In43p0WYo1ClKtUmKL4
 XpAccm08aNI+YY7A3uTUmZ/gu6qnIKLfCyC8jdxtqR6c2RHRkCpTiMMzpyzDT5cuH3iHYB99ZeG
 WYHXqBXOQ3/tiUtIRf852Kwk+Uql++0FWnh0VIZhOtLav3DEjGwMIG0qxkRQ9g5giDha/AlxuXn
 CDa8qnWGs6nLR7o0fYWuc0BdqGJoJWj0sEJTTTc+zdOituX+PH80MrYhzuBHEomQT7sMWOo3mz5
 eK8KSxStWCFBL1ZEsHvvmfJTDNwWjL+UTosiS97jXVQSl9rK7TXOQ9bqrBcQ+3ksBC+hZCOW9Bn
 laQ0lLKRN4Cq793phMSHoEzHOHtFllRB9B28OXtPTXgFiiOsFsl4xaRsv2H/7XAsXTIJuw04pl8
 b5c=
X-Received: by 2002:a05:600c:1d16:b0:49f:bc8a:b103 with SMTP id
 5b1f17b1804b1-49fc55c5361mr193221805e9.0.1790027294926; 
 Mon, 21 Sep 2026 14:48:14 -0700 (PDT)
Received: from Provence
 (dynamic-2a02-3100-1c91-bf00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:1c91:bf00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fda0ce29fsm4986905e9.6.2026.09.21.14.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 14:48:14 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Jason Wang <jasowangio@gmail.com>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Subject: [PATCH 36/42] hw/char/imx_serial: Avoid casting from void *
Date: Mon, 21 Sep 2026 23:47:04 +0200
Message-ID: <20260921214710.29422-37-shentey@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921214710.29422-1-shentey@gmail.com>
References: <20260921214710.29422-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::10;
 envelope-from=shentey@gmail.com; helo=mail-wm2-x10.google.com
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

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/char/imx_serial.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c
index 8ac4efbb5e..8780678ea4 100644
--- a/hw/char/imx_serial.c
+++ b/hw/char/imx_serial.c
@@ -186,7 +186,7 @@ static void imx_serial_reset_at_boot(DeviceState *dev)
 static uint64_t imx_serial_read(void *opaque, hwaddr offset,
                                 unsigned size)
 {
-    IMXSerialState *s = (IMXSerialState *)opaque;
+    IMXSerialState *s = opaque;
     Chardev *chr = qemu_chr_fe_get_driver(&s->chr);
     uint32_t c, rx_used;
     uint8_t rxtl = s->ufcr & TL_MASK;
@@ -277,7 +277,7 @@ static uint64_t imx_serial_read(void *opaque, hwaddr offset,
 static void imx_serial_write(void *opaque, hwaddr offset,
                              uint64_t value, unsigned size)
 {
-    IMXSerialState *s = (IMXSerialState *)opaque;
+    IMXSerialState *s = opaque;
     g_autofree char *label = qemu_chr_fe_backend_name(&s->chr);
     unsigned char ch;
 
@@ -386,14 +386,14 @@ static void imx_serial_write(void *opaque, hwaddr offset,
 
 static int imx_can_receive(void *opaque)
 {
-    IMXSerialState *s = (IMXSerialState *)opaque;
+    IMXSerialState *s = opaque;
 
     return s->ucr2 & UCR2_RXEN ? fifo32_num_free(&s->rx_fifo) : 0;
 }
 
 static void imx_put_data(void *opaque, uint32_t value)
 {
-    IMXSerialState *s = (IMXSerialState *)opaque;
+    IMXSerialState *s = opaque;
     Chardev *chr = qemu_chr_fe_get_driver(&s->chr);
     uint8_t rxtl = s->ufcr & TL_MASK;
 
@@ -416,7 +416,7 @@ static void imx_put_data(void *opaque, uint32_t value)
 
 static void imx_receive(void *opaque, const uint8_t *buf, int size)
 {
-    IMXSerialState *s = (IMXSerialState *)opaque;
+    IMXSerialState *s = opaque;
 
     s->usr2 |= USR2_WAKE;
 
-- 
2.55.0


