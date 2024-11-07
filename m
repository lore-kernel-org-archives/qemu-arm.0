Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3910977njc;
        Wed, 6 Nov 2024 17:25:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW8ZlIwOCnhFBqkYD06te7xlojHhctLkyUY5/sOhlHPFV7w4MhGCP6xjBVcNo1szJPdzCUXTAtYIBv7lw==@linaro.org
X-Google-Smtp-Source: AGHT+IGasXBUnp034F39/IWed+bBAkuce0pUCO4iMzm4KHBA4awpo/07EiVEdG6ZVjff9r3kbyOd
X-Received: by 2002:a05:622a:9:b0:460:8e3b:6798 with SMTP id d75a77b69052e-462ffd77c12mr3825751cf.6.1730942716574;
        Wed, 06 Nov 2024 17:25:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730942716; cv=none;
        d=google.com; s=arc-20240605;
        b=FjAf4CWJSc6EZmdJQ4guvVCfxMXm7HzZ6mmWpHxfNuz8bZmSxTbFajLwIwiJnjvhbS
         ogXf8Bv2N5F29MiF8e0Q7zx4nigJC/ijM8KzSqNRGi21I1R4DYzlQBK/Fv1DPwsU7d1X
         SRWACAKe8WGwamGDjcHCLGmvTNZHGWwC8P2ayMolS21rtJMQpElPQIswJ7uvVPfX6iP2
         rr6QVU2H42oDeVvo6mKRQaX4SAlUAFFNNs+d+GAamCNFuZmrjX2Rz4b9GgID+Eu+tG5P
         SUmarTrqU+L0ufz3Q+69rpFY/HYb/Zw9Az1XKlklB6F9UQmGABw/+pfQhF82KdrCkkoC
         49kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8j17IHTXkaut+m8u9uRJkB2+OtmZ4RyCwvHXesQ1YIM=;
        fh=xsfcgSrqd/Nw6Enhzpbde7HhMGIcJ/4Fh+4VTKT0a70=;
        b=N0j4Rd6z1mm7qE9j9cQhcExEOG9apegxXWSus4SL9xfghUP8qosWbM5nEw+IViBahe
         5gf1uVdw3AnSbfeHc8MqTx8EBKIiBAqc41qwoaLTdm2F7Gf3YoTN2N0um+2Af8sI85la
         5BWi87f3fyQtnaPVCMIzcm1GlOswXMVzvUWJnYWnwGF93dtlww7GJCSKdFRtN5j9w4VQ
         +PAf6tPZD5bxwOq3LLc8E4CAs1hZmyZYvE4BIlP7P5H3M+kmWcpAyb754tXrjSTNE7mq
         uEPkMarmhLU5kAE9F/y0huIf3YdmAs/JWnUyT00C2CFvuElUeuFcV75g8EIZ4YPxqO7N
         p8ng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NyVwEbpn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff61afb1si3064531cf.403.2024.11.06.17.25.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Nov 2024 17:25:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NyVwEbpn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8rFY-00065z-Ok; Wed, 06 Nov 2024 20:23:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8rFL-0005sL-Uc
 for qemu-arm@nongnu.org; Wed, 06 Nov 2024 20:23:41 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8rFJ-0003Br-RA
 for qemu-arm@nongnu.org; Wed, 06 Nov 2024 20:23:39 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4314fa33a35so3507185e9.1
 for <qemu-arm@nongnu.org>; Wed, 06 Nov 2024 17:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730942616; x=1731547416; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8j17IHTXkaut+m8u9uRJkB2+OtmZ4RyCwvHXesQ1YIM=;
 b=NyVwEbpn7kIPLEbKxzhMxW2iQC7xY1jvZcbO1qwhkAanKExiYPPLvI7AALDOYvErkT
 o5S+JG2B2+CFPrJ49+ttvbZgbLRSKRaJql0tzFHK7BRvQiJizUkYtD1kn2rzbSkuXorR
 2sJzhIvJ19vPtUbOfOud5aDYZPwj7gy3h8aqCohCqDkdjW/VUfocWqgURhrRqqEeMKAy
 pygFCHYtcmtwg6IKvfEZrceUFlcKCgFkaeiJpf87SCfF1jMCUIJhzSh7mbn8kfZ0qUnB
 1/VaRlqDLkaZ0mGMi9AakU8DRmCDM6nz+N1yIpJmqfmWat01TvnNUQa/twglyQM9Sw2e
 2WhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730942616; x=1731547416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8j17IHTXkaut+m8u9uRJkB2+OtmZ4RyCwvHXesQ1YIM=;
 b=pbCjxRrMfTTUxe2rc5TB7ECnSz5LfSJW6IqLPiT1S/OuFHBlRuaFPq0ZNlGsgsmaT7
 JNXPKWp2G9qXRrXuI4W7yrzreAnoWblJEkOZINo3THmWqBdPqcCVi6AbJ+YxjOt1PAo6
 6Iaub0nYsnXHzNNN27pHuMXbyYt+6G3ujj/mKZ1zbG1PmNaeGTCPuJag2NjKaVplqZrb
 t8acMTyG0l009JMIUyy34UX+McBUmS3Ow202vxf3pH8CFO+i0EZATv92aRX9lw9QydHX
 uebBfDlcTLcZ3ivpQHUAy02gp0AEgRgovfS4dj/0GgVuRtyXaORZ5wfS+RGBHS62nY2M
 Ek/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLbpILkq9yGkf+paVJDIKFU80mIOtcYgYBwnlNfUvTgYeCXPQuyl4FV7R01xNUFYypgGsHyyc2aA==@nongnu.org
