Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp797217ejo;
        Fri, 5 Jan 2024 07:54:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIP4QZzG9jEOU6UhUv0jmu3liKeptX4sNBThHTrERQUjx93ONcksXrT+z07IbW6WZLbtIn
X-Received: by 2002:a05:6214:da1:b0:67f:89c6:27bb with SMTP id h1-20020a0562140da100b0067f89c627bbmr2560703qvh.79.1704470048621;
        Fri, 05 Jan 2024 07:54:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704470048; cv=none;
        d=google.com; s=arc-20160816;
        b=oNrRu+T8Le+JxBl2MHRpts+ONA7tavLB/+h5+xdYwSjQ62X4IC8aXacwBfG9ZdTYsg
         mOKcQdDxqgdQ5Z2jUQ5G3Rl8vnlWFLgeE4lD4RBIQ5RV6W375Md7WoQTcdnSEkYJ4JOX
         Uj7R+/a470xQnh13bKuo7wcaUzn48A5DSgU9a0ECCiz/pzXt6ksaz6CJZTHEGg2nOKMb
         JXSH1g80YMoPSBCf5+b7IM+4ngeiPJHhmqW81mDuzpc0svvVDr8kM0rr0YbO9SJ6xXbm
         H7vAn1Uj3M75CcdCSOaCZi3j5Hg3sSWeG+5YWaYv5cLgarUdn1NUf4MmwSyG6p2m40qP
         AYcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Nno3VTCeo04e35HOY3p6uYOV1tAtecR5ZW2yhenY0Bs=;
        fh=Wm46THIaMx/Gr7DBK5P4sUJlZBqXtbhLLlo6thGXO6E=;
        b=ja4qzPVIL+7bBjeXE/k8XPxV98m0Y7wGFFQf69LRbIMlGp4zYMxfGuwU9vvlXmEODk
         heJ5ra7nBU8I9qG5BFDIb5ZUZQ1PIOIY4I5A7HFLBBP2vMYhrS7Y2ai8d+H7B1P3pQaW
         4BR9vbT1Z8Dis0BqeoB9V8ak32Yt6Cs2gVNE52Kt4RzinCiw78Sqkw/NyPJ7CkIU3qDG
         2EunV+jUam6z6fNZ/zMy5jrbnowxQ791cny3k4ZGr0XI7tfMUzhRQEA93hJuASRyhp4a
         4LLpxbFoNqpGfwC2va5vmyLeOLBFzmxwxbdjokaYthjfE8HHPU24vZMsPuaPY6Lx6KHe
         3fjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WincsaJJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s16-20020a0ce310000000b0067aa7e04719si2043334qvl.367.2024.01.05.07.54.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:54:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WincsaJJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmTU-0003Wy-R1; Fri, 05 Jan 2024 10:51:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmSZ-0000ov-Gl
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:50:13 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmSW-0001EK-81
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:50:10 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33674f60184so1530282f8f.1
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469806; x=1705074606; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nno3VTCeo04e35HOY3p6uYOV1tAtecR5ZW2yhenY0Bs=;
 b=WincsaJJFH6/ydoWKzmDqEwadD24rT25SUPVLUTA2MOp2iyLtBxtrbgYvSnA+4cWEf
 C0LfAd4J2UhnX2wfrrTp3z7weXamxReN5VujcADpZJ5LYhwVJV1LPWRH77nwU1WtMOkf
 7FtdzEcLWsNhbkBG6FNJ0ogpHrSl7LxL8mLhbqy29U0UZDgjvsqAqQ4N35PoqlODXJ1d
 CIbgnFXKKvnAA4FgZNwrJkd2ahJPqsZVWt8VCSUXS0ryZ6KnXhz8/4yANRdiw7SiUTNZ
 N2sZQni3D46JyI4hDbjUMpBpR4YoqyN34KLbp3D3kTbw5gc8Dd3xaygryrcbPS1ZNMQv
 0mlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469806; x=1705074606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nno3VTCeo04e35HOY3p6uYOV1tAtecR5ZW2yhenY0Bs=;
 b=Hv48RDlpvsB1HfG29FhsZvlLKDRXoy66anVJ2Sk/xN67XlLq4ZC5Tfv7kP67IuHK3M
 0M8yP/ohr58+Hlx44+zbhPzDAYvfVsPlazbNt2q5NWn5MDEANdCaO9CiJEdftz2Am4f5
 7YwjiuVl4pJkZwyYmzKZ/JF3mUtG09n8X5cIz3+vpeC+26/2EDa5VGrT/X7dgrPrE5oe
 Ho6QGhghCXcTAs31X60oxStpRfaiAngmAroJmN0ovo1AocPghJE5A/zpyOg0hHd0Iou9
 2cpf9zN7b1I3E0Tk5NxoLvo6S6cV/ACsUdqqYEH3+zZMf8+fNPnHlzfEC6sB1Az8S0Ol
 FOzg==
