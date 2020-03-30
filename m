Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2974614lfi;
        Mon, 30 Mar 2020 10:07:11 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvidB4swHOFsDXZnIvikkTL8AyVXLnICFlu/bXSzqPO+DfzzcFnVmps+rFPDQ+mGcacbpJo
X-Received: by 2002:ac8:6c50:: with SMTP id z16mr1002974qtu.154.1585588030925;
        Mon, 30 Mar 2020 10:07:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585588030; cv=none;
        d=google.com; s=arc-20160816;
        b=xXC6/N2D+N0+Nst6syJRTwQJbVo2+E9G63hU6+kG9lB/VFtZY6Q/cuTJinxyTm+s2W
         G6h/SGlNJtDyO0i1ckMeRrtYoJPFvAf9l4VWEFnRTYCdBLwZaVglRCeOnxsUIjtkA66P
         x8JGkiOad+jo6gjaTZNVTBl/CP+xcxBYvoBfqMnfyUIn+sPVqdpfIrL7z4EMTfmOCepi
         5am1Eq+dAszHp6rPH+ZbfyJu5HgdlwPqOIQqAnpXUuCduQWW8UfSqNwQCkP58oox7Ku8
         Qfn/ul/qj1Xi+e+EeZYr0r+XHjKR4Ozr3U9QOThM/zIXPq175Z/lQDqz7mRv7PHtxak3
         YR/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=mfnVD714sPEUmYFC+jPaoOlpvFWNuI8yQfnoLWvtCfw=;
        b=nYOq4n6OFDTnJCQnmzzl+94l61WbiPtUY+x0c778Mqc+RlO5aApf39XAAKx1YzYNZF
         0tk6lsJPKSLP0RW8rTwcVrzItsFbPF9XwcwgQIVmb6igiF98atJboQhwU10nus3w27e7
         5Vg6O+MyykOUmr5F82/SFCXKpWW6t/V7PzNBsHGPDRdFDwZcUkt80YSncMvQE0/Rc/Ib
         dQxLHMlpqHoi/F6UvL2wGlEE7UEvq5yULT+DsWW28JcYB+GnD1fGHOwP9CAv0+uOAfBC
         G56dfNq6e04A6nF4M7nBzUxu2esiHwAsvu7W17ZdMW2bLZEOUmBaiIZRUreSve5Rbgxx
         x/9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E3c4FUrb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9si8784154qkn.374.2020.03.30.10.07.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Mar 2020 10:07:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E3c4FUrb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jIxsU-0000VT-8P
	for alex.bennee@linaro.org; Mon, 30 Mar 2020 13:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56889)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jIxsH-0000Fx-4o
 for qemu-arm@nongnu.org; Mon, 30 Mar 2020 13:06:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jIxsF-0001nZ-UZ
 for qemu-arm@nongnu.org; Mon, 30 Mar 2020 13:06:56 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:35200)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jIxsF-0001iq-Gz
 for qemu-arm@nongnu.org; Mon, 30 Mar 2020 13:06:55 -0400
Received: by mail-wm1-x344.google.com with SMTP id i19so2483404wmb.0
 for <qemu-arm@nongnu.org>; Mon, 30 Mar 2020 10:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mfnVD714sPEUmYFC+jPaoOlpvFWNuI8yQfnoLWvtCfw=;
 b=E3c4FUrbBuI/MXLpgfCXVYWmmmqP4DHNhJccTqwnbuMpX66Iyv04l77kxirnKAKQCc
 3aD6Nh9UfpHb+dKVylZVbCd5hQ3FIr8VIpzlLRpCEwr72VwcPy7BPGrJBK5TDerhrM/T
 WrT1Ld/3EkIIinONtTtYRRerITgO7Z+fuGW/c6k7kyOWQOhWemAplSPPS98V7NDcz330
 EFRjOTLLR9L6hf10L9gYXftEXnXKnM8XMBq8ok1MEm0NLipSGXxEDG+CgakYd/gNPtPQ
 4I4pL5FzCHxLJf+9lJcAqOG82YJmJ2uldsQ083UuOEOV++wiqAjoIBGFn1f+3scOcsVe
 0YYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mfnVD714sPEUmYFC+jPaoOlpvFWNuI8yQfnoLWvtCfw=;
 b=MGGg6wyQa2jUM2gEcdqQ2SBuwdQ3IRbWweT9FRmLM93YKSxhZ2/I+m57r7RakbmloK
 kjhVYSUKI9adNmqEN9YIaau2u0OMb7/V5eGP9qn3Gos2BaaqcIKL+7DQ+pLnS8o2qEAT
 ahZGd9drPoj6i9D6glF0K+SLO54P2D1dCUglkiUqS3JAJnoD+/vk1NsE+ZtITh+QTRVL
 a/KUu/KeszVm3J7xsdWVCJ/QNLwn8kEcwZ/Y5Jg8QjN9+W0lK/l4UY8E1lFzN0DlWeB5
 Uq8knpKc/D7Nv7mNaFYQI+9YvjFFcAQmAYmfRJZrGUvZ4CgSAS7owWwoTAdVQgKwQkFG
 7ihA==
X-Gm-Message-State: ANhLgQ3C9mC2OLMsZCKh2ETvXE694QaNxFyu8sRqrUMhF5tTCb5zQh8P
 qgbxTi5DJhDgQPBEGsbM+CikxyK6BBm5Dw==
X-Received: by 2002:a1c:9658:: with SMTP id y85mr245194wmd.63.1585588013996;
 Mon, 30 Mar 2020 10:06:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 61sm24550033wrn.82.2020.03.30.10.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 10:06:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-5.0] target/arm: PSTATE.PAN should not clear exec bits
Date: Mon, 30 Mar 2020 18:06:51 +0100
Message-Id: <20200330170651.20901-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cfz+9oCug5Ds

Our implementation of the PSTATE.PAN bit incorrectly cleared all
access permission bits for privileged access to memory which is
user-accessible.  It should only affect the privileged read and write
permissions; execute permission is dealt with via XN/PXN instead.

Fixes: 81636b70c226dc27d7ebc8d
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Compare the pseudocode AArch64.CheckPermission().
---
 target/arm/helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 163c91a1ccd..ed7eb8ab54e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10025,9 +10025,11 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
         prot_rw = user_rw;
     } else {
         if (user_rw && regime_is_pan(env, mmu_idx)) {
-            return 0;
+            /* PAN forbids data accesses but doesn't affect insn fetch */
+            prot_rw = 0;
+        } else {
+            prot_rw = simple_ap_to_rw_prot_is_user(ap, false);
         }
-        prot_rw = simple_ap_to_rw_prot_is_user(ap, false);
     }
 
     if (ns && arm_is_secure(env) && (env->cp15.scr_el3 & SCR_SIF)) {
-- 
2.20.1

