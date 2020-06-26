Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp54587lfm;
        Thu, 25 Jun 2020 20:45:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXMZHbf3mtXcrckl8uIpDreXs8hpZUFAvU7VpYINkarWkxF6F1eBPssYIySByCglRjSH9F
X-Received: by 2002:a25:3bd8:: with SMTP id i207mr1698758yba.167.1593143147187;
        Thu, 25 Jun 2020 20:45:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593143147; cv=none;
        d=google.com; s=arc-20160816;
        b=nHJVdFglKzMM92Ey/bnB6cwRCjuH+HptnmJ1/TaWBO7sv1677k73tIIRDcd+Qt1mTM
         0Eild11EeDzCbZHA98sJ1W6bRnzEI2F3rnSU988TSi+x0/8MRYIDRrcOGdquFLrjRVk0
         01FHXDKfiWOKOZeKvaxqOYhA9A4MjFLNdbuf1fkVmVZpk5zq78bYeGa82us+tU9Dd6+b
         hreN+RHl7R0fVFmw5+KKlX3M5wm77nRnjp57nUIw3vazLfz7yaaD1ZPhZ4pFWkQ9mzoY
         u82vLJhtUJSPiZ71ImoaEhsKyF47uClBV3CjSXz5JdX9LOrg0IFnjyXvExiPB2zL4u8f
         4Y4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gdhM/fFQlCDkWJ3p0yp6CzsLc3mxWtAVqna6+gIgrh4=;
        b=Q/vEadmys/Il6Md32e3hUVcFn9qnzckoRguJdCI9grscWGU287WCTVQ0S4zZBtmamV
         /gCzpREDMlB2NoOAuftYdhuPP6sA2EFyFr3KzsWh9ciSSM96l5ZHoIkk19/qgJNovP8m
         WWJNvlkjKwtAK6V2jxKwIX4ejLG3wqspeHvniDnhImsFucXeD49C1JxiZBEkuTk+BJb5
         Dy4BcYMB0TG7L+ZfClEnxWLCbgANJzlcaDOoIL9XyYCd1/5TEVS2nBYRoslbSZhuZqLX
         Thm2e6kLULS3XY3u+ogMnTJCU3vkcI9sneXL1Hh59dKJyhOC+ICAkLTnJW64CxPL2pUS
         yQrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lW6p9aiS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o2si22527304ybq.107.2020.06.25.20.45.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 20:45:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lW6p9aiS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jofJC-0000RT-Fo
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 23:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof6K-0000ee-DX
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:28 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:53738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof6I-00020B-HJ
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:28 -0400
Received: by mail-pj1-x1044.google.com with SMTP id q90so3616711pjh.3
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 20:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gdhM/fFQlCDkWJ3p0yp6CzsLc3mxWtAVqna6+gIgrh4=;
 b=lW6p9aiSCCB7RSvsyj18TqOadRDFT1YtTpTsLg8r5ue+CQyww1nVGTgpFObj8VeWri
 F1vCKTjM6pfgeb4zvswkqBw+ZFuRSciUt/4ZY23Esj8HVqyd+TSDWGLdM/yszpJEKqG7
 M48kIuQ+5IPrr3HfkhBldqI7/1IL04Rsh9SiE3d7HXzfm/OtBLh97gQUMgcd+rtHFTw7
 plSYZqPpapMABMTXg5xBf7K3n+lYxD1aMN07cqO42qaAZ8l2XDANFTPIaSFFrg3B/nhj
 MhNS5iXGS8wWceKJIrEEBXUqax8u6zRc2Yf0dtKEJybpInbBCeKfTsSLZOB3suqbux/o
 0w9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gdhM/fFQlCDkWJ3p0yp6CzsLc3mxWtAVqna6+gIgrh4=;
 b=uGsFqpsR/gFevBvv2uf3sJVewjl1lcwDqwGYDnTX+PrpxVyObtIoWqnxKFpdRz2xaE
 THSNdhdE1HPlftxAGZ4yEHztb613UJQ3ErJLAB9B6iZxvfTmcJkVnDX5AilHzvl7baIY
 1ozi8h7wAJOXk0pKAxKRYVP35TtOhSRcE0PD4KENaQDNUl9Sv/jVKXUQnKZT9PodD9WP
 PorAFxWrhqsDS8prFO3l2fEQ8iC76bfPo+MANElESxtEQ9xx/GAJP+DLlopWQMF47YiV
 a+2BWgKtc0jF0xVt06P1xUO6mcEvmpBM9wo5/TRItcKO8vlWUXA8QpWCjsVdOrGhsGAR
 ifpg==
X-Gm-Message-State: AOAM530pPidXIyZ+PauwaUfbDbX3WIOYecx3T6JtvMm/xGbQ/h6+Poje
 N5RHzk/nJtYwt/2RQ227tWhTWZ9WCVw=
X-Received: by 2002:a17:90a:ae11:: with SMTP id
 t17mr1230740pjq.157.1593142345186; 
 Thu, 25 Jun 2020 20:32:25 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y27sm1605256pgc.56.2020.06.25.20.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 20:32:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 29/46] target/arm: Use mte_checkN for sve unpredicated
 stores
