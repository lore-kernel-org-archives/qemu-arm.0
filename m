Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp510055lfo;
        Wed, 3 Feb 2021 11:45:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzNwh3eductzVlBlAmWWSgq3FY+nwY+gXLAOnPgu0yEA8HgI9vmOs/GvX4cr1Q54q/VRsUA
X-Received: by 2002:a25:d089:: with SMTP id h131mr6797166ybg.409.1612381517682;
        Wed, 03 Feb 2021 11:45:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612381517; cv=none;
        d=google.com; s=arc-20160816;
        b=eOI4lDsiMgbfM9f/YlYz6LxByCEJh6UFVTyxuH/1Vy8CNNpK2j8+i2znGO1hNRcbCj
         w8J9Ha4N1NElFMON6ORDEb+Icl6dw+RsnsmzKzdq7ELTIt0mkpBVDyVehSFGA59JBgrh
         tfwqsLdy0+Ux6nAOS0vmqVplgAE1udLWtJV5429OVDSvCHArU3zKacZEK1w7IWFPsZUD
         K0s7f96W1/gkao4ngeAIxnCWfMJe2T6n9QDKHFg+yAV6Cgw9xybFN+YaHgVFuWkjXfDU
         wbOJfvRJaZZ3zFA0NKRjJ5NHweqKcZLvnxZ5xIzA7H1OcHAqIKhR+MJTd+XbTf6euR4q
         HSzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1JlH8qHKnc4iW1GCFnVD0mMaAs7tdU6wBK2pRgI3tiQ=;
        b=M8/uPlhXmqHoc7oZSf4rW+WYMKtNqWGKg/j/yzM+AnylGRur6cftClu5nEHTZR5beJ
         RrWdgaSpFaBSbzKdr67JkZe9gew+SP2hvmIqv6smLehhFqsOaA8FIHiIHh7xGipk5uGN
         vZczWY1l49dzBdTxDR/jobGT8HdmIOHD7FnZQ747iWMtyNcWfUN0IP8ry+OJ6o9oKt+W
         EPP7xA0ZFlxa/xvVaC1m0p2Qw93+6YlrtVqeAHyAWqJh8JYt3u10QS9R06fKUmsBxong
         Kn5/wbGB9kYazZG9ssb8cJWsd8aoZ1+QH8ivKXAShpex/oVegETrtosIPZXtWkWELGMC
         Y7eA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XD5R2S8q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j63si2812409ybb.463.2021.02.03.11.45.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 11:45:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XD5R2S8q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7O5V-0004Ub-3C
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 14:45:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NP4-0007lR-DA
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 14:01:26 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:34284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOu-0001rw-0u
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 14:01:26 -0500
Received: by mail-pg1-x534.google.com with SMTP id o7so407478pgl.1
 for <qemu-arm@nongnu.org>; Wed, 03 Feb 2021 11:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1JlH8qHKnc4iW1GCFnVD0mMaAs7tdU6wBK2pRgI3tiQ=;
 b=XD5R2S8qlgpO+BacRxZNnKWvWWIpOK8w1BzL7HVvu09Wq0PncV9D8y0++b2qoaji6+
 9kw4o8LVUMcOb94RVQA9THTapA/tynKV/2/2EFUDHsNeoCxmgOlJ2Vpt/FKWirJKXfnJ
 hdq3IndyEeuhwA6AB+j82ReXrnPxXbybmZ2duZU2knX//Ri24jyB3o2JoE1K5iy7FkkQ
 nGkhrf7PZTOluhlzZHxXF2kdHhSJl+tF06SGenUtcs0iIcFYtT4wL3T81RT9U08aeHMT
 wmJBbKRaCbAxzYAyO2wM/CKNv6Z8zUxnuVSJvg1evMjm0hDGf4njxdRH45YuMerZy8XY
 A0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1JlH8qHKnc4iW1GCFnVD0mMaAs7tdU6wBK2pRgI3tiQ=;
 b=MlTXDe16rHMs/pdnKjzC2eFWku+O8EnF3h6Gut746QqapbaG2ZQWLd10zrzM9W9W5b
 ndCnJoeq4Q4cjMiWhCggo8waFnRJmr0+d7Y0aKb9v41wGAZ/CT/EW4OwbxjsYQTlbSMX
 ZcuBoSAn4+Rsfq8zv42fX1O2yRdCXtDVS+W2XxEsnuejKaeTmYkTtF/BKt5AXvLm+CqZ
 DZdmz09TrtwPRpVlRjHffj7seoteztBliO/0hSlCjdmZ15Q2F9GukzHe2kC5cDdEcN5F
 ef688cymJPLb0yTySw5Z36wOcL1PJ8i1unzrxmT5FI7/ZU8ZBkf8HVgvTVwAK2lfxAhV
 Vqww==
X-Gm-Message-State: AOAM530K/S+kZxfI+/8sfEuNr/tj+3HsxqhR4SS/GMS7JxDf/QXnPFBC
 RuoJUihWAiT+NVv0++xmlsuzEA==
X-Received: by 2002:a63:9dc9:: with SMTP id i192mr5148527pgd.271.1612378874685; 
 Wed, 03 Feb 2021 11:01:14 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:01:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 30/31] target/arm: Enable MTE for user-only
Date: Wed,  3 Feb 2021 09:00:09 -1000
Message-Id: <20210203190010.759771-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8meWLFTzkHau

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index db81a12418..43933550c3 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -204,6 +204,21 @@ static void arm_cpu_reset(DeviceState *dev)
          * Note that this must match useronly_clean_ptr.
          */
         env->cp15.tcr_el[1].raw_tcr = (1ULL << 37);
+
+        /* Enable MTE */
+        if (cpu_isar_feature(aa64_mte, cpu)) {
+            /* Enable tag access, but leave TCF0 as No Effect (0). */
+            env->cp15.sctlr_el[1] |= SCTLR_ATA0;
+            /*
+             * Exclude all tags, so that tag 0 is always used.
+             * This corresponds to Linux current->thread.gcr_incl = 0.
+             *
+             * Set RRND, so that helper_irg() will generate a seed later.
+             * Here in cpu_reset(), the crypto subsystem has not yet been
+             * initialized.
+             */
+            env->cp15.gcr_el1 = 0x1ffff;
+        }
 #else
         /* Reset into the highest available EL */
         if (arm_feature(env, ARM_FEATURE_EL3)) {
-- 
2.25.1

