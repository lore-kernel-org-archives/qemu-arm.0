Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94484njb;
        Wed, 7 May 2025 16:43:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX7K1vwnoRZQyJ4vLOfgJEhd5aONeLrumW5dQgCaV0DndlT2la4NBE1dyYbWrnjLkK6BfwlisPDLqcdww==@linaro.org
X-Received: by 2002:a17:903:1a10:b0:22e:4509:cb8a with SMTP id d9443c01a7336-22e861d5bdbmr19050175ad.21.1746661395443;
        Wed, 07 May 2025 16:43:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661395; cv=none;
        d=google.com; s=arc-20240605;
        b=K1EvBu4z0InrCEK4F0tSTqMlOIRD8hDpIa55PkoZ9WnnwjFlHazuOIGUtgDgHvtBmB
         EVgCezFeFXvcDu/sFSZeH3ucrv7N2UDqgwDc34Yu0/ZEqilRhWR664vfNQGdpfLPdKku
         t+98aS9mjHgHk3jwRyiTHaWkscg7xSMk9iq5bRtYq8H+X9qi3q5adCvh6hLyEZWTNetY
         N0m/tSG+0+871miNRrcZubiakEmpW+iegXAq/6KHJ9aW4uF5tSujxRvpZsSB9/Jf3JUa
         BKaJN5knR/xamDGx4b1lDO6sKWelM0oMT33DqyE8HWM4+uiSuoAWmmwoFA0BkZOCpCr+
         KA9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=HNwQBodHKU/YNnzJ0OLvvAjHAnJFIjZ/+9H8rnLNev8=;
        fh=PUh78wDMW4Xr9VBnVk4GxeanA0lwvFhvT+Sl+m4kcDw=;
        b=A1I88+ctC5nfW1T56ANzkBFvYCuLRqDj6SePnfRq/NpA+EFWhoSe7ZcOssz1hzW5yA
         9Reh58Zg5qspEJ2Y7Yc3aqttdV++7oV3G5gYO0+aVelFJA1FXHWb5I1AE4D80dke4uLG
         YHA2X20WFYacajrzva+Vu1I/5Jw4mmqAOxNMrNL0STGsJzZY5e0odBTOEZte1/Y5cocT
         6VoF9N/ycIiw9D7lmuVUomFvejPtLbLqf8rpmlx/hCEQGSK5AjGIP4AO8MEcLWAhRwRl
         OohtFwvL2uJKbCoexm7pF7I7Hv2EQ2e6bKVqe9BrJBlBQyXHbasU+RD6egQlshEANt1c
         73ng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G64TV2nX;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb0bc86sor93118685ad.4.2025.05.07.16.43.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:43:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G64TV2nX;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661395; x=1747266195; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNwQBodHKU/YNnzJ0OLvvAjHAnJFIjZ/+9H8rnLNev8=;
        b=G64TV2nXtEeW+8lpYJNMknWKb2NqcNR7CmF3iiqwDKL8KkktAn+AoX0voZU09BFnu5
         yUiiIOkJjfp6XFKxiOH6VLDc/1RE9GIiF+O/PHzfRid+G78rQ6RilNryGUCbf/v2uPDW
         73dPJTmvrRSqZ2EHzZYgf0XTRybA82dbV0l+17rqWDcMeakBF7BysGy/kT+bj6AoOqdX
         y1rw/NG7AqsoawsUAWLqOxzMXpbOobjiksNfTvZCCTyCVcts54CTB+XGPxUU/TI8scxZ
         0TzHco3HSMr2ESuFZZFUUT4eQeXTrZOxlhndki6ugtheQbjrApt/CNA/+QNYHURCICJp
         4ThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661395; x=1747266195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNwQBodHKU/YNnzJ0OLvvAjHAnJFIjZ/+9H8rnLNev8=;
        b=NZm/UmZUpvvE6AMa/pFkVqD7owf581wcVvknpmT0muGxQDBboLbbw+BC/ZvGl49XxD
         H7vu0xdb8MiJXa3QrBpxDzVZOgZbH46tO0jSowR7eFg2TOGDmOuIYXVbj4YxN1wos+9W
         Yiswe5axd7pViq8/amuWV4l8d+KKPHF1wXr7QIWxiIDmoRox4KpJ+HiLfVmpEJTg8vC2
         McA/bSrGuMDdGEzAs1fAFy9KxKheKb+3B+RO/v2SJRDGMTQ7Dw8Ut3W/EfQvhGFTQGO4
         Qly5dJuz48MJTURoNQTOeGIBh2oHzgVS8hg/pQFH3X+XdKl/c/TlLztkzIH9lkBSJmHk
         VHyQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1IPhbSNn9eRGna5tCLzbya0eA78kkthHp5Qmml1pjCTomr5UEIJnuxG112V02lLb9rLg3m8lJP0v/4A==@linaro.org
