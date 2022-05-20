Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp1672102lfh;
        Fri, 20 May 2022 01:46:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQxA0G8gFFO5msyFJpN/c29ehxCizsNM2U8ne28ZN2oDTAqILv3tYKXB9VCv/gzP8Ic9rv
X-Received: by 2002:a05:620a:2724:b0:6a0:a446:7023 with SMTP id b36-20020a05620a272400b006a0a4467023mr5630113qkp.286.1653036418073;
        Fri, 20 May 2022 01:46:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653036418; cv=none;
        d=google.com; s=arc-20160816;
        b=tWMfnO33D3hWrIm8DqXwTVI6ywH9R84ok5mRORxDzJ4uySiiwJoTbp6t7PiSbyD27U
         2aYAJ7omsUvnUdKgfUS9Xbm8osO8yURefl8EhwR7cjY2usdHey2daoMjxznPAcZpYEj3
         uSykljWVpxiVG9OBCL2gdgehwHGXVPkcdjib9cyH79ZwGAlLFDG4KR/4eOuEI4a9ABAT
         4snZS5CXIwfhX91EpYjCe0syxnLEmMadOYr5WoNm8mjP8rKgEe5fg9GnQVHxyUdjop0A
         SPmebJb9HmHY6DhUlnjiYUbU1Up8yODGiFzbnwcJv9FbUWqljkUYvb9BKLS0rLvzkaoE
         3YNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=5feKW7i1IZnmMlhHxIUEq2OpW0lCNJGHr98ysF/4oF4=;
        b=omp/j04p76vPayk996OvHscry17KCRNd3bNi1Ebbei96Rx9++gHx3l5AN28SN1fBC9
         4SdgZGWmUZX8GJgtQQpKtCgnlChHPGd99xlrGfOOa0qk1n3mK3F6Qpu2AGEJ54WEhyUG
         mraSvCpTXnX/+Qclo1+seGbSa3aqASdsxq5deRd1bLXy5hz9ML22FJjKi1a73Z15tBOU
         2oN9SZISRuceccb1uW5gO9APWg93lNbTDxnMgR6bFe+bQ+z2ocH6Q0D82DGOOh76Kn37
         h1DUe9TnxVwZYe497ISLScYFI64IEK5qDgbNgiyeHjeXoXiSjAa9yntkeF/J4ZwbEg/J
         0iRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="df4b/lGB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w196-20020a3762cd000000b0069f116073ffsi2009878qkb.188.2022.05.20.01.46.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 May 2022 01:46:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="df4b/lGB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nryHh-00076W-HE
	for alex.bennee@linaro.org; Fri, 20 May 2022 04:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nryEH-0004eR-U9
 for qemu-arm@nongnu.org; Fri, 20 May 2022 04:43:25 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:37839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nryEG-0000dr-ED
 for qemu-arm@nongnu.org; Fri, 20 May 2022 04:43:25 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 o12-20020a1c4d0c000000b00393fbe2973dso6395632wmh.2
 for <qemu-arm@nongnu.org>; Fri, 20 May 2022 01:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5feKW7i1IZnmMlhHxIUEq2OpW0lCNJGHr98ysF/4oF4=;
 b=df4b/lGByY3q6Hpmqr2QhPdOWESEgJF7KCSVYkcYuyozaZm8zTrlJdHeqsWs7o5btJ
 0cuS8J2KLUyXOqUI3RCQ+3PP1Vc/84fEQhg3ZrBEkATXyPP/UsuN5FlTCF+Fg77Ote9i
 kakwao9dRyAeKlQyNdXLYQES5cyfqEjfyrRxs12uVVVe5SKeTAcB5JPTNfArK1RwC2Tt
 obwmcTF1yvc1+8jw1c6MtmZkPLXYdEbyQnzaNBmvl9NvRgF7/Pg62y6l8SzLCfo6Me2U
 RmtyJGu8O4hxszsirildcxCWpdWfdocorAyJG3Xd2WrX2RI/BA2jgzN62gJgl7wVl3Aw
 vBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5feKW7i1IZnmMlhHxIUEq2OpW0lCNJGHr98ysF/4oF4=;
 b=g5Ti5qYUzLgJz/VWPiiIadwEfpd0KtDm+4zAKk/sRXVzCDDagJYpUWrykm/uDpWFvN
 71+LutJxc/D4gQuT4/xbUb0qtO1G/HstuA04WV2yWZy562JYedk8c741xq4oBUYOdCRM
 /UwyRPt6cs3AL+ZuKVp8V1n2WXFBi+BpnwV+UFg6OHTKfbThs32MlQWdoXlZNoHhW6zK
 aHyD661EtitZ4DRNCuWjZw56YN4cI68sOE1Q6dd8HxDj9gG9iFqpCPrdbUF1eD77VKrs
 mdG+py9aFQlXHONYmFGbCZPKPwHJW35W8gCuzRcc0g2fcEzaI18Jqa1Nrqjloj2zWnln
 F55A==
X-Gm-Message-State: AOAM530+DrARrdxbUVHgq3rGS0Lwf7fOeKPn6s1Z4RLJX2pIGdFfscNP
 Z48dhoSKHS75UmM3QOLj2DiJYjhrhI8Hvg==
X-Received: by 2002:a05:600c:3c86:b0:397:9a4:fa06 with SMTP id
 bg6-20020a05600c3c8600b0039709a4fa06mr7673636wmb.43.1653036202647; 
 Fri, 20 May 2022 01:43:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a1c7910000000b003972dcfb614sm1513139wme.14.2022.05.20.01.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 01:43:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] docs/system/arm: Add FEAT_HCX to list of emulated features
Date: Fri, 20 May 2022 09:43:20 +0100
Message-Id: <20220520084320.424166-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cp44LaP4qACx

In commit 5814d587fe861fe9 we added support for emulating
FEAT_HCX (Support for the HCRX_EL2 register). However we
forgot to add it to the list in emulated.rst. Correct the
omission.

Fixes: 5814d587fe861fe9 ("target/arm: Enable FEAT_HCX for -cpu max")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Oops, missed this during review...

 docs/system/arm/emulation.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 3e95bba0d24..49cc3e8340e 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -29,6 +29,7 @@ the following architecture extensions:
 - FEAT_FRINTTS (Floating-point to integer instructions)
 - FEAT_FlagM (Flag manipulation instructions v2)
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
+- FEAT_HCX (Support for the HCRX_EL2 register)
 - FEAT_HPDS (Hierarchical permission disables)
 - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
 - FEAT_IDST (ID space trap handling)
-- 
2.25.1

