Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp50929lfg;
        Tue, 23 Feb 2021 15:00:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwk1lKYH+EGlQ5sSxGPAMsktCwYSLsxfOaGRPhJNsrCaUvWyHOCauE10LqF2waALQ/cqOdf
X-Received: by 2002:a5d:9d58:: with SMTP id k24mr22049251iok.125.1614121217993;
        Tue, 23 Feb 2021 15:00:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614121217; cv=none;
        d=google.com; s=arc-20160816;
        b=Y40Oi9ZVfHXQkR5YKEa0u/pwwPI9eXl2RpW2l5jlMA6KSRU/DYlmufs/pm9xsUyECh
         /yfQGLDZJIEX4EPpU3bqClp7gWrv59IEFmXYP10wEbMRctlQ4WOhy6RNcyPkqHeThop3
         lSZCKXi8LkodyOB7VfJlDwlUyehTX5Qyw4W45K347+KANhYzppw2lNGMlLpqIyxD0bov
         x8oOualQa21mFUDI7SbO2HmbhQBsTnMITlQFKBuIiZdR0C5Ei+vEcyametUTfBlz8flr
         Rj9oC437tawKtfD5DwDVMM0hIRVI2uqwxH+quPebjXIwjFD7FlGUrIx9p14Jd2XXgEq0
         dU2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kFj03blwbcM66TuxYye9XnlpLa3NkLZCnKGhAwTXsCo=;
        b=RHvVrAEpWibAJaqzdx2bl/n3S21sWqMDVYiLPeDfE7AbzOswITUPQI3d1HSY4iZ4GB
         LE1i9+3q/T6AT0A0WrYKqW5X0v4Q5U7CbnxAT/qnc3keOaSANUp88KWNDy9OMaEtVSve
         vGxyhD6HNLpo9O+gY6ym8wPmWHPuzje29lMk+utkIevgxxM2XTvBym61kiv2CT7XaFLr
         0ZXSF602ApWtGxTQRDyStgRuvtlnMj4F/v/at6xVNAuVdhNWgDOo8t+6SYVGfjkhoO/u
         WbaBJGiqnkt7xpDZVuv2xqy4hAb8VuJ3w23p8XTud9RzKDgxCoOScXUtIJNoB9GYpv8i
         EiTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ojkRGJkR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t20si3395473jam.64.2021.02.23.15.00.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Feb 2021 15:00:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ojkRGJkR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lEgfB-0007a9-9M
	for alex.bennee@linaro.org; Tue, 23 Feb 2021 18:00:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lEgZ8-0002AM-0m; Tue, 23 Feb 2021 17:54:03 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:33915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lEgZ5-00022d-02; Tue, 23 Feb 2021 17:54:01 -0500
Received: by mail-ej1-x634.google.com with SMTP id hs11so91540ejc.1;
 Tue, 23 Feb 2021 14:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kFj03blwbcM66TuxYye9XnlpLa3NkLZCnKGhAwTXsCo=;
 b=ojkRGJkRsPNeqiOoXgOpmpfHhd3y3FD+hD49ccnwgx8h5kCp/oS3/IMxPMGzSmv8XF
 44agrTSkH/5Yw3Aadj7GxDhFCnQG2w/R+U8l87+kPMgIlmbrWhTPfjC0WDk6K2Dug5lg
 j7EBxguSjnIrH6dqEVa+gdtJYuDz4p133M6V+EK/fI6bgZXAJDLyhjLpBv3mW6gVnCks
 ww/WDkj0BMshOGkIhUaDUYDzn2tADdmJymrSAGd3uML6QhL5yNRcLEix151weS73kazf
 rSy72WietYapCkjknlSdjm7FEJU22522hBkeBXSzWppPW1AJDwlqQMgbDmOGxMmu8MxT
 +M4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kFj03blwbcM66TuxYye9XnlpLa3NkLZCnKGhAwTXsCo=;
 b=CfPTbNCmI7GTqnCpfPfDEJeLRH03WXlkr6HueLqmn6J5qDvneDbKJBHvDop5BWlBiY
 gn/UNLF+Df3zlxsr3RzubJ0Tr2Z8rOgpvqEBChhiQdqhV23C1qF6coy/o43CPp4Gw7Cu
 Cx1IP6prnQk0FqSLL7rVsUemzjxO0hWQYdoPLGp3CVhTKBJpSpoCGW0Q6HG7JbW/qD8Q
 FNH/ihN+ml54KzMNj4MRHoHD3GJHl2hBSXDbzswGpMVreG25ZjDBfNm7Fah3vpDAmdz+
 ML1LHxXOwYN/akx5/HaiAD0f900sEsJ/prgxSfyG1EIkgtgC2ktFF+ImtfQZ1MwObukK
 upxg==
