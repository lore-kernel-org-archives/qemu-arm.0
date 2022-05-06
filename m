Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1983870lfj;
        Fri, 6 May 2022 11:18:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2n0+lGrWK1EYvc2R7zqI49/IYLLdNUtxlovtTuzDE/JNE1r8riSTIDTDZOs1YcMLDKjqE
X-Received: by 2002:a05:622a:6082:b0:2f1:1f9c:251e with SMTP id hf2-20020a05622a608200b002f11f9c251emr4035424qtb.230.1651861100012;
        Fri, 06 May 2022 11:18:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651861100; cv=none;
        d=google.com; s=arc-20160816;
        b=K+5R9tKe8uoDP6/D7wy8Y6N9GIPiI0YQPQPnpPXnOuqtlSxnABeOub0kRPoPL2E7tk
         UNG4Z1Ng9NaUdvND7aoQ2jvblFN6pdwS4rr4aICkOwVTHcySfmd0SbLqgpgLeEly+NtJ
         3IfwLPy8iQt3PpNh1AxkLocVl7s24NOvRzQ0qp8+5dTsHzDiANVpI2HjxpO6VSvnDdiT
         K5qF7QX7sIfThxQp29WakhRnosmLsV82SyTF3WxjLLEbPtReOx4BBVf42uqO21TffRRQ
         ta0Fjwz4IRDC1KADl9fZYU5U8G3ETkhRU02WFl/iJdNSRiiGDzhELuob9D/EWuriccvf
         sIXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GY2odDA192T0ClkUF75+bPEfdCFgpsNoLihYttz/3zY=;
        b=XzPZnIMSIxB5UTMi+tW0x83hYKLGPp6JUYCxCppszDi2aIX2Frj0ut+xNvzuiYVFy4
         iU2lpXtUlN7jYkC7VoOABhzPIw8CfobduDzIbIjSV4K4oLTn+hanYrWbf8OVTGhvFiFY
         onUOj7HD38cIL5FbZQA9snKozn7OutgWhVGw7/Y4tXV+QcUwqTrt9Zf1mq+eRFKvL9gR
         TM1LhsivT57oUuLU+pZpQwyd2vZP36X51akP2bEmMjz3xsmS/12gmRjtkSRcW5t0uMnE
         hC6OB36h4ttkG9/VEEfDG0Gw3VAzZJLV+ERJ5HRaT+2QLa7UI7gAmQyDz/Fckj6x3irf
         3MaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cvFabjus;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t9-20020a056214154900b0045ac6173ac7si2454822qvw.194.2022.05.06.11.18.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 May 2022 11:18:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cvFabjus;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nn2Wx-000794-HB
	for alex.bennee@linaro.org; Fri, 06 May 2022 14:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IR-000625-TB
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:03:21 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:46690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IP-0003qH-H8
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:03:18 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 k25-20020a056830169900b00605f215e55dso5407065otr.13
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 11:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GY2odDA192T0ClkUF75+bPEfdCFgpsNoLihYttz/3zY=;
 b=cvFabjusyDYtYvLDBIguxD4+mL6yFsulBytm0WpGIPvS4/opCcsgQGv+XyhkdrtFtf
 DAJMJGmF5qxWb/U7etAXdT+vckIy0GmnkD0rW5wzAjnsgiYDoagPZYFZ1IWNQ57EaWwp
 F7QowXRqrYT+TIph9KeyZPU15qK/fXgdP0mNI/IEQox6+nN7779Qrj07xMIKZjGG5/9H
 v5mmg4GPyBcH6CfjIuiG21Sg+f9S/yeYIbBnLsqcGpGA9h5rzfEqAVClKy4Szw0K4Hag
 2iqmAvMY3n058oS2gjlJs+oeIfeiy15+Y18PjtaJAyeIfWHPbMTcT78QsvFzyWaBsXaB
 nqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GY2odDA192T0ClkUF75+bPEfdCFgpsNoLihYttz/3zY=;
 b=PFC0U1ssao3UbVTVJnWI5eTdvxH5U1DqywRXbg7fB7KLkVNRQN3nrSYuO542CyCruo
 eCggGQnUFBTrKErpEVN3XkKONKFKn8mdWHR7UE0RVooQt1CoFSduW/C4IKbbM/Fgatlx
 yCXQdGAMRGRSnHMCE5HhhmdUTLYzSUfYs+K9953D0YTbgDJe4iRJY+LfEwu3wPI6ddrU
 37iwfcD7cZ9WrU/2taJGrWGRFd5poi02LOVUAkEHYdIOCk6SICkF2lDjDNon62NQN8Fc
 sgWBvjSuCHyJRpYJgA8PwhrD1muVZiaLwejW2oIB7FenyL0IBiB6+FSM7xI/JElvI5XF
 j7Pw==
X-Gm-Message-State: AOAM5329az20xwGeE6eKEAbsrEDHtIRvBMimA1briJbegj2gHdeCiK0C
 nlWwnTVyqHoiWo85m4s//TNCOw5jsRZs2tDW
X-Received: by 2002:a05:6830:4420:b0:606:64a6:1deb with SMTP id
 q32-20020a056830442000b0060664a61debmr1095139otv.236.1651860195231; 
 Fri, 06 May 2022 11:03:15 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a056870c0c400b000e686d1389esm1780002oad.56.2022.05.06.11.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:03:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 18/24] target/arm: Enable FEAT_IESB for -cpu max
Date: Fri,  6 May 2022 13:02:36 -0500
Message-Id: <20220506180242.216785-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220506180242.216785-1-richard.henderson@linaro.org>
References: <20220506180242.216785-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: WXPUe5wDXviv

This feature is AArch64 only, and applies to physical SErrors,
which QEMU does not implement, thus the feature is a nop.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 8110408000..b200012d89 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -25,6 +25,7 @@ the following architecture extensions:
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
 - FEAT_HPDS (Hierarchical permission disables)
 - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
+- FEAT_IESB (Implicit error synchronization event)
 - FEAT_JSCVT (JavaScript conversion instructions)
 - FEAT_LOR (Limited ordering regions)
 - FEAT_LPA (Large Physical Address space)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 35881c74b2..10410619f9 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -781,6 +781,7 @@ static void aarch64_max_initfn(Object *obj)
     t = cpu->isar.id_aa64mmfr2;
     t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1);      /* FEAT_TTCNP */
     t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);      /* FEAT_UAO */
+    t = FIELD_DP64(t, ID_AA64MMFR2, IESB, 1);     /* FEAT_IESB */
     t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1);  /* FEAT_LVA */
     t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1);       /* FEAT_TTST */
     t = FIELD_DP64(t, ID_AA64MMFR2, TTL, 1);      /* FEAT_TTL */
-- 
2.34.1

