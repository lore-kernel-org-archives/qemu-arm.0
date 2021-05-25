Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4040947lfm;
        Mon, 24 May 2021 18:50:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRG9cxhgGRjhZCqZrK73f0Ka/dvLdzXilkFBD9dJrFmhTkVSVzUkSCaOW62ygq3be6+M0M
X-Received: by 2002:a05:620a:4153:: with SMTP id k19mr28692488qko.255.1621907402142;
        Mon, 24 May 2021 18:50:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621907402; cv=none;
        d=google.com; s=arc-20160816;
        b=WxtknoPBKrfEPOgY71ICQrxxsdvcVOE3b9JQUgZs9BAbhSP2tGG782WW7t4XwgZnG8
         DtIlBIhEH0d0fQU+aeWaDQvpOMQmGu4YpngVVuDQi1p0ZSP+l4QyL3n7pwLkMbI6+Yb3
         RjAik8c5RFeyPcpZ8C845SDyo8puli6yGOqyjJpOddDonfWaUAi6o4u9uEhFVNBcUprq
         PZpT4FUvfBLpa7Eltx9mvroFvNCCRnLJOzhDsz1IiHCmxI2zjfHfziueBgMulUn/xvyS
         hG+Hv7WTZs+EF6hdMJkUtxGr5t/szjYmgr9ZIq8jMN+Z6YiAShhq2hzho+V2j/O5LIdo
         MEuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=al5zygwWXlZnBczeihpPgLL//CCdS4mSvx1LWn5XSaU=;
        b=U0Ji70fmygVJrUysD4BxbuueCIbEwZSCi44lrqrfWUZyYbtgGxZ5H//+2WFH+AAElN
         6FQbzDREmDon+v/nn4TH75eIFMnZJy5/uvOna3mqKhf86dQA0ftvG7ncOocNxKodTLHL
         KzPa8IHD2kplfvNsJaMy+q4f7/Niu0ZyC05eqnKBSFlTpqnvsBd0pt0sc/nWwCjUNorT
         RRrKiPA2Ff16lBXyE30p5guy6wCjTPUGODVD+mQX1m/MUzaudL8pwKe74CWMvntFpzIm
         3CfnQnzN0v8d+GI2X1NxVMYtuCQqsMvX5bwhQo4MXt2ISiD8j1lXh9kPW9hCSXu6cCsT
         qaaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="UsNI/+8D";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n1si2018782qkp.132.2021.05.24.18.50.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 18:50:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="UsNI/+8D";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llMCn-00060Q-FA
	for alex.bennee@linaro.org; Mon, 24 May 2021 21:50:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLYL-0000HS-Sn
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:08:13 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:45857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXr-00047P-Vd
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:08:13 -0400
Received: by mail-pl1-x631.google.com with SMTP id s4so13951556plg.12
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 18:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=al5zygwWXlZnBczeihpPgLL//CCdS4mSvx1LWn5XSaU=;
 b=UsNI/+8DVAFvY9wJZM7qJshQpJXVup3a39IYJALxHwmrFsEJ1FK1/biEduebSZGRjd
 R40HvDxyIxPaG82zMtu3RT1eRbanJsQ0vpE0VFHuJzozq97cm+Qvhd/rQdes9Xly5yKF
 UORJPny/Fs/vDk6FMxtl/iFBmgpDpxaLNfeIJ1QXsKQ7udn45ddMBB+pKhMNPTDTy2W1
 FEmprUX9yg6m9JbKtyKxOWQ7r/DckyBUgONtIRDLYZWa4hq07k0gEIFWuK0aLG+URwn4
 xzAJwNJ0x1yRL5ukFK0ky5ovjGi2zwxl/dvvrli1Uz1VhgMhpNgNpidkld3Z18HkQNoR
 y3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=al5zygwWXlZnBczeihpPgLL//CCdS4mSvx1LWn5XSaU=;
 b=Kplm4miOVh6iTm4vG3WqfLV8Jyku7A234cqXux3nOM9eCxIKW94ODgC1AY0bMmfTjr
 YrIe0ACpWry7lka7NF9CLxTxkMU6wtNGKey8vIMwbfMgfon0BRvTMtjy+OxhYY9e3akJ
 Pif7mJwFS6qWr5qX8SaCQd7KsYl5RsOz0sLygMWatoZIsKLoAvTNzvv8qpUVbpSXjcEk
 qJnDdzvK5Iioj0NaubV5VwyRF1/k4Lp9QIwSQZT4Trf43RggGVpVuwsP7P7lJ3DSXNOa
 uxxg164eMbQ1MBgqBpmN7+w6BQ/gyNPWB+j+NdHuAE9r+1hChGl+bzqeL/QaDeSLN6AE
 NU4Q==
X-Gm-Message-State: AOAM533CNQbuAlbNX47QTWV0x4b8PF8R2YFYwN/2ylZ5qB9hVrJ/7wlC
 k3iOTNMJZP9331eXlzhXmtBmgQ==
X-Received: by 2002:a17:90a:ab8c:: with SMTP id
 n12mr1929359pjq.201.1621904862713; 
 Mon, 24 May 2021 18:07:42 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 70/92] target/arm: Implement SVE2 crypto constructive
 binary operations
Date: Mon, 24 May 2021 18:03:36 -0700
Message-Id: <20210525010358.152808-71-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
X-TUID: FuPg5qYQ8z0e

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  5 +++++
 target/arm/sve.decode      |  4 ++++
 target/arm/translate-sve.c | 16 ++++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 384c92eebb..c75601b221 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4246,6 +4246,11 @@ static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, BITPERM) != 0;
 }
 
+static inline bool isar_feature_aa64_sve2_sha3(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SHA3) != 0;
+}
+
 static inline bool isar_feature_aa64_sve2_sm4(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SM4) != 0;
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 46ebb5e2f8..051a6399ac 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1571,3 +1571,7 @@ AESMC           01000101 00 10000011100 decrypt:1 00000 rd:5
 AESE            01000101 00 10001 0 11100 0 ..... .....  @rdn_rm_e0
 AESD            01000101 00 10001 0 11100 1 ..... .....  @rdn_rm_e0
 SM4E            01000101 00 10001 1 11100 0 ..... .....  @rdn_rm_e0
+
+# SVE2 crypto constructive binary operations
+SM4EKEY         01000101 00 1 ..... 11110 0 ..... .....  @rd_rn_rm_e0
+RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 3b977b2462..2136a41094 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8197,3 +8197,19 @@ static bool trans_SM4E(DisasContext *s, arg_rrr_esz *a)
 {
     return do_sm4(s, a, gen_helper_crypto_sm4e);
 }
+
+static bool trans_SM4EKEY(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_sm4(s, a, gen_helper_crypto_sm4ekey);
+}
+
+static bool trans_RAX1(DisasContext *s, arg_rrr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2_sha3, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_fn_zzz(s, gen_gvec_rax1, MO_64, a->rd, a->rn, a->rm);
+    }
+    return true;
+}
-- 
2.25.1

