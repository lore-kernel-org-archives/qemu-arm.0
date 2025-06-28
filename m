Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp1647958dye;
        Sat, 28 Jun 2025 12:57:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW8MnWTCLoGVzIPkn4rnq5R5a4+Y6pzBcpqw3D9jcCkLEQqTV+XpiiyRCKTwnfuv4REoUCobTxlNxSHXg==@linaro.org
X-Received: by 2002:a05:620a:172c:b0:7d4:ca4:addd with SMTP id af79cd13be357-7d4439239ebmr1003065185a.19.1751140670813;
        Sat, 28 Jun 2025 12:57:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751140670; cv=none;
        d=google.com; s=arc-20240605;
        b=jjujI2tIg0/njxGXQ+cyLZMg2eGs1DS3lmDKI34D33/IxlSsLlTCPLzhiEiBXuvw7e
         6UvWCuds/kUw3flreUY+pCaywUtqCDWP8oyOgiym/nqmwUl6HodPsqW1WoR6YdlEcql/
         YJFnZs9CjjAzP1wZf/va5IWtub99TjE6Lmnikc3YgwxLQMtsGJQgCiMcFC0LQuDextY+
         zyaDu/2OlgSw/uAE5rNp7IabQvuqyOHfMrlvt9ndg/kqnQ6lLjgvpYzb33egJwc8wux2
         lDT9OHSmle+WZHyGND4dhsXTwoSzqgMbAMZVSj0FVAm5tpzA6/I4MNrFWgyZwipCigG4
         7F3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Sh9BBAUKCRRchEMhh1wAwvgv0ZLAu/7PDYQAsn4UYuo=;
        fh=CnyaZNGGL1gXFJdQA1LYdECCIi8BRzTZQayrAcN771M=;
        b=PWSLOJbejRUyeY6Rf6VNtnZj0FZBCSnIkFRgtm+m0MbuJwRqa8Hu8+PJIOcPQD9rKa
         t/R8lGBEW2Aq2NeqHlzCQRYJTwCTp0wPyhteaumRZwK91KucNejMh/yR4f+8f0Sncd6l
         wpx0yN0owzsPT4QwoJ0HYiTnzACRWeY5Z+YOqvfp3wYAn5NgGQqnmVwWrVdEt3Wl+r0z
         lSbB4pLMcCXyq/6A0nWp4rLFhbkKjzRcKIcR7WJkDgQ3Ls7xr3sndavfNX+zgHS3t0ut
         Z7ddcTlmB+edFJgSpHwpibqXI/RbypZMqUYTELh4SzlQYcSjw5GaAscP6Fhe0/OcORcE
         3r1w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AALkPanM;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id af79cd13be357-7d443270ae4sor380422085a.17.2025.06.28.12.57.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 28 Jun 2025 12:57:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AALkPanM;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751140670; x=1751745470; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sh9BBAUKCRRchEMhh1wAwvgv0ZLAu/7PDYQAsn4UYuo=;
        b=AALkPanMTrqxYZACHs334YhSALklIkyuHa8DM7+9m56Far3h7qI0Txl73ttvk9kqc6
         54Vg2rZpR5KkftjYemrzUuc3aHhpJjdkLBiFxEq7LShOzaELUjK2Zl6Dxyjp45P8jXde
         i0RmnNsdWKynzVzcFoPGS0mc9Lch1ccuuoWsnOsKzsURndTX5erEGP2uUvrHKWWYgHj2
         Az8XFY7fbvsNI3pFQoUUw9tLVAOldcTjUaaTZUyvxto8/ILUrR982lw92IHmieVBq3Ie
         FqtUfdaM8aHqUpsaunvkEC8dUT1KDvesOv5I9/JpGlMwM4h4raOPoioHFOGb+nY9W8G9
         mC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751140670; x=1751745470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sh9BBAUKCRRchEMhh1wAwvgv0ZLAu/7PDYQAsn4UYuo=;
        b=NyZ9LqbiQBMPrtDszcPbQBfOXhiBWUR8vTsVi0+YyhUGLMmp0Es4fnL0YRs1D3XUTG
         JjmEf7ecx1KiHYhm7siUTWTNv0UavKDoUlT+QP9AFIeJYYoi+VZijApOD8AwIXGVrsfn
         8TvX6YByAB7pkUioT+zizxqeE2Hal8AqwayGnLpsA7dKherrpTVN61iUuq/PR5q4fi9y
         1GrgUkm5pfJZ5dv0KN8jQ2+GtqsyeBDw2vZpLk2fXOuVMkxTHBjkMYrBHU1KLvWl04mU
         zK3JBqsY4QJt27mKHAP1Dk1+3KpjtVVdpuEjoZ4Q/YmSUIBJwOqB4EiHQnmvtA/a9DYT
         xpuA==
