Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp501691lff;
        Thu, 17 Jun 2021 05:42:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYK8YAxZ1KE6YmuPqRr9pKQEvzUe0SlGJKU1u0Xzo+zlbAk7IAlaiqyIZIMzdNICtHTjmq
X-Received: by 2002:ab0:778c:: with SMTP id x12mr4944966uar.88.1623933722599;
        Thu, 17 Jun 2021 05:42:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623933722; cv=none;
        d=google.com; s=arc-20160816;
        b=swsd4EO4wybDFPErhJwq41Mg2ACq0Lc/d0++qsEcXYLSipK69G9OSmt3aUoTGCBVZD
         lp8icyKOGosDwd6cybfjG8PLnOxqFz/mLFjdISeaA23utX+5A+D7JIzBbH+X1W8NQLfn
         a7pmJPN1B0GnGV5UgDMVwGJ0oC3NbesBSY0Qo9w3lG3ZwmEmTLF3HulOnDvFnWDLcdoe
         MQYVn+dntoqVhvI4St0Lj101j4HiQLmRPQ8GWP5WKiTF8Vpnf9Gh46e5w/T9OLJaMJ7O
         kGPgwcCJ1uiWh83r23dsrJXsj4cU9hSjOFRbXsLs677d3mMXagOE3s6FVHR7T4WhUwFr
         2smA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=i2+Nn2rxfuSq5/JEBJeaXo06Tllu2Q5gZa4VP1VdxXA=;
        b=Ir/7eAPLw5LmP2YjsqnYgYUVwW2CAuEF/yUhTnLoznRZsswj6EJTgeJMMiO9rH7UR4
         6YmFQm67nKNW0SNkLL4iczdYqpioLuexTqLUQ9ZQhflNvCilqmy54uuF2o8zSEdTeAJs
         pg43sHHVjyPqQ4fN4uLtvRog+K7dJT5DfeXY1a32s7FMXyHgd9Uj2jSb2TU599GrLnVz
         Yleq+A1LbU2zGeToMVV9Zwq/+vZecu9xRtlfMP7QbH8BdXyo9QXYz3bN21bdGfB+nl93
         sHxpN5RjucvlxSaIAaYLgIrFtrhmmiH6dmkssqKkzXChQzp64CkEe1CiKPT+CW5uObjo
         5rXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F4GvJmCN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2si4276931vso.309.2021.06.17.05.42.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jun 2021 05:42:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F4GvJmCN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltrLN-0000fi-QN
	for alex.bennee@linaro.org; Thu, 17 Jun 2021 08:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqxI-0002A9-JA
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:17:08 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqx5-0007BO-UI
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:17:08 -0400
Received: by mail-wr1-x434.google.com with SMTP id n7so6556193wri.3
 for <qemu-arm@nongnu.org>; Thu, 17 Jun 2021 05:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i2+Nn2rxfuSq5/JEBJeaXo06Tllu2Q5gZa4VP1VdxXA=;
 b=F4GvJmCN6zv4u0cVRUPA43EB7LgmR1WHicysLu2VQeoTa7ih3OeQxfCqo/BPetj9NK
 SwhFHK7+xMhLSWFpLqGeBJ0kQZ+pnNgF9MEurUEIGRqqX7MaS3EhuagsGEO/tcfGWFJw
 /jByhNCAyJUsXHZupiP0Gc06ESYncmL6SNZpqNhpNaBDAiFBvr3COTaC0oQbDUwAeaZJ
 a2lUH0CQ1eEm+SHn+ngwCyXMxXAoYPANJ0CDJwAUw+f7PFx1muJeLygT8ZnSk2PvWpQ8
 N3KA/lEU8VgoJffU4DuXbDihHq+nB/if3gpxKEj4bA/qHyHHjKvK3WmaZQ8qOr8qb9fK
 iHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i2+Nn2rxfuSq5/JEBJeaXo06Tllu2Q5gZa4VP1VdxXA=;
 b=cBOeuW6ALpgHgf1/pLQu+zslhqeFB7+M0sRnFGE58E+5ZPuDmh+T5uPwtzjKgl6nzh
 VRaoVYuMGToO3srrWMRb8x2bo5stLnQa1k9wZilbJysS8deKoqGitNkhzMJJtzHZjS+g
 ACLb3eLpo/MlMVtwN6PcCN5UfApyRNUi+oPEalRghLfnHKxlGla6s/90RD59+SrV+Wrx
 Sv3VCdVfZ+OZxoB1N0RRiaXlicAGc2KH+6Z5eCzbEK6d2LDPn5eWnWA33pHTdIW0/fbW
 o1a0wIhtdl4JdHgvR+vR56LCU6nG2gCVe5XA7cNGQtvW2oL5Pv2xZpwU8Zp+DwhEXyWB
 3H+g==
