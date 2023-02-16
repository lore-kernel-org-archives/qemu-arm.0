Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp78170ejb;
        Wed, 15 Feb 2023 19:09:34 -0800 (PST)
X-Google-Smtp-Source: AK7set88Cs5ozpWKzQUs8s/nYytIpS+djGqBIf51DbRibTVPBTEPMKZ6OyhTBK0kZDTIhH6Mpy//
X-Received: by 2002:a05:622a:13d3:b0:3bd:89d:224d with SMTP id p19-20020a05622a13d300b003bd089d224dmr2268086qtk.3.1676516974616;
        Wed, 15 Feb 2023 19:09:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676516974; cv=none;
        d=google.com; s=arc-20160816;
        b=SxZTxOoV6MB+B+Voi4APA2P/BnRv1FYLUt9TNfiDN0ZyOTXN9++7KwxjnzycjZQePY
         SuLy9DW/2SAXL5fj/aZbSeqWlssw7o6Ufqkhy6nBx3akHQ8Ukqs0XrTWmr9W7Jd5Nmr7
         6Zbx0l3Rq7VSLRC1MeqM84t0fBsuEiLkHwjXuylZw5/GvDtCUxGnbF4ulC9bXSCuLp1a
         6vLcDfADzvH6HnMZvnSeJLBHLQGgLgKB5qD/Sa9MpNpvuKct77HtIyaIRd1qVRwPfZkO
         eY/I4mKHMzL+2JNbfOqRWODxWPwQkiHe4p47BFjlWr1UY6YHd8igFbijsm3abiR08mmK
         cKOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DmwtowJSaitTccWLoWYueof39S9NQxf7bK1L9fJ0J9g=;
        b=Xit1ysp72AxtoBOQDhJK52j4/voPVChnN5tDXVmZe8DuLuzlA+PyMdo56jhI4LlS11
         CTTg45lhJiNVr7EtAnSoFjBjvo9K4Za8BUml4ym5Cn0T7fXRZUG+WZ2jGhvl7QbXjlE6
         bgp+XaQZCn120vWZgcid3YiCpKB14/RmIFLsD8wAwS++DQf3h83Oes9GCS03v0WOFYxm
         Zb4H3HNyG7NXQxTHf87rC/a4GDxBJVbM7gw/pYO5H1fenMWPX//zzS+uUHcQ0rgYhdmS
         uO5aPjRc7g0PUr4xYPgrqL1Pojd3Xo22bAR8izuWrfqy4zsKm+EDCsV5WcUAOEHf4GE8
         jviQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=itDVOOib;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k12-20020a05622a03cc00b003b9c0078d2bsi494609qtx.564.2023.02.15.19.09.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Feb 2023 19:09:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=itDVOOib;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUdw-0007Hz-Er; Wed, 15 Feb 2023 22:09:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUdt-0007H8-CW
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:05 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUdr-00005q-Md
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:05 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 v6-20020a17090ad58600b00229eec90a7fso5197911pju.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 19:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DmwtowJSaitTccWLoWYueof39S9NQxf7bK1L9fJ0J9g=;
 b=itDVOOib8sQbDGGMUBPA8KrlnXmwQ5kMJMGYtuAQx+GXYwgCZuGTrU1p6jzn8I06fX
 aKQtr5wAVGn3q/y2sca4xgJfxIhWQShVos2x7qe9aAkfi8L2DwNCwzoWNbzoR2beK+9u
 8BESgJSO6d7qIyKXOx6YjWkONmekzUWB7DEURkIlZMbOvX/+YeJJggdv7WryQ7M0mFRg
 I2w229Ct0cQ47pPEdR7fbtzvLIZNLAOkKDn1erYaQuNATLRAprCwGGMEZNoaNjY+aaf9
 +qRkId8WQkKSxclGaNCgv6hxpkXTjGLwlw39fnYIh7oqU3jsAxri1KeiGnTOQoCcHhNz
 dYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DmwtowJSaitTccWLoWYueof39S9NQxf7bK1L9fJ0J9g=;
 b=jlqxXcfII3ZQ/H60/O1x5QjGaEOJxa/79/YyWPAYS/UnJptQs4ntrGpMqsh9MC/QeX
 FwzHmfrQFxs38T6VGAW7bNwVzxyx9gBrgLsO3oe2ZjuJQN368/hc1nOL/plSpikfk/5a
 qxZts/Y8TIIKFfSZuh2dJpwnKAl3KnVSoW521+9smYXUg2bHdXJNBFMOLyLO+ZHG2bct
 TJYBI4AZ9r9mq3J/yOpKmW+tAYBPvpITgd6/B+7Ghf+oz2L2q6af/Zdm4nFWh1IYXUmZ
 tDGpJp/r4MYYMWfAkNW63WLOwHUi8jxDvRXeFK0uTlzdrTLC4TSDBM/xo0IQt1IFQHj2
 06AQ==
