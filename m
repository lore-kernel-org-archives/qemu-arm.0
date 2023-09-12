Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp2063906ejx;
        Tue, 12 Sep 2023 07:06:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFblfmrYmHYIM2GMjskqXCrD561oM+r1Z4igcuqw5muYLcRxMYacXLFfNG7wrcoVAYyiuyA
X-Received: by 2002:a05:622a:155:b0:412:2510:2c81 with SMTP id v21-20020a05622a015500b0041225102c81mr17526009qtw.63.1694527586521;
        Tue, 12 Sep 2023 07:06:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694527586; cv=none;
        d=google.com; s=arc-20160816;
        b=I1uChehaXX3traUvRJsq5LO+L/LwMUJeuvZ13hYTZauIcdSotQ4U6Gwj7+Hc5XH7OG
         QGE07YH822sqccDKh1S8ggR5l00LwEV7NZYbNn89O4b0YFMrDpsZUwX/xcDlsF75rW6V
         6ILvoZz8aBmUVXsVFhhV4hZfnWo0N+tFqiOqOma6rhbHD11wkNCTJTf0+hVUF/EHgLFM
         R2FCoX7E4Gbl3fnTqo5lC8L9IEqVUloOqE6GVcNb08k1jxNtyg0bHw03ntaPWaUGQWND
         YqPAi/tmDdrNFIA/SmXmwKbgkDl3nSxW7lUTUExxA353MYruRGMjYYnH3IBkoFh9Pxxi
         bMow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=atIAvZgXx4HeuCEPVGi0hJRO3lnJSiWXdbUnoe0XyYk=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=BiUGc+7FMr0M+PZgILLmRCI3MNr5QXZVmFVrKMqA67CXjz678xmrWj7ju1q2lQVuxR
         SjFmakPUCRTnW2tFzhlHQCqjSWir0pK7RHopJ6XVNnifyjqh0+spWO2VzXjnyQmcvXAy
         Sc0vOIogMGgrtAMnUjPN/z03LIsNR27grGNltFDEnhEpHm2UzAPxdmdAi6xFfiqO3cmx
         ombR1j4cY+U5XkITy5LzA/KYKUwS7IZEBa/3rR3fQglE2dMk6nmbgYx1MKQfbJ/e3fQd
         HrkGSS89rve/FDHTMonhY3JXYf3Noc+BgNdAd8WfOh5aAcAN2Zc5WZ0qKu8FL2syTQGZ
         0TkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tcussc/x";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c17-20020a05622a059100b004122e2178desi6292230qtb.695.2023.09.12.07.06.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Sep 2023 07:06:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tcussc/x";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qg40z-0008MT-Kz; Tue, 12 Sep 2023 10:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qg40c-00087F-5G
 for qemu-devel@nongnu.org; Tue, 12 Sep 2023 10:04:54 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qg40O-0003po-W3
 for qemu-devel@nongnu.org; Tue, 12 Sep 2023 10:04:47 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-401d67434daso61013845e9.2
 for <qemu-devel@nongnu.org>; Tue, 12 Sep 2023 07:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694527478; x=1695132278; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=atIAvZgXx4HeuCEPVGi0hJRO3lnJSiWXdbUnoe0XyYk=;
 b=tcussc/xOdjJ4qd1eQJN3EvwQ1SWyF42EIcdO+/0Nv0satndZN/5D8r2d8B1JoYXLN
 UW3joNgAJza6hVNPytvKYrz5WwvZmYy2Tsm2GVxdzUnRcQE3HWv310u5kjReYb/xrfBn
 KtKyheq3TWXuVVfYpOq/NYoc/1OaTpzUEgMzxHKJRb+fjuOc7ZcppMyXISOTKktjanbd
 6Q+F2hbF1sHEABuQp+7Yn8LrPyRx/wph1SpRzv4AfLNBpvJo/8zdB1LVPFl0BM8COVt6
 upNh8dzK+6V6ueR1JmtYIsjyuE8KGetJDygsNaZJIGCFLHVbb/cLEyAtE+GqOrvrABYP
 rZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694527478; x=1695132278;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=atIAvZgXx4HeuCEPVGi0hJRO3lnJSiWXdbUnoe0XyYk=;
 b=pw5BoLNQSwGZp+S/fXQWd1D80VcA1H+jajtgRkV/0GPoNKFe/4sWhvA8/XietYtkkc
 KwkFG0Z+Sp5ZLJ7uKuNsSDzI+UwSnzwGSIz+/Dkl1BaW41oosgR4Xzxs+OBXPLSeW3Cn
 zt8LvS9f6v0SzxnZGUa7916TEbBMxTuxFmZes94pS8zFBSEyWi4OLNVlh3qdSVZS28Pf
 XSLPGc94GDv3OuKXdVKvwzkODQ9cvlyjBGxiIKdUVyk9eXTvVfdOTP98asj321PVVZ/a
 gYBaOkmgG5GGE8a/gnLJW90lpzYzTLsmuE0dBks6bOsOzVKZmOgXE7A/VPIaAGmNQ27J
 +CnQ==
