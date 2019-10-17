Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp957248wrm;
        Thu, 17 Oct 2019 06:32:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyFNfd6uDea2zGYdCJ2j5YeNDzEYoidsZi0lbdr5zLnj4iJ4Lwe/P3h3wc6l94mQaNiZTH6
X-Received: by 2002:a0c:e94b:: with SMTP id n11mr3746117qvo.35.1571319126856;
        Thu, 17 Oct 2019 06:32:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571319126; cv=none;
        d=google.com; s=arc-20160816;
        b=BXDR/IVOco2mATWJPy/THSyokPDPn+V1sf7TdgV3sFymLq8U0YMzKIl1cEa2pujKLq
         9COC4GYYfmF+sVO4GrSHY+V9aMsMR6qQez/RLEHrkVAuCpzAr9O01QuxGjFdPYkZVS7Q
         6b0ytZzGot1ZhWuiDpka2oXxOcLCMY1P+2ZHp9zkP1LYPGjqfAjeG1OGI/MkNfqZqkGl
         pAFmNLs66tBwjlDPtHoeGxkBkmmSvynVeccky2fVlDoFBC1+l7lnpU5JuHNi7A4l7Moo
         NIfbAOT49XHrZbRxVEeeapYlLOe+0AMIWs5a+P7EvVDMA15CxIqP3rqVrNVSwoaVs3oo
         rTpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=7dP4GniHlhzsckLWI2mSbUrs50mZwdrxTXLkHD7zpW8=;
        b=YjQJn36orbOjcSn1sYH/yUFSnJWuRz5+I/e+lPWnQdyTFxBdmYAN7VY7rNuVAEatNF
         XK0OiFUuWU9vN69+FYgl0dBcLNTOHM+EKXjG3CYf80Ph9Pzb9izSlDy7QOXTCkT9kQyO
         XRN2Sq88QGX188BQfZMaicNuWXsMtOA8d2VG+LD0ncPPDiimgsSY/sTBklVGilVK3f3A
         TrXIY9eOKMWGYQUe9fQshSCKVuAKvhhBPcg0JKxb0dlo2koLEbUQFOx48Gw4PIs6EqiA
         BUrMcgYohyFGR7EoBrRfkSpXZ9fOk3FQyr4X9hWoOYUqZpgOtjPhe/hxYAoi9xXM15HD
         MnOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kD5wHnsK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 198si2283706qkj.34.2019.10.17.06.32.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 06:32:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kD5wHnsK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iL5sr-0001mq-EC
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 09:32:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34873)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iL5iZ-0004wt-Lx
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 09:21:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iL5iY-0000LX-Fk
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 09:21:27 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:54889)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iL5iY-0000L8-9f
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 09:21:26 -0400
Received: by mail-wm1-x344.google.com with SMTP id p7so2545244wmp.4
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2019 06:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7dP4GniHlhzsckLWI2mSbUrs50mZwdrxTXLkHD7zpW8=;
 b=kD5wHnsKkg0aKvZ7qp/CiHJSnlKOt4szHYDRvUIOlcOe2Y61Gw9Y+oHZGrR2fQV5FT
 CxtUaajjzHuG/shrWZBpol7nwHbbrgzGX1fR+r7XxTU1QXAtxCpInZUb3zWt9KNXKqGl
 zLVwEVpsQYrQ/7bhQJHq6Qn3aLQimTJ/JBjlNgx2tOc3FEvmw/Jzi4EI09IE8qMe/Q59
 24uXlNvVw2rtrslGL3Vt38JdmUOgAgW/Cl5kxdYcurhz5zxXqS0NL63NXag9oV2Ha8Uh
 56mktaGwIgM4io1P8F6DfQcMsZXHxaOhuTZItxmFC/z3FiYpiw8EqQRsmlnrrDQnwuNM
 WA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7dP4GniHlhzsckLWI2mSbUrs50mZwdrxTXLkHD7zpW8=;
 b=cjdCjzU6PHsPHFtzzhq2orMlHfqzKKC92YZzbDBFvQONWVDPOgDzM2E7qiCFLHixOm
 It53qiM2NqHcQwOR/hZCytGRuRHJYRT43Wc//lBEB8y0FcRBgbRpvH/OZ09wp7fS5h8r
 XhIL6EWa5kcjTloiiHfBhSoki3K9vV1fsM/hdVYiS+IX7XxAJCdTvYuFVZCK4qKjHUfI
 I2F8+/MfVoQ+SlwC51bSWmdYCBvtt5irCGpHryzBrD8I8Todev5FNFkwK9MIKR+ChZxp
 7sg3A66VCh2h8P3dAUItqWOmjtBKHsM1vZF7Rn4UhVATecdBbyWROnzNcUHlGCvZVqoO
 sI9w==
X-Gm-Message-State: APjAAAUbvvxs63jkuzxzCCXaHk6H3iWbeChQf+LUB1XGD8fNqfzEVVpX
 DrTlf9v+7GUjlpxrOqssseECag==
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr3006060wmb.125.1571318485199; 
 Thu, 17 Oct 2019 06:21:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e9sm11543164wme.3.2019.10.17.06.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 06:21:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] Convert ppc and microblaze devices to new ptimer API
Date: Thu, 17 Oct 2019 14:21:19 +0100
Message-Id: <20191017132122.4402-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
Cc: Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nJ/DjDozpJxm

This patchset converts the devices used by ppc and microblaze
machines to the new ptimer API. (xilinx_timer is used by both,
hence putting both archs in the same patchset).

Currently the ptimer design uses a QEMU bottom-half as its mechanism
for calling back into the device model using the ptimer when the
timer has expired.  Unfortunately this design is fatally flawed,
because it means that there is a lag between the ptimer updating its
own state and the device callback function updating device state, and
guest accesses to device registers between the two can return
inconsistent device state. This was reported as a bug in a specific
timer device but it's a problem with the generic ptimer code:
https://bugs.launchpad.net/qemu/+bug/1777777

The updates to the individual ptimer devices are straightforward:
we need to add begin/commit calls around the various places that
modify the ptimer state, and use the new ptimer_init() function
to create the timer.

Testing has been 'make check' only, which obviously doesn't
exercise the devices very much, so more specific testing would
be appreciated. I'm happy for these patches to go in via the
ppc tree if you want, or I can collect them up with the other
ptimer-related changes I'm sending for other archs.

thanks
--PMM

Peter Maydell (3):
  hw/net/fsl_etsec/etsec.c: Switch to transaction-based ptimer API
  hw/timer/xilinx_timer.c: Switch to transaction-based ptimer API
  hw/dma/xilinx_axidma.c: Switch to transaction-based ptimer API

 hw/net/fsl_etsec/etsec.h |  1 -
 hw/dma/xilinx_axidma.c   |  9 +++++----
 hw/net/fsl_etsec/etsec.c |  9 +++++----
 hw/timer/xilinx_timer.c  | 13 ++++++++-----
 4 files changed, 18 insertions(+), 14 deletions(-)

-- 
2.20.1

