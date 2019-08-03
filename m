Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2200902wrv;
        Sat, 3 Aug 2019 11:48:10 -0700 (PDT)
X-Received: by 2002:a63:2b8e:: with SMTP id r136mr95988946pgr.216.1564858090400;
        Sat, 03 Aug 2019 11:48:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564858090; cv=none;
        d=google.com; s=arc-20160816;
        b=OlqyZ2E+r/HwrbyH6EoCBmyyT2h1Jfrcp9B/sgbz8n7xEruGqsYNiXN/h3kH8CxEol
         MNd1IrrEoNPSRjQM+U7lUD5GGgiRAANR0Iqq2eok0hk4jFo4Fh6ZksQvD335r23bpmo8
         6kxp65e1lCaqXrjhd0xmzwVCfh2g9ZJwML2czSbwKvSj9BBhyRCaqV8+MbAYFfve/Fy3
         DYTZ93g+dt70jpy0bdnwZ2psAA/CUvBIPWkGAxazutJDDdhb8WwE0Mnc2LVq3kmfqQLS
         3eoA901XQqIhm3JuycU4k5QtCdRux1MYwxhFLuA1mKrTC4j9Dgs6BQvkCPRjepZ95WxM
         Q0sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6IeFtwkeZbBPVLT5Rmllb3ExAsBhlKcdIq9EZhAeEOQ=;
        b=YkgHd5jGw+pNlIWwNtcZqPn/9Jxs/+mtgKzaycaeexT1+Z5lRlcjw5gHpX2/3bLvQc
         PChzTztBXEAPgQ2RTLYrLimSbjXsbC36tYEeNzvxZUssEfGiFFc4FYTdGyYHNQMfRUZR
         HItVJQHW/W4yZc7DNOYsJ5qDDgYw32ri4u64QO3ANM8QmJUaj0im8EDL/snYLxSGEN2d
         BDUpdnP5CffNAMvQqAkpYksIcWJYhRSsTlrdx/SdWe/xpoFN1yGNwF8/mP3TqdIlQq2Q
         /sFVTGYaOAQCPDAjFopNztgvIoaNiPcW7FdkUn+JfPWdt7B4hzAuLXiYomjcy/s2Ul20
         v24Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EsBd2ZXy;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s126sor60882720pfs.37.2019.08.03.11.48.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 11:48:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EsBd2ZXy;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6IeFtwkeZbBPVLT5Rmllb3ExAsBhlKcdIq9EZhAeEOQ=;
        b=EsBd2ZXyAs12YJkUflSxdyWDy4dQ1VA7S1sjPBpz/feC0S7PjxPutW98hpXE48BQqZ
         duze6YgLkmYtrK/9qzMMjqatC1CnyovW9Detsfq/azWI7VgxbyYirVQXMBjlehgbmcJY
         HfD0KpZXBfFvIAEmRtEXUO08hR5q6CKDMYULvli7jPWnoV3G828NSM8kGVuPxfXO3OPh
         PJhqZ3T4pSzJaVcrVBP52obs3ZUOSQESU5L4W+37vtXyru47NuaJCbF5BVYq754WLFDi
         d5+Lr6uoqePJXIa+64fy6wIuJIy/7nc3ggwjX93XLCoF3qE/rU07bekJKepVfBI8MAtS
         7KTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6IeFtwkeZbBPVLT5Rmllb3ExAsBhlKcdIq9EZhAeEOQ=;
        b=HCJJ1GdHHLk2vCZyeeIMGHzCbWQa6Q1uGJmfIk+g+5uW/iqVd3MvyFjFkxjTZpMVMM
         wibvVrCf+Dr1z7ebyadb5ZsLMJT0joMHx3Dlg2zdrQftU/VsoGS/XyRanR2zCPj26fUd
         cv62FHKkYft6uG3StIit2Fi3fs6dQhxgM3bZqEEGAEK4jrifDVpkGFLgMAzjopi29lz1
         75Vvd/mYbmYzciQRzJiBi0+4kQAY4W3QH/0KSvvtLBmTCTIR3XDOdElqHa/gKQU6tjwR
         motwIhIJcJ89V6RqJUWjUJu7LfS9U+oHlMYT+XiAfT50nLA1mFTx5ugKfmuqsVYFCrEI
         CBtg==
X-Gm-Message-State: APjAAAX+rNlakLOF7LnAp5MUxj0npqBUDGBmXk1Bexoccj+uPIDXqIPC
	mXZ07T5G7fV/+tOqfEuL+gIsM9YnyClARg==
X-Google-Smtp-Source: APXvYqwXV2QxS3KeOZOgNnPklX8LG4SYpVuUQA9Dsz7tKOaKwVfMkcm0N83J0qPGGm/xg3pem1KQTg==
X-Received: by 2002:a62:28b:: with SMTP id 133mr65294339pfc.251.1564858090005;
        Sat, 03 Aug 2019 11:48:10 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.08
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 11:48:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 06/34] target/arm: Define isar_feature_aa64_vh
Date: Sat,  3 Aug 2019 11:47:32 -0700
Message-Id: <20190803184800.8221-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: S/hxci0k7CjE

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 94c990cddb..e6a76d14c6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3573,6 +3573,11 @@ static inline bool isar_feature_aa64_sve(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SVE) != 0;
 }
 
+static inline bool isar_feature_aa64_vh(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, VH) != 0;
+}
+
 static inline bool isar_feature_aa64_lor(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, LO) != 0;
-- 
2.17.1
