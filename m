Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp261247njb;
        Thu, 27 Feb 2025 06:32:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWwzuLeXdnGAwgX7j235kwR9Zt0mSxDi/uIOJV47/b9cq9xeg+SdqYPkXehjskuPAnxuxim5OPTVnd3+A==@linaro.org
X-Google-Smtp-Source: AGHT+IG9ImfqnPDlKkMbC1t6GXQyPJFJ1ApANhR/+iKiToIGiMofFVwqPogOIeBAWZMHZadHn69G
X-Received: by 2002:a05:6102:3581:b0:4bb:baa0:371d with SMTP id ada2fe7eead31-4c01e30721fmr4301497137.24.1740666762276;
        Thu, 27 Feb 2025 06:32:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740666762; cv=none;
        d=google.com; s=arc-20240605;
        b=EVYkiKERz3bWoZ/WaQUF4v0g5YnOJqS0HNEQ+rPKZcSuUpQGAbgKbySrnSkD8lIDvQ
         3e/0sPY9vcLtWMgAZT3hpnFsjEw0e+6LasfAAxuME6QnqAnyeHLjKPznTQMIz9gFW2N1
         erKvRB53nRXlnN5zkZQVU3/SmJrQduB24IWzRjjjA0TiF3bLW8bazbz5qT5d2p9Is4tp
         bvHWtiPtu5cUfunQIpcrdVNpxT06MuVbYRLcwpRL825vFNrdaLO0vRkXseyxGqvU12Sy
         4/NWXU3mv799STwILQzV5xvI38wLtUh98ehfzbsJ5ffquoIKcUFVKysRD2aKz8O+ZA7l
         6bMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wGTNFxYDOBY5OQaGDmBAuOxvbJwhsg8/Ld9YxzxYgfA=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=CxsCqz8Q1Konj/gYdTo8ifGcseBkWQJsWfutUJzxqlw7AMke001iOKBQ+TwWxNS6QB
         dpuT+0Wg+b8gi/YjZsDiDM1Ij08i/YB+kPShyINu0XYoxBa93gPAd8mP87f64QTYD0DL
         1fiRyxYHG2ko2/tuVJiutj0pKfkzd3xEQo51NQwTupQyTfH1gsPmYi+cV/keqvZH8Tz2
         P2jG8PfRrA2OBTLDZJY3UbJZiIF6qymEOKxUdiliOkl5RlEoAEUR8DrFLAZv1Io+ePSM
         GHsRL5Ru7mBh/FMG+c7/I1un9TX2R890naLuNCfRldK8U3DZnE7O58za97fkmVQxdToA
         N33Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N13qwBjX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c0347d9ca2si237639137.298.2025.02.27.06.32.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 06:32:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N13qwBjX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnerr-0005nk-0q; Thu, 27 Feb 2025 09:28:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tnerk-0005Mc-Ck
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 09:27:56 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tnerg-0004us-NA
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 09:27:56 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4399d14334aso9726125e9.0
 for <qemu-arm@nongnu.org>; Thu, 27 Feb 2025 06:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740666469; x=1741271269; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wGTNFxYDOBY5OQaGDmBAuOxvbJwhsg8/Ld9YxzxYgfA=;
 b=N13qwBjXmsDZtvx1sLihLtLTN39Kmc2gvV5e4OwAN2+vGPXMQ/kxb/khIbVR58JI6H
 VzUWealKNoY1FELiFLX9jrZQtMaPORVlrjIBYAlCGcW8b48xcqYG3a+w80egHM9O7IR4
 mAKMA46X0BiN/8QvLiK/mmrem9i2QDA/hjkR2lphRH2bIEdFSmj4ChMpMVwMbAEFKWlD
 Gvlsos2LoE8FhYFLL0n3585W5w4xwCqVcOzCTqDsnJPKOMddF3pryP9JcZf36ZWk3hJz
 R8nPHm8AvegicmFJiaJXc0xro+1kX1hRyUnnV/Rd5MYXDsFRReHhcLmFD2UlOSc1x02P
 Ce3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740666469; x=1741271269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wGTNFxYDOBY5OQaGDmBAuOxvbJwhsg8/Ld9YxzxYgfA=;
 b=e3M8mXTkwke1npIqILx2SyFR54n+NdBkIdr2dQ6nEl4p3oBq5Z0ok6MNtc8EOnLtei
 PCd1zSSCPEwDVeYyTh1AhHuCB8cjprhAvPzDWeD4LDycZ/gA5w0LajLsos3FGJFyl6HD
 LByEvwlw2UrIryj3x+G5fcYmAP8Jz3OVmKyhoh/RK8DH9iBP132vhO5i79XDwUqxlJRC
 uX4FWMrtUrphBA8H58es7QdSVlmqSI+zMpUcJK8ucCEGbuht8OhZLLLTEjgiAmhCQGga
 uO3MxfCN4WhDzbtInEsoQKvS3orD2MlY1f5J40mV08cO72tVl4iuFPcfmSTjNQy1m6Ux
 C77A==
