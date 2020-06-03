Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp39560lfc;
        Tue, 2 Jun 2020 18:28:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCi8NvHvQQ/kTnxCmoVkc9XZwh2kjqBFblGpqYQ0JN1LVlW1dbYHvINnQnw2PZuYBaHeMP
X-Received: by 2002:a25:ac8:: with SMTP id 191mr45796215ybk.390.1591147683336;
        Tue, 02 Jun 2020 18:28:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591147683; cv=none;
        d=google.com; s=arc-20160816;
        b=SSvNM4LvqAc7t2uyMw7iNyRoOvi2iDAg+CKgtPAsXSv6McGOo9LILdI8+NMzBUg7gT
         0qCV7PGxx1enNw847K9NO4p2pbJdORhTf7DMwSO370MMR2TeWFe1eYtU9OYPtu7/HCN5
         iC1int/exdWnKlDePIkiFX0clUPOehXlv6udx34fr/8mOh8ekYewFmOAHuuE60ROKUsm
         rpx0UOpwRaVS27f8+bwpcPh92CBefOEcjFdd68NLEkKGYrjcsl7njK4T7cNvKaJ/VD9o
         Yq5ujRpRQlyTUIhJLVrmCREgYrCRqaXqKPk2kUhKBgjfjOp3kq0IJIKAvsfkgup27ULH
         SbGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pWh7eNrZJvFxR8a07fRLkGAKBH4kVqj8pF+Brk+xMxs=;
        b=nxsmpx7aETg0xcVMNDk34ZVGm0SPc5ZrilY42SU9RGoN6DJDIKR+UWlA3bB3jqV0tX
         6+DKtOndGDEMxgjcXrea1Tf7MgnuCa7I6spfdDnYgKxxcKodPgGGSl9zc9otCuI4vSSJ
         QaaNGHnjii2uB9UeMY0KDXqCcB0H+KDhf7ySaN28GYjAsoTioJmPPUDl98D6MRB6Bhnf
         bwvJJMDyGkyi+rUvO2xL7EuNLUG76zpNW8DTpdc4qe94s7oLS7fNTxDthFloQ2yGkZJ8
         VIHenfbPkJlSM6nKq9QLzYnfqOXmg81tULaf81pXfX9m35i/0cq2CDi6A9allPEhunuY
         Oluw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rScdcdAj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5si319143ybc.479.2020.06.02.18.28.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 18:28:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rScdcdAj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgICI-0005MG-Jx
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 21:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyj-0004eq-0v
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 21:14:01 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:35460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyi-0003er-4F
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 21:14:00 -0400
Received: by mail-pg1-x541.google.com with SMTP id o6so579821pgh.2
 for <qemu-devel@nongnu.org>; Tue, 02 Jun 2020 18:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pWh7eNrZJvFxR8a07fRLkGAKBH4kVqj8pF+Brk+xMxs=;
 b=rScdcdAj3DugLGCAQKLiAg8MS+a/2tstaPXr9iJGTKrRy1vDFsJ04ojQ6+lkyBQ7wa
 ZBKhT4THswXAuaibp2L+m8hr10x1bdCXQBZw5by3Fdy5ek5u/X5rUTAB+H4k9G+Yd6u8
 9xYXYrPEVPxTh3k0MAjSiACMVQE6UGxiods1lLys9fxWwfZGL8H99WTYtUR210/RansT
 aGEQoZmRTaP+7wtYJjJ8M7rHd5GhTtbfx+tdV6+HhytSNYCbTu0DfkrEreMd8d51nznN
 h+ZqlGvC701U1MkQ7eZisXJ1zK1vXyap0aw78joxQyszDUGdTUFurICYIcEzsjzyMdr2
 RYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pWh7eNrZJvFxR8a07fRLkGAKBH4kVqj8pF+Brk+xMxs=;
 b=fYoW1EjsGgLMTvkpL0bkpMYOiZvEW5J8JGQzetfkL0xxH96h4JNeGIqYwc4nZVHVrJ
 vy3YsqfgPidOWTTNf5jET57NcNgNPMOulX2vlQjlIYeBQLb95PYDEdaXfh/2+YvSGnFU
 ebqDRhr7kwgtmlq916pX3HnhisiLKUCvTTFL2iMnXgAW3h2NWdMpmQVXlohRpUXVIupn
 VjL8AgYbA6WAjM7HLc/dJVEH+ohEz/2NCNwfNkI5j5RrupT6iEIbKrcMY6rycguJTtGs
 +6HsCbKAhsz/z+3jwQ+7fDofl7AtRvWAbUT+xmw5DCpMlXrv6DcbScs6Ka4IweanlhKY
 NiaA==
X-Gm-Message-State: AOAM530liNeRZO+zNBFxcifoehnY8AtRs6OryHY0VVv0Od6zAwCfcKCE
 g8Q9SeJf9iWQjstBGGPoFBsO2X9ydLE=
X-Received: by 2002:a63:a84d:: with SMTP id i13mr25594284pgp.342.1591146838353; 
 Tue, 02 Jun 2020 18:13:58 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 3sm290067pfe.85.2020.06.02.18.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 18:13:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 30/42] target/arm: Use mte_check1 for sve LD1R
Date: Tue,  2 Jun 2020 18:13:05 -0700
Message-Id: <20200603011317.473934-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200603011317.473934-1-richard.henderson@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U2XsHz8nceuA

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e515646db2..4b3b879815 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4830,16 +4830,16 @@ static bool trans_LD1RQ_zpri(DisasContext *s, arg_rpri_load *a)
 /* Load and broadcast element.  */
 static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a)
 {
-    if (!sve_access_check(s)) {
-        return true;
-    }
-
     unsigned vsz = vec_full_reg_size(s);
     unsigned psz = pred_full_reg_size(s);
     unsigned esz = dtype_esz[a->dtype];
     unsigned msz = dtype_msz(a->dtype);
     TCGLabel *over = gen_new_label();
-    TCGv_i64 temp;
+    TCGv_i64 temp, clean_addr;
+
+    if (!sve_access_check(s)) {
+        return true;
+    }
 
     /* If the guarding predicate has no bits set, no load occurs.  */
     if (psz <= 8) {
@@ -4862,7 +4862,9 @@ static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a)
     /* Load the data.  */
     temp = tcg_temp_new_i64();
     tcg_gen_addi_i64(temp, cpu_reg_sp(s, a->rn), a->imm << msz);
-    tcg_gen_qemu_ld_i64(temp, temp, get_mem_index(s),
+    clean_addr = gen_mte_check1(s, temp, false, true, msz);
+
+    tcg_gen_qemu_ld_i64(temp, clean_addr, get_mem_index(s),
                         s->be_data | dtype_mop[a->dtype]);
 
     /* Broadcast to *all* elements.  */
-- 
2.25.1

