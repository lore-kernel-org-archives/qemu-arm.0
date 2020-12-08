Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4244308lfb;
        Tue, 8 Dec 2020 10:16:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw53C7RXOSlGnD5FB/JYrrlZ3M8hGknRtkYatBIm9BKWhfzWc9v2R5cTVSGUJ7wYkdDAW08
X-Received: by 2002:a25:8401:: with SMTP id u1mr33113862ybk.96.1607451408835;
        Tue, 08 Dec 2020 10:16:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607451408; cv=none;
        d=google.com; s=arc-20160816;
        b=z+0vt//mIYjSwcv7Mf1AgvUWb1ygAq2t9Op7GY4EyHlIGvmR/YpMIdlkIAKxgLmeX5
         p7vyGBn4r+ge+T9+f13BgelXt21eof+avdpQS8mjJy46HDLdzc+Ec5fx/JELBYPfKKjF
         /Zm1R/tV0neaPhXHXmTZgxtTsfNdQ4jrv+w6yMCymlmQhl/bsM7wBTgUW5oV7yINYPi/
         8RAeybfIcwQFnNGnt+B7l1DX/NOmDEnndc51rU30j4w7MelNBmkd4+d1e2EK7chYMTNZ
         f/5H1Ft4NAWrKIkJVF9Q2z3KEcj4nmbsJY8ypH0l6TQ46Yvm4+epCeYb82Brm14KPUZk
         TeTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kG55pxrRqXSzKnfpX7pLeFgoSMBsIFropfupWBTNCJw=;
        b=g765EMdZk2BWSxF6e+R0CL1HPKtvMXtRZ8jZnzTD8NIArnHSp9/S4YrWNg6/4sgAly
         Vx1qZJeYKC12mFfGNfl3LOPtuGaoTT46hJFckPS0jzwRSD1x189jIl6NBmPxIcT+bOIM
         ueYXyo7hWsf7nagbztBt9z0cv68fhG9rKdO+zgQpz0xjUKK4dtoLyxtVqS8ApwtzHKEt
         tZtjxWXmYhooFTOIQqkvu12LxSn3UFQTek7+yfUgsuQxQsV+GAJCVo5hKukipzMhAOWX
         g62hcYLHM5uUEh3MP+ExulJh6paIjkd7C9rkP0Zt1vuVztGRopcRj5j3UsAA0aq8RmEP
         h1Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tbKX9hIr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v15si13090082ybp.394.2020.12.08.10.16.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Dec 2020 10:16:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tbKX9hIr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmhXc-0004eg-4G
	for alex.bennee@linaro.org; Tue, 08 Dec 2020 13:16:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJB-00082C-Sq
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:53 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:38727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJA-0006PL-7B
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:53 -0500
Received: by mail-oi1-x241.google.com with SMTP id o25so20326964oie.5
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kG55pxrRqXSzKnfpX7pLeFgoSMBsIFropfupWBTNCJw=;
 b=tbKX9hIr7R0lWf+3O9wWFcrI47ZhEKNwLWRWj2R4dfUdgKwJqUd9S+DO9J40bff/5Y
 3253CmSjxnCwVw5LVvGvgq52kgwpU+xsStD/OOZS4J/HQTbu1uoIWS+aNsfDyOr7MAcc
 Jd5Xxbmgmlq5dnIFI/WFpfjaCZk9OdyvHdjhFt6BZ9xm56MTya8YHyaa7NGMVkkqb5/I
 Tqqg6LJhBsHjxwhxcoBB72fKkEfG7/GjHM5glcRMQQSR0lnSTNwX9tgE5joj8yv/vH1j
 CyKKFYCa38CzBP6O01+fWv8ucVtsfJ2PrwcxA4vCBIYyFzx4WOHt49A4mJKzkqPQcxLZ
 WUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kG55pxrRqXSzKnfpX7pLeFgoSMBsIFropfupWBTNCJw=;
 b=PGSuzIPkjIEGyF6soYCl9zETMtcQIznFsk1eCzVi/GmSvM9nNsSzLcVSl8fszuYaYv
 x9qY3wlWxVVddk2ZKQHqXu6dnB4zhShnWfVukpbo0i0+nM9MiwV9EcxbeKG2Z1uZmAYq
 kBJhCgdSHZ4/3kkVG2EImF/pIMGsFGcfWiitg8AYPjr00kx9KTGyvbd2jI/opLUl/swX
 R+rKTOFdAqUHtON5l5WJZYFDfj3RA8XDe4wbf7WhjyD58J/Zl30qRxcN7QQUTQ6xHqtY
 MraDX9MruZWrcWnzNjPxvvTSMrD3jLtpVxkl1H0MfJwfmFM8yr7W+4vFQl1KL8LRGgm3
 BuZQ==
