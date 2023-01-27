Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1232627ejc;
        Fri, 27 Jan 2023 07:16:08 -0800 (PST)
X-Received: by 2002:a05:600c:5027:b0:3db:37a9:e5db with SMTP id n39-20020a05600c502700b003db37a9e5dbmr27468840wmr.38.1674832568403;
        Fri, 27 Jan 2023 07:16:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674832568; cv=none;
        d=google.com; s=arc-20160816;
        b=ilKoNlbPFpf4E8FX7ih8FnZqVsvk0q84VsiDB5Ia2eLjIDsl/FRJiZz2gTFE5/tuIH
         ZGIMd5vajVmpCgqF7sx1bG7MRkjwVOviyo3BYNFAAz3FQabQUHWFPOnsJPAK5KC81zB2
         496LlDFQ7wdMlq4tZqlsw70vJLvLnLRaYp/gD9n+GFUMvKC77FgIcaknbpaFDyRUqyEj
         4lt1HjyAZtpANpes9HF6Ory7iuX5ArRPRySrxOQnBZHvgD6q4B0aFIdNcZPiCm0aSdK3
         iLokOVrNA67EMq/d7bGzXlNGG9iikqLZsO3QP+XBZusqcaa2DLFV4vOCd+qtLjBmsOi5
         xkJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=W2Gttyqqmk9FJzTdv4GV6HEHY8zcoxRPE3NZzmrf+n4=;
        b=bslJ5jfw4RKirzGjyWmUO8lrGRsVJmxZFrPQJvOyaNVnueKYST+lO7fPMSrUrVy8W/
         eFRohqSEqZGQFLb2oB9Re+w2niIHn188pmz2x4Y/ia3MmHXMnynHDB7jQezYu+3udimI
         0UL7eNh41+IP5x/zUqnYgNtfdbgYtp4qoHnFGGdmeScbrCZhA+ogVXDoAY/4pKdCX5gp
         MN/DSijptyDNQMcihxOnzvRAPCVUT2XAU4w53ol18KaSSa8XlXvVH/buXbilo63GXdfZ
         3O70O+09EtD5As7WZqWcPPquwL5bb0SIS/s//kcWvfNIkEkDleWTCs15XTSKayHY88Rq
         hQFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VA6NUCDF;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 9-20020a05600c020900b003dafd2b2b18sor2881374wmi.25.2023.01.27.07.16.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 07:16:08 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VA6NUCDF;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2Gttyqqmk9FJzTdv4GV6HEHY8zcoxRPE3NZzmrf+n4=;
        b=VA6NUCDFx8lOL0Z+1x3S3zxS7fGzsnMOU3H/Iuknae4YporvaEybf2o8k99xXmXi6V
         EQqAGs342LLVqxVSoKJni7g9Cow+rAUCSbQ2RnthBF6g1P9p7jvy3pvwmvN4Yu2l2Je/
         Db7oi1IvUo4zgBlalajjgIUblSBXSoxthCrNE/3PSRFm3OmFnrdC3sr0hhCmCJGasT1N
         fCwnOQSvkQKRQqjNvhGLQaCBWEp/xqjlCPoXSulAm7n7bhRyqjGpSKNegbOF7dwvOwGv
         +0wUlT2SjecqMBe/3wC8YbB419IAovE2jsj3tqI1cIxVqc4bQ5b6itSXfiMQQtc4JqiX
         85Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2Gttyqqmk9FJzTdv4GV6HEHY8zcoxRPE3NZzmrf+n4=;
        b=r+8zuFWS8v74EV+Nuuf2sQU8ZrVwESTo0FRfOsK3TbkknBKhUkzwtggS+ber2t7/2d
         lhixpngFs/9O/yV1ERF1eL+0YneDM8futjI412ZoFLlCNClQqZ2cf3ne+9CX4wrreofg
         2IX3Pl+kmpvo8qEuNU28I9BU3/xew1NmIKT9JFT/hFAinElF+zxdBfKK7yrwWnjfhgB9
         zQtFjDRLAN1pqmp216/CiGbGxHQZTh2nG0QJuVvH0T9M7uxs/fcWlScYkAjvHkS25ltB
         1mKUwNbqQkh68Sbffknvu+1o6sadNrGRyY96Ib59+a84rwAHclLEARMhKD9o8MlLQIbY
         y+/g==
