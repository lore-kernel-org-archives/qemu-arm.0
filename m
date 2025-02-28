Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp1104330njb;
        Fri, 28 Feb 2025 09:49:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXJJp8IccvSytJTzyw73NRxB0Ewx3pmChoZF0QPBMkURkhowB89EoRSGlPs93OdnW3zyMV+rFL0Ni8ZPA==@linaro.org
X-Google-Smtp-Source: AGHT+IEp9Xk1bSkpctHJh9+pWQ7o8JhNhCfMiSKwE+yrPZP35s1EpD3ryN538vUH+a1fnH2+1Q00
X-Received: by 2002:a05:620a:4144:b0:7c0:c568:2ab9 with SMTP id af79cd13be357-7c39c60ea76mr614277985a.35.1740764939723;
        Fri, 28 Feb 2025 09:48:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740764939; cv=none;
        d=google.com; s=arc-20240605;
        b=cHc+6flEUMKGNz0YSDRo0aD+X/ZnAo3SnGikPCnHtUW6hdGhOv25g+QDno84PJmvk6
         VK6AU4unlD4HPl4X7xX03TAfpia5yxQn/LoJpw+2cbKrRtQz3lZ21ThjPl2RQ+pTdIg5
         EXU7NbyCPkhN/ATEqJ+Hf3pPsGzVIx3DTSUrFCwOwjuuoAfK50wB3xECYUlPMWS4SxB0
         3UirCoKUsa70OobFVFdEAbeqYWGUHwVwsBqHskkH27+50RRjlxnJn4qO3JgCY6fOVItQ
         NoBy5PihBlPwCmorNQVHHchLMF0ed1vId7jS4Ygm1M7O0z4P9ITtBHq+Q55FzJJAOAKD
         tmmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eN07gCc2oP06ECRd8sreJOokFNA6cGgOnl4Jc0WaVu4=;
        fh=MLHM+gxpjdRCX46UmlsHJq+wyb7s5ougP82NtFt1JKc=;
        b=KAkOnoqhcyd+FbDK+dKqCZX1B9s3lBbS02cN9bl59etb8g0KU2pX1unKy29tpMpXRm
         xAoBzBZkGWfCxLKMOmCkIlSN6VF4E1uoHFhjKI6JDMZ6oKyLCg4xZqEv+gRBLLHPctgG
         OIO7l0Bci3Sl1kCrrwZVnyLGUOVTm+fSPXba5D87XJXBYrLh32CJuJszaDNO9TJC2FZR
         TaNS34hza1DDkfaoLDwav2czvnyohmjw31hFvD+Gh8LsGCWHa5u7tYxUmmnUHfs+Kto3
         j1T5/KeW63QRKoP3h9Ci2bSlNQO8wprZxsRnkF0uLxrg6IcZzorIwHO5H/TgyUmx0846
         uZqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w4k8A0Ar;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c36fee8367si358873285a.56.2025.02.28.09.48.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2025 09:48:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w4k8A0Ar;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1to4TC-0007Wc-7a; Fri, 28 Feb 2025 12:48:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1to4T7-0007RE-Ce
 for qemu-arm@nongnu.org; Fri, 28 Feb 2025 12:48:13 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1to4T2-0005Mf-G9
 for qemu-arm@nongnu.org; Fri, 28 Feb 2025 12:48:10 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4398ec2abc2so21834725e9.1
 for <qemu-arm@nongnu.org>; Fri, 28 Feb 2025 09:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740764886; x=1741369686; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eN07gCc2oP06ECRd8sreJOokFNA6cGgOnl4Jc0WaVu4=;
 b=w4k8A0ArvYP84JD1o+L4/HEwueeIZ4o9XETaih4MKeiD2BFqS//Zi339KMooC4Hp9q
 aeZmHIGZT8pwWNRfTsuWO8gs8pZg1sTX9gesYtSHUa/NSFZ8bzW2g7FyXIDLjr2HMW9t
 MwQ3dPhoqjKhGpjM8sCYiEA4iSqNxHKhUPDMVew6tqYv5wfABuKarMJ+Di3Ph3K60UvY
 W/+8rSqLiVyX0o9NrbXYRCE93ugzGbyQe6EVv3mQ8EvORRSHnlTlDzchiJZuajYUk/EC
 Arg1HqGUKkTeDequbHZTaoQ8vNAhivPsQX+WIjQcz+XE9/eltyerghJ0IJk22dsnqJ91
 lNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740764886; x=1741369686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eN07gCc2oP06ECRd8sreJOokFNA6cGgOnl4Jc0WaVu4=;
 b=OSdqIsyJO5ko6IwwPQRHei2YlWZs2Nsm7SrMigB5y86xpj0KJQ3R3BSxfQL2Aj7tWI
 Tp/Qs3c3eV0/phjfek9iH54RivfV9K+0FRt2Y/ErZXwCbak5IWTyMM5xl78i3oqCz2Ij
 GdDBayAORl8Q0kDAOtVd2UsecTbopdjmD0+MLPB3u8h6EoYebFLoZQrq2Dg72Lo5N+il
 1sxOOXL7dPFObawJ6/relplBVnVwd7sL9PrRmnJqFc6oCbO9APjCsRC9ED8pzXPZMfmX
 sPQVgyTDa749+X7lpPJpE2eICuaMuV1RKaJhgIGf+CndlmxC90BzXp6ZVsvAufT7bwRs
 BHpw==
