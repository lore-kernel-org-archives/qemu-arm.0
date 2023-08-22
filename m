Received: by 2002:a17:906:f150:b0:9a1:ac8c:26bb with SMTP id gw16csp70494ejb;
        Tue, 22 Aug 2023 10:02:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAXvaPiuojCXD2nTHFH84Y5nhUu9r477vESuFqaKFihYNDCo604wwRmhs9Dgz57NGimHx8
X-Received: by 2002:a05:622a:1312:b0:410:a454:5d66 with SMTP id v18-20020a05622a131200b00410a4545d66mr3298731qtk.38.1692723768582;
        Tue, 22 Aug 2023 10:02:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692723768; cv=none;
        d=google.com; s=arc-20160816;
        b=vsOA2CqrozYN744YbwVYpnQo4L1TzIk8wVrqb7/r4aWWPV2HD5xWqebjm6zgV199hN
         hMlx+xTd5LVeEIe2nBLVIabBM8cbzlsQ4h+LZJDMUFnKxmOY1vnCZQI+rzZS7rbU+X1o
         Qoj3SiAlMXzpN8WU6WCIMaDQrQ3J6XcIDG7ZmYVFieByNXQI0rh7/9cJJWxiSzz724tw
         kA/A7rBYJOnD0dltvwCsW1NrEhPFGnriaXqZ6t6XtpGs1Ovh5VG3NQeri7NSm0CWhmiA
         3Wzbq9EYgw4j59JhKHWwO6VaaU2hwj/XMZb3HxgxpP1lntt44yx0bqpOC6f9wU4Tizsv
         ITsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dyMnZPF0lJjltNxI1ShT7iDXd4Rf74ljeip+pJOFsn0=;
        fh=oweadga+1U1BKjDqlK8hSmEWEC1EUfcsKuPkDinEDsU=;
        b=pptKDziPJ//P89PlR4G4ocpSTTgs7ThBoycdWcEx6Eix8VR2UWuatcg9EOzTmG/aVT
         AqP7y+tZwWgXgUvHd2mFDSAZOvYTZ+cJ9kHE6YvEwnGJrBnAkJdHUVn1NIddeqtjpNBV
         BARMVVXds+KcOjmXiVOFpF8GtU+1byQowK+r9g+03HQDi2KTQLQDyTFLPMHKzF6q4PQs
         bK0iDhr6/ft071OhSmZxFdDGiPmrmDmEj926Dqt60esQvSSPQkarI4Nh9SZNxtAeDstT
         p8uevIWyl2Hmxq4d4PerXsIO2I60CUjeyE+0IezDzq9lscz2tx7SKeq9vo3/GTJQqS/i
         C9Fw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dit81IQt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s18-20020a05620a081200b0075cc804eea5si6200329qks.678.2023.08.22.10.02.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 10:02:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dit81IQt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYUln-0008O0-Ee; Tue, 22 Aug 2023 13:02:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qYUlm-0008Mh-9s
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 13:02:18 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qYUli-0002KL-Bk
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 13:02:17 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-26d49cf1811so2315137a91.0
 for <qemu-arm@nongnu.org>; Tue, 22 Aug 2023 10:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692723733; x=1693328533;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dyMnZPF0lJjltNxI1ShT7iDXd4Rf74ljeip+pJOFsn0=;
 b=dit81IQtr9lfNtbpySaog6AF/9oRIkx9V7RygsWQidvLYVLi9fnigzpNP4lu1CUD5Y
 vjDm3cjTQAMzrUCjLSTSKKWpMq46MPpAWAWzhAChI0MB3f/V5nJRivZh2ys2VI2HC66S
 UTr6ugff/0eDFDDJlFhflP1fYGfGr4/DmOYirn2X7Js8cpHI9FoqJGhdpuxU1gp3mm3m
 by2BueWZPZjweDmjYAytIG6BRaUEfO7YgWJydE8CZKaMv9DUBx+qbe7FjnuqHKZkqquc
 yA6n/HWAXWLfbolW674rVaE6eRPB4TRn/eWvqREfKZOgTvkCySG7Dq8Q6UNAMFghVRx2
 zicg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692723733; x=1693328533;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dyMnZPF0lJjltNxI1ShT7iDXd4Rf74ljeip+pJOFsn0=;
 b=IaEHGcOdaQZ3zqByIED6t5/1Cp5Y0WEU+1Dt1PhpGJt81g4thlZoryLo3UG5qPKsLK
 Tu6EgKAq0gRdqXeVreNRB+pkVBgf5/boeUPvnARmsS+d/3BAiLGcHp9Har2SBzS0gERG
 2W5OVTfdEMp2OWq7E1d6xACCeArUTVX1P+yopjEwaXwbP8scErNvYtcoXbl58JoZjVB3
 uZaKPFfp5RTbebLVt3YAt82WhJQMPdmwl5xku4fmMAh76nUMOPJ2VlJUMP9o4fb4XWFH
 hbCzEs/Ov+yR6sb9dAo4jMwZ41m6mkpldTEmDevcdN3PSbJLoOGqZ39fcG2Anny3Ws0N
 dM6A==
X-Gm-Message-State: AOJu0Yyp1UbiM5JimY1hpT15dGZMt+nyFvYsrnNUTSIa2K8weza7QHpM
 iQu7lCNFQIRYrkXgFSz+NK8LlAiZiqENhenCI6I=
X-Received: by 2002:a17:90b:1d06:b0:26d:b12:8383 with SMTP id
 on6-20020a17090b1d0600b0026d0b128383mr7476481pjb.8.1692723732847; 
 Tue, 22 Aug 2023 10:02:12 -0700 (PDT)
Received: from stoup.. ([2602:47:d483:7301:4e3c:f4a4:b92a:b5ab])
 by smtp.gmail.com with ESMTPSA id
 27-20020a17090a031b00b00264040322desm8761121pje.40.2023.08.22.10.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 10:02:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 2/3] linux-user/aarch64: Fix normal SIGILL si_code
Date: Tue, 22 Aug 2023 10:02:08 -0700
Message-Id: <20230822170209.1130173-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230822170209.1130173-1-richard.henderson@linaro.org>
References: <20230822170209.1130173-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
X-TUID: GBp8L6TQPLo0

Most illegal instructions use ILL_ILLOPC.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 2e2f7cf218..22c9789326 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -110,7 +110,7 @@ void cpu_loop(CPUARMState *env)
             /* just indicate that signals should be handled asap */
             break;
         case EXCP_UDEF:
-            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->pc);
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->pc);
             break;
         case EXCP_PREFETCH_ABORT:
         case EXCP_DATA_ABORT:
-- 
2.34.1