X-Gm-Message-State: AOJu0YzvijGlI9M+nkxriktyG2NuXrFbWAWc7sIhYjLswWeF8pl7f9be
 dyNvQ6SimBmcRpKow1li6QCWF4mN+Dsvecxvrv9SewjDV0lnaFo46p2JfzTpSTa72+fIckEq0yA
 I
X-Gm-Gg: ASbGncspxHWYqFrIrcb0fNWn5aQCoQOznhnyh4CRozof5Ss6C5OaHc5HofFsghPfRCL
 rrFTM9fQ1ipjeUagYSijOyxSDZ9OaRGUq7Gh8iCzqJcVnY4z12rpaALLaifr8VRqSUZfAcOattO
 NJFi1VgZ9fLLm69M8t/WsCPx+9mXVYqkg7H+lLN78QpD9ui7z6+qnQ5xg47Fb7rsk2ODAhHWhRO
 nb/3g3UDHczVrKIF1J/Ar1MFVs26MSLPyszoJz+enWHKhRovohr+91H0Xa13hbg1W0yLwqlpfNZ
 1HDlovfuUo41LiydAG5lcjqEbpoXN7j6
X-Received: by 2002:a05:600c:5123:b0:439:8ef6:5782 with SMTP id
 5b1f17b1804b1-43ab8fd7acemr72056025e9.10.1740666469262; 
 Thu, 27 Feb 2025 06:27:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba532b8dsm55968335e9.14.2025.02.27.06.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 06:27:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/3] target/arm: Correct LDRD atomicity and fault behaviour
Date: Thu, 27 Feb 2025 14:27:44 +0000
Message-ID: <20250227142746.1698904-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227142746.1698904-1-peter.maydell@linaro.org>
References: <20250227142746.1698904-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 9taDyGRyxidb

