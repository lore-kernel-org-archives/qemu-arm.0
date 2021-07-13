Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp612234lfc;
        Tue, 13 Jul 2021 06:59:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTDskvzXk8BIa9GRLKFUsIuDOtfKVGQIfkssRUusGtEiIIAyds/IrOkupdxpVNHunrdiWj
X-Received: by 2002:ab0:13e8:: with SMTP id n37mr6002992uae.44.1626184780339;
        Tue, 13 Jul 2021 06:59:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626184780; cv=none;
        d=google.com; s=arc-20160816;
        b=UldY/OFXuXwkhTJbm+q2OohVh+Uv/FponihiGTV2ZlilV36XEp3F3jXqURZNhdBJ24
         Ehhhoghdd4Rwx/iQMx2Ah7CRj3sr2KcFbs9DEeBWiOMixGUZ8Gtc5AEjO8UHa55OXl7l
         lM6PLOHjdMpbONxYoMVJqvG93hbZ2adbo9lkqSQPu0pQt6b/eqP31eXsq4lGEC1eAKIj
         kXO90ji1b3hAgsRS45LzMX1MB+42Lk3RCFuWEUWTJIwGgxvvp4D915HpJ4FVNi15qHy8
         Fa968RV8N/KwDmhKn5CKo/YcaqmzDzkF2/kfovt+z4JYR0l1raKh0qfkKkgrdba+tTjP
         2nHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xdTiVrTGrjwqxBrVWc02ZyC5Zuxj4JEnIGJ5DSfl9U4=;
        b=Urj31Fky5l9yTVQe2wjBOG6HBn9YmCZ1S/c0KeLPkLwKav/1YNbsDTMyh1+lGTgBxl
         enxa3wMWtKz7Poabb5IeAI6yPtIT831WeGdXPhqgSQmS9vcxpHOUIM+oRkVq2mMaRIv/
         bOna4EAxMWr/UBn9dJO37T1EEV+YwGXiCLOLjrnD/ernX7bF3d8eu3C7AM00a5wKNnbC
         il0hUUeubMdjeKzsNwH76lNkE3GSfrUJFnpAsC7Z+6KI6zIpW4bIbfE6gWsyA/2jyhlW
         eZJSGRLa1VeVJmR0LNvUBm7kVzb6CmxMXKHeKYmk4D5PenHsCvE9kcd4mCDUdMfrEhJ4
         fZIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AXeeUJfe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j22si18047947vsg.331.2021.07.13.06.59.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 06:59:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AXeeUJfe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3Iwl-0004Jf-Jo
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 09:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibs-0000Rj-7b
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 09:38:04 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibi-0003q6-JY
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 09:38:03 -0400
Received: by mail-wr1-x433.google.com with SMTP id k4so24198005wrc.8
 for <qemu-arm@nongnu.org>; Tue, 13 Jul 2021 06:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xdTiVrTGrjwqxBrVWc02ZyC5Zuxj4JEnIGJ5DSfl9U4=;
 b=AXeeUJfeCTahTk0Hs73SVfHTU3+XXQffQhq6aAS4UwsRCaCxnCXzeCQgCp8gZZ+Gkf
 bC55Qcx3c4lwH5PLeRJniY5IMp2RrANCfDv4Y08EmaUlSCw73xzTV3ga0gGyEdsWRtn5
 /b1D0b7HKTYgZCOCMh0EjoWTeOgN1R8pl10X9jdwS6B/eHp1gTKn+8dzmA0axYfFI8A0
 yXVtZJGsVYqyS2y+BztJ125ZUAejHKkSYrIbClWXpM93Bvxy5I6SBSvzkZc7gslhwGqk
 eYKc8Fn8FbQWG8tGKgoTZ15a7WAi1kUaidzG6trDZTL217/Wrm4akrGnX5mto2s4Fb95
 vTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xdTiVrTGrjwqxBrVWc02ZyC5Zuxj4JEnIGJ5DSfl9U4=;
 b=XF5CTw++FBncdCBZeYmVR4i7ay9uaNMl5JlEAJOYFeGtc2v0+nSgMG7wPEyXOt1cS7
 H003PU+xeHK8DCHeQC7qOHD+C6SJvrWodH5abWskJADqCKTflR64TFXhU7MZa73Cg3JI
 i1/DwMsvU7ARelsETWbyAFU5VuLZQUwmaU6VDyA/NK61kW4VEKKSlBCIGg2U52Vh+3np
 6Ga1O4p0qhl8Q4CTsgypNjrKOh5TAFaDSsyTlTF2pvLTyrMZddnUs3edI8cxSFzUabFY
 62rq9S1ev2nyl5SGP6SAzMqQAdQB+2n1uZA/gJYfBVMIcdWk0XduJeoXYTnRqqSJR40h
 2nLA==
