Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp1004536njm;
        Wed, 30 Apr 2025 07:58:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWyI49gR+F4cvdZEg75gAKSJr32WyVgJwFXzuPt7WG4NN2e1K9RKx2NlJ99Z7jht/diYeEgD2YZw+CtSA==@linaro.org
X-Received: by 2002:a17:903:3bc7:b0:22d:b240:34c9 with SMTP id d9443c01a7336-22df585ef05mr48983445ad.53.1746025132964;
        Wed, 30 Apr 2025 07:58:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746025132; cv=none;
        d=google.com; s=arc-20240605;
        b=UuSQWPbywxI48TJ5w1uT4kHn+hzLFqWfyUSN3Al0A+BAw27t0g5OS3xgpQPOdeB7rI
         pFMnlY8k5AhjjHlWXwc7hdkGQkx2CtBBkM+aaEskzxpRHFW6N5Pcr/XjK6aMlRnOBIFX
         jHBV8valOtY1tY+OYAY26+RV3Z2kI1kXGqNFBMT2ZGU6s8cD9jJKSKrAmMxmYsg84JBf
         8nSE7xSSjDv45elEu0eO9heHJdJrV8wSV8bRiHW97+o/sWSIBZm9c/zUWWD69bPmIgzl
         Yx/4kUHnB8LV8PzII39GU4k1OUXFGigox7+KnEv83xsjAHuSHCTgsMLX3JbWjrMHDsnH
         9qJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fGiNi7KD9gyOgMyKCivUKJWXpCWPNSCcBCjqGbD2GJ8=;
        fh=+Qk3HTf+bTNMM3djcewTGe3aWTQlfBHmPqYt/soplpE=;
        b=Hrfv8g6fMscVAQthB1Sva28al+QHU9UUciAM+IKoU1kA9U6ad7VoEwgu8CYll5iizs
         k9kqFOW91LjFPoA8TCN5bH0dfNvwGhmRyn9KnjsjjIZkMspvE+z0qnUQLOHkbOR0CBnF
         +h1SSLULd8cUqgOd8DUW5zcTnXN7HQ370vFSMedSFQDL4snFyXU8kMc/+Ql5dpJKTFP+
         Kh1B+E6xQdLAZPABBPzlWgw2MZhpnUx2DUiMiz3+KpVS5RdFLhjTyIOLWaVsDylL9inj
         MpTqNmVc5tLUK/NEallvpaSlXc7mLRZpOd8TDvoA2ytkFW0CbNbzNg3Bf0CL7FxigD/v
         bNHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PFxr69NZ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db50f91ebsor92192585ad.13.2025.04.30.07.58.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 07:58:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PFxr69NZ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746025132; x=1746629932; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGiNi7KD9gyOgMyKCivUKJWXpCWPNSCcBCjqGbD2GJ8=;
        b=PFxr69NZ7RWwNUWVmXQxdfi4rO4U5SAs//jRXv2ffp9JCk1mDUxLH2yMzKk20ky+2B
         ISpHFHnX+/hm0yqYPzfWgl7HfzllIflJF1ZvedCuoyn5LE49ZFoqIGpI/llRAZT06hQj
         ywCQWTrD0JfnfAFMbH3VJX11/uo+ze8cmmGSf2fDBXG78WViiwya5ITwQ6e1JQAYnQvA
         EPl1m0B9JKBG1ExUPpsXP0pqvnbwvvINF3bq3MhGGoJvo99dYMx0eiqY66lHjyCAC5n4
         yJ685Ng1wVHsyCtHNP/XbXLM4OWeS0guEswPt5/uNczDVwYXWXwqXqso2DtqcnH2vswy
         sIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746025132; x=1746629932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGiNi7KD9gyOgMyKCivUKJWXpCWPNSCcBCjqGbD2GJ8=;
        b=b1Xa/MTu49Phm8yMPoeveFFc7/FDBtImGDN7XKBAblBJNZfE3TWhGR1n766x6yWt9o
         hBDIRLgk33vSrF5/hlfGPRgxmsVIZjiuEQHy8xTJCLJPAaZaRghUDienzWGwwt2N29/H
         gaffMilzmVBiY/Hy0IFWg90+MFYhTlapVZaTid0yGHsybgNjyFzUaZNdLCh/T3zX385V
         KY7hAJaCcgnM5OoRx15I6yBluKcKD9GJDyzM34fPuFcOvzfm1hJXRDuxw4zzopb6h+JK
         JcuGJU0n+j2t3b/SSPofqfnrgHX2rMF7oyJgeBg4KGlHpSF7pdVUSvECz6OdynP7GH/G
         iRTg==