X-Forwarded-Encrypted: i=1; AJvYcCWbm9LxCgf/h+lJsQestwSnvpnPEm6n2+GHlVcJj22KlK/7dcKcnHLtiobRTOcL/qLKhjokVMQUVjHt0g==@linaro.org
X-Gm-Message-State: AOJu0YxvfENPpjxK7l0dUSVCVKXDnd3gAnfpjQphVD7ULywkfj+xsBEX
	Gjc/oqMJqqYRx4O7+Te2t4kdrHsAvWEM9obM1zF9SYGvjIU2JeJxPoNtFBAh8r+8iJ1BrA==
X-Gm-Gg: ASbGncs7XnH0oXzZEsjEc0mIjUNC+EkfSXILxDs+i8mpxtm+tvQstwWpQuqnluT3XNV
	+aHB57aJQ5+MGdNZnMcasxLw2gZx6dd0GAhXirZMtLiOiSRpH5fEdFqpTvAhLPVQlOelgHZ+QT9
	y5xxo43ZD1WCZ3Sy6qQ9Vp7EaJW0ZdfPO46ZU9VB/m5E7PA3ZWNcTdNi4L+vrtatX1abHYMDabA
	4yFsbc97Nixw/zHVXtCT7SEitr51GRiVjCZH6lFKClwBPklUn8MQ2EMFoidV40mSCSiUfmO08A7
	UK7L7H2MRCj9CxbIx7VQGXmNKhO3JCES8wMi3zlBYXZZPq2htrfRzZUnWEpVmEEULLXcBItfNtS
	nCA==
X-Google-Smtp-Source: AGHT+IEokQlorS1v4Gz7zCFH/PUm0ODxAYiyCE6aFtz1gJB0afwNAjlfXOvvrvcQgadQe/yJmqRJ0Q==
X-Received: by 2002:a05:620a:4541:b0:7c5:4b18:c4c3 with SMTP id af79cd13be357-7d443979161mr1158238485a.30.1751140670338;
        Sat, 28 Jun 2025 12:57:50 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([186.215.58.88])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d443136907sm334395585a.14.2025.06.28.12.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 12:57:49 -0700 (PDT)
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
Subject: [PATCH v6 2/9] hw/arm/virt: Simplify logic for setting instance's 'tcg_its' variable
Date: Sat, 28 Jun 2025 19:57:15 +0000
Message-Id: <20250628195722.977078-3-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250628195722.977078-1-gustavo.romero@linaro.org>
References: <20250628195722.977078-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: JnS6nR96Crof

Because 'tcg_its' in the machine instance is set based on the machine
class’s negated variable 'no_tcg_its', 'tcg_its' is the opposite of
'no_tcg_its' and hence the code in question can be simplified as:
tcg_its = !no_tcg_its.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 99fde5836c..6d9256a525 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3342,12 +3342,8 @@ static void virt_instance_init(Object *obj)
 
     /* Default allows ITS instantiation */
     vms->its = true;
-
-    if (vmc->no_tcg_its) {
-        vms->tcg_its = false;
-    } else {
-        vms->tcg_its = true;
-    }
+    /* Allow ITS emulation if the machine version supports it */
+    vms->tcg_its = !vmc->no_tcg_its;
 
     /* Default disallows iommu instantiation */
     vms->iommu = VIRT_IOMMU_NONE;
-- 
2.34.1
