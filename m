Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1530762ejb;
        Mon, 5 Feb 2024 19:06:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVKoqb/ph5DYR0lre63szaTPz96x4A6nil2QfucSPi2mfOLUEPtdy6E/RUrm64izGeeyiI
X-Received: by 2002:ad4:4ea1:0:b0:68c:8904:69ed with SMTP id ed1-20020ad44ea1000000b0068c890469edmr1099934qvb.39.1707188787235;
        Mon, 05 Feb 2024 19:06:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707188787; cv=none;
        d=google.com; s=arc-20160816;
        b=uXCJm+4pewRkWPZbMCzhVonFnQUu3MDOT1ulUr2qGgyaWISd88vNh1H9y402IoSle/
         eltLQJCIgujgYAj1Z6dn9U2nH6lIKRfqJREZAMQgLoT+PmkRJCk3ru9hHkqNMM0RZRd9
         J+1eTw79+qZzg/i4zRkDpbVfCQtFAWk5v2D114a02d9n3p20VNwjNj4j+OcHj8/3h1um
         8qEsOSFHcNWi7T7haz3MBy6pkGV6nEPM0UkyGN2XYtqbiB2pzu4zV8Rvzq8gOejLdPao
         JbaoogDXFAFnS7BqOluvTGWGBoPQonBcl5XA8nrhHngU+GmzQMP/DeS8Kh0qI0pnlPfy
         rRHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yC+4P563DsZNTw7wqbYKpYbLga9F+4Wqkz2IWu6n9xI=;
        fh=PO1DyE1+WJ3YBIewot30hSADjcdTiyeD2wsuYkyKfsA=;
        b=iuAxXcxcgBWE1JZYmVMj+peEqQYyqDd0VMLv5AbATJela4tEuFzofLNbL5QXs2FFAs
         W2/3vfAl7D3dBD27loF/wje/jRyxunBDDhKoejRS4gH4Qi62kNL5XzUO+FFcFDS1czPc
         cFGY+TpPLbxmvxSv2IcvoHjEX/paBh979jnoUHiiS+HTzDac32JMVK05FLBMYCY70+Jl
         2pbB06KvjDnTf5BozTC4y9mQVZJPAhIBDV27n21tP2bkIW51oE46Q7RrJrndkZqealn1
         eHQcWIrjB88NxG9tXANCzFjG3O5PvJ+EMRWKiWHfsrSMEzSH/2/VstEzKVmAneSPnnpZ
         m1fQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gFQYlEUP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCVsDcm8lKT5H8cy1gbprUgtxJZJ4oBF/rs831enxL3JuZLxnNLKlw4s+JH6AcEcOHu6+OpYZurQpNh13IlndJ2vYOYV+MWr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 13-20020a0562140dcd00b0068caf92c1f2si1319014qvt.379.2024.02.05.19.06.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Feb 2024 19:06:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gFQYlEUP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXBmV-0006vb-6L; Mon, 05 Feb 2024 22:05:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXBmT-0006u5-UY
 for qemu-arm@nongnu.org; Mon, 05 Feb 2024 22:05:53 -0500
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXBmQ-0003JV-8u
 for qemu-arm@nongnu.org; Mon, 05 Feb 2024 22:05:53 -0500
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-59a87156cb8so2241091eaf.2
 for <qemu-arm@nongnu.org>; Mon, 05 Feb 2024 19:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707188746; x=1707793546; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yC+4P563DsZNTw7wqbYKpYbLga9F+4Wqkz2IWu6n9xI=;
 b=gFQYlEUPshr90p4OKmJo83C8pc60irNBVtFRAtgWlzFuk7FgfBk+ugu/Vqq+wg0NI4
 acCs/W0vaaYi4iNE3RgfZQeLnR+uRbjdJPwKCa2YKQuRHP55XdN7IXcB0HAgDMHBFmH0
 xIsYDMeJTPn59yduJ5gGk/8gWnUsgyTqcs0L4M4vATrVeGeY/m3qm2xmC+/JTzzntTJS
 ea+ASGQi3sNFakiyZtJlDEg+S8N5QuAQ+fvqMOa4851+z1aCxRsW4qIVzKzVPMBXYaNX
 hEGXtr4bEahUj9tYsSKFtFkZ+ySEySAYnpzYRKAAeNImJLfXbunfYFDvuFapFElKztzT
 xcfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707188746; x=1707793546;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yC+4P563DsZNTw7wqbYKpYbLga9F+4Wqkz2IWu6n9xI=;
 b=o+HvDHAtuhOa9aaaBhPj8IdFsINHtiP2+A42VdClWZh47Vag6kGKxjMDMI/u3eCcuZ
 mmeQWLvVihDurJ9PSk4InxrLfe8GL+lPFEmUaXZg/OxPENZbOudCa62xFJ2gdeITbUow
 hR15q5QZ38likifGcMTVw/DZ6mRwB0ezjVjzBFZoPYI9A1EhTFom1/7nMqP5MgfTZ1Nt
 M5G42GTeuK6OvLvNkof4TZ53epK6juH4rD0zxj5wIpGVPYb2dkCU17KbKzLdFWqdzUeW
 WLDmqq40sH23GuK+j6nzKMWGW2wM12P7RnfAu7LhLM6dxfQ0vspaZ9bNpgpfh5RjIuu8
 P4Nw==
X-Gm-Message-State: AOJu0YyjOBm3n2h/C0uZQpfpG1qhBAhuvm3wZ7l59RfJunUAX4URVv+t
 7W5cHvsmxB3cxhD3ygRYdf7YxSIr6Qe6hY+15bY/SBB46PspNuBwR7jG7+KX9/k=
X-Received: by 2002:a05:6358:6f9e:b0:178:7542:1a58 with SMTP id
 s30-20020a0563586f9e00b0017875421a58mr820386rwn.7.1707188746651; 
 Mon, 05 Feb 2024 19:05:46 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVupFAc3S9Ph9dOV598Sicdx/GHQn2Bi7SByxZ5wmF7/RWpd2Lrz5Q4r51TGWO8oq9ckccmN7vEhI/WzVKgFQDHK2KpvG4FKLZc
Received: from stoup.. ([43.252.112.200]) by smtp.gmail.com with ESMTPSA id
 r14-20020a62e40e000000b006e025030700sm627478pfh.190.2024.02.05.19.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 19:05:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH v2 5/6] target/arm: Handle mte in do_ldrq, do_ldro
Date: Tue,  6 Feb 2024 13:05:26 +1000
Message-Id: <20240206030527.169147-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206030527.169147-1-richard.henderson@linaro.org>
References: <20240206030527.169147-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: mUIEJwbHs59A

These functions "use the standard load helpers", but
fail to clean_data_tbi or populate mtedesc.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 8868aae5ac..fb3bcb47f6 100644
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

