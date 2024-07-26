Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp272022njb;
        Thu, 25 Jul 2024 23:00:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUod3cqcH1WkcnlrxqlhVHy5wIJdFEBPPGPEj6aprwjPQTaJy3HatcR0OXqLHl0iiGYGaraVno9Zh6oC6ULD4coVg+blFDs
X-Google-Smtp-Source: AGHT+IE976XODCaMqKlyIUVo+BU4iouleuPzUHBBPLFPWwWRN5ZlIyT5RquSGqDxnCiVBL9Ov/ZB
X-Received: by 2002:a05:6122:1acc:b0:4f5:14f9:e12c with SMTP id 71dfb90a1353d-4f6c5c67365mr6307915e0c.13.1721973630598;
        Thu, 25 Jul 2024 23:00:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721973630; cv=none;
        d=google.com; s=arc-20160816;
        b=aRzqpzI751MIkYW9ZdIUruVKEI8oTeG0asM+oFALAMWC+ETiRhUNBH1aonpVrpPogF
         KWIxD1kJt7wZbFtAkWV1Has14PvAiNOak4noO1eaVlfMW0oE3f8H0xsCswLVDTV2HWVQ
         9MX2Qt8kj+aqox3Osjr6hK2IOJERMcde8NiKN2YaDgJWJ+Rx+o1VUmuzlg+w95rTGj8V
         bi/PlfoRdA8S9XJSvdomQZLFpYsGOogK3AoBvyShD725+SjnCFNE69PtPDE9emwN5eix
         bWvPo8RLfZ/ZlSV7FlV7Ospb6NXKrObzcKz1uP+SSnD1SysQIvpbq6liSi4az5oV5RBm
         rnVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FLUVpm7q4t3wLyhn54TwgrrVNxCRL3GBe3+Zpe/mX4s=;
        fh=7/IFweEAGohbtA9D8QwMVC+Z5xTDLflRkiSMccW5KLo=;
        b=BYx0p8tRwUXk+5VFUbZvxNFF5w1kn4B9YTIdFgjB0egudJjxG/J0UP/kXqZfkpXAlB
         P0sMRXf9ktZ4fQOaVi6HuzdZmRV+7Kj5lC3q6upuGOzBgcoc274KUBW4+qLzfzQNUwVT
         TMKc8zyU177pS9a+GR3FdD2X4hrBntce9NQTID68PuXIiCjv1wfy9F0xbq2dJFXS9mP/
         9w4YzTmORluHbild6AOzjqNkAhef7/B/AOwY5gMujU5vt6adYUapL2kaNT3ZDIP5CFr2
         pjMSzv4JqiQ3v6AcOyD2nqmem5cughYUOeM7aB8eo7HVPNWD7r23LP5WVWvjkyA7t4ZY
         9VMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b="R9zl//Gy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe81376a7si31941981cf.1.2024.07.25.23.00.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2024 23:00:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b="R9zl//Gy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sXDzX-000157-DD; Fri, 26 Jul 2024 01:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1sXDzV-0000ys-Uu
 for qemu-arm@nongnu.org; Fri, 26 Jul 2024 01:59:45 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1sXDzU-0006YZ-EA
 for qemu-arm@nongnu.org; Fri, 26 Jul 2024 01:59:45 -0400
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3d9bcb47182so382540b6e.3
 for <qemu-arm@nongnu.org>; Thu, 25 Jul 2024 22:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1721973583; x=1722578383; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FLUVpm7q4t3wLyhn54TwgrrVNxCRL3GBe3+Zpe/mX4s=;
 b=R9zl//GyxMe8oyjZPl8u5Z60nm25EVq3emsmzXYFpfml/VBw1ZTqgkXQsXNPopOj/P
 YrfyKdIibvX1CwmtMn4f8+n1A+Hv4OD/ouf4gf5LKQp0jk+d/RNQlqtaypvqKQYsw0f8
 UhpGNjfV/klp8xgKDNv4OaSsAihu8+71zrt84gSC23SPxUKvZGkr+2aB66OwujGSTpT4
 86B2y1sOv7YJCIUWk+8JYn9nP7n65rGm/9M8hT+eS136W2+TzqNoJJMwAaT8OzOkyECI
 RanreEgUYxmfOW+Gesvlp0gkrsckVVK+RNRdz4LTKPmaL6nEFrqK3Ehhg6pMjfkmssyr
 z+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721973583; x=1722578383;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FLUVpm7q4t3wLyhn54TwgrrVNxCRL3GBe3+Zpe/mX4s=;
 b=ThKOQwNaiOuFfMymAGhziOOWIeZJbpSP6v1YVqUjET9qWxhVWJ1J6m9FWDJ0IyZFBV
 JNgxHsEBRaQOC9VJoFJugmyPRkImtwxXG7ZxN5aBUUPxAW6dp61MaiRRwebnsf9HUqIF
 L5PZF9NHq6jlkIf+EA47vJg50OXlY1Et4QW9+OX2v688upJMS4ipm5IHCQs+3qm8aV4b
 4xFgBITyOqDhOuTeOc+ZZDPkEgdAHAraurgytY8c0TZwX8bnO9ab1I2gfT+M36i8MhJn
 YFHHIHarmnUq4IrlA4L0FfBV9EJS4DzPCyXLn/ZtLVbqy2177JfC2wbaCjK+Pb/nqVAn
 9+og==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNtHcDQKwkU/sUJ+bALdsUOipRPxgKpBVIE8VyIa7TS3JVVcme2kvBZKIQ2niGGmZCJWOiBY+dtJGAUvZFYygxGI/C
