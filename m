Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp686797njb;
        Tue, 13 May 2025 10:45:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWFHyNC9Gxj9yawUUIvmGc6r0VDbp8j6aLvA5I8skEHfWXxoVn24USmciwT0+3Rf4P3lGiBozLIJnGupg==@linaro.org
X-Google-Smtp-Source: AGHT+IH7qxgQZuEkXN9h0iNY/TbSCVM7Yrt/IqOG9G7BHcXdVdNmL/80eZgvL84Cn+KOqmbS5Ap/
X-Received: by 2002:a05:620a:4091:b0:7c5:5692:ee95 with SMTP id af79cd13be357-7cd2886f9d5mr68586285a.51.1747158322655;
        Tue, 13 May 2025 10:45:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747158322; cv=none;
        d=google.com; s=arc-20240605;
        b=RaLgVLVtHRVjMe00K0wAhUsEzE/L4wFmP+y4K/YgIWdg/6bljjl2IB8q2nuY37GyWn
         3pRRS3PaFXPwOabY3Ul6v4iG2XAGfIimA1fjWUo3aw29QpjLbDd4h3ygl7E+6W8bE9hK
         4Qx/p1/mUew7w2iRcIGdaXz1faav/vFmyS9FztRz47U2kRdflESuNnzlucQYdcGsUJrT
         nYhKt0j++i7uMcZCathgAm/RPfToPCql3mahSyYydPB9mJSZEU8mcyGR+OxeFRYapx9d
         THke00hxJnypKPY0lsD9NRHPlm82l/7ebW3F5gcPCKCTK3GX9IfgeajZjAbbZV/BzcFS
         1dHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qVIjgN7PqQ1InviEgK5iLvt5f8f9YeJbM0wSldGeGyk=;
        fh=oAG6HIcuSPumOYs2ef0NYEkSLIm7D6VhhjfDQzOYEY4=;
        b=ZxXbC5KmmJT1YuRPAbvMSPiB/nbkuobMAjyngziwxcwiVsk1ArYF7WcOupIQpdNFo/
         Y1p32EkM7KDva7q82wj0ReYDJ3U6u6Ya7sXUX32SD+/xzkdq1EhL+nqzSyFv0crplnk9
         dt2rH+MEzHJ4ur+1IJAsMMlw3lufHVaQ8U9Xwp+1zjmmWPxAuDALdkT61COKtfufA7wf
         jRyjcNzYMY41xCIc9yzQiEL74PX50gSQ86ktG4NLgf0rq4jtIYp7QtViGQesj3ZWzAt4
         0pDxg0w+EKqcaOk6mp5VvvnJBXIM61HdKeMvH5eHvxDHs8cweLXeum2YazwK8o6mlmtl
         c8OA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VkOp8QP6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00fef47csi1122390585a.550.2025.05.13.10.45.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 10:45:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VkOp8QP6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uEtfx-0003al-QK; Tue, 13 May 2025 13:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtcm-0000tm-E1
 for qemu-devel@nongnu.org; Tue, 13 May 2025 13:41:10 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtcZ-0003RN-FV
 for qemu-devel@nongnu.org; Tue, 13 May 2025 13:41:03 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a0b9e2d640so5409887f8f.2
 for <qemu-devel@nongnu.org>; Tue, 13 May 2025 10:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747158049; x=1747762849; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qVIjgN7PqQ1InviEgK5iLvt5f8f9YeJbM0wSldGeGyk=;
 b=VkOp8QP6tRbv3LVEphT5bOqiwbYutgdT2gYJ+jdFF7OtkU/nW4Ra+mF9mLTYdXa9Bh
 aplxYINE/cwf50/0sFK8tMTUoBHs6v1bFWtd4RQFvUoGVpCz47pl6gBquTRksgUxj/t0
 Blya5A7tjPBuRh9xOOu1dWo+5ynewdT8Y+VDwsWkgMyPLwV0VPD/GBsBnK7PMG0TbNuh
 FUCVy/FT+DlK3f5ZVs9xM8HHrvn8MvvR1fVrCz9/ZFEzSZFX07fagPHHoNg4yCFfk8iE
 f8UpqGG0FXrtCtDpg+Mj6j1uI5x+CvO1PzPiQ7kfz4ZC9Ir4IPAS0A/vDXAfFS4VrXAJ
 mwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747158049; x=1747762849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qVIjgN7PqQ1InviEgK5iLvt5f8f9YeJbM0wSldGeGyk=;
 b=Sim6GHeW/r7sacOY2QkP74OEZfvbdsfjN7TQTbaE1ShDHYP+WL5cvjtI4rRr4PYqwM
 OlMChvERC34MRFxGRQXiEI7WnE3yxixgaOvXT9dqKnm8cM09mhCme9UBB6RqRak1G4w8
 /KyA6u3yvvdznsp9pAJ1vkAv2h6z9OIknj6pyn8cND1dkurL/GSL9s9fozxGwtiqvSzs
 QH+lCEFRQh91YMmaAFTZCcN2oVO+uSiqUyqNToeYcF2hnYy4Jm9zlm+ASHk9XofX550N
 ZnR8hpebe7CWQQq3EE5vwb9SXkQSnBe51tnRRBu/5ev3ZkRIWJesqN8aBaZTVbTZMz2w
 mMLw==
