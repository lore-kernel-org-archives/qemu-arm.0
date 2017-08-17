Received: by 10.223.183.22 with SMTP id l22csp80905wre;
        Thu, 17 Aug 2017 16:01:26 -0700 (PDT)
X-Received: by 10.99.99.1 with SMTP id x1mr6418848pgb.153.1503010886068;
        Thu, 17 Aug 2017 16:01:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503010886; cv=none;
        d=google.com; s=arc-20160816;
        b=df1/acsAdZhv0qOHPDmMIMTsdPhBntKAfyUptgzd99mLSfKUvIhT7QHuLe/q4zWuZF
         le7NOxxtrNNMklznpQOr5npzCpUQdHyi3r95CwAf7+/S7EvxgP90w/c2lb8HRWW0D0xE
         7SDQKDnTCymGKS1GUWWIzYgYuCizEE0iL8TIPh5HfUF96ODKEaVvo9NF50S/tan8iLKi
         sBqToYzzid3m4AbeBzX9g0pgTVrgh3/NOoE44NJBe4x/SW7kJov0IDlPAXqW9ZWWTs7G
         EDakhDGG1uFu3V9mNdxGcSvj/nobyEp3AKMFdK2UXYFprMgIANQ4p54MlDBqNOi8Hloi
         JSYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature:arc-authentication-results;
        bh=dpdlyo3XtVpsa3ftb6C8wRlu5yzXE0Obkds6jVxb5hw=;
        b=UhMHQaKdRelb9AVdMygijgyx2ujKHiuOIY37/cEaCUYoPDvjNntG/7EnebzU85HQ0i
         lsBNUR2Fjfm1nHprL5fh/XZ+hePlZ2uJiZkp3GI613zh2BMfBpRQv5SC9hT8jz6oDpoV
         ar/scFqEsRyRpm3gEi/A38IZdL+jeYQby67Qrq/qmZuLV0jgYv9XH4IMTRTEwV9R/+qc
         L6TMc4naKRPRyJUaIt/4VwuqAO987PCBhlorsVZQZ73FCb5VvLGZT929BcxTCg5OgzMF
         tH7CWjVDFBUQhvqNGaP9QBiGxzGD2n+slB5J0Z1fGAg/3nwsRK8xT8e3HCwSLlQ6zaet
         xqWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NYmCuYgE;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::231 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-pg0-x231.google.com (mail-pg0-x231.google.com. [2607:f8b0:400e:c05::231])
        by mx.google.com with ESMTPS id h3si2853546pld.341.2017.08.17.16.01.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Aug 2017 16:01:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::231 as permitted sender) client-ip=2607:f8b0:400e:c05::231;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NYmCuYgE;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::231 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-pg0-x231.google.com with SMTP id t3so23904336pgt.0
        for <alex.bennee@linaro.org>; Thu, 17 Aug 2017 16:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dpdlyo3XtVpsa3ftb6C8wRlu5yzXE0Obkds6jVxb5hw=;
        b=NYmCuYgEnbczxXFGsRPIauPB+03hnctKKtTaOoKZa/Yek3w5jieLYsou8TgpIhmJ1o
         RFdWq32rcqfaZdS8/7R9H5HZPnuhWF6LajCpasBijtif4pxANchy6RgjHRZnZeX5TYRR
         4aim+tHJHsAEv80MSBeZJW1bQMHHRUpXc+Ow8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dpdlyo3XtVpsa3ftb6C8wRlu5yzXE0Obkds6jVxb5hw=;
        b=huTAMjYpdO19siq/Pse55IkiGFLlQznv6YJ0xQ+3VNVyKjVLW6LU19QGR7+08DrAYX
         7Zme3He6/VGEvlPoh43NW9YvGC/u0+vcPmkf9atjC0xt1R3zO0xhZw6Zkvs2LMfvhgVh
         hQxQDHxVUI5ltDLuBQH79T86Js9fl86qV/x5EGZTRxSI6jOqtFmc6f38MskqMFRZlfO2
         B0V/egtjQDh1A7XyAmE0kDrN4iVCmoUgyEiodFc7dMac0HF5co2gTCRzLrxN5zLL78tg
         4rFMDKqaDh8n4YkbksDs1NJSJUSbN0z7Bywz7Prl9YuWWmoogfApB2Ku1Q5LKnFr9bkk
         YUsw==
X-Gm-Message-State: AHYfb5gET//5HLYPGwIhRTBDo3SsySEhB/9fBPxewGmsillvq3CO6mBJ
	HhKuoH0BRUWC8d4uAcQ=
X-Received: by 10.98.14.93 with SMTP id w90mr6909429pfi.298.1503010885018;
        Thu, 17 Aug 2017 16:01:25 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net. [97.126.108.236])
        by smtp.gmail.com with ESMTPSA id c23sm5190043pfc.136.2017.08.17.16.01.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Aug 2017 16:01:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 6/8] tcg: Add INDEX_op_invalid
Date: Thu, 17 Aug 2017 16:01:12 -0700
Message-Id: <20170817230114.3655-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170817230114.3655-1-richard.henderson@linaro.org>
References: <20170817230114.3655-1-richard.henderson@linaro.org>
X-TUID: bxzP0OEqlnLz

Add with value 0 so that structure zero initialization can
indicate that the field is not present.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-opc.h | 2 ++
 tcg/tcg.c     | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/tcg/tcg-opc.h b/tcg/tcg-opc.h
index 9162125fac..b1445a4c24 100644
--- a/tcg/tcg-opc.h
+++ b/tcg/tcg-opc.h
@@ -26,6 +26,8 @@
  * DEF(name, oargs, iargs, cargs, flags)
  */
 
+DEF(invalid, 0, 0, 0, TCG_OPF_NOT_PRESENT)
+
 /* predefined ops */
 DEF(discard, 1, 0, 0, TCG_OPF_NOT_PRESENT)
 DEF(set_label, 0, 0, 1, TCG_OPF_BB_END | TCG_OPF_NOT_PRESENT)
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 3c3cdda938..879b29e81f 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -756,6 +756,9 @@ int tcg_check_temp_count(void)
 bool tcg_op_supported(TCGOpcode op)
 {
     switch (op) {
+    case INDEX_op_invalid:
+        return false;
+
     case INDEX_op_discard:
     case INDEX_op_set_label:
     case INDEX_op_call:
-- 
2.13.5
