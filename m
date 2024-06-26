Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp922195njc;
        Wed, 26 Jun 2024 04:27:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUlUGBd7hPXqIBB6w3mQAH/Rs5+QEIHAsZEeoZZrsCE0bYL7o0m51oolHs0qVnhYPxPtrdleSM6QB+ugp7j/nnsR3M0jIom
X-Google-Smtp-Source: AGHT+IF4cjWPsWYFYfXnyf3v7pOQYvpmEq4lGisrQrC9nbVBtRSA3LN+E8qSNGeq16kU/RW245i3
X-Received: by 2002:a05:620a:414a:b0:797:8549:492 with SMTP id af79cd13be357-79be0c654cfmr1187587985a.35.1719401241885;
        Wed, 26 Jun 2024 04:27:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719401241; cv=none;
        d=google.com; s=arc-20160816;
        b=AFnbbGSfSq/DvezjZiHyeP7ERqjkI7rUjfKAopio9wD3biGq5Yx9Mz/zrxOaANJPQh
         8EqooVaskNxYwbXy8eb9bLRu1d1WedWwxosYPqhkmaKU9U7qsfZW2iPyb1yG+dEaI+cr
         KmEMczQ8hlOLZpUHnKsyE45I/Zn3/gI/wRB2u3SJaawXW3M6xKR8UsiYdC9u0EviQRNF
         Cm59U0WAcZ5VSy4rhFVH9vRz/pGyf3kUtogBQW3K1/Nr741alOQaR8Qr1h1Pci9ex677
         xBe6I5lf9BNm9J6Px+3X8aczHDaX/8w5ZZU/XggJzYryRVnrsOraSYZ0TFvA/pezQh3a
         WW0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:in-reply-to:references
         :message-id:content-transfer-encoding:mime-version:subject:date:from
         :dkim-signature;
        bh=QAAVV7bCGQjjP9Q56ktaETe+k2VzCQnfXSp/MUaPUxk=;
        fh=c2VRnSpESGsGjPrM5rLS4cVnVaUf5QloU0sTPhH1r5o=;
        b=WJrbaJ84zkUE0LrzqE5FXJ8V1XwDj89BKwfBnlIjPjRwVZnAfo6UdPHF6j+rD49j7k
         9p2UvoB7NtzlA6sr5DuQo76g4k13Ps7v0mNaHqSyqOcgc8H+Ub8eXPHyQNceYL6cG+rn
         H/hBdyWFZGfXTCrTKJWQX8Eo9zrQ8X+HzQ5I59YALON3Vc3AqtbmcN4zxMSwPeIyiLnz
         0f0rL0rCRmLKe2CAJQt5+4DbZhgbPfPX2IfO6zINt9tKw8vnTA7EC0K7Lkn7e7coaMqf
         jzz63FJ7cB+xlPC4XCazvukuDsfyl/NqtQAZTSy2avciCbLG/3C8olq4sx78jFXbFrMr
         Pprw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=rkp26W3x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79c03388b81si351465985a.69.2024.06.26.04.27.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jun 2024 04:27:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=rkp26W3x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMQnn-0002E5-Sx; Wed, 26 Jun 2024 07:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1sMQng-00023Y-37
 for qemu-arm@nongnu.org; Wed, 26 Jun 2024 07:26:59 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1sMQnd-0001oi-UC
 for qemu-arm@nongnu.org; Wed, 26 Jun 2024 07:26:55 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1fa9f540f45so1107805ad.1
 for <qemu-arm@nongnu.org>; Wed, 26 Jun 2024 04:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1719401211; x=1720006011;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QAAVV7bCGQjjP9Q56ktaETe+k2VzCQnfXSp/MUaPUxk=;
 b=rkp26W3xwffjM+NE6mkU65xj/xczqVZd0+PaGWcQzdP0bBx1BQFPCIBwPUonPI5HVE
 5nyL5jtp5bjjvoc0zHbapOLHI0/ENN/gpEkpAWGJRIlzmUs/9UD0jVjBMTvFC+aznAeo
 hsp1v8sY0MeTAQyjydVFO67YZ0E6482o4clSgKscj9/igd0uk9PnXBFEEPy1WhUsm17a
 Zm3PqqnbTXNoCoYc6Ew7sJ3cfTQBxnxiJ0FEI/mmZsCxDTPIQnPdCVnGbR3EgdZ2YgCH
 lJF6PNOkB/417UJssmS/E0Dk0sMU1gejjAP1XUv32sOhhi++JKtP6C5yOyiZD+GIooWr
 mwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719401211; x=1720006011;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QAAVV7bCGQjjP9Q56ktaETe+k2VzCQnfXSp/MUaPUxk=;
 b=PbnaQIagPHdOIrRYyiselVrfq00yefUx+D4Q6bHH+rxDXX28wK2WtVbML3OL+9fIoq
 tciWkzUbVANbJe3z6gt9xb6XnKS8aXi6FbMzDN0EiCNGqdgx0GnSyBHR5P2Ln0hoDFF8
 K9rZlyAM05iswKIuEblbrGfczSb+XPNwhKM7fGrD7NbQRbq+Ld2Vc7YNvpGl+itNSgzb
 U/TWe/EzoItF/7vuOFKZYkfBrdXS0MP4Zm4r5nnVuWmairQVNJ9KLwd+WweYO8e8PvyC
 /D4j7VtMi7YUvV5858fbJCoe8L0HO4EwYl/WfnfLRfL/Wbf/8y7105wqa3TTpnWUwUfX
 Qeyw==
