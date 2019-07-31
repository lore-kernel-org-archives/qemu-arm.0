Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6071535wrv;
        Wed, 31 Jul 2019 13:38:50 -0700 (PDT)
X-Received: by 2002:a17:902:968d:: with SMTP id n13mr75055838plp.257.1564605530159;
        Wed, 31 Jul 2019 13:38:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564605530; cv=none;
        d=google.com; s=arc-20160816;
        b=blrxcWpHbdrO5pRB8JICsqOB/krpLkqv/9oFIyByrRERuVezWSTqjSMfTtQFKVUk9k
         a2iWDPrnEZX0eeBzhUvloWkuRqMPDTA7p8SGNPwM8Yxg3p8siyTL6XsYBz1iY3o+dd1t
         HM1rqwSaPUfbh/V3J+XknbNGeq7xzsB05XAch0HooK/yp3xcVOsPzMvZVv0n7d7kPw89
         +/HZUh1bvi25xZ/CitvNB4UlIz0KEyH8sqTnQ+DZFzo/sAqz+/O6txPkaWgd69phebZN
         2GaXt7LD0QUK+R8jacu0vGu179Rd4HXKF0LsIlU0lXs+YeU3yybL6IPN+KLBLAg/EBmK
         wWwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=Zz67J9BYvHkyirLYAvJnaBfIqywYlFR2wUnxCxYbY04=;
        b=iqhFGsOGk7EMasR2tY4RGUpCkQahuW0fyhSUxNBVqP+WJ4WMrkwPvFQTyeczd+CWk+
         WRNP+17EADw2Z5LrhBf2HolwEaZRskmg937suQK5gq7IoZ6SFPMINvZyBIbk4gorgCiL
         4rkL9amoI4zzouV8tp+m1iGdVQ4Yc8Y6UiYl8SV7RiRgDhXhPaVM0rw7tKGTIsK9Jz4w
         eif6LB88vbsA2liTdoYZ8pSAqbFVGPMyRyIZVodE6gGEehPKDvOZ2d67Rc0TUhV/riWI
         fcUNXH/yfmoc9Dm1rImIelb9HCUH0enIg7EIEidIvjdCPtHQAbIBXl7K2jxSBqok91h6
         hWpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L8+shBMp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 31sor46155996pgy.17.2019.07.31.13.38.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 Jul 2019 13:38:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L8+shBMp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Zz67J9BYvHkyirLYAvJnaBfIqywYlFR2wUnxCxYbY04=;
        b=L8+shBMp3yVjZG/WydqMY31Y7UzDlaO60sIBUkdhBOaavGxe1ryke/75AN8tUQrt9v
         oejc7f7waua8NcKbhXHZ6g0nvvGnCUUuuNqXSs+bYlAtZ87NWPmd3CvbFxcMHyHjOh8/
         w1HTio11uGuyiJ7Fab6Y08/LUfrVdhi3sQgm0LLvKPxXwC0orrnT5OOXEHKG4+dvucK8
         fZeW/HbIE0LXlKBOy66Ox9OArrCqptiUoox/3ND2VMjUX8sks7ALXweX8pUIf5Xtbu4t
         Vz/UIGAaoNrE6Dlfxyjpz4uA+Vp36EF9pOnliJFKHu5/DSGDD7ODk4ry7eQ0eUsb1PbP
         4tAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Zz67J9BYvHkyirLYAvJnaBfIqywYlFR2wUnxCxYbY04=;
        b=Hz7c7H7NykBIGskJT4b5ux8pdRoyOsQOKZrZcLUGdz5u+RLFrimvrw4kb2ucEJXaTN
         cYat1Di2DnBbujJhbGtir3f0beMrmDxcPWFsfzLcZcgGpqtQjwnL+wSfPQE+LKadZQjN
         mEKg2++YnRgYvnCnKj0BdssnRWKbsv1X7vW9MZvZMy2qcZmoSLnXb+v0A7zKCcZm8b7w
         IxqosCkCC0rnQEPunImYspHRKOGGNjMvOnZIB/HC6w9/fUuGSCDKzG6YMqd2phl5JpaY
         i9vuD641VKHsyKKb1fwOHeR1f9MCokMDtEXrd67rbiaLOAaoLDosyDidZQZ9hy7Pf/fx
         ZEsw==
X-Gm-Message-State: APjAAAWxlZYqx9G88hhGI2TpPr+0fcnP0aG8LbKb3mlhY+GuSPLv/ePZ
	5lKvqCiCRZP5WYNn1WCv8EtHQXpI
X-Google-Smtp-Source: APXvYqyO/bYu48vDK8KNFYcAnLNfhnN7o0hWF5s8xNobIlXNmRb10yEbsV6iQNHe2Y2xXzVtbw8XBg==
X-Received: by 2002:a63:10a:: with SMTP id 10mr31711947pgb.281.1564605529644;
        Wed, 31 Jul 2019 13:38:49 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id g4sm84054164pfo.93.2019.07.31.13.38.48
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 13:38:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 28/32] target/arm: Update regime_is_user for EL2&0
Date: Wed, 31 Jul 2019 13:38:09 -0700
Message-Id: <20190731203813.30765-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731203813.30765-1-richard.henderson@linaro.org>
References: <20190731203813.30765-1-richard.henderson@linaro.org>
X-TUID: bIPuwV6H14Ta

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c6b40a12b4..15a054a141 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8894,6 +8894,7 @@ static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
     case ARMMMUIdx_SE0:
+    case ARMMMUIdx_EL20_0:
     case ARMMMUIdx_Stage1_E0:
     case ARMMMUIdx_MUser:
     case ARMMMUIdx_MSUser:
-- 
2.17.1
