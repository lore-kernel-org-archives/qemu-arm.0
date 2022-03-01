Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp209952lfo;
        Tue, 1 Mar 2022 14:00:27 -0800 (PST)
X-Received: by 2002:a62:e813:0:b0:4e1:922a:2a6d with SMTP id c19-20020a62e813000000b004e1922a2a6dmr30072962pfi.50.1646172026804;
        Tue, 01 Mar 2022 14:00:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646172026; cv=none;
        d=google.com; s=arc-20160816;
        b=RMqu5kNVGhGt/8UVYz2+6iqQvH9SrbzVTHGpjNxnR+T9hV79As6K/M1ZOet90RbVlZ
         ZRx+FcvF5OkBDVXcO7udTcM7fT0oWqofPkfdTTx0egRw6TRLkr2tJzq4uPcsWvQSXzAq
         H84BlHG9jnAFJyFlvwcmragX9mmN9M2MX5FCap0I9Gf8C2T2sz6Qi03qgoDf659iAbSN
         0ijK5zaq0eUjR0t8HjfCFz4hBjcQs0yCIqjVQXYtA4avcKKAyKvEvNp5JIDbbCB3Qu0x
         NA0NZjR7OQsa++NuHzQASHLnkJXfPHbTUuxD74DY5Z9SsZO46Ij0E5OnRg7ayq8yDpPa
         +O8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/ncep1+pfaj4VrhFhzBJtvktsI7eesl8NO/EGk2kyoM=;
        b=PdvI5CgAXcDi0/vbMdyneQiuj+QOdq87ZW5gtyXJzAlIvPjPmy/7ImCKyTqf5v+/f5
         VvK8s41n6q8UEHxgme0rpHQ3aD3IYzrqVJ+XN/va4mZfcD5GcJ7eLXbH6RpkeClp6QF7
         w07RkRu2i4KEi+ZwXq6FNnT3SJWWw4xMD0auW6u3K+bI0/1pFhiCw4+813bIviEiYX4/
         4PWHuqFN4saaXiBNOztnKU7F1mB0B5Psb1rt+SM1YCYHN5L3nTeZLMAYwobY9mM3Ud6/
         /Nj1KsWZbpdep2V1CuP2htPhUjFSA22ReI88Ry/7yaxbINzxFFq0DEf99DvFUA8c1fu/
         cyFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U77H2tZW;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p11-20020a170902bd0b00b0014fe9289a05sor7320547pls.181.2022.03.01.14.00.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Mar 2022 14:00:26 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U77H2tZW;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/ncep1+pfaj4VrhFhzBJtvktsI7eesl8NO/EGk2kyoM=;
        b=U77H2tZWwh5cJRW1Wpb4uwaA3RLNMtAJF+LLSgoaYC3NKL5ZbSUUPZKRMK83mzHkgA
         EwfhF8EhRPwlYzTKtfX7hQftMqLJvQkXT7L1A9ravjK1SUzJLu4GeK8Fg46sCMiZO2uI
         WmWgkkePaXBbkCeaCXOey3JkfDIs3g6L2BxlbUIAeXa+JHuDYJZScFNd2nGIdhBOBdm0
         UjOhS8FNMPfbKGHwQMiniFpcJEXP5u4jgS4oiXpM+uW7XwJi4E0XjUxfwbp+mSu1TEuM
         EAiy3eI6UAxlI+Np9vscUD8nmI7ZjKy9m+PAbv4MAS7mw8GT2QS7Rixsv74oRg2wlXi+
         ytbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/ncep1+pfaj4VrhFhzBJtvktsI7eesl8NO/EGk2kyoM=;
        b=TD371RVWQGMsbMYu5XazGP3zUespnQl/Vkv3u0Vjm6iV1SbC10sIvln5/myZrJXxuH
         j7RsZiJLpNPqZ8qIDjB0ON+PVek8Ci0aw+7Z9qWnSXKJnnIHbl7SC4bHIwKDr8WDs+16
         XEfQX70zfupnOily/m5SAD26OesGmfwsQOf9Ek+5KgN0h7S5ooad5N+qyMj/0NUt+Evi
         liv6sryy4OkNSD4dfOT8ZoKHpY24sZW3x9gFFYUFuz1AcINibDeLVAyADsVxJm24IpA2
         RsZ+7tIpMRUfXoXE6cwoc1G6FiHvM119S7cJ+mr3+K+jiZjWKUV8+kFCu0IiDHzzDMUd
         pWgw==
X-Gm-Message-State: AOAM531zu9qrlnEZDT+E/qlEY2ti/f2Zr0vmxYdb5P38YrKE5Q4D0LoU
	WnSAjpznOTIjj1RMlDu3sYljyk0h2u8jD6q5
X-Google-Smtp-Source: ABdhPJwu4NrQ3hWhhFdKlGLBU+fCPoPmbcieKMlEw7RsuTpzzsnAnuogtQ0nl1I/EUnL23IjOCvyOA==
X-Received: by 2002:a17:902:8b87:b0:14d:7920:e54a with SMTP id ay7-20020a1709028b8700b0014d7920e54amr27533190plb.140.1646172026329;
        Tue, 01 Mar 2022 14:00:26 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 14:00:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 15/18] target/arm: Advertise all page sizes for -cpu max
Date: Tue,  1 Mar 2022 11:59:55 -1000
Message-Id: <20220301215958.157011-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: CNufUXR6uAlt

We support 16k pages, but do not advertize that in ID_AA64MMFR0.

The value 0 in the TGRAN*_2 fields indicates that stage2 lookups defer
to the same support as stage1 lookups.  This setting is deprecated, so
indicate support for all stage2 page sizes directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index d88662cef6..2fdc16bf18 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -796,6 +796,10 @@ static void aarch64_max_initfn(Object *obj)
 
     t = cpu->isar.id_aa64mmfr0;
     t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 6); /* FEAT_LPA: 52 bits */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16, 1);   /* 16k pages supported */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16_2, 2); /* 16k stage2 supported */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN64_2, 2); /* 64k stage2 supported */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4_2, 2);  /*  4k stage2 supported */
     cpu->isar.id_aa64mmfr0 = t;
 
     t = cpu->isar.id_aa64mmfr1;
-- 
2.25.1
