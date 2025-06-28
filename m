Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp1647968dye;
        Sat, 28 Jun 2025 12:57:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUlJLz5lWX7PpfHw5VDJ4Xvt42kYa6EShfmi6BpEey0bkS7PLHikD6c3g0jR10NNPwMFS6tia1vDWVd4Q==@linaro.org
X-Received: by 2002:ac8:5f0d:0:b0:4a3:5ba8:4978 with SMTP id d75a77b69052e-4a7fca45d98mr142169931cf.21.1751140674430;
        Sat, 28 Jun 2025 12:57:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751140674; cv=none;
        d=google.com; s=arc-20240605;
        b=hA1KZMj18YULlteJ+Zbm3LPn50v+Yeuo16w2Y/acbZf+5klBDFwGYkJoXFYSdxcO06
         fIdCdIIKwWd7J3XoVYs7VfXVFckXTBLLkdGR8lFf9857PAlQsrCNDBJrFQoJVxDyEik2
         TljY+K2Tcs+GDRWUh7vV0+IFr5bD4ThIlFABw3J8fNoHYPs5P4/kJlviqUuDK5QVTpiY
         gJXGPjXosepxtb3UGBUvMd55Ss3Z/z5TR0EpI+jsGMhGofm4LhyoBSh6OH1v2a0LPueH
         ZROQfFRDdVyQaTe9+tIvq5HZiUUcPITlN1vYq0kTE6epiyW6SJtQkmNfHs2wePDDr+pe
         ZXsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=N8RNDG58fu6VATaaftZTVcVDja/cJV1L/ku3KjsPqaI=;
        fh=2C6qq7odKjbV/vUnGzp4Rfxu8p/CgfhkfaGX0dEXsYA=;
        b=Tpt+Y358fHEWgV3W0kgePuzQ8EsPuwS0V06SGRtMguS7o/4Zt71M69LtgIudwUGSvb
         nkkmG4c1224245qpxQKDWTmtEjtOGtH3aP4rsZPK0sfkD3NP8VN2WOv/bfb3nlyRNhJG
         tsU0mg5nx12uSciskitvu6KKUhmeVpAeivI/DRqfXIPconuTYROkzz8K7WV7lkxQ7En8
         /i/vAHvJjkjwyU0jtkExRqSAPRrIizhoQiRBy1CYpwN0kT/o1Di5II2INqOzdM6uRQsM
         PplpTHdVPihXPI3+c6QpgC0ukVse5C9PvCR7MCs8WeEMVM/+2ZPDLsFzB61Ux1dmoAJg
         Y/eg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zVXdjY17;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id af79cd13be357-7d4431a3e05sor997184385a.6.2025.06.28.12.57.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 28 Jun 2025 12:57:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zVXdjY17;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751140674; x=1751745474; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8RNDG58fu6VATaaftZTVcVDja/cJV1L/ku3KjsPqaI=;
        b=zVXdjY17mHK8h8COKRtrVC1QcJoBWZA5QtMfvXkEQqYQsI9BEscA509yYAywpwKRQ3
         9Y8syokBRYdDnQm84dsUN4Sl+rR3iqm1iT2I7xiH0GJcqKNZ8J/YStWeukluiMsIf63R
         6w2vJu0/E8WZ59CVRAvBAHriNvtULprSYaEER37L1C72t2VJmDvGVdJ6Xpsun7WmAu6b
         nyN5JoTWuLBHNi/jz8TqOlwynallGKwvnnwEcxT4myxvOpa9oFGJDDu/jZtzR4/P8ZNW
         mYicwWOFgIWO2IpLo8mbVuarQuwXBtPkejGTdULnWrjp0JewcX+I3BUQPQXnM1pP+Vut
         I8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751140674; x=1751745474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8RNDG58fu6VATaaftZTVcVDja/cJV1L/ku3KjsPqaI=;
        b=Hmbxa5n+PHBX0E6Dp6qQYBgPzcr1t0H1AQLPEdlhRqyUBTUbNjb/eTB8oODlPhw1Jk
         Av8f3AZ4o5C+LIlEsmdjkEh+d/3twhKJ7xfkkusq8IGRhhKzC+DfDztPXfyfxM9/+a4z
         IxktkAqY63N8fe9VhoZu4knO7FEKtN0ClQPvAD3cUTTIDNeVly9pda9dgDjI0fOO6ghR
         t4yZ3epe2ir7WqMQio9QjNWSi/p+4MD0ca0uNHbYKZvrYaVm6p9wxOXkXB4caSqUZCII
         IlwHjU3VDu2FYhkiwgmbPbsumvqwC7qYKVLD1gc8YWKm8cThc1Js49ns6h7xktsJy3SA
         wBhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQJ2eNvpj+LSa09hQgphfLCHxj7rgdRzTAOFj/T79OAxKBWOW0h4Jelw2OvcYpXAtdHDFmyYqNSbv7/A==@linaro.org
X-Gm-Message-State: AOJu0Yw9vMvL3a9QMYJQ024PjFd6bHPLK5v8yA2gkL4VMg+rv3cC3Ss5
	WObaNZDfUnnPAOHhCN7caVNa74PjukA+bHE1NenFUK9Lg+L6N1Qast8WqCWR7k6oIg5fmA==
X-Gm-Gg: ASbGnct+so+uE+l93xzzqw6fXHsk+DkySawhMD2KZs70KGlfloX3lvYupXl79dT1jf2
	u9iTA3aS3HGQWJHPqTs1rrxmPM6idWDpZ5kWQB7zcO0T8/VoRDKlCbqmPr9eYZaC6COuQxxJkSp
	ZSPNgUaoTm5eA50omcJgxyxdHTYjGxluoXG41hyxqFn2F63QGeCrf7BciZ3FIv2DvkHwHREGW33
	ZFxzT6ICgLA1VUdgNJ64ASpWedntO0NNtmiURQul47z7N5vFg2t9BSruQhgJTTaaHJ3HYHevx+9
	5/b0c3atsRpvIZ61ARf4Bp0x7CC0onMwb43FC0C+RKY5t1pWnvA70JDLIrS6+VzXIfU=
X-Google-Smtp-Source: AGHT+IGmfJpIieB66+GPziD/5Xt1TwlHhJgbB0RykGlKeLuCWkL+IVFNwDP6UPT92V+kq9drrhJXXA==
X-Received: by 2002:a05:620a:25cf:b0:7c5:9fd3:a90b with SMTP id af79cd13be357-7d4439a6782mr1350631385a.47.1751140674015;
        Sat, 28 Jun 2025 12:57:54 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([186.215.58.88])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d443136907sm334395585a.14.2025.06.28.12.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 12:57:53 -0700 (PDT)
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
Subject: [PATCH v6 3/9] hw/arm/virt: Simplify create_its()
Date: Sat, 28 Jun 2025 19:57:16 +0000
Message-Id: <20250628195722.977078-4-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250628195722.977078-1-gustavo.romero@linaro.org>
References: <20250628195722.977078-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: L2bWn75fL0yu

From: Philippe Mathieu-Daudé <philmd@linaro.org>

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
index 6d9256a525..ae419e8671 100644
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
