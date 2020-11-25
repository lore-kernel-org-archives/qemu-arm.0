Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp154818lfb;
        Tue, 24 Nov 2020 20:09:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/NLJ/bw17gDkQ4AJvdY9AJDGT1rh6p3ev/ajov2Lsb4ptdKAgy049pzOty4bLnVxZfHG3
X-Received: by 2002:a25:e7c3:: with SMTP id e186mr1792322ybh.365.1606277369122;
        Tue, 24 Nov 2020 20:09:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606277369; cv=none;
        d=google.com; s=arc-20160816;
        b=OS77p4mzNk6WF8pu8j4SNy/dwlpFqAHyeVGy5NmCItSKS5vbHaqi/uPEzgQsf825xd
         SbuuqAe7iS57CDbBmzMYyiEwvVH3FePknhXnOdqmk7CA+94Fd6YyqwTqQExg6zTasUnE
         0ChwB4ucHZ9a7d5C+MPTezBWo+BwDEl0Q3+LoD1pYmD8IjYM0qL3GJkwn+ssnNB1Flnq
         VDqULKGaaDZb6LFXHTwSLfREooxVbJsUkgAazAPPS+yivMGAwlS/a1DkV1CJaTmakpBS
         4n36WGrVn8B5qPfqQlX58siArje45r3bFHXSWLhdvzmslPa7Ot8/Dk8axt754IqvoNWA
         SLZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=usLpa97UISiu51HArLZeAu/Edm945VN7Y5GLMB1hA7U=;
        b=DID0XLqwrsNxQ6GitHBDAZuouM+tWMm/mYOxa5tklq76FS5uNeXOy29ldywpXP5fEh
         QyfT2bh19pvBn+b6f0pAOHOwVarDkhWu2qTZRIUvvu2bUG3lNmM67Ldx1BEIBoDZEaKt
         wmUEZx+sVPPZuYQUSpVTPNVNhtSJ0/ZwoLpm61uYLUZcMpz+SZDOB3sWc3QMagEIWUyk
         igR8ofSEK4VYr47k4XlNA6zypkqjmYly1uQf7pUMkvMTNLG4/zKdz/QmdDoaNdRVLsMf
         5oMgtMGBlRBmp3Eq3gQaiqPZIwuhHwqpeJgVkfmdMz2wolAyJkIZP9HZf9WVPjGrPDoG
         F1nA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ztB3+Qrx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c127si1186620yba.167.2020.11.24.20.09.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Nov 2020 20:09:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ztB3+Qrx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1khm7U-0008RS-FS
	for alex.bennee@linaro.org; Tue, 24 Nov 2020 23:09:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm50-0004oz-DQ
 for qemu-arm@nongnu.org; Tue, 24 Nov 2020 23:06:54 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:32824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm4y-00062j-RT
 for qemu-arm@nongnu.org; Tue, 24 Nov 2020 23:06:54 -0500
Received: by mail-pl1-x641.google.com with SMTP id t18so465548plo.0
 for <qemu-arm@nongnu.org>; Tue, 24 Nov 2020 20:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=usLpa97UISiu51HArLZeAu/Edm945VN7Y5GLMB1hA7U=;
 b=ztB3+QrxyaDLIZWsrVjXeWUXH/7rMuNkbGaSlsbQKy3nYfu8gthCaloTptR+zarihh
 9JwfEjDS8C+GHluSDCJ+DJtTCi/WgECQUcwEXGXQ41eQKfQYhSKiM9VmQezcgJoB4D4K
 rT3hxHGfWaXLdSnO23V8PdwfU5kSxZ2yR6SWzDuefSzBHHP3b2ZYHnrb+r+f66G+X/nT
 QIsBzeXwkifvzucacKP7G9qxwhlvsdyT71r4R4O6oYMRVcZKoONw4lNXleVeWkr2hHRj
 JxB5Ha6UCG15YMiwZByktriZhguj9+HqV8P2ZOWhMqVsMZUadyNqKeDb8u669UYedCUJ
 EdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=usLpa97UISiu51HArLZeAu/Edm945VN7Y5GLMB1hA7U=;
 b=MwcAwDeqZQ8aAK5RQGhCtb3LaK6S6Tqq6pzfG6CsL7ETt18r3SbYYsSS9lAY4l8jU6
 NLQsaUi72EcoN/C+N1KWBUxuQLioPJkdKVZUIHVLsRZaHsApdPAOaCzxPsgQKq+mW2ig
 WAZz+RLQj7+lLekQgXj8ItNBJg87yBpEg1WzD0ZHtdDE5ZThiowwk6qlbW7CkFlTg50N
 hptk9KssyxGFNlHUWxmiF0ov20Zvl7vN8SiPIqiYTt+aHzIJcJ7h1Qwe8StxjTGep3F8
 lJ7pjHb/Msu8/5avQKhJ6/Yrk3IaYyiQ0LrR2DUWMadU5LVYDdDEpg6DjdqhCW4fgdLp
 Vbfw==
X-Gm-Message-State: AOAM531LFGPbUW8y9HSOeNUxTdDhqRG2J3LB5to4LNmnanZ4Lpe8klgq
 HM0HGTu3RoDBTx+qi9eREkGK0UAr1uTanA==
X-Received: by 2002:a17:902:ac81:b029:da:f96:1b47 with SMTP id
 h1-20020a170902ac81b02900da0f961b47mr669831plr.78.1606277211568; 
 Tue, 24 Nov 2020 20:06:51 -0800 (PST)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id f7sm447806pfe.30.2020.11.24.20.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 20:06:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/11] target/arm: Enforce alignment for SRS
Date: Tue, 24 Nov 2020 20:06:36 -0800
Message-Id: <20201125040642.2339476-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125040642.2339476-1-richard.henderson@linaro.org>
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GnOqNGs5uBb8

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 4406f6a67c..b1f43bfb8f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5124,11 +5124,13 @@ static void gen_srs(DisasContext *s,
     }
     tcg_gen_addi_i32(addr, addr, offset);
     tmp = load_reg(s, 14);
-    gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s),
+                    MO_UL | MO_ALIGN | s->be_data);
     tcg_temp_free_i32(tmp);
     tmp = load_cpu_field(spsr);
     tcg_gen_addi_i32(addr, addr, 4);
-    gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s),
+                    MO_UL | MO_ALIGN | s->be_data);
     tcg_temp_free_i32(tmp);
     if (writeback) {
         switch (amode) {
-- 
2.25.1

