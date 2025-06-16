Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1851462njc;
        Mon, 16 Jun 2025 06:20:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVXAW4LlnsjmYyBU8hperarvV4sm1LO4N1kq68TRkHU3C0vZe94T5750XAJjSBxSrrRljbQhdVX3OcKZQ==@linaro.org
X-Received: by 2002:a17:90b:3e8a:b0:311:ff18:b84b with SMTP id 98e67ed59e1d1-313f1d021aamr13724260a91.25.1750080016458;
        Mon, 16 Jun 2025 06:20:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750080016; cv=none;
        d=google.com; s=arc-20240605;
        b=L8vKu/xPQDv0EGGBaoy3Ci8ytvtq8bRNKKd+GniYlpKJwsYFwGYj5xDiip4TCbD/YF
         OkCHSOkLSlRlYAV68g2SD7mzjZ84jzXW7N7KbTEhcdnXPXvnLB9yeiNPz0QSHbGDcTM6
         RF2+EwF67xKL1SmhaU1TkRHCkTkVcz0s1oICtg8onld6LIEJi7fijEvDyM0qGIDAYeDd
         bD/aoXgnzZxyKsLzRIh+SChC3OjbqQRrgWIA2ePfAqVQwqcyxLwiKyWTVBsEN+0YLZEa
         7K1qCuOdc2NJiyFLvqV3EYjPWalvMH5JbdrMl7KoM+MHqdKt1tJlEdfHlRJBGuRquW6t
         FrSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MYXF1EngE0eNzxoehIltsTJwDvypLa/shlFclH9Sekw=;
        fh=Rmm05ce7v/84pc5Ai+Q5AyronWGUAJJVUNZGISFovBY=;
        b=CFOPijAuvpT8s2FiPa0QxtG4STguH9R7iFx/taOy6PscwH5zh6477nuGSCQelwu1lk
         quKSXAb+VOAwq+36vr9c3Ejma8SDfkygTUDarBCtRSDqsPQT5G4onTpG6ZuNFUkxP0V2
         fp3C0lnkoPheHcwVgMgoAu2C0+bm62FNCVfSPlRIhisy1b+O4XtMw2Hs/03f9X1Cqugo
         TopFk8eoJ2yBhTAtYQumdCPud0w5385NjttcA4aN88KdVvGUNSOarBxoQvwB+bpJsKFD
         2GeU+uX9rJZr4WOW6Z0ILNsb3tbhdGAvtRUQvHz2ZWQuJGtgjHRHxoUCXTPLllZ8Oy+t
         OoUw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RgvLk8wS;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2364e61393fsor78449295ad.3.2025.06.16.06.20.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Jun 2025 06:20:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RgvLk8wS;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750080016; x=1750684816; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYXF1EngE0eNzxoehIltsTJwDvypLa/shlFclH9Sekw=;
        b=RgvLk8wS+NVCQZaabI7CXWTM0o+VwUBwHyoz/Iz3FZ6PdNixo58hBJux1ipK6oBTRd
         m+JgLsMV9Kk1Ku2UpFzLAOVLY0wSDml0YE4WXgjsOKJyt2skri8+4OKEEARzHZa3vJPS
         T/SNRcgxTjwHRXaQY6Mxcs6GP0yGcZas08bp8KqnJU/IgEKOkzg1UrNXwO1trUEHuocj
         4PB/b9/jCN2W+drOfyiEPaMfc6NHFq9jWU5nOE35RNGMXkieY6DTYNzvHTSz7peffse9
         utwDFoVRlRIyY5KyK4L4XUSwtfllcx6hGzyERuEgc+wQxHmKZRPfkng9CNvEsc8gBytD
         YOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080016; x=1750684816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MYXF1EngE0eNzxoehIltsTJwDvypLa/shlFclH9Sekw=;
        b=tT41aOXIgLdCW9fM7oApSsyMdJXifQ4Sps7CpGy07DUtA94nHBKAAm/Di1fUueSk7t
         7MXdiruitzlcWiptJuPxlonTAuhH1xuTgDLFX9gxRx6SGPw5B41PKIRG075pB0e5Y59N
         qZ3bmH+HNwX1hj1k8uHvF8VLCWSMrmjkxYDsqkZo84TTohKP8xI/+WD6N9iSig6hQ0S6
         XRHcWLShBTyWpxKfwLnWs+oaLCp5EE3jWv7YGMQJTvOy2DNb5g/OstNpHmOA7sapx2EC
         OPMnkph9weuf1U3FyatAQRPweIxcP+iTx9bOZhdV3zRNjorNW2kBQ+SxCy18pKZCB8lp
         gthA==
