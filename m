Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1063643wrq;
        Wed, 23 Oct 2019 08:48:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxzA/xnPWxR+qSYuec4AdJ58k4YYbLrZmNwFKMtUyQBn/VGkAMD/KKIEZd92nlWjIGpfPHn
X-Received: by 2002:a37:6212:: with SMTP id w18mr1843204qkb.204.1571845689307;
        Wed, 23 Oct 2019 08:48:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571845689; cv=none;
        d=google.com; s=arc-20160816;
        b=TmAb+jFOrqSYvN8rFS5Ck4TysGGL6tGA+U43JWl0hsgq1566IGBtZXcTOVMF/x4wFZ
         u5zxOOCCc4ALr1kZfz9rRn2XiVtVEs5124vXL/Zz6IE/Mk3GbcchtSJ361s/DJ+eaTP9
         VXplNqUWk18UIbKuKK/oScqxoBObnvDJRXlMouXMUd0nJH0wQAPHdZWlyXmBoIPsmdQs
         6tBld2OetUzZ/IbrQCKgkzV0j6JXnAuPFO+CAkO5l/TuCLPD87K5brSbw+Vi7zz0g0ps
         6UymAn+qCSbJzKeBsl8Z+ZMIrY1FNK4GdF4hnNeCOt4IjSbi/VeyTpE2kvo3lai1V6PL
         5ucg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=4z2zPWedOviyKqg3qmIWn8g3R8jv2yS1u67ka41eHWc=;
        b=C36NlV1z/oIQLXLYEQK7ZoZfPsG2qQtF53YLWQK9KdIqsXXscmQD+GFp4qiUBoN0xV
         gPAzmmMDx7JdSkoiRb3pf8vxQdy9vW5+LJOW5NZhnDqGwYuvtcdLNYmPuEJmODA+p/zZ
         hXASlsHhH8EDgE3EfHz7vGdx7GkH0GknatDltLDF3J5b+EN8k0NIkEYBdIOQwcgTvLoQ
         OVqmtT4U6r3lq7VI095pF2uw/DKxirGQZzdDdpWwDVKuCydvi5ez+ZIvbbQ9jXBvMNEe
         h+e6mwIsY6kRgmGVr1Y9FhoE/Ugyazz5Rsiwjlz1nGmRzmmHB23S7VOV3f/6pEvD45OG
         ifVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kRI/7Vjd";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 189si11732304qkk.35.2019.10.23.08.48.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 08:48:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kRI/7Vjd";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNIro-0005cD-8G
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 11:48:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35503)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8y-0008Hs-Tt
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:01:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8r-0001Gm-P8
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:01:48 -0400
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:35195)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iNI8r-0001A4-KE
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:01:41 -0400
Received: by mail-qk1-x744.google.com with SMTP id w2so20044779qkf.2
 for <qemu-devel@nongnu.org>; Wed, 23 Oct 2019 08:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4z2zPWedOviyKqg3qmIWn8g3R8jv2yS1u67ka41eHWc=;
 b=kRI/7VjdZTOejYq4avHlHxKBwzld0iJdrnmUJYizOKUKU4Hvyw5X6xk+vB3jQ3MwbE
 GLKAtYQpd6/4UIjpbFlHS6RsMGZxt96vmQr8KHoZK7vq5Q/I2gQ+CJI+57KmH+9Tw/S8
 jzDgMHMp9/O4vIyfV63ewmnma2+XgWyqvayX8qP6LVmCGw6aqVx45uxbJG+W0jeX8edm
 vnZPw0Rra91QSKoi7rjXjY4gcglLlxA2jg29dVM2MKfyQt/2mAW4CjZid7E+oJ6jfNFo
 pTRacCtRxTQJf7PP7+OSofKTGq+VTEZPtewTlc93jRXkXg6C8Q6+fjTdecgZ+Gl/GAZe
 zI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4z2zPWedOviyKqg3qmIWn8g3R8jv2yS1u67ka41eHWc=;
 b=FJbhdIcmXvTqR2KPuBkWfeGMn7WStQ+i45Bma6yDZCj/O0407PL0jCFYyS4q8DvPK0
 DF7gNbl4ESwHCSGoNe+nU3PaN7YGYVYDfwqeffPYIpt3qS9jcJUV9F+cidYsPlufjoPm
 ZoXNEn0Pq9flEZNouBmXGQGacmFnJ1/viIx1ZijjJ48rBFfOxpOZ5KDcSv4w3q5btBdI
 4CUvEMOPlMDdAjOLtNbDan8mUkbPxeyoEp+CUgID35ZSHMa5/NKd+FRIYHyU0zrE32G+
 y0iqX9oQyrrEuF7fN4p8N/7aJwi8KGHGjbTPbH9ybJrQvDAiSgQUmVFI9FX8zmybOO1m
 GQ3A==
X-Gm-Message-State: APjAAAUsBzfuNvHLNwhn2QN7eD9oETzArtyIMSQ6OFuc0DkvVixjSMNm
 cfyao0P6kq2iGO3WiKAgojvv6O8xAyw=
X-Received: by 2002:a37:7906:: with SMTP id u6mr9178909qkc.5.1571842888188;
 Wed, 23 Oct 2019 08:01:28 -0700 (PDT)
Received: from localhost.localdomain (198-4-20-64.static.cosmoweb.net.
 [64.20.4.198])
 by smtp.gmail.com with ESMTPSA id l189sm11030168qke.69.2019.10.23.08.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 08:01:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 19/24] target/arm: Rebuild hflags at Xscale SCTLR writes
Date: Wed, 23 Oct 2019 11:00:52 -0400
Message-Id: <20191023150057.25731-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023150057.25731-1-richard.henderson@linaro.org>
References: <20191023150057.25731-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::744
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ub4SQ8EI4xBI

Continue setting, but not relying upon, env->hflags.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index aae7b62458..c55783e540 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4174,6 +4174,16 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     /* ??? Lots of these bits are not implemented.  */
     /* This may enable/disable the MMU, so do a TLB flush.  */
     tlb_flush(CPU(cpu));
+
+    if (ri->type & ARM_CP_SUPPRESS_TB_END) {
+        /*
+         * Normally we would always end the TB on an SCTLR write; see the
+         * comment in ARMCPRegInfo sctlr initialization below for why Xscale
+         * is special.  Setting ARM_CP_SUPPRESS_TB_END also stops the rebuild
+         * of hflags from the translator, so do it here.
+         */
+        arm_rebuild_hflags(env);
+    }
 }
 
 static CPAccessResult fpexc32_access(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.17.1

