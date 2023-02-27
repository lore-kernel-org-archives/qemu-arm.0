Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4302194ejc;
        Sun, 26 Feb 2023 21:52:35 -0800 (PST)
X-Google-Smtp-Source: AK7set+TZr23ieQ5zWr+U8Rga3Xm6xnplSMX+G/xmykvVYzJEn357ez/lDoT5Lyb+WTSUruZruTq
X-Received: by 2002:a05:6214:1945:b0:56e:bc62:e151 with SMTP id q5-20020a056214194500b0056ebc62e151mr46503895qvk.7.1677477155791;
        Sun, 26 Feb 2023 21:52:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677477155; cv=none;
        d=google.com; s=arc-20160816;
        b=O8F1yIGYLAYlcYSRsMlUbnhS2WMNgTtJTC7gW8N4AM0QKkgX6qvEv9N5NLMISZPpOx
         L53sliyyptcfgl190u+mH+d3gj7mlyG/JkhMg2xnH85vFvfKyuFepsiRG5l25eqsbY7u
         j2P2yok/ppt7Hk+MBvOW7d3NC4sntRm+LnZdfjYemm2KqiqIVYwdkcyJfuLjK+4Hzsos
         kI1L0esxhVm3ps4ILJ6syU5zSTMkTZsQkpqia+OpfsGpiQxYLpWB7A4U2EHme5Km6SuY
         iBOmzbbWQMdGagJRfseO213XxuH4kTjf48oGfdURpTrKNciOQhr5wv47U3k9Kb9A5d7l
         zQcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AisW32xJlrcJQi+M6qK/ftrU2PNr6PIj4TLkVZ68u3o=;
        b=FfIOsGT3Gprm4GhZY65lH/S45ncnLbDhQgUm9oXfsXPqx/aQ6E4trLiPPCb5Fnuuoi
         y7Lwulic1mUsr1naYztjZohIW9ouf7fq82WIXfGFFJjyhepbwWiSyY476JrAvi+TkcXN
         wEFoxwuChLWyHN+Hk9nh7QmZbTt68Na9s0cYdM7pvhcJNI4ZHwRJlyzS17CzSk8NI2Cb
         V49ZVg0SM4NEgmDzTD/7n4vdIk8nnenbMCDmMVmz+tU/2lWmoayFmMkvHgOUQQ5i5s5P
         /8OIjCKbMoXeby/zCe6Ka9OD90cgqyhTjYzvhbfuXaH0hNhkla1IUD2f9VUd9gBXvXru
         ia/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zYeZ73qW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3-20020a05622a01c300b003b9baa3479asi6078850qtw.156.2023.02.26.21.52.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:52:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zYeZ73qW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWOC-0007b2-C4; Mon, 27 Feb 2023 00:49:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWN2-0003JB-F6
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:48:20 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMz-0007Kg-1g
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:48:19 -0500
Received: by mail-pl1-x62f.google.com with SMTP id c1so5581325plg.4
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AisW32xJlrcJQi+M6qK/ftrU2PNr6PIj4TLkVZ68u3o=;
 b=zYeZ73qWVqHwn3qWRj8CZON5nItJjG2hW9OnHx04eY/CwM9Cp4yNdmWkHuloJ03wP+
 W3VNo/QPi91RmvTqu43vrl9mGda49BUA1+59Kubm7VrPNZVziUvZ+6amJ9nOnDeMsxpf
 1jwLM11ZGMccMEsreYL7MLBmjm7E9r/+k+z4Y1y9PIi8WWyglQGXUt4QbbJarUUbd8uK
 REt5EAqolMVzZgyuTn3E5GeFg7VLINSlHZu0ckF5i3ABibHjuyGVYHa+2WfYODxRmjCv
 rq8ypSUV8En7JNHZs0O8+9yP2XvQxGutN+jMtpGEOtRA9mdIHrvpwRgTq0I9TvpgPL4c
 1KfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AisW32xJlrcJQi+M6qK/ftrU2PNr6PIj4TLkVZ68u3o=;
 b=miTqD71Tlg1T9kbKhzLl3F/2C0N8Ri0OIo4AHyn08eoQNe2v4vRM7u63M8OhVr9//B
 kjMluBylMT0zFZkYOicSnymzgrwyHr3XujHSuzfBOeiK8KLRQlYBll6fl+pIynsIXbrf
 n8fm7lTbKLNoz6vV1O8335J21+sQk/E7/orSIw7AA0xrD8LFiCAsGxazb7ySI/2a/aHP
 h33KliVdxUxQDOgn3GaytysPJ13EoyaCVXd51ictiataVKvkm0RwGYNDm5lZb4Fz2Aky
 FU4a4EavwCp80wWDbB6pvV2kBCDxQvXxi/ZzdgLTnVOquxzpTYKhMjRqdyBylHFcT61f
 wbzg==