X-Gm-Message-State: AOJu0YxGw4O8zB/bvNYT6tw4Cv06yfWvSfYAlM/pdQifbZcC9609ZVM4
 posZ+RwJP9Sub2mKCAXJ8ogEdVjhTJh2WPErViB3NceC0EEWTEOb/VKnQ+eJEeqP5xJRmMitcr7
 2
X-Gm-Gg: ASbGncvMBEvPH+6GDh8ffFMKz8Z3UsZEu0ke4nKE+RryNq64QZGaOWL8kIuD4O7GpAn
 iCS0C7ypqVB4fx02afI3u02oym8Uw4Cqsm5MoEsUUw1flbGDZ2/IHx7tTxK2rB7TPGJ+bR+KsZ1
 YjPVp821EN0XHys3hmUMzrdsTVuWWnzWtlffJBt9GlOHgBISQTW7/wYIw+0P8jn2M9iBWf/HaCJ
 NRul58t8C9dsUwoZarBhHYn1P/tdecShr4C/ZnFYGwkNUn7U6YtKKtiX1/NKVO0Nb6NomODTCm1
 Zi7YQoNH/Upg5yIqYExqOiLPstmYrr8D
X-Received: by 2002:a05:600c:1d82:b0:439:9543:9488 with SMTP id
 5b1f17b1804b1-43ba6727b65mr33765805e9.21.1740764885856; 
 Fri, 28 Feb 2025 09:48:05 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e4795da5sm5979556f8f.15.2025.02.28.09.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 09:48:04 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	Jason Wang <jasowang@redhat.com>
Subject: [PATCH 1/3] hw/net/smc91c111: Sanitize packet numbers
Date: Fri, 28 Feb 2025 17:47:59 +0000
Message-ID: <20250228174802.1945417-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250228174802.1945417-1-peter.maydell@linaro.org>
References: <20250228174802.1945417-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 6v9Gp0/oRA6o

The smc91c111 uses packet numbers as an index into its internal
s->data[][] array. Valid packet numbers are between 0 and 3, but
the code does not generally check this, and there are various
places where the guest can hand us an arbitrary packet number
and cause an out-of-bounds access to the data array.

Add validation of packet numbers. The datasheet is not very
helpful about how guest errors like this should be handled:
it says nothing on the subject, and none of the documented
error conditions are relevant. We choose to log the situation
with LOG_GUEST_ERROR and silently ignore the attempted operation.

