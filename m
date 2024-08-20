Received: by 2002:a17:505:4e90:b0:1be9:327d:8ee3 with SMTP id y16csp341282njx;
        Tue, 20 Aug 2024 07:30:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWoa2KYFkNvsENr/mCIZJo+2KkH0/01fwZD5Rb/O2nUs6MSIZMX0L3cuqDGoRH7Gllgt5BbZtzyTgTg6w==@linaro.org
X-Received: by 2002:a05:6512:3b21:b0:52c:df8c:72cc with SMTP id 2adb3069b0e04-5331c6d98d3mr9093290e87.43.1724164203103;
        Tue, 20 Aug 2024 07:30:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724164203; cv=none;
        d=google.com; s=arc-20160816;
        b=zVi3WYSMkwyrKTLuJFtLSHD1PPafNIoAsAY7ncUbB2bIfUM1Sv6dYHeuxhLrY7TZJc
         DWy0m3AwakFANfdkNwEihb0AFGiecIivcrBm1JqdQ3W6Y1xKt/pO88PRju4SkT4Mit+/
         9zrY2RfDb31g5rDvv1jm68Wg/b79SiibgLbgHM8oYc0A6TXNczKXErcgHsQJwgmvDhnl
         oPUC4mOIClMGHBqXEoFtPlyboUXl4kO1Hlyrrti3U4AFkajQvIFJI491ZlBLyjMWu+T1
         s8QgSsGfBo0g4b3T/bJYtHeAhcbtKiUymmHA/5SPscjT+mTCCJ2QV3i9yKVtHqEGg4JP
         /K5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=C2BvZYxCNM329YOtugIJJq27AP0DG+3t72psalP89h8=;
        fh=ldsIPZglWF88toYvVzND5mMV2SKyi2tm4tKvlpKYd5w=;
        b=GtO7IhwFr93o950JmwKzEsvor0S7ytd0C6h3PuSXyv9SmC7sQlZWDaokpoait917qn
         GKXQHxFjqwVZkGEAYiLiiFITruUFWoiUVArKSmSbWp+CZ0NKcWkakRWTFIB50uy4kr4o
         pMrIq8vEzNZ4ggBO1DaXwTX7hG3Sw4BszzBDT0NTV+4DdvZ3YaAsqoAYx+GkClpabhLC
         +LyQXfNnLST3UwiMANQS8YW6g23X1Coe9+Gt/fmp8sONMF9S2N4+/KspXr/oP+RcCyMi
         zPHjACgODr4F7wgMvzuSIHbHbH58ZTVX7XD3CkBnEIM/TM1iSCExQ827d8ddueW6x2ln
         L10Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=XHYR607t;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-5330d3b151dsor3211084e87.5.2024.08.20.07.30.02
        (Google Transport Security);
        Tue, 20 Aug 2024 07:30:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=XHYR607t;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724164202; x=1724769002; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2BvZYxCNM329YOtugIJJq27AP0DG+3t72psalP89h8=;
        b=XHYR607t7NUGslEjmTQHIbbWm9sq9wtZAg6nuywr5tB+2OiG0N/7iiWzAAqOKWkuD/
         jvAi/fkxShOCx5LDTg9yvTZHyPXs/oBRYrREhv5IBT2Y0KmF1xC5aahLwyxCrSl2EHSa
         z7Vr1RUvUdb4I/fzFpnts7/mmKNuWb9t0GKPMmUOaSfDsqng63RZH074/dAuQaYf07na
         3zQXhJ390Oum/6a+v78/9K9SIwcTc26SrI/grCTJU7j/SbCyD8CYyZIYp4JSmVKqjUal
         C+ysrjzdMV8FPMrrtsKD//Mdx3beMfMsnLz85SpmRBrdPoR2s+wNA3Lr1TJzt5N0xupA
         HNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724164202; x=1724769002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C2BvZYxCNM329YOtugIJJq27AP0DG+3t72psalP89h8=;
        b=V0coV3mOs/G7+RtgmzgOifNVOXJYQW5Yo1zpl492/6q8YcR3nDzHjErahUnsAY62wG
         k/DBe68RlofTpDjDitbciz2IDWDtneGMoU59waTbAHlRygAqZLWXhSeCKv97ZwyxnFye
         5vapgZgKJmMfRwygDjNCVbsx4fF57/JcTBz8OCgZh0z7LGLVhyojBTHIqHwiRhprPT3X
         zOySgejjMFRQG0SnJHiDFMv5iQSd3P+gSBYsLIoMOqgA1Rb8m23TejBRH+wfJlw7gx1Q
         jdIw9kqkXaISKLW6HhrGQLcN8NS4zPFwQ6QobZsPEf7zQppjKlzrGhUjSJJ5KF1VFTDb
         QjdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMZftGHrLRhvzQInKD3zpmwns2fNa5t035kDfJaFlDFYIOilbKMv+7gERQeJ75p5IgqgxyyliM6ngyIxcVyg==@linaro.org, AJvYcCXD5QebiED3pDe1bb5sxD4EtYMj5sXYxdVOAX7gG5Nb8sNnIn/fhM4B43pWvkG92KPrpjWGbP+onwdfNw==@linaro.org
X-Gm-Message-State: AOJu0YwKdg3x+ylwQ2dZ29mTeSAEGdfNqp95rqotiuWVCaFcyedxIz9i
	yu3if87CBHfPwlJra5W0PO3HvT5ELcr5cHcRqnuzqbqdFQmOuD1E
X-Google-Smtp-Source: AGHT+IHrRwz7HWObwUTGagmH+INCDwhlgY6mEOdY8uIF9sicK4D/lPSZOM/URWXKGfy0q0Gg5vOZAg==
X-Received: by 2002:a2e:9119:0:b0:2ef:2b45:b71d with SMTP id 38308e7fff4ca-2f3be5afc99mr87868481fa.24.1724164201963;
        Tue, 20 Aug 2024 07:30:01 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f3b771ebe5sm17418331fa.116.2024.08.20.07.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 07:30:01 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	xenia.ragiadakou@amd.com,
	jason.andryuk@amd.com,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 05/12] hw/arm: xenpvh: Remove double-negation in warning
Date: Tue, 20 Aug 2024 16:29:42 +0200
Message-ID: <20240820142949.533381-6-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240820142949.533381-1-edgar.iglesias@gmail.com>
References: <20240820142949.533381-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 6C2I7M8gd/79

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/arm/xen_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index fda65d0d8d..16b3f00992 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -165,7 +165,7 @@ static void xen_arm_init(MachineState *machine)
     xam->state =  g_new0(XenIOState, 1);
 
     if (machine->ram_size == 0) {
-        warn_report("%s non-zero ram size not specified. QEMU machine started"
+        warn_report("%s: ram size not specified. QEMU machine started"
                     " without IOREQ (no emulated devices including virtio)",
                     MACHINE_CLASS(object_get_class(OBJECT(machine)))->desc);
         return;
-- 
2.43.0
