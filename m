Received: by 10.223.159.82 with SMTP id f18csp1519227wrg;
        Fri, 1 Dec 2017 10:44:42 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZCuvsoWqNA91dakdf4eRMSsHp19HNVmk22+BDYPiE9DnuozNYqenbKPDaRqCca8EBkXAqA
X-Received: by 10.223.164.20 with SMTP id d20mr6180977wra.103.1512153882675;
        Fri, 01 Dec 2017 10:44:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512153882; cv=none;
        d=google.com; s=arc-20160816;
        b=COXQWAjc6SfHB5B/0jnuESdOuLAoAlo5ZWhIXcIEoekI3bOL+W+RNIjUtV2Qz/DUtx
         K2FLy7/uape6XYjcZ/11FfD68/9sgYeBlr/iAQic0f6TkwDme71ViW4BkwaXzRD4pVom
         4U2yKy9kQNgQxBjS0zc+KlWG4ANmDlStBU4Z0MyuueOLynQAvsYPtZoj0VKqVc/rOOWv
         hRCCcVew83pqzC0kDWNrKYHfrOiZqHgzCOfcvYR4Cg0tbypiAehXRYUBJUauPwIaSzkx
         D9NtxWbtB3qk+2t/gXdJZ1V8YWJqm4sXhkdbVD3P4DsL56lBYvJj6jUY9/xnJOK8M49l
         NJRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=ZiyKz2tijnHXQYw4L1uI76Yy8JLdizlnzYMoKMCAOEI=;
        b=RQ3pBdUTihssOempHb/tNBnTT6AaaKdimvk58gEDxbb53gYIkfoheJxYrdfJB4LjcH
         jpWoaSQj+T9jd2sFVwdiUCcagp81F/G3qrB1ICZh7vecTUjEsuKZ3kr4FvNXKQ2u6nKu
         MfOFHSihiIklNHplJ3mQ3kHUSqeNzyzGDLDM9sfA8EF8KCPPmkPyS/U9KUTf88e1LGbX
         cj2cm9xhld1KKU6yes8ulieVn3MFJHk62/KXi+a+FypU0vtMVrFbO5ehXJa26OaUf/Pu
         UJuiIi8QCgbI3jZReyhFpjGN/ZrEghu4L5Ja1i5FMDghLPcz6KX+2b/2fSTL+A+KkriU
         WlcA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id 7si5441157wra.41.2017.12.01.10.44.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Dec 2017 10:44:42 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eKqIj-000772-ML; Fri, 01 Dec 2017 18:44:41 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 2/7] target/arm: Allow explicit writes to CONTROL.SPSEL in Handler mode
Date: Fri,  1 Dec 2017 18:44:34 +0000
Message-Id: <1512153879-5291-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512153879-5291-1-git-send-email-peter.maydell@linaro.org>
References: <1512153879-5291-1-git-send-email-peter.maydell@linaro.org>
X-TUID: uPiTNlAzCIua

In ARMv7M the CPU ignores explicit writes to CONTROL.SPSEL
in Handler mode. In v8M the behaviour is slightly different:
writes to the bit are permitted but will have no effect.

We've already done the hard work to handle the value in
CONTROL.SPSEL being out of sync with what stack pointer is
actually in use, so all we need to do to fix this last loose
end is to update the condition we use to guard whether we
call write_v7m_control_spsel() on the register write.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 88394d4..f21c142 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10091,8 +10091,11 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
          * thread mode; other bits can be updated by any privileged code.
          * write_v7m_control_spsel() deals with updating the SPSEL bit in
          * env->v7m.control, so we only need update the others.
+         * For v7M, we must just ignore explicit writes to SPSEL in handler
+         * mode; for v8M the write is permitted but will have no effect.
          */
-        if (!arm_v7m_is_handler_mode(env)) {
+        if (arm_feature(env, ARM_FEATURE_V8) ||
+            !arm_v7m_is_handler_mode(env)) {
             write_v7m_control_spsel(env, (val & R_V7M_CONTROL_SPSEL_MASK) != 0);
         }
         env->v7m.control[env->v7m.secure] &= ~R_V7M_CONTROL_NPRIV_MASK;
-- 
2.7.4
