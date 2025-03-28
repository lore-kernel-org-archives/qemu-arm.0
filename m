Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp519362njd;
        Fri, 28 Mar 2025 06:53:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXEaaLBoIl5iHdDNB5LsDdVpNKlWToKXDpwKoHHkzs1NwdOF16Tyx9onN42u8uS+KRjMGKdC6LMVfzblw==@linaro.org
X-Google-Smtp-Source: AGHT+IGjo33mcqelDhR2ZLsluZP6Y2/KASUj3f+xFSELQIq6VkBHFgt4tfGPWZgjMlcTnxWH3JJi
X-Received: by 2002:a05:6214:2488:b0:6e4:442c:288b with SMTP id 6a1803df08f44-6ed23872a9bmr94470746d6.11.1743170023381;
        Fri, 28 Mar 2025 06:53:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743170023; cv=none;
        d=google.com; s=arc-20240605;
        b=R6Fhyc8F/YGztxxeNEB3EiylYChcFLmkyI9rdxIbnWL49ZGqYITG/P660jFU7BPZ5V
         Vx82PKhM7wXkbq2RjxW+u1q4WhBHQgUgHrmwYzePGTy3P+NPQmT3LSBZn2CcewGYuhwW
         Cl+8pPwiBiHmcgOd4hYyDEzAm0pO9sw33IYcFIuOq0i+d13ElqmAC+gONLfWxAiaItV+
         mPu0M4uATO/VUPaSzr/6xlcUv7y44L5z7AGbeuyljDSYRU/8Vy5CWFIMu8Vb3aITh4Bk
         KSAM/84nLOLe24bzazTYWsWBGuqyZePSYYIekI4LrPJD4YyVRXBf6kORos6KeI5Dp84U
         QqAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=WiTIidWjMJqd8oLb6wM5KyQa94Tn9UVZRYndjHXZIjY=;
        fh=EzCxon3bQkSFsh1SMACAvKeshL8jDnAbpZR4SEV0gRQ=;
        b=Pfqz4W2BOrIy5g8/f6zcvu+Sq9P42SeXlaZvtZ/jDc+U0M++czf5aox2a6DOAxHWXC
         LHfjQwUxHTeVqV88M+mAmZdIBEv3ybRW6EdeIkADOWzHfExz8qlp6xcZxUHxAo5lyKj+
         jnYRvvJKUC7/hjPBEp0QYlMmEwY7/d+0KGr5Hwuhdns7cgLbBdJHUAFQoYsZRhI4ejtK
         UwHTrqW288Bz2qmvli3jBU5RHtwmWQFvLfwcl0xS6RnKmfSCaoAc032etUzFXwHPodNa
         epqWiODkV82F6yJcDrjZ6LcQiW4FZLCxkwZDIaazGKSsI3tHxje9NCaqHuyZ7bh5qSPd
         /F9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=mdC3iLFb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eec9788d5dsi18616646d6.233.2025.03.28.06.53.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Mar 2025 06:53:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=mdC3iLFb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tyA9Q-0002gA-Ho; Fri, 28 Mar 2025 09:53:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yeechen0207@gmail.com>)
 id 1ty8yn-0001qN-GP; Fri, 28 Mar 2025 08:38:34 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yeechen0207@gmail.com>)
 id 1ty8yl-0002St-NX; Fri, 28 Mar 2025 08:38:33 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-22548a28d0cso58386075ad.3; 
 Fri, 28 Mar 2025 05:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743165509; x=1743770309; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WiTIidWjMJqd8oLb6wM5KyQa94Tn9UVZRYndjHXZIjY=;
 b=mdC3iLFbXnCYEXoRxrTnWQHIMU+5hSCJNX8pQxW0172BVcqdsuCIJxzYbjTOErVkep
 hfhujVVrPH56GzBzzQkWO8byztwJg3ywCw+0czQuBpoFpuKfZCdegP2IoimYLGsTDRsg
 +K30uqV5yimdxgMvusUHFaqDTnRRWjtx/PQie6XPdSbfkRUGVi1xY4A9G1swax2nmd7q
 OzZ3v1pmJfOUF/6LdSS1DLBdNKUgEmx6hy8Bd5+YGOP29UserDIL7lZhbzjYqQ2jrkY9
 JClERWcy4aG/rEE6hShlvT+iUwqzkmonPJe/7c31WKtJ6Q4LIje1Nh9vpJuKX43iMj3g
 gtKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743165509; x=1743770309;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WiTIidWjMJqd8oLb6wM5KyQa94Tn9UVZRYndjHXZIjY=;
 b=HmmTt+FKXvPYEvjp0QGaYj/aq7G1Rt4jAVEfD5oQqb5TuZTNcyZoPq/RQEJQ+KbUG0
 y26ZndnI9HJZrQeuC/zrNuCzP0i3Bh+517MKbh+FZS4AK7VWd5rvvYApcjkLkGKDtCsE
 1gErujO6g1YVW5qBKOmp90Jm7OFUahQwY1XtRwB+JZlGHXZfNwJvvNn09LIcxynsfkJb
 hXpOCG2GspyHZK7Y+WK/lhR0C0XWxRv2MizcmRv7A/szSRxdTMrQmTQNAoMF46s5+Ui8
 BdUIdSJ9QsjvBAN77Fyq4dFSIC6nXGwACzKma20bFX56AA8L72G0ulDlxq9JCeUl9soY
 QYlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6NUsLpEQ8N0qGaVjUeNJCthqosp6hCPwZe2DV7t44jvqhXGREVcxk3E3fqaTV87tff4W6ukc1lVNJ@nongnu.org