X-Gm-Message-State: AOJu0Ywo6U6cB4uaQWsfCSa8N30MxDNmahTad6lesvr/j5dRNEu99OMk
 Y5KTZmaPcd6BxMDexiXEGzFQmA==
X-Received: by 2002:a5d:4c85:0:b0:31a:d551:c2c0 with SMTP id
 z5-20020a5d4c85000000b0031ad551c2c0mr10117743wrs.57.1694527477876; 
 Tue, 12 Sep 2023 07:04:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a5d4983000000b00317ab75748bsm12892672wrq.49.2023.09.12.07.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 07:04:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 03/12] target/arm: Pass unpriv bool to
 get_a64_user_mem_index()
Date: Tue, 12 Sep 2023 15:04:25 +0100
Message-Id: <20230912140434.1333369-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912140434.1333369-1-peter.maydell@linaro.org>
References: <20230912140434.1333369-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: WCzXbu+W1QT3

In every place that we call the get_a64_user_mem_index() function
we do it like this:
 memidx = a->unpriv ? get_a64_user_mem_index(s) : get_mem_index(s);
Refactor so the caller passes in the bool that says whether they
want the 'unpriv' or 'normal' mem_index rather than having to
do the ?: themselves.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I'm about to add another use of this function which would
otherwise also end up doing this same ?: expression...
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/tcg/translate-a64.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 1dd86edae13..24afd929144 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -105,9 +105,17 @@ void a64_translate_init(void)
 }
 
 /*
- * Return the core mmu_idx to use for A64 "unprivileged load/store" insns
+ * Return the core mmu_idx to use for A64 load/store insns which
+ * have a "unprivileged load/store" variant. Those insns access
+ * EL0 if executed from an EL which has control over EL0 (usually
+ * EL1) but behave like normal loads and stores if executed from
+ * elsewhere (eg EL3).
+ *
+ * @unpriv : true for the unprivileged encoding; false for the
+ *           normal encoding (in which case we will return the same
+ *           thing as get_mem_index().
  */
-static int get_a64_user_mem_index(DisasContext *s)
+static int get_a64_user_mem_index(DisasContext *s, bool unpriv)
 {
     /*
      * If AccType_UNPRIV is not used, the insn uses AccType_NORMAL,
@@ -115,7 +123,7 @@ static int get_a64_user_mem_index(DisasContext *s)
      */
     ARMMMUIdx useridx = s->mmu_idx;
 
-    if (s->unpriv) {
+    if (unpriv && s->unpriv) {
         /*
          * We have pre-computed the condition for AccType_UNPRIV.
          * Therefore we should never get here with a mmu_idx for
@@ -3088,7 +3096,7 @@ static void op_addr_ldst_imm_pre(DisasContext *s, arg_ldst_imm *a,
     if (!a->p) {
         tcg_gen_addi_i64(*dirty_addr, *dirty_addr, offset);
     }
-    memidx = a->unpriv ? get_a64_user_mem_index(s) : get_mem_index(s);
+    memidx = get_a64_user_mem_index(s, a->unpriv);
     *clean_addr = gen_mte_check1_mmuidx(s, *dirty_addr, is_store,
                                         a->w || a->rn != 31,
                                         mop, a->unpriv, memidx);
@@ -3109,7 +3117,7 @@ static bool trans_STR_i(DisasContext *s, arg_ldst_imm *a)
 {
     bool iss_sf, iss_valid = !a->w;
     TCGv_i64 clean_addr, dirty_addr, tcg_rt;
-    int memidx = a->unpriv ? get_a64_user_mem_index(s) : get_mem_index(s);
+    int memidx = get_a64_user_mem_index(s, a->unpriv);
     MemOp mop = finalize_memop(s, a->sz + a->sign * MO_SIGN);
 
     op_addr_ldst_imm_pre(s, a, &clean_addr, &dirty_addr, a->imm, true, mop);
@@ -3127,7 +3135,7 @@ static bool trans_LDR_i(DisasContext *s, arg_ldst_imm *a)
 {
     bool iss_sf, iss_valid = !a->w;
     TCGv_i64 clean_addr, dirty_addr, tcg_rt;
-    int memidx = a->unpriv ? get_a64_user_mem_index(s) : get_mem_index(s);
+    int memidx = get_a64_user_mem_index(s, a->unpriv);
     MemOp mop = finalize_memop(s, a->sz + a->sign * MO_SIGN);
 
     op_addr_ldst_imm_pre(s, a, &clean_addr, &dirty_addr, a->imm, false, mop);
-- 
2.34.1

