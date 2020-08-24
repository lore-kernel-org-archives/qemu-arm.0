Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2614855lfy;
        Mon, 24 Aug 2020 07:42:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrAoaKp5YBakHX6FyeJJdZn+ihaLJriZl0PjjjWpWCLroZ9vwZFBxQ86pqH7Lho/aMfG8Z
X-Received: by 2002:a25:f42:: with SMTP id 63mr8329790ybp.348.1598280122239;
        Mon, 24 Aug 2020 07:42:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598280122; cv=none;
        d=google.com; s=arc-20160816;
        b=fWcofN4cjA+uAuDYgePBTEQAH5wPtfFaGOWywuKTn+S1NRbVuzZOt0OzjgAuVRwpWb
         VG2cZ0tnlPrnva6J9lh/wVssbjOXgxRJDQTNUo4tURH7f8hDn2BqIdtrY94AbsuYBpH1
         oUBC0a5F05KOz8eAhE3P485BcUYhOi/kSPC0KTaEf6CV9rRpueMn1sxp2sG5kofoDJ4m
         CYIzvj4PomiGfh9jp3cEC14BLjw8Gseh9EeOydZFEzK58zacs6bFpAiQfzwJcQvVVNLy
         s5K7aFFRH+17z/4Aju5S+/mlT39CNttmg+iKgzl0P/DMVnR6S1DSS69BGcfmZdRHQtzK
         LgkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0AGhW0MxhHcUCSNBSGpBK11L52+F5zOr0t2Vfz/+snY=;
        b=C8JFZifK259iKiNVykorcWn0KxVkNkMLRxaIqD+/ewZmNXQPVvT9v24kXBku+84Ihq
         SSAzgf3etLB8za3hSZggqr2jbUvRepndPuiprinUj13sOxs4QP+1/MEzp2+uErXTvec8
         XV/lfZiMhzXyUAifN5qkYQRFP6SmVN/KBz53Q0O8tITt0n5xWTbEpx0275QKaKLu+DbS
         2U0z6JqYqyQ/Zx84f0lgNb1p39erqlnbwamoG9Ym9QXorWMQIkWpQj9Zl6tpybJeHBfz
         zGfJlG1g0l3/s09EYjUXM5lEGdEX3B+V6zLONu5dICnpphVFCo38cdLdLRx25pmvscez
         sgkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UJpkDfwk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5si11759005yba.67.2020.08.24.07.42.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 07:42:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UJpkDfwk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kADfd-0005TO-KA
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 10:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADU5-0000MC-Iz
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 10:30:06 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:34174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADTy-0002l3-Hq
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 10:30:03 -0400
Received: by mail-wm1-x341.google.com with SMTP id c19so6270737wmd.1
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2020 07:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0AGhW0MxhHcUCSNBSGpBK11L52+F5zOr0t2Vfz/+snY=;
 b=UJpkDfwkX7erAH9325bqppJ7xu97l0Y8+a5z4ihjHS9mD8xMApc+aci1tb1zqKbibQ
 3DLdFuniFHMqDmPeFmnc2juAe46YZ1E4/RWuQWIzCSAgBWuaku+tX9ibHD8k9sPeSKCF
 /jVU3Z1vr/IHcgPdpMIpdooOEaTRWI767SQ9VIkICFHfYie0J+qdgPgLWZbeX9BaVKrG
 Tg4Ci2tNB+o86hDntYLbcbXRKWePct8IDAqhMShhAY2GC5byxHsDfc+m7aiwl4lFyd1H
 cQmNa5zohwNyw62uL9zRDfdYmpxNicnkEJqxN5dh9PHzyKwj4Qj3JAN3ht1H3QAVDY1x
 Xepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0AGhW0MxhHcUCSNBSGpBK11L52+F5zOr0t2Vfz/+snY=;
 b=RdLhWiUZoCrlSKhdWudmsmlEYzvjHesYuoMVAa3Mp19gdRMp6A1bJcvh+qMdpmPCvD
 +ofPV48ubdKjtt/GPhu3Yedyaf6o0NMz2d6sgMZEWw5XR2ALu+6gZulkCvWBLbt30Ku0
 GWtdzq7YvfnTboGnDBtza2WYd1mZObmnQ2cWqfF8q2QcpnBNJQmH0yNH/bJfvWuHU3rr
 MqRBs6BiNDtro/ca+8il4JvLucTBz5UKXtjwoVq9+irLLg2cRll9IZP6eIiG0/G2OoSF
 9UnrSh8l2JWYgTNmdK96enqEAGo1VDwZQ08Is/cR475gx15GRIcG5wA1yyvXZ2u5RK0i
 PX5A==
X-Gm-Message-State: AOAM532Y2fKd/PuBNvnz7oN5wr5Tb2SHXLNscNUvzwXV5wppno3EsJOW
 Sx3ViodZ4kDZv147Mu5fGXKU//1Yb5UfyV/J
X-Received: by 2002:a1c:283:: with SMTP id 125mr6262891wmc.12.1598279396899;
 Mon, 24 Aug 2020 07:29:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b14sm24499091wrj.93.2020.08.24.07.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 07:29:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 19/22] target/arm: Implement new VFP fp16 insn VINS
Date: Mon, 24 Aug 2020 15:29:31 +0100
Message-Id: <20200824142934.20850-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200824142934.20850-1-peter.maydell@linaro.org>
References: <20200824142934.20850-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-TUID: exQReCLzMuSt

The fp16 extension includes a new instruction VINS, which copies the
lower 16 bits of a 32-bit source VFP register into the upper 16 bits
of the destination.  Implement it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/vfp-uncond.decode   |  3 +++
 target/arm/translate-vfp.c.inc | 28 ++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/target/arm/vfp-uncond.decode b/target/arm/vfp-uncond.decode
index 9615544623a..39dc8f6373a 100644
--- a/target/arm/vfp-uncond.decode
+++ b/target/arm/vfp-uncond.decode
@@ -74,3 +74,6 @@ VCVT        1111 1110 1.11 11 rm:2 .... 1010 op:1 1.0 .... \
             vm=%vm_sp vd=%vd_sp sz=2
 VCVT        1111 1110 1.11 11 rm:2 .... 1011 op:1 1.0 .... \
             vm=%vm_dp vd=%vd_sp sz=3
+
+VINS        1111 1110 1.11 0000 .... 1010 11 . 0 .... \
+            vd=%vd_sp vm=%vm_sp
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 7ce044fa896..bda3dd25136 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -3454,3 +3454,31 @@ static bool trans_NOCP(DisasContext *s, arg_NOCP *a)
 
     return false;
 }
+
+static bool trans_VINS(DisasContext *s, arg_VINS *a)
+{
+    TCGv_i32 rd, rm;
+
+    if (!dc_isar_feature(aa32_fp16_arith, s)) {
+        return false;
+    }
+
+    if (s->vec_len != 0 || s->vec_stride != 0) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    /* Insert low half of Vm into high half of Vd */
+    rm = tcg_temp_new_i32();
+    rd = tcg_temp_new_i32();
+    neon_load_reg32(rm, a->vm);
+    neon_load_reg32(rd, a->vd);
+    tcg_gen_deposit_i32(rd, rd, rm, 16, 16);
+    neon_store_reg32(rd, a->vd);
+    tcg_temp_free_i32(rm);
+    tcg_temp_free_i32(rd);
+    return true;
+}
-- 
2.20.1

