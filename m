Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp2081140njc;
        Mon, 14 Apr 2025 08:30:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXtCzBGsVjSlPeMk+1NWaLiB5YHDzUJn5Lde7g9HAT4jv4gVFWaSMW/NPh/WwQKivOVBU8Wubz2YOWK7A==@linaro.org
X-Received: by 2002:a17:902:ec83:b0:220:e392:c73 with SMTP id d9443c01a7336-22bea4ba096mr192310985ad.22.1744644640403;
        Mon, 14 Apr 2025 08:30:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744644640; cv=none;
        d=google.com; s=arc-20240605;
        b=asNlM3d5qflOm6iZB0zu9SgmeV6HSVNcrF0Vv7lUTGOXBPSORgLFFUedUrvKK4v1z0
         RVbKE589R26SYlf8YT1Qka0PGQ4IuqKNBrRkedsvSD4hyx4u/bpFF2BFn2ohBEUfQHJO
         5/QfKGASQRUxBJJPDtPZuHUMnQ/1dTmI0eOVlXSr30R5MyygsXd76/ZJlZlzq/OCNU7v
         DQ9C/nU4eQg85J+2vZPVpMfgjXtsVYgHeupS7qtl0ruDu+Xsz1zlzHB+MGn6eT65uump
         4KuqOFyISc+Zs0Mhi7cv+5Imu13ixOFiH2wdrH3ZiFSUXHjYxeJho/5oeSSdDSffeid/
         3PCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=c4v87EGjTuaQERVq3RVHNWa3GtHDbP3djfUZXGNYCVw=;
        fh=MrLLFzDMLBs6XDMDCFqtxv+DHZCJGXJPLAuHAF863N8=;
        b=TiYn+0Oa7SCTGu+1VLzYrDHlw39WWtOXtkuv/6/LW46Jyf46gymdXvKf/vPcPLP4Hp
         9NU+Zzs1D0eM560UAbY57j/86RT+QXUGEQO7A2EscTrXSlkQPuOV+teMyyJy9hzL69+r
         zyyLWoNx6nUj5w8N4IHSF/b5eo1oE77pblZKF+SlnR/vK3EKl4j5vBXOSx7gdP/pku8O
         oIG6raPyOfSqe8WMMIhdY0q/et03saqShLg8noDXjHojdDlulk7FvOuAurRa8G4EQ1D3
         crBWMpnFPqFbA5gboWFJXjZ+YeVdR9NPy95NOIgZLriADR8s2IbW66m3r+td5rr8lMKs
         Nxzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Iu0xJbYb;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22be10cb596sor56444905ad.5.2025.04.14.08.30.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 14 Apr 2025 08:30:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Iu0xJbYb;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744644640; x=1745249440; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4v87EGjTuaQERVq3RVHNWa3GtHDbP3djfUZXGNYCVw=;
        b=Iu0xJbYbnLbTIufdf0i3RqafF1zVYy6GBWdbWVuqekavGuluPqG7Q//fhscnifu6LU
         NFCbtZlNqZUUgqWBfic2zf2W5ep653+/QuHsojAE82t8F35J/X1QKc8FQIVzrMMRXsTi
         uNR3XRzkunPFK5QYkIwoG6sxK0HlDBfago8u1UdApFquRm3PvmIPxxixktq/G5D4ufKc
         Wwd0/qioXLfWBSaaXBRcywTCFnBAeiEySN/FsI0ZlCoj74yVTe0F3imv9g6HM1T3wdn/
         xTBrzFiso/EwJZjPl/27iwHI7XzwLoi8aXkVFWRc8dzecO58IcaAZRdXV0PI1728wpOE
         OVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744644640; x=1745249440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4v87EGjTuaQERVq3RVHNWa3GtHDbP3djfUZXGNYCVw=;
        b=CKUZX2QEhZrY1uLnsOubp0t+ybO853kxmMuWekB4SRKw2cxX/aBH+DygSIJYyRpxKy
         dL6Zizv9YesOvYAEj9lXhvoVBeucnkGNS0aTQigPnoWreK80pUReFv2Yzdsdrvndpl/G
         5jOC97ngm5TtAi+9IijquNHVEipR7/ivGHJXvJwmaW0sx+kF3fdYOOx9LM5Oc/h166Kc
         E+aKy6yLyEtcfsgR05VGHHJxGzSZzYDn4Ci8YWi+y7iAV2rJwReY3QChxQeUmlZYmWLT
         S9C4GlycalsrqoRDemxvNyhuQEvY7PStFGwO8bZLJtVzzH7BPyfEcyH3zzWrpz3R4eIw
         dTXw==
