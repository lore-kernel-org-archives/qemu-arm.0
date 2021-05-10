Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3262016lfg;
        Mon, 10 May 2021 12:14:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyymCuXV9eymtnbL/By5lvhZ9b7SY9dsDx+OIUpJvItk1QCJDaw8DUDQYbzVSEyKqQ1W9XL
X-Received: by 2002:a92:ce01:: with SMTP id b1mr18334689ilo.124.1620674054646;
        Mon, 10 May 2021 12:14:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620674054; cv=none;
        d=google.com; s=arc-20160816;
        b=OjkTJdgXpJ9MRBaw54vaGCxe4KLmvIKVST3iOQGK77Gv7bjx4P6AaEqkI5zuJDy3Uj
         jV7/JlkTQcCisvtsPLR4qkKneaMdFFwhpRWMzACPwmpiT+pTgk9W990BzxDSmcdZBx2B
         cmgKMMctmi4wz5gUB9tuqyq0RYvd7cTlSokQ0NW0LdYJBAS7ZMc7chvA0JsvxGSXy85S
         FHfR1YGU8i01iAgxcShpz/MZffq4cpAtGDcjYVyWT4C+92Zo/tl6Jlh8oBsvAdn+iFmM
         JxIJ7GnTJk71nqrHbpG3RKDyjSCzGPpslOCr3EKgkyNPjA6AUxze41fqdNKeI7xnw4AA
         S++g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=IA8v2i4O86UnUvs9gQRCAZoRczka9Szx0p0QDCUmjDk=;
        b=TPGZBinDfWHJ1E+FVidSx3Z4xIGLhJHPmXCQMBZXA0b894t+ExNfEsu86Pr+nK2L4r
         SfqrjIDID9h4bRD4OlHxRw5PEemUryvitzO5gesDsQrN87z+sO936R5khFkbJYDnFVNo
         SBZw89QROXokfaiEijxHAQDzlrcvbZpA/U+lH/8D45dlOaHZGMF9ohgXPwI1iJvehTds
         bcXfT71ho89fZNnzI9d43BXjUCmWGqtBI1KGBMm/3RKBC7Bcu38Y8PwJIIz/wcjC6ia5
         E4vSzCfAkBA3C3wkKnuyYAGR1CYKSUtpk5GV3d/ji2iIzyKDz/IGorvvNtDD6VmMYAeq
         s5Ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QIny4iol;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17si18116288jap.43.2021.05.10.12.14.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 May 2021 12:14:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QIny4iol;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgBM5-0007RV-Vm
	for alex.bennee@linaro.org; Mon, 10 May 2021 15:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgBGw-0000Za-Ru
 for qemu-arm@nongnu.org; Mon, 10 May 2021 15:08:55 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgBGt-0004wX-B9
 for qemu-arm@nongnu.org; Mon, 10 May 2021 15:08:54 -0400
Received: by mail-wr1-x435.google.com with SMTP id m9so17739126wrx.3
 for <qemu-arm@nongnu.org>; Mon, 10 May 2021 12:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IA8v2i4O86UnUvs9gQRCAZoRczka9Szx0p0QDCUmjDk=;
 b=QIny4iolu9yKKYUTFrdgum0Gv26tKcGF4dPMa59+N/QGC1WPIJOfjMKMLbqX8Zt7Kw
 shW6eIHUnSgzezRhr/ejiVXYAv6dNKCiYi0wzYzx31oSmCQ4jquzI+1/7oQwq1JgfPFN
 CeF8dv3rXNE6Z/vTQaqAVYLfotKJ5V8zP2lZgshbJayss9E2JjWLka8f/pk+kf81Ka8k
 ft9KGnOPHfrb0liIBk+/+SdQ2pccSmO0yQt5uqUgjbT7o04XOoVOJRNFrI7vCX7Sugob
 NijMVUpiW/UAJtto4vZILd3cvE5ZvjTPpjIWIVQPZpI+1J6bGm8YtsEaxFdAYKixdJaW
 X2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IA8v2i4O86UnUvs9gQRCAZoRczka9Szx0p0QDCUmjDk=;
 b=XjoXIcXA0YR+NaNNpfQDiHGJ73NDQ24ZenzaSqTh7GbqaVsd2cbOmHbScvCGtU12YQ
 OArrSZZ4Fmgs5+cXJzEfpd4fdWlbEth2GDajLK8JynBIRokM5UX/BUKD8kPfwaQGkJMY
 fgtO0Uq/7lSD0qVoFvxu2QHVnNYhvxBI5iDk9ZPGsToTv7I9+QpV5B5L7iE13B2s0z/g
 +DwHq5IjgG6QjExHF1XY+QfckvNQZ+HiHDiGaL105e7Us0D9iUYMdOWP299/3zi8pSU1
 g56Ovh0X++VE5O2DpH0e40Uj2lkD9Ey5ubPf9ww/X5OXG/+G6gkVmtbEduBeB4Jreua1
 npkg==
X-Gm-Message-State: AOAM531LEjaxxXq3Ipfk+y2cJaYkHy44HeJQQKZhFrocHb350yFAsnKg
 SAzsWbV3Sm1C3s4vbmkg4TiP0/V862C+1A==
X-Received: by 2002:a5d:54c2:: with SMTP id x2mr31703446wrv.278.1620673728710; 
 Mon, 10 May 2021 12:08:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t23sm463892wmj.31.2021.05.10.12.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 12:08:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/6] hw/arm/mps2-tz: Don't duplicate modelling of SRAM in AN524
Date: Mon, 10 May 2021 20:08:39 +0100
Message-Id: <20210510190844.17799-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510190844.17799-1-peter.maydell@linaro.org>
References: <20210510190844.17799-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kumar Gala <kumar.gala@linaro.org>,
 Jimmy Brisson <jimmy.brisson@linaro.org>,
 Kevin Townsend <kevin.townsend@linaro.org>,
 Devaraj Ranganna <devaraj.ranganna@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aUTbkOw1Aofy

The SRAM at 0x2000_0000 is part of the SSE-200 itself, and we model
it that way in hw/arm/armsse.c (along with the associated MPCs).  We
incorrectly also added an entry to the RAMInfo array for the AN524 in
hw/arm/mps2-tz.c, which was pointless because the CPU would never see
it.  Delete it.

The bug had no guest-visible effect because devices in the SSE-200
take priority over those in the board model (armsse.c maps
s->board_memory at priority -2).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 70aa31a7f6c..77ff83acb06 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -243,19 +243,13 @@ static const RAMInfo an524_raminfo[] = { {
         .size = 512 * KiB,
         .mpc = 0,
         .mrindex = 0,
-    }, {
-        .name = "sram",
-        .base = 0x20000000,
-        .size = 32 * 4 * KiB,
-        .mpc = -1,
-        .mrindex = 1,
     }, {
         /* We don't model QSPI flash yet; for now expose it as simple ROM */
         .name = "QSPI",
         .base = 0x28000000,
         .size = 8 * MiB,
         .mpc = 1,
-        .mrindex = 2,
+        .mrindex = 1,
         .flags = IS_ROM,
     }, {
         .name = "DDR",
-- 
2.20.1

