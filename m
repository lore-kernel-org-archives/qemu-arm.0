Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2458675dye;
        Mon, 30 Jun 2025 06:10:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWz1DI8zwTpMk5lUyl3yQG74IQik+oE8vqmkJ2ZgC9OudL9wxHGYagDYPk2zannXZmsSG5LO45I6K0ksw==@linaro.org
X-Received: by 2002:a05:600c:4f12:b0:450:c20d:64c3 with SMTP id 5b1f17b1804b1-453a439f15amr21460395e9.18.1751289008147;
        Mon, 30 Jun 2025 06:10:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751289008; cv=none;
        d=google.com; s=arc-20240605;
        b=ONVAVRFeHzmwLjjaZYUjXhpgs8zAimkquc0iw18HuhNX3ejObQDkvsvJI/4p+QasSi
         H4Q5WLBYD+yKAIf13JS6sOKaPOWpfjSnpMvNC464uow1078vVWkK2td/eBVaNE0uTrlJ
         zPOg6hPdTJgFnAZWEymHjz0jK2Z0z6Ma70thtd/xdKydftq5+Uug9hKsPqu6Xq6zMO47
         trg7s6dfwwvd/auAhJCxXNsK+mbRFGnv0js3HQI0PMK9xeEs/lg9we8FMGQ9wpuZ8OcD
         jr8/16Wrocaz0HBeC2gMhw8LlO6zD6KGXxqhO77IQ4Uw/YgxP4YiW2GkHtCCsR04GvIS
         peHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7RlmNXlhYATHcqGzuUYY9u+iNysqBplPIi1ujnVq9xc=;
        fh=eOnGSX6dsl/9HWSrcg2W1E9EbplWsjB6wbltBxDERC0=;
        b=hXr8NhXj1gkxNnTJ5aMRSfn8ObyA66QZrHUSyOlk0azt57W+FeFZ6+b1BES1zyM+hU
         geXNSXQBYrqlcKfJyyorfMDXMEWSNkppH6YmfEDuL5Z4cEz9x50vX6+l5g5fIscGyTAv
         uLHKrfKxpo+e0UuTK50ca46L1r4kvxA34aidM7YFrLEojTe6gMs0Gv7YK7IKEgXVDUlt
         WGdyV4FNng9ZGtrM3cSPF03hBKsCcXGRt7QABTEp0mL0DlVn2ioosWtl/EkVycw63qcr
         iiiAoO+FAMsptEdLfMAUtU+gTaOoqouNg2Q+PwvJ/5i4fAm65J0vhgOAs7Mh1NrZVyZH
         mxiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dolKZjuJ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4538a492be2sor39728925e9.8.2025.06.30.06.10.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Jun 2025 06:10:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dolKZjuJ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751289007; x=1751893807; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RlmNXlhYATHcqGzuUYY9u+iNysqBplPIi1ujnVq9xc=;
        b=dolKZjuJDkH/U06HRnDFBcIu9fOquFJrSstacBxaqY6QN34e9kQ3FW6X9kvDVh7Ioq
         jvoGVFD/DBD93ROoxQbPAuiX5z5Py/ZW3v5kMIA/VvajcNhKCzsp/6I/hSZ85vWcHcO+
         lTWzr6ROrJLWSJ4QTR3x9NI4/PdMhk4Pl+Sdi1rW+8DWzBkyWaXPzXtIBeW7r8taVhv/
         99G65oTpOsvTMwUh+Pk7w++GyVrc5PL16To7P5ekIGuMxiMfE/UVH0PLrzUxbaeketD7
         YK4DBqQoYf6raAHCLBlU//uk8kRvA0N8SuoMnNMSj8NhNzo7BQmIPpGWBRR2lSKLjjO/
         q9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751289007; x=1751893807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7RlmNXlhYATHcqGzuUYY9u+iNysqBplPIi1ujnVq9xc=;
        b=SRrngdrU63X7cDQau2zOZwtHfqIej+VYC9yFjFbWzUL2e5q9utTpoR680ioXDLJpUg
         shKQitEPI/fAn6ceLCbZpEUorql5LMD1E+7WP/0dhFdV1pL0z3F4pSssVXSsrCRGxXVF
         LW8bk1hRWnwCgFVX9wZ+J6BFYbl3CFltSnT9QrLAmUQpQVA/4eoAKc7UgDKEE+tIVSdA
         c94nu4xzilbWeDthSD7BykjL/+kWjPp5iGGs6hf+YrsXNAPxZ9kPtZisMXhS3tYsZgM5
         TqJoGMaVVxFthr3hidOu+7JUgxsIyh9+p9KSkIHFcU8I0bopFGSpWEfntHaRGI+H2nej
         w5gg==
X-Forwarded-Encrypted: i=1; AJvYcCUU+7heHFl/Qqtdzppk9p0vSirmEeM8rJix1uCK88jVQNsDdW2tAlkmhTO28G/Ivmu1tSOi0E2AmDBxCQ==@linaro.org
X-Gm-Message-State: AOJu0YzEFAwrzoMrbu8kZ20oBxu3UuBAfWe6AmTuuHhNsMgo8H7q1Pkl
	e0pw26aqsQmEA7jbFaewFrCN3QvafUXhTnDbxjqQl+uyvRarN01tUsnnjtwfNoenAtNnQA==
