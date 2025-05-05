Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178794njj;
        Sun, 4 May 2025 18:52:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXRnf4Yt8qlWWdkxRUoV+yzckmHr8+QKgyGT0Y5M7mNmp1rpEGWWPqNjTuwuyNYF8PRqoUnaJVSG2BlFg==@linaro.org
X-Received: by 2002:a05:6a20:549c:b0:1f5:a577:dd10 with SMTP id adf61e73a8af0-20e078fdc9fmr12217276637.36.1746409964803;
        Sun, 04 May 2025 18:52:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409964; cv=none;
        d=google.com; s=arc-20240605;
        b=KfTc6Ubdiov/ln69ENWRpxdZfh05wV5ZkltxO0Ag8VPEo2n9CUulsMTNgIt/Kd9WB/
         KeWhIsOrvCx7P9jVsx5anBshIGJ1iouxmI3Cro8GP8NLaR+/trPtDJiuc0dBnwZcXV6y
         7SyDRviGozml1kWoZFNa7K7jyZWrulZVYWmQzn0PeTMC1o75a4EYcrAwuk5R4qGDZjcu
         ZaIHYFEz2GAjYkUxScrDh0RgvBQs1mQ1HKM8d00aYthPButUBVsaLvh6E6jdrlpcKqeE
         qo0zO9yigoT2SeAwjPJGfBemJymhZNKkpc34r/+1Ro/KsUgUKrTVnylaGRtrPyLt4Vx2
         5btA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=92Ra51BscJ7plqFLljDp4Imt4ck5QTPqHgH4Y/GteZ4=;
        fh=qR8uLNtUJL81yIiKWm6Va4kwKpNrkWKHltT8+PJ4YAg=;
        b=ETTjK3Yh3rL7bvb+VFNY3YK58t8CZtv04ZS32+7YKAunFeFLyVF5Wz2wHxvKEJp1IP
         kJJcJEMItIYmXAVW0RgAum7M+vFwA2Onn4Waapwh0YAD1LeDLIgn5XlJlHC1n1d8mHyE
         RgyTmk1obmRfc1O/yQad7SEPvS4Kq+ii1AGzuQsomntpssW2Z0KG3eICaV6jHXE/O+Bv
         yyfsF2FVU7BBP2KCmxJ3BTALDVQExOst5aV62250gburiHzvM0VZqhpybvzu1hnC5lbr
         VbeeIMEjhG6HoXeyYETvk5NFy2FzDSKQFNLV4o2WE/Nkpf3tTBuLEss9AofV2Msbd9r6
         Vm3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i8+aMFit;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b1f9d642d01sor4931901a12.8.2025.05.04.18.52.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i8+aMFit;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409964; x=1747014764; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=92Ra51BscJ7plqFLljDp4Imt4ck5QTPqHgH4Y/GteZ4=;
        b=i8+aMFitUTh16v6v1DvMee5xj+irch5YiMB+XyN+sUjNOrOrzP/H/HpdyDDX9uPE2F
         ahNDuSVo0CkmO1HceSC+joDofnpqMlePKmuYgHjp8oS47cK8Pd6N5WC/V6khfCnnIQWp
         9To5dSHCmyVoLATT0Qhkn0fEhRgsujiKUE6YF9Ny6PrRwATYYxt5TAt2mqYT+KnHSYSh
         t6btaNBD4jd/SI3zjQ8YjETI8hZe+2JlliEpflI+xB9n9PANhwqYULPozl5+jGjK2shl
         kJXqYVXLTFdPAXSjsKF5eGK0xXCNCbyaRXU0dVPa9UUPkwDH5hotO/zfpVHEAwMYnjNq
         VWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409964; x=1747014764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=92Ra51BscJ7plqFLljDp4Imt4ck5QTPqHgH4Y/GteZ4=;
        b=HnSRSa4m6My9yv2jhJkoBeL+FJsxfwknZ3KFbRx267bKIV1kxTPoTQotiEZ3MWQZEr
         MxzQtZwzQje1y7ti6miYGVH1Q24a7lfnWilYC9RY7Zj18zK/Nv9gNiHE9BwkqlUn4U3H
         geU3KnA44p78dYDuk8wVEiSMbdYyhF5BIisoWtulHRHjw+masIcXpZaIfV5qXrVg7UgD
         D1kyd+GIqgIDOwXAK2pWaIkcZ2AFBbMGW7XuIY3RgldQlyooBq4ph/Pc4ByXOb3I0SU3
         iUGMV2rhi8kOogcXXm6vYNqJtw1IPgIRpN25mr+ERtQ/8MCs+aqlpaZICa00ty64H3N7
         EUtw==
X-Forwarded-Encrypted: i=1; AJvYcCXe/ulSNqyPeviRqwOij/LNzwx1Y+klI1K2PPITMd5jcn0OHeaOVDl+1J5V9dBJn/m/mGnI1sDC+8z7sQ==@linaro.org
X-Gm-Message-State: AOJu0YwIvheVLRKROcTZ5TmSGxE3c7z2C64hSnckEzVfFR6pRG/+1wyg
	atbEPKFG2rSycHqBdi0KpWlE6g4//HAdmDOc9SGmDz1WpPmzCqrLxRZKj5uEpQ0bpw==
X-Gm-Gg: ASbGnctBcu2ofw+wxnLaA57QIaO7Wh+mS0kI7bdz9wnE2HbbUV8irEoF5cWwEkRLT27
	vcxE1OP4J8UpWtF0HNld+/dC4wjbKlS0fPXBWyMFfvcomgQIkP+RRV+T+CiREdDcP28PoyOSBQ0
	5dIkweZMaEOPsRFTrWBbra8BR8V6JLVsx0tLOLeI58T4PLYn2pd5dou4DJTfCkU8Vu6Mbp5BJUV
	yDz2EJ87fYdHY+HvuHrAR337SdWdpqRt+pLRUSBCMrD0H9DEcxc6lvyxK46qKos8amed1Z15iqu
	Go3Raq1o+dyBMlldOdBVcb+bkwGsLzNslOJwYZmN
X-Google-Smtp-Source: AGHT+IE9j2o3T7kEuRYqkKUfbrNoqBKSp9dkYQiKXtC9/BPBj/wfPB0ZC7uXMkUBNXaP91CXX8quKA==
X-Received: by 2002:a05:6a21:8dca:b0:1f5:87dc:a315 with SMTP id adf61e73a8af0-20e06436846mr10046422637.12.1746409964452;
        Sun, 04 May 2025 18:52:44 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:44 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 18/48] target/arm/debug_helper: only include common helpers
Date: Sun,  4 May 2025 18:51:53 -0700
Message-ID: <20250505015223.3895275-19-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: OK9Q5VrYEses

Avoid pulling helper.h which contains TARGET_AARCH64.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/debug_helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 473ee2af38e..357bc2141ae 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -12,10 +12,12 @@
 #include "cpu-features.h"
 #include "cpregs.h"
 #include "exec/exec-all.h"
-#include "exec/helper-proto.h"
 #include "exec/watchpoint.h"
 #include "system/tcg.h"
 
+#define HELPER_H "tcg/helper.h"
+#include "exec/helper-proto.h.inc"
+
 #ifdef CONFIG_TCG
 /* Return the Exception Level targeted by debug exceptions. */
 static int arm_debug_target_el(CPUARMState *env)
-- 
2.47.2
