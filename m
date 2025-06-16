Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1851510njc;
        Mon, 16 Jun 2025 06:20:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXxJoB5sbbjyJKR7fYEuaequ1J3TYm/4TijC/4avOFj7hjqUFcwporzbynwK/1hPELVyW+bFT0qEr/wxg==@linaro.org
X-Received: by 2002:a17:90b:586b:b0:312:1b53:5e9f with SMTP id 98e67ed59e1d1-313f1dfa2ffmr15392073a91.24.1750080020380;
        Mon, 16 Jun 2025 06:20:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750080020; cv=none;
        d=google.com; s=arc-20240605;
        b=EMuWbyFetnoLU8/IZ9fh3krQJLbh0auEBnUCBFRNNsyuGjcXjVIQPVLqaO1SbG5Zc7
         KNSJR+2iol7zPAWcrXnKRlsvHBRiG3OurboSFe71GIITdUfKEEOycn7Et+sH0KX8m1oB
         z6L6qx1rWjK+zHOmq1gHwWuUU/wMM5cfKPPEWlTI+oW2X4QYBYQKJdO+GDz52Udymnmr
         4ysi6wnUA8Gq7lCp7KRBSTWaYDplydgPlg6HBInNjSOfaJsi5d0me9+GKOQu0Ie4zsIR
         Rdq8AnXKNrziw19r+Tok1MpPqEPwzTWsU1smtI5+BivlhjDFb7o68VnlP9i4dfH7E7tx
         hD1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Lkf/OdEQSfxG2yHQ++B0CfVtDkkYN+xz19jFGvSBQ6U=;
        fh=TeWP51+HZIETDXF+cjCHvXATku9hlwPz3iIKcfrC+As=;
        b=UF1I//Q/p2+bC66cr8fcCU5eTc5DGBSXjSpbT5NE2QMplh2wXNI0IBl1MWh8TGIxgE
         HLQ9onANNLfyitt4XSvq+I4XOSiLjvX8b58CgoD9mTNIEr8IcLwWtHr+66kGX0EKqKmV
         0KJ313U5LrwjU6Ro3rSlvTtDUpjZqQN5iSBNIZUb1xNv12u6zH/AvEy929svEbt3r99z
         KnMbaRzBi6E+6qwVflRe8B1CufQCLBDToZ2uyaxqBQ9MWTmi3QLvZevGuZxiwbo/JwNu
         Udbvv7HB4vzzKUj50HwTQekRcWjZsfGeRk99XGElDNh89uaZ3FDtQgWGYbFBCyzAOIvz
         +WKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pEok60vi;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2364e6bac14sor82264365ad.11.2025.06.16.06.20.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Jun 2025 06:20:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pEok60vi;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750080020; x=1750684820; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lkf/OdEQSfxG2yHQ++B0CfVtDkkYN+xz19jFGvSBQ6U=;
        b=pEok60viS3yekfmOUsUGHOCZdTZo9UbGfh2pIfsABiUA7lasG5AtHNF7sBMfMT1HBc
         2hWAa9yUb5RXb1o1UMD6s+X0r6yI3rsGCG5uLzbXoGbI2hP/CiBkfA3Qy16CnFFoM+oI
         CkqWQ+esf72un686vA0S3CPMLoCTVg99HaPnosDn2iYqb6UGETm+OUbGDUPbzT5RBS8x
         uT2aMSBWjETcll5lTI9oTjzb6I8BwEL5KwqN12zHdUTdkjr23ZZ+Cpk8x7y3ib/S9AoV
         XW5Rjly85Ug+g7QH6rJlEACBs+0KibYPDi1ziS3w/cLMBS5NH6thIP7lLsR3rW5EOxa+
         mRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080020; x=1750684820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lkf/OdEQSfxG2yHQ++B0CfVtDkkYN+xz19jFGvSBQ6U=;
        b=fqkq2wb+Y6I8bjeut9KvKwuHZUHR9OZBC2O9Y+9AHIoITqJMlKkUj9QjCzeidMCp+z
         ooVzQ912pGcOETCkdk7K5qDfAZ5x9yBu1ERoCu7l91JLvfacFFCAI7MVIz8DCBmx3zoe
         8WdekJPgkFjFGnFGRAt5ROkx6NvaiA8tdpsIHjn4fAbe+ZRzTBI+J5bNs57IzfpvQP8H
         sqJBavmqS4w7KM3Bw02qazEeFel5OBWxa45SPYizDP1Gr2b8xVAeen7LFrmBDYI9EOmO
         KBSdiudhiCl2Zo48o6mOmMAMua7dHU6L470BeDfJFIZlZZRmfTtPG6Zs5owcA6cbn49v
         abvg==
