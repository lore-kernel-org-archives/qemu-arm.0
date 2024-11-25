Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1569352njc;
        Mon, 25 Nov 2024 11:59:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW2TikAjy2n5DE62VmKeT84WYiFxxV/LudjmnLwL8RsKWHbz6R4pGyWlzz95xnlqbI94zjASo6NNk0F2w==@linaro.org
X-Received: by 2002:a5d:59ab:0:b0:382:450c:25e9 with SMTP id ffacd0b85a97d-38260b8ce0bmr14883085f8f.35.1732564774774;
        Mon, 25 Nov 2024 11:59:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732564774; cv=none;
        d=google.com; s=arc-20240605;
        b=jd17vyvbPMvYG66jQ6y0d6zVBVaEhfms3WJ/zDUsmpyLwPQZj3n0s/YL3FJnxbM2uZ
         TIfwL7gpJ6z5UpR88SGEAnm4PC8uUahHI7ALefgm5CexbQRA0MYyDmjtEdC5q7crAHic
         zJzOrj6vuEvvahjCf2jgK19rk4WOa8LPCQLOOqEBS/1XwlPZdNd0SLco91tR3stiqSGe
         zxWpoq9ev48MLPDGDE70pgGz//7O/G52x5GvphVmAEgCjxq1c56XeMKyKX5h9jWRBKCS
         knbAL8kPGb3GeDU+GRFpzUMAQPmY5KHLXJRO9bhjZ92hJ5Ko9mmU7dCX5MCeiXVjz7wS
         wkyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=88wZi6u0Mqk3kSDzeuh2IkFT8p2T9s3ILqB4KFRDi3Y=;
        fh=djzMKDQBffVhIf9wlNJLqObpgSsjAXmrIlc5k48VP64=;
        b=X21kSAxFVijuYKD0q7tCSVU7JRgXyryGzmAeh7xIIhFCQ06BwXA0Gyw/qR9e6Tz/0q
         AK3dcLGbN1+klo+UiYDU2fI3JbFRkTiZtoP2JH7otShTPj5ShDr3Pztrp+VKTd7tPOo3
         Sknr+kYSiZEw4C6pkG7aTOZNgvDuNQLmXPVjdaEm0/3jTfHCeqlHotkDKvIkOrV2eJqc
         13/MHnavapc5PzWCKtDZ8EV0nkOCMIh6l/FeSYof8VIr65dL0ckY5zJZY9i3cjSUwFCW
         wcDfrq6ulFLgx/HT3jcPOccM91iqvhY63DeqDaiu3m/S0QNbdaS1mndMHm14FbUM2l/e
         nqFA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZX+cuvBH;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385be98beb4sor548744f8f.6.2024.11.25.11.59.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Nov 2024 11:59:34 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZX+cuvBH;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732564774; x=1733169574; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88wZi6u0Mqk3kSDzeuh2IkFT8p2T9s3ILqB4KFRDi3Y=;
        b=ZX+cuvBHevU0Sdoi507KLK48oy0Kiq3G30Rau3zOlCTtFIuWIrZoO1jiWUanJF5Tkj
         nTKlxYjIMv3+b8Zf8mFMTkXVF/pf4mpPql/D/zC7gir0la0qBfs1/0cldt8B7qEAq844
         /+gBrmu/U/2dJTaTEySEbApKsTNa1Fy6FnY5JF1f/I1beQerQi24bghb19qooFY32rRM
         qw981zhXGSURibgZbVJPFe/XwlK0X51oAh0jwokYLcTWWg4GQD0KnIa9zlJtLC/IR+Wj
         j/Uv+1paLqGlUEmNc896ICbidX8B/M0jNqQ+5EhmpdQ5jfU4F8J8P7x52x4cP1bwauUg
         9WyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732564774; x=1733169574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=88wZi6u0Mqk3kSDzeuh2IkFT8p2T9s3ILqB4KFRDi3Y=;
        b=uHOfFc3EgV4CvcW+dAGAsqscvvB/Q7T9d78DZO/pKv60dWu+PjG2F5H9E2CWwaQIdf
         QJvay+hNqH6nkTS+PVBGuYfOfXTdspa/waSqixvpWJUpRyiYwYAzbYDHj8hK1b/0jcIQ
         MlNWqpnghpZ2vOTh+GGYYw2nSMOYIwaazUnUpfdNNjGQ1rSUEcNMiAkulZH7cuSwEUCA
         fFQzVoaYGybW6QFBZUDnelI87DD92O6o/LdxpWr001+Vx0WRxGyq3fElCDRMVj8KMi72
         YUlImMe4BsSKntuB4NOR+nRAXV/hiQ/QDhxUMaVScVCECO5QRD68aUJkvnAhucxoDOkL
         EbVg==
