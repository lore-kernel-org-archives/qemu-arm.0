Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp209725lfo;
        Tue, 1 Mar 2022 14:00:07 -0800 (PST)
X-Received: by 2002:a63:4c46:0:b0:378:4b82:aa9e with SMTP id m6-20020a634c46000000b003784b82aa9emr18363223pgl.331.1646172007184;
        Tue, 01 Mar 2022 14:00:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646172007; cv=none;
        d=google.com; s=arc-20160816;
        b=rlMF3319yGWkYMgTgZzVe5zrlXTrw8vLWrf6QSCz4nSWte6DN/rZ636ABOunjH4XWe
         0FjbaPYaa7h3n5zaW9dzVnp6cWLFeYe6IWvcu5iYBHRT/5kslUzI/Cdea5j1fJF85UN/
         qcsbsC276PyAhhLa423Dy/pMgjKC+kccdcjBbDxm5rIZdS/JFdOCGNWDxo3Oz7RqR3qb
         kauUIhkdbQZA+hRzR+/Fu2zlW5vkpMZXGLFXKVniJSemeJ05C0G20IJI3fC9YgXn+b3Q
         WD0upcy2sDGagRmFepE1WzJ7cBOhYprzd/RbkmNuq0iPOSU1PchNMwsgZ8P86WJnBAGK
         bCSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=E1rlJYYazfRdVeynNKa6RTb/vpD+L0sCNF3QpW/Zvp8=;
        b=L9rrQKHRpFFHaYfE3xaQ23ML5N3RJQgcdieTYrkNJCQ/YiL37gdxwtfj9qVP8ZRX+g
         TQu8l3CUQMDvIuHcQ7guZ+DVVcqga4ZMvlMV7iNBzWtgRtkzNMK22DPwHeQ8ILr2I3Ze
         IX5rLpGp4MTcZzPRlUtr7abBZcgk/12gOEXtl8AqmTC+PQeX7M98ROj3gxcepL7zQnA9
         DyjIzLKBtX8vQMRbjF6/6X6Gbcxpnj9D8ZCMLGq7JdaYxj5NFISHx3lIVPmeOFpCkPwo
         TnSuQJlDZ2yraWFzt8xJr0v51JOVuUZOdVajbdxZQhEgPfFMrvJjnMcXSF2YXkKlSmc6
         K8fA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iWENCHPY;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j5-20020a17090276c500b0014fe92899b2sor7317942plt.98.2022.03.01.14.00.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Mar 2022 14:00:07 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iWENCHPY;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E1rlJYYazfRdVeynNKa6RTb/vpD+L0sCNF3QpW/Zvp8=;
        b=iWENCHPYZqKwbsB8w9uYNeYg9InVg6/l1aX3WDGZzSjCc5EK9ycc/+CwlktONCfPCa
         hPfYWpllMJqmgylTcktcbf6FC69B6wjIEoksowCHtRFj3XF6SZrz/NPJNE52UlaBnBdg
         D9VChukulTP79+uRMGFmtMKrKaopmQ0qUoobCkqFrrX3yjv4t1BLy12aBqpOQC4pH25U
         mcm6yfXmIVA7nkJpdKuFUfK/ZTg+wNWvqKMFMQPUsaqHAcbj7mneiZ+K/b/grOyIJ0te
         +/Q861Vlr3WcEEQPVRvCEtq9vh9bKisEEUQaFhTzN1j+yGLIYjNI9gZPBuC1aZeAuPKq
         qLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E1rlJYYazfRdVeynNKa6RTb/vpD+L0sCNF3QpW/Zvp8=;
        b=er+fVai65UrmFwpx2DMF32Ou+PFr7ZKD6WYTdmYqBOOaTh+9EkvwWTkJzbuOmU1tuP
         SSkrpORCZkNJLq8ww5qAcrlTp+8+HZ9BZ40M5by734t7NtXNztUilbjEa5HbdAvMhC8S
         FWUrrkH6Xpl0dKoU1Pfk+C3PzdkMsSj+q2O/mrlR1nggdkdOnLWxGk9BoeZLEq6HbDYr
         X9BazA/QMlqtmAHQ1lNw0jOczxScKZ1ClzEKd2aJLEb0HWw7ezTYUQDvC9sduY8Dvwl5
         InShrnPpoZBnx8ORQWXoXpwGWAl5QFVX2E+FJrqg0lylzZ6W8s8gI9Cgm/ALMo2KPdUW
         T2wQ==
X-Gm-Message-State: AOAM532sUA8ScN6j25LvZps6TPg26axQZt8dh6x/f2T2XqnbdwlqD0DX
	Qxm5BXHXnEm4B1ycoOmjQ/8Cp5yb
X-Google-Smtp-Source: ABdhPJxsLWUEHCSRx5y6+idMrcUWQioEy8o+e4wivRjqPDiY4+t5NktOzFpUTisz2QcYRZhmg8a/Ug==
X-Received: by 2002:a17:902:bd04:b0:151:6cec:4b3 with SMTP id p4-20020a170902bd0400b001516cec04b3mr11176922pls.106.1646172006144;
        Tue, 01 Mar 2022 14:00:06 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 14:00:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 02/18] target/arm: Set TCR_EL1.TSZ for user-only
Date: Tue,  1 Mar 2022 11:59:42 -1000
Message-Id: <20220301215958.157011-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: fY7RugrYIlAM

Set this as the kernel would, to 48 bits, to keep the computation
of the address space correct for PAuth.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index c085dc10ee..e251f0df4b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -206,10 +206,11 @@ static void arm_cpu_reset(DeviceState *dev)
                 aarch64_sve_zcr_get_valid_len(cpu, cpu->sve_default_vq - 1);
         }
         /*
+         * Enable 48-bit address space (TODO: take reserved_va into account).
          * Enable TBI0 but not TBI1.
          * Note that this must match useronly_clean_ptr.
          */
-        env->cp15.tcr_el[1].raw_tcr = (1ULL << 37);
+        env->cp15.tcr_el[1].raw_tcr = 5 | (1ULL << 37);
 
         /* Enable MTE */
         if (cpu_isar_feature(aa64_mte, cpu)) {
-- 
2.25.1