X-Gm-Message-State: AOJu0YyrW8ycrLyXyDxrMVyV2EZwM5IiTvglj2tki4fm8qN/d8Oj4oLZ
 K86VpohZMY7Zl+AlWjQjEAeVlDgbTXVKx4upZSe6A8tHvzHujBUK21JA+EOT31U=
X-Received: by 2002:a17:902:e851:b0:1fa:cbf:c8b9 with SMTP id
 d9443c01a7336-1fa158f79b2mr137648795ad.38.1719401211264; 
 Wed, 26 Jun 2024 04:26:51 -0700 (PDT)
Received: from localhost ([157.82.204.135])
 by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-1f9eb323636sm96936345ad.102.2024.06.26.04.26.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 04:26:50 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 26 Jun 2024 20:26:23 +0900
Subject: [PATCH 2/6] tests/tcg/aarch64: Fix test architecture specification
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-tcg-v1-2-0bad656307d8@daynix.com>
References: <20240626-tcg-v1-0-0bad656307d8@daynix.com>
In-Reply-To: <20240626-tcg-v1-0-0bad656307d8@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3
Received-SPF: none client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UHo3iolULkWd

sme-smopa-2.c requires sme-i16i64 but the compiler option used not to
specify it. Instead, the extension was specified with the inline
assembly, resulting in mixing assembly code targeting sme-i1664 and C
code that does not target sme-i1664.

clang version 18.1.6 does not support such mixing so properly specify
the extension with the compiler option instead.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tests/tcg/aarch64/sme-smopa-2.c   |  2 +-
 tests/tcg/aarch64/Makefile.target | 12 ++++++++++--
 2 files changed, 11 insertions(+), 3 deletions(-)

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
index 70d728ae9af7..f53a1d615c21 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -27,7 +27,8 @@ config-cc.mak: Makefile
 	    $(call cc-option,-march=armv8.5-a,              CROSS_CC_HAS_ARMV8_5); \
 	    $(call cc-option,-mbranch-protection=standard,  CROSS_CC_HAS_ARMV8_BTI); \
 	    $(call cc-option,-march=armv8.5-a+memtag,       CROSS_CC_HAS_ARMV8_MTE); \
-	    $(call cc-option,-Wa$(COMMA)-march=armv9-a+sme, CROSS_AS_HAS_ARMV9_SME)) 3> config-cc.mak
+	    $(call cc-option,-Wa$(COMMA)-march=armv9-a+sme, CROSS_AS_HAS_ARMV9_SME); \
+	    $(call cc-option,-Wa$(COMMA)-march=armv9-a+sme-i16i64, CROSS_AS_HAS_ARMV9_SME_I1664)) 3> config-cc.mak
 -include config-cc.mak
 
 ifneq ($(CROSS_CC_HAS_ARMV8_2),)
@@ -68,7 +69,14 @@ endif
 
 # SME Tests
 ifneq ($(CROSS_AS_HAS_ARMV9_SME),)
-AARCH64_TESTS += sme-outprod1 sme-smopa-1 sme-smopa-2
+AARCH64_TESTS += sme-outprod1 sme-smopa-1
+sme-%: CFLAGS += -march=armv9-a+sme
+endif
+
+# SME I16I64 Tests
+ifneq ($(CROSS_AS_HAS_ARMV9_SME_I1664),)
+AARCH64_TESTS += sme-smopa-2
+sme-smopa-2: CFLAGS += -march=armv9-a+sme-i16i64+sme
 endif
 
 # System Registers Tests

-- 
2.45.2

