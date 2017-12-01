Received: by 10.223.159.82 with SMTP id f18csp1519305wrg;
        Fri, 1 Dec 2017 10:44:47 -0800 (PST)
X-Google-Smtp-Source: AGs4zMY4iNul+uMgeApb7N8jEjr6zSqmejbEZgjlPyuvmDLFEjUC62qTYOPYyiS1bNHfJYZOiFm+
X-Received: by 10.84.241.5 with SMTP id a5mr7213374pll.128.1512153887096;
        Fri, 01 Dec 2017 10:44:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512153887; cv=none;
        d=google.com; s=arc-20160816;
        b=nglWSr+CSRXBRks3fUVP+NZnKgo8m0hQJiFruFw1fnDMpaaODpm4ZFal3AeVldINk7
         itJmZYYMw7Lws2cMbL2GCMgD2Rybc4jAjvqN0M2+nSxchOUG2O+55xk+FnDLByRxKnrc
         BItxbxMfqs6qGmQf4JI6ghQ8X3nF2zUir5xhUDpahK/mdhKfdgGIG2LUA33YgqGOg4VK
         nvrrXbio6aOSHsW5xKGvQRrN8R7ScOUzzmOcQ43i6SGvFkRE0nIiFjGnYaqiHTeGB1LY
         wDuPvDNZSybL0OtFGsbBI3kIMcGd0fkvuc1jnSgNJF0ZuKOBC23i9wbLXxBsWxxToX/u
         Ey9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=dqP939oHVpnwLtXL6dxvZecUzoHlk8z0CYTlXVAX1K8=;
        b=Mpwmf4gUFQ60UqcSGCr2vbQyljYei4lxqcu4JJiZ2JGzCGeqr4I4cdaN+d5Uqk+hJC
         IFDIANi6FS0IIAqqURaQMybjOJx3zjS60Z8aMXdV7nsGsS2s/+uAhPnBDnCcQT4Cpj3B
         F/+2E/tT0dVbkmZOvZ46hCiDQGkie3RaqAZucdXp+fwlIk5tAb48/IfVG8LSi42XLx+n
         i/E6RORZqhC84hjChtpleQYrFyJatKClEBNxUQfWSnV/ixnyu2Qm9ATXn+b0B1g1zeMp
         FXhFsJUmCeYMqcn2S6SQz3efTo84cdNqH55evGuLiRxfBGhWl3iitfgGj/6jet9JIVv3
         Wdhg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id d92si5311427pld.367.2017.12.01.10.44.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Dec 2017 10:44:46 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eKqIk-00077F-BS; Fri, 01 Dec 2017 18:44:42 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 3/7] target/arm: Add missing M profile case to regime_is_user()
Date: Fri,  1 Dec 2017 18:44:35 +0000
Message-Id: <1512153879-5291-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512153879-5291-1-git-send-email-peter.maydell@linaro.org>
References: <1512153879-5291-1-git-send-email-peter.maydell@linaro.org>
X-TUID: M1U22RtiSN3+

When we added the ARMMMUIdx_MSUser MMU index we forgot to
add it to the case statement in regime_is_user(), so we
weren't treating it as unprivileged when doing MPU lookups.
Correct the omission.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f21c142..c4c8d5a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8016,6 +8016,7 @@ static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
     case ARMMMUIdx_S1SE0:
     case ARMMMUIdx_S1NSE0:
     case ARMMMUIdx_MUser:
+    case ARMMMUIdx_MSUser:
         return true;
     default:
         return false;
-- 
2.7.4
