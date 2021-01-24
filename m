Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp2103458lfb;
        Sat, 23 Jan 2021 18:53:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyto0gTgvCO6Ac8Cv8CltMgeUM1z8KrxjAHN5JWp8Tmf9/Cyl9IZqblWws1htlMLT80NRG9
X-Received: by 2002:a25:6851:: with SMTP id d78mr15700305ybc.433.1611456808423;
        Sat, 23 Jan 2021 18:53:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611456808; cv=none;
        d=google.com; s=arc-20160816;
        b=j0twJabY6tuN8iOu1Slr6OavNtjlsBx2rjgxiuW0cSwsAgpo6PJ07ti5hvvT6IUU5W
         MdcWmrDUboM2/7oAlGfXBmHNYmmCeXMTqlrdNuEXSpk3Pzu4PmLIZl3dD+T6g94LLauW
         OT2rFlr6UyDUKahWqUlm8Sa2RekFj5rt4vYg1rPSu/UzfsvFM25N/BRzW1HAHtaVo29l
         rkfqdEBCvCjvItUTVbA1wbXIvnBno9HNiSWf+cnQ446VGJJB57ZCN6XZQwBRUg6peIpM
         Rf1AV3zuGgSdZclkORO3P2Bsgnvgkr/gAc0iLo1ALA+1VG/ASnGYQjl8JrLHlWpIlFAf
         nyQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/3jk8M7uoiqLp/tnXbSwyohY/WHN9zW+icvpVea9Usg=;
        b=ttWnZB3qarEzWqab9mg9rdy4Q8IDmC76aizcK6WjNOuapKGKWPAUlb9SkXbj83wjVM
         D/kxZ9nNEiDI8R+9GQQpoG4MWz19jdHu44APdmnDIpHsCCXdcnKq0HVUH1IoG/UvXVkn
         evBeaqlMiQeqpFPmBSScnAqLy0t+YW11mHZAHhh7mVKbODSHnPx2HU/TXEyjvG1GopI3
         5Rqiknrjha2ikbv1Kq+vPwlT3BfXryIZ735gqrGK5ZxNwmrbxpy7RzCDz4W1AfQPcf3S
         qHraMrPXz9M6OhJfXw9RZYPs9ZiY9bsX+cd4bbnAr+mwzHvlCIKpKyOfZlZB1IGjfK8Q
         VvLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=roFpZmyi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h39si4103889ybj.129.2021.01.23.18.53.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 Jan 2021 18:53:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=roFpZmyi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l3VWp-0006m1-Ra
	for alex.bennee@linaro.org; Sat, 23 Jan 2021 21:53:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1l3VWb-0006hn-Bg
 for qemu-arm@nongnu.org; Sat, 23 Jan 2021 21:53:13 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:50255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1l3VWY-00039Q-GL
 for qemu-arm@nongnu.org; Sat, 23 Jan 2021 21:53:13 -0500
Received: by mail-wm1-x333.google.com with SMTP id 190so7603276wmz.0
 for <qemu-arm@nongnu.org>; Sat, 23 Jan 2021 18:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/3jk8M7uoiqLp/tnXbSwyohY/WHN9zW+icvpVea9Usg=;
 b=roFpZmyiSKl9huM8e2oNrGsfF5eSooqjrmSfVqkBIBZzL7m0SvS8FIjvzABndSBSjz
 KoU+jvVC1SXsURWjFCLaqvRfKEBKMDSEJpHn4ME0w1wIMcA1JqCdzOpJ034Ck2Uz7CuP
 IA5ItyYeVz2ATUjMBx6a7DWkpmgZZK4GhmUK6TXI9NvziwkMYVuiYSqWTBBixMGXjFHh
 Pv1S1UdpYV8z2csB3cU/qCvStcNrkk7VblVss9gszRegkT0LmvtMNJF397SF6HoRFKR0
 EhrsqUTEeQ7By+iRxXVrb9VMmJpVuCbwkPdURT1u37YFD2BRKgrpgnEcF8oX894735Mx
 3WBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/3jk8M7uoiqLp/tnXbSwyohY/WHN9zW+icvpVea9Usg=;
 b=sv+SPGgU/pLlVKVdbdb/5Bu6feD6pbshmaaw9B1ei/jhl20I9bwU5mWr8JH3DOTwMm
 Pz+qec+NPx65DEQshPMF0+VxG85L11oltgbF+YJm47cJpOdNRASg698A+r+GpBcEaAl3
 rjkIfXlGEYB7o9tdkW7XO8DrQ0Z+bwokzCWcs4RVCwQl3M9p1bolDx78+MZJ5JrdtYxV
 d2feUWGtaEWN9ydgB8B4wAPR/krWtfcp+R3viZrzD2qFKA0HwA6Ix4/RrbfrdAiRQmVr
 W8lFvqZhpSSKdBGmxLyCVQfWJm6CsP9yEceDrcASC7uKeVoQpmciDpqC8BMNx9gK+P8T
 3o5w==
X-Gm-Message-State: AOAM531UBVB5vMq3slcjq6csm2CDT5mldJQFpamAemMqzRTG4r23gBjk
 77rthBqLlpuVIXoRSI3Al1r1Vxf9PKOazhgXPTIBvpnNGLnlEjNmyH5F/O0Si9JD1a2btUc+e92
 /js+CrYuf8IoDR6TKubxKNOmlR21bKBWsl8hMr021uQCmeGEbgfu406BZeQPzYadDTGc=
X-Received: by 2002:a05:600c:618:: with SMTP id
 o24mr10294828wmm.82.1611456788844; 
 Sat, 23 Jan 2021 18:53:08 -0800 (PST)
Received: from vanye.hemma.eciton.net
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id u17sm16189542wmj.35.2021.01.23.18.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 18:53:08 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [RFC PATCH 1/4] hw/intc: don't bail out gicv3 model init for revision
 4
Date: Sun, 24 Jan 2021 02:53:03 +0000
Message-Id: <20210124025306.3949-2-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210124025306.3949-1-leif@nuviainc.com>
References: <20210124025306.3949-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=leif@nuviainc.com; helo=mail-wm1-x333.google.com
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
X-TUID: wWL4T8heL2KL

As a first step towards GICv4 compatibility, add support for gic revision 4
to GICv3 driver (i.e. don't bail out if revision 4 is encountered).

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---
 hw/intc/arm_gicv3_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 58ef65f589..7365d24873 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -315,7 +315,7 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
      * conditions. However, in future it could be used, for example, if we
      * implement GICv4.
      */
-    if (s->revision != 3) {
+    if (s->revision != 3 && s->revision != 4) {
         error_setg(errp, "unsupported GIC revision %d", s->revision);
         return;
     }
-- 
2.20.1

