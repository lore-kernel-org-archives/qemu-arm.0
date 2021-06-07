Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3687551lfa;
        Mon, 7 Jun 2021 10:15:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJya+UV0ozQpmAhX7a1MhqGcYiBdgV7btQQN5FPzbPDVfAE+oKUmo1jCtv6FsSe44HVpXHyp
X-Received: by 2002:a05:600c:1910:: with SMTP id j16mr17658616wmq.39.1623086134504;
        Mon, 07 Jun 2021 10:15:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623086134; cv=none;
        d=google.com; s=arc-20160816;
        b=1LH5LU90+4uIiBVg7YhxPHhOM0HotiLzOlP2Wzh1w4YAukIaICa7YxGELmrriZCiHH
         WesKCfV9VGl83W6QWfJR6MEy68y/Rnrs8E8iuZHPrQsmvXmd38sNTNdhBB4hQF3SIUE8
         R5+OTWK7GbPJIQKhnlxtlBc0JmJYvMV3nmkWVup/s2/rAyQSp0X1X6diHmgt1fpVkwrp
         PaBEZCn7HVBsSenecV68V5KlZTyjflxru+lY2lPxktRBQMbf3GJs24QjgRdt8qILJ9JF
         7ukXlhVu70or9a5Tg0kWhDW8tVa3kfsFiHIoXbDnvaMG0Rmb+2uNYaUKAHVRWJnWfEW8
         byyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=yIO+GTjjJFTfowgWAGdpZDjVj4UT+8w5uZyCGycr9fY=;
        b=s8URBNKmvSiDUe/k6JW7WpLt13KCnxCF5g0qQm30/p0X6mCeFUUyam8RvfQ6+CuhHU
         iXTGy4rh1+PwLK/5yBUHkQFLyrOC+cXr5qeTyrLeL900bBrVpyUHIBqpakuGxjjCfdFc
         8SYvnTp6LG0K6bgUQ9arxNXuxPWFXbhlQHfkA0cyDzNFIpG6drfKGCanMf/mumNbK7EK
         7PbNJ+1ShF9MyVjnEfb7ImI7MnEaf+FJs6qNG3ssTYhXLhmM6dOenG5Y6ry1OXtp4WvK
         dWz6NoDdZoZg3sOBpdgeX2GA2JALrbA6ti+Hxm57FQcEnWToATiu+/82Ha1cyzdYLUM1
         I7QQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wkj+sKHH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4si5306275wru.14.2021.06.07.10.15.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 10:15:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wkj+sKHH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqIqb-00038E-IP
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 13:15:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIb2-0007u4-2j
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:59:28 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaX-00082o-0L
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:59:27 -0400
Received: by mail-wr1-x42f.google.com with SMTP id f2so18391916wri.11
 for <qemu-arm@nongnu.org>; Mon, 07 Jun 2021 09:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yIO+GTjjJFTfowgWAGdpZDjVj4UT+8w5uZyCGycr9fY=;
 b=Wkj+sKHHq5bWGaInTflCFuQzdIoV8qb5b9gEhttXqCrcF0/U7wSqh3HlOdDYIx1Rsp
 /xEOF5YdLtw/y/yw5o1CaQb+AuICWwjDPy99KI9eKqNllxsvXSXo2eOH/tVpLLazdsrM
 KbvyiRVaFedAq/t34DtT0AIywxI3qYzCnNR2QlJubYlPgVO/Oon7AINkUpgoZ84hJehV
 kStqW5dsevZr8v1WT+FLmqUW0o2iRpg757hyOv+1Eis7VczcqhhLV9i5AKnb1Q4ZzVX1
 dSPpUgZh3AOfAoB+dkAodrmbNHx20tWM5iAJ00sRGAuAaml5rUzm/nBbjOZliLQC3/vI
 il0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yIO+GTjjJFTfowgWAGdpZDjVj4UT+8w5uZyCGycr9fY=;
 b=gdMeK1/zzUlnI/RRd8PiPcgb3bjcGaEUV7lKgZejWw9kM9EuF8asHayhSumyd6Ecl/
 FkaSYijCOmDo3PKAQoCEsLlZbvUe2EaB2cX7pZrnOA7TWd0XL/UIn6mw9SGhGBsrlVnr
 W073FauLsxh7euzoOV5Rc/POa8BFp7d4jYlgDWsVQCiep+9vA1Qd0e19u4ilhb+OaogF
 pyXibxHsSYG68jEbhk9CeCm7W5hxxV8zgOBnZ/xuCuIouM40GcuUgSxnV5Rt85zs5+uz
 rIYrfQbWo7PFTOpIdXAtFGtLvR9BNvxRTznBxJd2QmBSUjW+O0xuLN4wA902eNcoS5mm
 UbdQ==