X-Gm-Message-State: AO0yUKVYkdIoh2ulkJxkOUn4zHo1OU6m4zxoekpITHpN2d9QfZZfIMrr
 KLxE/7wIT0JpUvHSb3ysve06rA==
X-Received: by 2002:a17:903:1ce:b0:19d:20fe:c149 with SMTP id
 e14-20020a17090301ce00b0019d20fec149mr722361plh.34.1677476895749; 
 Sun, 26 Feb 2023 21:48:15 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:48:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 57/70] target/tricore: Rename t_off10 and use tcg_constant_i32
Date: Sun, 26 Feb 2023 19:42:20 -1000
Message-Id: <20230227054233.390271-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: wutusSRl4QRe

While temp3 could simply be initialized with tcg_constant_i32,
the renaming makes the purpose clearer.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/translate.c | 56 ++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 29 deletions(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 194bef27a6..19cf4b6cc7 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -4380,7 +4380,7 @@ static void decode_bo_addrmode_bitreverse_circular(DisasContext *ctx)
     uint32_t op2;
     uint32_t off10;
     int32_t r1, r2;
-    TCGv temp, temp2, temp3;
+    TCGv temp, temp2, t_off10;
 
     r1 = MASK_OP_BO_S1D(ctx->opcode);
     r2  = MASK_OP_BO_S2(ctx->opcode);
@@ -4389,7 +4389,7 @@ static void decode_bo_addrmode_bitreverse_circular(DisasContext *ctx)
 
     temp = tcg_temp_new();
     temp2 = tcg_temp_new();
-    temp3 = tcg_const_i32(off10);
+    t_off10 = tcg_constant_i32(off10);
     CHECK_REG_PAIR(r2);
     tcg_gen_ext16u_tl(temp, cpu_gpr_a[r2+1]);
     tcg_gen_add_tl(temp2, cpu_gpr_a[r2], temp);
@@ -4403,7 +4403,7 @@ static void decode_bo_addrmode_bitreverse_circular(DisasContext *ctx)
     case OPC2_32_BO_CACHEA_WI_CIRC:
     case OPC2_32_BO_CACHEA_W_CIRC:
     case OPC2_32_BO_CACHEA_I_CIRC:
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_ST_A_BR:
         tcg_gen_qemu_st_tl(cpu_gpr_a[r1], temp2, ctx->mem_idx, MO_LEUL);
@@ -4411,7 +4411,7 @@ static void decode_bo_addrmode_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_ST_A_CIRC:
         tcg_gen_qemu_st_tl(cpu_gpr_a[r1], temp2, ctx->mem_idx, MO_LEUL);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_ST_B_BR:
         tcg_gen_qemu_st_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_UB);
@@ -4419,7 +4419,7 @@ static void decode_bo_addrmode_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_ST_B_CIRC:
         tcg_gen_qemu_st_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_UB);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_ST_D_BR:
         CHECK_REG_PAIR(r1);
@@ -4434,7 +4434,7 @@ static void decode_bo_addrmode_bitreverse_circular(DisasContext *ctx)
         tcg_gen_rem_tl(temp, temp, temp2);
         tcg_gen_add_tl(temp2, cpu_gpr_a[r2], temp);
         tcg_gen_qemu_st_tl(cpu_gpr_d[r1+1], temp2, ctx->mem_idx, MO_LEUL);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_ST_DA_BR:
         CHECK_REG_PAIR(r1);
@@ -4449,7 +4449,7 @@ static void decode_bo_addrmode_bitreverse_circular(DisasContext *ctx)
         tcg_gen_rem_tl(temp, temp, temp2);
         tcg_gen_add_tl(temp2, cpu_gpr_a[r2], temp);
         tcg_gen_qemu_st_tl(cpu_gpr_a[r1+1], temp2, ctx->mem_idx, MO_LEUL);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_ST_H_BR:
         tcg_gen_qemu_st_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LEUW);
@@ -4457,7 +4457,7 @@ static void decode_bo_addrmode_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_ST_H_CIRC:
         tcg_gen_qemu_st_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LEUW);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_ST_Q_BR:
         tcg_gen_shri_tl(temp, cpu_gpr_d[r1], 16);
@@ -4467,7 +4467,7 @@ static void decode_bo_addrmode_bitreverse_circular(DisasContext *ctx)
     case OPC2_32_BO_ST_Q_CIRC:
         tcg_gen_shri_tl(temp, cpu_gpr_d[r1], 16);
         tcg_gen_qemu_st_tl(temp, temp2, ctx->mem_idx, MO_LEUW);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_ST_W_BR:
         tcg_gen_qemu_st_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LEUL);
