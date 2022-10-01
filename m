Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp464700ocs;
        Sat, 1 Oct 2022 09:38:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4k5CMbcWm56o+52Jk4ip8qtl2AnQljMu19Ke9gi+9+63MdckR+2HsMaMoQ4A/ukjXOHMmA
X-Received: by 2002:a05:6214:2686:b0:4af:630c:78f2 with SMTP id gm6-20020a056214268600b004af630c78f2mr11319868qvb.52.1664642298711;
        Sat, 01 Oct 2022 09:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664642298; cv=none;
        d=google.com; s=arc-20160816;
        b=CTHRB4O045O4wefgr4TcFr8enO34J73vh5rKwG+HQWaHCn5F7g2koy+Fny+535dr0s
         +njXWR0FovYnWgx6YzLE855op4SJJsp2svvxZTIui9qXYFGeiFfwbuOS7PFsqwakFpMu
         9xTHpJtsLOn3g/9qX/Fslmhf6XbatlcK0hLLrnQoWYkntqQ8xB3rshtWWSZO1maPB93I
         cIYpkM4lg85pcbyKnetgall1yKS2xlT4Qu+LIpYzvNZKssxJbPePGGwFaAC5dFmW9A8E
         fwliXLNWNyMJqk9MycnvFRKR1eyURnznqCG1G8+h1xft5kvXM6bQAEh+sf73qZIKnTUE
         Y3zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XPPHU0lTWthT7ltYYV7t26jbrDU+bNcf6qqSn2mwNC8=;
        b=OyB77dXrPkzRTdtBKn29Nt2QVrKaV4okU0pwOOMtB/KUSiZ5eoC9FNEedUHjiZp2NN
         cfz2eSQrWLLy6Zblvk19N1R6rFr6OVUQxXENYivgOAMPSt1MoHAbsH9Xx7204XB2qlPs
         A7yJ7URmirF6F0nYV+MikF1LqB6CILJrdNyUEED1iCbc8nVDh2IjyIThTj+8lTg7EuVy
         ky3vlBZW07ivAmW4NEr8o58tqE5HOz70jtJRT1gmBJ0kyGgX0kCBG9AvtTBlB9InmLPU
         mv/soAI0tiLltDT15VHBv1akMltL7Xeu+TTVvIWHKO0tDeHAw9daH1f+TvnATvC+pHrj
         nZNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kCk/cnCP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cd4-20020a05622a418400b0034306280fe4si2564652qtb.196.2022.10.01.09.38.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Oct 2022 09:38:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kCk/cnCP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oefVK-0001Xs-7Z
	for alex.bennee@linaro.org; Sat, 01 Oct 2022 12:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHW-0006kX-9h
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:24:05 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:37498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHO-0006Gt-MB
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:23:58 -0400
Received: by mail-qk1-x72b.google.com with SMTP id s9so4542221qkg.4
 for <qemu-arm@nongnu.org>; Sat, 01 Oct 2022 09:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=XPPHU0lTWthT7ltYYV7t26jbrDU+bNcf6qqSn2mwNC8=;
 b=kCk/cnCPZGTyn4lbeziQXU9ruNq56Sfirxfs9RebssrvtiIctRHf21YcKDxwAg/wUf
 HrGwpIWT7JnVohn/lroWJTkalKK51tzI35hi2wryYUaebH/7bt41XYAI1pySm6zLbRpA
 WBFX+RybOzHPb6D24CJUMOI8YenlOe7vbIY0/7go3bkv1CUkae0D4ZdDM1xnj8HsDnMG
 9irFd3dHM8QGEYsMFxu53De9D5Pxpm/ifpJU9pq6IKRFe+Q5drQ5iFYUPU/lxCgG+Os0
 GkkLm2ChrVi2JGmOG7h705xgSMYUIGKNiiZOou0hIJQNPyyzERSMT1svy9gyOGeH8vkl
 +U8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=XPPHU0lTWthT7ltYYV7t26jbrDU+bNcf6qqSn2mwNC8=;
 b=lSeR3wYFSoKIZcI9eD+ta7sx2JxvHP0sA7ts5O0MZ/vAuQwu6CXqqN2nZhOoL227t+
 IMLPyDsexbaH8xq9oSu79Sgn+1nKi1+zOYZkAhtS8GbXAO7lEdNEjVAfp3f6V8LAFTNf
 Z3HmwtWRVoNTgsBfzJg2miFq8rTPuGKW+z203Rg2gCfPTyGDZRyU0GaQ99lFw3kJNlqJ
 7wmhaEAHe+dq5EfPkR85P46yNdh448LJHd/98aBQeCuqrR5EYtK8HqAKmMbaBeCdPXiw
 RN2XlP2EyDHHWke+K1ZoQXVkOjoUlWa9+dIgx9HsHnO8Peuouixmbvk6Uj6Br9jtniXU
 fxXQ==
X-Gm-Message-State: ACrzQf3QpASFAYkYje3WZOSP20gwy5Yv3Bjs8O7T0SXAV1ObgEQ0hzoe
 xlbm81ObU3zw+6nW99JLI68P9w==
X-Received: by 2002:ae9:e206:0:b0:6cb:d54d:69ee with SMTP id
 c6-20020ae9e206000000b006cbd54d69eemr9816891qkc.466.1664641432065; 
 Sat, 01 Oct 2022 09:23:52 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:23:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 12/42] target/arm: Drop secure check for HCR.TGE vs
 SCTLR_EL1.M
Date: Sat,  1 Oct 2022 09:22:48 -0700
Message-Id: <20221001162318.153420-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oFLBLeDmhKFx

The effect of TGE does not only apply to non-secure state,
now that Secure EL2 exists.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 2875ea881c..1ea29bec58 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -157,8 +157,8 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
     case ARMMMUIdx_E10_0:
     case ARMMMUIdx_E10_1:
     case ARMMMUIdx_E10_1_PAN:
-        /* TGE means that NS EL0/1 act as if SCTLR_EL1.M is zero */
-        if (!is_secure && (hcr_el2 & HCR_TGE)) {
+        /* TGE means that EL0/1 act as if SCTLR_EL1.M is zero */
+        if (hcr_el2 & HCR_TGE) {
             return true;
         }
         break;
-- 
2.34.1

