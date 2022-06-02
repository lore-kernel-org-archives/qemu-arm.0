Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5226929lfh;
        Thu, 2 Jun 2022 15:58:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzc5gYwhuOBnvLTCIkHIGAz2FRK1veVsGnsbTVqkwLGnEJKYq9qF9j5gG/vzw4qV3L0LvPj
X-Received: by 2002:a05:6214:c6c:b0:467:cb5e:51eb with SMTP id t12-20020a0562140c6c00b00467cb5e51ebmr4054992qvj.116.1654210717456;
        Thu, 02 Jun 2022 15:58:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654210717; cv=none;
        d=google.com; s=arc-20160816;
        b=XTVNIuYSf9Tsx3JU/Ez458qFse/oKCOA2cXUIjiSXT0YYByOQhb4IP0JH/SQHJVrGT
         UdybmhfUi0dw/Fk/kpTwO4195W2gVhg++Z8N091TVmf5N+/HX6+BUKf8h35jLwc/NEz1
         bjzXoqlNGlNQxv96xIG7FnWGlAZ44VQNs76M6996woO1iLLV0GTZ/eD8wXhfTlzNMSsa
         /1SjEJ4jfJziq8IzWZbFkqqZ53D7h8t3hHNC11weDFUu5prUs5jgndfGpOS3r4Reu93E
         8bOgC/Uafk8qcsW6m+EQirffCzLlpu0PKqGdXMEUr5TrNtVF/kQEQKiQEWTVGJe3Nekg
         m1dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8ss3EaTY1TKvXRQ5t3puVtJ4SylwysppKIF75i7g6zo=;
        b=EJTP6x8NjiFOhhfB/e1hu4fSl3gc4//pD6RZmtptbv/mwcQxzY9NCceKHY9J2xA5Zx
         KTDF/piA5r2/B73HSF4f43pM8RCcEkbzqCxD+nINJzRRmeS0stK7sxdrbs34XlVuQ4eU
         FKiR73mr6B1wY8JodRl4B5MtGCXiWy8WpnOZCzLbtOP1DU04Qcjkf6e0t2aE1vhu3R1m
         GoRqX3QCmBAWsSfR//1ngm7/q81N3r7sbaHF8bjMDiYcfH3Dprp/yiIuJMwNoHvQ79dA
         8wYFnMe3tAtQGysqtZTBa/WrpnKYJrftSKPY0fzebKsjb1SOJv//oRqSqYPfDW/liYDX
         3sWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e0Dzgjp6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ib14-20020a0562141c8e00b0046449aa093csi2591470qvb.522.2022.06.02.15.58.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:58:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e0Dzgjp6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwtm0-000877-Vj
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskW-0001jF-Cy
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:53:03 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:41937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskS-00010X-1w
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:53:00 -0400
Received: by mail-pf1-x42c.google.com with SMTP id p8so5801462pfh.8
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8ss3EaTY1TKvXRQ5t3puVtJ4SylwysppKIF75i7g6zo=;
 b=e0Dzgjp6I8jGOEppACdfsKJaSp7FXZyc8E20KQp3Cuhp7s8vPjzW0NSt3pLhGncxFX
 tyImvZGGwCsfTg76sDRvWAX/fbxkgIxjLRZ7usEyBJu7kUuxLF4It65jm5QZFEDMltvE
 YUtx8l010oEn9Uon4FXWl/QK442US0lIavmq92Ulrsllh5id14U3VpgdL7UOVoSDP7bo
 8jZjCR8uuqrZCED9bc4X+Qy9xu5mT1/BYpAmdGTJgUfUpiC0LKFMIryOGuQie1TI/i3F
 BvKUk8dZVfb6Iby+kEO259A1Atr0odW86Q3PV8abusC0D8COa7aRwbVXlFMcZUeKPf43
 v25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8ss3EaTY1TKvXRQ5t3puVtJ4SylwysppKIF75i7g6zo=;
 b=y3yYmSGVkgQkTCFzCSrT2LYqi2iA988LQkxQknuGAqCW4tk5yt17wkIXvo7idMM221
 CSmcp19LvK7zAvi84g6LTTa/4FCC5q5ALToOGmANckLCUAR9c2Ltrd+N59fS5l4AWRyy
 NaL2E+6xu2a/ELTf/+gX4qiJoRYId24kBzuarsLb+oV7FWjebTMGNHiuJPAiWmXJFQdQ
 Zj92yjnbfk4V8EHbhyuhRIvuHK6JMV89qp9OErEp9pOfV+n6v76qz1XcxN5SsBtMfN4l
 BpnFXgkadgjTjwYDIobMjdGz9D4RQH5631FIftrCjIYjxAPg+fgmaMCaWY+R7j5akgpC
 wEbg==
X-Gm-Message-State: AOAM532FMBGQ75a+vdZ4JufaxtzAB/hEZcwjvOkKYZXzepIc7LR6ge68
 1GLS7+LNZUeoP5hP4uN+URWr0xbROSR6WA==
X-Received: by 2002:a62:1784:0:b0:51b:bc40:28a7 with SMTP id
 126-20020a621784000000b0051bbc4028a7mr7121646pfx.55.1654206774809; 
 Thu, 02 Jun 2022 14:52:54 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 69/71] target/arm: Only set ZEN in reset if SVE present
Date: Thu,  2 Jun 2022 14:48:51 -0700
Message-Id: <20220602214853.496211-70-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RgvImZPpoAuJ

There's no reason to set CPACR_EL1.ZEN if SVE disabled.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 75295a14a3..5cb9f9f02c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -203,11 +203,10 @@ static void arm_cpu_reset(DeviceState *dev)
         /* and to the FP/Neon instructions */
         env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
                                          CPACR_EL1, FPEN, 3);
-        /* and to the SVE instructions */
-        env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
-                                         CPACR_EL1, ZEN, 3);
-        /* with reasonable vector length */
+        /* and to the SVE instructions, with default vector length */
         if (cpu_isar_feature(aa64_sve, cpu)) {
+            env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
+                                             CPACR_EL1, ZEN, 3);
             env->vfp.zcr_el[1] = cpu->sve_default_vq - 1;
         }
         /*
-- 
2.34.1

