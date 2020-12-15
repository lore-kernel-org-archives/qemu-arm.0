Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3419672lfq;
        Tue, 15 Dec 2020 03:52:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxC6sRQJtFD9Mwc31dsK4cYruMxBAGVINjAlyog3JRtcWRj7VcFc60Qx/DMeAccpsi/aixu
X-Received: by 2002:a25:e048:: with SMTP id x69mr43437011ybg.353.1608033175640;
        Tue, 15 Dec 2020 03:52:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608033175; cv=none;
        d=google.com; s=arc-20160816;
        b=tArM9Yo3HR2dc/v+Izf4ADolEiz+vPX3KsJIT9rA9XuNj02+ctYUvzJ0jNz0Vg9EhZ
         IoMUZOZdc4KjA5sYnzN9C58vITiOpzHCCk/QnXerXeuU9S9G5UGgRgrGHCPWaMCpCJQ1
         ZSsBzGGSamEt3zNui1q9QBh+K4Bgo09Pj64HGtgj67lt6kzBK4shS5PwHdboyckVAPQn
         cbbL1M+qZV1Lt4kB12j3xeYntRDBd7O5YPdManL14zR6eSgFXlm+k3fzEwpIIWZd5pMK
         GH/hOBTP8dq9cBJ32RATL2sMSNTCdWd6XjtT+4txWDQ3onP7+GX8sTFLFFFZh0kswY9f
         tXgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=48nQ9C7mNUNm7fcDy7YOroFTjMlVNdui5r8V9Y1adoE=;
        b=jeycloRTHJUeWvt7Ysrvgb3OtZz9i+gOxdkP8/XDf38jVuL0k4JgfohlMnEJWgEoWH
         kq8MTmeTcu2qiWDRLDic5W/awe3v373QCy6iW8DQTt3i9CDBilEbQ9Ov/riO5HAd+zid
         Rb9e05U89GDfp0DDhhzqMly6w1/Tckd5ANPhWpfeynM3nVc3fS0Vcm9y0AhOxTrS/zZR
         gxgjA4zRLwkk+IH3cqdeD4mVsnYDmnbSszQzAk9VwGFu7iX8xNpDST1EabCFXxejefmb
         vnxqoOoSBVYut4CucvqHm/44mnLtc3NKe0elVdrtSy4SiRCLGo+PdHvWJNyAauAXWrJE
         qX9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=TWzhIVOV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k2si20291320ybt.440.2020.12.15.03.52.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Dec 2020 03:52:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=TWzhIVOV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kp8sx-0004Nn-0C
	for alex.bennee@linaro.org; Tue, 15 Dec 2020 06:52:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kp8ox-00078Z-Bx
 for qemu-arm@nongnu.org; Tue, 15 Dec 2020 06:48:47 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:41528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kp8or-00014o-4l
 for qemu-arm@nongnu.org; Tue, 15 Dec 2020 06:48:45 -0500
Received: by mail-pg1-x541.google.com with SMTP id i7so3382853pgc.8
 for <qemu-arm@nongnu.org>; Tue, 15 Dec 2020 03:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=48nQ9C7mNUNm7fcDy7YOroFTjMlVNdui5r8V9Y1adoE=;
 b=TWzhIVOVFiclMjJ0AK4R9YfoK/cvtep4fIYw2IeqRqXR9906Ifmlw/gzXUZa8mTrNR
 t7Z2y3ea6qCvlUV0mVInvT1PzU1o2RD0+4flVcSOBsCR+8YvADt7aUpYh6GxP42NFSBB
 XiX60b/rW6yLzIAXpU/CZVeOWU3PYmMfwyTqlNobRZegDBgwK4jiwS7ytAze40y3qZKE
 /Uw/vp/a8lyC5cN5SzqXRES5l/pQ8gjhqfmWgg90dgQ2vsAXaI89yK8QH9F450+TpR35
 Crek5aFVzeSca7f8ydm27h3kRIF9QKwk0vZmll0aiQ3mfAurEGGHQbGNKuf1J3cuK5RK
 ZGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=48nQ9C7mNUNm7fcDy7YOroFTjMlVNdui5r8V9Y1adoE=;
 b=gd23rvL2AVMl48p2Jn4W/Wq+lBgOnzRClDdY2zR4l/cJxypA7t6ugKIfDFL4QG4UEI
 NTOtCNJmax/OPO9LPBLU89eRj4Lu5R1b9HHJ9Ug/at6Y/Eyl9Ro2Whg/bP7bXi5i4Fgh
 UTdhn52iQYnu+G1PuSj01nzmFtkJuWkduUU7iBK18GNkWjslTcqg4hux4TbwA1cwuT4f
 O0mGoEkO1smRMMUwH4DP/gdFmJqwhOOqfXu35mL1NArGlnG/iQz3O286097G8YFoCm7/
 q5ADPSXF/+qSxOOZxXiNpjIO0/VF7fXbrEkX68Owy54nm8+tePBjppJQBoitjcd7sJRs
 7bwg==
X-Gm-Message-State: AOAM530g+O3VQOaDCk9b1XYuqnfttqDhv27P9FkJ+s0FVoVdVC5p+8Ac
 ei660PgGTYQaOFF2uSXZv7qsWDytW6f3/klO95jCPDovowfoW3URBXrYWAm4F4uYZDXdrJDXjhA
 3Qb4hE1x0alepEp4Yo86GhdRP7Y7TZ/U8ui3BNqUbEubyDYSKY09R8HP4uGeDf8dA
X-Received: by 2002:a63:f849:: with SMTP id v9mr28754208pgj.247.1608032918783; 
 Tue, 15 Dec 2020 03:48:38 -0800 (PST)
Received: from leonardo.ba.nuviainc.com
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id z23sm23340001pfn.202.2020.12.15.03.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 03:48:38 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 2/5] target/arm: make ARMCPU.clidr 64-bit
Date: Tue, 15 Dec 2020 11:48:25 +0000
Message-Id: <20201215114828.18076-3-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215114828.18076-1-leif@nuviainc.com>
References: <20201215114828.18076-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=leif@nuviainc.com; helo=mail-pg1-x541.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dqZSYJBGLKck

The AArch64 view of CLIDR_EL1 extends the ICB field to include also bit
32, as well as adding a Ttype<n> field when FEAT_MTE is implemented.
Extend the clidr field to be able to hold this context.

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5e3cf77ec7..fadd1a47df 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -938,7 +938,7 @@ struct ARMCPU {
     uint32_t id_afr0;
     uint64_t id_aa64afr0;
     uint64_t id_aa64afr1;
-    uint32_t clidr;
+    uint64_t clidr;
     uint64_t mp_affinity; /* MP ID without feature bits */
     /* The elements of this array are the CCSIDR values for each cache,
      * in the order L1DCache, L1ICache, L2DCache, L2ICache, etc.
-- 
2.20.1

