Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1186602ejc;
        Mon, 22 Aug 2022 16:35:57 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7kT8/dNuPIBl5t/eDwcE7CaqQLARFbycKZmPg+Ysh/q+NO2xy7wq09fQBWS4FmOI+MZaFk
X-Received: by 2002:a05:622a:1902:b0:344:4ff1:f983 with SMTP id w2-20020a05622a190200b003444ff1f983mr17544631qtc.65.1661211357712;
        Mon, 22 Aug 2022 16:35:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661211357; cv=none;
        d=google.com; s=arc-20160816;
        b=OTrm8yWauRVvYum/laVcCC2zrRCIfT7lOjHnalH5CKHOJhVLZtnUVcJT9PtJ0ERjI8
         TKYKQ4plKgL1VXP9WokJ1/K5cDcpY7LinB8G/tZuc9gFrjWb5mTHg7luZ/kvBQeTwclI
         ZMygAUevy7fnGCnQpOLsLvwgQG5kog6/TFWtLELyA0rDfJ11WBbOXpaEyLGjBU/0SvLD
         RV3yIEzKlreePabJJQc6kfzv/gWVsp7aFeOUvBbzYf1M7DkewsoMKDToHpojoZ35Ve/P
         CVXoZ6jInDSJQDZJhkU5sJXBKnaVd8sQX+tUhNLpE7UKj+/N/oeKNOYMOuQRlhXEl4+B
         QQjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sptqSn2q1MUxoiSJ0oXgREmv1FSN9FwBedSu534JEYA=;
        b=0L8AXiLYBbFNjEqMfC/p6cQwDjbD3SXBuqmJ0ZE/HDQSRPIw96SJOdAdQVJORjgAXz
         3TC0SvwBztKKJklr6tYGCm0ZK+H6XzS/2AlQzS4xr2C0/Bg9najhyqoa4HW33BtB3I8b
         pT0xUegx1gvXp04rPnwDlj7UMJvSAfmXC6YdcBCCzzmNrRy96mMW0R9TODcR8DJTyc3B
         jafKKdc0FoFhVAxSyFSiAsC39UfAyw0D3vtUbxQJ3e0W6S0LUvrEQVRzvl2xn33M35+N
         fYnQXATFNwx+X063Q9iiN4jvdhjezcgBIVosdA78IvCVZf2W2tTeLHz2OjLzJ0vAqI+l
         NxEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y4HA7aue;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9-20020a05620a440900b006b5fdcc66bdsi6271998qkp.682.2022.08.22.16.35.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 16:35:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y4HA7aue;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQGxZ-0005n2-67
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 19:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGlz-0005jS-2p
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:24:00 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:46949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGlx-0005ey-7G
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:23:58 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 o14-20020a17090a0a0e00b001fabfd3369cso12896490pjo.5
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=sptqSn2q1MUxoiSJ0oXgREmv1FSN9FwBedSu534JEYA=;
 b=Y4HA7aueTTLEjKrTksc2JhCldaozROqYR6Gx02urcSo8z+bmaYmwHNY6eVslVM5R2L
 dV7Awf/nQjTEoeBIeQhF159q8CAqUDZo7ez8TbHoIoKbAhaUA4ENU3y/PMhd/fcFi9TH
 hEP3l9hbzq1A57fXUzs9V5xbqjbeEn80m0g0QaXqMUaseNZSz6wHq5kF7ZYjLsX2prPX
 vCdFkydOP2UO9+HpNYz8/Tri4SV6n3ROQPYiomAOF73OMLAyd1+bYxI5N/EWhoCTMRAm
 GGb8eaTB8DMFZ2CKo/7TAJbrS8KnYB5rra5A8by9LaSraV4RdHGaLRCBja9DbedNol6z
 Q4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=sptqSn2q1MUxoiSJ0oXgREmv1FSN9FwBedSu534JEYA=;
 b=Y077C/SYcrG3Zhf6XqX2ivpcViWEp9SJgO0aCSQcmoVuKA2wMtKfYjp9YliNWzS+zr
 i+AThCxCQ8s1xyftfGr6BH6L4hA/KPsolj1VfHCT+TFMoo7SgFYlewAw+QzXATTaCsuO
 jPXopYnxNLCM9oVfKFC4hX0yuZ6AAGUlDUFwZiy/gDGw6ApEM/eaOJkc/zG9RUM9488/
 lWLBkQDd2768zgRiAe3W4HldA0SHM98fO8OFwYhEN0C35xh9EKqiXs18cgCsc7dk2S81
 Q6ILmZ7isWVEgtzy1KnTBq6Joci3ANuQ/xWqtXEp/HztG4/cU+LfHAbzlHaxzCzvEB/0
 C20Q==