X-Gm-Message-State: AOJu0YwX2XIyG1wmQHA6svvfcTHpQeBhyOXbrqmTvvSmiz9/Jt2wXCho
 okhm9k384Axsd+BdsBREPJIryw5DjjJR3p8jbdwq35T/rc5GW+w4f7C9oRM2
X-Gm-Gg: ASbGncuT4U2bv09+qiZR7kGYmhkVwxzHVYamsc53MLsM5GIjosAlUa8Cy90QBpBDx9F
 Ngs8DtZ08VpGJVbrJGVWTx8nOaQeV1erN94Nsc7YAFRh6GJb+9wYX2CIcYItAaMEFvl72BtDypR
 7EGycYgm1TIrRUGg4k/GpL85eiDyMyL375Ay+fBPHru+2ryVE1t9Gi8FRDkNtj/4Urq6islX0J3
 Z25UIvbimEYYKXZNKEa0ir9+jzV/wh9QiEnHyUYWTj+VJH2swbVs7l0tW6tmEPUeHZTxXSaP5/I
 n/G9RZ05JCBV/zyfprAV6bjSagyPUjKSQH4qVPygfSIN4SraDH8830Qaqmc0ONu+m3G7snLEtq6
 rZ4eejnQd4Ar65OGYH8okZKHQJycmXITn5A==
X-Received: by 2002:a17:902:ccca:b0:227:ac2a:2472 with SMTP id
 d9443c01a7336-2280486989amr122351335ad.28.1743165509291; 
 Fri, 28 Mar 2025 05:38:29 -0700 (PDT)
Received: from localhost.localdomain (36-230-131-146.dynamic-ip.hinet.net.
 [36.230.131.146]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2291f1f7a2esm16401215ad.238.2025.03.28.05.38.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 28 Mar 2025 05:38:28 -0700 (PDT)
From: Chung-Yi Chen <yeechen0207@gmail.com>
To: qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, philmd@linaro.org, marcandre.lureau@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org,
 Chung-Yi Chen <yeechen0207@gmail.com>
Subject: [PATCH] hw/char/bcm2835_aux: Fix incorrect interrupt ID when RX
 disabled
Date: Fri, 28 Mar 2025 20:37:25 +0800
Message-Id: <20250328123725.94176-1-yeechen0207@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=yeechen0207@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 28 Mar 2025 09:53:35 -0400
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
X-TUID: xJ9+/uHiRrKn

This patch fixes a misconfiguration issue in the read implementation of
the AUX_MU_IIR_REG register. This issue can lead to a transmit interrupt
being incorrectly interpreted as a receive interrupt when the receive
interrupt is disabled and the receive FIFO holds valid bytes.

The AUX_MU_IIR_REG register (interrupt ID bits [2:1]) indicates the
status of mini UART interrupts:

    - 00: No interrupts
    - 01: Transmit FIFO is empty
    - 10: Receive FIFO is not empty
    - 11: <Not possible>

When the transmit interrupt is enabled and the receive interrupt is
disabled, the original code incorrectly sets the interrupt ID bits.
Specifically:

    1. Transmit FIFO empty, receive FIFO empty
        - Expected 0b01, returned 0b01 (correct)
    2. Transmit FIFO empty, receive FIFO not empty
        - Expected 0b01, returned 0b10 (incorrect)

In the second case, the code sets the interrupt ID to 0b10 (receive FIFO
is not empty) even if the receive interrupt is disabled.

To fix this, the patch adds additional condition for setting the
interrupt ID bits to also check if the receive interrupt is enabled.

Reference: BCM2835 ARM Peripherals, page 13. Available on
https://datasheets.raspberrypi.com/bcm2835/bcm2835-peripherals.pdf

Signed-off-by: Chung-Yi Chen <yeechen0207@gmail.com>
---
 hw/char/bcm2835_aux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/char/bcm2835_aux.c b/hw/char/bcm2835_aux.c
index c6e7eccf7d..9b073fc330 100644
--- a/hw/char/bcm2835_aux.c
+++ b/hw/char/bcm2835_aux.c
@@ -98,7 +98,7 @@ static uint64_t bcm2835_aux_read(void *opaque, hwaddr offset, unsigned size)
          * interrupts are active, besides that this cannot occur. At
          * present, we choose to prioritise the rx interrupt, since
          * the tx fifo is always empty. */
-        if (s->read_count != 0) {
+        if ((s->iir & RX_INT) && s->read_count != 0) {
             res |= 0x4;
         } else {
             res |= 0x2;
-- 
2.39.3 (Apple Git-146)

