Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp2103448lfb;
        Sat, 23 Jan 2021 18:53:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZzMg18gVDeOthx3y4fhqu/lhpzOofl8mKYNTSSmnJ0kBoCg2V2JtCBdiH3UprLpA5GJr3
X-Received: by 2002:a5b:98a:: with SMTP id c10mr16482171ybq.406.1611456805722;
        Sat, 23 Jan 2021 18:53:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611456805; cv=none;
        d=google.com; s=arc-20160816;
        b=c2726ABJcuz+bMSV4sU1IsEKopZ9e2ga9STOAY+LuKLnMIw0c0e+d+X5lUeyJ9mL2c
         igGcY4viQIwuALif68sxXs3C4ygbt2NBCywHnc8fTofx+Jkl+Mq8iETN7Ea7wWBTaCgS
         46viNxBAUWBTi7LXtsnFf3JDlP2pDQ21y16Ok8MJ63+wZYWkA6P6V2seTuNo83kd2UIr
         h1H5DzKPpwNPjmGYnpwLVGly+pnA1DrDdYhlatdERI0WQwnegRWWApIZpp70nj+Lkgz6
         XpuLlIM+xmwNUAq8iWx4FJPIDhhemFaOsYKSAFbpeugJpNASYzEhG9xzaAMLpzDufh88
         +xDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=s7PJ51jzBATxkQNcxoYSFNAfapcaizQoguoJb33d/p4=;
        b=eUwDjDf4XhdcURNDIhDCNxRt2F4DaAJmTsypFkMA6coMhMMYqCwcH4L/uzwWtUDDXw
         zmz0wvHiDmq+YnpuyUIoefbr6AMKk1eJCv2qq4d+SyZEM0oodrjBsrfGc9WAwGvYXsPT
         RGWXBb5Sk+2yGDfj/AS6i4n2P+lJHacvanACdDqznHLRlj+eI7v1+c1YuTvfEd8eLLxV
         /BgOQ8t8wb6ZNSHj/ssYQSrYLk5cvS8VJSSINdnR88TqzSbW9cYjs6Vg2Vl1BVh2Vv8I
         d10/TnIwBOGaoBaXT+1h+wPChdPLxUv1jAW42w+Q/ksPFF1a8ls/LiAzMEFHn1K3PEb7
         zfLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=T2CoCfMb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v1si13059795ybm.428.2021.01.23.18.53.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 Jan 2021 18:53:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=T2CoCfMb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l3VWn-0006hO-4g
	for alex.bennee@linaro.org; Sat, 23 Jan 2021 21:53:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1l3VWZ-0006g9-Up
 for qemu-arm@nongnu.org; Sat, 23 Jan 2021 21:53:11 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1l3VWX-000396-TH
 for qemu-arm@nongnu.org; Sat, 23 Jan 2021 21:53:11 -0500
Received: by mail-wr1-x42d.google.com with SMTP id l12so8834611wry.2
 for <qemu-arm@nongnu.org>; Sat, 23 Jan 2021 18:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s7PJ51jzBATxkQNcxoYSFNAfapcaizQoguoJb33d/p4=;
 b=T2CoCfMb1gR6oyxekb5GASUG88x1gpHBrhPLEMk1MkAUx8yM391S+lAGxZTdrAX0++
 fCbTTEY9JJOhIpZ64OcE9v/+1jzj5itI+om+8fpxZPC88DojttcvfeoQrpJGpWJo9ORs
 9EadpxYoGpyVU8XoWD6Jk57FNuSsHFZ0RJJPjKmiJvo0/3U4bGCh7jRn6fd3dNFvTgdw
 lC2JNT2Nz+vRPNvUkcCwDd5i8rtztGwziXgE/HRgvEq0X+2nFIVqf8oxybmbwoOnh5kP
 WNEgCTpehcihntc8bkeqBIqagqfg3bkR9LBDh7/AXSt2ooDcovQyQtE/PMuAjQP9x9ZL
 4mrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s7PJ51jzBATxkQNcxoYSFNAfapcaizQoguoJb33d/p4=;
 b=maLMONesRzVL48Q2Z3tOdJYfWj2yRBZWK9r1FLoGka0IOOLxLK108rMPiBFVem35eK
 pnCY1awnVhmxXOPPBn9ckJKprqvEYoponadw63XGvCeBv+GmyU9jprWTRw0EMStkDNTl
 aUc/fNBByUr+rioeWsBwSKcGuyiRJgvqme73ScssOsSGJty4B6gDFvrk4e9mrr1T7QJj
 nNzVr97jI9UvEH5y9jzCpVexIDJ/yILeAIZsDvO9MRqunol+fXFBhCDDK/TekLiA2VaP
 QYdrUpwv68HrskZ/2F5nkm7EWc4MsEN7V5JoIsm5SYLmFF5c1jIYpBAkTwATdho5ld0t
 cbeg==
X-Gm-Message-State: AOAM531dQOqwOqUIR4nVrhMEXsuV+pFYJvD7gawvX4rIUFY6/A8KBQhm
 PBVcxFthPhD1yj9zpc14evRLCgo2qVEXUuboETXdzgSstaWgk2dsNLzr6+SNCnqqJYp0yEBh9yu
 F3xmBsoR10LM62OO55MQmwiNXn2hNSUZrIeQy8PF7AObw7yGIIQkInWgrWvryBTVroio=
X-Received: by 2002:adf:c454:: with SMTP id a20mr10937019wrg.314.1611456788006; 
 Sat, 23 Jan 2021 18:53:08 -0800 (PST)
Received: from vanye.hemma.eciton.net
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id u17sm16189542wmj.35.2021.01.23.18.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 18:53:07 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [RFC PATCH 0/4] hw/intc: enable GICv4 memory layout for GICv3 driver
Date: Sun, 24 Jan 2021 02:53:02 +0000
Message-Id: <20210124025306.3949-1-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 3ShjWxerebH7

GICv4 sets aside 256K per redistributor configuration block, whereas GICv3
only uses 128K. However, some codebases (like TF-A, EDK2) will happily use
the GICv3 functionality only.

This set aims at enabling these codebases to run, without actually enabling
full support for GICv4. 

This creates a ... problematic ... system, which will misbehave if you try
to use the virtual LPIs. But it does help with letting me use QEMU for
modelling a platform containing a GICv4, and share firmware images with
other prototyping platforms.

Leif Lindholm (4):
  hw/intc: don't bail out gicv3 model init for revision 4
  hw/intc: add helper function to determine gicv3 redistributor size
  hw/intc: set GICD_TYPER.DVIS for GICv4
  hw/intc: make gicv3_idreg() distinguish between gicv3/gicv4

 hw/intc/arm_gicv3_common.c         |  4 ++--
 hw/intc/arm_gicv3_dist.c           |  5 ++++-
 hw/intc/arm_gicv3_redist.c         | 15 ++++++++++-----
 hw/intc/gicv3_internal.h           | 12 ++++++++++--
 include/hw/intc/arm_gicv3_common.h |  3 +++
 5 files changed, 29 insertions(+), 10 deletions(-)

-- 
2.20.1

