Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2883176ejt;
        Mon, 19 Jun 2023 08:56:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ775AOd9KM0VaJRx65QXZrPbxHvjLUroQmNJ8Z4oe2xTk/rnY91LYI9Y0EUb9LQW+n+j3eY
X-Received: by 2002:ad4:5ca6:0:b0:625:953f:84f6 with SMTP id q6-20020ad45ca6000000b00625953f84f6mr13447741qvh.6.1687190168092;
        Mon, 19 Jun 2023 08:56:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687190168; cv=none;
        d=google.com; s=arc-20160816;
        b=0rStBagKkUfRC988W55lwboHA+tUnCo4kLCkMAjMswsrq/a6ZXkAQPwShLgxXBCvn3
         1jo+jmEin99wnwLrUh7hhxADz0nlt0QWNp29pib4lAOILJnDsXWoumXE3euqEMIz+0jd
         y2bDzAKE5eURWfJbfGRRHeXdkdBmVM5etVioDv0OzdsuA8Jc7zbQzSoIzoY0lCMrOJ/M
         bcSZ/R3QpA6uVI8EFoADxqZDTKhZMOnEDT3P5KE89IZYZSfz02LfsmQ/biNhNB1uHDSH
         FrBxjHCKS/z3lpcWTmfyl+I+xGZG44x5WCdSnSnBitlckELW6HPVWcmwADPIXRu6mNnE
         87iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Af/tSjm/BOjeiGjpZCWkKZPsL42AlIsg7E4OA/cZpfw=;
        b=ftF8S/UJ8svifep3tFbD1qQKDkPyRqiGK4ZwUo/Nx1kXMFJbl8jkC6JLIETVFJvqtq
         lusJe9ExrjForizaqBLTL+Qpdevo44JifxFQMXa5NbS4oIa73+MhaIqMpM+qslEtb20v
         eTdFe2kmMKpBhDx12t8r7J0SNKHi8F4BxwkzWJfwvl3Xaxj7qa0wVIMXKkGlpBAwG4RD
         6UryvX6U1DVS2AnET8+N6hg3SN3hN06dQMbO8EgjUgHzGTfaFt4tQ7r7LZ0ofJuXIEUQ
         fRUWSqDEFX9/mSitwS8JGm6yD7JNJFZeLDmU5J/ivMZdeMudr4XtxMVtOpDFxdooAn9B
         AV2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mTf3KG5d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12-20020ac84e4c000000b003ff28d9cce4si32077qtw.19.2023.06.19.08.56.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 08:56:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mTf3KG5d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBHEA-0006Xe-Ns; Mon, 19 Jun 2023 11:55:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBHE9-0006Wo-96
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 11:55:37 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBHE0-0004hW-1R
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 11:55:31 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-983f499fc81so439577166b.3
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 08:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687190126; x=1689782126;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Af/tSjm/BOjeiGjpZCWkKZPsL42AlIsg7E4OA/cZpfw=;
 b=mTf3KG5d1ATddSdMZ1sG9iZBFwP/K8kp9Kv1bGc8jlmSC113lfHtRidtVXqJOk0Uvz
 NGs5aEguY4dECa/sKs2Nwlrlf+1gkCBRcEbubP6PjfIa2Zpi8iAJJ6J7xOVpr1Ee0wxX
 qhK7WTTT/6+WZxPHj0dOox2qRxG/YkovTiBPCQTs+k0WrObMZAlgC1zKnaVycYw3mQ9W
 FcL/RMjKGcQYyyLrDESYY0RQNc0u3JxQRM7gq+BKZSVAmjjo9TcG/KHc54VnYE9sc5VG
 OcDuTUdpmbQNETxzyRcAGpZEog21Lom5/+aBy23aA1jNuP6V+TbBtpfcHaiqlZPAIUw+
 2L6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687190126; x=1689782126;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Af/tSjm/BOjeiGjpZCWkKZPsL42AlIsg7E4OA/cZpfw=;
 b=dbkwVeGzn4v7JEZetQHfpGxDhtf/b1Z95DnH/FaflmuwDkC+dxkaAqsY3rJWQ1miQh
 hQe1e7DfzNs7yHY5poKZOVAN5bjbKcq1McxHBFFVAY6vhdrSFvdELG7HidcpQGZRsx0U
 d4UB1QPmEaok3DEOZgbvGt3z/wnPCjQSgTi0x+jAQ0AlFrWAUybhj7Q1P2oDHrzZzQef
 0bGjifNcOl3V6x8vRYCFI34Z9J8MpTRzfNDqLsd2rYtV+j7mUYhrwWmzP2dBJTwzrfCq
 CA7ClLVR5zBUPz7Y8yscRL2Kxov5LqqszLNB8J01ePC2eEnqYZTLnYwbt5Azpgqz+RPr
 rziQ==
X-Gm-Message-State: AC+VfDyHoI72agrKTBVvwByf7MR/vIoQ+RKm/2b8RoozaUdpeV66UbZ2
 22WyrqcpLcpluj4wDGTeEDErUA==
X-Received: by 2002:a17:907:1c07:b0:982:84c9:96bd with SMTP id
 nc7-20020a1709071c0700b0098284c996bdmr9437733ejc.76.1687190126432; 
 Mon, 19 Jun 2023 08:55:26 -0700 (PDT)
Received: from m1x-phil.lan (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 v12-20020a170906338c00b009887a671017sm2445922eja.179.2023.06.19.08.55.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Jun 2023 08:55:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 13/34] target/arm/tcg: Extract NEON definitions to
 'helper-neon.h.inc'
