Received: by 2002:a17:906:e18:b0:a38:6d10:c5dd with SMTP id l24csp126982eji;
        Tue, 6 Feb 2024 18:53:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWMB+TvGxPW8R22YtRomJSX3Mxn0p4UdOhPqmm5yMtErvNdAXn3oJC5UaaJFifQP8RRWa4
X-Received: by 2002:a05:620a:1a90:b0:785:35e0:5e75 with SMTP id bl16-20020a05620a1a9000b0078535e05e75mr5489049qkb.41.1707274431308;
        Tue, 06 Feb 2024 18:53:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707274431; cv=none;
        d=google.com; s=arc-20160816;
        b=WmHfNcX14E8WYVpJD8SAv1hb/Ab53cl8bBT6UuvV2unLT/DWIJNK9k+VQketk8YWAa
         8EuhQIwxJEKiiz13K2yRVs1kyIoWRt1PsM09p1PUv6k7HJQP8VIOhOjIzDh3O7wwfsjk
         TlPXYnD+Pe9lPKGo8G3AWfdHooFyLcx/Gp7H3tWhf9QdkTRzCJdKuc6TiONig5bA/DaY
         etzJCo/ob4zpzkslccqJ9ZIpuYy/5K46TbdVRHsEE1Rsb3+BiC4id5lA+U/M+zzZ3zjf
         b121H6pUlyny35RcW1EXacFUs6I9VRd+3QKK8SidB1siUi5vAA2XdPbNASmSDRmokqer
         Th7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KE5lr6JW9Hb5FNHnTu7wAvaaKUMTGQjD484Q9RZmfv8=;
        fh=2hTDaMvdrYl1OGxwHLhnpwXLp/CHIB36WNN0XrnMWco=;
        b=BXBMbhepaS5DUZTX2ExUFMtNgH426j1EZMlzJltTpvdnBEmwqbMeMzAdxd079yfIqn
         KsZrZy4E/N5/PRyjmVnC2Kkvx1SyLs8rBzdNR+JMudU5LkbQqTqK6Wd/yMr7BQfYPdqL
         I3r6XYOD/AXMCH+3vrDtceiMAgo63wO571zIqRj1N8acUnQj4d/Rwclga8IxWZXc8zy0
         iTQXeBncsiqJhGI28lyaibmZi81dmx0dC9494VXTAppEoYL6HY3k0ejMQpl1SzSNH6OC
         eKeS2C99EBWuEBGGpUARxcNi3DCoahEkV91fAOBDANLvbKfbI2L9PS9tYVFNZW4DJiZk
         L2RA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I8Qxszfu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCXzFLmQB4+x1qcXi/wWf6B5GFjLqMQKr1nvecgcHvoTMA+J1F3zVYa/T0paVPGl39taT0HtSiyYuKq9qfivx2/pQ0jy+msR
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w4-20020a05620a148400b00783dcb0b5a3si272261qkj.608.2024.02.06.18.53.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 18:53:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I8Qxszfu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXY3G-0003Ip-TL; Tue, 06 Feb 2024 21:52:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXY3F-0003I6-3U
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 21:52:41 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXY3D-0000hZ-Ig
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 21:52:40 -0500
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6da202aa138so123584b3a.2
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 18:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707274358; x=1707879158; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KE5lr6JW9Hb5FNHnTu7wAvaaKUMTGQjD484Q9RZmfv8=;
 b=I8QxszfuWmxyGn0hZWzeGy85VONnNye4JIqdywAaElbsgR2Idyr8gYcLHVxs/R32+W
 n95TTBG7dw07XDvk0QqASut/HpE9l2+agw8i6RTMES65oxEbF5vTOwFzr9U/78sqSlf9
 elVQkqr3ZEcSQFNUcBocNF4FW8jE9zQ4EGiqFtI4gL00hLntFYextaldrukXd/EucxyK
 wnW8itDVI7IX+SkWaFpS/gwMnf+YSIu2CUK1h7nKa6rag9/8qeQbyNvdeB7w7jk8ET51
 IXQye4f58BJ73wu72dJkluqtt9K2Mlry9cRUbCfKULHj3SI3rf0Dq9XTbGhMyn7t6JAt
 u3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707274358; x=1707879158;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KE5lr6JW9Hb5FNHnTu7wAvaaKUMTGQjD484Q9RZmfv8=;
 b=URzZeAnx75UUV9fc4xwcCl1/zHKn59uk7i5rRtBMfpAW2ccvUgwlU4s7llg726Cca2
 nWshfuGzew8kmzeKWKB8CwwAvPCi2Uj73BAsA9p7kB1durenzA4VXEGchE59FK1ab8Fl
 ySChQjuzCpnsBTEL/vUuQd1V12re2GSwnjO1IHVnBJrHGtd8S3ubk2dW2FhrlrSoKloO
 gDdyb1H4yEZ/bp13Sv8KEeoHb6a8zdBmGWwrgFGt0PFNEBArXBzcdCRD/cxq8i6+Zeej
 bvmQnUn7hZon5ZW9g32p/kJ56U2vFy8TFyW9wKjNmeOsm9/1XZ3b9U/x0/6pd2W8ik+Z
 2e1w==
