Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4052925lfm;
        Mon, 24 May 2021 19:09:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoaObzH1Exp+FrEquaevSaviaizBKr0ndnPCi0zhExDj8U3hgHB/XvbsycOmsj9EM8Ss1u
X-Received: by 2002:a67:cd1a:: with SMTP id u26mr23528796vsl.58.1621908598463;
        Mon, 24 May 2021 19:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621908598; cv=none;
        d=google.com; s=arc-20160816;
        b=KJ1IoVI3jedf9TJd704ATFcBz4iPfg2ReBz0DWlYXAEtDxJaNJBYa8FQLO1N04JHCQ
         3qbrKQq8sj0pjRG3lnvtxVmWliYUiqlYrIzVEBGrC/7OCgTVTMW7sFekdNjkcFXStdFc
         RmlLiUroYkKX7PJ5DYcoTfLvQ+hdrz4on1IY8+V9byx8Yb1kz/Mkp+iE/n5EqQPVJc+3
         ef402YLaXCVZNjrm8NjKQo7hYpM2ksIn4VC333vjxcWW619wgDOM9peFrHdj4pQRDi1l
         ptcR990PxHdT4NrcL2FjJ69BW5BlgJQBx6tYQqQp8Wn/MPk6aRNwRSc4fsxwlFmgspJc
         Qgmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Uee7s+qdhdMQ6Jii7QCfRZaZt20ac2r4W/zjmra8qs4=;
        b=zkgTesT1kW0YmC7EHiYAeH3ss8jTMb8mibhYnkGmi0Cef7AuFG6scAGjbins4ZzOyK
         U8lMb/kUf5qsYs3bgiQIOcyZLckg4Y3D4aYyWnZmtWJwbZeWiGXI6J4KVhb1NyBGDs3C
         NaSCNhYlrcKshZD1lV2L5DPPNnhW4tGdIXyxhepfimSUtSVIkbe42NuYofLedkr7ENyt
         j0on2ygLVGvMoJu3Hk/RUQloJgZfW4bCFoaAvZlRMXqqy28x6/QhZwjbfIAO0fHktlcE
         3ZeUUkZCPopydpmlnAiH+SCeFKYOu69hW+OuHGwqdBtNP1c3Q6cTCuH71SlrGv8skSw1
         W0IA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="c/pTUl6M";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h24si6514429ual.135.2021.05.24.19.09.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 19:09:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="c/pTUl6M";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llMW5-0001NJ-Nl
	for alex.bennee@linaro.org; Mon, 24 May 2021 22:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLb9-0006R2-Po
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:11:07 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:36461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLaz-0005uU-9z
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:11:07 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 n6-20020a17090ac686b029015d2f7aeea8so12280907pjt.1
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 18:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Uee7s+qdhdMQ6Jii7QCfRZaZt20ac2r4W/zjmra8qs4=;
 b=c/pTUl6Mq2nxwiOXhtIVXpgFn6bEz5yNnvG/KGxRWOqF1M1+iiBhmFX6xCy3GeY6Gi
 CKW+GGm3/3cWozkHL5XqyteehWGU0KK6jIppgetGul4vRpchvkqnSUTRrqWhZnhk4nmN
 R3H5FAcCcLdkSC/SX1ZBlYTzo3K8KJPkqbqe+ocRt/r94RCNRVWoPO/rMqd5RfDWd42i
 IoWOKcRaFgKTMiQ/naCXtcGWSqJSPjGfWSKXvlikzSWIzNX1vJKYnStjO0/ij6pGhlxs
 Xdo1dyGs/qOkifgzUFQWW4dB1ubianm5M/nI59QVittxYvAiTaj46bGYFNUVSRBLe4FX
 yP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uee7s+qdhdMQ6Jii7QCfRZaZt20ac2r4W/zjmra8qs4=;
 b=hRkSNqtOOC0mXAae3LTRVVShsyZJV3sY7345kc0ShjHV3Vpxb/QUM+6//+3c6ccaM8
 srEZ2HBfD5bkO/s9cSAD2JhOD3sJ7Tqol2my6dRbpeHbtpQnodRk0DGXfuHUdS6PONNR
 V3tztM0zjaT+E8+oqNNooZvTUqtz6X4FSJbBUZHfzJYjhOna2mqHjwP471Fwol2dQHHD
 t7VoOzTJfjVYREWkBUzTbwKW9IKyU+a9r41RAUXojGKrramkjfjxw0C96bqLuQZhwRyV
 TIqyWSZHACV+p6VYXUgTT4YQ7gjfoQszK7NJlMc743HQje0klcEe52QMq1IqwKG+fIXq
 0A0w==
X-Gm-Message-State: AOAM530DbpLjc85Z4kmNATV13w9DBsuNzFCgkAYxE/b2swWaT8PFIEmK
 EKjkUtLDMjkmMdvCeHlR7AlDreUiQfgT3g==
X-Received: by 2002:a17:90b:687:: with SMTP id
 m7mr26993536pjz.133.1621905055098; 
 Mon, 24 May 2021 18:10:55 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id i8sm10614839pjs.54.2021.05.24.18.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:10:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 89/92] target/arm: Implement aarch32 VSUDOT, VUSDOT
Date: Mon, 24 May 2021 18:03:55 -0700
Message-Id: <20210525010358.152808-90-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +oEpEEaCUwKq

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index 386b42fe4b..b6ca29c25c 100644
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