X-Forwarded-Encrypted: i=1; AJvYcCWKZv/edIwJW5lOykhGxFyZznKrWF/DXak8lX6ifLk/HerL9FWVs3iAdr1VMb86L6jULvqQSulwue4kCw==@linaro.org
X-Gm-Message-State: AOJu0YwfZpxECTvxc8IJy7V7RmVF0uIeTrdudBGGfKWSThRNyW5Im/7G
	lnlwTuppexfQrroZHWVfviEEWU6KMdoggFOHjv5zGvL2yhDINFBvQUTFYWLWPikblw==
X-Gm-Gg: ASbGnctGVzt+xWLmyokkuuJsBv08GnLY20IoEn/8zc3NNa6FXtpCShpnu24Zt9UeiTG
	JYnVQuPBjo6uy/NVfwrqYqPNx9R2idSEuPMbUkEHzq/L/sningdh+wP92x+Kcekw1mM26iwHyHJ
	EKX9cwmlB4DDYZDtirFQCkTZw/B0aVke03rp4Mm6XdCKXBZAArVFW2eCtWaw2Wsm6eLifObFQk+
	3QmT5mrYLfmO6UrS7fB9mS9K+Xb/lNJFtvyuac5FbIKJn4JK3ImM8NEjQrCmCVdya2Z
X-Google-Smtp-Source: AGHT+IFTlfcnMQ8Q4NF57sJVKIYTBVoT9UNzBHBtzEnmlddW54qtujZLRGCe/OHa5mHxjA4P3prFAA==
X-Received: by 2002:a05:6000:1866:b0:382:4921:21b5 with SMTP id ffacd0b85a97d-38260bc6a49mr15718516f8f.43.1732564774327;
        Mon, 25 Nov 2024 11:59:34 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fd0fbdcsm11237971f8f.109.2024.11.25.11.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 11:59:34 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org,
	philmd@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v3 17/26] hw/arm/virt: Reserve one bit of guest-physical address for RME
Date: Mon, 25 Nov 2024 19:56:16 +0000
Message-ID: <20241125195626.856992-19-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125195626.856992-2-jean-philippe@linaro.org>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Rs6rBe3tb9aP

When RME is enabled, the upper GPA bit is used to distinguish protected
from unprotected addresses. Reserve it when setting up the guest memory
map.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9836dfbdfb..eb94997914 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3035,14 +3035,24 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
     VirtMachineState *vms = VIRT_MACHINE(ms);
     int rme_vm_type = kvm_arm_rme_vm_type(ms);
     int max_vm_pa_size, requested_pa_size;
+    int rme_reserve_bit = 0;
     bool fixed_ipa;
 
-    max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms, &fixed_ipa);
+    if (rme_vm_type) {
+        /*
+         * With RME, the upper GPA bit differentiates Realm from NS memory.
+         * Reserve the upper bit to ensure that highmem devices will fit.
+         */
+        rme_reserve_bit = 1;
+    }
+
+    max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms, &fixed_ipa) -
+                     rme_reserve_bit;
 
     /* we freeze the memory map to compute the highest gpa */
     virt_set_memmap(vms, max_vm_pa_size);
 
-    requested_pa_size = 64 - clz64(vms->highest_gpa);
+    requested_pa_size = 64 - clz64(vms->highest_gpa) + rme_reserve_bit;
 
     /*
      * KVM requires the IPA size to be at least 32 bits.
-- 
2.47.0
