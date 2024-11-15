Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp672959njc;
        Thu, 14 Nov 2024 17:45:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW2MdJLYaQNSnClhRBYsSrtUY3EnBRA/rWWy1H3Y4x7bef6fdzN8HNDr00dz8l+/yTOrX6R0G/9Yo+OTg==@linaro.org
X-Google-Smtp-Source: AGHT+IFgqH+bOPLElq4qUZy+GrnoOEgS2NAGlPnIvp2bKAjLMzzi3zVXPD/zb/pGG5n6YYVBB9gV
X-Received: by 2002:a05:622a:30c:b0:460:cac8:bd1c with SMTP id d75a77b69052e-46363e97f64mr15433891cf.43.1731635125931;
        Thu, 14 Nov 2024 17:45:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731635125; cv=none;
        d=google.com; s=arc-20240605;
        b=dsNNwcNzPFIfC6N0rdOzECqxjdb7BINd9ukFG0iIqb+ZiVtmkAsaJjOljvsxd5Yf1d
         93n2NrujAPfpQl8kdrMWWxormby4GkhYZUxdUeC1uBUqMw6o/4vD3zc1c39UMhlVXY1H
         Eu6cEfYiuImBCukEDk4f9NDASL7nOvaXQTItW5a1h4jyDv/3gEa7XZQJH/9mRt+Qj6Is
         /i812FSjP7qsehrl+auKaQlGrbowUex07aGXunTpHGNcAs7ghWDRCTuDDfsSnD5BIYSX
         riTqak5rDjBeqDLmp5CVkp4lv51s6BQD68vlB79q+m106QcgsrfQVRRQ4WXoJoaQS4b4
         c3Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=48YVVGJ2o29hkZVTXS546oXVnY+Lq85//Fs8NubK6AA=;
        fh=M00wWTQyE25UDNjKsyKv0JSedgxgzlIgQX8SXzj7ZOw=;
        b=Vs/hkKxxZqRITFTGZR/rbFm4lcgU/ehWSQAD9KfqcDXA2mieMjDJn9qF15jfyF/Ux+
         bfdnZJFLn5rdrw6RTOoF+4vhe9cnrEKxjCwO2ih5ynjVyYiiR2JpI4q9sNGJRjD6p5h2
         e5FireBVJSVniaW5MtDtb5RCpnhyg84iVGRwuPQ3FUihyhYGnUcQcub/HRh6ujSB5/i7
         cCpjtJPvnTbPyy3Gy1KCRMR3PscYXEo7KapjHhDfFYKfY8l0QtiSeLOWd+DrFE0s5ylz
         8Pyunjs2K7WMe16FLeQwQdGDag+gx4KBr5qOD79vkK6lj6ob5EOQBTZlgXtrjm8sxztV
         Q3fg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b="WP/qckIx";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4635aa96075si25975621cf.306.2024.11.14.17.45.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 17:45:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b="WP/qckIx";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBlO9-0000Sa-Hb; Thu, 14 Nov 2024 20:44:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1tBlO8-0000SH-2u
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 20:44:44 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1tBlO6-00068C-Lu
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 20:44:43 -0500
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-720d01caa66so220894b3a.2
 for <qemu-arm@nongnu.org>; Thu, 14 Nov 2024 17:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1731635080; x=1732239880; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=48YVVGJ2o29hkZVTXS546oXVnY+Lq85//Fs8NubK6AA=;
 b=WP/qckIxo9VHBT70A4a7RLYN/4nqo+K9n0j5iHJBK+W7qx75ir5X6+CEfsNqmUoakc
 AxppNrZV2SoW9h7jbm4I4F3m09gAJFKz8yHQUfBZFfhY4iuMKJGXfSd0bHmyTZd+xiwX
 b9fA+FXoK9mvSCpQrxt/htrM3bvxDLGi9ZHWaDH3K3xnaSJPQNyC7ekg4vdCeoILmzr1
 VPI27+ATVMllWCj89ptBgK4/ZcAjrDbjp8crVhky44eZJljoslTDlJ5ZNG9OQ0V6EbFd
 M022nTRELCB370fUVHv55SoCAveltQL7Y40vjY88AXIUnfnLqBaJBWtqT8RNLeBJkFjG
 vJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731635080; x=1732239880;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=48YVVGJ2o29hkZVTXS546oXVnY+Lq85//Fs8NubK6AA=;
 b=MP/g+bE54fSABueHs3FB5wFXyU67uMBB1EVkqn3fFJMc3X9/iHTH1fWqCheXyG64Go
 0OiiQKQ4/x219if9imqQTcut+M0+/hGjnQlpUC24T2fr0jdApC5EDJ0mqbALetU0pRSs
 2mJM+cMOo/+SuH7NVs+hzfNbjvisvFwx90amJBmEbjKM+zOekl6kJy/o/dW2b/kYFpSq
 WYU9kMiclCqe2nHJhLBfgLfjI6Ugu+tbQEfzQDRp3Jo0QbTLsvr9ddPNe/8+g0hSzdod
 xUaJnknZUTNjz/TA6N6Ho0HW2/AmfvFR3ZXB7BTT6zx05ZU+1AU9k4Eal9peTMeHY2Xj
 Z9EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwkawnGSHQ0BnxNH9CJ7DdJhT+JBtqQoPVoukKlFLJ+ds6iOhKy5HeYIqmriMk8TX3mCP5x+jVxg==@nongnu.org
X-Gm-Message-State: AOJu0YwssVtPwIFMVT41CrKqTHdUuq7rKJWPqiCuWEkgQR3NbRfn95uj
 6V6tro30/nhbFlQYWLzLPMkXYjdH0UaAHNaWIVkOfKosi17nKcQJXWP/wFVhSwM=
X-Received: by 2002:a05:6a00:2396:b0:720:aa27:2e45 with SMTP id
 d2e1a72fcca58-72476bb4d28mr1384766b3a.14.1731635080105; 
 Thu, 14 Nov 2024 17:44:40 -0800 (PST)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72477120bc8sm312514b3a.70.2024.11.14.17.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 17:44:39 -0800 (PST)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org (open list:Xilinx Zynq),
 "Fea.Wang" <fea.wang@sifive.com>
Subject: [PATCH 1/1] hw/net: Support Marvell 88E1111 phy driver
Date: Fri, 15 Nov 2024 09:47:02 +0800
Message-Id: <20241115014702.1663274-1-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=fea.wang@sifive.com; helo=mail-pf1-x432.google.com
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
X-TUID: Rx857z9bJzBM

When the ethernet PHY's compatible string is 'ethernet-phy-id0141.0cc2',
it will be matched with the Marvell driver in Linux instead of the
generic driver. They differ from reading the PHY register17.11 bit which
is for 'Speed and Duplex Resolved' and the value 0 will clear
phydev->link and stop the flow. To avoid getting stuck, change the
constant return value in QEMU for the bit to 1 to keep the driver going.

Signed-off-by: Fea.Wang <fea.wang@sifive.com>
---
 hw/net/xilinx_axienet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index faf27947b0..ee4b3afe9c 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -102,7 +102,7 @@ static unsigned int tdk_read(struct PHY *phy, unsigned int req)
             break;
         case 17:
             /* Marvell PHY on many xilinx boards.  */
-            r = 0x8000; /* 1000Mb  */
+            r = 0x8800; /* 1000Mb  */
             break;
         case 18:
             {
-- 
2.34.1

