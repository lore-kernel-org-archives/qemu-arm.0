Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1013961wrm;
        Fri, 11 Oct 2019 08:57:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwQZMUZhT/gA4D5oXk8LDshK0dkbTgNdqu2Q6qgz/SNIRE65DEvEjFb2k8+jmupVFYUV1FE
X-Received: by 2002:a05:6402:649:: with SMTP id u9mr13898379edx.200.1570809438255;
        Fri, 11 Oct 2019 08:57:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570809438; cv=none;
        d=google.com; s=arc-20160816;
        b=XPGV/dkGtiJlEEf8uLSGgb1MlPrx2EfL3JXaWP7/8ne0lSspnTqWU2Z4LXViPByFcr
         0ipTDhFfWDRPwwcFgWJWV/dp1KXzTFyUtI9ZNb11Hkj17osUKKN6CKt1l9T2j8ZWuWKv
         okDcTg6y29tXH/DihrKZP7UB7Km35It3E9BiG9xW2b5zLwJjw/qbg4aGbY9YZlajRrVT
         9Bgv1VjgLRnMZpRbHK6eG0jLE2lMPnwOvSBBsdljPc6sLQEaKXJNKQbgNcvnQikYKbd4
         qEwijRGZROCE6DL9GMBkA8d7MwM3Oc0NTIO+SmDDK5LU27dy56zvs1sk04VJF+5NDIen
         jVPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=nFJqxK8OKOrQev/1CQPrr0VKM/9+1cXcigS/dy+zmf4=;
        b=AAqYQ4Y9ydCPh7cv1qCVT9OjrV8TKkezh1YW2sG+Srlfo137D63V7kFQ8dV+WEKIli
         RW1eM3d8dKw6MkgwODkh7mps1/mVq0NvUOPmTt2YskzGwzwK6mC6CAGZapBd6vB/QFa6
         84KYcK2l8KhFcu2WABbru00jSskQwHetOrhku5rGEaLVtk6CnvxqIWkdY0ywcPUz9csN
         dmPvYd1YbsHP+RK/cK3RzWxr9Bh+6BS9bmDlum8c8GzCcbibtmovlNJGbY9HhcMGbTpr
         z7lq4XSN6psNG3akIg4dq8Sd8KlZmRBdF3v5mmsQ6putr2LpDJfs9XzJaEwTKW7yg638
         z0qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vls3T+ax;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c26si5942115edx.353.2019.10.11.08.57.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 08:57:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vls3T+ax;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIxI4-0004H4-SO
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 11:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33666)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxGo-0002L7-1c
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:55:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxGm-0007e6-Ri
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:55:57 -0400
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:46737)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIxGm-0007dl-Nd
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:55:56 -0400
Received: by mail-yb1-xb42.google.com with SMTP id h202so3235711ybg.13
 for <qemu-arm@nongnu.org>; Fri, 11 Oct 2019 08:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nFJqxK8OKOrQev/1CQPrr0VKM/9+1cXcigS/dy+zmf4=;
 b=vls3T+ax6QRQgGywOLqQFOiAiTSTvgQafBGaYNxZtVrM/3E7oeVhIBRlMQZZGuqHE7
 eyYrnew1A3OkIWvu0J8mxfckeIwXrl918zUEsg0AJu/0SgTSBXL3UxhA+CfmVTm/FJhN
 bmCM+fx1E/RuODQVfOcwN3OSyehSek5kTgC5VY+yz1vkvTivJSAJObPfhiMZ53knNzmZ
 54y121qSTjSHL3YoFb64MaFOV33BCRKL9u9WB3ld68MXu/FhgbB3aevfVVsvO07eRDDg
 q8P5c0sJvO7mx9q20WkQ9KQUSj2AYDgLUGxtVjOKAPAhWoU/3nC89/VhRYI90Y9P+fRL
 insQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=nFJqxK8OKOrQev/1CQPrr0VKM/9+1cXcigS/dy+zmf4=;
 b=Xb73ioskNvBe5WfV8dHpW7pwR10MqGKlgjKJKgszoCuDmYom9XeXF36oqjU7Etk42X
 LtEAj9R2kdRAGHsL2DBSUn2MZoZ/r5mm4e6w0OKQHYlTC5bXPd4pzj8t+l4zWSF3IQ1D
 bFktjm1YR+szvdJGzdvA99W4hjGm853MDEQitAnKk6LRjlWP9A1oMeysIsERfIwfn3BX
 EHRyHxjr1eusrXX/I4jOEjJFcSvOhgxZtsiiQBX9Z5fA4MsN5pYv2O/oOmaZ7SHKKhk/
 wCfid+FOLEqK6esNyjtiM7n0H0jaZVtbu77si/TSPqDdCI0zJpz7rwtWGoWO8ycY6pde
 mANQ==
X-Gm-Message-State: APjAAAVECPqgeNcXlL8ZjPW+LTbhVQsG7oaVcfVDqsKWXtJIeC6ZiM4t
 MBrrTU+oRaWDJwme04f1qcRgOA==
X-Received: by 2002:a25:388f:: with SMTP id
 f137mr10148377yba.223.1570809356070; 
 Fri, 11 Oct 2019 08:55:56 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id d17sm2473139ywb.95.2019.10.11.08.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 08:55:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 07/20] target/arm: Split out rebuild_hflags_a32
Date: Fri, 11 Oct 2019 11:55:33 -0400
Message-Id: <20191011155546.14342-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011155546.14342-1-richard.henderson@linaro.org>
References: <20191011155546.14342-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b42
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IB9Dd3TnlO9F

Currently a trivial wrapper for rebuild_hflags_common_32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 296a4b2232..d1cd54cc93 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11106,6 +11106,12 @@ static uint32_t rebuild_hflags_m32(CPUARMState *env, int fp_el,
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
+static uint32_t rebuild_hflags_a32(CPUARMState *env, int fp_el,
+                                   ARMMMUIdx mmu_idx)
+{
+    return rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
+}
+
 static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                                    ARMMMUIdx mmu_idx)
 {
@@ -11218,7 +11224,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                 flags = FIELD_DP32(flags, TBFLAG_A32, LSPACT, 1);
             }
         } else {
-            flags = rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
+            flags = rebuild_hflags_a32(env, fp_el, mmu_idx);
         }
 
         flags = FIELD_DP32(flags, TBFLAG_A32, THUMB, env->thumb);
-- 
2.17.1