X-Gm-Message-State: AFqh2kobVk3qZxn7YxQTpvZMcFJWKqmPQl3/tOEo1wRq26uWN0GOjqMP
	OVAeroCVLcBpZ55heEAjN+hrVNP6
X-Google-Smtp-Source: AMrXdXsum66V9SryNqits/WuEqHeWo9nn9HzIUCwkYhiaMnfsqf9QZYrXWrHdPjjuSf/+nymGP9kJg==
X-Received: by 2002:a05:600c:2056:b0:3db:ce8:6662 with SMTP id p22-20020a05600c205600b003db0ce86662mr38049375wmg.31.1674832568124;
        Fri, 27 Jan 2023 07:16:08 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain (054592b0.skybroadband.com. [5.69.146.176])
        by smtp.gmail.com with ESMTPSA id l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 07:16:07 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	pbonzini@redhat.com,
	eblake@redhat.com,
	armbru@redhat.com,
	berrange@redhat.com,
	eduardo@habkost.net,
	alex.bennee@linaro.org,
	richard.henderson@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC PATCH 16/16] target/arm/kvm-rme: Disable readonly mappings
Date: Fri, 27 Jan 2023 15:07:29 +0000
Message-Id: <20230127150727.612594-17-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230127150727.612594-1-jean-philippe@linaro.org>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 4iq3R7NFmIfu

KVM does not support creating read-only mappings for realms at the
moment. Add an arch helper to detect whether read-only mappings are
supported.

Device ROM and flash normally use read-only mappings. Device ROM seems
limited to legacy use and does not need to be trusted by the guest, so
trapping reads should be fine. Flash on the other hand, is used for the
firmware and needs to be both executable and measured. It may be
necessary to replace flash with RAM in order to run firmwares like edk2
in realms.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 include/sysemu/kvm.h | 2 ++
 accel/kvm/kvm-all.c  | 8 +++++++-
 target/arm/kvm-rme.c | 9 +++++++++
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index e9a97eda8c..8d467c76c6 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -581,5 +581,7 @@ bool kvm_arch_cpu_check_are_resettable(void);
 
 bool kvm_dirty_ring_enabled(void);
 
+bool kvm_arch_readonly_mem_allowed(KVMState *s);
+
 uint32_t kvm_dirty_ring_size(void);
 #endif
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index f99b0becd8..56cdd2e9e9 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2267,6 +2267,11 @@ bool kvm_dirty_ring_enabled(void)
     return kvm_state->kvm_dirty_ring_size ? true : false;
 }
 
+bool __attribute__((weak)) kvm_arch_readonly_mem_allowed(KVMState *s)
+{
+    return true;
+}
+
 static void query_stats_cb(StatsResultList **result, StatsTarget target,
                            strList *names, strList *targets, Error **errp);
 static void query_stats_schemas_cb(StatsSchemaList **result, Error **errp);
@@ -2520,7 +2525,8 @@ static int kvm_init(MachineState *ms)
     }
 
     kvm_readonly_mem_allowed =
-        (kvm_check_extension(s, KVM_CAP_READONLY_MEM) > 0);
+        (kvm_check_extension(s, KVM_CAP_READONLY_MEM) > 0) &&
+        kvm_arch_readonly_mem_allowed(s);
 
     kvm_eventfds_allowed =
         (kvm_check_extension(s, KVM_CAP_IOEVENTFD) > 0);
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index 1baed79d46..2812a52aeb 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -62,6 +62,15 @@ bool kvm_arm_rme_enabled(void)
     return !!cgs_to_rme(cgs);
 }
 
+/*
+ * KVM does not support creating read-only stage-2 mappings for realms at the
+ * moment
+ */
+bool kvm_arch_readonly_mem_allowed(KVMState *s)
+{
+    return !kvm_arm_rme_enabled();
+}
+
 static int rme_create_rd(RmeGuest *guest, Error **errp)
 {
     int ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_RME, 0,
-- 
2.39.0