Date: Mon, 19 Jun 2023 17:54:49 +0200
Message-Id: <20230619155510.80991-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230619154302.80350-1-philmd@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DhazQanVSBQi

helper.h is used by all units, but not all require the NEON
definitions. Move them to a new header; the next commit will
remove it from the common helper.h.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h              | 207 +---------------------------
 target/arm/tcg/helper-a64.h.inc  |   7 -
 target/arm/tcg/helper-neon.h.inc | 224 +++++++++++++++++++++++++++++++
 3 files changed, 225 insertions(+), 213 deletions(-)
 create mode 100644 target/arm/tcg/helper-neon.h.inc

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 2419650ec6..2600c150f4 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -103,198 +103,11 @@ DEF_HELPER_FLAGS_2(rebuild_hflags_a64, TCG_CALL_NO_RWG, void, env, int)
 
 DEF_HELPER_FLAGS_5(probe_access, TCG_CALL_NO_WG, void, env, tl, i32, i32, i32)
 
-DEF_HELPER_FLAGS_4(neon_tbl, TCG_CALL_NO_RWG, i64, env, i32, i64, i64)
-
 DEF_HELPER_3(shl_cc, i32, env, i32, i32)
 DEF_HELPER_3(shr_cc, i32, env, i32, i32)
 DEF_HELPER_3(sar_cc, i32, env, i32, i32)
 DEF_HELPER_3(ror_cc, i32, env, i32, i32)
 
