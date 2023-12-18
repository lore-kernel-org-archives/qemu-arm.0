Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp722673eji;
        Mon, 18 Dec 2023 03:34:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOiFaWVg3/AeLj/lfVFFJ2xtavQYfsQvUcC/0miryqFlADbt7WY1lUCVa67H7rWgsb+68I
X-Received: by 2002:a05:620a:389d:b0:77f:3cb9:8b5c with SMTP id qp29-20020a05620a389d00b0077f3cb98b5cmr16958549qkn.18.1702899256834;
        Mon, 18 Dec 2023 03:34:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702899256; cv=none;
        d=google.com; s=arc-20160816;
        b=GohME7N+0GzhKbnVW1fAE/vuP429/yCeYYjJhl75AhF5zdLz25TCukyomszX7YNGtO
         UjpWS5iYIM9U+2gb3Svs+AGQM2dlvUPL+lHx33q61pQGYimoxzuT1X7EWbfxMvYHA/83
         D0HH0I2WoP1EzEsu+Q6sFw4n2AnhyeVZTM0vEDJ5nUKANyZkn5QG+MAqpuJaTpWQUT+d
         +Mj9Z+0y7gFMoXtz6Qj+jQrcQZban4A0e6HsCIxk18r+UTHKuuPWN/zNHKnfc62OIr3f
         IfwckWThVbFZc8iKNeDsAvtmU9LF0V/kIqCMhm8cV8unYZPls/fArER7GZDxJ0naIIfm
         zldQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lh3o7kEui0XF0sV1bPH07EOu1tlpcJ6HGtHE/IUXYQc=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=rWMt83mXlfDR+XDhtQmVXa+bvXh9corh7l4oflmJAnOB9cAUPavuyrTxZ8U6imZ7eS
         oazo2pPmZFhRXsvSOBfdl8uZiGCCtONnJv54YCKIK8k8jVGsbdaTSclmsvQ2hnA0VdCu
         uZEuwjx/GL5XY1HFEff0MZYrfwHkvExEUGsLBAW3yMSJKldpADis7QxTLfwwO/VDqFSz
         xFQFPWuv5Q9uMGr1oeDKZYTIPh4CmjjQ/VgMaI0k2Bb4mKi0Xvqi+uaCUAil++q15Xuo
         yfR4urrbzMawxeT7KjVMR3wEvyH6Jg1knzo0qPYG///qQ9IgkC1mioy/MwH88FOtAsSp
         9u2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Da8AXuiG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m19-20020a05620a24d300b0077f62e42f75si21770715qkn.584.2023.12.18.03.34.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 03:34:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Da8AXuiG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFBsB-0006hs-8T; Mon, 18 Dec 2023 06:33:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBs8-0006e3-Ch
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 06:33:20 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBs2-0003Jr-Qn
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 06:33:20 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40c31f18274so35455605e9.0
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 03:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702899193; x=1703503993; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lh3o7kEui0XF0sV1bPH07EOu1tlpcJ6HGtHE/IUXYQc=;
 b=Da8AXuiG2XQ2Boowp7J+LK4748Kq8FbRbRFCFJHC35L+l8K1LB0Bei4pctT+AFiAxy
 kSRGSh7mr6zthk+i7W8Nx9M6+rAm43yMi7SnaaKcf7hXNdnu0EZoif7DDt1o+QQ7mn4q
 fLAfvz50cumKJmwml1aC9lo5WOGwV7JTDHm5PLXwEN34x9WXX5GCCYHu7nGIuHAPObst
 HMh+Yz2OhM0CnNbmbX0cTLw3rTVgSEp1mv9o7a+k2XHnbkRGzWF3jr+jBmv+2gB285za
 9KKtq+xq90xJcUGszSjKkKuGdDUIsH87Ixg/jTcAhy4WC+e9UMK51WLeMnNLhTJX1CYj
 DBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702899193; x=1703503993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lh3o7kEui0XF0sV1bPH07EOu1tlpcJ6HGtHE/IUXYQc=;
 b=fqpv4KzXoxd+A6/kvhcNSsC1T6UPXwNfz3lsfXaSNcsMAmzHOWSaniYK/tIuD2ju/B
 ABpjDKIgBeRPQtVd8WOAQ9mKBG+hpHWeuFqrgkrIEHbbfUZM4fEAixQm5zLVM2DRtuXw
 +5Ob8UI5gIhHsCOsmspn9T0E/33NsEhPK6hPAlycaQOskHfto77YjHI9uyf4mmBCkYqH
 ZwAhQVsPz0B6E6AHSihM+sSDJqIzBieVMfUQ7KQlAd/tx1OJAY6NZddhYb8fGN2QWEtE
 MHIsYsThVJflIOQYq4JR/ZHLndLb5LAmjDXoLDeNGSrLVw8VDSME5PyixhpkzCZYT2su
 cn5Q==
X-Gm-Message-State: AOJu0YxxcY+Cn9OTbiQ40Bnp749OaTNdzPOmyUK9gS/+T/di7R6nQgzA
 WbWRvwTJZN/dEolq1s2G7PfIugb2acBV0oL2nt0=
X-Received: by 2002:a05:600c:4507:b0:40c:909:42ab with SMTP id
 t7-20020a05600c450700b0040c090942abmr7228640wmo.82.1702899193292; 
 Mon, 18 Dec 2023 03:33:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adff012000000b003366da509ecsm671193wro.85.2023.12.18.03.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 03:33:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 14/35] target/arm: Make NV reads of CurrentEL return EL2
Date: Mon, 18 Dec 2023 11:32:44 +0000
Message-Id: <20231218113305.2511480-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218113305.2511480-1-peter.maydell@linaro.org>
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
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
X-TUID: fLWNUI36Kqx6

FEAT_NV requires that when HCR_EL2.NV is set reads of the CurrentEL
register from EL1 always report EL2 rather than the real EL.
Implement this.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-a64.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index d060e24356d..6bfc39d8ea7 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2240,12 +2240,17 @@ static void handle_sys(DisasContext *s, bool isread,
         }
         return;
     case ARM_CP_CURRENTEL:
-        /* Reads as current EL value from pstate, which is
+    {
+        /*
+         * Reads as current EL value from pstate, which is
          * guaranteed to be constant by the tb flags.
+         * For nested virt we should report EL2.
          */
+        int el = s->nv ? 2 : s->current_el;
         tcg_rt = cpu_reg(s, rt);
-        tcg_gen_movi_i64(tcg_rt, s->current_el << 2);
+        tcg_gen_movi_i64(tcg_rt, el << 2);
         return;
+    }
     case ARM_CP_DC_ZVA:
         /* Writes clear the aligned block of memory which rt points into. */
         if (s->mte_active[0]) {
-- 
2.34.1

