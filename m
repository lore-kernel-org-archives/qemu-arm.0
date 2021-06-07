Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3695188lfa;
        Mon, 7 Jun 2021 10:25:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2BncduWYNHwpdQstw5di4pefLPeu21UxsXG5JtwaDIWjWeUMtae3R/cL31DRx9Vz8ivFs
X-Received: by 2002:a05:6122:a1b:: with SMTP id 27mr9087684vkn.23.1623086731153;
        Mon, 07 Jun 2021 10:25:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623086731; cv=none;
        d=google.com; s=arc-20160816;
        b=TDQJdGY1wKKXTNyi9Ddmy3CzYT+VGoZ/AnxroH29zGMdLJr2DcII+OQDaCe1/s23wf
         tLzfxmi3D4/rH0cRPznASqBFO0xf59MGHXSIM6cJX3molaBlK7LiU+agHeD2YIEVpWuI
         y0eJ0zkxvD0YTA8YzB8nLHTJtfoZtr98XpiwA/B641wU9qxZF1BxlARBREY3rBQgteku
         LUP7jPkYYdtBWfUWKbdXmITfYJ18M39tcogOwyeDv6701eMZATma5xHbuWAABdehLY1q
         xXHBB7oUODGJ6Tj6a8WiRPbIGiXh1SOhbUgmtShxdnWZNNnadGVP69XgZ1blKs0AbQVN
         FUEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=RzQMU2S0MPi6LG0qvbJo0z1iKKPaC9Dm6mwYYso4zvc=;
        b=GK5SkA9aYugK3g290a/x5O52HG16IEqddcBgS+F9jdtnaSwAePR7R/6JHg770t5sbq
         lY7jGkQp4II8uXNSxINmiU7FwB39qwzJIU05owz6sEDdT3YHOodKZexqL5g/OBMRoZsa
         I3syAmJfcl0KbIklU3FEQ/0lfy74qU6ltkWm0m8Dz2a6FrlRMwHVKGfQV3t2BiJakPLx
         vQAP46GzOifH7Xy5pBDRr4XwgrcBbfCPnQkQVCo5ecnsQSEPTeJkp5IW9dkCRNfTm3bA
         nOgEwwM3/2pG6i6FHt08/w2C1BSzjF/EEnZnMZe9E6Rvx7NuGHr/BZ/5f3mqUPQd/6DL
         DZ8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xNHOg2DM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b13si4286356vsl.108.2021.06.07.10.25.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 10:25:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xNHOg2DM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqJ0E-0006NG-E8
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 13:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIbC-00089T-G2
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:59:38 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:52944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaZ-00081Y-U7
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:59:38 -0400
Received: by mail-wm1-x32a.google.com with SMTP id f17so106486wmf.2
 for <qemu-arm@nongnu.org>; Mon, 07 Jun 2021 09:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RzQMU2S0MPi6LG0qvbJo0z1iKKPaC9Dm6mwYYso4zvc=;
 b=xNHOg2DMteh7TAdIVmaWYo+X/GeDt60xODrAWEl9jKHSEcQigtJL4ufd5TB8jNwUp2
 dlE6ofWdhj+DnercmQyrJGlt0hF23HaGHGwTBUbA6ad3sbDtq7rVNnM6UZJd4jQxXj1M
 lo523l3NpmJwDB1RRBFDSzEP3zsr9SvsZeY/jm6yywBLZ9Jllp+M9+ziDWWZcD6ZTIuz
 4oeVDDsn1uSG1zhAjybfulFhlHozSAohQVyzxAo1Py/3NQqhCO+ocTVFdtTwMm3qIup5
 VPUJfTwJyUgWKEWjUmdnRZeMwNPhpmT1G/txXIlSpunUYQYgKnEwjcQzgLJRWSr2DVTi
 ZCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RzQMU2S0MPi6LG0qvbJo0z1iKKPaC9Dm6mwYYso4zvc=;
 b=i8q0EkFgxjXzU9Eo17heD1zBm5zVSVDYD2R0VdlR5248GsPg5r7dvTuKBGWghE1yGf
 hbifrKsTwQDYYTtEakjjuzd704hpGVx9tkMQlxtjPjV/v9lquh3zLPlQ5r/dgcJ/y4k9
 ljHHsQ1qAQirs0Vke3v2ImvNm4K+bOYsN62psWmWtNStXCqyxvjxFKMzLY4ArUMi1Vac
 lqER4GWVwdEEROBhNLV/SedivMcSLOk5mEZdizp9qtSzfvQ/L/Xeqc2FBIESyoNFWlo8
 WvYQ3wxzobq7ITAUMxKZczU7IaJc4SF6j1tdYWhFr8OdyWLGM3gzoceajO0NGtnyK2cO
 RT5g==
X-Gm-Message-State: AOAM530j8I9fNotDVH+EjHyTC+92o2/cZcGsH5dbt/luhAkT+QOOuylc
 +MzvjKnNTRRlcH2/nOw4XUSHuLk7A1O97isE
X-Received: by 2002:a05:600c:4ec8:: with SMTP id g8mr93878wmq.62.1623085128256; 
 Mon, 07 Jun 2021 09:58:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 31/55] include/qemu/int128.h: Add function to create Int128
 from int64_t
Date: Mon,  7 Jun 2021 17:57:57 +0100
Message-Id: <20210607165821.9892-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WZ3uAVafWFZY

int128_make64() creates an Int128 from an unsigned 64 bit value; add
a function int128_makes64() creating an Int128 from a signed 64 bit
value.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qemu/int128.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index 52fc2384211..64500385e37 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -11,6 +11,11 @@ static inline Int128 int128_make64(uint64_t a)
     return a;
 }
 
+static inline Int128 int128_makes64(int64_t a)
+{
+    return a;
+}
+
 static inline Int128 int128_make128(uint64_t lo, uint64_t hi)
 {
     return (__uint128_t)hi << 64 | lo;
@@ -167,6 +172,11 @@ static inline Int128 int128_make64(uint64_t a)
     return (Int128) { a, 0 };
 }
 
+static inline Int128 int128_makes64(int64_t a)
+{
+    return (Int128) { a, a >> 63 };
+}
+
 static inline Int128 int128_make128(uint64_t lo, uint64_t hi)
 {
     return (Int128) { lo, hi };
-- 
2.20.1

