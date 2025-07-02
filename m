Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3792366dye;
        Wed, 2 Jul 2025 06:01:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX6k5qXKIbmoNKrKauE/y7hZEDLZtg4HDgWlvFA9ps1/arIu+wyH54NB5/Q9mov4v7UEDpNmIeMmawYLg==@linaro.org
X-Google-Smtp-Source: AGHT+IHacZJni55WSYa94ZmA5fm3lw58LBl2YcBYFJPmmgJPX2I6ELFri1ep5yZA9gRrnjn23GVz
X-Received: by 2002:a05:620a:1a1c:b0:7ca:f40c:c1c6 with SMTP id af79cd13be357-7d5c47ba45cmr411667285a.44.1751461271230;
        Wed, 02 Jul 2025 06:01:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751461271; cv=none;
        d=google.com; s=arc-20240605;
        b=lUjHbQ5n9+tHb7T/eVQ0+bIzz2IVtGos20OnyCP62Ay3v8kRpjWDXRr1QnM0Jlkwj3
         0K11t2ddvQT/QaupYeHLxkBl1mogjeoAAukDSt5mkPV/XD+LpR7EwEl+LrDAzABQYFXg
         /FZ3nwmMkXOCi+qvhuAz0WihTxiHNPue8Chvo3NZcAWBLoVjwCY4lWj2sV/3LCSOfvAL
         CkokVddIvfwaV/wSUVHAE3nFs4pvQ2fvqG4Ndk5HbAGZxuA1SqgVGOX1X+/wQaDgTOhu
         E2+Vpg4hqmDf/M8ONhDlDjgh+wMDw+fDYLpaAvghItFkiSDacdhWz7pogPadhwUAUmYc
         +H8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8C/wkbnZTuy6uWFeOHVvDoeWONxE+AwGqQusVfoPHOE=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=cSFRnJ5q+dRzwEWm1bo/VqCGwMp9fp5pHZ1Jc44MD3+8jzmBnxL56ON/wACTe1QZSO
         82aAMKubCO/jwr4MrpBazubCJ3Hh7Cn/ibSiDz7Q878lMxM2SVWO01PVDKkLK/Q1n/4n
         md3MVan0VCh2dSL//KH33Qs8rO48xlLx58vBtgCMTjaEUAIV77ku3rxDDJikhwpwhoFS
         ciEpes7DEJ2TPmNc9/GEvklr6tGwnUy8cCPmzcPh+P3tj8Qzv1fcSgXfnG8AOzvm1zFJ
         YtLzdYj/WsCfTUDIgkm8YHmdxYRA3iiYeiVQoV2U4NNkzXXvP+bp4XajpdkVVM9b1GvO
         NhUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qPOKIJ/u";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d44324c921si1229992885a.348.2025.07.02.06.01.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 06:01:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qPOKIJ/u";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwpQ-0004XX-KY; Wed, 02 Jul 2025 08:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwk6-0004rj-Nt
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:39:20 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwjm-0002H6-8c
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:39:13 -0400
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-40ad1f7c23bso2913708b6e.2
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459931; x=1752064731; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8C/wkbnZTuy6uWFeOHVvDoeWONxE+AwGqQusVfoPHOE=;
 b=qPOKIJ/u06dBAqG95dA8tf8fzy6xGvxNJSJhywykU4nHAjzHpeN1IOKDuGJ7y8ABle
 QICs4j0pR4b+DuXKHh7lBN8iYGd795/+tucy/FUL+dD9Rd4uhXdTH5uVn9th2Y9KWXRU
 1andoOCBCsthbdBJ9H1Rou+7+1vhhuG1uIZIfw2lKGTZ5GU7seMzXK3ZGlckISUbvA9J
 7jZosCuqsQoDG4rPRX2J1FOfgPLwZq5Dcxq+7R822Ykqf91jlLa/ZDlF0U/KdqPWJwRt
 RG/UHV/IcsfYe2GREKbH/bJieU166GofNdKpspw6oOyAzRX/ljFjkHmSJw++cGgwF9J3
 kOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459931; x=1752064731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8C/wkbnZTuy6uWFeOHVvDoeWONxE+AwGqQusVfoPHOE=;
 b=quPX3XrX8KoZa489f8VFS/Nr6hdRXl7lQ6xgUZ6iNWawvg3LDyFB9plrUqLZNlABrr
 IREAYnk8e+IX7idQ3bbdHT/uaXypb0R1J88ZpSSK7Gzal7izY7DeqmLi6S0QCvbjByRO
 x0JAr7k3L1vm2QW+t7atZvlLhKtTQqO8EVi0oNFVti/OdRDUTPaXfM/o72iZAth64VPX
 8iYGj5hIK4d6QWVLqhKl1t7+KsvcEowHRmuGPHDyXSL4lI0943pLDZEUdJOkZ6seLmAQ
 vMAhCG4ZUMRFs9KRD/ly9Ne8mmh296f+n6QGTTO2e3QW8/emAsQcLVj7XBQoUmQcaqTG
 yw3Q==
