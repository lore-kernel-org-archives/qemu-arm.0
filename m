Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4294761ejc;
        Sun, 26 Feb 2023 21:38:47 -0800 (PST)
X-Google-Smtp-Source: AK7set+isbunkTgWU6x+p58nBEykSgmxTkVx3LDbH8iOgkVjPxy9dRZxWSmZKZcWvTNGHOBRj4Aa
X-Received: by 2002:a05:6214:c22:b0:56e:a06f:d1d2 with SMTP id a2-20020a0562140c2200b0056ea06fd1d2mr42257607qvd.30.1677476327663;
        Sun, 26 Feb 2023 21:38:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677476327; cv=none;
        d=google.com; s=arc-20160816;
        b=Gxd+THiLJDmnyRTZQxcjwMPBYsiZXwRpyvR23nBE/pXLqfDuiORSI4Ov8UfKWxVupF
         cnuPhPJ4eyPQviCSpjQfuoT9uqDcTtEHmifEScl4Y4IWDfEsK8Kvh4iAKtzZTNOXtuMb
         B6WLquSB2fkpW5e51E6iyBagVrrxJDVx7PJGrol32A5LN6gjcKYkc5sCVd1Xd4I4+cKC
         3k1EZo42sFfNxe6QIKz39NwrnQI/c3KAbZrtP5nyaJDmpwFEr3AFt1U6hcKFMTF8wYTz
         S293kyb5npA0W8ZSGiFfEyUbuzdrDRGe0iTwoa1xX2ki5J/Mqdo0Q2TMkI9dqBwM8/Wp
         WXSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=agy/u0GMKA+XJZ7eZrr4m/SwvDijeZedhgSDznlTFuI=;
        b=Yr+KbrWCgTqLsfiRDI9y3BIX2467C9OwwRiCbrUoAyYgFohRUQgMqgpj/HKxzssK65
         zxjGiugOOIjDh78ZrYy9KuGYRNZcr4Rjz6F44uSTWEXBI8rD5Bx5rF0mf7AsGaIkZv6j
         eYC/i+Rjd2yrfzBm4xstYdtWYriun713XB9gqRfQIZQ1UNE35dUWhEwETn6DHkeJiqMm
         1BKu2/q3TItuOn0qRjxWznna0sz0NJyDgv6HNYuMxPgJ1gESn8ha2SpTQvnHyA1GRIFM
         T+IfuGaHhhEpIcu2QNDUGNrrCwSAELegqJWLlkyz9DZkxcaEZc5H0CGPe/PC3V/8kntu
         LXgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fuzeETEE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w20-20020a0cdf94000000b0056bf1e3aaf6si5674456qvl.544.2023.02.26.21.38.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:38:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fuzeETEE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWW8B-0004cv-Ie; Mon, 27 Feb 2023 00:32:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6q-0008S4-RB
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:31:38 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6l-0000eC-Ta
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:31:36 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so8847492pjb.3
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=agy/u0GMKA+XJZ7eZrr4m/SwvDijeZedhgSDznlTFuI=;
 b=fuzeETEEiQNzPI/I3KBVJ2gdT9a3y7Fyf1C1b8rQsWfmz46+tqtnXPdBMD9rBztO0s
 qW5KJLjvnr2Ym7HGWF51s1XPMnN0sybTDOC7v86zLOcZnZrVGvZ4952exU3Lz2vQL6bn
 BkcfMO5q/XS6qM5lxvLovvw8YYiX6GQARJ/i85DvFDsBjVX6K7ZPQdMWix015b+JZnZX
 52sVGZpBAPvNnjPfMVan4GlQq1DSEWBOdVU61rrkUAxYesEp1MGu0vN5GYurR9AsiWZZ
 de5dD/u2/QGVHGlZRiHTh/+nUUbrSvM+z0STomXVGS9AMOufo7t+VCMCXUfV6J8CICnG
 9X7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=agy/u0GMKA+XJZ7eZrr4m/SwvDijeZedhgSDznlTFuI=;
 b=AKV8HcBidu5CFNSuokN7p4vosaJvKV2l9EmeJ3WdxpeLruAS5tYz1dYIfai8uyuxfR
 YbBDIv9lOkLpN+GmcZ4jQJelSj/Em+cQbvxXaIwsTo59R1+gak2/oC6WJAPifh6DVDjU
 Fk4x5S/8mw5i4//rkx2tG2Hrtu9HhYuyx9NBZbtaHJkgWXQEwFCEy7IwelkyqrmXkeaL
 A+e/qyLdteW4BxkUP3f8UneIj3RQ3quMsI+nhJD/7VjsPQnwQ9TkYZ/eQK4PEkrBsNgb
 OE4Z9XxoicpbssuGiBdB/6AgyH84nHL3YPGw6V+cm2FEhbngJ3G2+aJXq8o6GuiYQ4l0
 dY9g==
X-Gm-Message-State: AO0yUKXPbofXncXHndbeJMd0ZFWKMhSBNF9yv0sXx8QcNi7LOVF5S9D5
 jqHPFrc4UlMTIp9q0P4QyiWUe4zKHU+EYi/Vbjk=
X-Received: by 2002:a17:90b:180c:b0:237:d867:222c with SMTP id
 lw12-20020a17090b180c00b00237d867222cmr5447629pjb.42.1677475890878; 
 Sun, 26 Feb 2023 21:31:30 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:31:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 71/76] target/xtensa: Drop reset_sar_tracker
Date: Sun, 26 Feb 2023 19:25:00 -1000
Message-Id: <20230227052505.352889-72-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZaiGYDoLJY3Q

Translators are no longer required to free tcg temporaries.
Remove sar_m32_allocated, as sar_m32 non-null is equivalent.

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 4af0650deb..910350dec6 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -57,7 +57,6 @@ struct DisasContext {
 
     bool sar_5bit;
     bool sar_m32_5bit;
-    bool sar_m32_allocated;
     TCGv_i32 sar_m32;
 
     unsigned window;
@@ -284,14 +283,7 @@ static void init_sar_tracker(DisasContext *dc)
 {
     dc->sar_5bit = false;
     dc->sar_m32_5bit = false;
-    dc->sar_m32_allocated = false;
-}
-
-static void reset_sar_tracker(DisasContext *dc)
-{
-    if (dc->sar_m32_allocated) {
-        tcg_temp_free(dc->sar_m32);
-    }
+    dc->sar_m32 = NULL;
 }
 
 static void gen_right_shift_sar(DisasContext *dc, TCGv_i32 sa)
@@ -306,9 +298,8 @@ static void gen_right_shift_sar(DisasContext *dc, TCGv_i32 sa)
 
 static void gen_left_shift_sar(DisasContext *dc, TCGv_i32 sa)
 {
-    if (!dc->sar_m32_allocated) {
+    if (!dc->sar_m32) {
         dc->sar_m32 = tcg_temp_new_i32();
-        dc->sar_m32_allocated = true;
     }
     tcg_gen_andi_i32(dc->sar_m32, sa, 0x1f);
     tcg_gen_sub_i32(cpu_SR[SAR], tcg_constant_i32(32), dc->sar_m32);
@@ -1247,7 +1238,6 @@ static void xtensa_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-    reset_sar_tracker(dc);
     if (dc->icount) {
         tcg_temp_free(dc->next_icount);
     }
-- 
2.34.1