X-Gm-Message-State: AO0yUKWV7QjcfxjRC4eVcIEgK9Z6qlB2WJ3A675t1paALyjesTERiz3O
 JYmrdO5Ta/22cGXnCQJS1zRwMLNoLZvSh9aV7gM=
X-Received: by 2002:a05:6a21:6d9f:b0:c7:1fff:fab7 with SMTP id
 wl31-20020a056a216d9f00b000c71ffffab7mr729187pzb.54.1676516942243; 
 Wed, 15 Feb 2023 19:09:02 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 i25-20020aa79099000000b005810a54fdefsm79051pfa.114.2023.02.15.19.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 19:09:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v1 03/19] target/arm: Use tcg_gen_qemu_{st,
 ld}_i128 for do_fp_{st, ld}
Date: Wed, 15 Feb 2023 17:08:38 -1000
Message-Id: <20230216030854.1212208-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216030854.1212208-1-richard.henderson@linaro.org>
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: LZVcPae8Oz1h

While we don't require 16-byte atomicity here, using a single
larger operation simplifies the code.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 38 ++++++++++++++------------------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d7d4b68328..edf92a728f 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -965,25 +965,20 @@ static void do_fp_st(DisasContext *s, int srcidx, TCGv_i64 tcg_addr, int size)
 
     tcg_gen_ld_i64(tmplo, cpu_env, fp_reg_offset(s, srcidx, MO_64));
 
-    if (size < 4) {
+    if (size < MO_128) {
         mop = finalize_memop(s, size);
         tcg_gen_qemu_st_i64(tmplo, tcg_addr, get_mem_index(s), mop);
     } else {
-        bool be = s->be_data == MO_BE;
-        TCGv_i64 tcg_hiaddr = tcg_temp_new_i64();
         TCGv_i64 tmphi = tcg_temp_new_i64();
+        TCGv_i128 t16 = tcg_temp_new_i128();
 
         tcg_gen_ld_i64(tmphi, cpu_env, fp_reg_hi_offset(s, srcidx));
-
-        mop = s->be_data | MO_UQ;
-        tcg_gen_qemu_st_i64(be ? tmphi : tmplo, tcg_addr, get_mem_index(s),
-                            mop | (s->align_mem ? MO_ALIGN_16 : 0));
-        tcg_gen_addi_i64(tcg_hiaddr, tcg_addr, 8);
-        tcg_gen_qemu_st_i64(be ? tmplo : tmphi, tcg_hiaddr,
-                            get_mem_index(s), mop);
-
-        tcg_temp_free_i64(tcg_hiaddr);
+        tcg_gen_concat_i64_i128(t16, tmplo, tmphi);
         tcg_temp_free_i64(tmphi);
+
+        mop = finalize_memop(s, size);
+        tcg_gen_qemu_st_i128(t16, tcg_addr, get_mem_index(s), mop);
+        tcg_temp_free_i128(t16);
     }
 
     tcg_temp_free_i64(tmplo);
@@ -999,23 +994,18 @@ static void do_fp_ld(DisasContext *s, int destidx, TCGv_i64 tcg_addr, int size)
     TCGv_i64 tmphi = NULL;
     MemOp mop;
 
-    if (size < 4) {
+    if (size < MO_128) {
         mop = finalize_memop(s, size);
         tcg_gen_qemu_ld_i64(tmplo, tcg_addr, get_mem_index(s), mop);
     } else {
-        bool be = s->be_data == MO_BE;
-        TCGv_i64 tcg_hiaddr;
+        TCGv_i128 t16 = tcg_temp_new_i128();
+
+        mop = finalize_memop(s, size);
+        tcg_gen_qemu_ld_i128(t16, tcg_addr, get_mem_index(s), mop);
 
         tmphi = tcg_temp_new_i64();
-        tcg_hiaddr = tcg_temp_new_i64();
-
-        mop = s->be_data | MO_UQ;
-        tcg_gen_qemu_ld_i64(be ? tmphi : tmplo, tcg_addr, get_mem_index(s),
-                            mop | (s->align_mem ? MO_ALIGN_16 : 0));
-        tcg_gen_addi_i64(tcg_hiaddr, tcg_addr, 8);
-        tcg_gen_qemu_ld_i64(be ? tmplo : tmphi, tcg_hiaddr,
-                            get_mem_index(s), mop);
-        tcg_temp_free_i64(tcg_hiaddr);
+        tcg_gen_extr_i128_i64(tmplo, tmphi, t16);
+        tcg_temp_free_i128(t16);
     }
 
     tcg_gen_st_i64(tmplo, cpu_env, fp_reg_offset(s, destidx, MO_64));
-- 
2.34.1

