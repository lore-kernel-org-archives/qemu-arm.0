Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp915414lfk;
        Fri, 26 Nov 2021 08:39:18 -0800 (PST)
X-Received: by 2002:adf:a389:: with SMTP id l9mr15392999wrb.121.1637944757944;
        Fri, 26 Nov 2021 08:39:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637944757; cv=none;
        d=google.com; s=arc-20160816;
        b=yjP7zPuiEsjLI60DDgbVxTRC3ryEQW5URW3a7D3vJxcdYEIA58WtF0VOTr1jK5F33H
         0hXuYM0CcOgbD8Qx10vm/OSMOQSQIOpItGJng37PkXDj9oSCo8EiSkOwAQP8IylvioTZ
         L+1dVemhljdS96x3QA50yHn0jPX4tKSGxSn1elSscjwKL7n71w5dmVIH/+eBsXaUBhwP
         PizXKoXrWlOmWerrrtkj+1IRO8NJiFUS0V13F6uJaXvHnPTdBUWjVMOfFyVYMTcZ0WTh
         bOBneC7PNmh3MEQRmCdAP3iU+HsDlEmLzBoZJt6lex4mm6Hyc2h11o8mjw0OA7iBO5Yz
         naLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bhjDrhsvrUXt5l3q8ZZdjljlNarEl9ipYV1LbEcWSak=;
        b=MC3kAHdszVesBTswCRbcxTBGSaHTOHPJ5mesbABJwtfSFrcDt1AAX3Sm1galNe77R6
         RWdQRnCb0XnEYVB96RlmGbRwdvFXDg4d6yIVvafYgfBHNchSodVPkQWptJUN+zl1a0UW
         NPT8OOn967lz9jP2MZbS6QDwFmN9lDJFB1Qr5FHAG2Q7oFHRQ+N9OvIXl9n+3nEKL5j1
         6gFiCf7asew5fUw1pqvxKtPjzEHERy446wi65u5VXAOEtzfLWcEglG+M7w1XrS5BarSo
         1Rq9D0o/TybUtLewJuqbLuo674WSrlfAmYzAa66KWrn0r9Pgdx7fGoztpk0oCKPxzqz2
         8uqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qGOMVaNd;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x8sor4872641wrt.38.2021.11.26.08.39.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Nov 2021 08:39:17 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qGOMVaNd;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bhjDrhsvrUXt5l3q8ZZdjljlNarEl9ipYV1LbEcWSak=;
        b=qGOMVaNdqvhHAXikp16IX7mqVQElUQeazlaWlqbwGvR4NAe0KewNENn5hsNal55STy
         T9SmXu3XIwYIjmFerqoRfswhsxBhlPdX6FQ9LhMyHyt3Jq+VWvR7zgY1juiPXRie0imb
         8boazpIaB9x6ivwkyit2iEplqJCNRFnvSFL+R08j5/cNHGQrqmiY3Gs4FWLJJucpHyj3
         mtdoywl5gOjVqY3iwI9FVxf2kOoEa0eWAi4F1cuzYCyrzZ+ivoAHXBt8C+asH3410x9E
         918FF1NBwecFYycAxf0JFR9OXnoSf3uuu0XlGFRmRsdkL0C1Aw9wgz4B9Ld+XaIjaM/t
         9BHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bhjDrhsvrUXt5l3q8ZZdjljlNarEl9ipYV1LbEcWSak=;
        b=DulkW93VVD256i/i5vIGQhnaw6FdsZajexly+usaS2BBV+UnegjbgEG7jhDwQYU7Gy
         DsGsiuy3IjeT0CUiDNXTX+kQnY08kljG6uaeNeajoRkYj5TSoXUEOmjpKhR454MhSv9D
         rd1ItGRVWUhDDK5dhRdwkxEtupMpuoRv1gZC5+IE8D/xrYUdQ309As4IpYZK9nY0ak5H
         /ABBB0CChD9YUATtElS1PeZf9tysmAlcOMq/JciD1op4fSPEEpmScWG0j5WrNln6YUxv
         gji1Zd8BG8DupabfJRfQpxa/DYp37044Qpt6Wr4vkJJxqkcaOiPJTycHPQm1QaVLxKkI
         jqcw==
X-Gm-Message-State: AOAM532J0UtqQTG6ysCVyaWSP3ZD3kcqUz7jwtYxtOQVVhG4L6Om7a4L
	tO9XSh25f5e1Q7ZQ9mEWimqindSGI5SS1ooE
X-Google-Smtp-Source: ABdhPJxvUu8ApXpepidUF2X/eZse6cnVkA0PAkDKEOS4K0hCEy2NXFmZTTnmzY4FB062sCXPe+RRtw==
X-Received: by 2002:a5d:52c3:: with SMTP id r3mr15191292wrv.115.1637944757709;
        Fri, 26 Nov 2021 08:39:17 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id b14sm7837698wrd.24.2021.11.26.08.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 08:39:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH for-6.2? 1/2] hw/intc/arm_gicv3: Add new gicv3_intid_is_special() function
Date: Fri, 26 Nov 2021 16:39:14 +0000
Message-Id: <20211126163915.1048353-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211126163915.1048353-1-peter.maydell@linaro.org>
References: <20211126163915.1048353-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: iFYY3kLl/dIa

The GICv3/v4 pseudocode has a function IsSpecial() which returns true
if passed a "special" interrupt ID number (anything between 1020 and
1023 inclusive).  We open-code this condition in a couple of places,
so abstract it out into a new function gicv3_intid_is_special().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h  | 13 +++++++++++++
 hw/intc/arm_gicv3_cpuif.c |  4 ++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 70f34ee4955..b9c37453b04 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -411,6 +411,19 @@ FIELD(MAPC, RDBASE, 16, 32)
 
 /* Functions internal to the emulated GICv3 */
 
+/**
+ * gicv3_intid_is_special:
+ * @intid: interrupt ID
+ *
+ * Return true if @intid is a special interrupt ID (1020 to
+ * 1023 inclusive). This corresponds to the GIC spec pseudocode
+ * IsSpecial() function.
+ */
+static inline bool gicv3_intid_is_special(int intid)
+{
+    return intid >= INTID_SECURE && intid <= INTID_SPURIOUS;
+}
+
 /**
  * gicv3_redist_update:
  * @cs: GICv3CPUState for this redistributor
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 3fe5de8ad7d..7fbc36ff41b 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -997,7 +997,7 @@ static uint64_t icc_iar0_read(CPUARMState *env, const ARMCPRegInfo *ri)
         intid = icc_hppir0_value(cs, env);
     }
 
-    if (!(intid >= INTID_SECURE && intid <= INTID_SPURIOUS)) {
+    if (!gicv3_intid_is_special(intid)) {
         icc_activate_irq(cs, intid);
     }
 
@@ -1020,7 +1020,7 @@ static uint64_t icc_iar1_read(CPUARMState *env, const ARMCPRegInfo *ri)
         intid = icc_hppir1_value(cs, env);
     }
 
-    if (!(intid >= INTID_SECURE && intid <= INTID_SPURIOUS)) {
+    if (!gicv3_intid_is_special(intid)) {
         icc_activate_irq(cs, intid);
     }
 
-- 
2.25.1
