Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2774710njk;
        Mon, 27 Jan 2025 15:27:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXoV1BrctOse81TwMjGv6PSxvWk6XOzKAfbWiQqSwRjNS2uQKgUBNnUO2GvpQK+NYISO/s4jmLH5EJvFw==@linaro.org
X-Google-Smtp-Source: AGHT+IEnr8vY+8WzEM9HvNTpL24W+o9+kCsKX5iNqSIEFRhoyDBqaIfSa3+51I6BnFwkFmlzFrEL
X-Received: by 2002:a05:620a:40c4:b0:7b6:bbe8:7d6e with SMTP id af79cd13be357-7be63248fa6mr7136537085a.40.1738020434491;
        Mon, 27 Jan 2025 15:27:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738020434; cv=none;
        d=google.com; s=arc-20240605;
        b=NRlc7OdC+j4kDffB8v3cyKMkp363+2RGAyn6psEtsuxjL7cvhLSPkt3QMx5iZYLXoh
         wHK3YWXRDNxjfEzd6oDJcEdtDWMfKFuy2GaVjKwwtM+aH0PNqS8nUH5OcHTCgbU64d4c
         C9dQ/pFRxFUS3MpTR0ytGoCdkWRI0N1tJvCJDJCOKk73kPD9lX5oz4XkeG984NX+DBmR
         jMwN/HvJ/J0TW1g37VhuWLt05Vv4dcJskH/OVfZXaZ7h83qgMY7D3UgRTa+QwqLhz5QR
         ZgKxniyHbahL9yQ8Zkt9SCgl0zNstLXlk3D33upV+/yrIIkXoLh/lDy5iuNrunk74mtZ
         gKew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rk7p3KoLMaA8jIVTStdirSWe3SnWd0+FSfM/mtBWd+A=;
        fh=h0hbpfZwXfxXozc6AETN9EtPT/+sArK9Hb3B9pNFDqM=;
        b=AItNb2FptKewbNohy7+TsXKoZh5Y+mVcVDtBUYgRQ60fldHnfuWgYAmhOffwixV82i
         /efnpdPhNFLs3ZxeJISls/H9CTd4A8dsKqadLuy/TwRvIF4ZWdMj8WQaTut677TgLnDl
         dNJcrVFuWQijBV9ToW3ifH/edl8/5xASA3nLKuyvgjr+2XbknVHbtRvsvJwHIfShzNhP
         8+SKITTJw81yq+fKVX8H90bKxYWlznEAYwLeORsEq/1oSC8y71DNBqV4VAbKMHwzPgem
         TkIvETUwGb8vLXIJT5UIKnWNmllK9pNHAP7DiHVso78YHeFSMJuCBGMDLkxB+77xlmev
         Ykvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nwKEgd41;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9ae9322esi1071288285a.146.2025.01.27.15.27.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 15:27:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nwKEgd41;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcYV1-0006Zy-Ef; Mon, 27 Jan 2025 18:26:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcYUr-0006Rs-8V
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 18:26:25 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcYUo-0005eD-Nq
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 18:26:25 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-2f43d17b0e3so8865633a91.0
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 15:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738020381; x=1738625181; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rk7p3KoLMaA8jIVTStdirSWe3SnWd0+FSfM/mtBWd+A=;
 b=nwKEgd41n42P9Z/QJibebnIX2HxAlpXQcQNxebz2zAwvvlLywnEg2utCEBJRP/UDCI
 WhEqfabPHoeYFdQntw5G4hPCv5jn7ifvO+0Ykr5m6J/64FeM7udrs3MmICSW10MYvGT7
 JIXOzkwu9Cicn+Zd1h8t1DXSlekQTEVV9G0pA7WMBoJf3LiK4zOwR7Ji3YVdlBD4ZgMs
 vhei0TbL0iWm+YfZQzy3NWFlibEdDWcIDpHYuKzhoc3B9OZRWEbd8GuzVjE6Oho7PouJ
 bPd0445KQuORt1hnruJaor04aP+r2DUFK/jy6kZ2Hg9e587kleEmdWTJfP+fhgd2ThBy
 8QTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738020381; x=1738625181;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rk7p3KoLMaA8jIVTStdirSWe3SnWd0+FSfM/mtBWd+A=;
 b=mHB8snDyQlzsbtqQJXSNseZbi8wNWsDNkJ9ekIk6yGsKn6JzKpIurwWv4mjJz+hK5T
 HavyHNiu+EjtKeUJxXW1HcYb6o63+so13Y5DpTsY491UuDIvynhz+mVlX1Pxa2Eh4gfM
 QzeRA05H/fqYtyBST/u/rUlSn/oGBs2iIFySeaN7nRyt5zl5wx5htuV0q5LnbFf56OVB
 T88GL/KH5pvemHIWcSTSL87D+GIH1MgFAynSeFIiWo3MFinqsMJ6scptWtAoDyFb0nAp
 Tn3+aQpYxxwCQyjjECwUszuLnt4Ssq+geVxBxKiG/BUzKvrccKrPaL29uWUQg3+PAtzR
 XO5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzdhtOLcvf0QTvf8neQ0LQLI9gaHXwY19P1/vt6BgelUr72o5otSU1zF6Im1AA/oN/8W2Z1j1hRQ==@nongnu.org
