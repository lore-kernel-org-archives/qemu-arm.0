Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1780989lfa;
        Fri, 16 Oct 2020 11:42:18 -0700 (PDT)
X-Received: by 2002:a63:4c6:: with SMTP id 189mr4284155pge.233.1602873737836;
        Fri, 16 Oct 2020 11:42:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602873737; cv=none;
        d=google.com; s=arc-20160816;
        b=KEDwT7cQjsiPUuH8wTj/359CMgm5cs/0221CiWdDzvNCbBPREQLye9MQqDFkEpCQHu
         Ry/MtH2YvraxJ2lMI2zYwkw6yYvYasTp1C1Wq7vmli5uKflLwnWJczjjAMpFzvLJ4xWc
         O58UK9NtOKwaakhoTsinXxLLDd6q4DyyU459IeJZ/EOoviy6wZVOkBKFWXxM8Gw9+8GN
         f13IdjF4rIvHO1enE9BMmei+CzO1UzWGnX3hLbh8vfkt6iiZZSmezK4ONUb5fwljJyQS
         6K8hdRdpOmhC2ogGdAo1PCt9jafmHgNn6wagmMqjP4AB3KFDWJh5OJgTccpMDBGujW1+
         PT+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/PhyfxonOHMia69Uhhz8aFrAtnkrEZKYG1wmZQKttSI=;
        b=XWmhcnTXHCJzxq4ASw5uRSVUbCQeXaoP6GjYjlp9GDPWQB14pUE4aK3YirDMVxFHOe
         XLaIeHPGj3vwO4xSwzOw+bs5FUYrGIrgrI6uKyT879cuBGRWE/nulc8NN1Bv/Wq5OR1r
         nKsc8r3to8w3lzGqgfTPzqMpjaIvWCETdkPo5WkqMcLVIipbYekV5TgQE4Cl2xQs7CEq
         kgp1ThwkEAAyla8ZXUw5CoNiWCcSASB5g8gaGbtX5xPsrESdwG640hPa7UAzP/rHI/VX
         8MME3Ikgoh3iybpJjdnxuyME3z1/Pq2E7DVdsI/GSsGLONFDpULil2KMbqk4OD1tOMV5
         2/Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sNLIoDgx;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l16sor1631535pfc.75.2020.10.16.11.42.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Oct 2020 11:42:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sNLIoDgx;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/PhyfxonOHMia69Uhhz8aFrAtnkrEZKYG1wmZQKttSI=;
        b=sNLIoDgxTpluHbWkpp0asVN19lAwCAgynZMkI8ZMUh8GMo6c0PfhLUbY4Td+mRPYEr
         +r6fPFn3dlw4c0tsT3mKrRNZeF4kvkH7zJXCslIeRh/ZEkAU5aTzD1zduPujDyXAh5FC
         MtVryWDp7mRaBlMknHDT9jfFwmhcScD0gHQ71iZjCxKKX7mpvkaqSuvX1y+jdfQyhjSu
         Isqf9znWrtxMwwbHfMiFxXZ/pFWmCxhwUpBg+esvOpA5WX6aiQ+MlQWpCnXbitqcS6hD
         Rg49QGoj5SyIrBvwJqXZUQqcmkY0lknuFwsZ1SXrN4JIo3m9xQDLUhDPn2T9tRMpSc4m
         VY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/PhyfxonOHMia69Uhhz8aFrAtnkrEZKYG1wmZQKttSI=;
        b=F1AtxvBMlEqFRklRtMNP1Ay1b3+0jxQSx1qTC/wXmT3/ScIjfboMjhIu0X1jGAFM5l
         xZtYXNWCzr5PvOyoUZEyn+M6AQrhtPZhYM1nVe1G6MbjHfVvS/tWpr1lx6X3tEMrxffg
         b293w4FpyUIOV2CGi1ViQ3HphHoSdggTEie7H909BBLcJR37vqAkWa/1gH6NN1WDXnlR
         D26hOyOTgxeOQAHscHmORR7JH/75fvypgMcXz/Emu+VmJbxobElc2RmqkF+SLAt2FOE6
         agaFOuf8U8+Z+Osh/hPRePkNvksgVmrLcgkbVDbWufd9xMfOMEST2+H3Oxe9gqGiDi2i
         +Rww==
X-Gm-Message-State: AOAM530W7mQEVx7EzdfEIw2n6g9Ma5ok3BKogHxGZk9boPULnOdq8FMP
	9z/aNX3UOJSu7cyZRIDXRjFXS4sm
X-Google-Smtp-Source: ABdhPJzrv+6PeNDYtLb8YQEIYw1XJoNkudToEiPoF5XvPNx6dqfN7ViMuLo35wCuTQQMvISDVr57hw==
X-Received: by 2002:a62:6dc2:0:b029:152:637c:4cf5 with SMTP id i185-20020a626dc20000b0290152637c4cf5mr4974356pfc.15.1602873737369;
        Fri, 16 Oct 2020 11:42:17 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([71.212.141.89])
        by smtp.gmail.com with ESMTPSA id c15sm3426011pgg.77.2020.10.16.11.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 11:42:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	laurent@vivier.eu
Subject: [PATCH v11 05/12] linux-user/elfload: Fix coding style in load_elf_image
Date: Fri, 16 Oct 2020 11:42:00 -0700
Message-Id: <20201016184207.786698-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016184207.786698-1-richard.henderson@linaro.org>
References: <20201016184207.786698-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: gTjB/W18zfqQ

Fixing this now will clarify following patches.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 1a3150df7c..290ef70222 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2531,9 +2531,15 @@ static void load_elf_image(const char *image_name, int image_fd,
             abi_ulong vaddr, vaddr_po, vaddr_ps, vaddr_ef, vaddr_em, vaddr_len;
             int elf_prot = 0;
 
-            if (eppnt->p_flags & PF_R) elf_prot =  PROT_READ;
-            if (eppnt->p_flags & PF_W) elf_prot |= PROT_WRITE;
-            if (eppnt->p_flags & PF_X) elf_prot |= PROT_EXEC;
+            if (eppnt->p_flags & PF_R) {
+                elf_prot |= PROT_READ;
+            }
+            if (eppnt->p_flags & PF_W) {
+                elf_prot |= PROT_WRITE;
+            }
+            if (eppnt->p_flags & PF_X) {
+                elf_prot |= PROT_EXEC;
+            }
 
             vaddr = load_bias + eppnt->p_vaddr;
             vaddr_po = TARGET_ELF_PAGEOFFSET(vaddr);
-- 
2.25.1