X-Gm-Message-State: AOAM530JFbxw7cH0s0Vm6pabZtBx6v0RjP7c34bZ3brNla0ozS00Z4AW
 MMayKpiiP1a5S0mD6td0fiZApWH5HNc=
X-Received: by 2002:a17:907:9619:: with SMTP id
 gb25mr9262235ejc.64.1614120837252; 
 Tue, 23 Feb 2021 14:53:57 -0800 (PST)
Received: from localhost.localdomain
 (2a02-a456-6be8-1-9f7b-4035-6320-cb66.fixed6.kpn.net.
 [2a02:a456:6be8:1:9f7b:4035:6320:cb66])
 by smtp.gmail.com with ESMTPSA id u15sm55752ejy.48.2021.02.23.14.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 14:53:56 -0800 (PST)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] hw/net/allwinner-sun8i-emac: traverse transmit queue
 using TX_CUR_DESC register value
Date: Tue, 23 Feb 2021 23:53:27 +0100
Message-Id: <20210223225327.26700-3-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210223225327.26700-1-nieklinnenbank@gmail.com>
References: <20210223225327.26700-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, f4bug@amsat.org, b.galvani@gmail.com,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Pavel.Dovgaluk@ispras.ru, crosa@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5G/q7sBkcYDS

Currently the emulated EMAC for sun8i always traverses the transmit queue
from the head when transferring packets. It searches for a list of consecutive
descriptors whichs are flagged as ready for processing and transmits their payloads
accordingly. The controller stops processing once it finds a descriptor that is not
marked ready.

While the above behaviour works in most situations, it is not the same as the actual
EMAC in hardware. Actual hardware uses the TX_CUR_DESC register value to keep track
of the last position in the transmit queue and continues processing from that position
when software triggers the start of DMA processing. The currently emulated behaviour can
lead to packet loss on transmit when software fills the transmit queue with ready
descriptors that overlap the tail of the circular list.

This commit modifies the emulated EMAC for sun8i such that it processes
the transmit queue using the TX_CUR_DESC register in the same way as hardware.

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/allwinner-sun8i-emac.c | 58 +++++++++++++++++++----------------
 1 file changed, 32 insertions(+), 26 deletions(-)

diff --git a/hw/net/allwinner-sun8i-emac.c b/hw/net/allwinner-sun8i-emac.c
index 042768922c..e586c147e5 100644
--- a/hw/net/allwinner-sun8i-emac.c
+++ b/hw/net/allwinner-sun8i-emac.c
@@ -339,35 +339,40 @@ static void allwinner_sun8i_emac_update_irq(AwSun8iEmacState *s)
     qemu_set_irq(s->irq, (s->int_sta & s->int_en) != 0);
 }
 
-static uint32_t allwinner_sun8i_emac_next_desc(AwSun8iEmacState *s,
-                                               FrameDescriptor *desc,
-                                               size_t min_size)
+static bool allwinner_sun8i_emac_desc_owned(FrameDescriptor *desc,
+                                            size_t min_buf_size)
 {
-    uint32_t paddr = desc->next;
+    return (desc->status & DESC_STATUS_CTL) && (min_buf_size == 0 ||
+           (desc->status2 & DESC_STATUS2_BUF_SIZE_MASK) >= min_buf_size);
+}
 
-    dma_memory_read(&s->dma_as, paddr, desc, sizeof(*desc));
+static void allwinner_sun8i_emac_get_desc(AwSun8iEmacState *s,
+                                          FrameDescriptor *desc,
+                                          uint32_t phys_addr)
+{
+    dma_memory_read(&s->dma_as, phys_addr, desc, sizeof(*desc));
+}
 
