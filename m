Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2956471lfg;
        Tue, 9 Mar 2021 08:22:43 -0800 (PST)
X-Received: by 2002:a05:6830:1613:: with SMTP id g19mr16965254otr.157.1615306963292;
        Tue, 09 Mar 2021 08:22:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306963; cv=none;
        d=google.com; s=arc-20160816;
        b=ZC524VeBQ6SRln9RXHVWmLE0hTvjxmpqSlBVVXLuAmpMuloTvWk4AnFuDcdhZHSbNw
         0IPwy0aa8Uj8ZKltDpFdWJP7bjVYE8yYSeI47ZtifBxYZzN9Z5JZQ5T0AY73JFkR9O1V
         Nr6rzcoDdgIx3v/WfYVlEnIxcJHa3R4c340y2eIRrLEUIeZUFjv7+XyKlEM2m4vTiR+K
         45jxzkI2vkfgIxiO3UjgCwyPTwjS7YjcTo5+CklQVWJS+WKfIJUQwirL3VPscIiHhpb4
         ietpAP2HMeuuIX931BmfHmQf3lfBMpzu/5jiRE5L5bTWjRM9om7YLXCuuPEVl4cs/9Ei
         biMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KA40eVLdhdRfN2JR4MJ3Si1YCqVpEUGM3POPrQ47iFo=;
        b=X/nQgeCXzE2lNe8wu3fyhguMdHXfNniivOzaqnaD11BiThdhQwtycnBE3MDMg4S4Ff
         jfBOY7Rf83kIs4Z5dvwzkUnxlnpgvrD6xaBCKVuq5IFK78IbAHZioj8p/04sxmkjyTcb
         iDzmVu5DsGSKx04aUVp3DUmG08DiBPp9xE87IYeX8RfYsXVY8hCOKOjT3SbM+haAG6bO
         aqiGhRVEbmG/h+hiQ0iCVi8i3aL8PhvNlPPAFCj1He7pL5MdtrESIgSUgFWYGu4sJ54I
         Z3jBcXHb9vsXy/rxdThZHXgpIxcCmbcgVSoxiEOZHzXZhLQiPRP+1UEjeIcxa2AVlgyy
         068w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qD0MOHKO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d10sor3271490otk.112.2021.03.09.08.22.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:22:43 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qD0MOHKO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KA40eVLdhdRfN2JR4MJ3Si1YCqVpEUGM3POPrQ47iFo=;
        b=qD0MOHKOp6bP/YsVj8koY8qGBD0BmVEgkJhNjcO5ZVl5Y0EQ6Ec5Fx1l1/F3IeTNYr
         X+7gf+PIU1/HXjQQF8lFgVqK6sTr16j6sSMiuDV++Y2hpGULonPr51y19Rs0UIlXMNuB
         mT23KnHS291zDdY/HRY/P/mJvxO9964oFu54YSUEUdZY2lCgKDjRBiAGTUDiIkl1YhqV
         LDl7OwAI4WglzV8CxDML4EfMjzvx8r51VqY7+xHM7Suc9t8aONa/ApxVK/Mn3bmcJ5rI
         0ia9MA22gHEijhojbrq3PtVohgmurbPWpCRHmMnQLn7FpxmO8sL3d+S5/xaWvM4GcGE2
         y/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KA40eVLdhdRfN2JR4MJ3Si1YCqVpEUGM3POPrQ47iFo=;
        b=L9T1YCUoPDFo6tIzEJJbHMKl7VJPqXQicdvPBcOhrA+dV0ReLH/kjJscluF8Fn07VK
         LTjeBPgiiZHGHjFKnRgl+9Mb8cu/6DSSVxNy7bXqmP9Q5qK/ZJ5qbAp1eOj7ItUSx8Ap
         aL+eyyHg+S6IXh36IERT5OEapOtQMlaU6e5wYcsjz0yqXrxMTzb5tG+Pl+spLjy3pXSS
         nh62JkU2Fhks/MZ1WkhXh599CypELig86msZNXhOB716so9/Rq79Xz5BYPj5I8ImX4L0
         DCWib2mdsGbiuC78T70Qt8jbecbxUbKnmJBBucRpMLQGU0YIZvnXS3yK5z9k8O1BfN3T
         Bx+A==
X-Gm-Message-State: AOAM531n2I0V2ofydAsuSg/kR2nuUzHY8B80R8jnQAbGKGhEVe+tyGE8
	9lpgB+j68JhvdGmfzfwmyETPpASz
X-Google-Smtp-Source: ABdhPJzhsOr09RZlqb1kFoXoEPRxSR6EgTzZJnc2KU3WgQ/nDQrpbjXihw/Dv5A8Tuicu/IbIPhrVg==
X-Received: by 2002:a9d:7513:: with SMTP id r19mr9976102otk.85.1615306962934;
        Tue, 09 Mar 2021 08:22:42 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:22:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 78/78] target/arm: Enable SVE2 and some extensions
Date: Tue,  9 Mar 2021 08:20:41 -0800
Message-Id: <20210309162041.23124-79-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: eVXPB7ra9L7k

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f0a9e968c9..b717b096c3 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -702,6 +702,17 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
         cpu->isar.id_aa64mmfr2 = t;
 
+        t = cpu->isar.id_aa64zfr0;
+        t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);  /* PMULL */
+        t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, SHA3, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, SM4, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, F32MM, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);
+        cpu->isar.id_aa64zfr0 = t;
+
         /* Replicate the same data to the 32-bit id registers.  */
         u = cpu->isar.id_isar5;
         u = FIELD_DP32(u, ID_ISAR5, AES, 2); /* AES + PMULL */
-- 
2.25.1