X-Gm-Message-State: AOJu0Yx7Yt8PIDTemU+/+bOanUZWaskLwVskR0116LHK2ZwoYHbHNsdL
 atwWvATcJZR4E/B6b/A1oD/YICd1ZBvhHR8zG+ZB6B5RzYRHPfHirQteDJLAJNXD1Hs=
X-Gm-Gg: ASbGncuM62VZlcaTOV3ySzdaGHmUrjlLh8KpMreQysAJdRqUkSrAqhyhYSNvtHCOhOW
 pm9MmLWqobpVH/T0n9I9xlHqDxwyUiWrhYumSygmN/hPUo/8K46KA7RGVTQGJphojz+2257bgyW
 WjxiKAjWFovnV+A3B5i/5LDqYm8N7lOtdXizF6dHEjwLwe5mJ7rWvhKM4HazcHmyPXAUYuN01YF
 CrLWXueko/enu96Hu6iWDxmpNn/GhMmsYNzS+kU8jWg+djWtjzeo0wGvEkep5JrlWVpTdAtaFld
 VWjjYVUhLLIV2TWfs6y05YNC72l1QdiYoHYV+vXAgoFrNgw2+uMWk/rXsNRlMgHjjW7vUBnLMzf
 R5jfc
X-Received: by 2002:a05:6808:1b99:b0:409:f8e:7297 with SMTP id
 5614622812f47-40b8840cf7emr1738323b6e.0.1751459931273; 
 Wed, 02 Jul 2025 05:38:51 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd4ea5d9fsm3843451fac.10.2025.07.02.05.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:38:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 77/97] target/arm: Implement DUPQ for SME2p1/SVE2p1
Date: Wed,  2 Jul 2025 06:33:50 -0600
Message-ID: <20250702123410.761208-78-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 4VlYlfkR9mRG

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 21 +++++++++++++++++++++
 target/arm/tcg/sve.decode      |  6 ++++++
 2 files changed, 27 insertions(+)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 53db8851bf..e33b2eb2a4 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -2249,6 +2249,27 @@ static bool trans_DUP_x(DisasContext *s, arg_DUP_x *a)
     return true;
 }
 
+static bool trans_DUPQ(DisasContext *s, arg_DUPQ *a)
+{
+    unsigned vl, dofs, nofs;
+
+    if (!dc_isar_feature(aa64_sme2p1_or_sve2p1, s)) {
+        return false;
+    }
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    vl = vec_full_reg_size(s);
+    dofs = vec_full_reg_offset(s, a->rd);
+    nofs = vec_reg_offset(s, a->rn, a->imm, a->esz);
+
+    for (unsigned i = 0; i < vl; i += 16) {
+        tcg_gen_gvec_dup_mem(a->esz, dofs + i, nofs + i, 16, 16);
+    }
+    return true;
+}
+
 static void do_insr_i64(DisasContext *s, arg_rrr_esz *a, TCGv_i64 val)
 {
     typedef void gen_insr(TCGv_ptr, TCGv_ptr, TCGv_i64, TCGv_i32);
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index db16849731..2650e00f80 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -577,6 +577,12 @@ DUP_s           00000101 .. 1 00000 001110 ..... .....          @rd_rn
 DUP_x           00000101 .. 1 ..... 001000 rn:5 rd:5 \
                 &rri imm=%imm7_22_16
 
+# SVE Permute Vector - one source quadwords
+DUPQ            00000101 001 imm:4    1 001001 rn:5 rd:5        &rri_esz esz=0
+DUPQ            00000101 001 imm:3   10 001001 rn:5 rd:5        &rri_esz esz=1
+DUPQ            00000101 001 imm:2  100 001001 rn:5 rd:5        &rri_esz esz=2
+DUPQ            00000101 001 imm:1 1000 001001 rn:5 rd:5        &rri_esz esz=3
+
 # SVE insert SIMD&FP scalar register
 INSR_f          00000101 .. 1 10100 001110 ..... .....          @rdn_rm
 
-- 
2.43.0