X-Gm-Message-State: AOAM532lq1Y9AL7G7uSwt+IDpQZkzh3PjIb7Vj3eAqsSQnm+xzvNFuz0
 nKgSgG4gW6R22CEongsdr6Zbz4FhFqNqkNpA
X-Received: by 2002:aca:4ec9:: with SMTP id c192mr3760362oib.115.1607450508366; 
 Tue, 08 Dec 2020 10:01:48 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/24] target/arm: Enforce alignment for VLDn/VSTn (single)
Date: Tue,  8 Dec 2020 12:01:10 -0600
Message-Id: <20201208180118.157911-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jGZ7XOXn4fIQ

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-neon.c.inc | 48 ++++++++++++++++++++++++++++-----
 1 file changed, 42 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 4dab01ae18..3a9ea3a0bb 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -611,6 +611,7 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
     int nregs = a->n + 1;
     int vd = a->vd;
     TCGv_i32 addr, tmp;
+    MemOp mop;
 
     if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
         return false;
@@ -660,23 +661,58 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
         return true;
     }
 
+    /* Pick up SCTLR settings */
+    mop = finalize_memop(s, a->size);
+
+    if (a->align) {
+        MemOp align_op;
+
+        switch (nregs) {
+        case 1:
+            /* For VLD1, use natural alignment. */
+            align_op = MO_ALIGN;
+            break;
+        case 2:
+            /* For VLD2, use double alignment. */
+            align_op = pow2_align(a->size + 1);
+            break;
+        case 4:
+            if (a->size == MO_32) {
+                /*
+                 * For VLD4.32, align = 1 is double alignment, align = 2 is
+                 * quad alignment; align = 3 is rejected above.
+                 */
+                align_op = pow2_align(a->size + a->align);
+            } else {
+                /* For VLD4.8 and VLD.16, we want quad alignment. */
+                align_op = pow2_align(a->size + 2);
+            }
+            break;
+        default:
+            /* For VLD3, the alignment field is zero and rejected above. */
+            g_assert_not_reached();
+        }
+
+        mop = (mop & ~MO_AMASK) | align_op;
+    }
+
     tmp = tcg_temp_new_i32();
     addr = tcg_temp_new_i32();
     load_reg_var(s, addr, a->rn);
-    /*
-     * TODO: if we implemented alignment exceptions, we should check
-     * addr against the alignment encoded in a->align here.
-     */
+
     for (reg = 0; reg < nregs; reg++) {
         if (a->l) {
-            gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), a->size);
+            gen_aa32_ld_internal_i32(s, tmp, addr, get_mem_index(s), mop);
             neon_store_element(vd, a->reg_idx, a->size, tmp);
         } else { /* Store */
             neon_load_element(tmp, vd, a->reg_idx, a->size);
-            gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), a->size);
+            gen_aa32_st_internal_i32(s, tmp, addr, get_mem_index(s), mop);
         }
         vd += a->stride;
         tcg_gen_addi_i32(addr, addr, 1 << a->size);
+
+        /* Subsequent memory operations inherit alignment */
+        mop &= ~MO_AMASK;
     }
     tcg_temp_free_i32(addr);
     tcg_temp_free_i32(tmp);
-- 
2.25.1

