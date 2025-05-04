Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756103njj;
        Sat, 3 May 2025 22:29:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXu3dhwxZYbuBKRH6n3sFalgAYkokt0gDqzXib3HSMXaHUsdRJ/xPe/HmmGC7UhGkvbU6EqsK2I+wp2Qw==@linaro.org
X-Received: by 2002:a05:6a00:ab86:b0:736:ab1d:83c4 with SMTP id d2e1a72fcca58-740587626dbmr11928871b3a.0.1746336568669;
        Sat, 03 May 2025 22:29:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336568; cv=none;
        d=google.com; s=arc-20240605;
        b=jSV6KGJS0sTccEuHjhjd+DETPhkugDDxFh/7Joh8cFNiqMv59xhqs7TimF78VEWgaw
         isKytk2NGPz+gOVtXR7YMM0/0id2gKq+TgV1Wr449EBCSPT6UhS3gnSQfd8t2nQA7W7f
         eNXfSAd2PBW0Femk/44gaer9BMA2Z91auZKOYUd6aOIER1/4E/TW7sM8EIjH96u68wwg
         7ub8277vvdRmpMRR5CgZGY3wL4JmfVoxNQ3iWa03jQMzKNynQV9HOl1gwkPdtS08E7dH
         wyEY4ByElF5JZM4SS73CEcbV+ng1TcJp1Ae29XVno06kyLcJq0bQbmZmwpfdFYSLAYt+
         jqcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LuLpPX6X06+NE7HHzhZQmUoQgosCpwXTe/wCgu+rNqA=;
        fh=MlXR4/kThfZIV2wLgVCstxsjbH5WC7/By1i8X0Brmfw=;
        b=SrSpsRAYXpCiNCitLIh8AsO1Mt4e5saQjB+BAXz000LHQr1Nt+JjeicMu7KWtyClJK
         wLP03vaAcBGRszm315AcaWwihIDmcc+Pwxi3pd+VBGS2Rwj0t2D5yU3a6Z0hUe4GxlZy
         CBj599mmLMVluNDl8NTwnoSTbsh+Zc3GwJGeKlEc3ngrmML+kezDagivoangwybfKppB
         PQ1u4Ii/28sVEWBbZNTSy4DQMp9h4AREkJ5obMKNSbzp8Bx4NBeKE7uUDjZcGZU/QDF0
         e929nMTQh5aAWRQfhhzaj1LFvi4Y4+Ol3VBMY493FKevKtQUyXOtM7CSqgSVxXZs3V/e
         aosg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=smUYfpV+;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404eeb1942sor3107904b3a.2.2025.05.03.22.29.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=smUYfpV+;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336568; x=1746941368; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LuLpPX6X06+NE7HHzhZQmUoQgosCpwXTe/wCgu+rNqA=;
        b=smUYfpV+iVjsOGrX4ZosyzI6F1OemYC5fMLPJFoBAhhjpQFVx7L6oo5AKIvliLm5k4
         nI+iS1ExL+/82VQh4EK5UoHUJn8y3Nnc6bDZxNPnXc8t9aLwX8dfTS6LMS3JmLRgmmFQ
         oEKJ1i5VWEId7DA2Mbm2F8iixp5V4dR9oprl985j9EWGJrfiaxstm3LIJw4nczTCfJNK
         59bQeM4wjTHuz+PApvEDEBgdbTEY2F+JCO/UxzfabM5Ssbx5/0I8h84RyZhCMdPqrnpb
         OYwbD8t3se9yXMmS4mV1l0vH59VLI5eqksdZHvU70P6tAip+Wiq5Yic4Z2+1U82e3Bum
         ymBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336568; x=1746941368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LuLpPX6X06+NE7HHzhZQmUoQgosCpwXTe/wCgu+rNqA=;
        b=fX6QvBciv+yamTUM+EQZHdJuF8QTHcaRYCYJTJCDXs73Y3wikAPm9bH6M441n3yZ2g
         Wi5gHuiGAU3UD+nG5B/HUtq4eoHRQLfT7kWbNDRqfxu2VAdFzDC6Eq3FZfBdtq4N3nhq
         AJ2ej2yMzHQ3gF34gwP8Ecu3tVXRucZ/Gbg5g8cQ6VKj7ldROa/jHQh1nfi6IRY9oGQp
         qy4gf/efBaXeJaiZ3wKDN9qrIuv7yaVklBc9OKpqmuOrd4hwisjJOFjD1tyHuPhLACZ8
         I3gZojvF+XhV8LNzblgjEMZoyszNqc2Pc/6vxxryVIChBTgGw89qeAa6YPpfl64YGeEs
         SQLg==
X-Forwarded-Encrypted: i=1; AJvYcCWy9tu9suEjOzSpzXlgasHcOyYTfveAj3ZkTUYznCTd2v9qt3iJuX7mXJX8kPt6Y7HI3JpJ+zpybyEFVA==@linaro.org
X-Gm-Message-State: AOJu0YzVp2ZH2cVcLqWenjWRyFkQ4riKQ/r17gheUumyeMDAfLB+5CNz
	23zY7QBcsutxMTZHa2jsf/XLNCagN0RqeAwpMeWirmy5I7QXnhb9r2C0aldkp0WPkQ==
X-Gm-Gg: ASbGncugaRAsPlPNYXtGGTmMh5HaccfIoLl9cOc6aPSswoWAzXXPJH3qB6rTqWOyINi
	lo/4xV0+h49Usjbtg4OHb6lwP9GguzyxmDKDesIPkKHo8qXQbxIEKbaVzqRlt6GebvMajbs7exg
	lPfNVkAZV+XRsT7qhzcyZZVjyM9s0bWqoo2coiUHvnUWRlMH8XHtPIrm03uLfeQ4dDwNE38wWVm
	cVyvNd1a76I+TEn3FAOqhQXcBx91x2vjhC3ZDRIyC7C3MTMO3p6jWU5JjOEZX9wf6cJjCtgplCI
	G+2JOY9vuIPZWZ0gm++GFaKTOLub45Y/fjDAXuVG
X-Google-Smtp-Source: AGHT+IGu15PBf2rG0jV3bfDUJnP/9reL3xvY3YvbbIU6AzYvR6V/RBuTvzsbzlIgf0athadGHRLk8A==
X-Received: by 2002:a05:6300:218a:b0:1ee:c7c8:ca4 with SMTP id adf61e73a8af0-20ce04e699cmr13507222637.36.1746336568319;
        Sat, 03 May 2025 22:29:28 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:27 -0700 (PDT)
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
Subject: [PATCH v4 09/40] target/arm/cpu: remove TARGET_BIG_ENDIAN dependency
Date: Sat,  3 May 2025 22:28:43 -0700
Message-ID: <20250504052914.3525365-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: uGOwtkVsKsY0

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Anton Johansson <anjo@rev.ng>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 07f279fec8c..37b11e8866f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -23,6 +23,7 @@
 #include "qemu/timer.h"
 #include "qemu/log.h"
 #include "exec/page-vary.h"
+#include "exec/tswap.h"
 #include "target/arm/idau.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
@@ -1172,7 +1173,7 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
 
     info->endian = BFD_ENDIAN_LITTLE;
     if (bswap_code(sctlr_b)) {
-        info->endian = TARGET_BIG_ENDIAN ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
+        info->endian = target_big_endian() ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
     }
     info->flags &= ~INSN_ARM_BE32;
 #ifndef CONFIG_USER_ONLY
-- 
2.47.2
