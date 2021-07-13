Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp606960lfc;
        Tue, 13 Jul 2021 06:53:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyp8fwcUbSyTGNe8yBfMs+C4d1o9dt6H1BHJmEm/7vMSdhB1aDnu4jvdHnEtVI+LefjUbrg
X-Received: by 2002:ab0:c19:: with SMTP id a25mr5958185uak.98.1626184386056;
        Tue, 13 Jul 2021 06:53:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626184386; cv=none;
        d=google.com; s=arc-20160816;
        b=Glw73IfkqseB6GrowMbEZDh75QThZGBRcGN5Yyjrc0oNzbusyJhZwwCJXg9riMX/WG
         tz/xoMdNeobYVAkMntWa/4+Tebo7ov3S2QRGDdOJ5KrbEmTdMvMZ3693Am0q+7I+ZiS5
         Pd9ymM0BZcMn10Md2v1GKYG0uI4UppPMGNpp/vw0xgzgHwv3hXdxbiOcStcr73Yup4HF
         tRqMJW+EYzzI8aJRpK/8QJK8B7OTdxm2hE1IXltfuCDGpRQgjFl4PUBHr0eJCsQ3Ahah
         k3zcsFaxY4NLb6+RQJcvInEbI9RcoKD+9rLeV8TMUM2CfguO3evwBIMuJgPVXi/pLDX6
         dxUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KRGBoCnPAuu3QA59UbNot9EYsJQ7O/Xl42j0/zCUXDY=;
        b=RSxG072ko7Rj5f7AeXsDHU5UEI7sNQGkiHnwX2k305AuCHFb3UqGxEtz9D1tvs+jSH
         IFYOUUrMiCTXalC1tK48Lmi60m0Ftc+Khr38CWqpCNhrZpRCtnVVSHeGRexVcDsGwMYV
         PXk1qaVLjWAd8E8ozZipB0iAbZlPVkp50cnqOXf3UUdQwXLsw7yw3JI8nD7yMsruIzom
         1Yc4vdMF3/x0FaRIhMkWJNVJUvK/udF2u0qTyT6mZLSxoqu+/6jpxMceoefzZ1ltUC2F
         xAw0hizY7r9bLg4QmEqYxWxp/NtJW3QJR6h7JXQmJqTB8eSkFkWsK9UY7peeJRC0/2RS
         e+sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lsrA1VSs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n18si14161169uaq.207.2021.07.13.06.53.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 06:53:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lsrA1VSs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3IqP-0004ND-Cd
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 09:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibk-0000E6-Ju
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 09:38:01 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibd-0003mG-2R
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 09:37:56 -0400
Received: by mail-wr1-x42b.google.com with SMTP id v5so30526138wrt.3
 for <qemu-arm@nongnu.org>; Tue, 13 Jul 2021 06:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KRGBoCnPAuu3QA59UbNot9EYsJQ7O/Xl42j0/zCUXDY=;
 b=lsrA1VSsTxlQqKCpgc9RyM1wllwMnNCiLcm5Iap8O0TOQ/OYsRdfFcMnvz8c/jnh7r
 CF7squtR2CHEKZPB6SgA2E1bEa+yqKjJvFhiQD9/uqM5nharmf6h/Zu9U7ij7o/kz3jh
 V7xRt+9f/pVE2+HXRCHgOm3CpXgIHxcmewRknjtKk5x7ef4KpkopznoIVGT6jqH47mWe
 h3w6vY7YJZjFvkXS6xKwfiBoJt0Y4rgIqUlM8hMT8rUDPe1mtOcWJc8YTLnRC7eub6PS
 UHWyiK0jPfAbTQOAMIzAjhHGRciF9lYQcYKWDhLt2xThmWGwPc88zw4se+qRcYUUmYfi
 bVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KRGBoCnPAuu3QA59UbNot9EYsJQ7O/Xl42j0/zCUXDY=;
 b=Sii1+vRc+7ATR9w9o3ixpo0Pq68qco9nHps8MXEt3rkVfP2Mvyu966Ch4Jzm03x1qK
 gQ1J4muW1XOXC7fE4mawGb8363HUcUXU32GpyMNjh6ihFVnowGO5GkkyHbrW5wk2kJdL
 qKUiN4neij5Tgarymstvzzv6rTQQqrvsulHPuHG+aMoVl3Hi8GtEapxjqdPQzuRIeC7b
 8dLlwxSQp9hHMb4MKUEa+IMfOmkmwO0bUVYnvr6jrI3Ys0UWzl+H+5bk8Qy5s8AuhvCo
 EJjDBAHTRd3EpujYOWcSxpIHFHiLKh99jucioPwhGEVmQAk0JPy3f9P4tRVreVUpkr2S
 GSZw==
