Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4193526njb;
        Wed, 11 Dec 2024 08:37:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWia4mvldjsY7w1RRtyrn2RWK2SOFfq+2o33MauiMm4OJWrS+NOzwhoRwYKJeQq8900HfMSOae+8ticZA==@linaro.org
X-Google-Smtp-Source: AGHT+IHlmlHCNjnFxm7g96SF/a9GNhGFVD2cccWNyUKwsvlHyFgUGgcgTOMO5R2F9ZAOYvAsXje/
X-Received: by 2002:a05:620a:1b84:b0:7b6:6701:7a4d with SMTP id af79cd13be357-7b6eb50cf97mr553461685a.56.1733935040193;
        Wed, 11 Dec 2024 08:37:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733935040; cv=none;
        d=google.com; s=arc-20240605;
        b=bweYqmo0DKDpRTAhvsdG+TDzcwm4QhUSNrC0wzhaQ0L9fo6V3KdtinTSA5rBatyA5d
         4uh9La0FAE1cmmsuaf2AJXKY6o7DGpo7g3hUop4s4Fe0G7AgjKYeauC8zGVmKLbvU1di
         9s+kTmXlC1T0vB3w8zkgFs4y9mBMwD/f0B2jukxr+BbJGZGNDSUnE+ixfsnqBTexqEzw
         oSmP5vh5iQ/tuQX3VpMoKNeqaYKeeqD0aHrEKzvFxeQC8kRDLdjfvLdg9WEjl4UJafSZ
         lTpkXxc4q+/n9m7JU14XUgXsRp4xKtbQoLwryTdf+icOVis0tnBU4CWuT15nx8Eus69U
         nAaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3HK0z0ExtviTrlbAmakVCcZYDfHeC3cJ07okGdevabg=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=d3ail80HN1YyI+8j4P6oQvtmbELFhQzD3Ju8YTdB4MdzZKF0wG/n92mHvME+fXMMVB
         4oPx7fmmokscfw5P1BI2a9WBrk+hUq9lBtGmtPBGTA8Shy4JOPa1FdYb8pz8YZ1FrhFE
         flPqc6RQdYIpIHCJPPSrkmvNE2dALt9S0pjceH48gN4BHTgdzu2+wyxiIHoteoXVNMKb
         jJapGPlws3BCsz2EXqrpoZ08xqLN+efNazY50lOm60fE8hybiEWaZCXwtmC44RMlEg0J
         TF+Rf0zbQe8QTgClURKL6m3pFtGHGU/0zfzWDn5ixsNFSAv/aC4ge+sNDtc16rjQSxMx
         YJ2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LrF9tZDp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6d11c6098si930878885a.380.2024.12.11.08.37.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:37:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LrF9tZDp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPdx-00083h-K9; Wed, 11 Dec 2024 11:32:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPdC-0005Bk-1w
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:32:14 -0500
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPdA-0001N8-AN
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:32:09 -0500
Received: by mail-qt1-x82b.google.com with SMTP id
 d75a77b69052e-4678cd314b6so6588661cf.3
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934727; x=1734539527; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3HK0z0ExtviTrlbAmakVCcZYDfHeC3cJ07okGdevabg=;
 b=LrF9tZDpw7guhD60X1oV+xuTFafZD+NH85ZOqKPfYj0mydxVq73U/UOvww5d305pK5
 9g3/cTLElwNE7GXODt70Nn/l6lf0HJZ1dTm4yMfk0tcCKA63vBAwi7/tfGRTidxbhc3e
 XgSEloFYik1X+NyQ1Seti2IXp1TpX+l0M8vI5Bghlsvyg4JrFlTSiCHJ8tBJZJQ3lbmi
 PC6jyFdVHW2E9w4HFKtrnVxho85UJh4JdokXbpaxZvsxJdOzDMOHO84URE0tvZnSlnc2
 pnZ0hUArtuxvmhj+uzmHXB8hllKNiUP4HJcFlCYDfDp37ts8bhzK9qy9knA1F1bqNxET
 Q3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934727; x=1734539527;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3HK0z0ExtviTrlbAmakVCcZYDfHeC3cJ07okGdevabg=;
 b=XKlcPqnlq4KvkA4BxXGvJf95X0UNx56t5/3pgh9FUnPcMDTKkz1Glyam0vk/JNdbDf
 FmUSdJqo0zvmuesqCfQjo9Fl0eAHBVp5yhlnU5VbHf/fEf5t7J+RgtTH99kDvDFrZIib
 dYPLY1d6sAKh5uz+E+jmCHLnfqwl7cLx2C4KT97/+8I6ds6n9YzhpGuvTql6yZRT0THn
 7UtJA7CV7U6dvlR3WFv7xFQoYtSvhyOmJHbKhW9aZFsV+fZ1frOnfyHLjFsvliWLO7TW
 eTHENGHM9N+kZBSG/OL4CQaTE2JVdBm4JMe1iQVBCi92kjyWnAqt5fGvmNcYf7FyDHkV
 aq3Q==
X-Gm-Message-State: AOJu0YySCvIrQDaXpZJENjiOXTT6hvWL3cSKxGv+URuKIASEMWpapnK4
 deYzE/3zC2YWjc8HUP69H1H0Pf6kGpGToeeWwQeUSQUrxpW7mHBJamHxmjT6qVA=
X-Gm-Gg: ASbGncuDsHgR96vM1esgzbwuAdtN2+4JDT3gsSKwq6+s4vgGSisEmccpe86PuTkm543
 M/ESp0IVSDinQEHFUq6QRIyIQ0YHNuJMn6vof+nRNkwsx2Ec7CzdlxmHi4EyEfuq5gDk0GfHu/y
 5O6hIJWAI1KSGH43g6hIp9uN8TrtBODhk1jD5uST2aM/0yrYlE6SHRl7lpxNwnnyruPnjOqf0yn
 mM46hMnxopFL5602icCCDlUIwwDBmCiA0FbAwukIwytovcCkmM3WB+iZvGN+A==
X-Received: by 2002:a05:622a:353:b0:466:a6e4:4c1a with SMTP id
 d75a77b69052e-4678936d081mr55205631cf.31.1733934727069; 
 Wed, 11 Dec 2024 08:32:07 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46755db613csm43849381cf.70.2024.12.11.08.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:32:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 23/69] target/arm: Fix decode of fp16 vector fabs, fneg,
 fsqrt
Date: Wed, 11 Dec 2024 10:29:50 -0600
Message-ID: <20241211163036.2297116-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
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
X-TUID: jsXzPgagnHWn

These opcodes are only supported as vector operations,
not as advsimd scalar.  Set only_in_vector, and remove
the unreachable implementation of scalar fneg.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index a99f3d0d13..3c1784593a 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10816,10 +10816,13 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
         break;
     case 0x2f: /* FABS */
     case 0x6f: /* FNEG */
+        only_in_vector = true;
         need_fpst = false;
         break;
     case 0x7d: /* FRSQRTE */
+        break;
     case 0x7f: /* FSQRT (vector) */
+        only_in_vector = true;
         break;
     default:
         unallocated_encoding(s);
@@ -10877,9 +10880,6 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
         case 0x7b: /* FCVTZU */
             gen_helper_advsimd_f16touinth(tcg_res, tcg_op, tcg_fpstatus);
             break;
-        case 0x6f: /* FNEG */
-            tcg_gen_xori_i32(tcg_res, tcg_op, 0x8000);
-            break;
         case 0x7d: /* FRSQRTE */
             gen_helper_rsqrte_f16(tcg_res, tcg_op, tcg_fpstatus);
             break;
-- 
2.43.0

