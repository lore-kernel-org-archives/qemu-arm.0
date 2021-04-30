Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp505437lfg;
        Fri, 30 Apr 2021 14:20:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5LQgCvs6DDe5QyAqTTeeIfZc6Cs6VFqKtRInqiYDUZsvrDhRPX68gYanPqyOugcisFy5j
X-Received: by 2002:a02:9081:: with SMTP id x1mr6841598jaf.2.1619817656059;
        Fri, 30 Apr 2021 14:20:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619817656; cv=none;
        d=google.com; s=arc-20160816;
        b=BIhva3bmmAy9PWKt9NIjnjQ9ECtSJ5UxIKIFWXUE1SBG9++Vn8AlaD+bOSQJSxdob1
         +7MC36yk5EcXE3UgELjKluanbrm3BGvLQGqVXod890UDKOhdkYtOnF9ltQkhDY7Hhtaw
         8iKjgHNM3F5CF/YOLp1vX9MAYoyPl8F5xjOtIn/7O15jKF/LC1CPUqHGXj/o2wKaxbBs
         qp26CBNpIBb+CenMt4edqZ75z72RISWNj3sYkUI24hVRffjCQ/r6ipI6v1YC4V27jGXP
         YEKtL7s6LCcelCjQFUlTHLjD/8uayM72tfi9smCgok85BtZjfM62giJ+hTRxIdY1AZq7
         79Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=QgPHonaDrMGTIgpcdL1HmrXmjritKf6UcNKnh0LjfQg=;
        b=cbskb2tXY6kpGxqP/XL54O+3CONopX3cRGAE24c7pXJSl5h/ZVjXlr7RDe24V3mJnP
         eq+mCS0ttx/DEvR9+DCofMr2+JbnKNMMq9uckBiQeRemnx549S8rgOlVAuda1PBHXuaA
         bjfPf5Op609cWcymJpeyYHTgNgQgMRKuSy3ztYVDlBVF+o/wiFikuv8XFrJz918a9H9m
         Rc20F8UwVye3hUYMW0JEaL6yVSXWIb222bbKAHcGDEA8LeBXYeLJGPCAuGP3lCo/lY3h
         3O20eguCZ92Hgz4KEqL8AIlAzqNq7v4ge9WHICzuF1YvLqOn0Q0uFXD0K/uvKhgknKMK
         4Bdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GKXTcRAt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y6si4013799jat.121.2021.04.30.14.20.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 14:20:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GKXTcRAt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcaZD-0006fA-DY
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 17:20:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZn4-0005C3-Ta
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:31:10 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:51122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlx-0007p6-KQ
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:31:10 -0400
Received: by mail-pj1-x102a.google.com with SMTP id md17so9641555pjb.0
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 13:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QgPHonaDrMGTIgpcdL1HmrXmjritKf6UcNKnh0LjfQg=;
 b=GKXTcRAt7h3AxVyN2yG3IqOzKCt9aI8vedY+F4Dh23B3s9Grk6YPbJYTJEDZrgef2H
 8As9kOvWZSH7DwZiCLcu7aKE+ZCCCzXSRERpbd/Tf6D4+pJ2haUXrj6V+h/mMy3xHoLq
 n9AEa6MLbpICeyiZkWFB4RiYyTPgfecEk8WQMJh6uOHe6xAk1rzqFaa7tyHbjVU3J3mU
 OyNxKth9NLwcv9BunjLj+YYGOEDQsD18ahiSbrAZF8RXC57GK/iW2l3UXiG8p6grdlLp
 +bgluQ1+tWKjcw5/o4s2yEcFESafX8mM39BX9QzmHVhXipm28qkgml8rf35K5lqMX6n2
 gRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QgPHonaDrMGTIgpcdL1HmrXmjritKf6UcNKnh0LjfQg=;
 b=U3Ig8uDxf09pbNx1ipufOR0ojtREbYiaFsii3OJrJiMECjG/4fM6AsPwbLNm3kTSXk
 CxlCmYA7G9FvR7BAILOIiCBWLDTxMV1uoZzGdv0XrqhhcmYyvIrpAD5pFRlXszejXguM
 US0Mj18ElMs2/y6vg0Iduo9TZ40sobgZ2VOXz0IA2ulFL+dsf+Qd7IShigWBiKZ5g5th
 ll3jTOqC9/m7le9vYGwLWMI4+oM3BAlhppb5oVAfvqqx+fF1USFRaRbAs+UxSmMh3IIm
 boMs0voejFz1vkPZobrvm7I7TO+1nZAYZTcjr4LTQgnSk5yWBP160WJcK+3HJGC+BDcy
 VT/w==
