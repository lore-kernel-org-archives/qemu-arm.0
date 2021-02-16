Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp6832877lfc;
        Tue, 16 Feb 2021 14:48:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkJD7ALSkC1ELczAucp/K5FW+eALB9fZPmYr+qm/IXw2tsTeaJscGUgRt768Xy9LPziWLc
X-Received: by 2002:a25:38c9:: with SMTP id f192mr31483387yba.120.1613515734989;
        Tue, 16 Feb 2021 14:48:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613515734; cv=none;
        d=google.com; s=arc-20160816;
        b=ESYdGIBhfcRzVwcQvywOUgbEwSUZ94bFNGdx7hfjdi/ppT+XBRP4CVKC7PVXf4muS8
         ZXqPVOfeiDuZau5KSJj7FdHiQvT0WxEXeg4vUjNcDxdL2fwj9/c2HEv9yigdPJGoF8dz
         OsiHNnSNPmhdQjuRSKNRgfgt0l5yq0jItgbbcKWh2f89gccmsvI0gKoFIhUKZU2xPzga
         ws8YJhiuz9x0INGGC8VFo/1aX/70s8LtK3cJaM8aq7jSloroncsP7AXBpM93CvR2UYlL
         Bon2W4g7YqOs1gALHN++681pBhjLITnGNi/VSZo7QWOZhgbt3+22zyH446cEBeKDXtZS
         zi5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=97kB+nyl96mKMiXXe0WJ0gyYIf0q0XHV2YeMSKLBYDo=;
        b=v5Tr1D9lwvqW91t9n4bZtknSaJjwN12MIPsngbc1h+vAdQ8HYvKFrP++4HQjGQ+Pid
         raLuy1Ld0CoLkDGlgDOvAQwsKnVe+M0q3hZ+INLpBgW1bEx+0o5ZpGLf4ksGJ4Q+5Xw8
         tr9FZR66SgPz/zmRn6pD88o8CJ6JoXy37aHDaRWmFUTjVh5/2lSjR4jI1Odw92PlrH6d
         gm0iReZHfoOM4sSaLAirqFmTXJIYyEMDzi66wJxHhzRCXIX2wxr84tzsuEU0zOuKC1xN
         Zltm8nMg/H5XF39tR4cCXJlxnObyGadgfPtuoLxRASeejH+Fhr3RnduENXo5ELClyncf
         eItg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=tgSyp9fQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v16si303692ybm.296.2021.02.16.14.48.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Feb 2021 14:48:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=tgSyp9fQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lC99K-0004Kf-6M
	for alex.bennee@linaro.org; Tue, 16 Feb 2021 17:48:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lC96U-0000sD-U9
 for qemu-arm@nongnu.org; Tue, 16 Feb 2021 17:46:00 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:45922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lC96S-0004sj-Gc
 for qemu-arm@nongnu.org; Tue, 16 Feb 2021 17:45:58 -0500
Received: by mail-ot1-x333.google.com with SMTP id v16so2070266ote.12
 for <qemu-arm@nongnu.org>; Tue, 16 Feb 2021 14:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=97kB+nyl96mKMiXXe0WJ0gyYIf0q0XHV2YeMSKLBYDo=;
 b=tgSyp9fQIY/GiS8e29th3+Jda8Xjm87jKfEOil0hS70pgrRgDv/iIltSQslk76J2FS
 ukfy40+KPlbDMz+Nov2EYkNA9JGo7yHm1/vUjoC6IZhJhVVDr4C+zeEzPfzsBH9Oi1hc
 WUSrpYNRKN5jpBtlGoLH+IVo9UpbKtsF0HwNPXmmCXxh+etAj+UZxtfzgCTlibbv6epL
 et1o4GS7w4HxkOYacbNu0s1TKebsyq21uwky3ERISJplWxpPIMlCR+hTRXNR6G+Mvcmz
 PFqdF97kCEs2E/wVggknFX5Taz9Lev9Laf6x72cE7BN3k0ZgKvKEK1KYz51VJLeB+lw8
 fD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=97kB+nyl96mKMiXXe0WJ0gyYIf0q0XHV2YeMSKLBYDo=;
 b=p8xYQ44/3uaDJbuFHlNDiKwSrhtwCWrk07AScZSaMHtQSTvRpHqIzoV/wngsegg5dE
 ZxqlfprxCO4irU1lPw4Hu51LvXMXyAaaCaKEPDdvzWTCD4sb7j66ufmK+5AyHJeXKbUB
 63vpa5/wjVvAwlujEhIPi6z7qjPCpFep4i3f9nNULTf4i9K15lvgczSVHBpV+BLtHWuB
 yqTR1zV4yVnITM2JvUEJpRiJvRe1VHeilKBqCoTxV6ZnPfN5hnx+tMtjx/Kbq5pPyL4e
 /kgopRv3xbmDpfVNKAEFNoUe8ctpxlE8CHWsGbIhbGoUBPs7kGx+nrt3ndn1p9J/fh/t
 eEAg==
X-Gm-Message-State: AOAM530t/UXIZ3V/tOeTkD1zQ8jTiweItKri9StdsptVQ05znmnE/46+
 LeGIr3kjQOrloz7EwpV8xOWIs10gxRXS/dk5GRo7cXJ9k8fwXVAc1pIu/EO5ZXYSe810Qg/5Sjo
 gXw42UtoP3/eBWMlmieTbqyFBPel5GKZVU2ZCSx99T/V/0fqqIxUTAW0BXtMhxUn9z+rC
X-Received: by 2002:a9d:6d85:: with SMTP id x5mr4634595otp.338.1613515553326; 
 Tue, 16 Feb 2021 14:45:53 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id b12sm32909oti.65.2021.02.16.14.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 14:45:52 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 2/3] target/arm: Enable FEAT_SSBS for "max" AARCH64 CPU
Date: Tue, 16 Feb 2021 15:45:42 -0700
Message-Id: <20210216224543.16142-3-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210216224543.16142-1-rebecca@nuviainc.com>
References: <20210216224543.16142-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=rebecca@nuviainc.com; helo=mail-ot1-x333.google.com
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
Cc: Rebecca Cran <rebecca@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bNtKnKyNslun

Set ID_AA64PFR1_EL1.SSBS to 2 and ID_PFR2.SSBS to 1.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index c255f1bcc393..f0a9e968c9c1 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -674,6 +674,7 @@ static void aarch64_max_initfn(Object *obj)
 
         t = cpu->isar.id_aa64pfr1;
         t = FIELD_DP64(t, ID_AA64PFR1, BT, 1);
+        t = FIELD_DP64(t, ID_AA64PFR1, SSBS, 2);
         /*
          * Begin with full support for MTE. This will be downgraded to MTE=0
          * during realize if the board provides no tag memory, much like
@@ -723,6 +724,10 @@ static void aarch64_max_initfn(Object *obj)
         u = FIELD_DP32(u, ID_PFR0, DIT, 1);
         cpu->isar.id_pfr0 = u;
 
+        u = cpu->isar.id_pfr2;
+        u = FIELD_DP32(u, ID_PFR2, SSBS, 1);
+        cpu->isar.id_pfr2 = u;
+
         u = cpu->isar.id_mmfr3;
         u = FIELD_DP32(u, ID_MMFR3, PAN, 2); /* ATS1E1 */
         cpu->isar.id_mmfr3 = u;
-- 
2.26.2

