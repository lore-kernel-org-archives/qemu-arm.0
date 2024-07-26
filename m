Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp272130njb;
        Thu, 25 Jul 2024 23:00:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU5wt72bkMio2nZeg4aS/sr8OyP3sDt3RA+neTUKWrNbz8NbiKSaxNfCGW9Vgt4XliQpNDRLYU8uPqm0iZqdWdlf/UVbmJE
X-Google-Smtp-Source: AGHT+IFvo3o3kzZxzYXX0hFhWgt34hOZuwEj76aLTvXUjmoJWnMHEpugKPYhvdEX7mxorv4n7xjM
X-Received: by 2002:a05:620a:372b:b0:79e:fd21:c352 with SMTP id af79cd13be357-7a1ccd32b64mr1194450285a.19.1721973643153;
        Thu, 25 Jul 2024 23:00:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721973643; cv=none;
        d=google.com; s=arc-20160816;
        b=SgKuGIUV6r8XrV6bjHjjfcEymPiizn7ZCRBn4ZqZOqpv74eMvfWv4qqRE3q/F6FmRc
         YJvw1XBaYfFG5wFaH7szaM0aopVpK21qhk9yNj5kOWsaMtmHZun6oKEQvOjOQDnyS0Xw
         /494xF1mIppt7DC4AFAlxEnzhuq1nE7rc0CVkQjhuPK4/ba7N4VAtRWIQG5x1lXmJQEk
         fpDXNQYK+gD0ARniybz38KqiVISL8W304fj4GT+8TtKBFeCLbEN5BJIKgrOtfZKOKXXK
         KEPHLzibjklss59Ftjb3WBz7j8FoOsXLnt4dwfvgeAzizrsVs8btP2ws7WmwoRGg/z3K
         Eukw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bCYAojS36KJlYYD+6PO9pHqhAb0FjLUF0zDaVffQqIA=;
        fh=bqOsg60/nzpwT10vqGKSl+AEtXs7tIBs7u95ANEo90c=;
        b=CCkMpmYzJJBX3Y334GUS+50ZDfIwfDyelnulikLybVGEsVFBKz0U2TgNqnryA0nbmP
         DPu/yQPOE7Nfy9gdOU75pEkRrFFTElXq52bnQ/8oYMaIBU8YYQ6ABoSn4SXa14dSjZNV
         jQAvFwLgYT/JtiDB3M9/R8NL5mNxTgqQZ4n+WbFgvSmShtZUrPHl3/dSzvgXYObXkarX
         aLrzAeRNs6+Qac6BC69mshZ7dnQ8/BQUQDflD3FSZR/1IO78xUDqFD0ppg+DdY8qPWdf
         J53cIoAF1rVz4SxKW3uo5SDGTW/wf4aTy2AfZNoEOPN2AWIikQQHqStEOAT+tZdySCjo
         MV+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=IWDaH9Ox;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a1d745fbf0si321669385a.383.2024.07.25.23.00.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2024 23:00:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=IWDaH9Ox;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sXDzc-0001OF-3Z; Fri, 26 Jul 2024 01:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1sXDzb-0001KX-6y
 for qemu-arm@nongnu.org; Fri, 26 Jul 2024 01:59:51 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1sXDzZ-0006kM-I1
 for qemu-arm@nongnu.org; Fri, 26 Jul 2024 01:59:50 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-70d316f0060so396300b3a.1
 for <qemu-arm@nongnu.org>; Thu, 25 Jul 2024 22:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1721973588; x=1722578388; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bCYAojS36KJlYYD+6PO9pHqhAb0FjLUF0zDaVffQqIA=;
 b=IWDaH9OxKT8XrXEC/3A1D+xVqz5gwCyiLB/l4TLXVGSafJukdXvAOwf5WMiGTPyMMm
 I88x/1xV2+2dQBXEfxTu1n3l4duan+1APz8X2R5S17jT4LZVUj5MWAtwPbfLT7789a66
 kOVTUyu69GyYehr0SuwwF4Ly4tn2RjIwB3oszufAqvF2njQLDWrbb/JdWBf7NwqfFYtI
 YgKPrZZTm+9flCPefp5r/Nb1JJET/okrvfXYuCOTVJH9BTCrWVLJEQ7yrM5P1OcRbgGb
 qfPzyCIR/YW+8rDrMJfpb92tVjROAg7dMjAMHYMvur09SIFxMX8zircbFptA8+dDsWy7
 zF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721973588; x=1722578388;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bCYAojS36KJlYYD+6PO9pHqhAb0FjLUF0zDaVffQqIA=;
 b=qB7SmhYlAj+QPncv9QyNkElxEl5tCgwfdX8HX9ZM5xzis9OSaatYbxUWR6uENKJQes
 vvbsUnZyx5VzYMaOosrAtjN7z5lSg+BnQIb5Ssf+1lej5kf+XMbxKpr5IeL05jYvqWB5
 VRAshBvvX8ulklmPGKhCn+rTPytvK/QK9zu52eNvh2U1e5kO5pDh6xDhWbsKIYNtOP8D
 Mgc9ZGhcEWc36ZXDEDuT5G9/aLGXq5vqROQPg7dKQFYhUWRLOgdtgh+TXCriL7KQR3Xi
 LP+6eFFt5LXQ6YMCIWzMxSV6nuilfrqWSbjId35MOVc1JoexrJq8wKCEkI2pKB5Zs8rb
 A91A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWq6MFxbwBYZAJMmMqh06hHheLidmoN9NE1tvjKeyThfsbx1yrp55On4xbKlAKpHuGRykriHvfT+HeEbSyzT1yMIwKQ
