Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp463960njm;
        Sat, 29 Jun 2024 01:56:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVlrD6JLHTfQSrHDRUyXhqfHZcMujx0lJoJkpEtJ2rMQw60pnB9zDTSLk0Ay0DAIxS2HSrvekcPXjmOOukmDOhRkaHGI119
X-Received: by 2002:a05:6808:1446:b0:3d5:658b:be39 with SMTP id 5614622812f47-3d6b4de2654mr633820b6e.38.1719651403602;
        Sat, 29 Jun 2024 01:56:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719651403; cv=none;
        d=google.com; s=arc-20160816;
        b=m17bdidfj1q0cUT1xuJeM4OEvCJOFv/z6C4YvCP8W1LEqr+IJRUzsYPTUtL8Io0rKG
         pqRNVzmlniRHaPTkAwIAFjCvygYT0PPt76kHqtNFiSM9jZRuKCRPeWQs7OXZ258xduyb
         Joj23I7KW5r/eDK/XEe/4wlNIaiFKKOhQPGF12No27o8pWsS9oTI97eh75KGFEWNNLOY
         x+k5OfF6iyGM9ztTUfFa6ennLK3ohuNM2wue1Ji7ugdceka/1NLxrOZ/A7ivAoT/4l6r
         PsYVsL5XbJMtIbAlXhKK243+z7KyERlY5jSPeoYe1jZYcg6XB/BpO84ASlzDHrfRINaz
         fcpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=JoZEFutlkhBaaeS7Srf3QSHs/2P96eJP2zssQxT6y9M=;
        fh=/3OatlmOs6+SF5E3HmbeRSw2BtOaZgUT+smgfMj+Ojk=;
        b=hyAQHgs+OOM5FPU+WcXVXhk10KXpePYCj5pOTl4QAOLg7/YCgiOy7eXvKcif9+5HaH
         qGrxl1RAxx0iXAZp+O+cXA3N1FnvcalWGQoU2r8BsJJZWk/DQi73aOXG1c3BAq/viZqI
         EGabRsXAr27kyJp1kTRbKNfkabtW4kC3Sjnjq8lN+/O8vTMAkaQXGbwKjU1irXCiDHcX
         I4Xpvbk439rHFxbcNbB+WEGRpoeOAVJ4hkHHu5Xiv2GW4KXn9qaHxXuqebM4deRCvCPn
         V3fMGd3FLAArs79ofu8nFoP+yLCnOpdBsUv/ZwQKRvpU+ggiyM29OweaRbdq5x54Qika
         /frw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=QZbm30W4;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5614622812f47-3d56779131fsor2581349b6e.16.2024.06.29.01.56.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 29 Jun 2024 01:56:43 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=QZbm30W4;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1719651403; x=1720256203; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JoZEFutlkhBaaeS7Srf3QSHs/2P96eJP2zssQxT6y9M=;
        b=QZbm30W4N5baM3iMFq2LSPw/uICjaoCDafzSf0dCa0ecgl4Ozee+N/nYnzVzDcM7dX
         id+nPpu7C29bewDcPYhjNQhomZrFks75rByhdXgq3L+3yiv3NmR7zXCYrJmF9VontgRx
         Xg/Wyov+31H3EBIMI2QNJBBR03z///NQ4Qf31EpsuCMllysckBeU9nl5jJUYsee0eN4V
         TAnInl5kbp0CtQ3q5RlRCHM1kWCCdhT90fneydIDo2zfT+e8vy1WPULK5MoDI8hZPhGJ
         ZKFjZt+88s3m5GzhOQAxBsFg6lXI0H3I6/BXJWln7tvmlJwxW9XvnJLrwiJN1qKRmPlZ
         P06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719651403; x=1720256203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JoZEFutlkhBaaeS7Srf3QSHs/2P96eJP2zssQxT6y9M=;
        b=s2zt/CzweJ6o7s4TYS9cygi6J/6WjB3ZEW6MPbB4shDZkiIpACnwovYSDqus0IMteP
         1VUFJJH9YE5p59RsR/6yvvKM3iFMQ/tILoVyVFBj999cjIKA99g/IvrAWUB+z+i1HbQm
         Y0ezWBvsnqvbWxdcaU7HmB00b8/y4AtydvhM4+jiloi0tiLZjTpHzRz5QvuY5RTBwSR0
         q47EQCGUePBFAVmjGOeBwqbY+ocJyT1a10cjf1HoUWXZ9jyrlEs1NNDYnucYKLWY7Vb4
         6QyEvEHHttITjdg9hPw2XpaJrRFEy78iYkhPxo+4p4I9IS0ytigpBToy3IPZeyBtu4jS
         nbLw==