X-Forwarded-Encrypted: i=1; AJvYcCXL4y4jHpW9ZDqO8fIgx0o49V1Zo2YUgEJb/lXdLR0RWN6uTchB4HArSKEhvRupTfDAm+Y5Jp357XnDhQ==@linaro.org
X-Gm-Message-State: AOJu0YwrQAc2UDBZnGUeZYLVO/Qnr2TfBaS4NquaaK238jCZkZCS52gv
	Z0rcQ9K9kdE0JHGxW+SUTjzwxfwDpy3nEoxv3dJrdME+A9LKWOEKhSuQVKuu7hfHKYIsIg==
X-Gm-Gg: ASbGncsSt+OZdczwML9ebXYsHN+oUSIjTRDPd8O1KBxkCXVHVJk5mz+1OquTuKn6d99
	J6uQJ60wX0NeqBgNkGDrR1QD3DECrzWg+Xoq4PZml2Otxp7FVBiLhpXed03CQObywWL+g/96mq4
	XYVqggzPaBQ8BBR12+oOR0BaYvp3bnSHmzpmeskiKnQnPIeh5cNnjiNAmpD7zluLb5bhVTD2AH3
	ovNVJAD8c+9+/qxz98pfzVRvZsegDSAwIlzSpIvY/jYxSeQQHjDrIY/J+aYRN7Ne3E94Z4dBAoX
	Kh9n1P2bwUZNkM+/TGFRQLPyekPdmCu+Ed7TLxMX4ll/3QNLaLG87r/KMAWJgirt9rIn7zszJ89
	TWA==
X-Google-Smtp-Source: AGHT+IHxKzenoPSwH0Xt0YtaqfffxhcuZ3fOVL2vu5Zs+h8MKNPgLXUU7QtEaOjNgbN1i299iWyNJQ==
X-Received: by 2002:a17:903:320b:b0:234:f580:9ed with SMTP id d9443c01a7336-2366affb323mr146617775ad.21.1750080016002;
        Mon, 16 Jun 2025 06:20:16 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([186.215.60.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781dfsm60848405ad.131.2025.06.16.06.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:20:15 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org,
	eric.auger@redhat.com,
	philmd@linaro.org,
	mst@redhat.com
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	gustavo.romero@linaro.org,
	udo@hypervisor.org,
	ajones@ventanamicro.com,
	peter.maydell@linaro.org,
	imammedo@redhat.com,
	anisinha@redhat.com
Subject: [PATCH v4 2/8] hw/arm/virt: Simplify logic for setting instance's 'tcg_its' variable
Date: Mon, 16 Jun 2025 13:18:18 +0000
Message-Id: <20250616131824.425315-3-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616131824.425315-1-gustavo.romero@linaro.org>
References: <20250616131824.425315-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: yyeiW6NUvgj0

Because 'tcg_its' in the machine instance is set based on the machine
class’s negated variable 'no_tcg_its', 'tcg_its' is the opposite of
'no_tcg_its' and hence the code in question can be simplified as:
tcg_its = !no_tcg_its.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 hw/arm/virt.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9a6cd085a3..42a63a523e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3337,12 +3337,8 @@ static void virt_instance_init(Object *obj)
 
     /* Default allows ITS instantiation */
     vms->its = true;
-
-    if (vmc->no_tcg_its) {
-        vms->tcg_its = false;
-    } else {
-        vms->tcg_its = true;
-    }
+    /* Allow ITS emulation if the machine version supports it. */
+    vms->tcg_its = !vmc->no_tcg_its;
 
     /* Default disallows iommu instantiation */
     vms->iommu = VIRT_IOMMU_NONE;
-- 
2.34.1