In the places where we are about to access the data[][] array
using a packet number and we know the number is valid because
we got it from somewhere that has already validated, we add
an assert() to document that belief.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/net/smc91c111.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index 0e13dfa18b2..2295c6acf25 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -118,6 +118,11 @@ static const VMStateDescription vmstate_smc91c111 = {
 #define RS_TOOSHORT     0x0400
 #define RS_MULTICAST    0x0001
 
+static inline bool packetnum_valid(int packet_num)
+{
+    return packet_num >= 0 && packet_num < NUM_PACKETS;
+}
+
 /* Update interrupt status.  */
 static void smc91c111_update(smc91c111_state *s)
 {
@@ -218,6 +223,17 @@ static void smc91c111_pop_tx_fifo_done(smc91c111_state *s)
 /* Release the memory allocated to a packet.  */
 static void smc91c111_release_packet(smc91c111_state *s, int packet)
 {
+    if (!packetnum_valid(packet)) {
+        /*
+         * Data sheet doesn't document behaviour in this guest error
+         * case, and there is no error status register to report it.
+         * Log and ignore the attempt.
+         */
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "smc91c111: attempt to release invalid packet %d\n",
+                      packet);
+        return;
+    }
     s->allocated &= ~(1 << packet);
     if (s->tx_alloc == 0x80)
         smc91c111_tx_alloc(s);
@@ -239,6 +255,8 @@ static void smc91c111_do_tx(smc91c111_state *s)
         return;
     for (i = 0; i < s->tx_fifo_len; i++) {
         packetnum = s->tx_fifo[i];
+        /* queue_tx checked the packet number was valid */
+        assert(packetnum_valid(packetnum));
         p = &s->data[packetnum][0];
         /* Set status word.  */
         *(p++) = 0x01;
@@ -287,6 +305,17 @@ static void smc91c111_do_tx(smc91c111_state *s)
 /* Add a packet to the TX FIFO.  */
 static void smc91c111_queue_tx(smc91c111_state *s, int packet)
 {
+    if (!packetnum_valid(packet)) {
+        /*
+         * Datasheet doesn't document behaviour in this error case, and
+         * there's no error status register we could report it in.
+         * Log and ignore.
+         */
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "smc91c111: attempt to queue invalid packet %d\n",
+                      packet);
+        return;
+    }
     if (s->tx_fifo_len == NUM_PACKETS)
         return;
     s->tx_fifo[s->tx_fifo_len++] = packet;
@@ -457,6 +486,13 @@ static void smc91c111_writeb(void *opaque, hwaddr offset,
                     n = s->rx_fifo[0];
                 else
                     n = s->packet_num;
+                if (!packetnum_valid(n)) {
+                    /* Datasheet doesn't document what to do here */
+                    qemu_log_mask(LOG_GUEST_ERROR,
+                                  "smc91c111: attempt to write data to invalid packet %d\n",
+                                  n);
+                    return;
+                }
                 p = s->ptr & 0x07ff;
                 if (s->ptr & 0x4000) {
                     s->ptr = (s->ptr & 0xf800) | ((s->ptr + 1) & 0x7ff);
@@ -605,6 +641,13 @@ static uint32_t smc91c111_readb(void *opaque, hwaddr offset)
                     n = s->rx_fifo[0];
                 else
                     n = s->packet_num;
+                if (!packetnum_valid(n)) {
+                    /* Datasheet doesn't document what to do here */
+                    qemu_log_mask(LOG_GUEST_ERROR,
+                                  "smc91c111: attempt to read data from invalid packet %d\n",
+                                  n);
+                    return 0;
+                }
                 p = s->ptr & 0x07ff;
                 if (s->ptr & 0x4000) {
                     s->ptr = (s->ptr & 0xf800) | ((s->ptr + 1) & 0x07ff);
@@ -713,6 +756,8 @@ static ssize_t smc91c111_receive(NetClientState *nc, const uint8_t *buf, size_t
         return -1;
     s->rx_fifo[s->rx_fifo_len++] = packetnum;
 
+    /* allocate_packet() will not hand us back an invalid packet number */
+    assert(packetnum_valid(packetnum));
     p = &s->data[packetnum][0];
     /* ??? Multicast packets?  */
     status = 0;
-- 
2.43.0

