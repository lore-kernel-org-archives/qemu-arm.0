Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2201173wrv;
        Sat, 3 Aug 2019 11:48:39 -0700 (PDT)
X-Received: by 2002:a63:e70f:: with SMTP id b15mr130128218pgi.152.1564858118827;
        Sat, 03 Aug 2019 11:48:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564858118; cv=none;
        d=google.com; s=arc-20160816;
        b=XQzteb6T6DyL2GIhbjdkqU7fbhFeIz279XWmyTb0ws/N/zHXZ0bzhx0dGlus3HngWJ
         OcavFmEHavETA9K/xKvwyH5Nd7hwlaPRm3thmQpqCjmfZPzwTkLxQ2zDZLo+pIAJI41c
         mrq5iH7GW3KpElTFRN6kg7zgQVZfHzLTtCyUvwTVIj1LQsnIW/TUbXSznvnGC85nTGm0
         TWbJgCkVdv1Q5XEHgAH6E+o2LfaZoDcRLOjMJKr56j9Qgu7+SPP4y91yRmfUJ7VdXVcK
         F1wxl1Xm6gn4h4ql0MNyWi0uXRh9ZwMNcg+6V3MqO2mBm8FS92cEOUEhsGR8l+MDFwaR
         A3GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=x75zfy++4h7G7+9uJPGHwt0vV9wve8SgXFTPLCjlkks=;
        b=UgYVhmmcj97pSkfNmvf3ThIi2dR6vnbVkae9AqcbCxFGxmZyDPMr0HDfG8Au5WtHsw
         ZAwrVROZ38tUKMnIgCa1Korm13JFLUif7XAKUxEpaOZ/1Pyb/3C5KG9m31cM9LQDmCiN
         3sZPJNe2vKpe6tbHKxDM3eM3z+ybrc0iDLk4n3rPAzSmOWXxteUSI42Yd4RslpRlma4V
         n98kBn7jVPD9ADV+ZgBI/NkJnxKO6s71GfFTVKYVlcs/FGMr1jdVcN2bGmj+POQlSvCh
         WblUN9lZmTNOsxi/h7SJkq5nSbXyIr1FbMwuiwuiABF9Jz/3sJCwbRH0xCuzU92Z6lu5
         gspQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vSbLBug1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d1sor14729106pju.23.2019.08.03.11.48.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 11:48:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vSbLBug1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=x75zfy++4h7G7+9uJPGHwt0vV9wve8SgXFTPLCjlkks=;
        b=vSbLBug1LuIdmY3e05odA6DONIHNQKBNmeojBFBcQFRAAln5HmcZSfiO3bZML0gPB5
         o8uOagH6fGlOmk8pB3PnoKl7zwdN7KJ1daKWWnv7qLvZ2hpKzvFkKkhywpFiGYe4Pgc4
         H+7HCtNZ41yARIYpZ3zOhQ040U7hPn1sQ7zwAplnf+MjdUdL6jt5VYhNGQuY9GE4yg+0
         3EQg3ZZYJOKjWUJrtrzD2X3w9kldGktifhfDyKwll+jqOD8QSgGsBIkTATiSDCtG9URd
         S4Hg6G47XIilxW10LxvEJvPMtcjlVL8kqZebme30vgQxacppg4ev4lKoDVYHeGPAXsSt
         hrAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=x75zfy++4h7G7+9uJPGHwt0vV9wve8SgXFTPLCjlkks=;
        b=cORROESUaiWzHAzLYi5sgOjyTAyG1x8a7bePtXwkAZutpRRvSEl6otgMBYZOcgoT34
         cg3cnpKOEciqSG0ynGAc+0YL6lnq554gm/C6MKvu135PlBTChEZmT7kYFEmKjCDP+qcN
         7NLTz+PoXIh+2rv7jMS2N+VOxEMWDhaSMZIaotCEiJ0KxzQkn2q6gfUoSDO9y3tzWVpf
         vut4P+FpH5GmbPoiVckG2xTU9HcYA9NE4oYx0Z8sNMyuStxATYFPvHis5lXCr7wm5U2b
         xqDAKZ/3W3emDcuiOcLreQohNk4E4EV7TPKgYMpLPXAddNZtQ27vFsKvp/hZa5GynWSV
         rMug==
X-Gm-Message-State: APjAAAW1tQx8P5dYNMRKwH7LsdF9HpiLgmX2le95ornKFkOYhvVOtAeg
	S+ANfFDhKSidsZu7Bwa5QTjgCbe5
X-Google-Smtp-Source: APXvYqxZ2T2wVdpWFl09fwK3nMJTtfcpGyVFU53yW1XfeyIu/WHv9qxSV4TyuvQAJYewR7ay0JP8zA==
X-Received: by 2002:a17:90a:24ac:: with SMTP id i41mr10331984pje.124.1564858118408;
        Sat, 03 Aug 2019 11:48:38 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 11:48:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 30/34] target/arm: Update regime_is_user for EL2&0
Date: Sat,  3 Aug 2019 11:47:56 -0700
Message-Id: <20190803184800.8221-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
X-TUID: +9kvw4EBHIRt

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a0969b78bf..d481716b97 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8936,6 +8936,7 @@ static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
     case ARMMMUIdx_SE0:
+    case ARMMMUIdx_EL20_0:
     case ARMMMUIdx_Stage1_E0:
     case ARMMMUIdx_MUser:
     case ARMMMUIdx_MSUser:
-- 
2.17.1