X-Gm-Message-State: AOJu0YwLIvK44hyu8jWdZYTaO1esWZaclCNaSz25Q+esyeTTvml9OgJD
 N7r9jM3l/LYzOkeKEjGvq7WgRlDdxKZyBfrKgMrBTmXeaB0/ICJ5PJWKCdmNKko=
X-Received: by 2002:a05:6a20:4322:b0:1c3:b1d1:db6 with SMTP id
 adf61e73a8af0-1c463693d39mr14118160637.10.1721973588177; 
 Thu, 25 Jul 2024 22:59:48 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70ead6e1a4bsm2002128b3a.5.2024.07.25.22.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 22:59:47 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org (open list:Xilinx Zynq), Jim Shu <jim.shu@sifive.com>
Subject: [PATCH 3/4] hw/dma: xilinx_axidma: Reset qemu_irq when DMA/Stream is
 reset
Date: Fri, 26 Jul 2024 13:59:32 +0800
Message-Id: <20240726055933.817-4-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240726055933.817-1-jim.shu@sifive.com>
References: <20240726055933.817-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=jim.shu@sifive.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: d1koYUfVsQIB

Current DMA/Stream reset will clear interrupt pending bit of DMA device.
The qemu_irq of device should be updated at the same time.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 hw/dma/xilinx_axidma.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index 728246f925..beb3fbf1d5 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -177,11 +177,24 @@ static inline int stream_halted(struct Stream *s)
     return !!(s->regs[R_DMASR] & DMASR_HALTED);
 }
 
+static void stream_update_irq(struct Stream *s)
+{
+    unsigned int pending, mask, irq;
+
+    pending = s->regs[R_DMASR] & DMASR_IRQ_MASK;
+    mask = s->regs[R_DMACR] & DMASR_IRQ_MASK;
+
+    irq = pending & mask;
+
+    qemu_set_irq(s->irq, !!irq);
+}
+
 static void stream_reset(struct Stream *s)
 {
     s->regs[R_DMASR] = DMASR_HALTED;  /* starts up halted.  */
     s->regs[R_DMACR] = 1 << 16; /* Starts with one in compl threshold.  */
     s->sof = true;
+    stream_update_irq(s); /* Clear interrupt */
 }
 
 /* Map an offset addr into a channel index.  */
@@ -249,18 +262,6 @@ static MemTxResult stream_desc_store(struct Stream *s, hwaddr addr)
     return result;
 }
 
-static void stream_update_irq(struct Stream *s)
-{
-    unsigned int pending, mask, irq;
-
-    pending = s->regs[R_DMASR] & DMASR_IRQ_MASK;
-    mask = s->regs[R_DMACR] & DMASR_IRQ_MASK;
-
-    irq = pending & mask;
-
-    qemu_set_irq(s->irq, !!irq);
-}
-
 static void stream_reload_complete_cnt(struct Stream *s)
 {
     unsigned int comp_th;
-- 
2.17.1

