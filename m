Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1090096lfc;
        Thu, 12 Mar 2020 12:44:48 -0700 (PDT)
X-Received: by 2002:aa7:990e:: with SMTP id z14mr7939728pff.274.1584042192464;
        Thu, 12 Mar 2020 12:43:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042192; cv=none;
        d=google.com; s=arc-20160816;
        b=hZqcX27jEzStXZbdWeiMNMQG3SCugVuLtsgO2vOLjVZHOR9xebeCurvAwxkfGv63lI
         OQQ6oXlX4im9hUJkobgYOgJsoh0F5hTL5amTBu/ArTvDiwQibmnM6GBJ1G1XUChXz+5c
         0CguBcL13h/mEzl9vBVZWGxwOD8i5fHBrM0mQYaP5BkmitOOhc1F1M5/UYam3+qyJcNw
         OtOlDTDBceqoXJuRJ2fzPaMhIbFCv2K2Erc8k7p8DESbOXBgiBRq0O304Zn7YQ/1xLan
         qpQVSrqkd1rY3tdySJx7B1QRR1j+pmgN5N0nh6sWBNPafEfdf2SPA1esrztySoL2OVf3
         tHKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oOGWU6CgcAFRrNmaOEFHGDGiBotip/Vn0ZaQb6OYup4=;
        b=W3jZXgVVURE18vQcc1mpiCHFaAqY12mDH+sDF7grAgtYwkwU4WRZH2tzfeY6nYsce6
         q/emflDmCLLTUd9BtfKrJxW4CWkuWVScbQShSVTzJv4MGONWa+L959ifEbwsE2zkZ6p4
         4Ff2OPjzEi/iI8RUIIXrIeuZ1jNdovykmKAxia0JoDZv7VEMsj69cTtMmbhjMB5R2sZD
         QQ95dMYEl7FUVzO94cP0whRpio3XvTkaJ/AwtYtEdLs3llDqqjykw49N5JVh+0rG9Uep
         E/kj2di738WlbOw8mXlDDK4kcDv+915MhBL2cjd65JiJ1YzJU1F1B08dj4/vo9dJI9DC
         t0tA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XIfuiFZ9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b10sor7799331pld.45.2020.03.12.12.43.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:43:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XIfuiFZ9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oOGWU6CgcAFRrNmaOEFHGDGiBotip/Vn0ZaQb6OYup4=;
        b=XIfuiFZ9PHJ4tysbW3FlEDZ2Xh95aeYAhuZENQ24XBKqj5QSbeCqRThREz4xNNPfwC
         OuOQshhKfD9w/ihwmca91rKdZlJjtLjr0u2watMO5q+nidjEBkDAk1zUixjab788ukYy
         FcBrJorCllZ3hCEmNFFT8DAkQRpY4LcjMuBN+Fm/zmR9mS6MUOJ6hkrUzDrNnkHL54Fo
         r9+nO8k8s2bXrhBbNEUNkGrVVNADYYvKx5j91C92Js7B5He7JBjAvHQxq3gV3NcS3VQK
         Wtu49cww+eY2627Um5nD2oe0uuCE6oKN0uvs0Amoln26FxYYEsRwAxHUDFqH685KGsHX
         l0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oOGWU6CgcAFRrNmaOEFHGDGiBotip/Vn0ZaQb6OYup4=;
        b=ldLPamYRGCESl6lUbZnilNy2HBEWHPYzZEeT1289WSXD+kzsQdMvWg4XKYJakUpMac
         AufEkverOWZ5xQKNmj9lKMVTBlY+fmOdnS3YhMZUFsTcL7C+FoqH1XIF+MSTJQsJeLR3
         PPvtvYir7PyX5yH5dKWSut8RMj2zXKgdyMaREcLkqtlg4HW5+L7PWMFRb0SlL7esziU0
         dWNTnOOUP1VOHkh2vUqlEayWhVMcxYAYD9HzbjMAdY6UT7ZyDn/3IYK29yubSPZ2tT3H
         PQH7/bRhlCO+kfOS8IIc6ht62DiJoJwHFWGhlOEmAygFGZEQsApaMRZi7gBq9NK6gEIR
         2+iA==
X-Gm-Message-State: ANhLgQ22U2G9+BcNIPA2Lw9lhe8KJvQtv8iGTnhAVA0YhafTpHfGh2lw
	YjlU+HzahKVUCBBSyhKUazJvXizFpqidSQ==
X-Google-Smtp-Source: ADFU+vuWHgkNs53qyBi4Yd0+s7L0YajE/N4Of0z3hs9u8THPwvTpIwFhVoFz5odzND5UvS5USYGYWg==
X-Received: by 2002:a17:902:9886:: with SMTP id s6mr9716875plp.100.1584042191976;
        Thu, 12 Mar 2020 12:43:11 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:43:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 38/42] target/arm: Set PSTATE.TCO on exception entry
Date: Thu, 12 Mar 2020 12:42:15 -0700
Message-Id: <20200312194219.24406-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: gWjb1+0C/ywX

D1.10 specifies that exception handlers begin with tag checks overridden.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Only set if MTE feature present.
---
 target/arm/helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 44e7c0d19b..b38dc74733 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9664,6 +9664,9 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
             break;
         }
     }
+    if (cpu_isar_feature(aa64_mte, cpu)) {
+        new_mode |= PSTATE_TCO;
+    }
 
     pstate_write(env, PSTATE_DAIF | new_mode);
     env->aarch64 = 1;
-- 
2.20.1