X-Gm-Message-State: AOJu0YzcB29dFnQruUCoUCPgUDGia3PWjbjuLLdD2CSYNUcHOskic4D7
	5ftC2Lz5XY9CBL4g5rXo2ApB+qcdtdEV3NmugkmLif64N/ErkFMzHyjsOfstvJlOVg==
X-Gm-Gg: ASbGnctDYF0pzfo38RXUuIYt4LzxIIqa6QSimNPzEXZBsG3xkt0m/41Gz4KaQ46Lwio
	whTMzsc2tRb49xD2IDsmc42EEss0D8GahPzdvpCJ0soqgtJBFB6OHMYaO314LQOtO+dOpt4k8nf
	mTc3wlTsB4bPpQm3MTQP7WSO/iu7+lEyCCdqbWQUSZWmQI3d972Ly0R8RZ2aZUTFVPceJZegusF
	epRIcGdcLio7RmgFrRxQoZGNdET2T7ZWdRGlxJ7J6d1e2NnF7vDLRhq5uk45V6TAgd8T7Za/OJC
	C9M0u3hcJjnt8KdB0sIqMdkd+DzQe2H0zD8vOhnu
X-Google-Smtp-Source: AGHT+IHzJdvFnh9XOsFcRbkcBf5qvX2uV6HTIjm/MkuKOh9F3IM/eLfP1ilS43wd1wjfnqd63Z7PaA==
X-Received: by 2002:a17:903:2b07:b0:223:5c33:56a2 with SMTP id d9443c01a7336-22e863e371emr16940145ad.28.1746661395022;
        Wed, 07 May 2025 16:43:15 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:43:14 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 37/49] target/arm/machine: move cpu_post_load kvm bits to kvm_arm_cpu_post_load function
Date: Wed,  7 May 2025 16:42:28 -0700
Message-ID: <20250507234241.957746-38-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: F2H/iuYQ4za3

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/kvm_arm.h |  4 +++-
 target/arm/kvm.c     | 13 ++++++++++++-
 target/arm/machine.c |  8 +-------
 3 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index b638e09a687..c4178d1327c 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -83,8 +83,10 @@ void kvm_arm_cpu_pre_save(ARMCPU *cpu);
  * @cpu: ARMCPU
  *
  * Called from cpu_post_load() to update KVM CPU state from the cpreg list.
+ *
+ * Returns: true on success, or false if write_list_to_kvmstate failed.
  */
-void kvm_arm_cpu_post_load(ARMCPU *cpu);
+bool kvm_arm_cpu_post_load(ARMCPU *cpu);
 
 /**
  * kvm_arm_reset_vcpu:
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index b6c39ca61fa..a08a269ad61 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -938,13 +938,24 @@ void kvm_arm_cpu_pre_save(ARMCPU *cpu)
     }
 }
 
-void kvm_arm_cpu_post_load(ARMCPU *cpu)
+bool kvm_arm_cpu_post_load(ARMCPU *cpu)
 {
+    if (!write_list_to_kvmstate(cpu, KVM_PUT_FULL_STATE)) {
+        return false;
+    }
+    /* Note that it's OK for the TCG side not to know about
+     * every register in the list; KVM is authoritative if
+     * we're using it.
+     */
+    write_list_to_cpustate(cpu);
+
     /* KVM virtual time adjustment */
     if (cpu->kvm_adjvtime) {
         cpu->kvm_vtime = *kvm_arm_get_cpreg_ptr(cpu, KVM_REG_ARM_TIMER_CNT);
         cpu->kvm_vtime_dirty = true;
     }
+
+    return true;
 }
 
 void kvm_arm_reset_vcpu(ARMCPU *cpu)
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 868246a98c0..e442d485241 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -976,15 +976,9 @@ static int cpu_post_load(void *opaque, int version_id)
     }
 
     if (kvm_enabled()) {
-        if (!write_list_to_kvmstate(cpu, KVM_PUT_FULL_STATE)) {
+        if (!kvm_arm_cpu_post_load(cpu)) {
             return -1;
         }
-        /* Note that it's OK for the TCG side not to know about
-         * every register in the list; KVM is authoritative if
-         * we're using it.
-         */
-        write_list_to_cpustate(cpu);
-        kvm_arm_cpu_post_load(cpu);
     } else {
         if (!write_list_to_cpustate(cpu)) {
             return -1;
-- 
2.47.2