X-Gm-Message-State: AOJu0Yw/ry+lkKUhorQmAVgX+apAWYQNG1S6FfODRGbcXV1GLGq0Q7jM
 9rB+SfcjQOTIhFPut4tRG2DiOvjE2uSqz2COMVlF2ellVkSlBRggQHRwYtI5EnoCDjoSRDHGv/i
 6eYk=
X-Gm-Gg: ASbGncvQ9x+mL/mJPVpJw7vVKvOMEMY4J39De7R6SiwYPiwHY3CQByp4iIhkmmflAyJ
 Vc685AH276bmgwsRWZAsWjrQejmOCBlZvAV+Gil44qv6UhO7x3GANY5YUugrh8uTGUcuSKMVjx3
 wUVW5zO5Ag0o+nrPfhl8Kz+y0kfdNLzRvdLTJYdXT6A2aywuXjYqTDFO/lrkI5UuBrQyui13Q2W
 iIs5jDjEyre/z6ShJ06dBlf5lRsX98o7PzfB66U4RiX2YsVhqnukYAvvOiKWAKPC2vG33AGAkA9
 ZLhNnKk2io0wCPQNqHL28yy0pVf7Ju00Yzx0ShfL7rO2GeER9rXO5hEbcEQ9mnPI206vbyx++On
 NgJuEgq35nRhS5uwK3C2tqP/31brf
X-Received: by 2002:a05:6000:1889:b0:39f:28de:468 with SMTP id
 ffacd0b85a97d-3a3496c4202mr163244f8f.28.1747158049447; 
 Tue, 13 May 2025 10:40:49 -0700 (PDT)
Received: from localhost.localdomain (110.8.30.213.rev.vodafone.pt.
 [213.30.8.110]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a4c5e1sm16732453f8f.89.2025.05.13.10.40.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 May 2025 10:40:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 16/19] target/arm: Add arm_cpu_has_feature() helper
Date: Tue, 13 May 2025 18:39:25 +0100
Message-ID: <20250513173928.77376-17-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250513173928.77376-1-philmd@linaro.org>
References: <20250513173928.77376-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 7NfToJ8zxiLO

arm_cpu_has_feature() is equivalent of arm_feature(), however
while the latter uses CPUARMState so is target-specific, the
former doesn't and can be called by target-agnostic code in hw/.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu_has_feature.h | 2 ++
 target/arm/cpu.c             | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/target/arm/cpu_has_feature.h b/target/arm/cpu_has_feature.h
index 2adfccd9208..352f9d75bed 100644
--- a/target/arm/cpu_has_feature.h
+++ b/target/arm/cpu_has_feature.h
@@ -62,4 +62,6 @@ typedef enum arm_features {
     ARM_FEATURE_BACKCOMPAT_CNTFRQ, /* 62.5MHz timer default */
 } ArmCpuFeature;
 
+bool arm_cpu_has_feature(ARMCPU *cpu, ArmCpuFeature feature);
+
 #endif
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 8c9d161f2ef..759636a3b0e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -54,6 +54,13 @@
 #include "target/arm/gtimer.h"
 #include "target/arm/multiprocessing.h"
 
+bool arm_cpu_has_feature(ARMCPU *cpu, ArmCpuFeature feature)
+{
+    CPUARMState *env = &cpu->env;
+
+    return arm_feature(env, feature);
+}
+
 static void arm_cpu_set_pc(CPUState *cs, vaddr value)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-- 
2.47.1

