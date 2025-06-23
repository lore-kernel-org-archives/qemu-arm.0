Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2510177dyb;
        Mon, 23 Jun 2025 05:20:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXQYZFcQRvWkxDBxIUwcIiLVUOddhUtHkl+5Id33bNEgu97JQdi07LI0mKAdkbSvBOLAC6NwnZTCF8R8A==@linaro.org
X-Received: by 2002:a05:600c:1d14:b0:43c:e7ae:4bcf with SMTP id 5b1f17b1804b1-4536b4be314mr77888755e9.0.1750681235510;
        Mon, 23 Jun 2025 05:20:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750681235; cv=none;
        d=google.com; s=arc-20240605;
        b=CSdemLAxT1Mf7eOxx3ZNsyhngDUbe7rpIJTPt/r60DqCflVvbs1elGq5IE5UFUC6LM
         Vc/cSXigIXv7rJcFf3LZtWUZLr1SIBKJHoTFpKgtJPSDTpPQSxxFsdx3st6iL1S+hHpz
         k++OYBNfXEkZRzSyMeHt/jQu7doY0oe60+AgoOSC6Yi3wXuogBv8bhqDDqHknzG2ILeP
         +4F+VT57dA15+woo2d+SR+Fpzm+4upeTHBL6Yie4E24E38eMwBh/ul1dwWbxnvCyffNQ
         /8KdFleZhbOFv8WJZ7K6bXzJ/Zs6Br/KnL/lSaA6IEc/k22jsxVAAxYoZ7vchWA0f6It
         vSjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=X1avEvgULJGN3+NnzgbjknnR4xz+wRJgrCM6KmdqT58=;
        fh=O8g4QtOEjYxWVE5+6MM2iv/Ejkrihwovd0/6RH9khN0=;
        b=K0yL85Cp1rkfo4JVGpGDqm1GgMRQ/wZ6QRfjP6GAKshdT2dnwBbMmcHWbQVtXQi3RR
         pe8/j1Usb4hvIBCcMWhkoFWx254hqLdrJ5d4XrgdxbrL0dno4VWBYgH7gR6/FziGsI+N
         kQ7+G2BOS+KX7ABODNkhYFNxUF5TSBo9r6ohiNl1Jrg8RTvYd8ntoT9s7wOkN5R5u/fj
         BEzH1QsPLkfOm2ua90z+Iq5o7meD9l6m2LV7rFMgA+ronsBIkdhWFpkQcjPVYawpOoHl
         S22G6tbx1gR8SkN3/iAVaV9j7emwH/we7nOSDqwKxXiMXS9lH1qROgT+Frp51THnf5Si
         GFyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dlykvs35;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-453646cfbeesor23846605e9.2.2025.06.23.05.20.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 05:20:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dlykvs35;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750681235; x=1751286035; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1avEvgULJGN3+NnzgbjknnR4xz+wRJgrCM6KmdqT58=;
        b=Dlykvs35ptSV9EiqYyAZVcBcV5FsgGVdKfKtpz79QUwGL0dBtVLOwYE3KlWGgZAIvA
         88vHWjmvFHxQ24mWyNMJgBrlNx0VnqPr1qJsvTtVI4JcY1Ga0d+EVg0+fHYCNWRoZb83
         kaJqn2akCJG0P7caSw1ko7IAcB0Imzrorms4rYHDKoktE/PkeVls+GpUG4DyJGudFs3K
         JrybzKwC/gmrcKm5A1vqdWY7j0tyxHx3aNyIGt8fRfiByEIfbsGwdgPB1YyOPw8781hp
         JDo0j1vmmUm+P6bRswVf8kq4BIabaZT7pfZUbrcHL7KDrN6rgsMqCeasLoGolZ8HDfYh
         SoNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681235; x=1751286035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X1avEvgULJGN3+NnzgbjknnR4xz+wRJgrCM6KmdqT58=;
        b=qV8xhBXDc/t4WfF7AZOoFHd3dyfhRAND0Al1pM5AIKW3ZWrxA7zZF8TSrkx25JpsT0
         hJOX0IqHoJwZtJpMd7sUYv8JUYFwM273BQ1z64k/bMcxdupCweEfLKLUxn22d58dpchd
         PN3NssrzPsMfDuWqe3T8H5fxGdoLdSzDSk/CKg5GIYXVPcBoVzbThSp9E5CfJ0wNxB80
         tQnZ2oeDbOVxGLudnp3MF7+GBRuwS8fV/Q8kaN0Bh0K6K+RI4Ls2yjPI8dkLPvmdJthO
         +wNsaTLmJEa25yArHEOM0RtdZEL1WZaGPb24O9ja74nK52DhY3YbnoYDhDBg31U02bqK
         HL3w==
