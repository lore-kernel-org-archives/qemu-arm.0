Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4301750ejc;
        Sun, 26 Feb 2023 21:51:49 -0800 (PST)
X-Google-Smtp-Source: AK7set9Yl3xCJ95fyME/gAuShMiAoVH8TnfX+rBwPtLYO0bj/rqbs27SJA+1CbJ5dTn0Ro/l6sjv
X-Received: by 2002:a05:622a:1a21:b0:3bf:a760:cb5 with SMTP id f33-20020a05622a1a2100b003bfa7600cb5mr38038206qtb.4.1677477108971;
        Sun, 26 Feb 2023 21:51:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677477108; cv=none;
        d=google.com; s=arc-20160816;
        b=MoLojgk2y4O7wI3S0FDvgu2SLAvVy5TP000FOiqSWUUcOkAoRUwK+h2HmgY036FS8n
         lHrRiQRtGnklzXN+u+GsyKwKiXbGdktn6gzR5SGIkkRXQPRwbP1XnFd3BRnM748MK7dW
         kQPWFChjYruwy0txqI/HcbF6QPLBgdqE4zacYVz61jn6ArrROnUoPkAnbd9zCORJVlgJ
         1cNtTE+cr2208fhOWejodn71kZAbzsQpRHc46HQ4i0rdxv7cMo8qnSEG/uwp2z5J+sE3
         /gg15LaJowsEgyT3xZ3h/jezzbVfJlbdv0I8cLy6aQ4AgGQDB2zFTPZPKwv7QvUonAU3
         HwKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LajvWmI+pLtygQsSP7BRlVIFeqnQdv7FpjH6OPM0h/s=;
        b=AGweVdF1ild0l7vr53KAVG6s2nos9hETX6rxyZUdb46njFRT/GAK4iD+lZK1B0Fx+G
         hskQC8x5AuYyyx0toBQmwvpfGJpGtVW4pOi174PE2gF6uaqlI8T2WKdYv4r+v1D4ZNkm
         8fT1sIreTLUC4patPUER3cxVzwwmEi5OGcAT6m/5J01roo9RFgvmmmCa/FlJQ9u267Xr
         ddW1qf0fxpB15qjZgb7FBONIug5hnFJIEoYYUHnhU8zfZ0XBgjmzydQ+e3YiFbmprmFp
         BHq5GGFgD08F1LEOtcqSEU2y3NYGw6WQNkOl1QTB8C+OcOoMFvtg6BW4q4F2xs0r85VQ
         VHJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UQe/gMPP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y71-20020a37644a000000b0072f4f72667bsi5481384qkb.664.2023.02.26.21.51.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:51:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UQe/gMPP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWJv-0000yh-Sl; Mon, 27 Feb 2023 00:45:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWJN-0007Ad-D6
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:44:33 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWJF-0005bW-UG
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:44:32 -0500
Received: by mail-pf1-x429.google.com with SMTP id cp12so2046662pfb.5
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LajvWmI+pLtygQsSP7BRlVIFeqnQdv7FpjH6OPM0h/s=;
 b=UQe/gMPPOxNpxVX3ybzi8T75p0aDK3PMe/c5PlVr1N199yb+U/rIXA8soXeBgnX7q3
 uFBRlur1kZA9xTh/YhAgBwC7x31wTXn8B3RM6DSuBh/H4tp/TAlRNtNXkuG4y72JOBA6
 zTDDQ3veI1Mcfo8PffQYkzalaDZWh75eOoAa4PlKdBRbcxvk+pin79N5wgDQVg9TU0Dr
 Ozvrzym6xya4aBmgzhnuHLCOK7GGTLvGRPpwgdQUWdbzY9g7jFVpFciy/5sa70VIPw9T
 O1VJ5UPSzOZwQrgBNd1weXWgbX3I+abxpBCHQKrNAWmq9OOjAy7PEUOVGkG76w+sbP3T
 mIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LajvWmI+pLtygQsSP7BRlVIFeqnQdv7FpjH6OPM0h/s=;
 b=AaOHsEYFbxlx1Jtp83fITkIzAIFcdH+I1Hu+LMNMTQaHoajg23+hLFKhVdZIORnFY4
 tr+MC+D6lyOkqmfI8rslnYKgTEM8ly/kr9fPwI/WUrdnmFFSqQs4evf6rNo/x6PTgGeV
 0tAUHvKmfCUgjVrZ2BmrKpAAAnxWrflBm4x83ks3k8AJFZXh3+wpvzxVXu0YIFFXp3w+
 SZrO7q8lxyqAyIvN2u+94YSoRHEZe6p/ybMV2g0DSfkPObZd8exwavV907R8pNyk8r74
 gq6Xh4X+nyuZ9DRFPBFXLLgWDIl8LCMgafN+yv45JXfUIqMRrpsleO7CRgsG7RHEdDkY
 P25Q==
X-Gm-Message-State: AO0yUKWToh5REVaU6CysS8zHme6fpwmT1GJK5quh3yaE/nEgSYn3ghjK
 rcfN/5Jo89QxmI8s61RlkomKKA==
X-Received: by 2002:aa7:9639:0:b0:5ab:be1b:c75e with SMTP id
 r25-20020aa79639000000b005abbe1bc75emr21305279pfg.24.1677476664118; 
 Sun, 26 Feb 2023 21:44:24 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:44:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 38/70] target/ppc: Avoid tcg_const_* in xxeval
Date: Sun, 26 Feb 2023 19:42:01 -1000
Message-Id: <20230227054233.390271-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: hb/ZquRBb0MC

Initialize a new temp instead of tcg_const_*.
Fix a pasto in a comment.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate/vsx-impl.c.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 6e63403727..9916784e64 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2449,7 +2449,8 @@ static void gen_xxeval_i64(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b, TCGv_i64 c,
     TCGv_i64 conj, disj;
 
     conj = tcg_temp_new_i64();
-    disj = tcg_const_i64(0);
+    disj = tcg_temp_new_i64();
+    tcg_gen_movi_i64(disj, 0);
 
     /* Iterate over set bits from the least to the most significant bit */
     while (imm) {
@@ -2492,8 +2493,9 @@ static void gen_xxeval_vec(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b,
     int bit;
     TCGv_vec disj, conj;
 
-    disj = tcg_const_zeros_vec_matching(t);
     conj = tcg_temp_new_vec_matching(t);
+    disj = tcg_temp_new_vec_matching(t);
+    tcg_gen_dupi_vec(vece, disj, 0);
 
     /* Iterate over set bits from the least to the most significant bit */
     while (imm) {
@@ -2546,7 +2548,7 @@ static bool trans_XXEVAL(DisasContext *ctx, arg_8RR_XX4_imm *a)
 
     /* Equivalent functions that can be implemented with a single gen_gvec */
     switch (a->imm) {
-    case 0b00000000: /* true */
+    case 0b00000000: /* false */
         set_cpu_vsr(a->xt, tcg_constant_i64(0), true);
         set_cpu_vsr(a->xt, tcg_constant_i64(0), false);
         break;
-- 
2.34.1

