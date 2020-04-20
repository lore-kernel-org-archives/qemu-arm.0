Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3769578lfm;
        Mon, 20 Apr 2020 05:20:37 -0700 (PDT)
X-Google-Smtp-Source: APiQypI9NyJMPE4NQV9ZfpoRrOjxMRX12ISjBNYyWHmoN9TSxfpFIr30Ua8AXxXyIrxmk4ygJCRI
X-Received: by 2002:a37:62d3:: with SMTP id w202mr12638645qkb.381.1587385236973;
        Mon, 20 Apr 2020 05:20:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587385236; cv=none;
        d=google.com; s=arc-20160816;
        b=IjSMkzo0Mg/g9yJVMdqEQK+8ZFfgEOUMBaKBIaaZpxtJangyFyC9zX8Po+cr0z0ITQ
         ZWLtyRu6y9PnEyZZKspRRYxS+h6dmnlutKO5Db06YZWnPW0i570Ais/ayrcilJZJhbtT
         CA7z4CWFLeLw3gZMOtCZ6tKclVYdX3zuImEJUoPtCRdkTkYlPdSgBb2bPOpsQYWvCNq9
         6it1B0HJUP1lv6bVUHGVHw6lLY5ffdz28kYGqRZ51pBp7g1/g5pnaMEeKr3txUvFyJ0B
         xUIYY+SAaftZ/GRbW6PgnAqaQjk8H1jnZVYHsXGsC3p+gNYXLRzV0PGWdYs2iYRkwugD
         ETeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=JiGmGsPkvQNSd6NC+nKiNxF/ISFZKcmrsOBoVkLlC7Y=;
        b=RgR9bFI2GDuxB3lQNsZb9+heWFhSKaX9zt00hVWfHC71hdXZdPi49/E6vEJ2wt/tvO
         lnL58t+P/g6Q9jL2mNoFvimeREmEe+GVCvG3e9dTfa7hhVD+/0WxzLrgpPBD2BhGv3qG
         IGc8kiNg+nl3VGoQOJ28MFeOTYEe5BBAuga26oJzCLsh+rONNWQgDPV3nXZdS5PbRlBu
         xWzELiYN+10xv4t+Veq+tSb9qHRl7YKLas0wXZpx0jYMxU3Yv++oBt1fpQwxM9IV9y9C
         A6AAwGxMaZfKQjhoAeICO6dkyygeyLDAEaGkLBsactclUZ5Qh20mSn0LqXyZERsde+vd
         oLug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@forissier-org.20150623.gappssmtp.com header.s=20150623 header.b="BAHxp4/L";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bu8si312998qvb.53.2020.04.20.05.20.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Apr 2020 05:20:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@forissier-org.20150623.gappssmtp.com header.s=20150623 header.b="BAHxp4/L";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQVPg-0001lz-BY
	for alex.bennee@linaro.org; Mon, 20 Apr 2020 08:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46284 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jerome@forissier.org>) id 1jQVPW-0001ko-Mn
 for qemu-arm@nongnu.org; Mon, 20 Apr 2020 08:20:26 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <jerome@forissier.org>) id 1jQVPV-0000zj-4X
 for qemu-arm@nongnu.org; Mon, 20 Apr 2020 08:20:25 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:33604)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jerome@forissier.org>)
 id 1jQVPU-0000wo-HP
 for qemu-arm@nongnu.org; Mon, 20 Apr 2020 08:20:24 -0400
Received: by mail-wr1-x444.google.com with SMTP id s10so2726202wrr.0
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2020 05:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=forissier-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JiGmGsPkvQNSd6NC+nKiNxF/ISFZKcmrsOBoVkLlC7Y=;
 b=BAHxp4/LBr74hRz9+uwNPUHildoOuEJ9OK1Vsd1m/ZVIL4ybzBvorPxWKShksm7lnM
 rreTmsFpXjOL12U/6WLIiDqBBGS/PisqUq3gUKaUY9U+veKTf6V8kFMBOEE3ozHC4Y0N
 NVyxpHShqnVpSRFGF6SK5d/aX15sSOghndDRnrLapOVom6C3PilMhgsxk+I2gMjteFwq
 TsmIoFMXSEjOWa+1ry2+mMBpoctCQsWx+7mArc1Ys//uxaREPz2txbB0GAHZGQ6dYh0F
 acysbX0G7ylxsPk0973K5jbbm4CNFrxndPtMSR+3DLWoWMuDQry6+SzuG6JT0t3JIZ9y
 bbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JiGmGsPkvQNSd6NC+nKiNxF/ISFZKcmrsOBoVkLlC7Y=;
 b=mfHxprNx6LjMxMRHd6dCLeDOY7CcVPDT9p25EPJQE0tuagH6hXDfr7+Bi7T3MSi5GX
 rtB5dZh8vaiUHh2xawXbJpZcfT8vKxCZAEA2SdM9GET33iv00gYPkokvJuapdnfNtKRb
 WWE1/WyJg2DcHAVSGXhQMg2Y2LT5UQmeAxFn3dPY52YWJCdxxXOLERa/VEfYLMqLyvFF
 8SqaVNTlalu1u/vtPw0jkEpk0JYNQr8e3WCTRF2SyfGnD/UNCjMMYmMI7+POBmNkUIxo
 psGpYqcQu8BTGQP25s2YkwAa4qeA42SnUXC5c0S8jLIe3DijmEtUeiZhgLPF9Geww1MT
 3FHg==
X-Gm-Message-State: AGi0PubxMSrkIm0+IUy31n5k52RsC1njr8kOTPfQeXSODh4IiMOjvaJ1
 0Ahz0+8g09srlFi7Di7+w4iHYQ==
X-Received: by 2002:a5d:6841:: with SMTP id o1mr18431335wrw.412.1587385222733; 
 Mon, 20 Apr 2020 05:20:22 -0700 (PDT)
Received: from matebook.home ([2a01:e0a:3cb:7bb0:4826:2464:6688:71f6])
 by smtp.gmail.com with ESMTPSA id v16sm1127132wml.30.2020.04.20.05.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 05:20:21 -0700 (PDT)
From: Jerome Forissier <jerome@forissier.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH v2 0/2] hw/arm/virt: dt: add kaslr-seed property
Date: Mon, 20 Apr 2020 14:18:05 +0200
Message-Id: <20200420121807.8204-1-jerome@forissier.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::444;
 envelope-from=jerome@forissier.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs1p.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::444
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
Cc: tee-dev@lists.linaro.org, op-tee@lists.trustedfirmware.org,
 Jerome Forissier <jerome@forissier.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PlRGFfqzoOxI

This patchset creates the DT property /chosen/kaslr-seed which is used
by the OS for Address Space Layout Randomization. If the machine is
secure, a similar property is created under /secure-chosen.

Changes since v1:
 - Move creation of /secure-chosen to create_fdt()
 - Use qemu_guest_getrandom() instead of qcrypto_random_bytes()
 - Create kaslr-seed for the non-secure OS too

Jerome Forissier (2):
  hw/arm/virt: dt: move creation of /secure-chosen to create_fdt()
  hw/arm/virt: dt: add kaslr-seed property

 hw/arm/virt.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

-- 
2.20.1

