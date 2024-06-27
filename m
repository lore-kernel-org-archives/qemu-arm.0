Received: by 2002:a17:504:c7cb:b0:1be7:c013:c773 with SMTP id cj11csp248434njb;
        Thu, 27 Jun 2024 06:58:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWZf1zmKms2FBUpC7kWBUVe9po6FGNAbwe4M0coOJIGJGDpn7OojSuwdoYZBmtHwvJmZS0H9ZKjXy/J+LqhzG6nPm7RRLjO
X-Received: by 2002:a17:903:184:b0:1fa:918e:ecd with SMTP id d9443c01a7336-1fa918e118amr57572835ad.68.1719496701208;
        Thu, 27 Jun 2024 06:58:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719496701; cv=none;
        d=google.com; s=arc-20160816;
        b=ANb4rqIIHyjAczTTf/41uhNcP5SG55YWdlz+N8oV76FeZHIQqSGhW0CcMqDCbmLwCx
         USNKIxBlCPW2fBNNSozTNYaKAxcXF5lLJlWwu3ekCOljGjIRqUadkwPuA0CrajYjjhEv
         voIZiLDP3B4yw/yviKIbJUsXlqeFMFtHOa8MYIgAiKZAUnZS6D3kxAt6OFOMirPOhIwq
         SGDHMLsBRcqrPVbc4dR9EY3E95yWcFX4Bwp3Cw8QPLxSjiXCvsAPIty+2ZLFbtQ8cUrG
         7ImCPlwTbTCSVbfoJ+etrss966VETXkUcMGXX+rFhDjv9Xnf3iHJ9jurC3uNBLYnTTsl
         f6rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=tmHLAd4iwYsP/x6+8JTBgWg+UXfKosXtWEII2F/7Uyk=;
        fh=8C/C+h8pSY9RKZ22EUSuQr6qAb+H56PPPiGsgoDQLnw=;
        b=csK+gRDGyBvrfesqH3nL77sTrR/qs6Xv5yal8gfZFBGwGehucDcpwE8Q8xTFl8yndx
         xff5FMP47dRD6itsdjWqJ69LRW0rjvCrppLSkVKMjXtDHGp1qkPeInVKWVrCwwtnn6iO
         aljDgiF3CuS4W2oe63mmLey7XaFpKFgVT35sSHdeqPWUcIqcywTvMmbi8PGRqZw2Pc68
         pfItQ39l885vF8y7V/mpYLwki6mkWLfwp1E8L2BpRMzGtjEZ1ZnCPFfdW/arIOjc2uKS
         nC30kHp6lpW8ypre3QBdbZU8Nr7P5GIrzu47xaR7X4V3h3mvi67cQ6fq3pKE5P0eTrdv
         0UXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=SsvgM49q;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-1faac6c5872sor7081535ad.1.2024.06.27.06.58.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jun 2024 06:58:21 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=SsvgM49q;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1719496701; x=1720101501; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmHLAd4iwYsP/x6+8JTBgWg+UXfKosXtWEII2F/7Uyk=;
        b=SsvgM49qedJPbsvhc4orm0BBEGcABm4bN9KbGo4iRHfZPiWITpPOIV23KSy+Ga8kYJ
         kphEM18vkorzisPyJmLrHZaz4PB3yt7HxmaGPl3tbUXjCxECS8mwOKl7fpoIIiGweCTh
         oNMMbu4lKtsXoJ2ObnO2/GGvDoYrZ9FmZ5veXbKu/izlhU5Ce/1CL4zB5JP7QLFEB3Ii
         kIp5W4rtPMVpCcKLbF3fIRyQVmiQq17xaj7iodp20rsikeKlejNDJ4uDaj/dQu3Z+u0K
         nSL24uI4hiwLEK7Rk8WHfLVDjqbLydCHnopCASPQgRLCePpUfGFJX7w9+tGl1WrUWltx
         ZkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719496701; x=1720101501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmHLAd4iwYsP/x6+8JTBgWg+UXfKosXtWEII2F/7Uyk=;
        b=TfUNhuQlFZP3QMsTlXRoqodta0Vw4Vcs/OO4slzhPCA0OLNqBABzpgnx8fNy8MUjGo
         nKnFg073QORQAuul5fpcB0rmTAAJjXx1Zd3x2lgngzZX+uOiShbyebLN38ZjNyhTXDIG
         9fT88vNTEq+ryy0dCPIwLYB1evmhrN089b2vCQIa9077ObSzrLsC9TzqJgMUnrBXg0NS
         VhafoMT/4ldVfIprz6rrLSu2pJd7DdUguveDz387/nySTM/2wR99DnDgpYbluq5nVMez
         ECNg5MdEMWC7nRSeM6XrntS4EVapLWIBGr6qEO0rv6cshcSEBDyWyB27wi/ta2gs+6PG
         WRDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9dWngYidPTzeLKJgglYH2npiIPhxGvCe/s+hBnsdvFzPJ0DPozhsgmd5JtFotysTIdIsP19c0p89ocMevvJ114/9MUIAq
