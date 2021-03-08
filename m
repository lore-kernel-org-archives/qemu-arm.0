Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2264435lfg;
        Mon, 8 Mar 2021 15:12:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4ZArD90JQMFWMKRwgT9KnFcezZfUYaOYVmvoLZtbpjRtd/V4QBErcOYXXR7zQcTV1uMKb
X-Received: by 2002:a4a:b302:: with SMTP id m2mr19981715ooo.59.1615245158919;
        Mon, 08 Mar 2021 15:12:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615245158; cv=none;
        d=google.com; s=arc-20160816;
        b=qSk2XZNu+nl12tN8aRBLlR1GJc9zBVoKluqG61GaIv1+zzVTkDVFPJs946rgDzA5yd
         he26fTVNFXinNyNYkE4CwtHOqa8Dil9yzx3XEtxQUBRDi3DTI+5cdkMzHLfhlaJtgEdU
         8aBEaY108UUgktpDM2FgCyP598fvxPF9D4U2GFJu2u5nZ2wcHLKOB9VxIedHzdCmFtX1
         Wd2Ai8EPA4JaNNCWJGmpKUOCbKW467anRtx0qu7liN+U3piKdUSTs4s51v6Ppvd293CW
         U4SsEpQ51Yjp7tPeN9N8zlsXOp9j7a3p/AJUnez41fAc4Big/yomW7GxuG1ccjzKfTBl
         9SUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=aoM0M/DyXZftEA9Ex3Gu16FrflMwJF8lgoZOVYhOnRQ=;
        b=Rat9TVO5CflJnHBmAnCQ6duE2l1yd+EU33v/qI4SE0AfFPSLDVmHJdSJHyv/vfcr3p
         6ubK++5IplLQLUzDgElKG+9TY7TxXKOxF8JBEV1Qt6t08VNaKNxBAJJPkykVNGHrNeYW
         +Az+sbZZhpENAgM4xhA7Jp8y9zw7RpixHud3NcZKkQD20ud2hZe8DYFLrudzfEW+RTWc
         seC9P2T0ZpH3xCoNjwn4oovrEZqEfHNnx1dw2fnO6GJZKe4yFESC3R1QlV3MBdWTFspz
         8EylRbTPWEG+ZW/Oj2I8AYVe5HFrLy/ZeHKKS7QgOf2qmr0sItVZQw1EcPgWUr02A8mj
         4K5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=Tq2LEKeA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b12si2781845oiy.52.2021.03.08.15.12.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Mar 2021 15:12:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=Tq2LEKeA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJP3G-00038Q-6p
	for alex.bennee@linaro.org; Mon, 08 Mar 2021 18:12:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lJP2D-0001sM-3G
 for qemu-arm@nongnu.org; Mon, 08 Mar 2021 18:11:33 -0500
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:39447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lJP2B-0005mZ-IC
 for qemu-arm@nongnu.org; Mon, 08 Mar 2021 18:11:32 -0500
Received: by mail-qk1-x730.google.com with SMTP id g185so11238539qkf.6
 for <qemu-arm@nongnu.org>; Mon, 08 Mar 2021 15:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aoM0M/DyXZftEA9Ex3Gu16FrflMwJF8lgoZOVYhOnRQ=;
 b=Tq2LEKeA71/8Ua0E/3BNhFRZXma12M/qJYMqDjs+TOsByx7bNV5/rm4Xfqg2PNZ7p2
 qM89GT7dYdi64nNLbZmKvgx06f3mFCGqFTuXUvVs+STPyBtQ+aKfN8MFFALGsxBBt/7n
 /OSTIkrRi4bsHwVXgMSeM/t5WbfJbGLHm1FSs+9cD7nhK7fMeY7Ah+G7ElFghqH53LAc
 wiQR5FaYcGhYLEXZapVTLCVdpuioweqIQqcMcis6zePGGA6hWxheMKbHcSp469KInbMp
 ajGNsfqNQP1Kt7mXRCYL1o9J3BRcDBF++lGorrbEcY7vEA++J94rKz/OTYQepnMSfHWg
 EJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aoM0M/DyXZftEA9Ex3Gu16FrflMwJF8lgoZOVYhOnRQ=;
 b=MVyTJzVtX8WoO96cm9ie19TZjxycvlleQlZ/RSV8Fn6ebY7Jc18lr9rhmE3unV7Oj3
 OZW6zUfLXcqYmWRB+goc9X0xsi8F2KAOhuHjp7MDAitTeXiyOosuJG50a0xrVHXpqaV7
 sKjhQqz6pmjYxEm+8QTIV1xDolNxL7/DN6g56/iwCTAuDe6d5RihYJLxiB7FxtejS9LP
 fZYerUu0FS42A9z2XpREDCcCaqcF+Fpc0w1xueRAKvuLk5XdCI6L7UXRMQs5LDGJSTdy
 ZEGuUixUupn+tVRc/KNs+/WRMowVIKWE+zhtMq7nEH2TPWeLOCaCarIRSBQGpZUvuTKf
 pz3A==
X-Gm-Message-State: AOAM531T4bRXNISiWlVOPwOyInvkO7RrLkspdS+0rmIAfaa9p6Jn7YnG
 Nz0NSBQzArzGjrg6P+nm0XFcNg==
X-Received: by 2002:a05:620a:31c:: with SMTP id
 s28mr22950255qkm.342.1615245090764; 
 Mon, 08 Mar 2021 15:11:30 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id z6sm3312342qto.70.2021.03.08.15.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 15:11:30 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v2 3/3] target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64
 CPU type
Date: Mon,  8 Mar 2021 16:11:17 -0700
Message-Id: <20210308231117.12650-4-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210308231117.12650-1-rebecca@nuviainc.com>
References: <20210308231117.12650-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=rebecca@nuviainc.com; helo=mail-qk1-x730.google.com
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MCpoCUlW/axo

Indicate support for FEAT_TLBIOS and FEAT_TLBIRANGE by setting
ID_AA64ISAR0.TLB to 2 for the max AARCH64 CPU type.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index c255f1bcc393..e1003fd96138 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -651,6 +651,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2); /* v8.5-CondM */
+        t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2);
         t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);
         cpu->isar.id_aa64isar0 = t;
 
-- 
2.26.2