X-Gm-Message-State: AOAM530yguNKObtUJA8sjBZzcx4TbdnsnO4a7QEmOp4v1ez6/vb90KPL
 BUwFBKBAtWgfFoAqUoXzMBtNpVg57liAVQ==
X-Received: by 2002:a17:90a:5806:: with SMTP id
 h6mr7100545pji.14.1619814600318; 
 Fri, 30 Apr 2021 13:30:00 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:30:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 79/82] target/arm: Implement aarch32 VSUDOT, VUSDOT
Date: Fri, 30 Apr 2021 13:26:07 -0700
Message-Id: <20210430202610.1136687-80-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3tXWccMWFwjH

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h              |  5 +++++
 target/arm/neon-shared.decode |  6 ++++++
 target/arm/translate-neon.c   | 27 +++++++++++++++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b2b684df55..5850db90f3 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3783,6 +3783,11 @@ static inline bool isar_feature_aa32_predinv(const ARMISARegisters *id)
     return FIELD_EX32(id->id_isar6, ID_ISAR6, SPECRES) != 0;
 }
 
+static inline bool isar_feature_aa32_i8mm(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_isar6, ID_ISAR6, I8MM) != 0;
+}
+
 static inline bool isar_feature_aa32_ras(const ARMISARegisters *id)
 {
     return FIELD_EX32(id->id_pfr0, ID_PFR0, RAS) != 0;
diff --git a/target/arm/neon-shared.decode b/target/arm/neon-shared.decode
index 2d94369750..5befaec87b 100644
--- a/target/arm/neon-shared.decode
+++ b/target/arm/neon-shared.decode
@@ -50,6 +50,8 @@ VSDOT          1111 110 00 . 10 .... .... 1101 . q:1 . 0 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp
 VUDOT          1111 110 00 . 10 .... .... 1101 . q:1 . 1 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp
+VUSDOT         1111 110 01 . 10 .... .... 1101 . q:1 . 0 .... \
+               vm=%vm_dp vn=%vn_dp vd=%vd_dp
 
 # VFM[AS]L
 VFML           1111 110 0 s:1 . 10 .... .... 1000 . 0 . 1 .... \
@@ -66,6 +68,10 @@ VSDOT_scalar   1111 1110 0 . 10 .... .... 1101 . q:1 index:1 0 vm:4 \
                vn=%vn_dp vd=%vd_dp
 VUDOT_scalar   1111 1110 0 . 10 .... .... 1101 . q:1 index:1 1 vm:4 \
                vn=%vn_dp vd=%vd_dp
+VUSDOT_scalar  1111 1110 1 . 00 .... .... 1101 . q:1 index:1 0 vm:4 \
+               vn=%vn_dp vd=%vd_dp
+VSUDOT_scalar  1111 1110 1 . 00 .... .... 1101 . q:1 index:1 1 vm:4 \
+               vn=%vn_dp vd=%vd_dp
 
 %vfml_scalar_q0_rm 0:3 5:1
 %vfml_scalar_q1_index 5:1 3:1
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 194e329b6c..b7774caf9e 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -287,6 +287,15 @@ static bool trans_VUDOT(DisasContext *s, arg_VUDOT *a)
                         gen_helper_gvec_udot_b);
 }
 
+static bool trans_VUSDOT(DisasContext *s, arg_VUSDOT *a)
+{
+    if (!dc_isar_feature(aa32_i8mm, s)) {
+        return false;
+    }
+    return do_neon_ddda(s, a->q * 7, a->vd, a->vn, a->vm, 0,
+                        gen_helper_gvec_usdot_b);
+}
+
 static bool trans_VFML(DisasContext *s, arg_VFML *a)
 {
     int opr_sz;
@@ -354,6 +363,24 @@ static bool trans_VUDOT_scalar(DisasContext *s, arg_VUDOT_scalar *a)
                         gen_helper_gvec_udot_idx_b);
 }
 
+static bool trans_VUSDOT_scalar(DisasContext *s, arg_VUSDOT_scalar *a)
+{
+    if (!dc_isar_feature(aa32_i8mm, s)) {
+        return false;
+    }
+    return do_neon_ddda(s, a->q * 6, a->vd, a->vn, a->vm, a->index,
+                        gen_helper_gvec_usdot_idx_b);
+}
+
+static bool trans_VSUDOT_scalar(DisasContext *s, arg_VSUDOT_scalar *a)
+{
+    if (!dc_isar_feature(aa32_i8mm, s)) {
+        return false;
+    }
+    return do_neon_ddda(s, a->q * 6, a->vd, a->vn, a->vm, a->index,
+                        gen_helper_gvec_sudot_idx_b);
+}
+
 static bool trans_VFML_scalar(DisasContext *s, arg_VFML_scalar *a)
 {
     int opr_sz;
-- 
2.25.1