Date: Thu, 25 Jun 2020 20:31:27 -0700
Message-Id: <20200626033144.790098-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626033144.790098-1-richard.henderson@linaro.org>
References: <20200626033144.790098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fkvIdEUyOZL6

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v8: Drop the out-of-line helper (pmm).
---
 target/arm/translate-sve.c | 61 +++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 28 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 11e0dfc210..4a613ca689 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4432,10 +4432,12 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
     int len_remain = len % 8;
     int nparts = len / 8 + ctpop8(len_remain);
     int midx = get_mem_index(s);
-    TCGv_i64 addr, t0;
+    TCGv_i64 dirty_addr, clean_addr, t0;
 
-    addr = tcg_temp_new_i64();
-    t0 = tcg_temp_new_i64();
+    dirty_addr = tcg_temp_new_i64();
+    tcg_gen_addi_i64(dirty_addr, cpu_reg_sp(s, rn), imm);
+    clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len, MO_8);
+    tcg_temp_free_i64(dirty_addr);
 
     /* Note that unpredicated load/store of vector/predicate registers
      * are defined as a stream of bytes, which equates to little-endian
@@ -4448,33 +4450,35 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
     if (nparts <= 4) {
         int i;
 
+        t0 = tcg_temp_new_i64();
         for (i = 0; i < len_align; i += 8) {
             tcg_gen_ld_i64(t0, cpu_env, vofs + i);
-            tcg_gen_addi_i64(addr, cpu_reg_sp(s, rn), imm + i);
-            tcg_gen_qemu_st_i64(t0, addr, midx, MO_LEQ);
+            tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEQ);
+            tcg_gen_addi_i64(clean_addr, cpu_reg_sp(s, rn), 8);
         }
+        tcg_temp_free_i64(t0);
     } else {
         TCGLabel *loop = gen_new_label();
-        TCGv_ptr t2, i = tcg_const_local_ptr(0);
+        TCGv_ptr tp, i = tcg_const_local_ptr(0);
+
+        /* Copy the clean address into a local temp, live across the loop. */
+        t0 = clean_addr;
+        clean_addr = tcg_temp_local_new_i64();
+        tcg_gen_mov_i64(clean_addr, t0);
+        tcg_temp_free_i64(t0);
 
         gen_set_label(loop);
 
-        t2 = tcg_temp_new_ptr();
-        tcg_gen_add_ptr(t2, cpu_env, i);
-        tcg_gen_ld_i64(t0, t2, vofs);
-
-        /* Minimize the number of local temps that must be re-read from
-         * the stack each iteration.  Instead, re-compute values other
-         * than the loop counter.
-         */
-        tcg_gen_addi_ptr(t2, i, imm);
-        tcg_gen_extu_ptr_i64(addr, t2);
-        tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, rn));
-        tcg_temp_free_ptr(t2);
-
-        tcg_gen_qemu_st_i64(t0, addr, midx, MO_LEQ);
-
+        t0 = tcg_temp_new_i64();
+        tp = tcg_temp_new_ptr();
+        tcg_gen_add_ptr(tp, cpu_env, i);
+        tcg_gen_ld_i64(t0, tp, vofs);
         tcg_gen_addi_ptr(i, i, 8);
+        tcg_temp_free_ptr(tp);
+
+        tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEQ);
+        tcg_gen_addi_i64(clean_addr, clean_addr, 8);
+        tcg_temp_free_i64(t0);
 
         tcg_gen_brcondi_ptr(TCG_COND_LTU, i, len_align, loop);
         tcg_temp_free_ptr(i);
@@ -4482,29 +4486,30 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
 
     /* Predicate register stores can be any multiple of 2.  */
     if (len_remain) {
+        t0 = tcg_temp_new_i64();
         tcg_gen_ld_i64(t0, cpu_env, vofs + len_align);
-        tcg_gen_addi_i64(addr, cpu_reg_sp(s, rn), imm + len_align);
 
         switch (len_remain) {
         case 2:
         case 4:
         case 8:
-            tcg_gen_qemu_st_i64(t0, addr, midx, MO_LE | ctz32(len_remain));
+            tcg_gen_qemu_st_i64(t0, clean_addr, midx,
+                                MO_LE | ctz32(len_remain));
             break;
 
         case 6:
-            tcg_gen_qemu_st_i64(t0, addr, midx, MO_LEUL);
-            tcg_gen_addi_i64(addr, addr, 4);
+            tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUL);
+            tcg_gen_addi_i64(clean_addr, clean_addr, 4);
             tcg_gen_shri_i64(t0, t0, 32);
-            tcg_gen_qemu_st_i64(t0, addr, midx, MO_LEUW);
+            tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUW);
             break;
 
         default:
             g_assert_not_reached();
         }
+        tcg_temp_free_i64(t0);
     }
-    tcg_temp_free_i64(addr);
-    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(clean_addr);
 }
 
 static bool trans_LDR_zri(DisasContext *s, arg_rri *a)
-- 
2.25.1

