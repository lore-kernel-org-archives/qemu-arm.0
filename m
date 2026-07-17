Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27614C44516
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Jul 2026 23:27:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wkru0-0001cI-S4; Fri, 17 Jul 2026 19:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wkrty-0001as-Aj
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 19:23:30 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wkrtw-00071s-62
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 19:23:29 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-ca80d708489so1593896a12.1
 for <qemu-arm@nongnu.org>; Fri, 17 Jul 2026 16:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784330607; x=1784935407; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hoKL+T5ZAMVBhG4qjN+wRa38usEFNIxUeO3xCWyHIIM=;
 b=m3IRTIyUUrImJNcPSCcQ8eGPJpHyemnqZ9yDLIrsUyiGFLhLoTVZstCoC8Ox6hQKzi
 ogXtQ5LSYKPsg1d3mGKOUJsBSpu1ys6QwwChau7YdHlVI0ES3IFy9g9gfBRQrQp7QIqh
 b2T9ar5zMiWOS874HvZu9KDvfAytDXuBqgdtFtFWWV64Lap4cO9JR3NJ/UYhRjcdr7S9
 Ci/9n+G3fO/j8D4ImlJJV0pyjErDjBqmXYqSU/fLIWZBw6SCwjoNgcnm0IDtdG/mGAc/
 UnZsqTRcHINVYI1e433V5gWtqShZ59BhZWFsqIp74KpvQV7pBiK3hAQ+sxGuh3db7u/C
 I52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784330607; x=1784935407;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=hoKL+T5ZAMVBhG4qjN+wRa38usEFNIxUeO3xCWyHIIM=;
 b=BDEVPgAi1/0NXupL9x9rJdszoCgW+60+FOjkz39pczWDCYKyCYekDiAd3+iaLkwUHc
 CFv4TFihWRycv8lGHdhk+T0LHDu1X9xfc1/9Bg4wHWSckknigB4tuvy2UKgTDCCDONTC
 roNDY1HhUtojoESZ40qCjQfCL+aJzKTsUsT+htv310ISo3Q2P3bx0cjVFUYpZmqnxYum
 g0taZEQCYeYaaVVpPnMj/sw6rzwF5xSURDBgsqsUMWqOZdD9FdUHZ5Ca6spMkMT32Ab2
 +vNB+AyJ+S+1fKHpKAHkWJLwFwu79WvJbDBhRzxFmGsOWOYGNgvrQoKJ9iLEvnjEZ8Vo
 Aeew==
X-Gm-Message-State: AOJu0YxzOIaRX3Q1OZdRKvWvELjyj8yfhXGsvq1itIGWXoBEsn1NjPK1
 Fh+IR+qFZPFzDXi57WTEPRco0ePK4exg/3r6wTS5LzM2GuQUj/DLvQIhcewmYn/so7s=
X-Gm-Gg: AfdE7clKHWSVa4TjUUgZVa9mtQPYYe07E8JYDQAQTqccmtuYgFuGyoxt0Nrdy/uMral
 e9MDiWRTHWznsHZxm2oE+dqzmndvoogI3T0SM7Sud/pIrWg70MtXZtcimVzTkHIwpTE4IHY+dSt
 uj6WsSdVbVvTnv2AlybnZQgjkF6LKkfkGDAeRjFCw4xF8iru6Zn2jYguvURIUJksxjzc4ctHvdN
 tOvrMXGPvdWddCzIizGfHG9NfCNR3voQO+7juhTobhXWKZcGXonPP2Tyv+4nD8IAxjlJqvcOui6
 c2CtWAHknqiB+wtDlZYntX/bdpgAys4x90Lf2JH9AI6DZkYKNw7bUYz6MUrPNScJpiOAtzrl93y
 F6Kr2qXPmxAKhym6hkbAafaRCzqKeMgiOL70nNL7v+m+Mca/PM9KLabNUIMeguQ8c45+qvScV1i
 Qc9U1VLc8=
X-Received: by 2002:a17:90b:1345:b0:37e:1620:dabc with SMTP id
 98e67ed59e1d1-38e3cfd30a6mr9211116a91.0.1784330606704; 
 Fri, 17 Jul 2026 16:23:26 -0700 (PDT)
Received: from stoup.. ([32.140.233.50]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13ce2a18a47sm8186261c88.8.2026.07.17.16.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 16:23:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 14/17] target/arm: Drop clean_addr_tbi before helper_dc_zva
Date: Fri, 17 Jul 2026 16:23:02 -0700
Message-ID: <20260717232306.378988-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717232306.378988-1-richard.henderson@linaro.org>
References: <20260717232306.378988-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Now that probe_write always handles tagged pointers, we
don't need to handle this during translation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 590c7d8064..24a0cd8345 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -3142,7 +3142,7 @@ static void handle_sys(DisasContext *s, bool isread,
             gen_helper_mte_check_zva(tcg_rt, tcg_env, gen_mtedesc_zva(s),
                                      cpu_reg(s, rt));
         } else {
-            tcg_rt = clean_data_tbi(s, cpu_reg(s, rt));
+            tcg_rt = cpu_reg(s, rt);
         }
         gen_helper_dc_zva(tcg_env, tcg_rt);
         return;
@@ -4763,7 +4763,7 @@ static bool trans_LD_single_repl(DisasContext *s, arg_LD_single_repl *a)
 
 static bool trans_STZGM(DisasContext *s, arg_ldst_tag *a)
 {
-    TCGv_i64 addr, clean_addr, tcg_rt;
+    TCGv_i64 addr, tcg_rt;
 
     if (!dc_isar_feature(aa64_mte, s)) {
         return false;
@@ -4787,9 +4787,8 @@ static bool trans_STZGM(DisasContext *s, arg_ldst_tag *a)
      * The non-tags portion of STZGM is mostly like DC_ZVA,
      * except the alignment happens before the access.
      */
-    clean_addr = clean_data_tbi(s, addr);
-    tcg_gen_andi_i64(clean_addr, clean_addr, -s->dcz_blocksize);
-    gen_helper_dc_zva(tcg_env, clean_addr);
+    tcg_gen_andi_i64(addr, addr, -s->dcz_blocksize);
+    gen_helper_dc_zva(tcg_env, addr);
     return true;
 }
 
-- 
2.43.0


