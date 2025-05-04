Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756193njj;
        Sat, 3 May 2025 22:29:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXYAuYUigf+1bXUJMu/i4mJjpuO92HNPywodgKaCq22I68+qwnsscO1ZAdR1SRsEMzW59FIeJUTCpN1DQ==@linaro.org
X-Received: by 2002:a17:902:db11:b0:22c:33b2:e430 with SMTP id d9443c01a7336-22e1e8e9e21mr37862915ad.6.1746336587047;
        Sat, 03 May 2025 22:29:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336587; cv=none;
        d=google.com; s=arc-20240605;
        b=ex8bd/0J71CbOrT+e89nfcYNAsBZuR5GJxreMXUQp/P8PvHt9s/6r2qacZnbooUC29
         45AKHA9qWBEWB7QZofoHSKfXydUlbAaywHYbEYDo5JA/7g1xw/bfA2lCO1gsDQ7995zy
         LeADE5c2M24fM82epLsYu/TbQtODuOHtyCwceFid3oXjeJoWG2rJDh2jNoXbZWZp2onS
         70Bt/mGm0ZtqqEVW9dztpWvFFQszrU7iCKJ1wK4VSa4hVgVHobKg8eUzxRdFIczepNxt
         dntW/Pt8KugO6z/uuhgGpP1ee/2nXXR5r6OqKesq877hjbpBXLAUcBZGpdg2V7DTWdzD
         nAHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rVtP/RnhHG9awohdmhc7BZy6oUycGDI8ImSQa94LuXo=;
        fh=T3rejd+jwySdA/Og1iU/PZ8UAfnuM69tBdrh/YK/+xI=;
        b=eb/PMruDeOtknWjA65fyJmpiqTL4Nw6EnOBOyYZuwhEv8P8arQM3uPHZtkWkZzGGms
         1uMrX0mFdUSH7WpH5HAA9oG5tkFlFl9l8vdZXhiGbVI0ghA9i2RJ5sRTcz+BmPyMHDtn
         FaTXFiV9njUAudPFzhgdgnGVr8V3YU2UzIdXTBhJUW/1B5+o0qjLAsDfeb9Rbr1s25Qi
         KJh7FfPjIFzZB7XhemMTh81FS4d4iYqxd4THBu5zQi1s348E5WFWgU1DzaFfmvG2POLA
         r+of01eX5A8PZXqIslkXkj2PfRZN33J7sLW7LVJ3k4+s8OiySjNq7pAlllhpBW4dqON9
         XxQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SMuuMnpk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb110a6sor46620485ad.6.2025.05.03.22.29.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SMuuMnpk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336586; x=1746941386; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVtP/RnhHG9awohdmhc7BZy6oUycGDI8ImSQa94LuXo=;
        b=SMuuMnpkqd4IY1ejjNBJ1IWTO5HW3skQGbV76wmlvlLmHmrHmjRow/KDbVUZ3pS2yJ
         9ec70zzVuGh1Iws6o1zFJHW3FQvy/zk9RDLkE2XoJtdrUdng8npmhTaNk8x+yrhmrM5e
         Z3DOVDMxy9yVLt0iylXaJi7NTZlejsRuBP4r30Lpzads1BWhUKFFaDBzAiYO+O7BRmis
         mecPWp7xqpzaMJSVUtlM0VAG/m3i2M4d3SsPSzseUa6hHa+2yISy0k9N8mW2twh5cbBf
         lsNsxY5OXnaNzY16GCDkJMNoKQ6OQQVBJngR3HOikQFu/HW3NXkmw3qoVpv0p9lAcs8A
         6zmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336586; x=1746941386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVtP/RnhHG9awohdmhc7BZy6oUycGDI8ImSQa94LuXo=;
        b=STgmzfW7wKUu9CkZba1CHJfa2j8HaMdYuN9XVAOtmBcz1vXNYKgZPOXNR5MyMTlZ5I
         69CAviZyQkjuC4nxCPsKOZJl1ZSOTSsd1OYT0FjzfQUIon0VNTPKHyO/k+2n2DKW5mBp
         hXRp9618ZVVxZlQYZn/LJh2R9Dta8u0kWepLWf5CGlob3qM0JvLHDRrfmBHPupFGA7nQ
         pwPiMfe+zLoQi3Njt/LhsKrO2l8b6mgoga6POy5mgngcEo52Qxw4L3iAumesWZhkVQV1
         DBp8jV5S8KdLojnJyox9ks2yj5HeC+ZGsRk8yEgK5nGyv0FmbFI1ziYUZjRuYq+WjDzq
         9t1A==
X-Forwarded-Encrypted: i=1; AJvYcCX4Nj1cDuhX5YcHuhYaZ2DfqzfhhOue2LU66OQR4vTBeVv35DH58hr7AnUvBRw9EGuzDOqkxV+OZM7j9A==@linaro.org
X-Gm-Message-State: AOJu0YwRLRVToGOQrbfWia44oXaW+vI1tFgmeBadVqtH2IMpxpV/xptW
	5qxV0lF8f9Uh48ZFnVppUCiZ9OfzhWdqAgm7nY4nBMK2sSCOtoDmbjuIsYY8vUVTFVF6c7ZAvXP
	RJXbz+w==
X-Gm-Gg: ASbGncsAuf0t8bWQieIFpfXJRGz74Ya0BOAlrQiu/bkYBSr0Z2VB8cs6m7XXQN53TIG
	yD7I1io3+MyCbcFwx6KID5MEGQEpQ7PlNmkNTn/jvJivSEE6HkG/Xlh1omGb12Q4xsgXBTYMXbr
	Dyr0t9iCP5j6jm/lCjniocDDsDF9FHdINxONFArtdSjtnGMfmrlD/9d/XqDGOhs2SF3wxBJE/q2
	6LIOnclsXG9ZAzLOH+cinIsns1X1afy1cdmkYjj9r3BipXUy5lGoQkgGRCS1XKltsrWULC3prX4
	qIbrTkTQIhsiaiqJA++iWPDr7wVJ7Od9yCndQUNm
X-Google-Smtp-Source: AGHT+IH8pStqcZBvvYFFxKQxcdicD1/a/lfc9xhDUZ+J9NMLqS3FmKOe7ccMNbifujt3rX7vnt1Q1Q==
X-Received: by 2002:a17:902:d2d1:b0:224:194c:6942 with SMTP id d9443c01a7336-22e1eaabf6amr44782545ad.34.1746336586599;
        Sat, 03 May 2025 22:29:46 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:46 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	kvm@vger.kernel.org,
	richard.henderson@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 30/40] target/arm/cortex-regs: compile file once (system)
Date: Sat,  3 May 2025 22:29:04 -0700
Message-ID: <20250504052914.3525365-31-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: XlWkYBI3Onlv

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 7db573f4a97..6e0327b6f5b 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -16,7 +16,6 @@ arm_system_ss = ss.source_set()
 arm_common_system_ss = ss.source_set()
 arm_system_ss.add(files(
   'arm-qmp-cmds.c',
-  'cortex-regs.c',
   'machine.c',
   'ptw.c',
 ))
@@ -38,6 +37,7 @@ arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
 arm_common_system_ss.add(files(
   'arch_dump.c',
   'arm-powerctl.c',
+  'cortex-regs.c',
   'debug_helper.c',
   'helper.c',
   'vfp_fpscr.c',
-- 
2.47.2
