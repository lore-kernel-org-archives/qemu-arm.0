Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp1104552njb;
        Fri, 28 Feb 2025 09:49:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXfjKnzQiVKs2qHbg9NhUq0Y9KJynBMpM/VHee9Hyd6bRDBbOo0kXR8SgI0kklsryq99ao7TKgfj+jG+Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHt96aDO4N4lEqpLtHdIcwXsk9pJYjbrAdo2isiXwXrS77YfLS/7byqBJ+ppaubyF4ftRvt
X-Received: by 2002:a05:622a:15c9:b0:472:2df:6ff1 with SMTP id d75a77b69052e-474bc06a303mr68037561cf.13.1740764961521;
        Fri, 28 Feb 2025 09:49:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740764961; cv=none;
        d=google.com; s=arc-20240605;
        b=k78GgmGrS0LvTmlqq18eQ+ZA3Ro8Uc/79zk9HHgV/x9QytYGlxz8Z5q+bnGAguIRxP
         Juz9ylazU51mAJR7WlKNI5n3BVBydyT3Sj7U9GCzR1eYFrPqHyS/eH6/qFFf5YtrVU4d
         70RlBm03LcN6sVAs6+QfyJNUzauckw8pB501LwZD/Lo/ymphbhh+RFI6XECg2RBsG3tK
         sOBRj6CQH6ntG9gJlP764uag5vueOfP/Yi1dKA4VqoHp5uT11q3mcd8pgGpGdvl5U3ZD
         exatIYwSzpQQnQV92fBKT0YEuQW6ZJ1Qu3TB6qUFxcWE5Lks0tCUUgyms/kJtVa/MnnZ
         2wJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bK4QMP2l/mN25359h/sPhHBhlHOYz8CuG9/oUAWNxfg=;
        fh=MLHM+gxpjdRCX46UmlsHJq+wyb7s5ougP82NtFt1JKc=;
        b=BBo+0u+kPPA5K/hJlq9EVBXKUNIuXjBO9JbHpqAHZpPBoh92MEwT67m94uP9EVNmea
         thd9fyN1mOwm3Fzyv/AShFFtAHqkndyX7yDBrJVMo0wVH/Y/0TwcbRwBl5q8jJCtbAiv
         SziJ+kFe0FNafifBF50KVOGR7B0lzy2Y+DJLp+2ATh46LQ59h/0mADcqwwiz3cOri1vl
         M93LxIxgWumO0CbDiopb8YKQVtxqCAZ/2FG2M6qcLbuc2JE21bhhdjX62SnpmG2qLiLv
         1C6iznZQZjJhcUwtEfYRIqGsQ6NefWgmKzq0ei6cPT2C6r2lP5GRZHrOlg6I0oTfbHca
         EpgA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sw+Ks4yz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-474723fe377si35009521cf.216.2025.02.28.09.49.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2025 09:49:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sw+Ks4yz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1to4TY-0007sP-LJ; Fri, 28 Feb 2025 12:48:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1to4TB-0007VU-Ab
 for qemu-arm@nongnu.org; Fri, 28 Feb 2025 12:48:17 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1to4T8-0005ND-7M
 for qemu-arm@nongnu.org; Fri, 28 Feb 2025 12:48:16 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4398c8c8b2cso25715045e9.2
 for <qemu-arm@nongnu.org>; Fri, 28 Feb 2025 09:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740764888; x=1741369688; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bK4QMP2l/mN25359h/sPhHBhlHOYz8CuG9/oUAWNxfg=;
 b=sw+Ks4yzndvavcUuaKIA8jcek9EtBFjwE2jeOYr9w0MdiwDFDExBkbGT++Ye1wsrRJ
 1x5TJSpyHZITrR6HX4ymq2qSxdcCOb9AXsIChXUKb3am99FCBzO8eO+rvflDrt31rl0d
 Lszhx3ytxBde4DZqXZ8MlRATkwL1gFrUaMtylIFO8GDV8YdCDF17RbVmxeEbDjVQFZdN
 MIaUZgqctt9FXQNOJd5M0MI2F+7UVf/5p0dsK1GX5W6UhLIE3C2QRkqnPqQ4q9nI1YR3
 q9lGTlnsW/zVutDosijHjMh9ohDmVXS4sHCeI1qHm0f/V4Shujnv77CXpSbkSdUTBjei
 m3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740764888; x=1741369688;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bK4QMP2l/mN25359h/sPhHBhlHOYz8CuG9/oUAWNxfg=;
 b=UORoetZunRRjBu08kRVIQE1eYVCT4FwEZcqD+zy3DIai8iSdZybUhUwRB5K8cniA2V
 Z1GJ89rFT3Pxm8bbsOtxM6GZi/ty3CI/EnkjLfEbD0uLc4fMkJ60JJfeZ8t6y4nPkrpl
 g5U4n4sFApUJDJAfDbKc1g8wbydzfKaGV/yoObvQnogWGDxw9F/0NQVfSObycdFctu24
 dqWf1oE8tTsAm5wFSeh7D19b8VJyzVVFT3S2ViiKy8rkJkHoqgo5Ncs2DeYXLhuLDHyD
 HnJOqkmG/391Mq9p58w+7nacNrJwCKDYWfkGWUQAxGrjtvYhuk81CNZ0K7CVTu6TwlBi
 mSdw==
