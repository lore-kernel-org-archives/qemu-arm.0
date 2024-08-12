Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp768340njh;
        Mon, 12 Aug 2024 06:06:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV7w9jtIMK3RbX9fVium3Dx1s1Rcjl9rGXtpDCrUNch603ylfbF3RkGFc2icDxGz9JbgCMDDaozWkdBspj0C4xn/OrikuwY
X-Received: by 2002:a05:6512:3da3:b0:52c:86d6:e8d7 with SMTP id 2adb3069b0e04-53213655df7mr54807e87.13.1723467982925;
        Mon, 12 Aug 2024 06:06:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723467982; cv=none;
        d=google.com; s=arc-20160816;
        b=SyT2QPlN2mxW+ZknguvbPJ+ARceQerEeH21Y8RXjhum/2aYU7U38bcfe4ighBJpAzO
         ii7+j74LluwCJthGTphCsWJjeE1XZ380hl8BESgwR4ERhFbJQwnfuC0NcXH8hLntMOl2
         ONRjBkfmLhYEHF5vvoMijwtIdqVApvfpNetoS0mTzUmCoQ9MJBiIgVHf5TN0S6WZ87Il
         Km2/BVH13X6PkB0+HRWizLwJMWivbURfbyKoyOcHdN54SbRyMG3PtdgrFEP/g0us3J4Z
         7Oxia0bQxqytMLh0ZbuiFfePXbALrRbmWZ+Lvdb0XV1TM7B78W94JNHQ+ceAXJT1xaw0
         r4nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xwk/c9fy7uMLWpwC3gxJL5qXeUXnd09Co6O9sN+JUhY=;
        fh=QrbwUbLn8IzLzl96pFRWdIpqvYeJp4OnOoOgeLfh8RQ=;
        b=McvwgCTS+6bK723c441sMDR9J7wIePrPHKniuLyNPoIeMfKe1aCajqpEycpLfLXg8l
         sMmc09+87N1vh1ctz9vso5q6GR2/F/7XNeItjgaHaYxPVNC6sds4U67Tb7e70zDIkvWu
         JZ4bv+u432/w5Cg3oNz/kcjzkX7xoDAqo0hI2weUFaA8czTTFN8ESHuo15kU+U5pH75o
         JR7SusWa9WpNq6HbhnX7YDa9FAjZYsRs1bQXY8uO3YPqKsTw4nvWT/gfQ4wr8ndMkaf/
         /k7hLDEh3MlJMpWCjuF11hGccTKpMJ3nkkQP9kIjmZVD8kZt9VsFMr+EnQSKE+8h258e
         RxPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=fUubGwph;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-53200ebe155sor1252734e87.14.2024.08.12.06.06.22
        (Google Transport Security);
        Mon, 12 Aug 2024 06:06:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=fUubGwph;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723467982; x=1724072782; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwk/c9fy7uMLWpwC3gxJL5qXeUXnd09Co6O9sN+JUhY=;
        b=fUubGwphT71V6S0CoZEQ3D1IlgB6bU1XeMqktLjWwkw6FCN790rcWvXeiZgmnTOWC2
         FL1bcbwD8xwPz09mvqWTGK9MOlQ2f8N1keJGuR0vmTTvZKkKhHTTia38SgOGQs784Slu
         5SPqOR9dePRJzTi4S8cIJHhUmyJXI7i8qAgTnILosTM0KgbHg+3CtyS4IRo2S14xvIme
         wtCD1x7SACdaP4eGG+Vl+C2NnXqeRM2qefstxkHXYDGUgrxFjJlZBCE42HEIlidIPU9i
         IjEUiWfXZdmJxuTbw6PkJsmulQ098IPy8+soPUnUQ7z9wxZvGtw2p4138PyotOsXZqlP
         Vz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723467982; x=1724072782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwk/c9fy7uMLWpwC3gxJL5qXeUXnd09Co6O9sN+JUhY=;
        b=xMpbTp9WYaaGZaAIFIYKU0SqKZsNIJA/tMB0HbTcsHid2cvIDHANV+Iw4DCHY4toxB
         C3MFJ0zmaNG63qqggapPTK8QmNZJhoIEpb3ZAh3BVyy3jaALofq25WnOlpYMDAoNrTlF
         03SVEAb2m9wo6vLupjrewdVKEwnh6Djb9jS63Fg99LFgX5U715gMhoxvTLrbQbY6lFS6
         JXIGsI4rNNZyiosEofovZ70Elj9Im1acS+4WvB2mzBsSp+gUi3SGI/4CmJn1afmwFhUl
         6JU4RW2/d+R9pbkKs83Oj051Rz60yrSsHOQhS4qRzopkaP9SRYnYYEPnbjyK9VrKAiix
         cDFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvLn3NO6AEPVIaLJzhgpAjjg/+yKlxBFDwwnVfL15njsiJl2HF3e6vlNjBEbNJD4F6KO/ZIQQ85lQ7wceqqFXLFLxTWxJukUvk4TIFj92+CHR1NnerAP8onZf9N0rp1jk=
X-Gm-Message-State: AOJu0YxY78YuV+Dh43u1lSASdqBWqUY0una35I/0sTS9HxIc9gKxN5Nk
	UV+8RB4SwRA2NcB7s3JAPLvvqwke8g7PhCGc25BuuFcAjPEzbUg+
X-Google-Smtp-Source: AGHT+IFqodcbXvvGQbYAmgjAlCjjHyzPPhL/5h6u/IlGoF6PnqI7PI9+Ax4L4kxnxBVCA+PqtUfB/w==
X-Received: by 2002:a05:6512:10d1:b0:52e:76e8:e18e with SMTP id 2adb3069b0e04-5321364a598mr46079e87.7.1723467981708;
        Mon, 12 Aug 2024 06:06:21 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53200f42164sm727333e87.256.2024.08.12.06.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 06:06:21 -0700 (PDT)
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
Subject: [PATCH v1 04/10] hw/arm: xenpvh: Add support for SMP guests
Date: Mon, 12 Aug 2024 15:05:59 +0200
Message-ID: <20240812130606.90410-5-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812130606.90410-1-edgar.iglesias@gmail.com>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: /qlaF89k7ISJ

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add SMP support for Xen PVH ARM guests. Create max_cpus ioreq
servers to handle hotplug.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/arm/xen_arm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index 5f75cc3779..ef8315969c 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -173,7 +173,7 @@ static void xen_arm_init(MachineState *machine)
 
     xen_init_ram(machine);
 
-    xen_register_ioreq(xam->state, machine->smp.cpus, &xen_memory_listener);
+    xen_register_ioreq(xam->state, machine->smp.max_cpus, &xen_memory_listener);
 
     xen_create_virtio_mmio_devices(xam);
 
@@ -218,7 +218,8 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     mc->desc = "Xen PVH ARM machine";
     mc->init = xen_arm_init;
-    mc->max_cpus = 1;
+    /* MAX number of vcpus supported by Xen.  */
+    mc->max_cpus = GUEST_MAX_VCPUS;
     mc->default_machine_opts = "accel=xen";
     /* Set explicitly here to make sure that real ram_size is passed */
     mc->default_ram_size = 0;
-- 
2.43.0