X-Gm-Message-State: AOJu0YwarG9EMzSsGGaG5UtqDvd3omn6EvpeqUhN6g3wBbqtETDobzS/
 9LcL0hblOVy2pD++lX6l60ZApW4ZoQQEYXtEZq4YRLUxEpPZ4eKxRQvZtOJNkks=
X-Received: by 2002:a05:6a21:6d98:b0:19a:4418:1e86 with SMTP id
 wl24-20020a056a216d9800b0019a44181e86mr4262411pzb.58.1707274358277; 
 Tue, 06 Feb 2024 18:52:38 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWxqpYzYGjo+qKTG+7sZrr7d1XLfgwzefc4tUX9Y+WpenNlHz3T25lp7BrCdXss/0h71Zg3lF/phF+vbpB+WR1JQF+QkG8AKeRkfgi3UBZT/DrqOezu+fKuQvQgLiP4IcnG6WIpmZPbGJOnGPYGZWcvikkTmA9xjpFksFI=
Received: from stoup.. (60-242-98-186.static.tpgi.com.au. [60.242.98.186])
 by smtp.gmail.com with ESMTPSA id
 kr8-20020a170903080800b001d8ef97de4asm255435plb.38.2024.02.06.18.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 18:52:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, gustavo.romero@linaro.org, qemu-stable@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 5/6] target/arm: Handle mte in do_ldrq, do_ldro
Date: Wed,  7 Feb 2024 12:52:09 +1000
Message-Id: <20240207025210.8837-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240207025210.8837-1-richard.henderson@linaro.org>
References: <20240207025210.8837-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Gzl+mop/OuIb

These functions "use the standard load helpers", but
fail to clean_data_tbi or populate mtedesc.

Cc: qemu-stable@nongnu.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 508f7b6bbd..ada05aa530 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4861,8 +4861,13 @@ static void do_ldrq(DisasContext *s, int zt, int pg, TCGv_i64 addr, int dtype)
     unsigned vsz = vec_full_reg_size(s);
     TCGv_ptr t_pg;
     int poff;
+    uint32_t desc;
 
     /* Load the first quadword using the normal predicated load helpers.  */
+    if (!s->mte_active[0]) {
+        addr = clean_data_tbi(s, addr);
+    }
+
     poff = pred_full_reg_offset(s, pg);
     if (vsz > 16) {
         /*
@@ -4886,7 +4891,8 @@ static void do_ldrq(DisasContext *s, int zt, int pg, TCGv_i64 addr, int dtype)
 
     gen_helper_gvec_mem *fn
         = ldr_fns[s->mte_active[0]][s->be_data == MO_BE][dtype][0];
-    fn(tcg_env, t_pg, addr, tcg_constant_i32(simd_desc(16, 16, zt)));
+    desc = make_svemte_desc(s, 16, 1, dtype_msz(dtype), false, zt);
+    fn(tcg_env, t_pg, addr, tcg_constant_i32(desc));
 
     /* Replicate that first quadword.  */
     if (vsz > 16) {
@@ -4929,6 +4935,7 @@ static void do_ldro(DisasContext *s, int zt, int pg, TCGv_i64 addr, int dtype)
     unsigned vsz_r32;
     TCGv_ptr t_pg;
     int poff, doff;
+    uint32_t desc;
 
     if (vsz < 32) {
         /*
@@ -4941,6 +4948,9 @@ static void do_ldro(DisasContext *s, int zt, int pg, TCGv_i64 addr, int dtype)
     }
 
     /* Load the first octaword using the normal predicated load helpers.  */
+    if (!s->mte_active[0]) {
+        addr = clean_data_tbi(s, addr);
+    }
 
     poff = pred_full_reg_offset(s, pg);
     if (vsz > 32) {
@@ -4965,7 +4975,8 @@ static void do_ldro(DisasContext *s, int zt, int pg, TCGv_i64 addr, int dtype)
 
     gen_helper_gvec_mem *fn
         = ldr_fns[s->mte_active[0]][s->be_data == MO_BE][dtype][0];
-    fn(tcg_env, t_pg, addr, tcg_constant_i32(simd_desc(32, 32, zt)));
+    desc = make_svemte_desc(s, 32, 1, dtype_msz(dtype), false, zt);
+    fn(tcg_env, t_pg, addr, tcg_constant_i32(desc));
 
     /*
      * Replicate that first octaword.
-- 
2.34.1