X-Gm-Message-State: AOJu0YzmgqewaLmNsudsGzTeZ7ptyzfP/3zzSdRzHX4o3olmDH59FH63
 g2awvG1JkAiTRwH0TQQxYZPGm+Ps0fxRA0VroeqqvUmQ5kU=
X-Received: by 2002:a5d:62d0:0:b0:337:5cf8:b12a with SMTP id
 o16-20020a5d62d0000000b003375cf8b12amr235231wrv.135.1704469806693; 
 Fri, 05 Jan 2024 07:50:06 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 q9-20020a05600000c900b003367eae8e18sm1623623wrx.57.2024.01.05.07.50.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:50:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 69/71] hw/m68k/mcf5206: Embed m5206_timer_state in
 m5206_mbar_state
Date: Fri,  5 Jan 2024 16:43:02 +0100
Message-ID: <20240105154307.21385-70-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Ai3nH05h4kDn

From: Thomas Huth <huth@tuxfamily.org>

There's no need to explicitely allocate the memory here, we can
simply embed it into the m5206_mbar_state instead.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231221122939.11001-1-huth@tuxfamily.org>
---
 hw/m68k/mcf5206.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/hw/m68k/mcf5206.c b/hw/m68k/mcf5206.c
index a46a23538d..183fd3cc08 100644
--- a/hw/m68k/mcf5206.c
+++ b/hw/m68k/mcf5206.c
@@ -148,15 +148,11 @@ static void m5206_timer_write(m5206_timer_state *s, uint32_t addr, uint32_t val)
     m5206_timer_update(s);
 }
 
-static m5206_timer_state *m5206_timer_init(qemu_irq irq)
+static void m5206_timer_init(m5206_timer_state *s, qemu_irq irq)
 {
-    m5206_timer_state *s;
-
-    s = g_new0(m5206_timer_state, 1);
     s->timer = ptimer_init(m5206_timer_trigger, s, PTIMER_POLICY_LEGACY);
     s->irq = irq;
     m5206_timer_reset(s);
-    return s;
 }
 
 /* System Integration Module.  */
@@ -167,7 +163,7 @@ typedef struct {
     M68kCPU *cpu;
     MemoryRegion iomem;
     qemu_irq *pic;
-    m5206_timer_state *timer[2];
+    m5206_timer_state timer[2];
     DeviceState *uart[2];
     uint8_t scr;
     uint8_t icr[14];
@@ -293,9 +289,9 @@ static uint64_t m5206_mbar_read(m5206_mbar_state *s,
                                 uint16_t offset, unsigned size)
 {
     if (offset >= 0x100 && offset < 0x120) {
-        return m5206_timer_read(s->timer[0], offset - 0x100);
+        return m5206_timer_read(&s->timer[0], offset - 0x100);
     } else if (offset >= 0x120 && offset < 0x140) {
-        return m5206_timer_read(s->timer[1], offset - 0x120);
+        return m5206_timer_read(&s->timer[1], offset - 0x120);
     } else if (offset >= 0x140 && offset < 0x160) {
         return mcf_uart_read(s->uart[0], offset - 0x140, size);
     } else if (offset >= 0x180 && offset < 0x1a0) {
@@ -333,10 +329,10 @@ static void m5206_mbar_write(m5206_mbar_state *s, uint16_t offset,
                              uint64_t value, unsigned size)
 {
     if (offset >= 0x100 && offset < 0x120) {
-        m5206_timer_write(s->timer[0], offset - 0x100, value);
+        m5206_timer_write(&s->timer[0], offset - 0x100, value);
         return;
     } else if (offset >= 0x120 && offset < 0x140) {
-        m5206_timer_write(s->timer[1], offset - 0x120, value);
+        m5206_timer_write(&s->timer[1], offset - 0x120, value);
         return;
     } else if (offset >= 0x140 && offset < 0x160) {
         mcf_uart_write(s->uart[0], offset - 0x140, value, size);
@@ -598,8 +594,8 @@ static void mcf5206_mbar_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
 
     s->pic = qemu_allocate_irqs(m5206_mbar_set_irq, s, 14);
-    s->timer[0] = m5206_timer_init(s->pic[9]);
-    s->timer[1] = m5206_timer_init(s->pic[10]);
+    m5206_timer_init(&s->timer[0], s->pic[9]);
+    m5206_timer_init(&s->timer[1], s->pic[10]);
     s->uart[0] = mcf_uart_create(s->pic[12], serial_hd(0));
     s->uart[1] = mcf_uart_create(s->pic[13], serial_hd(1));
 }
-- 
2.41.0