X-Gm-Message-State: AOJu0Yw4K/0IRO2SpvNXQqU/OTvRPiFUynhYACSksgex43zglZQY3iWB
	3VpUZIL/yEPg3cvdvC3arZbPS6Ddg1phvntiz3T5LVFaEP2TPKRSe3J71YianO8=
X-Google-Smtp-Source: AGHT+IGeURGVHdKCNIAuCEg1i4vW6FoDiAihGtDvnSSRW1/TKoF3Fw3lq6S6cNqJp7BXjwkGaQ6Rtw==
X-Received: by 2002:a17:903:1110:b0:1fa:918e:ec2 with SMTP id d9443c01a7336-1fa918e10f4mr64242515ad.57.1719496700795;
        Thu, 27 Jun 2024 06:58:20 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([2400:4050:a840:1e00:9ac7:6d57:2b16:6932])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-1faac997f0dsm13461055ad.219.2024.06.27.06.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 06:58:20 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Thu, 27 Jun 2024 22:58:03 +0900
Subject: [PATCH v2 2/6] tests/tcg/aarch64: Fix test architecture
 specification
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-tcg-v2-2-1690a813348e@daynix.com>
References: <20240627-tcg-v2-0-1690a813348e@daynix.com>
In-Reply-To: <20240627-tcg-v2-0-1690a813348e@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3
X-TUID: cfqrHn/AnLGg

sme-smopa-2.c requires sme-i16i64 but the compiler option used not to
specify it. Instead, the extension was specified with the inline
assembly, resulting in mixing assembly code targeting sme-i1664 and C
code that does not target sme-i1664.

clang version 18.1.6 does not support such mixing so properly specify
the extension with the compiler option instead.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tests/tcg/aarch64/sme-smopa-2.c   |  2 +-
 tests/tcg/aarch64/Makefile.target | 11 +++++++++--
 2 files changed, 10 insertions(+), 3 deletions(-)

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
index 70d728ae9af7..ad99e0e3b198 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -27,7 +27,8 @@ config-cc.mak: Makefile
 	    $(call cc-option,-march=armv8.5-a,              CROSS_CC_HAS_ARMV8_5); \
 	    $(call cc-option,-mbranch-protection=standard,  CROSS_CC_HAS_ARMV8_BTI); \
 	    $(call cc-option,-march=armv8.5-a+memtag,       CROSS_CC_HAS_ARMV8_MTE); \
-	    $(call cc-option,-Wa$(COMMA)-march=armv9-a+sme, CROSS_AS_HAS_ARMV9_SME)) 3> config-cc.mak
+	    $(call cc-option,-Wa$(COMMA)-march=armv9-a+sme, CROSS_AS_HAS_ARMV9_SME); \
+	    $(call cc-option,-march=armv9-a+sme-i16i64,     CROSS_AS_HAS_ARMV9_SME_I1664)) 3> config-cc.mak
 -include config-cc.mak
 
 ifneq ($(CROSS_CC_HAS_ARMV8_2),)
@@ -68,7 +69,13 @@ endif
 
 # SME Tests
 ifneq ($(CROSS_AS_HAS_ARMV9_SME),)
-AARCH64_TESTS += sme-outprod1 sme-smopa-1 sme-smopa-2
+AARCH64_TESTS += sme-outprod1 sme-smopa-1
+endif
+
+# SME I16I64 Tests
+ifneq ($(CROSS_AS_HAS_ARMV9_SME_I1664),)
+AARCH64_TESTS += sme-smopa-2
+sme-smopa-2: CFLAGS += -march=armv9-a+sme-i16i64
 endif
 
 # System Registers Tests

-- 
2.45.2