X-Gm-Message-State: AOJu0YzVND7aSWM6IxSwSxSEiG3dprurAraIXQ73rI3X5SR2BFnpnRWt
 rbpadbbTTM8vQoKxnaeuvsuRGzE4oK/RVfFJf8E1YRuNWwjARiOJro/d4CCaY+g=
X-Received: by 2002:a05:600c:4fce:b0:431:5f1c:8352 with SMTP id
 5b1f17b1804b1-432b14ba42dmr1323965e9.5.1730942615673; 
 Wed, 06 Nov 2024 17:23:35 -0800 (PST)
Received: from localhost.localdomain ([89.101.134.25])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b04753d5sm5634065e9.0.2024.11.06.17.23.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 06 Nov 2024 17:23:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Anton Johansson <anjo@rev.ng>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>, devel@lists.libvirt.org,
 qemu-ppc@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 11/16] target/microblaze: Set MO_TE once in do_load() /
 do_store()
Date: Thu,  7 Nov 2024 01:22:17 +0000
Message-ID: <20241107012223.94337-12-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241107012223.94337-1-philmd@linaro.org>
References: <20241107012223.94337-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
X-TUID: SfrGhtD1bmgj

All callers of do_load() / do_store() set MO_TE flag.
Set it once in the callees.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/translate.c | 36 +++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 4c25b1e438..86f3c19618 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -712,6 +712,8 @@ static bool do_load(DisasContext *dc, int rd, TCGv addr, MemOp mop,
 {
     MemOp size = mop & MO_SIZE;
 
+    mop |= MO_TE;
+
     /*
      * When doing reverse accesses we need to do two things.
      *
@@ -779,13 +781,13 @@ static bool trans_lbui(DisasContext *dc, arg_typeb *arg)
 static bool trans_lhu(DisasContext *dc, arg_typea *arg)
 {
     TCGv addr = compute_ldst_addr_typea(dc, arg->ra, arg->rb);
-    return do_load(dc, arg->rd, addr, MO_TE | MO_UW, dc->mem_index, false);
+    return do_load(dc, arg->rd, addr, MO_UW, dc->mem_index, false);
 }
 
 static bool trans_lhur(DisasContext *dc, arg_typea *arg)
 {
     TCGv addr = compute_ldst_addr_typea(dc, arg->ra, arg->rb);
-    return do_load(dc, arg->rd, addr, MO_TE | MO_UW, dc->mem_index, true);
+    return do_load(dc, arg->rd, addr, MO_UW, dc->mem_index, true);
 }
 
 static bool trans_lhuea(DisasContext *dc, arg_typea *arg)
@@ -797,26 +799,26 @@ static bool trans_lhuea(DisasContext *dc, arg_typea *arg)
     return true;
 #else
     TCGv addr = compute_ldst_addr_ea(dc, arg->ra, arg->rb);
-    return do_load(dc, arg->rd, addr, MO_TE | MO_UW, MMU_NOMMU_IDX, false);
+    return do_load(dc, arg->rd, addr, MO_UW, MMU_NOMMU_IDX, false);
 #endif
 }
 
 static bool trans_lhui(DisasContext *dc, arg_typeb *arg)
 {
     TCGv addr = compute_ldst_addr_typeb(dc, arg->ra, arg->imm);
-    return do_load(dc, arg->rd, addr, MO_TE | MO_UW, dc->mem_index, false);
+    return do_load(dc, arg->rd, addr, MO_UW, dc->mem_index, false);
 }
 
 static bool trans_lw(DisasContext *dc, arg_typea *arg)
 {
     TCGv addr = compute_ldst_addr_typea(dc, arg->ra, arg->rb);
-    return do_load(dc, arg->rd, addr, MO_TE | MO_UL, dc->mem_index, false);
+    return do_load(dc, arg->rd, addr, MO_UL, dc->mem_index, false);
 }
 
 static bool trans_lwr(DisasContext *dc, arg_typea *arg)
 {
     TCGv addr = compute_ldst_addr_typea(dc, arg->ra, arg->rb);
-    return do_load(dc, arg->rd, addr, MO_TE | MO_UL, dc->mem_index, true);
+    return do_load(dc, arg->rd, addr, MO_UL, dc->mem_index, true);
 }
 
 static bool trans_lwea(DisasContext *dc, arg_typea *arg)
@@ -828,14 +830,14 @@ static bool trans_lwea(DisasContext *dc, arg_typea *arg)
     return true;
 #else
     TCGv addr = compute_ldst_addr_ea(dc, arg->ra, arg->rb);
-    return do_load(dc, arg->rd, addr, MO_TE | MO_UL, MMU_NOMMU_IDX, false);
+    return do_load(dc, arg->rd, addr, MO_UL, MMU_NOMMU_IDX, false);
 #endif
 }
 
 static bool trans_lwi(DisasContext *dc, arg_typeb *arg)
 {
     TCGv addr = compute_ldst_addr_typeb(dc, arg->ra, arg->imm);
-    return do_load(dc, arg->rd, addr, MO_TE | MO_UL, dc->mem_index, false);
+    return do_load(dc, arg->rd, addr, MO_UL, dc->mem_index, false);
 }
 
 static bool trans_lwx(DisasContext *dc, arg_typea *arg)
@@ -862,6 +864,8 @@ static bool do_store(DisasContext *dc, int rd, TCGv addr, MemOp mop,
 {
     MemOp size = mop & MO_SIZE;
 
+    mop |= MO_TE;
+
     /*
      * When doing reverse accesses we need to do two things.
      *
@@ -929,13 +933,13 @@ static bool trans_sbi(DisasContext *dc, arg_typeb *arg)
 static bool trans_sh(DisasContext *dc, arg_typea *arg)
 {
     TCGv addr = compute_ldst_addr_typea(dc, arg->ra, arg->rb);
-    return do_store(dc, arg->rd, addr, MO_TE | MO_UW, dc->mem_index, false);
+    return do_store(dc, arg->rd, addr, MO_UW, dc->mem_index, false);
 }
 
 static bool trans_shr(DisasContext *dc, arg_typea *arg)
 {
     TCGv addr = compute_ldst_addr_typea(dc, arg->ra, arg->rb);
-    return do_store(dc, arg->rd, addr, MO_TE | MO_UW, dc->mem_index, true);
+    return do_store(dc, arg->rd, addr, MO_UW, dc->mem_index, true);
 }
 
 static bool trans_shea(DisasContext *dc, arg_typea *arg)
@@ -947,26 +951,26 @@ static bool trans_shea(DisasContext *dc, arg_typea *arg)
     return true;
 #else
     TCGv addr = compute_ldst_addr_ea(dc, arg->ra, arg->rb);
-    return do_store(dc, arg->rd, addr, MO_TE | MO_UW, MMU_NOMMU_IDX, false);
+    return do_store(dc, arg->rd, addr, MO_UW, MMU_NOMMU_IDX, false);
 #endif
 }
 
 static bool trans_shi(DisasContext *dc, arg_typeb *arg)
 {
     TCGv addr = compute_ldst_addr_typeb(dc, arg->ra, arg->imm);
-    return do_store(dc, arg->rd, addr, MO_TE | MO_UW, dc->mem_index, false);
+    return do_store(dc, arg->rd, addr, MO_UW, dc->mem_index, false);
 }
 
 static bool trans_sw(DisasContext *dc, arg_typea *arg)
 {
     TCGv addr = compute_ldst_addr_typea(dc, arg->ra, arg->rb);
-    return do_store(dc, arg->rd, addr, MO_TE | MO_UL, dc->mem_index, false);
+    return do_store(dc, arg->rd, addr, MO_UL, dc->mem_index, false);
 }
 
 static bool trans_swr(DisasContext *dc, arg_typea *arg)
 {
     TCGv addr = compute_ldst_addr_typea(dc, arg->ra, arg->rb);
-    return do_store(dc, arg->rd, addr, MO_TE | MO_UL, dc->mem_index, true);
+    return do_store(dc, arg->rd, addr, MO_UL, dc->mem_index, true);
 }
 
 static bool trans_swea(DisasContext *dc, arg_typea *arg)
@@ -978,14 +982,14 @@ static bool trans_swea(DisasContext *dc, arg_typea *arg)
     return true;
 #else
     TCGv addr = compute_ldst_addr_ea(dc, arg->ra, arg->rb);
-    return do_store(dc, arg->rd, addr, MO_TE | MO_UL, MMU_NOMMU_IDX, false);
+    return do_store(dc, arg->rd, addr, MO_UL, MMU_NOMMU_IDX, false);
 #endif
 }
 
 static bool trans_swi(DisasContext *dc, arg_typeb *arg)
 {
     TCGv addr = compute_ldst_addr_typeb(dc, arg->ra, arg->imm);
-    return do_store(dc, arg->rd, addr, MO_TE | MO_UL, dc->mem_index, false);
+    return do_store(dc, arg->rd, addr, MO_UL, dc->mem_index, false);
 }
 
 static bool trans_swx(DisasContext *dc, arg_typea *arg)
-- 
2.45.2