X-Gm-Message-State: AOAM533SmByd4jd7jAAVUBzhCNsCy78SIM9dtDiPKHvuR5AihOvWfSRh
 IqJa/JJd1pELtauysWyds4xFktDEpOXq9QZn
X-Received: by 2002:a5d:420b:: with SMTP id n11mr5816072wrq.395.1626183471783; 
 Tue, 13 Jul 2021 06:37:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 30/34] target/arm: Implement MVE VPNOT
Date: Tue, 13 Jul 2021 14:37:22 +0100
Message-Id: <20210713133726.26842-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aIbSIY0jJ+u6

Implement the MVE VPNOT insn, which inverts the bits in VPR.P0
(subject to both predication and to beatwise execution).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  1 +
 target/arm/mve.decode      |  1 +
 target/arm/mve_helper.c    | 17 +++++++++++++++++
 target/arm/translate-mve.c | 19 +++++++++++++++++++
 4 files changed, 38 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index c36640e75e9..5844bb891ed 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -123,6 +123,7 @@ DEF_HELPER_FLAGS_4(mve_vorn, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_veor, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
 DEF_HELPER_FLAGS_4(mve_vpsel, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_1(mve_vpnot, TCG_CALL_NO_WG, void, env)
 
 DEF_HELPER_FLAGS_4(mve_vaddb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vaddh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 6ac9cb8e4d4..82dc07bc30e 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -573,6 +573,7 @@ VCMPGT            1111 1110 0 . .. ... 1 ... 1 1111 0 0 . 0 ... 1 @vcmp
 VCMPLE            1111 1110 0 . .. ... 1 ... 1 1111 1 0 . 0 ... 1 @vcmp
 
 {
+  VPNOT           1111 1110 0 0 11 000 1 000 0 1111 0100 1101
   VPST            1111 1110 0 . 11 000 1 ... 0 1111 0100 1101 mask=%mask_22_13
   VCMPEQ_scalar   1111 1110 0 . .. ... 1 ... 0 1111 0 1 0 0 .... @vcmp_scalar
 }
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 40e652229d6..6efb3c69636 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -2214,6 +2214,23 @@ void HELPER(mve_vpsel)(CPUARMState *env, void *vd, void *vn, void *vm)
     mve_advance_vpt(env);
 }
 
+void HELPER(mve_vpnot)(CPUARMState *env)
+{
+    /*
+     * P0 bits for unexecuted beats (where eci_mask is 0) are unchanged.
+     * P0 bits for predicated lanes in executed bits (where mask is 0) are 0.
+     * P0 bits otherwise are inverted.
+     * (This is the same logic as VCMP.)
+     * This insn is itself subject to predication and to beat-wise execution,
+     * and after it executes VPT state advances in the usual way.
+     */
+    uint16_t mask = mve_element_mask(env);
+    uint16_t eci_mask = mve_eci_mask(env);
+    uint16_t beatpred = ~env->v7m.vpr & mask;
+    env->v7m.vpr = (env->v7m.vpr & ~(uint32_t)eci_mask) | (beatpred & eci_mask);
+    mve_advance_vpt(env);
+}
+
 #define DO_1OP_SAT(OP, ESIZE, TYPE, FN)                                 \
     void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm)         \
     {                                                                   \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 43f917e609e..be961864ada 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -889,6 +889,25 @@ static bool trans_VPST(DisasContext *s, arg_VPST *a)
     return true;
 }
 
+static bool trans_VPNOT(DisasContext *s, arg_VPNOT *a)
+{
+    /*
+     * Invert the predicate in VPR.P0. We have call out to
+     * a helper because this insn itself is beatwise and can
+     * be predicated.
+     */
+    if (!dc_isar_feature(aa32_mve, s)) {
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    gen_helper_mve_vpnot(cpu_env);
+    mve_update_eci(s);
+    return true;
+}
+
 static bool trans_VADDV(DisasContext *s, arg_VADDV *a)
 {
     /* VADDV: vector add across vector */
-- 
2.20.1

