Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp190106ejk;
        Tue, 28 May 2024 13:33:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+uca38g/ccryiGw3Bpy0LbXXHdiADFycP6xEYxTnxhogABdXImSE0BYbWgtmC5gqx9FvjQFVjDliCs6f7fBU31HvAe4b6
X-Google-Smtp-Source: AGHT+IFzdTjTLBWUFQxVYbmJQhv7AGhENKKvkEz3dOEw9blPLwTR46ijlmv6XNFvUpnp59o5Bo2D
X-Received: by 2002:a05:6808:2a88:b0:3ca:b21a:7943 with SMTP id 5614622812f47-3d1a50a86d9mr12829349b6e.10.1716928423054;
        Tue, 28 May 2024 13:33:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716928423; cv=none;
        d=google.com; s=arc-20160816;
        b=wPC2Kw1vQpEVOgLhjg8zR6uOSvIcVmxp2paDAnDBJiJUPVK4Hz0bbXCMTP4qNa1ynL
         t4B8acuMIjFkJEdifTIndbSxrXpMxm7NHSiI6jotfpnAPILwt6ZHBv+glL8R6BgVOvLO
         JhxAPRvp8wxx+3S1mI6JuDfBmwpDM75MxUM2duBVkhDwd7mqK2XkHmFzEbgN/qB0z/yA
         jYD9FE4KC03Uw6u7iK2/e+Xhq96zPU31KGPfFGF5a8+PrxAXx6rfJk86T8op+jV7VrcD
         H1N4iR2xqfXvR5DHJA8oCV9o47Z8oCeKQWMOG8vrzi/32JaZT85z07zhSWH5cs/vm3Ai
         hQ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wZAURCUXc6vorPHD4xU/CM9bOfr04uP55VqYtELjUkE=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=KQr2BvuRE1d39I2W9J8fbGZAVSkhnpBC9gTKSntbdH/hklL574pA9PQA3r6xw/4p8t
         N+0yEhGajIfJbdek7i4lBVWdbd1cVIBySiLTAIvBp7v4MWmNW/+24+kf3crYfJ2aaOSF
         ACm5a34jFrZ6zleytUVSofrEGtOaplNtBhlsRIacLHvljK6MXrOjhe7cDaXEBNq+jwxC
         vNpASEI7RUWVWIlgl6ZN8IBLsY0/mRscfv589Ih/rK32eEX1IWvgiBBoQvO9poZroSo7
         6stBJph7Y4jsId8UWd4GcI99rBgO0Dq2scXU3L4svyIhyDOVIXE0d2LVltVZWYafnBpQ
         K4UQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q59r8ubL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18c5aa1si109594291cf.554.2024.05.28.13.33.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 13:33:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q59r8ubL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sC3Tb-00030l-0t; Tue, 28 May 2024 16:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC3Ta-000302-7e
 for qemu-devel@nongnu.org; Tue, 28 May 2024 16:31:18 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC3TM-0003hB-Vx
 for qemu-devel@nongnu.org; Tue, 28 May 2024 16:31:17 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-6819d785528so944157a12.3
 for <qemu-devel@nongnu.org>; Tue, 28 May 2024 13:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716928263; x=1717533063; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wZAURCUXc6vorPHD4xU/CM9bOfr04uP55VqYtELjUkE=;
 b=q59r8ubLzU0RCvhLARpKsoJ+EA4nMBuBuunGG6lB1H+HZYAIsEO19cIAKpfhjPOGM1
 iN2cHyoy/O9ql8fbERsn7/ClifLDbYr6U+fvsYiJiE2RebPyHEgLsoFyUtQUxHx4E86k
 bsDBt0dmnb5Pk0UBxqrjFr3tMcv6LXjXZsvmuBYsDqlkFyP1VdJUY/xwCRAo9G9muvA+
 eWOnMpSmS3JAqXdLgFJeQHLl86W4Z3oF5BJBz4S5xwqlUpVlyn4S+X7R6f5iHSvPSkEQ
 kfe1PQ4Mxzu8Mmx4jbpSZ4Mrnd2RzPrG/ZHERWUfgxq5XawVi4iusY1FRs6gJESLTCAW
 YmaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716928263; x=1717533063;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wZAURCUXc6vorPHD4xU/CM9bOfr04uP55VqYtELjUkE=;
 b=R+VRBthhnRgPr158RcTNLFDW0dQkT2f5iF6LEPW5SOgHgBG7UrDHEJIjlFZMWljYT1
 euKDgyw39QDtA0x3XANYeMskH2+cpx5slW7H3394TnJ1igNX4Ye/FEouqBM/xm1A5tb5
 e8BU1uE7fDysehoaweVtOkU+8+8vAXHVkSMnykt7AbaqtoePQWDQGisjHh44iRGj4pRB
 eaP6z6TXOnACtZ+tEMIalq3lWe0UHQnSNMT1cP/OdguNcvvAemu4Ae0PZx7u/C+olwAI
 jouUJvHkNWg2upaPbRa+lw8xDeG3d2CVgEwx4z7R7wNdqJ4DCa1M1QqvXJ2MMWmdTFE/
 fasg==
X-Gm-Message-State: AOJu0YyL9BPQLfLREjz+R/p1CfJ5heciwBH0btRaU/Q7Qr8J9l12QGy+
 AW7flJMzdW0rzJOk4cxJ5xMQ1naFUjiMTEQDkN76PVt8hTOfpW/jABGPQuI9pg4hckfZ7O7hnsj
 i
X-Received: by 2002:a05:6a20:8423:b0:1b2:53c5:9e71 with SMTP id
 adf61e73a8af0-1b253c5a07bmr2411542637.25.1716928262889; 
 Tue, 28 May 2024 13:31:02 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbd3dbe9sm7042036b3a.10.2024.05.28.13.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 13:31:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 19/33] target/arm: Use TCG_COND_TSTNE in gen_cmtst_vec
Date: Tue, 28 May 2024 13:30:30 -0700
Message-Id: <20240528203044.612851-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240528203044.612851-1-richard.henderson@linaro.org>
References: <20240528203044.612851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: veXxwSZbfV01

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/gengvec.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/arm/tcg/gengvec.c b/target/arm/tcg/gengvec.c
index e64ca02e0c..2451d23823 100644
--- a/target/arm/tcg/gengvec.c
+++ b/target/arm/tcg/gengvec.c
@@ -944,9 +944,7 @@ void gen_cmtst_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 
 static void gen_cmtst_vec(unsigned vece, TCGv_vec d, TCGv_vec a, TCGv_vec b)
 {
-    tcg_gen_and_vec(vece, d, a, b);
-    tcg_gen_dupi_vec(vece, a, 0);
-    tcg_gen_cmp_vec(TCG_COND_NE, vece, d, d, a);
+    tcg_gen_cmp_vec(TCG_COND_TSTNE, vece, d, a, b);
 }
 
 void gen_gvec_cmtst(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
-- 
2.34.1