Our LDRD implementation is wrong in two respects:

 * if the address is 4-aligned and the load crosses a page boundary
   and the second load faults and the first load was to the
   base register (as in cases like "ldrd r2, r3, [r2]", then we
   must not update the base register before taking the fault
 * if the address is 8-aligned the access must be a 64-bit
   single-copy atomic access, not two 32-bit accesses

Rewrite the handling of the loads in LDRD to use a single
tcg_gen_qemu_ld_i64() and split the result into the destination
registers. This allows us to get the atomicity requirements
right, and also implicitly means that we won't update the
base register too early for the page-crossing case.

Note that because we no longer increment 'addr' by 4 in the course of
performing the LDRD we must change the adjustment value we pass to
op_addr_ri_post() and op_addr_rr_post(): it no longer needs to
subtract 4 to get the correct value to use if doing base register
writeback.

STRD has the same problem with not getting the atomicity right;
we will deal with that in the following commit.

Cc: qemu-stable@nongnu.org
Reported-by: Stu Grossman <stu.grossman@gmail.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate.c | 64 ++++++++++++++++++++++++--------------
 1 file changed, 40 insertions(+), 24 deletions(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index d8225b77c8c..e10a1240c17 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -5003,10 +5003,43 @@ static bool op_store_rr(DisasContext *s, arg_ldst_rr *a,
     return true;
 }
 
+static void do_ldrd_load(DisasContext *s, TCGv_i32 addr, int rt, int rt2)
+{
+    /*
+     * LDRD is required to be an atomic 64-bit access if the
+     * address is 8-aligned, two atomic 32-bit accesses if
+     * it's only 4-aligned, and to give an alignemnt fault
+     * if it's not 4-aligned.
+     * Rt is always the word from the lower address, and Rt2 the
+     * data from the higher address, regardless of endianness.
+     * So (like gen_load_exclusive) we avoid gen_aa32_ld_i64()
+     * so we don't get its SCTLR_B check, and instead do a 64-bit access
+     * using MO_BE if appropriate and then split the two halves.
+     *
+     * This also gives us the correct behaviour of not updating
+     * rt if the load of rt2 faults; this is required for cases
+     * like "ldrd r2, r3, [r2]" where rt is also the base register.
+     */
+    int mem_idx = get_mem_index(s);
+    MemOp opc = MO_64 | MO_ALIGN_4 | MO_ATOM_SUBALIGN | s->be_data;
+    TCGv taddr = gen_aa32_addr(s, addr, opc);
+    TCGv_i64 t64 = tcg_temp_new_i64();
+    TCGv_i32 tmp = tcg_temp_new_i32();
+    TCGv_i32 tmp2 = tcg_temp_new_i32();
+
+    tcg_gen_qemu_ld_i64(t64, taddr, mem_idx, opc);
+    if (s->be_data == MO_BE) {
+        tcg_gen_extr_i64_i32(tmp2, tmp, t64);
+    } else {
+        tcg_gen_extr_i64_i32(tmp, tmp2, t64);
+    }
+    store_reg(s, rt, tmp);
+    store_reg(s, rt2, tmp2);
+}
+
 static bool trans_LDRD_rr(DisasContext *s, arg_ldst_rr *a)
 {
-    int mem_idx = get_mem_index(s);
-    TCGv_i32 addr, tmp;
+    TCGv_i32 addr;
 
     if (!ENABLE_ARCH_5TE) {
         return false;
@@ -5017,18 +5050,10 @@ static bool trans_LDRD_rr(DisasContext *s, arg_ldst_rr *a)
     }
     addr = op_addr_rr_pre(s, a);
 
-    tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
-    store_reg(s, a->rt, tmp);
-
-    tcg_gen_addi_i32(addr, addr, 4);
-
-    tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
-    store_reg(s, a->rt + 1, tmp);
+    do_ldrd_load(s, addr, a->rt, a->rt + 1);
 
     /* LDRD w/ base writeback is undefined if the registers overlap.  */
-    op_addr_rr_post(s, a, addr, -4);
+    op_addr_rr_post(s, a, addr, 0);
     return true;
 }
 
@@ -5152,23 +5177,14 @@ static bool op_store_ri(DisasContext *s, arg_ldst_ri *a,
 
 static bool op_ldrd_ri(DisasContext *s, arg_ldst_ri *a, int rt2)
 {
-    int mem_idx = get_mem_index(s);
-    TCGv_i32 addr, tmp;
+    TCGv_i32 addr;
 
     addr = op_addr_ri_pre(s, a);
 
-    tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
-    store_reg(s, a->rt, tmp);
-
-    tcg_gen_addi_i32(addr, addr, 4);
-
-    tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
-    store_reg(s, rt2, tmp);
+    do_ldrd_load(s, addr, a->rt, rt2);
 
     /* LDRD w/ base writeback is undefined if the registers overlap.  */
-    op_addr_ri_post(s, a, addr, -4);
+    op_addr_ri_post(s, a, addr, 0);
     return true;
 }
 
-- 
2.43.0