X-Gm-Message-State: AOJu0YwxO8TFErRpkqtUIVni/tjSfRBBDm5JOl/2xFpxAfs7kRQvNUV4
 PklY9u3cjIkVfm91Vc9VyQ9DSrr5LZalNx4/+5scVZDj96JwhEJvqlM4NONpE4a4QddOXdVK0jM
 d
X-Gm-Gg: ASbGncsnax0hpOmJsQf47poxtIaeVmC109N3dE/FrpaC7LsBz2TrxRv3hau/xA2eYqx
 lwLWFA4Wl58LsYS83o5RlrmSqrsPndVCxiVeCdjaNhpUaKRwK9j8mkXd7849N1QqMMSAy31LBZ7
 anCO9rJtVFn9BW8ucp3UT51ThJ95G9vNZ8GvEHENkYjZyrYyuZHAz5z4vFhCZOxK8yuZtxslWnE
 5OTXMCoWIb1Dqfv+qj+MEhHFUOhfMdlXwtqD4RF/t/KDb96eOsHOEotz9Xn1bg1VymEewKLx188
 oNXOed0zpMRRWwo6500YK6XCc8qq4ReO
X-Received: by 2002:a05:600c:1c1f:b0:439:9eba:93bb with SMTP id
 5b1f17b1804b1-43ba67049b8mr48330735e9.18.1740764887948; 
 Fri, 28 Feb 2025 09:48:07 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e4795da5sm5979556f8f.15.2025.02.28.09.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 09:48:06 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	Jason Wang <jasowang@redhat.com>
Subject: [PATCH 2/3] hw/net/smc91c111: Sanitize packet length on tx
Date: Fri, 28 Feb 2025 17:48:00 +0000
Message-ID: <20250228174802.1945417-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250228174802.1945417-1-peter.maydell@linaro.org>
References: <20250228174802.1945417-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: hpIirFbFA5Ls

When the smc91c111 transmits a packet, it must read a control byte
which is at the end of the data area and CRC.  However, we don't
sanitize the length field in the packet buffer, so if the guest sets
the length field to something large we will try to read past the end
of the packet data buffer when we access the control byte.

As usual, the datasheet says nothing about the behaviour of the
hardware if the guest misprograms it in this way.  It says only that
the maximum valid length is 2048 bytes.  We choose to log the guest
error and silently drop the packet.

This requires us to factor out the "mark the tx packet as complete"
logic, so we can call it for this "drop packet" case as well as at
the end of the loop when we send a valid packet.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2742
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/net/smc91c111.c | 34 +++++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index 2295c6acf25..23ca99f926a 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -22,6 +22,13 @@
 
 /* Number of 2k memory pages available.  */
 #define NUM_PACKETS 4
+/*
+ * Maximum size of a data frame, including the leading status word
+ * and byte count fields and the trailing CRC, last data byte
+ * and control byte (per figure 8-1 in the Microchip Technology
+ * LAN91C111 datasheet).
+ */
+#define MAX_PACKET_SIZE 2048
 
 #define TYPE_SMC91C111 "smc91c111"
 OBJECT_DECLARE_SIMPLE_TYPE(smc91c111_state, SMC91C111)
@@ -240,6 +247,16 @@ static void smc91c111_release_packet(smc91c111_state *s, int packet)
     smc91c111_flush_queued_packets(s);
 }
 
+static void smc91c111_complete_tx_packet(smc91c111_state *s, int packetnum)
+{
+    if (s->ctr & CTR_AUTO_RELEASE) {
+        /* Race?  */
+        smc91c111_release_packet(s, packetnum);
+    } else if (s->tx_fifo_done_len < NUM_PACKETS) {
+        s->tx_fifo_done[s->tx_fifo_done_len++] = packetnum;
+    }
+}
+
 /* Flush the TX FIFO.  */
 static void smc91c111_do_tx(smc91c111_state *s)
 {
@@ -263,6 +280,17 @@ static void smc91c111_do_tx(smc91c111_state *s)
         *(p++) = 0x40;
         len = *(p++);
         len |= ((int)*(p++)) << 8;
+        if (len >= MAX_PACKET_SIZE) {
+            /*
+             * Datasheet doesn't say what to do here, and there is no
+             * relevant tx error condition listed. Log, and drop the packet.
+             */
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "smc91c111: tx packet with bad length %d, dropping\n",
+                          len);
+            smc91c111_complete_tx_packet(s, packetnum);
+            continue;
+        }
         len -= 6;
         control = p[len + 1];
         if (control & 0x20)
@@ -291,11 +319,7 @@ static void smc91c111_do_tx(smc91c111_state *s)
             }
         }
 #endif
-        if (s->ctr & CTR_AUTO_RELEASE)
-            /* Race?  */
-            smc91c111_release_packet(s, packetnum);
-        else if (s->tx_fifo_done_len < NUM_PACKETS)
-            s->tx_fifo_done[s->tx_fifo_done_len++] = packetnum;
+        smc91c111_complete_tx_packet(s, packetnum);
         qemu_send_packet(qemu_get_queue(s->nic), p, len);
     }
     s->tx_fifo_len = 0;
-- 
2.43.0

