Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp4040663lfi;
        Tue, 31 Mar 2020 07:34:22 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuSNSOZxoflQbzHv5pmdpw4GAuPWAusNDF6PVV+z9rhroW2q3twU75liir/6ea9H25zENeI
X-Received: by 2002:a37:4f83:: with SMTP id d125mr5429561qkb.296.1585665261490;
        Tue, 31 Mar 2020 07:34:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585665261; cv=none;
        d=google.com; s=arc-20160816;
        b=h6/94ZvHZsgd6B6TWlN9w/aZxpcAqdCFrujkMni69E3BwassjMuhhGyn8THVHE9nZy
         +uyp2fI5Wt+mmg6gr7Zvcnj4k6Ue32noEcGl3gaA+M0eUkD+CCLpVCqAakT4UWR4jal1
         Y606ZA4Yo8jJkCweGRQd98X94glxed7KvXkEhCBxYu8xBF7FlZOapyj1ME2yS0gntBsQ
         yqMOkTN6XTOGY3OvZz1inMXzwvTBL+7Mh1Eic8lF1f0CoMjnm2gBGwezAznrvzF1hzxv
         yA7R2Wi3rzCq1PryfTf0aZWa0DiD4q+MXWbm/z/TAyGhS84f8SKk7gCkDRvZ+fxIynZy
         u6EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=I8acRX+3Ax0e+6wpNxKGO9kRpEiLoBvALCJRagPszfg=;
        b=OGCknw1/fDu70htW/R+LIze43xGFlmRYc/0c8ye4FHDb63ftdEIT9bol8zHyzD9JOw
         3+Tz6/iEuHLRyFoNZrGKOCrU8bUwdSPNxZu5+2SchSW3gshS0x1/ipaNi0tPyLv50IBu
         5nO4GGBcmmpEv/i8LbEy+EE1/5Ve3EL6fn/7gCZtNj9FK1bfR74ihhN3GcEb2wDdHeJg
         IiijpAAwLBuPraKTJjtSGSf2WKRgN1ZH2S5GRYDfWax2tAyMZnNp8ZTTePiM4l5vl27c
         5fz4EGtvmz1f8t+XGcdYxb1HGr0PHz1EgWwNgpt/bmiaOo3GddRp7te4rJci0ZUdAc+L
         S82Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GqZdBxms;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p58si9780313qtk.18.2020.03.31.07.34.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Mar 2020 07:34:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GqZdBxms;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jJHy8-0006II-Sd
	for alex.bennee@linaro.org; Tue, 31 Mar 2020 10:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51888)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jJHy1-0006G9-52
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 10:34:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jJHxz-0008W1-Tt
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 10:34:13 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:37823)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jJHxz-0008Va-Oa
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 10:34:11 -0400
Received: by mail-wr1-x430.google.com with SMTP id w10so26351847wrm.4
 for <qemu-arm@nongnu.org>; Tue, 31 Mar 2020 07:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I8acRX+3Ax0e+6wpNxKGO9kRpEiLoBvALCJRagPszfg=;
 b=GqZdBxmsUuWE4nrTaxGY8OIZUcimR9abzaMy1wp1FZ76KwBcDmh3iaihwAJUfRIbom
 HkpJJOap09mnGxl+d/tPgXZ9fbpOvt7Ij+NT0FZVObMDg4c/fFz5/8H6kwIszWgPCMjf
 ZrZFuXgunOx+gzHNrzQfteKJk0fo3nt7RPeopYRV40pGl4dQQKD8ZO/0I2SEUVT0j1lT
 Ff8MK/7JjLpJfme7zTb1wUwKD3XEKZwY9MiKOJyjS95emt3E2d26VuiwABhrEc/adwra
 nDPDyPWNKs5IxrQLsvZ0i/r1ulvGsVBdUDNFSbFGg0JHZrwjAqeacOnv9Y1YXUjoZ6rW
 QiqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I8acRX+3Ax0e+6wpNxKGO9kRpEiLoBvALCJRagPszfg=;
 b=mcPm/Len9jpPy0RrqBwJRtKDkQaNYBf4olSCS5k28n+7iYlLWWsoCPT8PwI7r7aDna
 8sQ0Gcr+IOtQwXWSdRoNG0YNypwPe2S50bYq95Zy7sEowdAEE/+0xqLdUVoB41ZmykDj
 4ihKEJpabNZCwjw8sR1j+6Q/pSZ07sQTIFuguq1DPTFj/l7X6U1ToXTSSYjsWCR0Exv1
 IdZ8VEUfjCODqcspFOEqB1weAjqOtzYY4bNXxVMKAp3cvr4AfGhIQESE5SEaw0ib3hHa
 OQwJSvCb4XZ2DDB5crESY1s0n7Js//52A//2js/XnUdsriX8gj0lUjV9s49CR3wmVl+T
 UzYg==
X-Gm-Message-State: ANhLgQ0Yr/G2r8Y8wzuiK0/5g8MmlhaSLhstabJncyLySi3VQ/MPlR8r
 xsx3i6p9i0HDMIvUeAkVxMS8x5H0Jf7zMA==
X-Received: by 2002:a5d:54cb:: with SMTP id x11mr22055554wrv.179.1585665250142; 
 Tue, 31 Mar 2020 07:34:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b26sm3899189wmj.21.2020.03.31.07.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 07:34:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Remove obsolete TODO note from
 get_phys_addr_lpae()
Date: Tue, 31 Mar 2020 15:34:07 +0100
Message-Id: <20200331143407.3186-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::430
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vE5fpfPbjYw1

An old comment in get_phys_addr_lpae() claims that the code does not
support the different format TCR for VTCR_EL2.  This used to be true
but it is not true now (in particular the aa64_va_parameters() and
aa32_va_parameters() functions correctly handle the different
register format by checking whether the mmu_idx is Stage2).
Remove the out of date parts of the comment.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Randomly noticed this out of date comment while I was stepping
through the code this afternoon...

 target/arm/helper.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index cba8ac57983..27059045842 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10714,12 +10714,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
     bool aarch64 = arm_el_is_aa64(env, el);
     bool guarded = false;
 
-    /* TODO:
-     * This code does not handle the different format TCR for VTCR_EL2.
-     * This code also does not support shareability levels.
-     * Attribute and permission bit handling should also be checked when adding
-     * support for those page table walks.
-     */
+    /* TODO: This code does not support shareability levels. */
     if (aarch64) {
         param = aa64_va_parameters(env, address, mmu_idx,
                                    access_type != MMU_INST_FETCH);
-- 
2.20.1

