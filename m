Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1280044lfk;
        Sun, 17 Apr 2022 11:29:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2uJRy0pxvVKAXRLH3uD/Mge6AL+Gwps60ZBs9H4iRoC0TmiEshxGpGjZCY/lk2kaLAjtr
X-Received: by 2002:ac8:5a4f:0:b0:2ed:d39b:5264 with SMTP id o15-20020ac85a4f000000b002edd39b5264mr5032534qta.477.1650220182869;
        Sun, 17 Apr 2022 11:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650220182; cv=none;
        d=google.com; s=arc-20160816;
        b=L2n/WzphDKggQaY8gUUnNzI8VF5Z2i9t7NQw1PstM5QcwvGcW31qWSj7a01dOGU6Ru
         wgDBU1hchrQaGeYqzBoita8fVK5EK5kP/6gdUeP3e3GatHehZOEkN1a949fyIfrrZ7tu
         u9yrqQbJj959DBtlSW7RKet3JcpLpXD0m7CjRTUdeFSkVy9t1wMUmPjy0zVzPqltHMxh
         kvQUddhGHgj+Viw1vSr/XQNkYqdqeUV6ZpP6tAvjBw2VyXAozjNShl7uGoCMT1jdyZ7W
         zL0Bqzvn3Zv/T+EQ7GO8wwQy0PzFDRXykaIdyRfFzRlFFo0QLWMCd+Wi4wFSs25M9p+m
         I27Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dXnzIOLVWxiQUUxJDgWm+uk0rCunZPcvtv01su9duzA=;
        b=qRd0+aqwB2Pt1zuFUlBfM6MXXd8QyEw5FDSjzoWLGWKtLIVYHeijkTN7fx8xgImj9I
         Mg/9DxkBfD14jdSBN/OpJzgkNdIJsC28NKYounxNyX73skBSXEAh1NVsaB/AYwihAnLR
         VCEIt/ZaR9A7+Bzz47jJ0M7ogHt88OrK3neQkc69PEOwvOTUm4vS/C0Up/otD1UrUT78
         K74DMloBSJlhZCaf75RYkYczvfO3cezm6oZje5pd/S4eDZIVWmN6tPXYSaIdGNQihjnc
         +xS2XVNx5mrvJM5ioUYQQkxyDngABgZ3oXpKrpd6gmjcCILFTVGEEIxpEG35IZV23zd6
         PEdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IwyoYnQ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y11-20020a05620a44cb00b00699fa2b1cd4si2761755qkp.165.2022.04.17.11.29.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Apr 2022 11:29:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IwyoYnQ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ng9eY-0006au-CI
	for alex.bennee@linaro.org; Sun, 17 Apr 2022 14:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90M-0004MZ-2X
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:48:10 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:40548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90J-00041l-Da
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:48:09 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 md20-20020a17090b23d400b001cb70ef790dso15509764pjb.5
 for <qemu-arm@nongnu.org>; Sun, 17 Apr 2022 10:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dXnzIOLVWxiQUUxJDgWm+uk0rCunZPcvtv01su9duzA=;
 b=IwyoYnQ3gcGuhO0cGuMFU6sYQovqwQ/KBdTKSL+LakbeC9SNFcYpPGtfJyc8us6hUU
 IvHVl3rFlQvyxN1mwiQSvDYnVoX6yS96xdbJT+p2aJPmrx/DoFTo+/AC6SWmDSgrLHsG
 Zpbd4W6j9bXEav5vHd6sO1FYNvH+kr97mnh37aPIcliVFXtciwQokPAwljIdLEkd/Dmm
 YkoPGb0zzvurqI0cIdZyhaZQFYH5p7NZOKchSjhJ6uZCujtROVWQKU4Kg1DBBUQNTozk
 ETMshohEnweRB+j3IsfCZtGrFfVso9MrEhfGNvasc4vZEpeQpTLXK2mIo743zf72AFGN
 XxNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dXnzIOLVWxiQUUxJDgWm+uk0rCunZPcvtv01su9duzA=;
 b=LjMeEEMHGeFe6Hm0ezrbdyZB+e7gJC/USX7fNE02D5u97nGbB45dggGJLnoRzm47KR
 fyjPXLhNYTHXBxziRhCFt4OAJzVxK+RfCOfCtTunMDcj9BvqlyS4u9gdOYo1QubIobvk
 PKJ7MoccIF7G2UuxA71fFBxcdZKAQIB92in0LqHq5JfgMXfqB1/UkbK/LkHfU9c55NcS
 Mu9SYPSO/zwBwXUhn5FRGjgEFbPWS55nLyuFqBi4IZcnGz1PnejOWGMxtui4PD54IDf3
 Ou+Dbi4H3u5+Uk2WAusvd6HqMq54SDjjYiIEeW2s5g845pzm87DPdo41NIJu6a8YNtMA
 TmZQ==
X-Gm-Message-State: AOAM533R9iCQJhlz8djPDM24wazAGLwUIWiBMhZlNDyt1E96dZ34tjX0
 /HpoMhrYCfsk/PLmWk2wO94tmA==
X-Received: by 2002:a17:90b:268b:b0:1cd:3f24:d52d with SMTP id
 pl11-20020a17090b268b00b001cd3f24d52dmr9072835pjb.174.1650217686237; 
 Sun, 17 Apr 2022 10:48:06 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 e14-20020aa78c4e000000b00506475da4cesm9372055pfd.49.2022.04.17.10.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:48:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 42/60] target/arm: Set ID_DFR0.PerfMon for qemu-system-arm
 -cpu max
Date: Sun, 17 Apr 2022 10:44:08 -0700
Message-Id: <20220417174426.711829-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RlDVZXHV7ct0

We set this for qemu-system-aarch64, but failed to do so
for the strictly 32-bit emulation.

Fixes: 3bec78447a9 ("target/arm: Provide ARMv8.4-PMU in '-cpu max'")
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu_tcg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index f9094c1752..9aa2f737c1 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -1084,6 +1084,10 @@ static void arm_max_initfn(Object *obj)
     t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
     cpu->isar.id_pfr2 = t;
 
+    t = cpu->isar.id_dfr0;
+    t = FIELD_DP32(t, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
+    cpu->isar.id_dfr0 = t;
+
 #ifdef CONFIG_USER_ONLY
     /*
      * Break with true ARMv8 and add back old-style VFP short-vector support.
-- 
2.25.1

