Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2811852ejb;
        Mon, 20 Feb 2023 18:21:27 -0800 (PST)
X-Google-Smtp-Source: AK7set8XWarPeiFmO7h61HeehSY+BUm6I4hYDyU5AVx+6vKdPauKq33Art/FRPIsoxezRH8MgOOg
X-Received: by 2002:a05:622a:2cd:b0:3b6:30ea:e95 with SMTP id a13-20020a05622a02cd00b003b630ea0e95mr18105727qtx.18.1676946086987;
        Mon, 20 Feb 2023 18:21:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676946086; cv=none;
        d=google.com; s=arc-20160816;
        b=Ga433OQNRD6cm3sivk4T25AJfOO5aARRo7ZEODnQOeJ204dmwrIU4MMw2bUTU11CuY
         98a2Ja5WM0JwvLOGiK8kbSobapet55SDFi/xNF7Lm8yUE6klHB93A/UuZRa4ZW+QDmrw
         sxnCjA243xxX/OKVkGY1TCzbB4q1rYAg4rSW+NCI1KtsRqQUQkUiyHiZV91NDCGriEw8
         +QmqpB0ILgbJbxhFIElsBcGU0PFHH8ruA4RgE7qONV6TNc0AdeIdpFQ143/UYPuOxNh+
         l8os4PtsO7wVR+3ygjVIOr+xUO5WgRPSRL66McZwBzcwJqrH0QOKBSNcHsP7130+LS5D
         zeQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KtfS729W8SNygqiwUg2I8CHVdzajfLrBoTMYCRIqeSU=;
        b=e71sdbmvJ5mnOunRr/82bB7TKFgmu8rjL+fIuJrjoGtXfOq1sY1F4HFbWpV5y1R8C1
         k0IKW/R2qIcyNCbn9tvwEBukDhzLUQrcJrjj5XOCyZAwpOjfMZKMvKjxuxbKU/6+cfYs
         0PPOy8wgoRzLCBdIzwZUO5b1qzLQLQq56c6TDPcngGTh3ba2RYXXqF2Vg+Zj3dBI53tO
         GQCh2exY5DlkE9otDcF6tRS3DihqrN/aGfS+l6goNnkDfXhEvFGKwtNyaJ5Eo1NfTDfi
         qwCWJbashDFKj5xzZ+9HjhKZxED2KaNEnRPwiAmMFY468vNBKkd26DWNjGf71VTzhuIr
         Qf5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GgcWGFyF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i6-20020ac85e46000000b003ba283ac662si11270568qtx.438.2023.02.20.18.21.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 18:21:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GgcWGFyF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUIGG-0001ct-3P; Mon, 20 Feb 2023 21:20:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIGE-0001cI-IT
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 21:20:06 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIGC-00080h-Te
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 21:20:06 -0500
Received: by mail-pj1-x102e.google.com with SMTP id o16so3252483pjp.3
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 18:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KtfS729W8SNygqiwUg2I8CHVdzajfLrBoTMYCRIqeSU=;
 b=GgcWGFyFYNckp3//qU1LAPMmRRlabLwlK6qCYJZOcIQCY0iVDimhnsZRh2K9KRwSIL
 7u8RSx5LvApsE7aptca1e33092HscbxcYpTlPzfjt/8crr6qt1aiIeU/P6FG1Uai8CV/
 B0PWaGT14b9MCvRRfjsUoRVgVY3Ks3xOn2Npd7i92gS/T1yUEpLACxm+1twh7leOtL3L
 OzlCw/Et5dpGIt3sQvfLHRNtq9IdhW8ULWp0Wi5sMl7wRcdU5UzJClp26KsKHZA/u+Ym
 mGv+SrCiXZcFwRrT/P+WfIlTX3V9RNeM3c7Th30netTZx5UVuJ25b9Hb+HKG/Xc/t/m1
 k/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KtfS729W8SNygqiwUg2I8CHVdzajfLrBoTMYCRIqeSU=;
 b=7csJgO9rHsVnGeQBWnzM+q3bVH/Pu+I13T8yxoG3iieyU+jcF7jGAHXy3P6xzY5wjs
 OnM63Q0A+fIi9nmVVGVJw0kZF5/O4oYsZfQvTzcG/8ttvLP0T5OwDbO//XzJVI6iDyPq
 bmmvEHOr0f40m7d4oMkAkmd1I7kElEVqg/AG+Bkdn6gVsy8CTdh7YohUl5EZlCIyRMJA
 1RoHRaEHdNuJk2oPQ9nenjxHD14hAcitnTjG9miti8yLV+OYugKOUTi9g7IT25cinSUD
 9R/uYovKSYCK5qcRDT0JMgEBWVsvN+FL7mkagV56DCnRktmxyXSkiTrrpjiZ6NU0CZZp
 ErgQ==
X-Gm-Message-State: AO0yUKUJj/3lw2ZUJooD4W/Qs/ywYffu6tpeYaSLt90fdu2QLaMWNDUP
 Fq6nz5NCmE4+NpNYc3aNhU5y1FRVIK13tHuq6Sc=
X-Received: by 2002:a17:902:fa87:b0:196:7664:39c with SMTP id
 lc7-20020a170902fa8700b001967664039cmr3364688plb.31.1676946004117; 
 Mon, 20 Feb 2023 18:20:04 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a170902e98300b0019141c79b1dsm8559328plb.254.2023.02.20.18.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 18:20:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Fabiano Rosas <farosas@suse.de>
Subject: [PATCH v2 06/14] target/arm: Hoist pred_width in
 arm_gen_dynamic_svereg_xml
Date: Mon, 20 Feb 2023 16:19:43 -1000
Message-Id: <20230221021951.453601-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221021951.453601-1-richard.henderson@linaro.org>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: TDcRFOpSKBt7

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub64.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 070ba20d99..895e19f084 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -283,6 +283,7 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
     GString *s = g_string_new(NULL);
     DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
     int reg_width = cpu->sve_max_vq * 128;
+    int pred_width = cpu->sve_max_vq * 16;
     int base_reg = orig_base_reg;
     int i;
 
@@ -319,13 +320,13 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
         g_string_append_printf(s,
                                "<reg name=\"p%d\" bitsize=\"%d\""
                                " regnum=\"%d\" type=\"svep\"/>",
-                               i, cpu->sve_max_vq * 16, base_reg++);
+                               i, pred_width, base_reg++);
     }
     g_string_append_printf(s,
                            "<reg name=\"ffr\" bitsize=\"%d\""
                            " regnum=\"%d\" group=\"vector\""
                            " type=\"svep\"/>",
-                           cpu->sve_max_vq * 16, base_reg++);
+                           pred_width, base_reg++);
 
     /* Define the vector length pseudo-register. */
     g_string_append_printf(s,
-- 
2.34.1