X-Forwarded-Encrypted: i=1; AJvYcCUeSiAcf4ZJMi6BTvVVy2q8WKIfUrIeOEw67uliDG2eGujMkbqC+Agii21djBZOkvCDVmBr2NcSlRP5sg==@linaro.org
X-Gm-Message-State: AOJu0YzlyUsT5pwU/sSGiSOF12vK/u+ecezO7+Tqj0QCu6mu4VVPF4Pp
	JGqw183+jTa47T/0tD81daSr6bON6T+bREP2PHl4S9LQgLbR4bRhXTn3nX6VeO8/CQ==
X-Gm-Gg: ASbGncuuIvwt8AuGH8f334cu5j5NKh8B6Ey1DGoW6JRDeFfD6BSTHnhEQ8qZtGRSqoV
	wGrVdJg7jXXeqHBorK8qZqFxgYkhjebMkHcW6tuKYEnH9Q+Lbmcjpo55fVcZUHuzKQdaqcHtf4q
	9cOCufl28IMUp6SlmjdSD/3o7XHRVYoTNejKnx3/etHqJ6h5GPvCk422o/ZvwiVRX8ROHNwrmhD
	fVMDIMibJXwOVXkujwl1C7tMFuqJbHRtWpodlr5/fnpjSnFZ3UzBNPSzsALmM2uyndnbdzUnM54
	Woc7xjnEMQPYxb8yz4m9xjGmH/pze7Z6RX5u8zTIDuKClIDnknU=
X-Google-Smtp-Source: AGHT+IErOMe/2SumgHtLOhL72nnzAQPEXbOu62JvPMBkg7DycAM+FmSMWOFseN/zpAk5e4qGNnlOvg==
X-Received: by 2002:a17:902:f64e:b0:223:f9a4:3f99 with SMTP id d9443c01a7336-22bea4c76acmr193097885ad.29.1744644639773;
        Mon, 14 Apr 2025 08:30:39 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccbd5esm100735235ad.248.2025.04.14.08.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 08:30:39 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Yannis Bolliger <yannis.bolliger@protonmail.com>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 4/4] target/arm/ptw: fix arm_cpu_get_phys_page_attrs_debug
Date: Mon, 14 Apr 2025 08:30:27 -0700
Message-Id: <20250414153027.1486719-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414153027.1486719-1-pierrick.bouvier@linaro.org>
References: <20250414153027.1486719-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: XpohJM4ndz7e

It was reported that QEMU monitor command gva2gpa was reporting unmapped
memory for a valid access (qemu-system-aarch64), during a copy from
kernel to user space (__arch_copy_to_user symbol in Linux) [1].
This was affecting cpu_memory_rw_debug also, which
is used in numerous places in our codebase. After investigating, the
problem was specific to arm_cpu_get_phys_page_attrs_debug.

When performing user access from a privileged space, we need to do a
second lookup for user mmu idx, following what get_a64_user_mem_index is
doing at translation time.

[1] https://lists.nongnu.org/archive/html/qemu-discuss/2025-04/msg00013.html

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/ptw.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index bf92c165175..cdcb6a49fa5 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3655,5 +3655,25 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
     CPUARMState *env = &cpu->env;
     ARMMMUIdx mmu_idx = arm_mmu_idx(env);
 
-    return arm_cpu_get_phys_page(env, addr, attrs, mmu_idx);
+    hwaddr res = arm_cpu_get_phys_page(env, addr, attrs, mmu_idx);
+
+    if (res != -1) {
+        return res;
+    }
+
+    /*
+     * Memory may be accessible for an "unprivileged load/store" variant.
+     * In this case, get_a64_user_mem_index function generates an op using an
+     * unprivileged mmu idx, so we need to try with it.
+     */
+    switch (mmu_idx) {
+    case ARMMMUIdx_E10_1:
+    case ARMMMUIdx_E10_1_PAN:
+        return arm_cpu_get_phys_page(env, addr, attrs, ARMMMUIdx_E10_0);
+    case ARMMMUIdx_E20_2:
+    case ARMMMUIdx_E20_2_PAN:
+        return arm_cpu_get_phys_page(env, addr, attrs, ARMMMUIdx_E20_0);
+    default:
+        return -1;
+    }
 }
-- 
2.39.5