-/* neon_helper.c */
-DEF_HELPER_FLAGS_3(neon_qadd_u8, TCG_CALL_NO_RWG, i32, env, i32, i32)
-DEF_HELPER_FLAGS_3(neon_qadd_s8, TCG_CALL_NO_RWG, i32, env, i32, i32)
-DEF_HELPER_FLAGS_3(neon_qadd_u16, TCG_CALL_NO_RWG, i32, env, i32, i32)
-DEF_HELPER_FLAGS_3(neon_qadd_s16, TCG_CALL_NO_RWG, i32, env, i32, i32)
-DEF_HELPER_FLAGS_3(neon_qadd_u32, TCG_CALL_NO_RWG, i32, env, i32, i32)
-DEF_HELPER_FLAGS_3(neon_qadd_s32, TCG_CALL_NO_RWG, i32, env, i32, i32)
-DEF_HELPER_FLAGS_3(neon_uqadd_s8, TCG_CALL_NO_RWG, i32, env, i32, i32)
-DEF_HELPER_FLAGS_3(neon_uqadd_s16, TCG_CALL_NO_RWG, i32, env, i32, i32)
-DEF_HELPER_FLAGS_3(neon_uqadd_s32, TCG_CALL_NO_RWG, i32, env, i32, i32)
-DEF_HELPER_FLAGS_3(neon_uqadd_s64, TCG_CALL_NO_RWG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_3(neon_sqadd_u8, TCG_CALL_NO_RWG, i32, env, i32, i32)
-DEF_HELPER_FLAGS_3(neon_sqadd_u16, TCG_CALL_NO_RWG, i32, env, i32, i32)
-DEF_HELPER_FLAGS_3(neon_sqadd_u32, TCG_CALL_NO_RWG, i32, env, i32, i32)
-DEF_HELPER_FLAGS_3(neon_sqadd_u64, TCG_CALL_NO_RWG, i64, env, i64, i64)
-DEF_HELPER_3(neon_qsub_u8, i32, env, i32, i32)
-DEF_HELPER_3(neon_qsub_s8, i32, env, i32, i32)
-DEF_HELPER_3(neon_qsub_u16, i32, env, i32, i32)
-DEF_HELPER_3(neon_qsub_s16, i32, env, i32, i32)
-DEF_HELPER_3(neon_qsub_u32, i32, env, i32, i32)
-DEF_HELPER_3(neon_qsub_s32, i32, env, i32, i32)
-DEF_HELPER_3(neon_qadd_u64, i64, env, i64, i64)
-DEF_HELPER_3(neon_qadd_s64, i64, env, i64, i64)
-DEF_HELPER_3(neon_qsub_u64, i64, env, i64, i64)
-DEF_HELPER_3(neon_qsub_s64, i64, env, i64, i64)
-
-DEF_HELPER_2(neon_hadd_s8, i32, i32, i32)
-DEF_HELPER_2(neon_hadd_u8, i32, i32, i32)
-DEF_HELPER_2(neon_hadd_s16, i32, i32, i32)
-DEF_HELPER_2(neon_hadd_u16, i32, i32, i32)
-DEF_HELPER_2(neon_hadd_s32, s32, s32, s32)
-DEF_HELPER_2(neon_hadd_u32, i32, i32, i32)
-DEF_HELPER_2(neon_rhadd_s8, i32, i32, i32)
-DEF_HELPER_2(neon_rhadd_u8, i32, i32, i32)
-DEF_HELPER_2(neon_rhadd_s16, i32, i32, i32)
-DEF_HELPER_2(neon_rhadd_u16, i32, i32, i32)
-DEF_HELPER_2(neon_rhadd_s32, s32, s32, s32)
-DEF_HELPER_2(neon_rhadd_u32, i32, i32, i32)
-DEF_HELPER_2(neon_hsub_s8, i32, i32, i32)
-DEF_HELPER_2(neon_hsub_u8, i32, i32, i32)
-DEF_HELPER_2(neon_hsub_s16, i32, i32, i32)
-DEF_HELPER_2(neon_hsub_u16, i32, i32, i32)
-DEF_HELPER_2(neon_hsub_s32, s32, s32, s32)
-DEF_HELPER_2(neon_hsub_u32, i32, i32, i32)
-
-DEF_HELPER_2(neon_pmin_u8, i32, i32, i32)
-DEF_HELPER_2(neon_pmin_s8, i32, i32, i32)
-DEF_HELPER_2(neon_pmin_u16, i32, i32, i32)
-DEF_HELPER_2(neon_pmin_s16, i32, i32, i32)
-DEF_HELPER_2(neon_pmax_u8, i32, i32, i32)
-DEF_HELPER_2(neon_pmax_s8, i32, i32, i32)
-DEF_HELPER_2(neon_pmax_u16, i32, i32, i32)
-DEF_HELPER_2(neon_pmax_s16, i32, i32, i32)
-
-DEF_HELPER_2(neon_shl_u16, i32, i32, i32)
-DEF_HELPER_2(neon_shl_s16, i32, i32, i32)
-DEF_HELPER_2(neon_rshl_u8, i32, i32, i32)
-DEF_HELPER_2(neon_rshl_s8, i32, i32, i32)
-DEF_HELPER_2(neon_rshl_u16, i32, i32, i32)
-DEF_HELPER_2(neon_rshl_s16, i32, i32, i32)
-DEF_HELPER_2(neon_rshl_u32, i32, i32, i32)
-DEF_HELPER_2(neon_rshl_s32, i32, i32, i32)
-DEF_HELPER_2(neon_rshl_u64, i64, i64, i64)
-DEF_HELPER_2(neon_rshl_s64, i64, i64, i64)
-DEF_HELPER_3(neon_qshl_u8, i32, env, i32, i32)
-DEF_HELPER_3(neon_qshl_s8, i32, env, i32, i32)
-DEF_HELPER_3(neon_qshl_u16, i32, env, i32, i32)
-DEF_HELPER_3(neon_qshl_s16, i32, env, i32, i32)
-DEF_HELPER_3(neon_qshl_u32, i32, env, i32, i32)
-DEF_HELPER_3(neon_qshl_s32, i32, env, i32, i32)
-DEF_HELPER_3(neon_qshl_u64, i64, env, i64, i64)
-DEF_HELPER_3(neon_qshl_s64, i64, env, i64, i64)
-DEF_HELPER_3(neon_qshlu_s8, i32, env, i32, i32)
-DEF_HELPER_3(neon_qshlu_s16, i32, env, i32, i32)
-DEF_HELPER_3(neon_qshlu_s32, i32, env, i32, i32)
-DEF_HELPER_3(neon_qshlu_s64, i64, env, i64, i64)
-DEF_HELPER_3(neon_qrshl_u8, i32, env, i32, i32)
-DEF_HELPER_3(neon_qrshl_s8, i32, env, i32, i32)
-DEF_HELPER_3(neon_qrshl_u16, i32, env, i32, i32)
-DEF_HELPER_3(neon_qrshl_s16, i32, env, i32, i32)
-DEF_HELPER_3(neon_qrshl_u32, i32, env, i32, i32)
-DEF_HELPER_3(neon_qrshl_s32, i32, env, i32, i32)
-DEF_HELPER_3(neon_qrshl_u64, i64, env, i64, i64)
-DEF_HELPER_3(neon_qrshl_s64, i64, env, i64, i64)
-
-DEF_HELPER_2(neon_add_u8, i32, i32, i32)
-DEF_HELPER_2(neon_add_u16, i32, i32, i32)
-DEF_HELPER_2(neon_padd_u8, i32, i32, i32)
-DEF_HELPER_2(neon_padd_u16, i32, i32, i32)
-DEF_HELPER_2(neon_sub_u8, i32, i32, i32)
-DEF_HELPER_2(neon_sub_u16, i32, i32, i32)
-DEF_HELPER_2(neon_mul_u8, i32, i32, i32)
-DEF_HELPER_2(neon_mul_u16, i32, i32, i32)
-
-DEF_HELPER_2(neon_tst_u8, i32, i32, i32)
-DEF_HELPER_2(neon_tst_u16, i32, i32, i32)
-DEF_HELPER_2(neon_tst_u32, i32, i32, i32)
-
-DEF_HELPER_1(neon_clz_u8, i32, i32)
-DEF_HELPER_1(neon_clz_u16, i32, i32)
-DEF_HELPER_1(neon_cls_s8, i32, i32)
-DEF_HELPER_1(neon_cls_s16, i32, i32)
-DEF_HELPER_1(neon_cls_s32, i32, i32)
-DEF_HELPER_1(neon_cnt_u8, i32, i32)
-DEF_HELPER_FLAGS_1(neon_rbit_u8, TCG_CALL_NO_RWG_SE, i32, i32)
-
-DEF_HELPER_3(neon_qdmulh_s16, i32, env, i32, i32)
-DEF_HELPER_3(neon_qrdmulh_s16, i32, env, i32, i32)
-DEF_HELPER_4(neon_qrdmlah_s16, i32, env, i32, i32, i32)
-DEF_HELPER_4(neon_qrdmlsh_s16, i32, env, i32, i32, i32)
-DEF_HELPER_3(neon_qdmulh_s32, i32, env, i32, i32)
-DEF_HELPER_3(neon_qrdmulh_s32, i32, env, i32, i32)
-DEF_HELPER_4(neon_qrdmlah_s32, i32, env, s32, s32, s32)
-DEF_HELPER_4(neon_qrdmlsh_s32, i32, env, s32, s32, s32)
-
-DEF_HELPER_1(neon_narrow_u8, i32, i64)
-DEF_HELPER_1(neon_narrow_u16, i32, i64)
-DEF_HELPER_2(neon_unarrow_sat8, i32, env, i64)
-DEF_HELPER_2(neon_narrow_sat_u8, i32, env, i64)
-DEF_HELPER_2(neon_narrow_sat_s8, i32, env, i64)
-DEF_HELPER_2(neon_unarrow_sat16, i32, env, i64)
-DEF_HELPER_2(neon_narrow_sat_u16, i32, env, i64)
-DEF_HELPER_2(neon_narrow_sat_s16, i32, env, i64)
-DEF_HELPER_2(neon_unarrow_sat32, i32, env, i64)
-DEF_HELPER_2(neon_narrow_sat_u32, i32, env, i64)
-DEF_HELPER_2(neon_narrow_sat_s32, i32, env, i64)
-DEF_HELPER_1(neon_narrow_high_u8, i32, i64)
-DEF_HELPER_1(neon_narrow_high_u16, i32, i64)
-DEF_HELPER_1(neon_narrow_round_high_u8, i32, i64)
-DEF_HELPER_1(neon_narrow_round_high_u16, i32, i64)
-DEF_HELPER_1(neon_widen_u8, i64, i32)
-DEF_HELPER_1(neon_widen_s8, i64, i32)
-DEF_HELPER_1(neon_widen_u16, i64, i32)
-DEF_HELPER_1(neon_widen_s16, i64, i32)
-
-DEF_HELPER_2(neon_addl_u16, i64, i64, i64)
-DEF_HELPER_2(neon_addl_u32, i64, i64, i64)
-DEF_HELPER_2(neon_paddl_u16, i64, i64, i64)
-DEF_HELPER_2(neon_paddl_u32, i64, i64, i64)
-DEF_HELPER_2(neon_subl_u16, i64, i64, i64)
-DEF_HELPER_2(neon_subl_u32, i64, i64, i64)
-DEF_HELPER_3(neon_addl_saturate_s32, i64, env, i64, i64)
-DEF_HELPER_3(neon_addl_saturate_s64, i64, env, i64, i64)
-DEF_HELPER_2(neon_abdl_u16, i64, i32, i32)
-DEF_HELPER_2(neon_abdl_s16, i64, i32, i32)
-DEF_HELPER_2(neon_abdl_u32, i64, i32, i32)
-DEF_HELPER_2(neon_abdl_s32, i64, i32, i32)
-DEF_HELPER_2(neon_abdl_u64, i64, i32, i32)
-DEF_HELPER_2(neon_abdl_s64, i64, i32, i32)
-DEF_HELPER_2(neon_mull_u8, i64, i32, i32)
-DEF_HELPER_2(neon_mull_s8, i64, i32, i32)
-DEF_HELPER_2(neon_mull_u16, i64, i32, i32)
-DEF_HELPER_2(neon_mull_s16, i64, i32, i32)
-
-DEF_HELPER_1(neon_negl_u16, i64, i64)
-DEF_HELPER_1(neon_negl_u32, i64, i64)
-
-DEF_HELPER_FLAGS_2(neon_qabs_s8, TCG_CALL_NO_RWG, i32, env, i32)
-DEF_HELPER_FLAGS_2(neon_qabs_s16, TCG_CALL_NO_RWG, i32, env, i32)
-DEF_HELPER_FLAGS_2(neon_qabs_s32, TCG_CALL_NO_RWG, i32, env, i32)
-DEF_HELPER_FLAGS_2(neon_qabs_s64, TCG_CALL_NO_RWG, i64, env, i64)
-DEF_HELPER_FLAGS_2(neon_qneg_s8, TCG_CALL_NO_RWG, i32, env, i32)
-DEF_HELPER_FLAGS_2(neon_qneg_s16, TCG_CALL_NO_RWG, i32, env, i32)
-DEF_HELPER_FLAGS_2(neon_qneg_s32, TCG_CALL_NO_RWG, i32, env, i32)
-DEF_HELPER_FLAGS_2(neon_qneg_s64, TCG_CALL_NO_RWG, i64, env, i64)
-
-DEF_HELPER_3(neon_ceq_f32, i32, i32, i32, ptr)
-DEF_HELPER_3(neon_cge_f32, i32, i32, i32, ptr)
-DEF_HELPER_3(neon_cgt_f32, i32, i32, i32, ptr)
-DEF_HELPER_3(neon_acge_f32, i32, i32, i32, ptr)
-DEF_HELPER_3(neon_acgt_f32, i32, i32, i32, ptr)
-DEF_HELPER_3(neon_acge_f64, i64, i64, i64, ptr)
-DEF_HELPER_3(neon_acgt_f64, i64, i64, i64, ptr)
-
-DEF_HELPER_FLAGS_2(neon_unzip8, TCG_CALL_NO_RWG, void, ptr, ptr)
-DEF_HELPER_FLAGS_2(neon_unzip16, TCG_CALL_NO_RWG, void, ptr, ptr)
-DEF_HELPER_FLAGS_2(neon_qunzip8, TCG_CALL_NO_RWG, void, ptr, ptr)
-DEF_HELPER_FLAGS_2(neon_qunzip16, TCG_CALL_NO_RWG, void, ptr, ptr)
-DEF_HELPER_FLAGS_2(neon_qunzip32, TCG_CALL_NO_RWG, void, ptr, ptr)
-DEF_HELPER_FLAGS_2(neon_zip8, TCG_CALL_NO_RWG, void, ptr, ptr)
-DEF_HELPER_FLAGS_2(neon_zip16, TCG_CALL_NO_RWG, void, ptr, ptr)
-DEF_HELPER_FLAGS_2(neon_qzip8, TCG_CALL_NO_RWG, void, ptr, ptr)
-DEF_HELPER_FLAGS_2(neon_qzip16, TCG_CALL_NO_RWG, void, ptr, ptr)
-DEF_HELPER_FLAGS_2(neon_qzip32, TCG_CALL_NO_RWG, void, ptr, ptr)
-
 DEF_HELPER_FLAGS_4(crypto_aese, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(crypto_aesmc, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
@@ -396,13 +209,6 @@ DEF_HELPER_FLAGS_6(gvec_fcmlas_idx, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_6(gvec_fcmlad, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 
-DEF_HELPER_FLAGS_5(neon_paddh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_5(neon_pmaxh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_5(neon_pminh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_5(neon_padds, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_5(neon_pmaxs, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_5(neon_pmins, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
-
 DEF_HELPER_FLAGS_4(gvec_sstoh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_sitos, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_ustoh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
@@ -618,8 +424,6 @@ DEF_HELPER_FLAGS_4(gvec_ushl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_pmul_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_pmull_q, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
-DEF_HELPER_FLAGS_4(neon_pmull_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-
 DEF_HELPER_FLAGS_3(gvec_ssra_b, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(gvec_ssra_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(gvec_ssra_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
@@ -698,16 +502,6 @@ DEF_HELPER_FLAGS_5(gvec_mls_idx_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(gvec_mls_idx_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
-DEF_HELPER_FLAGS_5(neon_sqdmulh_h, TCG_CALL_NO_RWG,
-                   void, ptr, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_5(neon_sqdmulh_s, TCG_CALL_NO_RWG,
-                   void, ptr, ptr, ptr, ptr, i32)
-
-DEF_HELPER_FLAGS_5(neon_sqrdmulh_h, TCG_CALL_NO_RWG,
-                   void, ptr, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_5(neon_sqrdmulh_s, TCG_CALL_NO_RWG,
-                   void, ptr, ptr, ptr, ptr, i32)
-
 DEF_HELPER_FLAGS_4(sve2_sqdmulh_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_sqdmulh_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_sqdmulh_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
@@ -783,4 +577,5 @@ DEF_HELPER_FLAGS_5(gvec_uclamp_d, TCG_CALL_NO_RWG,
 #include "tcg/helper-sme.h.inc"
 #endif
 
+#include "tcg/helper-neon.h.inc"
 #include "tcg/helper-mve.h.inc"
diff --git a/target/arm/tcg/helper-a64.h.inc b/target/arm/tcg/helper-a64.h.inc
index e6c518323e..adff15600d 100644
--- a/target/arm/tcg/helper-a64.h.inc
+++ b/target/arm/tcg/helper-a64.h.inc
@@ -23,19 +23,12 @@ DEF_HELPER_2(msr_i_spsel, void, env, i32)
 DEF_HELPER_2(msr_i_daifset, void, env, i32)
 DEF_HELPER_2(msr_i_daifclear, void, env, i32)
 DEF_HELPER_FLAGS_4(simd_tblx, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_3(neon_ceq_f64, TCG_CALL_NO_RWG, i64, i64, i64, ptr)
-DEF_HELPER_FLAGS_3(neon_cge_f64, TCG_CALL_NO_RWG, i64, i64, i64, ptr)
-DEF_HELPER_FLAGS_3(neon_cgt_f64, TCG_CALL_NO_RWG, i64, i64, i64, ptr)
 DEF_HELPER_FLAGS_3(recpsf_f16, TCG_CALL_NO_RWG, f16, f16, f16, ptr)
 DEF_HELPER_FLAGS_3(recpsf_f32, TCG_CALL_NO_RWG, f32, f32, f32, ptr)
 DEF_HELPER_FLAGS_3(recpsf_f64, TCG_CALL_NO_RWG, f64, f64, f64, ptr)
 DEF_HELPER_FLAGS_3(rsqrtsf_f16, TCG_CALL_NO_RWG, f16, f16, f16, ptr)
 DEF_HELPER_FLAGS_3(rsqrtsf_f32, TCG_CALL_NO_RWG, f32, f32, f32, ptr)
 DEF_HELPER_FLAGS_3(rsqrtsf_f64, TCG_CALL_NO_RWG, f64, f64, f64, ptr)
-DEF_HELPER_FLAGS_1(neon_addlp_s8, TCG_CALL_NO_RWG_SE, i64, i64)
-DEF_HELPER_FLAGS_1(neon_addlp_u8, TCG_CALL_NO_RWG_SE, i64, i64)
-DEF_HELPER_FLAGS_1(neon_addlp_s16, TCG_CALL_NO_RWG_SE, i64, i64)
-DEF_HELPER_FLAGS_1(neon_addlp_u16, TCG_CALL_NO_RWG_SE, i64, i64)
 DEF_HELPER_FLAGS_2(frecpx_f64, TCG_CALL_NO_RWG, f64, f64, ptr)
 DEF_HELPER_FLAGS_2(frecpx_f32, TCG_CALL_NO_RWG, f32, f32, ptr)
 DEF_HELPER_FLAGS_2(frecpx_f16, TCG_CALL_NO_RWG, f16, f16, ptr)
diff --git a/target/arm/tcg/helper-neon.h.inc b/target/arm/tcg/helper-neon.h.inc
new file mode 100644
index 0000000000..838d05c359
--- /dev/null
+++ b/target/arm/tcg/helper-neon.h.inc
@@ -0,0 +1,224 @@
+/*
+ * ARM NEON helper definitions
+ *
+ * Copyright (c) 2007, 2008 CodeSourcery.
+ * Written by Paul Brook
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+DEF_HELPER_FLAGS_4(neon_tbl, TCG_CALL_NO_RWG, i64, env, i32, i64, i64)
+
+DEF_HELPER_FLAGS_3(neon_qadd_u8, TCG_CALL_NO_RWG, i32, env, i32, i32)
+DEF_HELPER_FLAGS_3(neon_qadd_s8, TCG_CALL_NO_RWG, i32, env, i32, i32)
+DEF_HELPER_FLAGS_3(neon_qadd_u16, TCG_CALL_NO_RWG, i32, env, i32, i32)
+DEF_HELPER_FLAGS_3(neon_qadd_s16, TCG_CALL_NO_RWG, i32, env, i32, i32)
+DEF_HELPER_FLAGS_3(neon_qadd_u32, TCG_CALL_NO_RWG, i32, env, i32, i32)
+DEF_HELPER_FLAGS_3(neon_qadd_s32, TCG_CALL_NO_RWG, i32, env, i32, i32)
+DEF_HELPER_FLAGS_3(neon_uqadd_s8, TCG_CALL_NO_RWG, i32, env, i32, i32)
+DEF_HELPER_FLAGS_3(neon_uqadd_s16, TCG_CALL_NO_RWG, i32, env, i32, i32)
+DEF_HELPER_FLAGS_3(neon_uqadd_s32, TCG_CALL_NO_RWG, i32, env, i32, i32)
+DEF_HELPER_FLAGS_3(neon_uqadd_s64, TCG_CALL_NO_RWG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(neon_sqadd_u8, TCG_CALL_NO_RWG, i32, env, i32, i32)
+DEF_HELPER_FLAGS_3(neon_sqadd_u16, TCG_CALL_NO_RWG, i32, env, i32, i32)
+DEF_HELPER_FLAGS_3(neon_sqadd_u32, TCG_CALL_NO_RWG, i32, env, i32, i32)
+DEF_HELPER_FLAGS_3(neon_sqadd_u64, TCG_CALL_NO_RWG, i64, env, i64, i64)
+DEF_HELPER_3(neon_qsub_u8, i32, env, i32, i32)
+DEF_HELPER_3(neon_qsub_s8, i32, env, i32, i32)
+DEF_HELPER_3(neon_qsub_u16, i32, env, i32, i32)
+DEF_HELPER_3(neon_qsub_s16, i32, env, i32, i32)
+DEF_HELPER_3(neon_qsub_u32, i32, env, i32, i32)
+DEF_HELPER_3(neon_qsub_s32, i32, env, i32, i32)
+DEF_HELPER_3(neon_qadd_u64, i64, env, i64, i64)
+DEF_HELPER_3(neon_qadd_s64, i64, env, i64, i64)
+DEF_HELPER_3(neon_qsub_u64, i64, env, i64, i64)
+DEF_HELPER_3(neon_qsub_s64, i64, env, i64, i64)
+
+DEF_HELPER_2(neon_hadd_s8, i32, i32, i32)
+DEF_HELPER_2(neon_hadd_u8, i32, i32, i32)
+DEF_HELPER_2(neon_hadd_s16, i32, i32, i32)
+DEF_HELPER_2(neon_hadd_u16, i32, i32, i32)
+DEF_HELPER_2(neon_hadd_s32, s32, s32, s32)
+DEF_HELPER_2(neon_hadd_u32, i32, i32, i32)
+DEF_HELPER_2(neon_rhadd_s8, i32, i32, i32)
+DEF_HELPER_2(neon_rhadd_u8, i32, i32, i32)
+DEF_HELPER_2(neon_rhadd_s16, i32, i32, i32)
+DEF_HELPER_2(neon_rhadd_u16, i32, i32, i32)
+DEF_HELPER_2(neon_rhadd_s32, s32, s32, s32)
+DEF_HELPER_2(neon_rhadd_u32, i32, i32, i32)
+DEF_HELPER_2(neon_hsub_s8, i32, i32, i32)
+DEF_HELPER_2(neon_hsub_u8, i32, i32, i32)
+DEF_HELPER_2(neon_hsub_s16, i32, i32, i32)
+DEF_HELPER_2(neon_hsub_u16, i32, i32, i32)
+DEF_HELPER_2(neon_hsub_s32, s32, s32, s32)
+DEF_HELPER_2(neon_hsub_u32, i32, i32, i32)
+
+DEF_HELPER_2(neon_pmin_u8, i32, i32, i32)
+DEF_HELPER_2(neon_pmin_s8, i32, i32, i32)
+DEF_HELPER_2(neon_pmin_u16, i32, i32, i32)
+DEF_HELPER_2(neon_pmin_s16, i32, i32, i32)
+DEF_HELPER_2(neon_pmax_u8, i32, i32, i32)
+DEF_HELPER_2(neon_pmax_s8, i32, i32, i32)
+DEF_HELPER_2(neon_pmax_u16, i32, i32, i32)
+DEF_HELPER_2(neon_pmax_s16, i32, i32, i32)
+
+DEF_HELPER_2(neon_shl_u16, i32, i32, i32)
+DEF_HELPER_2(neon_shl_s16, i32, i32, i32)
+DEF_HELPER_2(neon_rshl_u8, i32, i32, i32)
+DEF_HELPER_2(neon_rshl_s8, i32, i32, i32)
+DEF_HELPER_2(neon_rshl_u16, i32, i32, i32)
+DEF_HELPER_2(neon_rshl_s16, i32, i32, i32)
+DEF_HELPER_2(neon_rshl_u32, i32, i32, i32)
+DEF_HELPER_2(neon_rshl_s32, i32, i32, i32)
+DEF_HELPER_2(neon_rshl_u64, i64, i64, i64)
+DEF_HELPER_2(neon_rshl_s64, i64, i64, i64)
+DEF_HELPER_3(neon_qshl_u8, i32, env, i32, i32)
+DEF_HELPER_3(neon_qshl_s8, i32, env, i32, i32)
+DEF_HELPER_3(neon_qshl_u16, i32, env, i32, i32)
+DEF_HELPER_3(neon_qshl_s16, i32, env, i32, i32)
+DEF_HELPER_3(neon_qshl_u32, i32, env, i32, i32)
+DEF_HELPER_3(neon_qshl_s32, i32, env, i32, i32)
+DEF_HELPER_3(neon_qshl_u64, i64, env, i64, i64)
+DEF_HELPER_3(neon_qshl_s64, i64, env, i64, i64)
+DEF_HELPER_3(neon_qshlu_s8, i32, env, i32, i32)
+DEF_HELPER_3(neon_qshlu_s16, i32, env, i32, i32)
+DEF_HELPER_3(neon_qshlu_s32, i32, env, i32, i32)
+DEF_HELPER_3(neon_qshlu_s64, i64, env, i64, i64)
+DEF_HELPER_3(neon_qrshl_u8, i32, env, i32, i32)
+DEF_HELPER_3(neon_qrshl_s8, i32, env, i32, i32)
+DEF_HELPER_3(neon_qrshl_u16, i32, env, i32, i32)
+DEF_HELPER_3(neon_qrshl_s16, i32, env, i32, i32)
+DEF_HELPER_3(neon_qrshl_u32, i32, env, i32, i32)
+DEF_HELPER_3(neon_qrshl_s32, i32, env, i32, i32)
+DEF_HELPER_3(neon_qrshl_u64, i64, env, i64, i64)
+DEF_HELPER_3(neon_qrshl_s64, i64, env, i64, i64)
+
+DEF_HELPER_2(neon_add_u8, i32, i32, i32)
+DEF_HELPER_2(neon_add_u16, i32, i32, i32)
+DEF_HELPER_2(neon_padd_u8, i32, i32, i32)
+DEF_HELPER_2(neon_padd_u16, i32, i32, i32)
+DEF_HELPER_2(neon_sub_u8, i32, i32, i32)
+DEF_HELPER_2(neon_sub_u16, i32, i32, i32)
+DEF_HELPER_2(neon_mul_u8, i32, i32, i32)
+DEF_HELPER_2(neon_mul_u16, i32, i32, i32)
+
+DEF_HELPER_2(neon_tst_u8, i32, i32, i32)
+DEF_HELPER_2(neon_tst_u16, i32, i32, i32)
+DEF_HELPER_2(neon_tst_u32, i32, i32, i32)
+
+DEF_HELPER_1(neon_clz_u8, i32, i32)
+DEF_HELPER_1(neon_clz_u16, i32, i32)
+DEF_HELPER_1(neon_cls_s8, i32, i32)
+DEF_HELPER_1(neon_cls_s16, i32, i32)
+DEF_HELPER_1(neon_cls_s32, i32, i32)
+DEF_HELPER_1(neon_cnt_u8, i32, i32)
+DEF_HELPER_FLAGS_1(neon_rbit_u8, TCG_CALL_NO_RWG_SE, i32, i32)
+
+DEF_HELPER_3(neon_qdmulh_s16, i32, env, i32, i32)
+DEF_HELPER_3(neon_qrdmulh_s16, i32, env, i32, i32)
+DEF_HELPER_4(neon_qrdmlah_s16, i32, env, i32, i32, i32)
+DEF_HELPER_4(neon_qrdmlsh_s16, i32, env, i32, i32, i32)
+DEF_HELPER_3(neon_qdmulh_s32, i32, env, i32, i32)
+DEF_HELPER_3(neon_qrdmulh_s32, i32, env, i32, i32)
+DEF_HELPER_4(neon_qrdmlah_s32, i32, env, s32, s32, s32)
+DEF_HELPER_4(neon_qrdmlsh_s32, i32, env, s32, s32, s32)
+
+DEF_HELPER_1(neon_narrow_u8, i32, i64)
+DEF_HELPER_1(neon_narrow_u16, i32, i64)
+DEF_HELPER_2(neon_unarrow_sat8, i32, env, i64)
+DEF_HELPER_2(neon_narrow_sat_u8, i32, env, i64)
+DEF_HELPER_2(neon_narrow_sat_s8, i32, env, i64)
+DEF_HELPER_2(neon_unarrow_sat16, i32, env, i64)
+DEF_HELPER_2(neon_narrow_sat_u16, i32, env, i64)
+DEF_HELPER_2(neon_narrow_sat_s16, i32, env, i64)
+DEF_HELPER_2(neon_unarrow_sat32, i32, env, i64)
+DEF_HELPER_2(neon_narrow_sat_u32, i32, env, i64)
+DEF_HELPER_2(neon_narrow_sat_s32, i32, env, i64)
+DEF_HELPER_1(neon_narrow_high_u8, i32, i64)
+DEF_HELPER_1(neon_narrow_high_u16, i32, i64)
+DEF_HELPER_1(neon_narrow_round_high_u8, i32, i64)
+DEF_HELPER_1(neon_narrow_round_high_u16, i32, i64)
+DEF_HELPER_1(neon_widen_u8, i64, i32)
+DEF_HELPER_1(neon_widen_s8, i64, i32)
+DEF_HELPER_1(neon_widen_u16, i64, i32)
+DEF_HELPER_1(neon_widen_s16, i64, i32)
+
+DEF_HELPER_2(neon_addl_u16, i64, i64, i64)
+DEF_HELPER_2(neon_addl_u32, i64, i64, i64)
+DEF_HELPER_2(neon_paddl_u16, i64, i64, i64)
+DEF_HELPER_2(neon_paddl_u32, i64, i64, i64)
+DEF_HELPER_2(neon_subl_u16, i64, i64, i64)
+DEF_HELPER_2(neon_subl_u32, i64, i64, i64)
+DEF_HELPER_3(neon_addl_saturate_s32, i64, env, i64, i64)
+DEF_HELPER_3(neon_addl_saturate_s64, i64, env, i64, i64)
+DEF_HELPER_2(neon_abdl_u16, i64, i32, i32)
+DEF_HELPER_2(neon_abdl_s16, i64, i32, i32)
+DEF_HELPER_2(neon_abdl_u32, i64, i32, i32)
+DEF_HELPER_2(neon_abdl_s32, i64, i32, i32)
+DEF_HELPER_2(neon_abdl_u64, i64, i32, i32)
+DEF_HELPER_2(neon_abdl_s64, i64, i32, i32)
+DEF_HELPER_2(neon_mull_u8, i64, i32, i32)
+DEF_HELPER_2(neon_mull_s8, i64, i32, i32)
+DEF_HELPER_2(neon_mull_u16, i64, i32, i32)
+DEF_HELPER_2(neon_mull_s16, i64, i32, i32)
+
+DEF_HELPER_1(neon_negl_u16, i64, i64)
+DEF_HELPER_1(neon_negl_u32, i64, i64)
+
+DEF_HELPER_FLAGS_2(neon_qabs_s8, TCG_CALL_NO_RWG, i32, env, i32)
+DEF_HELPER_FLAGS_2(neon_qabs_s16, TCG_CALL_NO_RWG, i32, env, i32)
+DEF_HELPER_FLAGS_2(neon_qabs_s32, TCG_CALL_NO_RWG, i32, env, i32)
+DEF_HELPER_FLAGS_2(neon_qabs_s64, TCG_CALL_NO_RWG, i64, env, i64)
+DEF_HELPER_FLAGS_2(neon_qneg_s8, TCG_CALL_NO_RWG, i32, env, i32)
+DEF_HELPER_FLAGS_2(neon_qneg_s16, TCG_CALL_NO_RWG, i32, env, i32)
+DEF_HELPER_FLAGS_2(neon_qneg_s32, TCG_CALL_NO_RWG, i32, env, i32)
+DEF_HELPER_FLAGS_2(neon_qneg_s64, TCG_CALL_NO_RWG, i64, env, i64)
+
+DEF_HELPER_3(neon_ceq_f32, i32, i32, i32, ptr)
+DEF_HELPER_3(neon_cge_f32, i32, i32, i32, ptr)
+DEF_HELPER_3(neon_cgt_f32, i32, i32, i32, ptr)
+DEF_HELPER_3(neon_acge_f32, i32, i32, i32, ptr)
+DEF_HELPER_3(neon_acgt_f32, i32, i32, i32, ptr)
+DEF_HELPER_3(neon_acge_f64, i64, i64, i64, ptr)
+DEF_HELPER_3(neon_acgt_f64, i64, i64, i64, ptr)
+
+DEF_HELPER_FLAGS_2(neon_unzip8, TCG_CALL_NO_RWG, void, ptr, ptr)
+DEF_HELPER_FLAGS_2(neon_unzip16, TCG_CALL_NO_RWG, void, ptr, ptr)
+DEF_HELPER_FLAGS_2(neon_qunzip8, TCG_CALL_NO_RWG, void, ptr, ptr)
+DEF_HELPER_FLAGS_2(neon_qunzip16, TCG_CALL_NO_RWG, void, ptr, ptr)
+DEF_HELPER_FLAGS_2(neon_qunzip32, TCG_CALL_NO_RWG, void, ptr, ptr)
+DEF_HELPER_FLAGS_2(neon_zip8, TCG_CALL_NO_RWG, void, ptr, ptr)
+DEF_HELPER_FLAGS_2(neon_zip16, TCG_CALL_NO_RWG, void, ptr, ptr)
+DEF_HELPER_FLAGS_2(neon_qzip8, TCG_CALL_NO_RWG, void, ptr, ptr)
+DEF_HELPER_FLAGS_2(neon_qzip16, TCG_CALL_NO_RWG, void, ptr, ptr)
+DEF_HELPER_FLAGS_2(neon_qzip32, TCG_CALL_NO_RWG, void, ptr, ptr)
+
+DEF_HELPER_FLAGS_5(neon_paddh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_pmaxh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_pminh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_padds, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_pmaxs, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_pmins, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(neon_pmull_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(neon_sqdmulh_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_sqdmulh_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(neon_sqrdmulh_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_sqrdmulh_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+#ifdef TARGET_AARCH64
+DEF_HELPER_FLAGS_1(neon_addlp_s8, TCG_CALL_NO_RWG_SE, i64, i64)
+DEF_HELPER_FLAGS_1(neon_addlp_u8, TCG_CALL_NO_RWG_SE, i64, i64)
+DEF_HELPER_FLAGS_1(neon_addlp_s16, TCG_CALL_NO_RWG_SE, i64, i64)
+DEF_HELPER_FLAGS_1(neon_addlp_u16, TCG_CALL_NO_RWG_SE, i64, i64)
+
+DEF_HELPER_FLAGS_3(neon_ceq_f64, TCG_CALL_NO_RWG, i64, i64, i64, ptr)
+DEF_HELPER_FLAGS_3(neon_cge_f64, TCG_CALL_NO_RWG, i64, i64, i64, ptr)
+DEF_HELPER_FLAGS_3(neon_cgt_f64, TCG_CALL_NO_RWG, i64, i64, i64, ptr)
+#endif
-- 
2.38.1