X-Gm-Message-State: AOJu0Yzw/TFNsomyhTOemErvlMqm5p31GzP3KuiaWXcQDtLV/ohtV/aV
 JgciHsi7xNUNakaqX7NvSz5bhJkcduJVjx9JUn14EM7A9EOUGf8Ku/NEgRP5VUc=
X-Received: by 2002:a05:6808:170a:b0:3d9:2b24:5b2 with SMTP id
 5614622812f47-3db10cf0ae0mr6044971b6e.0.1721973583078; 
 Thu, 25 Jul 2024 22:59:43 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70ead6e1a4bsm2002128b3a.5.2024.07.25.22.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 22:59:42 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org (open list:Xilinx Zynq), Jim Shu <jim.shu@sifive.com>
Subject: [PATCH 1/4] hw/dma: xilinx_axidma: Correct the txlen value in the
 descriptor
Date: Fri, 26 Jul 2024 13:59:30 +0800
Message-Id: <20240726055933.817-2-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240726055933.817-1-jim.shu@sifive.com>
References: <20240726055933.817-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=jim.shu@sifive.com; helo=mail-oi1-x233.google.com
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
X-TUID: IX/JlbPEyNWS

Currently, txlen is always decremented to 0 before filling to the
descriptor. Keep the origin txlen value to have the correct value of
descriptor status field.

It will fix the 'tx_bytes' statistic value in linux axi-ethernet driver.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 hw/dma/xilinx_axidma.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index c9cfc3169b..6aa8c9272c 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -291,7 +291,7 @@ static void stream_process_mem2s(struct Stream *s, StreamSink *tx_data_dev,
                                  StreamSink *tx_control_dev)
 {
     uint32_t prev_d;
-    uint32_t txlen;
+    uint32_t txlen, origin_txlen;
     uint64_t addr;
     bool eop;
 
@@ -314,6 +314,7 @@ static void stream_process_mem2s(struct Stream *s, StreamSink *tx_data_dev,
         }
 
         txlen = s->desc.control & SDESC_CTRL_LEN_MASK;
+        origin_txlen = txlen;
 
         eop = stream_desc_eof(&s->desc);
         addr = s->desc.buffer_address;
@@ -334,7 +335,7 @@ static void stream_process_mem2s(struct Stream *s, StreamSink *tx_data_dev,
         }
 
         /* Update the descriptor.  */
-        s->desc.status = txlen | SDESC_STATUS_COMPLETE;
+        s->desc.status = origin_txlen | SDESC_STATUS_COMPLETE;
         stream_desc_store(s, s->regs[R_CURDESC]);
 
         /* Advance.  */
-- 
2.17.1

