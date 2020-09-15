Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3392683lfq;
        Tue, 15 Sep 2020 10:54:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlJ25pEfXHcABvZ/FsPYSsMdY81FoOshgxHaHzhbeNDMMxhoWCBxh4RamQ6XJ/sZuLHPjE
X-Received: by 2002:a25:b981:: with SMTP id r1mr28544978ybg.98.1600192460410;
        Tue, 15 Sep 2020 10:54:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600192460; cv=none;
        d=google.com; s=arc-20160816;
        b=HfjbI05mU8ob56Ol/JnH20YOsjuHANF2jYbNm0aq61veNfDlXXbxcCJkbeRYAGiPQI
         xDqMp0RyezibtcQZV2MczVZ5c4YPDhE3oEuQhAnjpGR1BdE+lVssdZ0O5RijXBaBAccQ
         eE5b5aO++ZkYRU3rbX+GRL3qAEVQtmh/N1a9ZjdZDsrxcBU1shpVpxZ4NTCFS0BLUDW6
         YwLcYI0L1VCAAoVrn0yaWWDcr9B6tLKGcskm0Y/4QuMn8aVuDN8HHtsxLrq5cpjZNfZG
         PXm28WopGSEuodyrUM28S+SrREcgfq7fEoCv7vELwDX1fLC/fgAS5RyclrDHZ6t3C8MY
         yVYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=RffEK/rCiFhZmvHDae5MdJFHwlUbrlsn383XqLguch4=;
        b=YU53rC5FxHypiSqnsvmS5oRFDe7LorhKoaVXCX1VJ2jGnQJYiFdO3C+Iybz5hkLD5s
         KI4Zv4V1/hlcovWcCnOxuo/nK6wpWb/cLPfTmYa/JekP314d+sfuvLmPNatO29ioFDuw
         rFdvMF2RjHX65WF0vtHYYimYXTMBRjFk0XLf4gjsXdlJz5PXuN1GhNBCzsdo9yL8LKEe
         ujg4DtpnihuMq31Gz51GRN4mo33FmwRKZHvtBv5YZ0n8elsmOKToFJ9myQlpibUi4BVw
         LRBItfaubzahjna7xyXtPXKuJSGjn/04PCqp2uKT5xGb1Fv55hj5+YoUuyg9By2Tv0zO
         I7Kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TaLlC9Xd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c76si12323115ybf.294.2020.09.15.10.54.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Sep 2020 10:54:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TaLlC9Xd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIF9n-0004wP-PN
	for alex.bennee@linaro.org; Tue, 15 Sep 2020 13:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kIF2V-0001ab-Ni
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 13:46:48 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:47050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kIF2Q-0007FK-5w
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 13:46:47 -0400
Received: by mail-pg1-x542.google.com with SMTP id 34so2333369pgo.13
 for <qemu-devel@nongnu.org>; Tue, 15 Sep 2020 10:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RffEK/rCiFhZmvHDae5MdJFHwlUbrlsn383XqLguch4=;
 b=TaLlC9XdIVfTMoQm3rz9h/eHKJYEEY+maapHUWmfYg/CZP3Dz3/SdTzBVaw1ml86vE
 gPqqTz+H7PsSeJ+8SELjbzYbsq4T65vIl11jt68HGDCZ31O0FX7aKNR4PW0SjI/n3wvc
 XVCuZ6M431p1qRphP6wjKgx+uVOKzM3AvbbwhYdrnkNNvmrALWNp7tKAGd3DiDatt8p4
 47izxgxnZpQ1kR/BkzKF2eDMtNZaGPt0BtTf1rBDiDofVVMXFgGmAtXCG+wSV+iLuYL8
 BrFwEgMGnlR2x6QCxdi6GC76nB7rzIZ6hSCy/eWynkghxhXQNVcYoGTDoZwrb6hj6usl
 SBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RffEK/rCiFhZmvHDae5MdJFHwlUbrlsn383XqLguch4=;
 b=VUlzjGPD9qrCby7V+KLsD+IhdG+IONNemREQgH0lnpZARY6sPpR2TDkmS1sYR+u9D7
 FzlXNASZjgCsWiS3q6tfxgMMGS0pSRwboBAf+yj7DvYYkxKoKWcsSogsQ8LCWv61JeJX
 rc+SQ8ZU9YImcxk9gwMY1Hl2e1s7h6hbba2wGPZIP392NrkUqYL7qEZpv/UI22Ox6xdM
 K2dt1i3JNrNrtKk4cNWc1g/bNqqIfgEEvV1Qx0JdDTMXpX+mFxYwFG5v7OVRM+Df7J5Q
 f0j1VX1/sp8f+xbr1FFkgrpXY9bdJqiwpcMGdv3Hqj7IkJH5aRto806pPulT1sx8vQO3
 VbLg==
X-Gm-Message-State: AOAM533cHMtpbCtOCyxms7MFw1B20RMvnMFSxH1d48nm47jH/1g9o6dX
 3Yl7cTO6Vyjn9ot0K5gMMc3cGmow06pT9Q==
X-Received: by 2002:a63:1a05:: with SMTP id a5mr16172117pga.145.1600191999169; 
 Tue, 15 Sep 2020 10:46:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id cf7sm147896pjb.52.2020.09.15.10.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 10:46:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] target/arm: Set instance_align on CPUARM TypeInfo
Date: Tue, 15 Sep 2020 10:46:32 -0700
Message-Id: <20200915174635.2333553-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200915174635.2333553-1-richard.henderson@linaro.org>
References: <20200915174635.2333553-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fQ2CYDMKr4FM

Fix alignment of CPUARMState.vfp.zregs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
---
 target/arm/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7b5ea65fab..a7643deab4 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2290,6 +2290,7 @@ void arm_cpu_register(const ARMCPUInfo *info)
     TypeInfo type_info = {
         .parent = TYPE_ARM_CPU,
         .instance_size = sizeof(ARMCPU),
+        .instance_align = __alignof__(ARMCPU),
         .instance_init = arm_cpu_instance_init,
         .class_size = sizeof(ARMCPUClass),
         .class_init = info->class_init ?: cpu_register_class_init,
@@ -2305,6 +2306,7 @@ static const TypeInfo arm_cpu_type_info = {
     .name = TYPE_ARM_CPU,
     .parent = TYPE_CPU,
     .instance_size = sizeof(ARMCPU),
+    .instance_align = __alignof__(ARMCPU),
     .instance_init = arm_cpu_initfn,
     .instance_finalize = arm_cpu_finalizefn,
     .abstract = true,
-- 
2.25.1