X-Gm-Message-State: AOJu0YxejqVu5ZcDZlOKoLuMgD9RPCXngRvWBhgITcMcJM7oDx0c4fTa
 qxk4T1BYNc7yHuAlXeQlv6US1Ma/hrRQDmbrsVgNd3IqapsoaoGgVOMSqHr/Ww+TaEpISjOiX8B
 M
X-Gm-Gg: ASbGncsJPmGSgaasr2+c64HbsCummW2f4OBqN6qC/HChyYYQM9tp5ZEa6+Z6TJpP6gv
 CTP6hvYIRMXcqIJBQSVCPM7eAygsZnU7KHpZfh+lbWl0llbP5aTxawdOrC8WQ1Ef8dqGq0PjGKU
 PyvYLEZqc5wqg+d5C+Ej8+wS8KooR4FMgVXQCF43HvFNKTUxdQoxM9OJLzI5SAxL2jjF4AqXOZD
 PkNqtq2GyKzqN6S/jJ9IHHb+wHX3u0qCfbsRGIC5g7CK2G7h2L+8zCNRf2zMTMJbJKerJHh/tRw
 afnZEepi5G+dyEklCaDVHpy+H18i6szOEbyIdVk=
X-Received: by 2002:a17:90b:2dcd:b0:2ee:df70:1ff3 with SMTP id
 98e67ed59e1d1-2f782b17a01mr74838549a91.0.1738020381450; 
 Mon, 27 Jan 2025 15:26:21 -0800 (PST)
Received: from stoup.. (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffb1b31esm7833000a91.47.2025.01.27.15.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 15:26:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH 20/22] target/arm: Use float*_maybe_ah_chs in sve_ftmad_*
Date: Mon, 27 Jan 2025 15:26:02 -0800
Message-ID: <20250127232604.20386-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250127232604.20386-1-richard.henderson@linaro.org>
References: <20250127232604.20386-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: sqyVcsAf/+xt

Since we know the operand is negative, absolute value
can be had by negating rather than abs per se.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sve_helper.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index a2ff3b7f11..970947e1ca 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -5150,9 +5150,7 @@ void HELPER(sve_ftmad_h)(void *vd, void *vn, void *vm,
         float16 mm = m[i];
         intptr_t xx = x;
         if (float16_is_neg(mm)) {
-            if (!(fpcr_ah && float16_is_any_nan(mm))) {
-                mm = float16_abs(mm);
-            }
+            mm = float16_maybe_ah_chs(mm, fpcr_ah);
             xx += 8;
         }
         d[i] = float16_muladd(n[i], mm, coeff[xx], 0, s);
@@ -5176,9 +5174,7 @@ void HELPER(sve_ftmad_s)(void *vd, void *vn, void *vm,
         float32 mm = m[i];
         intptr_t xx = x;
         if (float32_is_neg(mm)) {
-            if (!(fpcr_ah && float32_is_any_nan(mm))) {
-                mm = float32_abs(mm);
-            }
+            mm = float32_maybe_ah_chs(mm, fpcr_ah);
             xx += 8;
         }
         d[i] = float32_muladd(n[i], mm, coeff[xx], 0, s);
@@ -5206,9 +5202,7 @@ void HELPER(sve_ftmad_d)(void *vd, void *vn, void *vm,
         float64 mm = m[i];
         intptr_t xx = x;
         if (float64_is_neg(mm)) {
-            if (!(fpcr_ah && float64_is_any_nan(mm))) {
-                mm = float64_abs(mm);
-            }
+            mm = float64_maybe_ah_chs(mm, fpcr_ah);
             xx += 8;
         }
         d[i] = float64_muladd(n[i], mm, coeff[xx], 0, s);
-- 
2.43.0

