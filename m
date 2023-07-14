Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp4134528eje;
        Fri, 14 Jul 2023 08:50:51 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEaR4xiGetTcZRZG1UCdorb+d0sl16YpBXbZ+zCn8eM47SKDfbnrzgma0lxqCu2wlGB8pa/
X-Received: by 2002:ac8:5791:0:b0:400:aabe:a334 with SMTP id v17-20020ac85791000000b00400aabea334mr6590038qta.7.1689349850991;
        Fri, 14 Jul 2023 08:50:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689349850; cv=none;
        d=google.com; s=arc-20160816;
        b=LSmBlm+LwnlqyCY2XsmlJWR9xr08xNzF28IlQ7WzPb/PxuJfprJKFQ6fggGl3BA21t
         gPGC9gRs37/dKznTAx/OdCZ0bribB5B2HXXxl6rUxyACVnWLFDzCwCS+tu2bXKHkVScF
         jazyTrR8MEK0EFGufo/QNOVGZy2+KO0KkhxNnRgxTez88nrzyI4GKtoC0cX1RBiZq2xW
         UqQCGkCHknNMhZP5K+QOVlW0r1TowOEK7RKSYv5xQQGXdPsmx8hSo0P9WixfRHiyYfXP
         gZOERulez4LaJYTsxd+McH5/KkjwH/vR/K3v3XlF9fr063qrxme/WSV0Scobia287soe
         kWHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZJ5X1Cn1l4/BJNDm0G2PsxEkjY7Sczg3wp18DaMO6sk=;
        fh=jvpdohKmRoZMO537s6xMKXXtj7EZws1LOMQI/oP4vXs=;
        b=ZeORQ/dYqw1LKK5xWLwJdeGExF8S1p/TN4pBgaTBmTN2q6L0FRve3GTtTRkExb0ean
         GV2XEGdBwk9Faqqdv90BoWprybsb7cs5/GjNvcVmj8bnn6/zAHoIQG9ptN1sJjZmk70m
         JIQGzpdk+gK3eqwMlUuZSc5+gl5Dx0YQtckDnJK6QzSaYtTkw4jm1DeEOcaH3POek/fk
         Pkry2vbGEiNwRh7SCQ8bwwDd4UztKFq01JZGNsGtZ3sanb2Zu1BLnonhPgedAkc5XQ/c
         8kFJFDhFjJHRMaJTpy3n4JifU9fc6u3B0Ir+doVB6R2kG0OTGOLEEyKHbvM3JSoVx7oA
         QvIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YG86nj2B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15-20020a05622a164f00b00403a87c0b41si4685405qtj.770.2023.07.14.08.50.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jul 2023 08:50:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YG86nj2B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qKL0X-0007FP-0c; Fri, 14 Jul 2023 11:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qKL0V-0007DQ-62
 for qemu-arm@nongnu.org; Fri, 14 Jul 2023 11:46:59 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qKL0R-00075m-Hx
 for qemu-arm@nongnu.org; Fri, 14 Jul 2023 11:46:58 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fbc59de009so18882855e9.3
 for <qemu-arm@nongnu.org>; Fri, 14 Jul 2023 08:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689349614; x=1691941614;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZJ5X1Cn1l4/BJNDm0G2PsxEkjY7Sczg3wp18DaMO6sk=;
 b=YG86nj2BPvHiITTp/JcuvLzObZnUKdGuFbwlLvEK1cJ0AUR7ZkzpVOF55vNYwoIlPK
 I1huFhFvtuzfL+Lk/w8wEl23gq2whaNl4k23M0VINVHvjiWOZ269n7qmu1g/dImZ3Xy0
 /Tkor88EPnKidTP3BpIgKL67HzJ3s72+KyOTenFNcbp38H1ozlyEWkF9sHb7CiBwpe9M
 AuOBIRoXu4N5DvktbOJ1IzlgQy/ZZEWH+MHztLIYsKjalZ54+AEtBPvfG+dMqWNJaNco
 L4O3acOvHNLHhEwa8zfIh6wfEbDx2wmFZe58dzQHQs1m9xsdYUZR1BvC6P6rUg17OeKJ
 pgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689349614; x=1691941614;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZJ5X1Cn1l4/BJNDm0G2PsxEkjY7Sczg3wp18DaMO6sk=;
 b=QFgJQH3D9XzfM4kcQ7WfsakOrPZpGqgsKjm+E69w1C9zIP5Kxnt0+/572soOoj5Loy
 3D7rrrbcrI9JTNHrcgTsjsL1iWkkSMDRzogtPDxywbVBJqYWOnVo9b/QdOxm/5lUd2Od
 IJmIeXoth2CSDEV1mKY4P6TaR5MXp9vbRdbPZUEMslo/MSg2KgGKtMXKDWnd6YKrrZJM
 1JmeqSIfNO2TG17HvI/nUOau4gjYy97b72o4im0W06OeU+DmMKRvWyhL+vfIGxHytZwA
 QPBE8kKdcqpqH2/QLh3SrF3OTML1fygpR2s8iqiFtkTLO3shmkb3Dfh4w4U6eH+uWY0N
 yqew==
X-Gm-Message-State: ABy/qLYV7zeUz3pTIASE17DEacJDaBnFNzHqGCfruRHse35MWuzZWWYP
 XmkG9xVQnTXQIndfbfXJHWftg/kkiD6HHbBL50w=
X-Received: by 2002:adf:f08b:0:b0:316:cbb4:4e46 with SMTP id
 n11-20020adff08b000000b00316cbb44e46mr4467148wro.3.1689349614273; 
 Fri, 14 Jul 2023 08:46:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a5d49d0000000b003143bb5ecd5sm11214025wrs.69.2023.07.14.08.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 08:46:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 07/14] target/arm/ptw: Only fold in NSTable bit effects in
 Secure state
Date: Fri, 14 Jul 2023 16:46:41 +0100
Message-Id: <20230714154648.327466-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714154648.327466-1-peter.maydell@linaro.org>
References: <20230714154648.327466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: iQByGcZhuCN5

When we do a translation in Secure state, the NSTable bits in table
descriptors may downgrade us to NonSecure; we update ptw->in_secure
and ptw->in_space accordingly.  We guard that check correctly with a
conditional that means it's only applied for Secure stage 1
translations.  However, later on in get_phys_addr_lpae() we fold the
effects of the NSTable bits into the final descriptor attributes
bits, and there we do it unconditionally regardless of the CPU state.
That means that in Realm state (where in_secure is false) we will set
bit 5 in attrs, and later use it to decide to output to non-secure
space.

We don't in fact need to do this folding in at all any more (since
commit 2f1ff4e7b9f30c): if an NSTable bit was set then we have
already set ptw->in_space to ARMSS_NonSecure, and in that situation
we don't look at attrs bit 5.  The only thing we still need to deal
with is the real NS bit in the final descriptor word, so we can just
drop the code that ORed in the NSTable bit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 9e45160e1ba..c30d3fe69a0 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1884,11 +1884,10 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
      * Extract attributes from the (modified) descriptor, and apply
      * table descriptors. Stage 2 table descriptors do not include
      * any attribute fields. HPD disables all the table attributes
-     * except NSTable.
+     * except NSTable (which we have already handled).
      */
     attrs = new_descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(50, 14));
     if (!regime_is_stage2(mmu_idx)) {
-        attrs |= !ptw->in_secure << 5; /* NS */
         if (!param.hpd) {
             attrs |= extract64(tableattrs, 0, 2) << 53;     /* XN, PXN */
             /*
-- 
2.34.1

