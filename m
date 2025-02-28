Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp1104422njb;
        Fri, 28 Feb 2025 09:49:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV8BmKTovL0uiT4hlHffq1T/x2HpX6cl0RQyyS2yDngeQKKIGwypXCgb+yJ90dmPrTWeYz5qCzfwOdunA==@linaro.org
X-Google-Smtp-Source: AGHT+IGkYrfcWjUJXxyJEJ7coUrDpJ3KhJ9M20pgff9SYP7/BBO/I+nt4BxgZW5/m9QaTMqH4HLg
X-Received: by 2002:a05:6214:2462:b0:6e6:5d9a:9171 with SMTP id 6a1803df08f44-6e8a0d38fb7mr69434586d6.23.1740764950579;
        Fri, 28 Feb 2025 09:49:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740764950; cv=none;
        d=google.com; s=arc-20240605;
        b=FP58lto6+rwqQz7w8MrHFTl5W7dRxr2dmTWUaM/Q7aAIASD3X8oNZsd/OA+ZaxgaxP
         zn/7oNM10eHqvp57e9MZcbYmJsNTw+BdiefaKPYy5902JUH5PKXglf07qHip8CWz7quV
         OgDS0cBDn32iTEsvVni374uWcr9xbtEvY7otvPDr1Un5lJiF04Ciy0du+q0xROre3TMt
         7EgOW366lDBvZ8x4NoRSj+cVeT0q/B7Oa8RNegpdDr/kgnAr19vsxXQuDqbwGmqZ6Ths
         HErG36nrNb0hYsQOrs9dTbGA0H8AxtiXh9Or2lCTmsfrV4hW2+3GyVrUzTBCRc6XI4S+
         rfKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IrK81ur78/kd+G6F3kTwFNDWhB4gkURHyE9BpPtQ7cw=;
        fh=MLHM+gxpjdRCX46UmlsHJq+wyb7s5ougP82NtFt1JKc=;
        b=LR0rOFRamS9G4dLOd4GDu6TiNqlwHYYxKbkC4M/VAC6PYrVzr2jhvAm+LerLXabNx0
         tStP+uSUFxhJ9NtW71e0NfduDqxjwz37TDMJ/5fR1CSfeMfez7lXbzUjfbcO6FWVSrnj
         9poTelCele7Ibdn4+adGNqTHgKvXRQmW6GySe0Zr2YFR1P6rywES8FouJ949zEPYynCA
         avk7ociI9D/FjjhVi7iF+PRN0e/G/d283WyfaEKtkBze5MmPJsB1mT8AtOUyzUXkO6WW
         z8c8+LBlMoiWQuv1Pse48zXNsOiIXppJ/MiaEUMfkHfW0aNnWY1DOqXFWiov75CdWX3u
         86hQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QBOc97TG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e897600992si35718806d6.131.2025.02.28.09.49.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2025 09:49:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QBOc97TG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1to4TU-0007hR-R4; Fri, 28 Feb 2025 12:48:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1to4TA-0007V6-PG
 for qemu-arm@nongnu.org; Fri, 28 Feb 2025 12:48:17 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1to4T7-0005Nv-Bp
 for qemu-arm@nongnu.org; Fri, 28 Feb 2025 12:48:16 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4399deda4bfso16306615e9.0
 for <qemu-arm@nongnu.org>; Fri, 28 Feb 2025 09:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740764889; x=1741369689; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IrK81ur78/kd+G6F3kTwFNDWhB4gkURHyE9BpPtQ7cw=;
 b=QBOc97TGU8coZO044vEU6iTAKItSwICwtQISKtLa2GOW+8OnQ6+ul9FvydAtewPPsp
 msjB1qbA6ctTPeyqdwjcj6qHTmoibwd/UnejUaXOmmnMxDHSHbWH3teOm2kE0U/0OzI/
 xk/G6guV21LwMdpWFz+nxnJl8eIdw9lHQQSogQC7IB6mgyR79XRNqghRcx6EWnHc9G/O
 KA2MqBta7ERHat740P5iILxL+eQNIX+UkhpzxqlOqNBqmV9dzOwBfDJwb0cT0K4IO5Wj
 /8z/HY5YLKQ8SrxD/37jr8yAuGqjjnLLzU1hiV4wiA1E8olV7b1bT1wjVa+OwtXgU29c
 zADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740764889; x=1741369689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IrK81ur78/kd+G6F3kTwFNDWhB4gkURHyE9BpPtQ7cw=;
 b=bPHAEQJpf/Kq94HijKPMtNzeyMuK54QbZh9/16ohNL3Zo5zlzbntZ2fRc1tZQtap7z
 Fb+hGZ2OCX7tJ/6VBzUQIliZV010qOu520TIaIPX4rSNBtbSlEU+fr2gFSpIZmenbYYC
 mIzdH8JdNhY9aLxxHgLMz8iCK0PItsLE4hJm4ODzApWa9xZ+9f0UFgrSZ2e3kmcDn6BL
 kIbTrfd5wDmNdXB5tCnYWDXrSndF5G38+r7jnl7/vCGD1jX9TUPMx/oJVLtryHCbQX0K
 zjRTjcm6xZuAkc7KRURKqj5VLeff2Cz7km3TRRh4rmwnVS1/X52UlZ73bGNCMnoRdt+T
 arow==
