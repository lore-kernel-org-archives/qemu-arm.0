Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp210006lfo;
        Tue, 1 Mar 2022 14:00:32 -0800 (PST)
X-Received: by 2002:a17:90b:702:b0:1bc:6d8a:70e0 with SMTP id s2-20020a17090b070200b001bc6d8a70e0mr23703586pjz.137.1646172032045;
        Tue, 01 Mar 2022 14:00:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646172032; cv=none;
        d=google.com; s=arc-20160816;
        b=zNQkyUCOeZ66w1swo54Ptb8yDDfZZYGtSNEzcXgzTSgWE4189orrxdqKfl6YrZUN8B
         13yb4xj0kzHnZiWUMspLtwcAv2CcmoDTyCDeQs3/qHFCGmAUyABqv7XHXsqdoWNcAiH4
         i8Y+tDvRZ5/WcXlUmHV/jNU7IROPAlhqHiEyPf4WeVI2oHoUbNenU6UFB3P6Nu6Jzplq
         k7ggYKY5QR2h8gGTdfPj3SnnRf8a9c703Nft+HM5P84HQpH2W0Mgk3JFvkhvxArEq0B/
         rzqgdrPoDOCkYUy5ftAVUDsgMp7Y/PQV8esMIZBH7aJgPifbDCU73EV48X8jiZPHCzx6
         QjoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iLI26UK0ClZ5ceLdr/V+YxsQZY+vXN5fVFJqBZWb1js=;
        b=a7XsvekwxZhGW+pMu8OJ6Ucs2OWE9jIozwyQhS67UluXZi+aWvCjfW8HLuAajXupWE
         hy16dfG+YsVfkmTX7qbmKWynEhuA29rl+KcgX9uvo13NCsaAIDJdM8G6aeTlPyU6VD8J
         OvfyzbjudF4ILcr0ueD9Sd7Jrws1ryqLsohHv/Ve9dSBRNEWWRhsO9dsssXjQMioqwtA
         l9Hm/GkxIzEUOQ8JrQsLsT6OJKOYEhGmozGh3D7wBEBth4pi87uvGtzKIHjZISv0Nxuu
         wCmNsEBdTtgL5CQCZMzng1tG6RYxZ7aKpexngaLf1PMf0GU+p48NhIjB+Lkdbtu9iawM
         A/QA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GfFDE2bF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h7-20020a170902b94700b0014fe928999fsor7158886pls.79.2022.03.01.14.00.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Mar 2022 14:00:32 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GfFDE2bF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iLI26UK0ClZ5ceLdr/V+YxsQZY+vXN5fVFJqBZWb1js=;
        b=GfFDE2bFDZ+5PPhFBgKKvyFW2AVfDfF5JcHtKMFiV2VTtvKhIC9AcyMWZQf1ubJnVK
         TOYfmT954iUkgtYMP2oDkexrhe+lVgu9nttCCNB5evxfWm/4kiBaGu0cvpowwMiKXfQy
         FJbIvZirlcjatMpvCRwYDWy29Yrl0canwp9rQ2H6EcNXtdr15bWBhvq8I+D5N2ZwjZVb
         hIIYYv4vV/yu5EfXyLjgV+gMN5SsCMTMvnzOkrWYY3PPVaWRzBAm8bEPCGj7LyT/hS4s
         yG2p5g/gSp6oYsuPRq8ebLkgCy43k+/PZ6CS15Vgz0rzDXagSesqvFP2xdnJV7hiShmK
         9Ojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iLI26UK0ClZ5ceLdr/V+YxsQZY+vXN5fVFJqBZWb1js=;
        b=nlOnuD6Qv5gRx1OS7agH8JB+JxRSg59Yzmua5F/sgpFvW8YIHzxV74JUJMb8nciNI6
         QZ8teLm0IE05CtilzSy3o92agZVUQPILnYjrvrz9fs/+NjzEpDCSqJjJK0N39bXKTbi5
         QXvTBz1GeFjxiNbSLBW12jwLvYWVrryMmCeJpeFEsmDRhhIy0jFC2HUggm7tIM4H5tH4
         dEkoN1x/wl0m+MYZjl7g6KbCcr+DEd8Nj8dJTWYAcsn/BG3S6SyfVjfw8bVcO0qOlKZV
         q5ZvJAaz6xTBz0C8RVob9tdxP7vqXAQKEL4h3em2kfmwullESYOHi7AREkT2PJwD6stZ
         HEvw==
X-Gm-Message-State: AOAM530+iynz7oCLsPuQz7tONKBtFJ7SpalK8k4gQJPT2ZQDMlAbRqWQ
	WAYOhZnT1QiOatC7Y+iS6CaNZ0hu
X-Google-Smtp-Source: ABdhPJygwAFOEOCRH+heEJWiAr3FTKgqIS8lf27Ehxa4julYAdm0dNBwHw1PCfAby02wmqOOISTeaQ==
X-Received: by 2002:a17:902:ea05:b0:150:1294:cd91 with SMTP id s5-20020a170902ea0500b001501294cd91mr28201707plg.112.1646172031520;
        Tue, 01 Mar 2022 14:00:31 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 14:00:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v4 18/18] hw/arm/virt: Disable LPA2 for -machine virt-6.2
Date: Tue,  1 Mar 2022 11:59:58 -1000
Message-Id: <20220301215958.157011-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: uq/fwjB/O/tn

There is a Linux kernel bug present until v5.12 that prevents
booting with FEAT_LPA2 enabled.  As a workaround for TCG,
disable this feature for machine versions prior to 7.0.

Cc: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/arm/virt.h | 1 +
 hw/arm/virt.c         | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index c1ea17d0de..7e76ee2619 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -132,6 +132,7 @@ struct VirtMachineClass {
     bool no_secure_gpio;
     /* Machines < 6.2 have no support for describing cpu topology to guest */
     bool no_cpu_topology;
+    bool no_tcg_lpa2;
 };
 
 struct VirtMachineState {
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 46bf7ceddf..46a42502bc 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2102,6 +2102,10 @@ static void machvirt_init(MachineState *machine)
             object_property_set_bool(cpuobj, "pmu", false, NULL);
         }
 
+        if (vmc->no_tcg_lpa2 && object_property_find(cpuobj, "lpa2")) {
+            object_property_set_bool(cpuobj, "lpa2", false, NULL);
+        }
+
         if (object_property_find(cpuobj, "reset-cbar")) {
             object_property_set_int(cpuobj, "reset-cbar",
                                     vms->memmap[VIRT_CPUPERIPHS].base,
@@ -3020,8 +3024,11 @@ DEFINE_VIRT_MACHINE_AS_LATEST(7, 0)
 
 static void virt_machine_6_2_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
     virt_machine_7_0_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_2, hw_compat_6_2_len);
+    vmc->no_tcg_lpa2 = true;
 }
 DEFINE_VIRT_MACHINE(6, 2)
 
-- 
2.25.1