X-Forwarded-Encrypted: i=1; AJvYcCXQMR2fiYFjsERDbuNetIPdxmhfjw8fva+C4klKp4HcymxiVDyH7m7JwJa7hRrW58S8wYobQEqYJteRtw==@linaro.org
X-Gm-Message-State: AOJu0YzSIVmcIvt4cDNzZuWhOHG7AkvX2FUqLW2FohpCC7YgYj+OwimM
	XMmcxVigKaO6SIKPzpNCyx+gHRQP99/KZErMBLNqu5v7vUb+Hce6TitOUMnbzt2Fe5Eh3Q==
X-Gm-Gg: ASbGncvgj+fkFoNhugnTNvuJ4/56gmR1ZCekcYOpXTBU2U0z3aJwpY/2Ehvx5l4TOz4
	AWzX99XhR+bfCYVesP4BwmKzK9RUy/t5G+79lsAsVX+s54DzM5xZ1cjix9Pdwh+QEET/SUKdbIR
	M4abaQmalyNY/yWhVd1e4G+lX6O3wtWnQKQ68zsnWT4Na2m6Czb1y86+H4A79DxAokJfWiwTmQj
	1UpQlV0eP0dn6eKslC3kbwNnXIJTaETzq/SJCOxHVOYbEOk2LGqUMx44WSa42xTUOVnIKcoo7/z
	8wQtHXdL+EXIL43L/0b9rmRB4GVcA65qKLH/N4GRpFj4RmTUcsRWpfC/3n/8rhwCD8TJL/4lybz
	kYg==
X-Google-Smtp-Source: AGHT+IFJjIvSu2YVYXgzAph1VFqVYENhN8dbtxLcpdoy3NyYUEgSm8dwYLskPlOusQ2jSHctan+idQ==
X-Received: by 2002:a17:902:d4c9:b0:235:f4f7:a633 with SMTP id d9443c01a7336-2366b3ac074mr160663695ad.28.1750080019963;
        Mon, 16 Jun 2025 06:20:19 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([186.215.60.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781dfsm60848405ad.131.2025.06.16.06.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:20:19 -0700 (PDT)
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
	anisinha@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v4 3/8] hw/arm/virt: Simplify create_its()
Date: Mon, 16 Jun 2025 13:18:19 +0000
Message-Id: <20250616131824.425315-4-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616131824.425315-1-gustavo.romero@linaro.org>
References: <20250616131824.425315-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: xw1+48ZHn9v5

No need to strstr() check the class name when we can use
kvm_irqchip_in_kernel() to check if the ITS from the host can be used.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 hw/arm/virt.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 42a63a523e..d2cd79ca50 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -705,21 +705,18 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
 
 static void create_its(VirtMachineState *vms)
 {
-    const char *itsclass = its_class_name();
     DeviceState *dev;
 
-    if (!strcmp(itsclass, "arm-gicv3-its")) {
-        if (!vms->tcg_its) {
-            itsclass = NULL;
-        }
-    }
-
-    if (!itsclass) {
-        /* Do nothing if not supported */
+    assert(vms->its);
+    if (!kvm_irqchip_in_kernel() && !vms->tcg_its) {
+        /*
+         * Do nothing if ITS is neither supported by the host nor emulated by
+         * the machine.
+         */
         return;
     }
 
-    dev = qdev_new(itsclass);
+    dev = qdev_new(its_class_name());
 
     object_property_set_link(OBJECT(dev), "parent-gicv3", OBJECT(vms->gic),
                              &error_abort);
-- 
2.34.1