X-Gm-Message-State: AOAM531Wj8zYG5nghk+xbixu8d/icIvPzhdyqvQ7e1oy4xp16lxL/aAR
 HPvYd7skYttGnhpj63qWa9wFR+pdNLBT3ux7
X-Received: by 2002:adf:de84:: with SMTP id w4mr5878528wrl.104.1626183467890; 
 Tue, 13 Jul 2021 06:37:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 25/34] target/arm: Implement MVE VMLA
Date: Tue, 13 Jul 2021 14:37:17 +0100
Message-Id: <20210713133726.26842-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: GTkXip7MNtLm

Implement the MVE VMLA insn, which multiplies a vector by a scalar
and accumulates into another vector.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    | 8 ++++++++
 target/arm/mve.decode      | 3 +++
 target/arm/mve_helper.c    | 6 ++++++
 target/arm/translate-mve.c | 2 ++
 4 files changed, 19 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 088bdd3ca50..50b34c601e1 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -371,6 +371,14 @@ DEF_HELPER_FLAGS_4(mve_vqdmullb_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i3
 DEF_HELPER_FLAGS_4(mve_vqdmullt_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vqdmullt_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(mve_vmlasb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmlash, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmlasw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vmlaub, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmlauh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmlauw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(mve_vmlassb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vmlassh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vmlassw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 0c4708ea988..2e2df61c860 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -412,6 +412,9 @@ VHSUB_U_scalar   1111 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
 VQDMULH_scalar   1110 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
 VQRDMULH_scalar  1111 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
 
+VMLA_S           1110 1110 0 . .. ... 1 ... 0 1110 . 100 .... @2scalar
+VMLA_U           1111 1110 0 . .. ... 1 ... 0 1110 . 100 .... @2scalar
+
 VMLAS_S          1110 1110 0 . .. ... 1 ... 1 1110 . 100 .... @2scalar
 VMLAS_U          1111 1110 0 . .. ... 1 ... 1 1110 . 100 .... @2scalar
 
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 8b70362f012..91c0add8da7 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1019,6 +1019,12 @@ DO_2OP_SAT_SCALAR(vqrdmulh_scalarb, 1, int8_t, DO_QRDMULH_B)
 DO_2OP_SAT_SCALAR(vqrdmulh_scalarh, 2, int16_t, DO_QRDMULH_H)
 DO_2OP_SAT_SCALAR(vqrdmulh_scalarw, 4, int32_t, DO_QRDMULH_W)
 
+/* Vector by scalar plus vector */
+#define DO_VMLA(D, N, M) ((N) * (M) + (D))
+
+DO_2OP_ACC_SCALAR_S(vmlas, DO_VMLA)
+DO_2OP_ACC_SCALAR_U(vmlau, DO_VMLA)
+
 /* Vector by vector plus scalar */
 #define DO_VMLAS(D, N, M) ((N) * (D) + (M))
 
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 67b9c07447a..650f3b95edf 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -620,6 +620,8 @@ DO_2OP_SCALAR(VQSUB_U_scalar, vqsubu_scalar)
 DO_2OP_SCALAR(VQDMULH_scalar, vqdmulh_scalar)
 DO_2OP_SCALAR(VQRDMULH_scalar, vqrdmulh_scalar)
 DO_2OP_SCALAR(VBRSR, vbrsr)
+DO_2OP_SCALAR(VMLA_S, vmlas)
+DO_2OP_SCALAR(VMLA_U, vmlau)
 DO_2OP_SCALAR(VMLAS_S, vmlass)
 DO_2OP_SCALAR(VMLAS_U, vmlasu)
 
-- 
2.20.1