@@ -4475,7 +4475,7 @@ static void decode_bo_addrmode_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_ST_W_CIRC:
         tcg_gen_qemu_st_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LEUL);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     default:
         generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
@@ -4619,8 +4619,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
     uint32_t op2;
     uint32_t off10;
     int r1, r2;
-
-    TCGv temp, temp2, temp3;
+    TCGv temp, temp2, t_off10;
 
     r1 = MASK_OP_BO_S1D(ctx->opcode);
     r2 = MASK_OP_BO_S2(ctx->opcode);
@@ -4629,7 +4628,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
 
     temp = tcg_temp_new();
     temp2 = tcg_temp_new();
-    temp3 = tcg_const_i32(off10);
+    t_off10 = tcg_constant_i32(off10);
     CHECK_REG_PAIR(r2);
     tcg_gen_ext16u_tl(temp, cpu_gpr_a[r2+1]);
     tcg_gen_add_tl(temp2, cpu_gpr_a[r2], temp);
@@ -4642,7 +4641,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_LD_A_CIRC:
         tcg_gen_qemu_ld_tl(cpu_gpr_a[r1], temp2, ctx->mem_idx, MO_LEUL);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_LD_B_BR:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_SB);
@@ -4650,7 +4649,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_LD_B_CIRC:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_SB);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_LD_BU_BR:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_UB);
@@ -4658,7 +4657,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_LD_BU_CIRC:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_UB);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_LD_D_BR:
         CHECK_REG_PAIR(r1);
@@ -4673,7 +4672,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
         tcg_gen_rem_tl(temp, temp, temp2);
         tcg_gen_add_tl(temp2, cpu_gpr_a[r2], temp);
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1+1], temp2, ctx->mem_idx, MO_LEUL);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_LD_DA_BR:
         CHECK_REG_PAIR(r1);
@@ -4688,7 +4687,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
         tcg_gen_rem_tl(temp, temp, temp2);
         tcg_gen_add_tl(temp2, cpu_gpr_a[r2], temp);
         tcg_gen_qemu_ld_tl(cpu_gpr_a[r1+1], temp2, ctx->mem_idx, MO_LEUL);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_LD_H_BR:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LESW);
@@ -4696,7 +4695,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_LD_H_CIRC:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LESW);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_LD_HU_BR:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LEUW);
@@ -4704,7 +4703,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_LD_HU_CIRC:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LEUW);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_LD_Q_BR:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LEUW);
@@ -4714,7 +4713,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
     case OPC2_32_BO_LD_Q_CIRC:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LEUW);
         tcg_gen_shli_tl(cpu_gpr_d[r1], cpu_gpr_d[r1], 16);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_LD_W_BR:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LEUL);
@@ -4722,7 +4721,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_LD_W_CIRC:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LEUL);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     default:
         generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
@@ -4823,8 +4822,7 @@ static void decode_bo_addrmode_ldmst_bitreverse_circular(DisasContext *ctx)
     uint32_t op2;
     uint32_t off10;
     int r1, r2;
-
-    TCGv temp, temp2, temp3;
+    TCGv temp, temp2, t_off10;
 
     r1 = MASK_OP_BO_S1D(ctx->opcode);
     r2 = MASK_OP_BO_S2(ctx->opcode);
@@ -4833,7 +4831,7 @@ static void decode_bo_addrmode_ldmst_bitreverse_circular(DisasContext *ctx)
 
     temp = tcg_temp_new();
     temp2 = tcg_temp_new();
-    temp3 = tcg_const_i32(off10);
+    t_off10 = tcg_constant_i32(off10);
     CHECK_REG_PAIR(r2);
     tcg_gen_ext16u_tl(temp, cpu_gpr_a[r2+1]);
     tcg_gen_add_tl(temp2, cpu_gpr_a[r2], temp);
@@ -4845,7 +4843,7 @@ static void decode_bo_addrmode_ldmst_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_LDMST_CIRC:
         gen_ldmst(ctx, r1, temp2);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_SWAP_W_BR:
         gen_swap(ctx, r1, temp2);
@@ -4853,7 +4851,7 @@ static void decode_bo_addrmode_ldmst_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_SWAP_W_CIRC:
         gen_swap(ctx, r1, temp2);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_CMPSWAP_W_BR:
         gen_cmpswap(ctx, r1, temp2);
@@ -4861,7 +4859,7 @@ static void decode_bo_addrmode_ldmst_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_CMPSWAP_W_CIRC:
         gen_cmpswap(ctx, r1, temp2);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_SWAPMSK_W_BR:
         gen_swapmsk(ctx, r1, temp2);
@@ -4869,7 +4867,7 @@ static void decode_bo_addrmode_ldmst_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_SWAPMSK_W_CIRC:
         gen_swapmsk(ctx, r1, temp2);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     default:
         generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
-- 
2.34.1

