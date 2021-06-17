Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp499536lff;
        Thu, 17 Jun 2021 05:39:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6BbbaeKc65aja+6zbkToDxkaziEmOZAkeGDx1Cao6hkY7nBbsWI/xKzpWVPMXx/PbiYF8
X-Received: by 2002:ab0:74c6:: with SMTP id f6mr4830539uaq.61.1623933554726;
        Thu, 17 Jun 2021 05:39:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623933554; cv=none;
        d=google.com; s=arc-20160816;
        b=pG9MCjMz/FyZ56/Ju9yQFZ3+OFtc2dCUL5ZI8u2Qz0AmCGF/lTRAfIKSOIqryv+3WJ
         9qUJTL31vxeRPzJ8op2Vk8a2HLaoBkleM6dibsxRtQHrEPlb0nkGZpLXMlGv7wfjbHPe
         mtesT7+b/OnbT57HEnj2AsHnfVIOGT+eMoa8cfNlvTXOmbd5UUj+h7UiWxcaurxCTo/t
         G7/msMUo9QJy+50alaVwmV7HV+AiII48z6l3dIxDUmtEh/+4S2nBpV+5igldU15/BnbW
         65C1EojKTONKo9RFp0yPC33TyisJWOS1ZGCakJ0aaOKlfi85AYx1zfZhNB8gnOXNCT/I
         55Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=y8x6e8psdt9Nr3HrIqUOKjKnbGNjkc+P2vhkC84gBmo=;
        b=rJxja6UxzIP47lg3oKIgyJq5LTEQQctYtuOiDCeY/1fkUOiPMS3CX3TDyS+/dktsJZ
         ENZAESC2/fT8OhMJ21BpbO8/5QOqjKwM9lCJglyNCrhe+Z+lnuMdLoKdXzU/7+JTystU
         dICsHdy7dPuframXqDftzhb6KFB7r9NjQj+stO5u5/iPLY+9UfAcWFHEjv2O8MMLXvwS
         uzSDbp1hLju4QBG3QgPmH3MscbQhSUzaw6lz7NPikSbhG5mLlrIyzX7LCl8AnAmf/M/2
         9++w42xxXab/5Pz2QALiHlMyDfAO7tr1TUU73d1+xqkILhhDo5ZM5Kv3FvlnU/8RgrY/
         h2kQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZVxv6fzb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11si3920881vsi.152.2021.06.17.05.39.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jun 2021 05:39:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZVxv6fzb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltrIf-0001i6-Ve
	for alex.bennee@linaro.org; Thu, 17 Jun 2021 08:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqxD-0001tW-02
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:17:03 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:52111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqx2-00077u-4K
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:17:02 -0400
Received: by mail-wm1-x32d.google.com with SMTP id l9so3301792wms.1
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y8x6e8psdt9Nr3HrIqUOKjKnbGNjkc+P2vhkC84gBmo=;
 b=ZVxv6fzbZOEan2VnVf8w/oh2PRim5Qq9A2Gw4MFZLNARc9/4gxLVu/vgTMqGAr+hU/
 DlkyMh3GfKMzV8L/J/y/42pcaYS47Nwgrxzpk2QyBviU7ZK+SAVsjOhlFbTakE9uZRGo
 aIxY6hgWcPRk2WYqi7j3u5oyDDb7dGQMSclIWhrlkz7ymnyPNtPtqjQWR9i23+Q7JG9M
 CXfF7Sv0VfNYBj/1Ry8I2dqTmBZHuFvOoZLa2eY+5HNcmz1WND+jP5RA3OUjnlmi5apJ
 gsXJSlv0LmwCf2HnFef7JuEKW/cML85neBYm3KB95UiXGjykSKd+WVWPDxhZZHE+ZI4z
 xhAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y8x6e8psdt9Nr3HrIqUOKjKnbGNjkc+P2vhkC84gBmo=;
 b=FpnJjLDgmeQ+HCvoAsn8w5e+ivogqyQsQwXoakJo2JeoX5cPk0GGD7KbHhk6X5rNtv
 175eRqtHVj01IxcC2nOhyf1NBVgR7ONrhu/84R9VM7JjkE3uddwPxixqnrjVLN96HGM6
 1ydnRuUkqcQO6mKyVghw8UiiVUXi17xhBby563d6M2UIdtMPmeC8Ds2HC0yaxwEnlZ9W
 36asjyVBsoSjFHQ4jjWvbqC/5zrZTeO2eQuzQ+iQs138t+Dv5R/U98YKF9/Eql3ZlYrr
 UsMHlhlHf37Ks+o+5lY2mKNvfQ6Eje4qr8C3ewHZCQ0Lzp6sSxQTadsNcQCYjXXBJbkG
 edrw==
X-Gm-Message-State: AOAM530iVmMvxRcB5MJRHL4eCofMC2GZUUw8M4giM4wTZdjw8XptYZB9
 qVv69x66oys664nC2eXGzbrqi6GkYYbq8A==
X-Received: by 2002:a1c:35c2:: with SMTP id c185mr4737581wma.126.1623932210627; 
 Thu, 17 Jun 2021 05:16:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 26/44] target/arm: Implement MVE VPST
Date: Thu, 17 Jun 2021 13:16:10 +0100
Message-Id: <20210617121628.20116-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f4Zw77RkzFeD

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
index 6320064a08d..7c4c06e434c 100644
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

