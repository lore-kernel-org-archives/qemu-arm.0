Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp656972lfr;
        Fri, 16 Apr 2021 12:12:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJze5BBDRTc+Z83IcYrGYQEsjjPVDdmXYmSMwa0048e6QOmf6BQboGpbnRUgTZnEnseyn1yr
X-Received: by 2002:a9d:64da:: with SMTP id n26mr4930722otl.340.1618600320964;
        Fri, 16 Apr 2021 12:12:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618600320; cv=none;
        d=google.com; s=arc-20160816;
        b=AJqfQBiwfU+wZzr+FZcESKuAFmovZBMvTIq5mGqjHKLFv4Ai6awsmeLNbE+hfeBSbC
         Wwdibd2YpTRIO8mLzq5NbPVm2qq/gZ8YCj5hj85JdKwwaxpuJXjIzvr82B3l2CHQbJba
         AL7p60agcMTGPEJ8rrqK9jyqp41NnQG+fpcrdtDYC+BIU9VZvp397BkuH608RFx0MYd7
         QnTsmc3xT3m2HaqV3leGrh37FTynyXTXms4DTIIns3w/gmowYAK5ZGUKKCO/3q7J90g2
         /IT6WzSblBQfqQ6OqGYrrv0ErxDremVBNb7+bfe/AsMvYqkoTbGuSv91hGj+iZoAjAQy
         Risw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=DHk5nVHWEzvUPbJqkpxdTXVHC+WlIvNKPTV6ov5dVNQ=;
        b=mPCjY9eNGOFwN/Kld84KAuuFJjeRATHZp0OzfjUJv+1flbKxcFisQonlcSIRV03nlG
         xxMrqwJMrxItAIV6iYqrfV/4qHKG0oiOMUOj+jeUBELynC05UG8Na4tuR/wfHjozF1n3
         NyWsVdWc0pI9TPleZp4SLjHOkXLswyup3mZpS65L/wmslpgQfFcPpxkkyLF6lhHWWJaJ
         yohLBOZ2NAo4Cnc70akZJQyF5JSZMXg3IEmLsnbwWZcdLqpmGccdCpvHy5nfidj9paaA
         7xp0Nx6R7Kx30jmYB17vxAs/xx5oBnMrOi2vILk0z/J3VMtdY0UI2W8GqrrMB1Wvl5T8
         RMzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tVFp49xi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l136si7183157oig.246.2021.04.16.12.12.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 12:12:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tVFp49xi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXTsm-0000W6-99
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 15:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThk-0003n8-P1
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 15:00:36 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:41530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThU-0004LK-43
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 15:00:36 -0400
Received: by mail-pg1-x536.google.com with SMTP id f29so19813409pgm.8
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 12:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DHk5nVHWEzvUPbJqkpxdTXVHC+WlIvNKPTV6ov5dVNQ=;
 b=tVFp49xi/mYyOMV0Pgrbax8MhuVM3A8UD6UCyYg07pTfJmNGXHUmJp7K6j5P41x5NK
 18vL3YVnVj3M7/HEA8ZWcLMYXBVQrxA8tNhMwIjfboX9hZQcmwPxYzR3uzobjAuU8y97
 Bl2MvIZiyPV53SCMB1ojjCrKrkXirQcuo0/UHHd68Kuox6fPJO9L+blkRbzohjO9cKur
 ZA99/WDcrViuxWt4oFI/lE2CWPfhUU1veuAvFEu3MH6CaScxu+38X0rjY10yvaz5WLhT
 agCBjVY9ESfxPbBtFf9X3hvin6rcGBtrzhvGfeX5nL3w1afqe6S4I+2MmUYRo35yuzj7
 5ldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DHk5nVHWEzvUPbJqkpxdTXVHC+WlIvNKPTV6ov5dVNQ=;
 b=fXbeJS0AohaIEcB33iYssygbKvYesHkerJIsp20ja3kXsPksTRxOkwumz9IIQHSNIx
 WD8OzaXo50CijbRVjQYe7WXpUXFy0PK0ZT2tytH3Y4uTU+rOwyhqYNFLOXM3Bkv+k0o3
 QSv/WUMT4Y7+vLFNuGxjjdb8co+N6TSS53hSoYX8LmkzkUqOr0eq/crEgZpWa42GZ36F
 RA6eb6jB3ZL7qYwSoRsMYDl4VzW+qTR4qaEtdPtv1Vcdaxek61M/Vm0LPv74jMi/BzyR
 jWitGXHFK/qNmalqeBCPF2An9y+ZJpLzLkvWnbaB4VChVdMNTLueV14izdJPq+EUdGXW
 eKhQ==
X-Gm-Message-State: AOAM532529i/MUSh3zpHnGowCiTYuDU/LQ2bESFZx4knDapQicYHuzg2
 LGjq/KS8auQn+Uj5AhlZYv0/LA==
X-Received: by 2002:a63:1a48:: with SMTP id a8mr469017pgm.81.1618599614010;
 Fri, 16 Apr 2021 12:00:14 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 14/30] target/arm: Enforce word alignment for LDRD/STRD
Date: Fri, 16 Apr 2021 11:59:43 -0700
Message-Id: <20210416185959.1520974-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
X-TUID: ow1WaHp9bCk+

Buglink: https://bugs.launchpad.net/qemu/+bug/1905356
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7472e98f09..63c665fb4e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6512,13 +6512,13 @@ static bool trans_LDRD_rr(DisasContext *s, arg_ldst_rr *a)
     addr = op_addr_rr_pre(s, a);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     store_reg(s, a->rt, tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     store_reg(s, a->rt + 1, tmp);
 
     /* LDRD w/ base writeback is undefined if the registers overlap.  */
@@ -6541,13 +6541,13 @@ static bool trans_STRD_rr(DisasContext *s, arg_ldst_rr *a)
     addr = op_addr_rr_pre(s, a);
 
     tmp = load_reg(s, a->rt);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = load_reg(s, a->rt + 1);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
 
     op_addr_rr_post(s, a, addr, -4);
@@ -6649,13 +6649,13 @@ static bool op_ldrd_ri(DisasContext *s, arg_ldst_ri *a, int rt2)
     addr = op_addr_ri_pre(s, a);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     store_reg(s, a->rt, tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     store_reg(s, rt2, tmp);
 
     /* LDRD w/ base writeback is undefined if the registers overlap.  */
@@ -6688,13 +6688,13 @@ static bool op_strd_ri(DisasContext *s, arg_ldst_ri *a, int rt2)
     addr = op_addr_ri_pre(s, a);
 
     tmp = load_reg(s, a->rt);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = load_reg(s, rt2);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
 
     op_addr_ri_post(s, a, addr, -4);
-- 
2.25.1

