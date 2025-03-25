Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2397176njc;
        Mon, 24 Mar 2025 21:59:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW/11SLVFrtHOXyJSG+OIw9gk/aI5sRQJXutSAD9TTN30UjG4IOlaRmypt2uhNQJgLXNL3Xb6gz1M2ufA==@linaro.org
X-Received: by 2002:a17:90b:2f44:b0:2ff:58a4:9db5 with SMTP id 98e67ed59e1d1-303100219ecmr23549832a91.30.1742878788662;
        Mon, 24 Mar 2025 21:59:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742878788; cv=none;
        d=google.com; s=arc-20240605;
        b=SsgQ7E79XH1fqUF1lQoGXgaq5n443kg5y6BrqbYlVQNlYREuRj0iWsdgmnPKUENXsC
         Rlxpr4OEbSSYGEXFCCM469PkOH8uzD0Dg/WciULBrkoBKI/RUyJCJywNTF14YZg9P/gR
         HXe4QH8xssl8EyirejnCrtJIMUZyjtSN/J3x0Wrv97XW4ZBhxbTFgO0hDm90IJyRPNc8
         BPi67WjQH0iBSEywMCt+bd7R9VjoJvTxo2Bq5QnSq61XsNMOuzS0siC02KUklGcWuder
         IeSoh2wPkbxOr+9iMnw8+i9SR6+vVskbYBGo9bEG5By90gL0Z0lCBJHyW70p6yDYIppm
         QHYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7C1awJz84K192Xls/S9mWSPpF8Y3H6ZCzb0fk03waGc=;
        fh=kRGyoVZ6AkWo8d6XJTk5oAeAXSdsjByeMIj3chQKNRQ=;
        b=M3tfxQ8m+cE+WRzd+Ke8SbIo5Kaxse5o1dMw+XHiOnogkJRR5y9C1rE9zl9Y82ypDK
         CmDc2nNMWsb9VaRiF8BgNJMfdIJkE5hAj3F+lVOTsrDMaNLlDi4XjiusC5CZN9ix7XuH
         q1Ds/nkTWWY+l/2yFwV3tPF64mfKm+oSyxRW/rjPM4CqF0VykMwxb8dFLxC5o5kTGGAp
         MsIPJoYO5ptM8+oyUz0anEfJiugFJz/YbGw3Wo2lutfN1YKOU4mGrEKNCF9YV3hyQdTs
         5AB/CwqgC7AEuwW4m0rCh/GMhQ0a8wpXN8G4vSR8K3Li2GM2AhOGYD1x1Onh+/MQQU8f
         wbvQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JEo2gBFL;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-3030f796febsor8354272a91.5.2025.03.24.21.59.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 21:59:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JEo2gBFL;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742878788; x=1743483588; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7C1awJz84K192Xls/S9mWSPpF8Y3H6ZCzb0fk03waGc=;
        b=JEo2gBFLHn3/uDAq7khFsCa5iiX53BZOpsphtWYFzoB4JQRGUAOiqcJHseOBGpAU8A
         qsCpEJU8gOSdmcb+vHxSu3eG96UAQs6UVJ50sOxuVcz+DteajaXgbI7F9BLHeX+DPW09
         KCC7fOKo1T9BjeZrbNO6nYVD5aIApgPJJh6kTZ/mB2fZBYeQyEVGpieU7SLdyAZ0EUau
         48l4tTSIkEcujhPomy5ywndI72SqpCOeFfSWQBOyTea54N14G7E/pXID5eWhwUGPVWI/
         dv+8jzN4Q/gHQThig+axHKrBc3Yzp8XX2FME158kVEvb7W0NaoMYvnLKZf1w1z29pX9q
         7x/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742878788; x=1743483588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7C1awJz84K192Xls/S9mWSPpF8Y3H6ZCzb0fk03waGc=;
        b=L+XvCn9LgPbBwH6qe5Xi9Ks+G+EN4JbkNx4kOT9EjlCR8p33w56u48EIROsDIGKYaS
         PfHzTUujHWJKaU89Gjp8s6SDZ7j3WmfJI6hQXFSCQ5VmzUHibgBm8UIc67XG1onisjBG
         eKCdvCqD7VTnb+Cv1gv9saoKYTTnvXCjdjzjFgaVK3ji7TpHkEB8Rk0uRuXiHkaUbEJg
         9TNJEvecSleMHeSaNCoMqLTNpvVBvkAEWLEcsCTIuRxsQz7PG5CcIulVjahk648EMjLg
         lko6wot1gs2sWjrtb6PMkQYXgf0EI9rvOFHIlKaAzTuhNMLCUHFG3/G2Wb123etdIEPL
         +lOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyXci0NNPZD9AUe2+r/zw37vyIHEDhRrWYaJ9Md0jrF+S65hKOX1xBjqumTwAjIDmrNJON5wPvpvM27Q==@linaro.org
X-Gm-Message-State: AOJu0YzeZTueTyz8pFDjr52If15MzUAznewAr1JU09wJ8SjDfRwWoyxO
	4j2F2XaqiPDshPm8a0Q3eov2nuqg2sI6hlJMrKuhHdy966qrHXWffSrks7L7jCWktzh14agKwFI
	o/3k=
X-Gm-Gg: ASbGncsuB5CtT8tNTipRduy/CPx+m+pwwTcX4PNj0pDvUs+/PKPgg2yiWY+pUjjWiX+
	uz2kJyMHdzjqX2oJVaB3Vp/2IPHSgpCdh/RTKGCFtWaTNhrKNlM2o4USv8HnjRi8zr2gC3wFnW6
	053dUbz99nbVjPFSb12zplhLlZQeu3k3jCLE0Pf+ra/OZqD1cBrYa1tLHfIXNaj1pnvnLygzT0C
	hOOoPoNyVOUR0l2mekuxswWP9Ec3nV6bVpu1Ymf2YtcfRFyE2Q3Oc2rY+9Rke9G4jQH767TDArN
	0JCXbixEAbdWkzrzCtCWXq3hu66rcIYLhB+ypPzF91W1
X-Google-Smtp-Source: AGHT+IHSXNPp3Q2e8oDSf/SNPDReLESf+MJRHhmLcAh+DyIr5z05CoANzbsKkecUcyVNZ39qvJN20w==
X-Received: by 2002:a17:90b:2cc6:b0:2fe:a79e:f56f with SMTP id 98e67ed59e1d1-3030fe9e9c3mr24748768a91.13.1742878788216;
        Mon, 24 Mar 2025 21:59:48 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58b413sm14595120a91.13.2025.03.24.21.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 21:59:47 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 28/29] hw/arm/xlnx-versal: prepare compilation unit to be common
Date: Mon, 24 Mar 2025 21:59:13 -0700
Message-Id: <20250325045915.994760-29-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: in26FYkEfj1v

Remove kvm unused headers.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/arm/xlnx-versal.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index 278545a3f7b..f0b383b29ee 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -17,9 +17,7 @@
 #include "hw/sysbus.h"
 #include "net/net.h"
 #include "system/system.h"
-#include "system/kvm.h"
 #include "hw/arm/boot.h"
-#include "kvm_arm.h"
 #include "hw/misc/unimp.h"
 #include "hw/arm/xlnx-versal.h"
 #include "qemu/log.h"
-- 
2.39.5