X-Forwarded-Encrypted: i=1; AJvYcCVMJNboN1PmeJncaxBIhP4T149J8FjlJC/v5qw+hJva45PwUo6lt9KF3mA/IaQxXcpfkMNs3j+YvgJs8Q==@linaro.org
X-Gm-Message-State: AOJu0YyRJ0kQkGCj8C+uvSLCbzdpl4wA2daOcWDfE9DN62KUO1t5bStp
	fvVtwlKkshIkLCXoo5o7br7O4GTIBJ0AFxSYJ/BvzjG1Pn7Mk0MM0RuzpZpGwu/QhQ==
X-Gm-Gg: ASbGncvC5umos4NygfgFUtZF3fK3pp7H9mFRALYMoeYhZin4VjOt+wIcUWPXductnaD
	sbtvgPHkzIGKOqKYyRdhzV4DhUpOL6MeWK+ztLMVg5nU4Erj11lmyiROUrGK9VDmRlA9bapYcmz
	iQTGiuKzOEnPSiUh6Cd3QSF8lW8ZsG8a6C9NG4a6wMunnVZvgOhFo51xcG1vBHT2xmnIERw7N34
	Cb+FPyfrRwe0rE5yYI9NlEnmeOPq3qh/3Gqo0yJnHuOd21U6UxmQruGzFPTgN3fu55IfceOAUuo
	Xfv+HF8lRYaVZsapAq6sApVlVbKWR6HH2yeYO1jU
X-Google-Smtp-Source: AGHT+IH+BLmMRNO1d2Il9lIsPzqV/zNMQYpfuEcaTVrwEpMBAGNrwX24xYIWCRPNN9NX2WqOLluU4w==
X-Received: by 2002:a17:90b:514c:b0:309:fffd:c15a with SMTP id 98e67ed59e1d1-30a343ecc28mr4110023a91.13.1746025132462;
        Wed, 30 Apr 2025 07:58:52 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a5bd78sm1705652a91.42.2025.04.30.07.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 07:58:52 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	richard.henderson@linaro.org,
	anjo@rev.ng,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 02/12] include/system/hvf: missing vaddr include
Date: Wed, 30 Apr 2025 07:58:27 -0700
Message-ID: <20250430145838.1790471-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
References: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Hoox/81SJXzV

On MacOS x86_64:
In file included from ../target/i386/hvf/x86_task.c:13:
/Users/runner/work/qemu/qemu/include/system/hvf.h:42:5: error: unknown type name 'vaddr'
    vaddr pc;
    ^
/Users/runner/work/qemu/qemu/include/system/hvf.h:43:5: error: unknown type name 'vaddr'
    vaddr saved_insn;
    ^
/Users/runner/work/qemu/qemu/include/system/hvf.h:45:5: error: type name requires a specifier or qualifier
    QTAILQ_ENTRY(hvf_sw_breakpoint) entry;
    ^
/Users/runner/work/qemu/qemu/include/system/hvf.h:45:18: error: a parameter list without types is only allowed in a function definition
    QTAILQ_ENTRY(hvf_sw_breakpoint) entry;
                 ^
/Users/runner/work/qemu/qemu/include/system/hvf.h:45:36: error: expected ';' at end of declaration list
    QTAILQ_ENTRY(hvf_sw_breakpoint) entry;

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/system/hvf.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/system/hvf.h b/include/system/hvf.h
index 730f927f034..356fced63e3 100644
--- a/include/system/hvf.h
+++ b/include/system/hvf.h
@@ -15,6 +15,7 @@
 
 #include "qemu/accel.h"
 #include "qom/object.h"
+#include "exec/vaddr.h"
 
 #ifdef COMPILING_PER_TARGET
 #include "cpu.h"
-- 
2.47.2