X-Forwarded-Encrypted: i=1; AJvYcCXszCtTHA/1HbpMSg4soGm8K44tFJZJBEizUHHR1T9IXQVuDuLVpFj1kHmikwokN/QekzBgQTICLs2OEXjhXnl2xmd8nOW3
X-Gm-Message-State: AOJu0YwVA+llFtsNxr6C+R88zYZEawwLNurknLraMahQjarY5FvtCIo+
	O4Hqa9QYDNs98xYR0M3VkskRBIM2DTruhPPvetsFwRYQ+bire782FJvIB3NzZk08oBjMGytPPRu
	Qcgc=
X-Google-Smtp-Source: AGHT+IH7uod4cU1nnorN+UBUAj/YL5C6Ev6xxDPF4aWcN+NPMfKNyg68J4qXvy2EA8xjqzjdXYcLHg==
X-Received: by 2002:a05:6358:4327:b0:19f:4ca6:86c2 with SMTP id e5c5f4694b2df-1a6acf39c25mr59803755d.25.1719651403110;
        Sat, 29 Jun 2024 01:56:43 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([157.82.204.135])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2c91d3eb9bbsm2882725a91.57.2024.06.29.01.56.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 01:56:42 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Sat, 29 Jun 2024 17:56:29 +0900
Subject: [PATCH v3 3/7] tests/tcg/aarch64: Fix test architecture
 specification
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240629-tcg-v3-3-fa57918bdf09@daynix.com>
References: <20240629-tcg-v3-0-fa57918bdf09@daynix.com>
In-Reply-To: <20240629-tcg-v3-0-fa57918bdf09@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3
X-TUID: 7x4Yg48EmB4C

sme-smopa-2.c requires sme-i16i64 but the compiler option used not to
specify it. Instead, the extension was specified with the inline
assembly, resulting in mixing assembly code targeting sme-i1664 and C
code that does not target sme-i1664.

clang version 18.1.6 does not support such mixing so properly specify
the extension with the compiler option instead.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tests/tcg/aarch64/sme-smopa-2.c   |  2 +-
 tests/tcg/aarch64/Makefile.target | 18 ++++++++++++++----
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/tests/tcg/aarch64/sme-smopa-2.c b/tests/tcg/aarch64/sme-smopa-2.c
index c9f48c3bfca2..2c9707065992 100644
--- a/tests/tcg/aarch64/sme-smopa-2.c
+++ b/tests/tcg/aarch64/sme-smopa-2.c
@@ -14,7 +14,7 @@ int main()
     long svl;
 
     /* Validate that we have a wide enough vector for 4 elements. */
-    asm(".arch armv8-r+sme-i64\n\trdsvl %0, #1" : "=r"(svl));
+    asm("rdsvl %0, #1" : "=r"(svl));
     if (svl < 32) {
         return 0;
     }
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index d3e739b566d9..0a527a9821c2 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -30,7 +30,8 @@ config-cc.mak: Makefile
 	    $(call cc-option,-march=armv8.5-a,              CROSS_CC_HAS_ARMV8_5); \
 	    $(call cc-option,-mbranch-protection=standard,  CROSS_CC_HAS_ARMV8_BTI); \
 	    $(call cc-option,-march=armv8.5-a+memtag,       CROSS_CC_HAS_ARMV8_MTE); \
-	    $(call cc-option,-Wa$(COMMA)-march=armv9-a+sme $$fno_integrated_as, CROSS_AS_HAS_ARMV9_SME)) 3> config-cc.mak
+	    $(call cc-option,-Wa$(COMMA)-march=armv9-a+sme $$fno_integrated_as, CROSS_AS_HAS_ARMV9_SME); \
+	    $(call cc-option,-march=armv9-a+sme-i16i64 $$fno_integrated_as,     CROSS_AS_HAS_ARMV9_SME_I1664)) 3> config-cc.mak
 -include config-cc.mak
 
 ifneq ($(CROSS_CC_HAS_ARMV8_2),)
@@ -71,10 +72,19 @@ endif
 
 # SME Tests
 ifneq ($(CROSS_AS_HAS_ARMV9_SME),)
-AARCH64_TESTS += sme-outprod1 sme-smopa-1 sme-smopa-2
-sme-%: CFLAGS += -Wa,-march=armv9-a+sme
+AARCH64_TESTS += sme-outprod1 sme-smopa-1
+sme-outprod1 sme-smopa-1: CFLAGS += -Wa,-march=armv9-a+sme
 ifneq ($(CROSS_CC_HAS_FNO_INTEGRATED_AS),)
-sme-%: CFLAGS += -fno-integrated-as
+sme-outprod1 sme-smopa-1: CFLAGS += -fno-integrated-as
+endif
+endif
+
+# SME I16I64 Tests
+ifneq ($(CROSS_AS_HAS_ARMV9_SME_I1664),)
+AARCH64_TESTS += sme-smopa-2
+sme-smopa-2: CFLAGS += -march=armv9-a+sme-i16i64
+ifneq ($(CROSS_CC_HAS_FNO_INTEGRATED_AS),)
+sme-smopa-2: CFLAGS += -fno-integrated-as
 endif
 endif
 

-- 
2.45.2
