Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2082838lff;
        Mon, 14 Jun 2021 08:39:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJKJAUsYqtwBRmcWR1nbL4yCMu78Q16qf8mHUt4+8V/RynAmdi6HQ/4Fpjw7SfWJsa59cw
X-Received: by 2002:ab0:6646:: with SMTP id b6mr12376844uaq.1.1623685189435;
        Mon, 14 Jun 2021 08:39:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623685189; cv=none;
        d=google.com; s=arc-20160816;
        b=zDe8WWIvzsL0b98XE1APMtVhaMnUpaIondrPrush5jHn5ClaSDQUDAefiYO8gwWlGl
         Y7zmC47PAJno3CCFUtF4mGLjttryggGMQcYuUIHLkZxjyDqN1xNsoZQPLEhyi8DtcoT4
         uCVqiuvFD8Nvk5scpwzIuKbLduADoLOkN0XGjHa7c/9IuFQKYObuOEVsDoAgbt8Iad3D
         wJPN3VrS9XdCpp6P8TAQUhs4irvrY0oBXRHejzv8ooXsJoBJKIYfmcclhvwYhn7rT4Jd
         wJxyYQlHDiI8MEff1/GS3a2AORPp8acpP/ojmwJtUiVOCSuUpgyjeBe/oQij7Lt/Nldz
         gQbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=yK1q1HZeCjEqjRVAbK5tFtpYKErqos88vnz+vFLXl0w=;
        b=DS7mafo0j/k3pMAjQ95yMWzswNGwP6Mo0t5bFjHJggZF/2NFkSpnYirNWL+PGc7BKO
         /L88at4oEY6BJZxLXFeu8ylBDFT3imCF8ZXCCrQqi5rW2nI/VKljMGMGEHhSgqFsNlMb
         l1ZrN0MmUycE35dEC5Ky4icDc+z7++StNxbEvbnmYuTV2Al8fi9wRkooG8qOhiRq/ZVy
         aU48640NWGbMU1wRtUGpmqP5GUK+wFKrA9AHNZ7ZTRDjtBVtkNBlkJPeVbxvhAgLdquU
         KIj3YvT4L1YgJdN04tRLhJG7vkMAwls8CBFrBn+PDTuD0dhYod7iyDljhmNKOSQW78Dp
         +4gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FCq4qvD9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d6si6537106vsc.246.2021.06.14.08.39.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 08:39:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FCq4qvD9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsogm-0005H4-Nu
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 11:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEs-0001z5-KX
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:10:58 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:40509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEd-0000WG-AK
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:10:58 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 b145-20020a1c80970000b029019c8c824054so13302354wmd.5
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 08:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yK1q1HZeCjEqjRVAbK5tFtpYKErqos88vnz+vFLXl0w=;
 b=FCq4qvD9ANFO8KArmXMKEzLyT9zwAlWcBLfhbn8vfX220/VEBYk5+3OYRSGkfiTY1N
 y11hROptkiH8y/wMSiwBxTyn9yG55j1PZwiNaJiGwUOj5LS1QY+VvP9gQ3GY+Y86ekfX
 xXy/wij8+MCrYIQqSVJb8Um9bNMvBOiEh8KdOOU4srUX2glpl2B+bl8jCi/5eQmOLUuJ
 MhcwPd54ymf2CLkakhPvA+cVmGV3Lef65xvOyhhfbT2XngWFb6bM97hmcYlx6OW79jNC
 GuWW8qYWwHjIksto1WWJmvLxqn9wR1vfTHE1KAKSmpcTeupRooQr+dSe+v4yhyTq2CHD
 KbAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yK1q1HZeCjEqjRVAbK5tFtpYKErqos88vnz+vFLXl0w=;
 b=Ixtwl5Db8R7G24ocDlZWDdl4Lsn3JYoFj7AFzeUoTtPcHSW5FDYDrNhyXZMcAY2Dua
 b+kDK3Che5XstYcb59GKGRNy8icXzQjhPbdSqPZ7X3tfO+yq5BCbsqYP+1aSK4h2PTxF
 dkIQCnDdIKbXuBqsdtFrPC2Yw38U1IpNK+ZSMUSv7paLC4I8R/Z9IhL08FGlVpj9/3sP
 3VrSyM8Qq/aJ0UMIoDv+5cujtAxWSMOyhgx/kIOjip7nNom13/zcbZK3j3HGoAJt8VcA
 02zk4iRVfawrQxqqQfUDE15SeJnFtAWd24G/c9uypp80JDtyZ9rSgYmdgK7l1M7Yphmv
 wDkQ==
X-Gm-Message-State: AOAM532LubLwyYHODmfH5ENNLNrukzJGWpnJm7o1VONu+2iOwa+ljy0y
 S/GNMWs+Winvgd7NZzVsOUzxzgyEZLNT8A==
X-Received: by 2002:a05:600c:2f10:: with SMTP id
 r16mr16774861wmn.153.1623683441976; 
 Mon, 14 Jun 2021 08:10:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 39/57] target/arm: Implement MVE VPST
Date: Mon, 14 Jun 2021 16:09:49 +0100
Message-Id: <20210614151007.4545-40-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 8wNYUXGwDZhZ

Implement the MVE VPST insn, which sets the predicate mask
fields in the VPR to the immediate value encoded in the insn.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index 95e7c87be7f..4dc7400e33e 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -90,6 +90,19 @@ static void mve_update_eci(DisasContext *s)
     }
 }
 
+static void mve_update_and_store_eci(DisasContext *s)
+{
+    /*
+     * For insns which don't call a helper function that will call
+     * mve_advance_vpt(), this version updates s->eci and also stores
+     * it out to the CPUState field.
+     */
+    if (s->eci) {
+        mve_update_eci(s);
+        store_cpu_field(tcg_constant_i32(s->eci << 4), condexec_bits);
+    }
+}
+
 static bool mve_skip_first_beat(DisasContext *s)
 {
     /* Return true if PSR.ECI says we must skip the first beat of this insn */
@@ -548,3 +561,49 @@ static bool trans_VRMLSLDAVH(DisasContext *s, arg_vmlaldav *a)
     };
     return do_long_dual_acc(s, a, fns[a->x]);
 }
+
+static bool trans_VPST(DisasContext *s, arg_VPST *a)
+{
+    TCGv_i32 vpr;
+
+    /* mask == 0 is a "related encoding" */
+    if (!dc_isar_feature(aa32_mve, s) || !a->mask) {
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
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
+        tcg_gen_deposit_i32(vpr, vpr,
+                            tcg_constant_i32(a->mask | (a->mask << 4)),
+                            R_V7M_VPR_MASK01_SHIFT,
+                            R_V7M_VPR_MASK01_LENGTH + R_V7M_VPR_MASK23_LENGTH);
+        break;
+    case ECI_A0A1:
+    case ECI_A0A1A2:
+    case ECI_A0A1A2B0:
+        /* Update only the 23 mask field */
+        tcg_gen_deposit_i32(vpr, vpr,
+                            tcg_constant_i32(a->mask),
+                            R_V7M_VPR_MASK23_SHIFT, R_V7M_VPR_MASK23_LENGTH);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    store_cpu_field(vpr, v7m.vpr);
+    mve_update_and_store_eci(s);
+    return true;
+}
-- 
2.20.1

