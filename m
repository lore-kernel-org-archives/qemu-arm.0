Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp2103789lfb;
        Sat, 23 Jan 2021 18:54:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbmGtycCQ3qzTYdXcmR/eh2BOfPrElNy8YYg1XTYIzloO6H3Y3Nmt8sWGwqfoX6dEBiEYd
X-Received: by 2002:a25:348d:: with SMTP id b135mr10406385yba.258.1611456859763;
        Sat, 23 Jan 2021 18:54:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611456859; cv=none;
        d=google.com; s=arc-20160816;
        b=WFhdtKT3p1usm3Cjp5NheGlGuFUHPzkCPkBRajbPeE9T/dcHb50SRO9UoKHhzyo0ct
         bfoTWuhBV09E5Z6qFs2nF0BieqTFtevohDslUAGZBWNrSeygt2o4CjVzXhHS6qLule2F
         KK7JqBRJYOrY5c0pphYVef+jxeBuqGN4geItDthUvcbPzjf6mWgJoVsFhy5m/Ebjbxaz
         1rVQX5ZnexcZO8EYTv6Ea9RuKQ/QkWkYwKyYLP50j4b3dgF0s2bAlrpi0D+QmzbR7GmR
         7HbUT3uav7GUQeDcaCSyrNyPdVammQAv+ww40ZtvW+HGMCAXBL7BuXuLqROHc/Z8zK3Z
         qYkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uxfJzCYb9p3cDULfc+U2nLGno8Z8Z8cB17iO0MBRYWA=;
        b=E3qa+qCFWlKYZrmAh5+Z+IpJn2uy1+F/AnhNNU7cGBPFLQ2+3bcimLfGvu1MW5u8I1
         1rs3jwb0hC0qirafiR2yqB4PWs+wcg4CTKUeLbrHXQDCLQVDekmyindC4O4iND2Z/NDs
         ExLcSFIFNKA7iCydXPhh+iENemer8DDD1ifD74OMk3YYUzTLeXZkf7APdGQoq/ySJlDw
         bEAbtSz+l8Fn8QU7XRL6eCaxq7waXp7M6WuD7Il7JxeHlmTOBtebA0zdtdhb3nxAa5Tt
         MsqbpLb3FIF7FA0g8klhUZZY6XskjCTqcbTGuGZq+qB++Is97bWrb9txIT0GIBwLtD0m
         LwZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=xNxrfNaO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j18si11501856ybt.68.2021.01.23.18.54.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 Jan 2021 18:54:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=xNxrfNaO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l3VXf-0007AY-4S
	for alex.bennee@linaro.org; Sat, 23 Jan 2021 21:54:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1l3VWc-0006jy-HA
 for qemu-arm@nongnu.org; Sat, 23 Jan 2021 21:53:14 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1l3VWa-00039l-5E
 for qemu-arm@nongnu.org; Sat, 23 Jan 2021 21:53:14 -0500
Received: by mail-wr1-x429.google.com with SMTP id q7so8799724wre.13
 for <qemu-arm@nongnu.org>; Sat, 23 Jan 2021 18:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uxfJzCYb9p3cDULfc+U2nLGno8Z8Z8cB17iO0MBRYWA=;
 b=xNxrfNaOcK5gmJCVPvh42++lq5RdzVi6TTbW75rStHU0DCYBILzCj1Ovmw4ugmtqhd
 pbOBYpGbQ9+ofj6BK+8Ko0c/tkF4YhtWKoKfLoXEDWZunYtqLRdKSsA3EGvXCVH8eV6l
 If+Ye3DJx4BJlT218BIDh32yJ9Iu91Icqt9nIg5pZuxXK+aUihupExTh8/J9s0jdC+vZ
 VYsf5MRJVENPSJF+OF7mbtFjLgCZn0h2pVZ1dh1CpH3qkrXiKi6/2ffowQGp+a7HDIHo
 N+E1qssB8XnMy7GWmmXCt8Eo6MKKW+1CmI2D9Qv21gqFoELYO1dWQDeB2M1NL5BhvF5E
 D51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uxfJzCYb9p3cDULfc+U2nLGno8Z8Z8cB17iO0MBRYWA=;
 b=rnKo+lT1v832xnsZlYPzigvKcKR/hkqV5SMhF6SPpS4CNlljHmxyMbUFjNIRHPsqtt
 gWYWbG3wNbC8kbQtp527u6Tdm8LA6OX9ghsYo3iXKxPrbXbyLjiaJsZIlVgT/WiqfTOQ
 1zTip+aeQLaDNXsoTy1OS8Oa8HZ7MM3OkaYQy7DDjacRXrmAhHbKirdMFsAOWgBQV7II
 7Al9lBS8PO4Y7JrdGv6zVU1mYVoq60b7bI+oMBjzdar0juWi9/yxrkyYcvLuN4BYeG2o
 TVXcsK7ykdRcxnDvq2I3Bo4uwGCxgHhLj6fWNMKiTfkQCaHAo8G+fAVJfMzodTZmKza5
 fCng==
X-Gm-Message-State: AOAM530YBR10T57t5cYGIRVKGIPKa65X1lTjEV+v3ApXVhWd0MO9wwCZ
 OfJqJYC4z5UTV36hrPRwKO0Uw2U3D6AwIV0vZ5ZWJ90C2QiDfIjaXSwOZ9LIVUY+oAFQWwR7bVy
 3gxgYdjpKy8CTNWRJroD1HOZIpcrs+wUXGD+YMKP3HnG9ApEYvBrYqF7DrPqBxxOKn0A=
X-Received: by 2002:adf:9526:: with SMTP id 35mr11011348wrs.399.1611456790684; 
 Sat, 23 Jan 2021 18:53:10 -0800 (PST)
Received: from vanye.hemma.eciton.net
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id u17sm16189542wmj.35.2021.01.23.18.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 18:53:10 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [RFC PATCH 3/4] hw/intc: set GICD_TYPER.DVIS for GICv4
Date: Sun, 24 Jan 2021 02:53:05 +0000
Message-Id: <20210124025306.3949-4-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210124025306.3949-1-leif@nuviainc.com>
References: <20210124025306.3949-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SEaMFPNn8hro

The VLPI frames are what make the redistributor size change, so ensure
we state in GICD_TYPER that we have them.

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---
 hw/intc/arm_gicv3_dist.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index b65f56f903..833deb0a74 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -387,6 +387,9 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
 
         *data = (1 << 25) | (1 << 24) | (sec_extn << 10) |
             (0xf << 19) | itlinesnumber;
+        if (s->revision == 4) {
+            *data |= (1 << 18);;
+        }
         return MEMTX_OK;
     }
     case GICD_IIDR:
-- 
2.20.1

