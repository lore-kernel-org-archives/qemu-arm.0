Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2173319lfq;
        Fri, 18 Dec 2020 02:56:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZYZc97DN5znodfjxbPFAAvzQeL27HkzlPo/UO5s1nKdOz9c1cs/L+cqLGZTnD3pJywZ/I
X-Received: by 2002:a25:234c:: with SMTP id j73mr5217217ybj.116.1608289010085;
        Fri, 18 Dec 2020 02:56:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608289010; cv=none;
        d=google.com; s=arc-20160816;
        b=mT+2VC+ycw19GEaphrPEyiBSh8PYskto0CS/OpP2C7IPNifA6aYOsAVtV9YmNJ3/Hc
         i2RxANg3eGx7LahS8jIlxgh4B3WE8dk+kO4p0jjtW9d3qdhHoXYDkkLl764nzmYSRW8H
         Fd4Ist5HgIrZeXxQgqJc7B4w5VAIvZoaJ4tOEdzMdbLtWExd3rGkjN9J2YX7h38ask5Z
         na/wbJT4kkBGnk0WdBeRGTSlrdTWx4oVc/6HVkVwSePfhrbwLnee7nnv7kGkLf2110Ka
         z3e4RplXlWXWdMMn8LjKs+9vv5zhjUFoKslCSKHvNxEyT0Enh516ng8hdAYy8KKCKddA
         lV+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=1hehaVR7oQwiyE7Ji/Y6iAQ20rRANbkpUOsIqzYGc0s=;
        b=RmGVZUm0zwQfX2kY0hhLVCRG+JPXx7NlvAP7FoxzsjqK34qAf3ww9+u0xbnry4RibE
         wUYCH5s12MkWrNw6N+tc9Xlg9/UhUZ5CUGClcLbnbgT6jarF59NIxJ0dJozrZPAOyv1c
         5GwUKO+xNtCUghf0zTpljfwnei0U19P2hONgRkTEOnD0gHWvCCAV/PbwCRTPnxA1CsLF
         zxbnV1cvBrplypm40ZzxU1OxTKfDQehLVlN0vqDEFejrVPmlixbbI8Gi5eD8U+31fT3J
         3VQT0LeTVOCKY+qOL25rb1qSGZ+OLoCs0tQhRFcGgpYo/c9bl3tBV4Pr2NVpCy9rjCZb
         2f6A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v201si8778449ybe.88.2020.12.18.02.56.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Dec 2020 02:56:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kqDRJ-0003kp-ER
	for alex.bennee@linaro.org; Fri, 18 Dec 2020 05:56:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kqD9b-00076r-U1; Fri, 18 Dec 2020 05:38:31 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:55306
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kqD9Y-0003Lr-5M; Fri, 18 Dec 2020 05:38:31 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 3B027607AF;
 Fri, 18 Dec 2020 11:38:04 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 17/18] target/arm: enable Secure EL2 in max CPU
Date: Fri, 18 Dec 2020 12:37:58 +0200
Message-Id: <20201218103759.19929-17-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <3337797.iIbC2pHGDl@basile.remlab.net>
References: <3337797.iIbC2pHGDl@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7iwxlpEObIKT

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 7cf9fc4bc6..3dc2f5da6c 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -641,6 +641,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
         t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);
         t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);
+        t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);
         cpu->isar.id_aa64pfr0 = t;
 
         t = cpu->isar.id_aa64pfr1;
-- 
2.29.2

