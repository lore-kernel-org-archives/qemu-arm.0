Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp615110njk;
        Tue, 16 Jul 2024 23:10:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXoPRtKCI/bVGh2T11hUbDdNbYZniCTu1i602obWtWipZ9JGywV6THqQifEus7HGZTJMkiCPSZWIfQZhQEY0J8Zv0fFM2Xf
X-Google-Smtp-Source: AGHT+IEsab/R9QhDmQT8iJdZoElrv6Xdv1u0DWI6bibmZ+A3kV+YwuxnZYGBRCMS8LmIXx1HBgom
X-Received: by 2002:a05:6102:1625:b0:48f:ebc0:46ff with SMTP id ada2fe7eead31-49159a0b38amr854504137.26.1721196632429;
        Tue, 16 Jul 2024 23:10:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721196632; cv=none;
        d=google.com; s=arc-20160816;
        b=sh/jx2Pt3yhOjpiCvcsmSVD+vesr4zfNFQkU108NzB0Jc/Oo9p6qFjwch09V2vJxhu
         iNyDnju4nn6KwksaBZYyTh9i8BzvURr4j4+kJmB74/RYXElpBxm8L8e3TjsB+M3gLI/R
         JPJbsucynzcnQYlLqyO4oEHuPho3u6ZUZzkOqAONxku/3xosSRDFXBzF1dFku1NAdFDT
         Q7QCe29qwRQ+q3cl7LUj4kAKN4K7rIu1o9dOQiFNQBUBUAMmr0hkVjSnAKRpfDzYpOCQ
         uw7UuK3fQlOsVXMMzjr6anev5wz4CIwm716CWUVPUqRTU0cXuzaQgoJg813GyHbSNRuw
         Nqhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=57DdanWVRLYnAUN5YF1Z/JUbHmS65EczfEpSlC06YmA=;
        fh=quVKJN+JogokNzsp4kwoA7mheGRSBID5PxcC4hooSO8=;
        b=n/u8QHGrTxOYqj+d5HJZJgRWFVVyhKgGicw8uZWJFt6GH5hrI67hMABYASGCxnBkzd
         Qd7o9sB9+GeeznVU0Bs8BLD9DSwOetylwPFggOjhp+1KFVb66pCF3fvLHMs398X+f0HP
         bXxy1aNHvGEg/blcDs8zQ4tx6uH9CeWCCZNDojpCLoQoRuHjZkjJ34L1MlldxyI0YErm
         9VtrhLKw/d4irn/SJNREys+D8HysCDBCXzEBbNPWrrCxZAFRC/K+SjCXWbHJ+xJCSL7F
         r8nZH+8tLdgE9+hbH6DeeuvFzmZ1l3JZBGqA2RsPL7+KGOB8ZSOWZnt0IITau2Rz5vhu
         mnZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wePVVf0y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b76194fddcsi90174856d6.118.2024.07.16.23.10.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2024 23:10:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wePVVf0y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sTxro-0007nL-Mf; Wed, 17 Jul 2024 02:10:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTxrL-0005UL-Nt
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 02:09:51 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTxrH-00035y-Rz
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 02:09:50 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-25e43dda1edso3686993fac.0
 for <qemu-arm@nongnu.org>; Tue, 16 Jul 2024 23:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721196586; x=1721801386; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=57DdanWVRLYnAUN5YF1Z/JUbHmS65EczfEpSlC06YmA=;
 b=wePVVf0ygEbl+zb75+wpb/7Mu5abD1ywmETe5t9ODIr4VkOu6FTDHluTQyE1bFDhqa
 cbPPrG8iGTGPEv1qP/q/eqOjrlktHsCAQIgH+WQfB4lzLEIrNrbHmBZfjpru1Anq3tVl
 llN4ccI9Ei5hJyTWU5On6W/LA4nFgYwRbDp/iX4ts5L0jDMnsxACiMTRIq7uV+aMoSuR
 UbsTufu56BO6/S6eNIrAUZc0LQE11EYfa1BiUTA32hEaHKPTSBUIa0ZTh4/sPl2sEHrq
 MRAmYOlME1izLMANpAYBDzOh5BSdDK2MdI+6NWGvA0RuvhknXXk4viNcZP0mlryA0xLw
 FMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721196586; x=1721801386;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=57DdanWVRLYnAUN5YF1Z/JUbHmS65EczfEpSlC06YmA=;
 b=kikr4R+l6iyDM2D8Ed6EyVJpSPCLDxKIt8aZufW8XWWfH9kCp+lu5xVKGkSf9Xwp+h
 rETDCOpg3TYl2OL4aSEG9tbelc3WTOoi8wbhvP+daoWnczjQZ3bOqsR+nNzmASQAkRZS
 ExjITgaWo0bN7dzWxAlY1h+O5Lq1MZBP3IKajh6YcTdo34Fz91h/r7ZOhY3BVeWILWZg
 YUEZiqrWPQuT6DYd1sWYZnMZm9S7Qy1TbCMowZdq/KDpb/bt5azSsKe4XQRhmzT4++gC
 jhoiVYwO2TectE1zc0pfqPcpkQyTTrUSLxI0zcuvaNL0tIz7E+rwWOpLjSoImEjIKfco
 lCgg==
X-Gm-Message-State: AOJu0Yzz7P45Sy8IIx4I4uPMQAuD/yZE+F/bQk15G954+DQGyejOORST
 vH6snxpNa1c7fMbcEKfg31t1Gp5G1OnAUvbr7edXGK2ZiALG08sFaRMN65Euykw=
X-Received: by 2002:a05:6871:79a:b0:24f:d873:9f32 with SMTP id
 586e51a60fabf-260d9222ad5mr578504fac.26.1721196585830; 
 Tue, 16 Jul 2024 23:09:45 -0700 (PDT)
Received: from stoup.. ([203.56.128.103]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7ecd603bsm7330404b3a.219.2024.07.16.23.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 23:09:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-stable@nongnu.org
Subject: [PATCH 14/17] target/arm: Clear high SVE elements in
 handle_vec_simd_wshli
Date: Wed, 17 Jul 2024 16:09:00 +1000
Message-ID: <20240717060903.205098-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717060903.205098-1-richard.henderson@linaro.org>
References: <20240717060903.205098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2f.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: V6YoWIDpWatz

AdvSIMD instructions are supposed to zero bits beyond 128.
Affects SSHLL, USHLL, SSHLL2, USHLL2.

Cc: qemu-stable@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index fd90752dee..d0ad6c90bc 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10471,6 +10471,7 @@ static void handle_vec_simd_wshli(DisasContext *s, bool is_q, bool is_u,
         tcg_gen_shli_i64(tcg_rd, tcg_rd, shift);
         write_vec_element(s, tcg_rd, rd, i, size + 1);
     }
+    clear_vec_high(s, true, rd);
 }
 
 /* SHRN/RSHRN - Shift right with narrowing (and potential rounding) */
-- 
2.43.0

