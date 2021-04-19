Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1518527lfb;
        Mon, 19 Apr 2021 14:18:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuFSnN56dbXItNFWmt50UcVST/fnyAbLlMRGWgAHseD0ZsraV61rOnch/bUT8fMX4+/6Vd
X-Received: by 2002:a5e:8717:: with SMTP id y23mr15562394ioj.111.1618867095454;
        Mon, 19 Apr 2021 14:18:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618867095; cv=none;
        d=google.com; s=arc-20160816;
        b=fFfIG7XyXXMGe3Rz6ghiHBdi7vP5P2aohWz6+irTfBo5+LKskjtUUpAtoXfdlb0mYF
         hINHrPXfTTmb2OAEg+kkV1B1ikhJGjqlSU3/7cHfajryQFQ+RQoP26JM5whzBKKll+dv
         I2u5tvRHNZZahMuSsI5jEOvy2BnCqdgXvnZQEsWVBMAeyS0nXQFnOD6+0N4Do8yoxL57
         nF0q4EUooB4yeAqZCtGWmswJlUsDYewMiYwh9MeKj10VL15Zn0rAWBlXHIwri61WodXe
         3CX0MzZBFQTNdClSi5PlXct3pRs9rvqAU8a/DLs01hUvmqr5yXJOXcNxOtiIfrIHhvKO
         4e1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=zsvdYXq6ehB6Yi/U879OLLmvPBBL5YJ5lhH9C+FI0w0=;
        b=NLL3+BwjXAwvfocA3vdVmAcwse7BbU4uk+Sbmuc+lTnbEETeOcM9pR0iSa399HJg65
         wPlmujj3XFyNyz9Ex4DWaFGEG1CVqP3COP08doe0pAZdZico5i0nGGMKrrp5nlly604L
         gSunLdb355VC4/1T1y1RAV8g4OQE3+cuo/2NwFR8pv2xI0VYAVoM6GHTG3e+SSdNQ9R0
         b1ZJyaV+i09hmnPheBZhci3C3UnD7666VdDw4nuO68d2ZxgAVM+x6cuEVo5Ww1wONdVQ
         +VGYpbFUnNrcYL5WBmvEyefyNJBHls1QMKuM18nnHgKU1yC7Gg/1n0QWyHR5KECJPfV2
         KDOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VgSQCETw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13si13320744ild.132.2021.04.19.14.18.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 14:18:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VgSQCETw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYbHa-0003gR-RC
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 17:18:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaR2-00088T-9D
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 16:23:56 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:38768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaR0-0002pJ-JE
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 16:23:56 -0400
Received: by mail-qk1-x732.google.com with SMTP id s5so28409196qkj.5
 for <qemu-arm@nongnu.org>; Mon, 19 Apr 2021 13:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zsvdYXq6ehB6Yi/U879OLLmvPBBL5YJ5lhH9C+FI0w0=;
 b=VgSQCETwH1hPhJrsiqoBUf834UQ4mGnh3h8me3d+Y3CM/3XekpbRiX2i3/QBHENlAN
 NVXKjpRO/SBpEFFk/2e+sUji0hbNnWwM649Rig7oqXURNW5EhYOXUSCywWDpsarQFsyJ
 /Dxs5cLw3NG+hWY+W/Jc+7LY0xlLFIm35DeMh4CoiBKysRCGk8PFF5LRx8zCSR3URSpb
 tFu+mT3bSnmRKpG7rPzG4tLYFFhPlb7AsS/SMI6FairLFhueHC3S95yrlQ+jR4HoXiJ7
 tV8G3FPAtWeSsfVRWy8Gxhf1y+HnZ0s0jnjk4KavLwDW5sqrei5GH+0J7KklnxsZ2gLV
 kMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zsvdYXq6ehB6Yi/U879OLLmvPBBL5YJ5lhH9C+FI0w0=;
 b=KbxNexMAFmaP7J1blI2aPVrQfm3f5U2a10GtkG7ZnctFLffHp+HqOEDaIyH+N+bggI
 czHWU4URN0XIZO84+VtCiTfmPmPXlWUKHNgk79A2SzBdDYNTIVKTnbGN2gR8wVN30fcE
 cSMMZtqGGGMj+R+GOoG1kz4RO3NcXI/U9ZpEPOozGCZxLPIvcRHTtq+qw1n5L2JLkCGz
 NXf07g8JBIIFh1PoyJa63xcr4ZGnnHaAE2RvVZrHlxtKAgCblyhGCzBgnOsldxDMOP1e
 Ngt2cnU8jBZjbCAIkYFUTeu/cd8k7p7Duk2/HFZ5dMcwh/WB8a1F4LFxgOz2kauZ86i7
 hZNg==
X-Gm-Message-State: AOAM531p5yZ5StkIXhMBWrQzxUUN7Rnzf4aNmjpDclgW/qlgGQ6qFzp6
 WxVP+81rOF4XvCe700NMczt8Dg==
X-Received: by 2002:a37:9607:: with SMTP id y7mr14026801qkd.25.1618863833808; 
 Mon, 19 Apr 2021 13:23:53 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 30/31] target/arm: Enforce alignment for aa64 vector
 LDn/STn (single)
Date: Mon, 19 Apr 2021 13:22:56 -0700
Message-Id: <20210419202257.161730-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6awhRN1DC5FW

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2a82dbbd6d..95897e63af 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3815,6 +3815,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
     int index = is_q << 3 | S << 2 | size;
     int xs, total;
     TCGv_i64 clean_addr, tcg_rn, tcg_ebytes;
+    MemOp mop;
 
     if (extract32(insn, 31, 1)) {
         unallocated_encoding(s);
@@ -3876,6 +3877,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
 
     clean_addr = gen_mte_checkN(s, tcg_rn, !is_load, is_postidx || rn != 31,
                                 total);
+    mop = finalize_memop(s, scale);
 
     tcg_ebytes = tcg_const_i64(1 << scale);
     for (xs = 0; xs < selem; xs++) {
@@ -3883,8 +3885,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
             /* Load and replicate to all elements */
             TCGv_i64 tcg_tmp = tcg_temp_new_i64();
 
-            tcg_gen_qemu_ld_i64(tcg_tmp, clean_addr,
-                                get_mem_index(s), s->be_data + scale);
+            tcg_gen_qemu_ld_i64(tcg_tmp, clean_addr, get_mem_index(s), mop);
             tcg_gen_gvec_dup_i64(scale, vec_full_reg_offset(s, rt),
                                  (is_q + 1) * 8, vec_full_reg_size(s),
                                  tcg_tmp);
@@ -3892,9 +3893,9 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
         } else {
             /* Load/store one element per register */
             if (is_load) {
-                do_vec_ld(s, rt, index, clean_addr, scale | s->be_data);
+                do_vec_ld(s, rt, index, clean_addr, mop);
             } else {
-                do_vec_st(s, rt, index, clean_addr, scale | s->be_data);
+                do_vec_st(s, rt, index, clean_addr, mop);
             }
         }
         tcg_gen_add_i64(clean_addr, clean_addr, tcg_ebytes);
-- 
2.25.1

