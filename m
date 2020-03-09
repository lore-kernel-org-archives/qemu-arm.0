Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1629490lfc;
        Mon, 9 Mar 2020 14:58:39 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtTEpqXLUhaEEQrfMzzbWyaEZg4ofgDhk+mf3Svx3urpQ2qN2+FfxklROIAb768aMJFRvFn
X-Received: by 2002:a37:7245:: with SMTP id n66mr17819547qkc.202.1583791119292;
        Mon, 09 Mar 2020 14:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583791119; cv=none;
        d=google.com; s=arc-20160816;
        b=vWD2IUfXoq83fIeg1K65ReB0MGFxccg/XHDQhzan8jfAabVS7N7QiqiOOFCuPSMQ8I
         wJOiXzMT8ZeWS5+eXJTSIg65m02h6yHle0E82LQVifehNRtHUD+VBjqdn4p22dGzDu4+
         Cou6hMPx5szYAsb5SV4CxkCkO58R/hc5qYaa+LkBH3vrlXq2QUV3KBYmhcPx7TeEkQ/D
         PEFZso/I3RS650jHBoD27QurpOTQXCA5XANCST1PzqnjSXEMs9TqQIuY3W5AG6Qe6p2y
         zIMfBDRfC89Ad5zQdTVH4kwXXylXFJ08AoeTO1SgNPbanPMFs5zZu1VBpOdqOX0nq7bB
         AT4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2n3nGOj14Qa+RXY1pY3cDWtilSqrSMjx7cEnFu1bzAg=;
        b=dTe3ZINjUWkMwcHFKgWs7YMAce5KNfY/8kLbAmwrJTWt7eO/4j2slj6dL/pDicKtzv
         q/Fvv3+Nt+RMkHI1CP3uN1P/k9k9seN3nH96gPlFwSTB+i5yeF8BS54N3IEzQNeCCjDC
         EbRLdSKdGjaD074ghixxSxCJJIqMAEG1JMav+tusXNLpgdbXBt2fsx6ZIGIVI2h9ZK8r
         VEJpem6AZ+/6Xa96TkgR464Gy80W8PSjJ+oMVYvERRaf18mW14ikajRuWr+Zhjn8mCGQ
         DZdFqIls2lH2+Qq3VyYZ0A+BVjQrxjawWOWz6lwcH5hFSWX0aYb9O8gMB2JEvKhSavsV
         JIdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tI0y360I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c7si3107457qkg.353.2020.03.09.14.58.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Mar 2020 14:58:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tI0y360I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBQQ2-0003Jp-Lj
	for alex.bennee@linaro.org; Mon, 09 Mar 2020 17:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46877)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jBQPs-0003FL-Fz
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 17:58:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jBQPr-0005h8-AY
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 17:58:28 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42404)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jBQPr-0005ga-56
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 17:58:27 -0400
Received: by mail-wr1-x434.google.com with SMTP id v11so13160153wrm.9
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2020 14:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2n3nGOj14Qa+RXY1pY3cDWtilSqrSMjx7cEnFu1bzAg=;
 b=tI0y360IxNZcmSKHSZt+fRHEfyRNE7SQC7aqAXfgjLVUs9ydbRMBvpjbyF4bnwt1Op
 AySe8OaxX1q6etNx5N6PXNyd0D7NJQm/cFTSBtB5N3vIgcxSjHmYfwGQYOOr2HRDulMU
 6IPqMfnSNutKju149yK8S24LaAKQ3stdUEsJZ1r8eeY1PIbYBmSQ+GdyBKQh3IzsJcWj
 KMds8aapMCEzt52g6L2Y5Vhf21Dmqqpdj9fiMgeLMRYyNZe2F1o8e5qJk7Vn5zuPqCLR
 QIJWmgnP9lBJbTWhnMpQq6ibF9cRdWY2KAKQlTQ9yuNQGecRYgyPlOWpdqA6xNvoG+vF
 Zyyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2n3nGOj14Qa+RXY1pY3cDWtilSqrSMjx7cEnFu1bzAg=;
 b=BSb6+TKlj5gGmGXBj9gOCk0e8CKtZH3ak2bvXiyTBLQ/VaiFoMIiuB93G5KP4K9/aQ
 s8v8ZhfdnxeFpFqS3m4+BHGf3zTa7CAsmJRGn9/n32/OHe2wxSEGGC8WCW0OcU9SKsTL
 r1KF/PkypUXIwT2HTDvWeT+19LzntmslyqbS60sKcKArVjNeOtA95/dECzZYiEepE4TH
 5VoMRkfwwC3ZBgfpGHL2CPKQdR5yO3uefRFdkaAiw+0w1wPQkx7q704vNGk6HXcClFS4
 pLf2af0SbONhVZWoCweNcGQgUV/efvakVrYlG+BAk1hFtAKnOE9cCzfQlX9iUJDCQGMz
 L7NQ==
X-Gm-Message-State: ANhLgQ0W2Uz3EJ2Y9YlJiK3jwaGPB8IBx631ce+X/nd+h7QtCqik1/FH
 jidAREEYJs0RgYKzTFafU37aogc34FUuAQ==
X-Received: by 2002:a05:6000:101:: with SMTP id
 o1mr9165661wrx.239.1583791105719; 
 Mon, 09 Mar 2020 14:58:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f17sm42207068wrm.3.2020.03.09.14.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2020 14:58:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/5] docs: Move arm-cpu-features.rst into the system manual
Date: Mon,  9 Mar 2020 21:58:17 +0000
Message-Id: <20200309215818.2021-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200309215818.2021-1-peter.maydell@linaro.org>
References: <20200309215818.2021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::434
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
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6loqJMceLa3V

Now we have somewhere to put arm-specific rst documentation,
we can move arm-cpu-features.rst from the docs/ top level
directory into docs/system/arm/.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 .../{arm-cpu-features.rst => system/arm/cpu-features.rst} | 8 +-------
 docs/system/target-arm.rst                                | 6 ++++++
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename docs/{arm-cpu-features.rst => system/arm/cpu-features.rst} (99%)

diff --git a/docs/arm-cpu-features.rst b/docs/system/arm/cpu-features.rst
similarity index 99%
rename from docs/arm-cpu-features.rst
rename to docs/system/arm/cpu-features.rst
index fc1623aeca5..7495b7b672b 100644
--- a/docs/arm-cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -1,11 +1,5 @@
+Arm CPU Features
 ================
-ARM CPU Features
-================
-
-Examples of probing and using ARM CPU features
-
-Introduction
-============
 
 CPU features are optional features that a CPU of supporting type may
 choose to implement or not.  In QEMU, optional CPU features have
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index 86ea6f2f568..1425bd5303a 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -78,3 +78,9 @@ undocumented; you can get a complete list by running
    arm/stellaris
    arm/musicpal
    arm/sx1
+
+Arm CPU features
+================
+
+.. toctree::
+   arm/cpu-features
-- 
2.20.1