-    if ((desc->status & DESC_STATUS_CTL) &&
-        (desc->status2 & DESC_STATUS2_BUF_SIZE_MASK) >= min_size) {
-        return paddr;
-    } else {
-        return 0;
-    }
+static uint32_t allwinner_sun8i_emac_next_desc(AwSun8iEmacState *s,
+                                               FrameDescriptor *desc)
+{
+    const uint32_t nxt = desc->next;
+    allwinner_sun8i_emac_get_desc(s, desc, nxt);
+    return nxt;
 }
 
-static uint32_t allwinner_sun8i_emac_get_desc(AwSun8iEmacState *s,
-                                              FrameDescriptor *desc,
-                                              uint32_t start_addr,
-                                              size_t min_size)
+static uint32_t allwinner_sun8i_emac_find_desc(AwSun8iEmacState *s,
+                                               FrameDescriptor *desc,
+                                               uint32_t start_addr,
+                                               size_t min_size)
 {
     uint32_t desc_addr = start_addr;
 
     /* Note that the list is a cycle. Last entry points back to the head. */
     while (desc_addr != 0) {
-        dma_memory_read(&s->dma_as, desc_addr, desc, sizeof(*desc));
+        allwinner_sun8i_emac_get_desc(s, desc, desc_addr);
 
-        if ((desc->status & DESC_STATUS_CTL) &&
-            (desc->status2 & DESC_STATUS2_BUF_SIZE_MASK) >= min_size) {
+        if (allwinner_sun8i_emac_desc_owned(desc, min_size)) {
             return desc_addr;
         } else if (desc->next == start_addr) {
             break;
@@ -383,14 +388,14 @@ static uint32_t allwinner_sun8i_emac_rx_desc(AwSun8iEmacState *s,
                                              FrameDescriptor *desc,
                                              size_t min_size)
 {
-    return allwinner_sun8i_emac_get_desc(s, desc, s->rx_desc_curr, min_size);
+    return allwinner_sun8i_emac_find_desc(s, desc, s->rx_desc_curr, min_size);
 }
 
 static uint32_t allwinner_sun8i_emac_tx_desc(AwSun8iEmacState *s,
-                                             FrameDescriptor *desc,
-                                             size_t min_size)
+                                             FrameDescriptor *desc)
 {
-    return allwinner_sun8i_emac_get_desc(s, desc, s->tx_desc_head, min_size);
+    allwinner_sun8i_emac_get_desc(s, desc, s->tx_desc_curr);
+    return s->tx_desc_curr;
 }
 
 static void allwinner_sun8i_emac_flush_desc(AwSun8iEmacState *s,
@@ -470,7 +475,8 @@ static ssize_t allwinner_sun8i_emac_receive(NetClientState *nc,
         bytes_left -= desc_bytes;
 
         /* Move to the next descriptor */
-        s->rx_desc_curr = allwinner_sun8i_emac_next_desc(s, &desc, 64);
+        s->rx_desc_curr = allwinner_sun8i_emac_find_desc(s, &desc, desc.next,
+                                                         AW_SUN8I_EMAC_MIN_PKT_SZ);
         if (!s->rx_desc_curr) {
             /* Not enough buffer space available */
             s->int_sta |= INT_STA_RX_BUF_UA;
@@ -495,10 +501,10 @@ static void allwinner_sun8i_emac_transmit(AwSun8iEmacState *s)
     size_t transmitted = 0;
     static uint8_t packet_buf[2048];
 
-    s->tx_desc_curr = allwinner_sun8i_emac_tx_desc(s, &desc, 0);
+    s->tx_desc_curr = allwinner_sun8i_emac_tx_desc(s, &desc);
 
     /* Read all transmit descriptors */
-    while (s->tx_desc_curr != 0) {
+    while (allwinner_sun8i_emac_desc_owned(&desc, 0)) {
 
         /* Read from physical memory into packet buffer */
         bytes = desc.status2 & DESC_STATUS2_BUF_SIZE_MASK;
@@ -524,7 +530,7 @@ static void allwinner_sun8i_emac_transmit(AwSun8iEmacState *s)
             packet_bytes = 0;
             transmitted++;
         }
-        s->tx_desc_curr = allwinner_sun8i_emac_next_desc(s, &desc, 0);
+        s->tx_desc_curr = allwinner_sun8i_emac_next_desc(s, &desc);
     }
 
     /* Raise transmit completed interrupt */
-- 
2.25.1