X-Gm-Message-State: AOAM5326xLO5nHA+2ieCgkHtV+VwfVaXCZUbO4B9YsvizoIiNpTkVy6k
 5n6iQuZiYnsARRSwqvR6xZLY3fzK2V9WsQ==
X-Received: by 2002:a05:6000:232:: with SMTP id
 l18mr5350919wrz.88.1623932214634; 
 Thu, 17 Jun 2021 05:16:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 31/44] target/arm: Implement MVE VQADD, VQSUB (vector)
Date: Thu, 17 Jun 2021 13:16:15 +0100
Message-Id: <20210617121628.20116-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
X-TUID: slGxJL8RHC+k

Implement the vector forms of the MVE VQADD and VQSUB insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 16 ++++++++++++++++
 target/arm/mve.decode      |  5 +++++
 target/arm/mve_helper.c    | 14 ++++++++++++++
 target/arm/translate-mve.c |  4 ++++
 4 files changed, 39 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index c4e766c6511..93847fc04ad 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -153,6 +153,22 @@ DEF_HELPER_FLAGS_4(mve_vqrdmulhb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqrdmulhh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqrdmulhw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vqaddsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqaddsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqaddsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vqaddub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqadduh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqadduw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vqsubsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqsubsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqsubsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vqsubub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqsubuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqsubuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 9860d43f73c..80fa647c08f 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -116,6 +116,11 @@ VMULL_TU         111 1 1110 0 . .. ... 1 ... 1 1110 . 0 . 0 ... 0 @2op
 VQDMULH          1110 1111 0 . .. ... 0 ... 0 1011 . 1 . 0 ... 0 @2op
 VQRDMULH         1111 1111 0 . .. ... 0 ... 0 1011 . 1 . 0 ... 0 @2op
 
+VQADD_S          111 0 1111 0 . .. ... 0 ... 0 0000 . 1 . 1 ... 0 @2op
+VQADD_U          111 1 1111 0 . .. ... 0 ... 0 0000 . 1 . 1 ... 0 @2op
+VQSUB_S          111 0 1111 0 . .. ... 0 ... 0 0010 . 1 . 1 ... 0 @2op
+VQSUB_U          111 1 1111 0 . .. ... 0 ... 0 0010 . 1 . 1 ... 0 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index d17c5e4588b..bba3c1c1ee3 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -578,6 +578,20 @@ DO_2OP_SAT(vqrdmulhb, 1, int8_t, DO_QRDMULH_B)
 DO_2OP_SAT(vqrdmulhh, 2, int16_t, DO_QRDMULH_H)
 DO_2OP_SAT(vqrdmulhw, 4, int32_t, DO_QRDMULH_W)
 
+DO_2OP_SAT(vqaddub, 1, uint8_t, DO_UQADD_B)
+DO_2OP_SAT(vqadduh, 2, uint16_t, DO_UQADD_H)
+DO_2OP_SAT(vqadduw, 4, uint32_t, DO_UQADD_W)
+DO_2OP_SAT(vqaddsb, 1, int8_t, DO_SQADD_B)
+DO_2OP_SAT(vqaddsh, 2, int16_t, DO_SQADD_H)
+DO_2OP_SAT(vqaddsw, 4, int32_t, DO_SQADD_W)
+
+DO_2OP_SAT(vqsubub, 1, uint8_t, DO_UQSUB_B)
+DO_2OP_SAT(vqsubuh, 2, uint16_t, DO_UQSUB_H)
+DO_2OP_SAT(vqsubuw, 4, uint32_t, DO_UQSUB_W)
+DO_2OP_SAT(vqsubsb, 1, int8_t, DO_SQSUB_B)
+DO_2OP_SAT(vqsubsh, 2, int16_t, DO_SQSUB_H)
+DO_2OP_SAT(vqsubsw, 4, int32_t, DO_SQSUB_W)
+
 #define DO_2OP_SCALAR(OP, ESIZE, TYPE, FN)                              \
     void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
                                 uint32_t rm)                            \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index ec9a9852868..9f59ed591bc 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -398,6 +398,10 @@ DO_2OP(VMULL_TS, vmullts)
 DO_2OP(VMULL_TU, vmulltu)
 DO_2OP(VQDMULH, vqdmulh)
 DO_2OP(VQRDMULH, vqrdmulh)
+DO_2OP(VQADD_S, vqadds)
+DO_2OP(VQADD_U, vqaddu)
+DO_2OP(VQSUB_S, vqsubs)
+DO_2OP(VQSUB_U, vqsubu)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
-- 
2.20.1

