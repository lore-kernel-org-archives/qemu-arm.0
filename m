Received: by 2002:a05:6512:2248:0:0:0:0 with SMTP id i8csp475585lfu;
        Sat, 30 Apr 2022 23:23:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3uze06NNpUF21mAwnv+zmsyDbfzWZCGu9za+WBSBq4sU3Ri5DREScwR2lwzQ3LNzKNNwH
X-Received: by 2002:ac8:5c51:0:b0:2f3:87e3:9835 with SMTP id j17-20020ac85c51000000b002f387e39835mr5692394qtj.355.1651386232495;
        Sat, 30 Apr 2022 23:23:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651386232; cv=none;
        d=google.com; s=arc-20160816;
        b=j4OPdZe/taUORAl+uxLKGMXIDcrZjYTfcWLG9direuBkcnC2kRXRvtmfKxRfF6A7zk
         7t94PvdmKlawIz6P+3BA9a1R0Vlc7cqVygXJvPgSZUzLiQ1NXzjBfnexDLKZN8OQav4u
         No/8cO27ko5JSF4IxxjUEcoFnhySoUv6B8VMm3H2rP9ovK4PWJiOPtOO3+jx3Do0RiHa
         4AZfkzh1CBDzaUos7UkxSTUl/zcXId4F8y4DrwJjuMFx81mX4CBAj49hqmbESwE0/YJj
         VkydSubyUkZIkTf63RRzTd58i3XPO/po93vJd5ijODwJSuU/t5BAAyuJQvR2ByHlfGb0
         V9Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=D07lm6rtFq06JeLlfPndO5hnYOCiVf7FRykTHAAXauo=;
        b=ol4Qvk/xEn2bsZi6N51ECSpS0dXWzpt4fhnaoYcKr/WEWui+Cq8UTxAFQFaQCiqobn
         nJwfqckHVUsZ39bkWCws3LWeeDV8Fho7ValgKhc+ybmF8ucixFuiq8fcPkj4dWuocS9m
         FJzd4Lt8F9ktv5J7AIADQtd7CaTQiYynR4/gmASrvNiO15H4SA7tydm4rzHBaRy6+bD2
         +aEacTqkXIX0CZtsr+yGiNjN0kon07lvK3jUHoVDi4xRC4Ssa8PP3tVIZDff5XkAki6T
         mywXAIcjDaNLM/5VWiga44p8ED5Rg+//bQxY1qz4chx3uoupmgL8pFEF2O5YHoSNTvUI
         AJVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EkLz5NHt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dt11-20020a056214098b00b0044665df70c3si4743281qvb.87.2022.04.30.23.23.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Apr 2022 23:23:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EkLz5NHt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nl2zn-0003pJ-Vf
	for alex.bennee@linaro.org; Sun, 01 May 2022 02:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tq-0006tI-0E
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:57 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:56116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tm-0001Hz-EI
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:49 -0400
Received: by mail-pj1-x1033.google.com with SMTP id r9so10320680pjo.5
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D07lm6rtFq06JeLlfPndO5hnYOCiVf7FRykTHAAXauo=;
 b=EkLz5NHtSDHVvYrw2QQUPY3DgAvLq5Rgq44v3ZLNslDl9/HLL9zx5Z0dDPym9mOupM
 XnSkb1vDKfM6jgX0ttmyJvh5PbTAAK4a+BfFMqGyg77KDKb9zlZsbQ1ecS6LspKR6Af/
 0K8IiVFazW8MZ/678Qu2JPjTzti+YoIRn8g71qRU6uqlCUvjlJFZQgscWn7XV4u+mSZO
 3Fvma2OmX1zpRZ+jVRTfpjGZnX8nNvHPO7KaJhFhNaAY48CQKa3KK+GGGw+y7ZO8sr7j
 Kq6r9MvNbJI8ZasMX59f2IQG/26wd8ICzC50tcZNsQmrSRrh56V8aq+72lTJEsFdg6Mh
 S9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D07lm6rtFq06JeLlfPndO5hnYOCiVf7FRykTHAAXauo=;
 b=Lv3J9fP19bEh8jbByFI+EU+LDLzhcjwGJUkWUmC7eJfVQ3VFDoKQ1g+nUwqRBYjOQt
 0FFZpN39sAvDyvHcF96ukWZL/OE/wsuefn+ytMbIFIoHThHaa4wJpED3jBUrZYiVpAxy
 jH7/q20qeN3YKoDg8iK9HxMa99JxAk/aEN0RD/DPonUZ5jFBhWVzTVWjRmyu2W9kApkf
 V0++sKcuyBAVAJ9ETiJIbOkGoLb8me6yk0EzioSVvWDJGsFWqnh8tClf8lqgAUdn0S2+
 Qt4SptBmyOKzlULJdM0GBKN1TRbUBmotd0w7lCbie2u0aKcAeEtOYE/uLYtRetHfkKR1
 Hjrw==
X-Gm-Message-State: AOAM532JEOBwfF/RsnseBvLHoAEOQSluosPAEwKJkrU8FiVywnl15Y69
 WP/3O91y5MDEwFW/AnCMV7DadGlP6UNREA==
X-Received: by 2002:a17:902:854c:b0:158:35ce:9739 with SMTP id
 d12-20020a170902854c00b0015835ce9739mr6157164plo.150.1651384245251; 
 Sat, 30 Apr 2022 22:50:45 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 16/45] target/arm: Hoist isbanked computation in
 add_cpreg_to_hashtable
Date: Sat, 30 Apr 2022 22:49:58 -0700
Message-Id: <20220501055028.646596-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tcChNv+ohEEs

Computing isbanked only once makes the code
a bit easier to read.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c6d407f93b..f1fbbdb9e0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8510,6 +8510,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
     bool is64 = r->type & ARM_CP_64BIT;
     bool ns = secstate & ARM_CP_SECSTATE_NS;
     int cp = r->cp;
+    bool isbanked;
     size_t name_len;
 
     switch (state) {
@@ -8557,7 +8558,8 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
         r2->opaque = opaque;
     }
 
-    if (r->bank_fieldoffsets[0] && r->bank_fieldoffsets[1]) {
+    isbanked = r->bank_fieldoffsets[0] && r->bank_fieldoffsets[1];
+    if (isbanked) {
         /* Register is banked (using both entries in array).
          * Overwriting fieldoffset as the array is only used to define
          * banked registers but later only fieldoffset is used.
@@ -8566,7 +8568,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
     }
 
     if (state == ARM_CP_STATE_AA32) {
-        if (r->bank_fieldoffsets[0] && r->bank_fieldoffsets[1]) {
+        if (isbanked) {
             /* If the register is banked then we don't need to migrate or
              * reset the 32-bit instance in certain cases:
              *
-- 
2.34.1

