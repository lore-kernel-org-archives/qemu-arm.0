Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327A0F4368D
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 11:04:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDgyb-0005pa-RS; Fri, 17 Apr 2026 07:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wDgyb-0005ow-9E
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 07:03:09 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wDgyZ-0002o1-RO
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 07:03:09 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-43d75312379so1074035f8f.1
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2026 04:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776423785; x=1777028585; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qJ2AQaxAlhqc69Sli55vinppxUwsyZJgPbn1fvffd60=;
 b=sfejDpwukzc/hf5ZfG+ZkIsH7lLll4cwU5mBLeFwdGGVJ6s6XcjWcgSDrwGO+xT6mG
 0/9o3XmfevusnVlu01ZKX/9i3zR/OFKqRuAxuY7omn/w7oxkJJyWBjd3DhEkGw9ux5dQ
 AqGNvbSp1R6EoLM5Qp5oN6Kuo9+u6TSfMDa4WBz12xEbbO9gDjZYGkIA8OHLFx+HB7sD
 BwqeyAwhc6FXBYqXs3M24XHvQOJLjFznq+vqdbN+bKHFEoVq+wHpoCVUkP17kn0OzmEA
 q92jc8N23IF0D2RqVqo/YrLHLuO8AE298A5IliJxouJd06QnHJ9vwUmEH6Kd+szjTQSk
 4LvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776423785; x=1777028585;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qJ2AQaxAlhqc69Sli55vinppxUwsyZJgPbn1fvffd60=;
 b=hJkuWxVS4VhJV0G0yLxql5rI0eCJssf2VHsDLGnjtZNTSb4+4LwiuQg7IZdjrEvPkR
 zYljOAx2FSbM1IARkKDRoSVDi7Z3Zf7kMOD+B3W1eDnBEAtE3OA4N3b3Ct3gXOpKZB+v
 K9RlJKf8HSaxX4o61pX2eMWFZcujAusHCvXlT949si/Bf8EP8WcBk1UB9v+6ZXUT0Jmt
 Z5CpAarOIv5PlvDyBU8oGL4wsGDLPZ37aoDw2ZC+bqG9iPY7PrdQg16iymaK4gWH3ioB
 nAEf/Km/2odrSqM8JtMZxY9eqTQ8tBa1qDRl4C0HWfevmIUMchKKy6rScE6al13GmaUj
 xvVA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8mQw8MoZ1uxhc27J/h7r0qEQwxMQSb5H54MkWPBJo2nfapYZ0fijY94DqqIHwP01TNFKsyea9EKA==@nongnu.org
X-Gm-Message-State: AOJu0YzIljPxrMf9011clGm9j7wizYj7H7YE6Ix3e1BKL4GKFD9rrCdu
 H9E+bRFAP7cj+P4QV37VS6Sq+kSZLqhmx25rzhDorK0uIqKF1zXTWicQWKK3b1vTZFE=
X-Gm-Gg: AeBDieuQ+p95lqXuLyW3tnDlT4dz7+bDzcz1vYV93hTUsJZZeNuxh6neZC35WksJxZw
 cNR7vB39WBtNawLtLLqTYnD5jvoq0ufu6W/eQjOlU+PxJ1CqOz0gVypTfYiqjMw0+1kgWaTefml
 xcXHt6qhZzAeOaVZAnxFOa0l70ENvhX1B+IsJYsLUv+W9UmgmnZsEgcMB6UsBesaNzq6fdJNKS/
 zv7IMuDHoVq1vUSY+dERkYEhZH2rNO3OvxlwWiRLLpfyjhYiTdVO277JxPclCHCMztuPCDxjit+
 Hz6YvrBjvzNx09was0UbV3+lknhBEI0igo6QHfvOIkCcMVWpTJKa7kBJJxeFCNrED+4n14Mald8
 Qlvawns2LNoFodGWPHwXeZlDFUaGt4+aZy7FWEVkaO9XqPDNzneonWPmFZRGrk+0BILjTlHGFL7
 Nhu20dA4JrFxvf02rqyPn4LTDJfD16nG+n9ocgqg==
X-Received: by 2002:a5d:5848:0:b0:439:bee4:8a93 with SMTP id
 ffacd0b85a97d-43fe4073758mr3653908f8f.12.1776423785232; 
 Fri, 17 Apr 2026 04:03:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:d023:c0db:d3ea:590d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e59f97sm3811934f8f.37.2026.04.17.04.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 04:03:03 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Fri, 17 Apr 2026 12:02:54 +0100
Subject: [PATCH v2 2/4] target/arm/cpu.h: New GPCCR fields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-jmac-feat_rme_gdi-v2-2-7cf5131aeb60@linaro.org>
References: <20260417-jmac-feat_rme_gdi-v2-0-7cf5131aeb60@linaro.org>
In-Reply-To: <20260417-jmac-feat_rme_gdi-v2-0-7cf5131aeb60@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wr1-x42b.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Add SA, NSP, NA6, NA7 for GDI and GPCBW for good measure.

Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
 target/arm/cpu.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 657ff4ab20..1cfef02dc0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2089,6 +2089,11 @@ FIELD(GPCCR, TBGPCD, 18, 1)
 FIELD(GPCCR, NSO, 19, 1)
 FIELD(GPCCR, L0GPTSZ, 20, 4)
 FIELD(GPCCR, APPSAA, 24, 1)
+FIELD(GPCCR, SA, 25, 1)
+FIELD(GPCCR, NSP, 26, 1)
+FIELD(GPCCR, NA6, 27, 1)
+FIELD(GPCCR, NA7, 28, 1)
+FIELD(GPCCR, GPCBW, 29, 1)
 
 FIELD(MFAR, FPA, 12, 40)
 FIELD(MFAR, NSE, 62, 1)

-- 
2.43.0


