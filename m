Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1065661ejb;
        Fri, 17 Mar 2023 09:51:00 -0700 (PDT)
X-Received: by 2002:a05:600c:3c83:b0:3ea:ed4d:38eb with SMTP id bg3-20020a05600c3c8300b003eaed4d38ebmr24571519wmb.24.1679071860690;
        Fri, 17 Mar 2023 09:51:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679071860; cv=none;
        d=google.com; s=arc-20160816;
        b=ol3seEeZD02ZhNs7HE2LtbA0kwFGK7ShnDt+XZx8i8//y7zXPLE2kPWCLSKReVmMwG
         YZi4qkpPsumFRK+n19E53xA+myQro5pIKxrLlqBEbN42JS+MCPP1NNA4yxgPyF5mWnQP
         VLwkxzUJf0VydHIP5ahSNn0ZFbnXGNGji4WAIGvZKtA7rl0RNsCCqvnt8lCh5gEptjr6
         ThBYsHZvILHuTx4Erxqnm/OmbE9STpN82g2EbSiXGoGqBlD20/PXTAwmLGNEnL2TPBQg
         fniK5F3RFREtLv1VlQ5QMkrDVjUVdlFldt6wA4hdiTi0yEe5Dx7lmKXNy/DpZOz/rpJy
         8g9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=pcjeNQpYtfjnbCVp1jPfUN6yC3n9EwkQ1XDGv0Ar4fQ=;
        b=Za1H8tEY4RPuAsZriVxAreSz5WvJNyb3uLZlyhcRoe/ya0XLOwEqspGhuX2qNolcBR
         LPfQvLlA/+P7lLJI77VMw7V5vmTo107CYZ4cucKHcLi4cCCDoWbXG7aPa9wqjQRltiHZ
         +ITriCkBkQo2QUT22828KtNc/yodpDArbkfSXfgsr3WhOO7H7sJiffX3D7h1ZLCW2Dbd
         12sVU19NtRCdWkU7NScLAyOyoFbWqVPB5ScgqV6+j899Yl/2uwJPNI5hKpIVgHMNGBCF
         4Pfa0JSk+PF1non7enP5rcAKO1krnOsOqsJWgpiJEzELMC5833njrRq4QYq00NQnDx1i
         SjUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IR4T/+vw";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l3-20020a1ced03000000b003e1faaaa3a1sor2656841wmh.2.2023.03.17.09.51.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 17 Mar 2023 09:51:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IR4T/+vw";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679071860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pcjeNQpYtfjnbCVp1jPfUN6yC3n9EwkQ1XDGv0Ar4fQ=;
        b=IR4T/+vwPMsWe13l5Ri/VHW+QLrQi+hBBZq2nUG/G1I7bUM55W3uFiErbJT03HYtM0
         5KO9W0MpwMFbFq8jg/zLda7UtCnHfPLA3tKD38J0/aPkUV6p6xSulVygC2HVsQdsP2pi
         AdHrekxgCFAnH3NID6OdO9AwRgU1aVgpV9Jf+9kjDDJxU7wLXiJI8lv//WCuzCeqE0Iq
         6YyQrL8jcXPLaH8D8sZ95UM1/0W8aEvy57lZy4fQhSHN2YT/yv8ef4VZMsVlyVLc1RCE
         +S8Eg08fK5lV0jX1eHDvshNaiR1eFm3eTMOSf1Vk7mFR9bnIlP2D+IpzaIpHs9RcFG4/
         gYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679071860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcjeNQpYtfjnbCVp1jPfUN6yC3n9EwkQ1XDGv0Ar4fQ=;
        b=c/cyeNozb7BnZXucWQqh8+oee34wSeQu792hlwFANVZAylJc7Axf7BOGtkNTYR/jCA
         /WBlCFeWrxfVBJFwtQJCzaSFAVxY9vnK/rHa21pAwbVmRuUo8wEaMEdFvdXOZKzBlnZk
         /x6XYpNrh2xNKF5A3xCduLdhYP8iJxg0dUi2ryJ8KUplKs6CvSVKGXvJ9O1v6GVX4IAj
         eyKHuIcoc7pPSJ5wPfW0PPh9yEai7UFuasQumt/LIpn23PCm+hjF6qEZ2+FHyZXwSB8W
         J8zy2upabF9e5fhormkZMWVNRyFaz5OROpKOrn1yPusDP1tipQRx2FmDecYV+1Fr1rRV
         qqDw==
X-Gm-Message-State: AO0yUKV6lLptBv8QNJZaRl6jRGOkbh+AHeAwWDCrQ3WZcoo2BCP8PpQ5
	87qfzsmKPff6OoHMCrG9F0bIMByn
X-Google-Smtp-Source: AK7set9sq2bZPzy4KLStvSM2/bgSJXJIMkLMG5tGNW4TW0+MUHdsy8OyL9fr8AKgiq5kJIcDzpjZcQ==
X-Received: by 2002:a05:600c:3c83:b0:3ea:ed4d:38eb with SMTP id bg3-20020a05600c3c8300b003eaed4d38ebmr24571505wmb.24.1679071860295;
        Fri, 17 Mar 2023 09:51:00 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id y6-20020a05600c364600b003ed2c0a0f37sm2460106wmq.35.2023.03.17.09.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 09:50:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Luis Machado <luis.machado@arm.com>
Subject: [PATCH for-8.0] target/arm: Don't advertise aarch64-pauth.xml to gdb
Date: Fri, 17 Mar 2023 16:50:57 +0000
Message-Id: <20230317165057.1522743-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: VSQhMWSGDpaB

Unfortunately a bug in older versions of gdb means that they will
crash if QEMU sends them the aarch64-pauth.xml.  This bug is fixed in
gdb commit 1ba3a3222039eb25, and there are plans to backport that to
affected gdb release branches, but since the bug affects gdb 9
through 12 it is very widely deployed (for instance by distros).

It is not currently clear what the best way to deal with this is; it
has been proposed to define a new XML feature name that old gdb will
ignore but newer gdb can handle.  Since QEMU's 8.0 release is
imminent and at least one of our CI runners is now falling over this,
disable the pauth XML for the moment.  We can follow up with a more
considered fix either in time for 8.0 or else for the 8.1 release.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/gdbstub.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 78105b8078b..3bd86cee979 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -520,11 +520,18 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                                      aarch64_gdb_set_fpu_reg,
                                      34, "aarch64-fpu.xml", 0);
         }
+#if 0
+        /*
+         * GDB versions 9 through 12 have a bug which means they will
+         * crash if they see this XML from QEMU; disable it for the 8.0
+         * release, pending a better solution.
+         */
         if (isar_feature_aa64_pauth(&cpu->isar)) {
             gdb_register_coprocessor(cs, aarch64_gdb_get_pauth_reg,
                                      aarch64_gdb_set_pauth_reg,
                                      4, "aarch64-pauth.xml", 0);
         }
+#endif
 #endif
     } else {
         if (arm_feature(env, ARM_FEATURE_NEON)) {
-- 
2.34.1