X-Gm-Message-State: AOJu0YyvU+2tPmTVxgqiuvNhSwvWygyFmTg3hZV8zGCqSJA1DZk2CKJs
 Bxpl7DmJ/9oyKxsnEBP79pXRJ/YjgN29NsGZ8JRC88hCI7gdGQkm97i66s5ocVKxsFXQ/HeLYf0
 a
X-Gm-Gg: ASbGncuJWNuEvzThzaRpxjS6WC34vKuRvpOajPJU8/ixQ0mA6Fv688ANWqY7QUs5bsM
 32Xm76rq5e9rFj5WCGEJT9waBI2a5qz2qKYhEg0P26pyHvhkzZo6AJ1jVHrVyh65kM9ocCUEccY
 h1gARHZctg3Z9jPNbi2Wrr6A0EPRW1t0VFJLdv/bqU8mIevmabs2HoLpUSfW5Ry8h+e/sBSLXtd
 QWZjRVI2L8TVcKNhmvo8bvTz8HBQJ/MXwLm9UZxNZI91uNA7cj7OG8j+rLFs1hLaCCJHczUL6FB
 2pVQF2Pm7nN1D4OVtRt1/htrzZwjMajt
X-Received: by 2002:a05:6000:401f:b0:38f:38eb:fcfc with SMTP id
 ffacd0b85a97d-390ec7c7fefmr3526755f8f.7.1740764889367; 
 Fri, 28 Feb 2025 09:48:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e4795da5sm5979556f8f.15.2025.02.28.09.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 09:48:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	Jason Wang <jasowang@redhat.com>
Subject: [PATCH 3/3] hw/net/smc91c111: Use MAX_PACKET_SIZE instead of magic
 numbers
Date: Fri, 28 Feb 2025 17:48:01 +0000
Message-ID: <20250228174802.1945417-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250228174802.1945417-1-peter.maydell@linaro.org>
References: <20250228174802.1945417-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: VnV1ZW0dhnsN

Now we have a constant for the maximum packet size, we can use it
to replace various hardcoded 2048 values.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/net/smc91c111.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index 23ca99f926a..4a8f867d96e 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -58,7 +58,7 @@ struct smc91c111_state {
     int tx_fifo_done_len;
     int tx_fifo_done[NUM_PACKETS];
     /* Packet buffer memory.  */
-    uint8_t data[NUM_PACKETS][2048];
+    uint8_t data[NUM_PACKETS][MAX_PACKET_SIZE];
     uint8_t int_level;
     uint8_t int_mask;
     MemoryRegion mmio;
@@ -86,7 +86,8 @@ static const VMStateDescription vmstate_smc91c111 = {
         VMSTATE_INT32_ARRAY(rx_fifo, smc91c111_state, NUM_PACKETS),
         VMSTATE_INT32(tx_fifo_done_len, smc91c111_state),
         VMSTATE_INT32_ARRAY(tx_fifo_done, smc91c111_state, NUM_PACKETS),
-        VMSTATE_BUFFER_UNSAFE(data, smc91c111_state, 0, NUM_PACKETS * 2048),
+        VMSTATE_BUFFER_UNSAFE(data, smc91c111_state, 0,
+                              NUM_PACKETS * MAX_PACKET_SIZE),
         VMSTATE_UINT8(int_level, smc91c111_state),
         VMSTATE_UINT8(int_mask, smc91c111_state),
         VMSTATE_END_OF_LIST()
@@ -773,8 +774,9 @@ static ssize_t smc91c111_receive(NetClientState *nc, const uint8_t *buf, size_t
     if (crc)
         packetsize += 4;
     /* TODO: Flag overrun and receive errors.  */
-    if (packetsize > 2048)
+    if (packetsize > MAX_PACKET_SIZE) {
         return -1;
+    }
     packetnum = smc91c111_allocate_packet(s);
     if (packetnum == 0x80)
         return -1;
-- 
2.43.0