X-Gm-Gg: ASbGncvA6/4RwoSWfw2mxzounR6Q6rLcMweUTSL9p1EzfZ+gYt6ZlvDFYgIvpHUQF5E
	ls8NDO0773LoDxf24/FiMdqtvtoeiIxbMf5OUX3MKilu36aWKooTVGPWPYxH3KmgYnLHhVdBo4U
	IG6TvMBOTaiS1kQhsrppTQX+eX1d1NsAl8GYl3YCqXVhoET0NbgHXNWYVBe4yZNDpD3lmhQYkmP
	o4rmNXYyFC7xYLh7YQU3y+42YCk6EJKYvCR8Qcbjp/WP4P2l8z4iO27aZW3nAA4F2WmZgLCiCX0
	hvQyTSKtNRRKrPfQnx6arCh4rvkY7lBGnUVmHhnvsFevcU2WsAHB9dvirLbYZjlzHsyKwu+B881
	nP4lJF2yBFyfpuOhS88oSnM1u1yIpEYSWg1Df
X-Google-Smtp-Source: AGHT+IEDl8M5F+MobCB3JAO2gQTMzxkCii5P0pswMIQwCksbt96XXTeibZfmDV/cScD+EFyz1kmVaQ==
X-Received: by 2002:a05:6000:4204:b0:3a3:5f36:33ee with SMTP id ffacd0b85a97d-3a8fdeff5a6mr10622405f8f.32.1751289007376;
        Mon, 30 Jun 2025 06:10:07 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7518sm10255872f8f.2.2025.06.30.06.10.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 30 Jun 2025 06:10:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alexander Graf <agraf@csgraf.de>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/6] target/arm: Share ARM_PSCI_CALL trace event between TCG and HVF
Date: Mon, 30 Jun 2025 15:09:36 +0200
Message-ID: <20250630130937.3487-6-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630130937.3487-1-philmd@linaro.org>
References: <20250630130937.3487-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: U8PpsqVr4OQf

It is useful to compare PSCI calls of the same guest running
under TCG or HVF.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c    | 3 ++-
 target/arm/tcg/psci.c   | 3 +++
 target/arm/trace-events | 3 +++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 7a99118c8c2..6309c5b872e 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -34,6 +34,7 @@
 #include "target/arm/multiprocessing.h"
 #include "target/arm/gtimer.h"
 #include "trace.h"
+#include "../trace.h"
 #include "migration/vmstate.h"
 
 #include "gdbstub/enums.h"
@@ -1149,7 +1150,7 @@ static bool hvf_handle_psci_call(CPUState *cpu)
     int target_el = 1;
     int32_t ret = 0;
 
-    trace_hvf_psci_call(param[0], param[1], param[2], param[3],
+    trace_arm_psci_call(param[0], param[1], param[2], param[3],
                         arm_cpu_mp_affinity(arm_cpu));
 
     switch (param[0]) {
diff --git a/target/arm/tcg/psci.c b/target/arm/tcg/psci.c
index cabed43e8a8..8df27ca123e 100644
--- a/target/arm/tcg/psci.c
+++ b/target/arm/tcg/psci.c
@@ -25,6 +25,7 @@
 #include "internals.h"
 #include "arm-powerctl.h"
 #include "target/arm/multiprocessing.h"
+#include "../trace.h"
 
 bool arm_is_psci_call(ARMCPU *cpu, int excp_type)
 {
@@ -79,6 +80,8 @@ void arm_handle_psci_call(ARMCPU *cpu)
          */
         param[i] = is_a64(env) ? env->xregs[i] : env->regs[i];
     }
+    trace_arm_psci_call(param[0], param[1], param[2], param[3],
+                        arm_cpu_mp_affinity(cpu));
 
     if ((param[0] & QEMU_PSCI_0_2_64BIT) && !is_a64(env)) {
         ret = QEMU_PSCI_RET_NOT_SUPPORTED;
diff --git a/target/arm/trace-events b/target/arm/trace-events
index 4438dce7bec..a9cb5e0f5c6 100644
--- a/target/arm/trace-events
+++ b/target/arm/trace-events
@@ -13,3 +13,6 @@ arm_gt_update_irq(int timer, int irqstate) "gt_update_irq: timer %d irqstate %d"
 
 # kvm.c
 kvm_arm_fixup_msi_route(uint64_t iova, uint64_t gpa) "MSI iova = 0x%"PRIx64" is translated into 0x%"PRIx64
+
+# tcg/psci.c and hvf/hvf.c
+arm_psci_call(uint64_t x0, uint64_t x1, uint64_t x2, uint64_t x3, uint32_t cpuid) "PSCI Call x0=0x%016"PRIx64" x1=0x%016"PRIx64" x2=0x%016"PRIx64" x3=0x%016"PRIx64" cpuid=0x%x"
-- 
2.49.0
