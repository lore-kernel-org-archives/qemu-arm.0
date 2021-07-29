Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5538030lfc;
        Thu, 29 Jul 2021 04:16:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaWqRiPE45prRAPUXqu7TqwdcJ+/bRet/INo60xjScHvnZA9cFjcstYwiDdP+XbvDmnZww
X-Received: by 2002:ab0:7299:: with SMTP id w25mr3710792uao.45.1627557414305;
        Thu, 29 Jul 2021 04:16:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627557414; cv=none;
        d=google.com; s=arc-20160816;
        b=fED/uixxIxOG/SNUKZd50Jb9gD3yF5scqLvJwSAjKj0xAwev9osOXvmV80Ei+BvjaG
         kQTRmw5VrwVVVbX22HLSMCoYDbU+/SOaU3GU74o4b7xq6te1Vlab8YsHXoaosw/RrwrC
         Am3FGkXMC7qpOLlpYlzoOtIm61CCC2E4ingQfyHSAOwOurir9uIMYajGBOkD/NPL+r1S
         tRTqUf7+7ikGj5IjGYY6OIC0/VlpPuTi5XskGr4SSPeD8IX7y11WwwElHMaoWmuY83NK
         y2rvXDpj60HK+7ewKSGmComEnbdbDjzuk2cl1TJzN5Lbavi6brDL+SaadSc0OhArfQl3
         WSAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=X46IYmwDa0Vu+Tiq/N7j9UCGpxEaqTWhGbb7xdBU5TU=;
        b=Lsw5I8zHxqJ4qP5BOQER3ewhIIaSHnQ0+X+VwvuWs4j1xcP13QfVzpbM5GvMNcE8z1
         i4xCjSmkJ4vEhQVe/tJBr9IIhYysiUuRrXorZtZM5uAhHa4W6fEgNvQnyB6+yg29Gxgn
         NTo3gx4bzMzyHXoqCc9hCZa13NAFIQ1Q5lUjCkc2fogNJHreCUYyPwZN/K9VJ4/mrEHL
         NdTVOlRa5HtmrgZclC+MXXf27NjhUX1g8RwJGyo6areUD69jl4QlYfoCO0iAEW1ywalj
         ITq58AiSy5G51r6ALzAc5D4AWHskfElPHPL/r/XJErW6HLl0GUKgQYLrrHGgaHwZ0+oh
         B4Jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WH01ZJuH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s18si1100602vsm.30.2021.07.29.04.16.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jul 2021 04:16:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WH01ZJuH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m9421-0001CH-K1
	for alex.bennee@linaro.org; Thu, 29 Jul 2021 07:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940X-0008RN-6U
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:15:24 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940T-0000um-Qm
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:15:20 -0400
Received: by mail-wr1-x433.google.com with SMTP id g15so6470058wrd.3
 for <qemu-arm@nongnu.org>; Thu, 29 Jul 2021 04:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=X46IYmwDa0Vu+Tiq/N7j9UCGpxEaqTWhGbb7xdBU5TU=;
 b=WH01ZJuHu69DDGuF8DmKOAcY/rbpiR1Ksf0wH8yhWQHmjwpRwY9RyBw7UG/BodlJ/Y
 PuFHIPvHP6dqe1NuxefNXoEWdfJrbMpxM7nmE/ZJR4UexcKt14y+bQ5h/z9oOsh3Phdw
 rHxejHJ3TLGEnAylLlT50UklLO71qM+f7ZMIFcieTuMxOS/Rkdz0JEvhjSrEz2Q4zFRY
 MfMxyOSw184ZvMjDo/GnmZrHEyju1ij48jJ53yf43Wbt9gEWS4f9LcAq+13VS+0K6GlO
 3ktVNpFlIqIDyEqyP0JO3iDQNgqsqXO9g9+7xI5kZmReMfmwM5z5YJsmsFy9BVC/zuJd
 rsvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X46IYmwDa0Vu+Tiq/N7j9UCGpxEaqTWhGbb7xdBU5TU=;
 b=UeBTh6hxLZCRnHPVpPt5/HeUb2HhselZTMj69ZTlfFLjVkUeal2nEhS0ICXWqAJG2o
 qEgpGrmor/mC57S0eEuHehJwumrEUrCPGbT8XZXSfXVo8E8eKp9mrfX0O4c4mTgCMHVM
 KsjZAQniwu8e5SeCkmJgMQk/ePR+KjrQBhwb6u8msfizlvD9wB0S/8DO3GE2pvZiUItV
 J4khpM+IfuRzyE+PJJgxMsCPATyBKJpzlrqpX0CtN5mIVlyTGErIlNkO2tebyGnG9eAL
 21U7s3FFD9RX5gUSs7TLm5V9VrsrHFq2jx2O6mOKYO9KPT+t2Me9G6aUH79BQISL+t5l
 FFaQ==
X-Gm-Message-State: AOAM531LcjJGx/bgyA3NsX8wDc79zGIzBRm8Kq8iCBSe82PFGJD+LNQx
 1+hDWFxiE/5Eb5aYEOXtycTDGllVlcsLnw==
X-Received: by 2002:a5d:6608:: with SMTP id n8mr4115122wru.427.1627557316473; 
 Thu, 29 Jul 2021 04:15:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 02/53] target/arm: Print MVE VPR in CPU dumps
Date: Thu, 29 Jul 2021 12:14:21 +0100
Message-Id: <20210729111512.16541-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mNG3ar5yfSJx

Include the MVE VPR register value in the CPU dumps produced by
arm_cpu_dump_state() if we are printing FPU information. This
makes it easier to interpret debug logs when predication is
active.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2866dd76588..a82e39dd97f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1017,6 +1017,9 @@ static void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                          i, v);
         }
         qemu_fprintf(f, "FPSCR: %08x\n", vfp_get_fpscr(env));
+        if (cpu_isar_feature(aa32_mve, cpu)) {
+            qemu_fprintf(f, "VPR: %08x\n", env->v7m.vpr);
+        }
     }
 }
 
-- 
2.20.1

