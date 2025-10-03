Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F34CCA471
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:43:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jL2-0006ba-Hc; Fri, 03 Oct 2025 13:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jKI-00053w-Nl
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:12:17 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jJs-0007hJ-F7
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:12:13 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-7811a02316bso1884962b3a.3
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511502; x=1760116302; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UArNSBfDRY0R4yQf7I4KwaZGkKosB9HEkNsmXAhE3vY=;
 b=nvN54+IRbRSuI/Sl/wlHdJF7TAOqWakkQlHGhdS+ecCLlOazY9DOljovnWFuaeUwFy
 y8PvGtlrjFQEmnpZKJ9sEAVLM+8qYpZK+sxSWQW4mDHhcKQWd69hfnYowwTMTw40oXrj
 rEY0Jz9AW/KUsCSARz4ScWn9ZgZ7SBB/z9W9DhJii2ZFCuqa9JvfFLShbG+4zDOOTJXH
 0+ljoUSViGB3o3nwHFf6MJh6b31nNxqQ8nNTXmOthpTYyiCRKnkRr+Wg9FIsz++QTPQq
 i57c8tYGKo4tW691Yb6gQnlAbdmD2LN9/oqRz8BLKPJYVu7A0CdY5IZ6ahaLsirL1LkR
 qW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511502; x=1760116302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UArNSBfDRY0R4yQf7I4KwaZGkKosB9HEkNsmXAhE3vY=;
 b=kRJxvDPxsJkat+ee43ob9A5aEUcjUcbBjpDBcP4Fui4uw/B5kM8yeqO7l1ksvUIbVE
 rhBSHI8VKlwSaN725WyvIUt/ULekeSw9GdhniwW2WvsVTQhdTTwnjz3dpGcRKJlHGe3d
 6I5/EY07FpTS9+nhiZOBSgyj0stUqc42EYWRH3iVje0yYb9L1lZR7bmmmefqAmtNMYL/
 Vos9allqTVch/q2Anr4dWu/0Io7oOWo0fDVRNAI2N2YQ+DXbXyMykyM4/vMMK4HU0wC+
 M6htBNLnBlAt4XwZSRzNoD43BBMvLueFPUpmhHYppiiOBME5dxhQ6r5YiMCq8kjm0+oL
 0y/w==
X-Gm-Message-State: AOJu0YxfwGkb1elOXux6c5ghTVSjn7AHDoNjoEhSAw/+jMR/HqvHWg3b
 WmhVYHQ9K5S0AFxkv9mNZeX7GcW6SSSkXFNButVoB+AysVhJiqJ36V5eTLwu+UIzdoM=
X-Gm-Gg: ASbGncu5NwW5GT1rIsJZijbhqSp7mnDHb3XHfLITBkbOIGf0pJeeCSZriO9zLPvfZjZ
 3IXf7U0VGRXbGCmN0EZHCh1lSBgSurR28KGaQxBOn3XTtUWCGXXKHoEHw7Z1KTrKu9ZseUve5Hd
 ytfgiCyRWY3GgCsFIS+g5LVJY4Tq0qu6Id48fFz/mJrqCz7TXf5SoppnHB3wM+4+RdAMThzdE2w
 2B7sEOHgQYqvd1/YxtUfTkJ7s/sPo3E3O3DaqoETK6UlkymSTdyBxJtpl3CzSm5nMJUA2aLIQft
 JTGDRGr2Y5mov6F1rW2SEgC8KPflXD2w0Z9Z4i6WXZgialEkU2iWfu01aRRfwBS6AsL45RKOVPp
 SECUUiENsU4RQt+ekT08pLfe8ntAJ94qFFS6o6YlTV3guz77FHM5nZHo6SQLZHFvQ7QI=
X-Google-Smtp-Source: AGHT+IFmUdzVlJvyzLPmXSzo2O0GXxtaEBghmUqeIYfw3vpGhpYkJRerYy++NRHyEpXYY0nO3BQxjQ==
X-Received: by 2002:a05:6a00:2e85:b0:772:4319:e7ed with SMTP id
 d2e1a72fcca58-78c98e072camr4814502b3a.29.1759511502171; 
 Fri, 03 Oct 2025 10:11:42 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b02053a51sm5418769b3a.46.2025.10.03.10.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:11:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 45/73] target/arm: Emit v7m LTPSIZE exception out of line
Date: Fri,  3 Oct 2025 10:07:32 -0700
Message-ID: <20251003170800.997167-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 57bc8ea4c5..3df0bbcb7f 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -5598,11 +5598,10 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
 
     if (!a->tp && dc_isar_feature(aa32_mve, s) && fpu_active) {
         /* Need to do a runtime check for LTPSIZE != 4 */
-        DisasLabel skipexc = gen_disas_label(s);
+        TCGLabel *fail = delay_exception(s, EXCP_INVSTATE, syn_uncategorized());
+
         tmp = load_cpu_field(v7m.ltpsize);
-        tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 4, skipexc.label);
-        gen_exception_insn(s, 0, EXCP_INVSTATE, syn_uncategorized());
-        set_disas_label(s, skipexc);
+        tcg_gen_brcondi_i32(TCG_COND_NE, tmp, 4, fail);
     }
 
     if (a->f) {
-- 
2.43.0