X-Gm-Message-State: AOAM531J/gmaHchXhZQdRgSTLUtQKkq6rF+U/ikG4Rgd5OiKes1sGeB7
 2JDnBNjtfteU/YQe3fvRM5XQlb4REDlAAHl/
X-Received: by 2002:a5d:6382:: with SMTP id p2mr18889190wru.338.1623085132944; 
 Mon, 07 Jun 2021 09:58:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 37/55] target/arm: Implement MVE VPST
Date: Mon,  7 Jun 2021 17:58:03 +0100
Message-Id: <20210607165821.9892-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TZSFWTXl36dZ

Implement the MVE VPST insn, which sets the predicate mask
fields in the VPR to the immediate value encoded in the insn.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/mve.decode      |  4 +++
 target/arm/translate-mve.c | 59 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index a3dbdb72a5c..e189e2de648 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -168,3 +168,7 @@ VHADD_U_scalar   1111 1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
 VHSUB_S_scalar   1110 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
 VHSUB_U_scalar   1111 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
 VBRSR            1111 1110 0 . .. ... 1 ... 1 1110 . 110 .... @2scalar
+
+# Predicate operations
+%mask_22_13      22:1 13:3
+VPST             1111 1110 0 . 11 000 1 ... 0 1111 0100 1101 mask=%mask_22_13
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index b7bf7d0960f..45a71a22853 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -588,3 +588,62 @@ static bool trans_VRMLSLDAVH(DisasContext *s, arg_vmlaldav *a)
     };
     return do_long_dual_acc(s, a, fns[a->x]);
 }
+
+static bool trans_VPST(DisasContext *s, arg_VPST *a)
+{
+    TCGv_i32 vpr, mask;
+
+    /* mask == 0 is a "related encoding" */
+    if (!dc_isar_feature(aa32_mve, s) || !a->mask) {
+        return false;
+    }
+    if (!mve_eci_check(s)) {
+        return true;
+    }
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+    /*
+     * Set the VPR mask fields. We take advantage of MASK01 and MASK23
+     * being adjacent fields in the register.
+     *
+     * This insn is not predicated, but it is subject to beat-wise
+     * execution, and the mask is updated on the odd-numbered beats.
+     * So if PSR.ECI says we should skip beat 1, we mustn't update the
+     * 01 mask field.
+     */
+    vpr = load_cpu_field(v7m.vpr);
+    switch (s->eci) {
+    case ECI_NONE:
+    case ECI_A0:
+        /* Update both 01 and 23 fields */
+        mask = tcg_const_i32(a->mask | (a->mask << 4));
+        tcg_gen_deposit_i32(vpr, vpr, mask, R_V7M_VPR_MASK01_SHIFT,
+                            R_V7M_VPR_MASK01_LENGTH + R_V7M_VPR_MASK23_LENGTH);
+        break;
+    case ECI_A0A1:
+    case ECI_A0A1A2:
+    case ECI_A0A1A2B0:
+        /* Update only the 23 mask field */
+        mask = tcg_const_i32(a->mask);
+        tcg_gen_deposit_i32(vpr, vpr, mask, R_V7M_VPR_MASK23_SHIFT,
+                            R_V7M_VPR_MASK23_LENGTH);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    store_cpu_field(vpr, v7m.vpr);
+    tcg_temp_free_i32(mask);
+
+    if (s->eci) {
+        TCGv_i32 eci;
+        mve_update_eci(s);
+        /*
+         * Update ECI in CPUState (since we didn't call a helper
+         * that will call mve_advance_vpt()).
+         */
+        eci = tcg_const_i32(s->eci << 4);
+        store_cpu_field(eci, condexec_bits);
+    }
+    return true;
+}
-- 
2.20.1