X-Forwarded-Encrypted: i=1; AJvYcCXhO890LRhZpblRSiiWrdGz/8EdJEBFnuZBawjLY3KAytdRN2gqWkSPK2nIe2Xvh6ZdfVsHpWJEq4JLSQ==@linaro.org
X-Gm-Message-State: AOJu0YyHXc9K95Fu1530Hg3FNQr/DKyjrnKCuVbq2Wh9lG/Ovg9Ebnaf
	9IL98+/Sijbv/31RAcL8410bDi7yG3myneYeSfPB6S5+V3GBtRWrALvup0iQLBeQL6UWpw==
X-Gm-Gg: ASbGncujBjwF5LnEstFMg/3hmMu67AZ7ppvhnBiB8T+fuNm12x9sAw431apdlVckk9y
	kMsTZnGBjXl8H769DXygwoqtZkY1OblK2/ANtzairItTReevdejssfLPXAYREOZf0a+nPHpc1Jh
	cXJUkcSHQfnWPz8ENlsYD2pi7pXl9SJ6PjMVcpqPieFEZrDUGMTkLtIx5mvfeBAjCZrzxFIkvO8
	cVcq9dFsdSY2m7EWcwfvO/VhyMDv1FFgYciUMrUwsbXB6ppDFc3iTbmn2w/atu9HyfmkUSQ3grF
	pJOgN/6txfTjxWYm6XQHIzVH4womSfjZtFQanh6lzim5yRtHWXjWvhKrz21JUY2b7xRXPJ082xK
	zx6bRTJKwj2uUg83pGjIdAR5LqPNoTTcoAYin
X-Google-Smtp-Source: AGHT+IGfmWKuPWWupTZ/ZnEeVOjJmb/p1NM+3sPwfupLNJuwEpOvWNKETdLlJnkiht7JLvtuJ9EAAg==
X-Received: by 2002:a05:6000:40c9:b0:3a4:e2d8:75e2 with SMTP id ffacd0b85a97d-3a6d132fbfamr8548741f8f.50.1750681234897;
        Mon, 23 Jun 2025 05:20:34 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f18a29sm9449877f8f.36.2025.06.23.05.20.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Jun 2025 05:20:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Bernhard Beschow <shentey@gmail.com>,
	John Snow <jsnow@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	kvm@vger.kernel.org,
	Eric Auger <eric.auger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Cleber Rosa <crosa@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 21/26] hw/arm/sbsa-ref: Tidy up use of RAMLIMIT_GB definition
Date: Mon, 23 Jun 2025 14:18:40 +0200
Message-ID: <20250623121845.7214-22-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623121845.7214-1-philmd@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: GebfzS/h2ZcW

Define RAMLIMIT_BYTES using the TiB definition and display
the error parsed with size_to_str():

  $ qemu-system-aarch64-unsigned -M sbsa-ref -m 9T
  qemu-system-aarch64-unsigned: sbsa-ref: cannot model more than 8 TiB of RAM

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/sbsa-ref.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index deae5cf9861..15c1ff4b140 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
 #include "qemu/datadir.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
@@ -53,8 +54,7 @@
 #include "target/arm/cpu-qom.h"
 #include "target/arm/gtimer.h"
 
-#define RAMLIMIT_GB 8192
-#define RAMLIMIT_BYTES (RAMLIMIT_GB * GiB)
+#define RAMLIMIT_BYTES (8 * TiB)
 
 #define NUM_IRQS        256
 #define NUM_SMMU_IRQS   4
@@ -756,7 +756,9 @@ static void sbsa_ref_init(MachineState *machine)
     sms->smp_cpus = smp_cpus;
 
     if (machine->ram_size > sbsa_ref_memmap[SBSA_MEM].size) {
-        error_report("sbsa-ref: cannot model more than %dGB RAM", RAMLIMIT_GB);
+        char *size_str = size_to_str(RAMLIMIT_BYTES);
+
+        error_report("sbsa-ref: cannot model more than %s of RAM", size_str);
         exit(1);
     }
 
-- 
2.49.0