X-Gm-Message-State: ACgBeo2ss3IOaY1mlWQQ0CGfoziU7I0So7uffrVeI8Vd8sbksxKUjnDp
 au11pXljiLOW7KpAqovCPN+5PGzf6ny/zg==
X-Received: by 2002:a17:90b:4b47:b0:1f7:2e06:5752 with SMTP id
 mi7-20020a17090b4b4700b001f72e065752mr584289pjb.187.1661210634918; 
 Mon, 22 Aug 2022 16:23:54 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 k17-20020aa79731000000b0052d3899f8c2sm3809112pfg.4.2022.08.22.16.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:23:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 13/17] target/arm: Change gen_exception_internal to work on
 displacements
Date: Mon, 22 Aug 2022 16:23:34 -0700
Message-Id: <20220822232338.1727934-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822232338.1727934-1-richard.henderson@linaro.org>
References: <20220822232338.1727934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cr62rjXnkf/m

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c |  6 +++---
 target/arm/translate.c     | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 422ce9288d..b777742643 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -340,9 +340,9 @@ static void gen_exception_internal(int excp)
     gen_helper_exception_internal(cpu_env, tcg_constant_i32(excp));
 }
 
-static void gen_exception_internal_insn(DisasContext *s, uint64_t pc, int excp)
+static void gen_exception_internal_insn(DisasContext *s, int pc_diff, int excp)
 {
-    gen_a64_update_pc(s, pc - s->pc_curr);
+    gen_a64_update_pc(s, pc_diff);
     gen_exception_internal(excp);
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -2229,7 +2229,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
                 break;
             }
 #endif
-            gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+            gen_exception_internal_insn(s, 0, EXCP_SEMIHOST);
         } else {
             unallocated_encoding(s);
         }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index d441e31d3a..63a41ed438 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1078,10 +1078,10 @@ static inline void gen_smc(DisasContext *s)
     s->base.is_jmp = DISAS_SMC;
 }
 
-static void gen_exception_internal_insn(DisasContext *s, uint32_t pc, int excp)
+static void gen_exception_internal_insn(DisasContext *s, int pc_diff, int excp)
 {
     gen_set_condexec(s);
-    gen_update_pc(s, pc - s->pc_curr);
+    gen_update_pc(s, pc_diff);
     gen_exception_internal(excp);
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -1175,7 +1175,7 @@ static inline void gen_hlt(DisasContext *s, int imm)
         s->current_el != 0 &&
 #endif
         (imm == (s->thumb ? 0x3c : 0xf000))) {
-        gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, 0, EXCP_SEMIHOST);
         return;
     }
 
@@ -6565,7 +6565,7 @@ static bool trans_BKPT(DisasContext *s, arg_BKPT *a)
         !IS_USER(s) &&
 #endif
         (a->imm == 0xab)) {
-        gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, 0, EXCP_SEMIHOST);
     } else {
         gen_exception_bkpt_insn(s, syn_aa32_bkpt(a->imm, false));
     }
@@ -8773,7 +8773,7 @@ static bool trans_SVC(DisasContext *s, arg_SVC *a)
         !IS_USER(s) &&
 #endif
         (a->imm == semihost_imm)) {
-        gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, 0, EXCP_SEMIHOST);
     } else {
         gen_update_pc(s, curr_insn_len(s));
         s->svc_imm = a->imm;
-- 
2.34.1

