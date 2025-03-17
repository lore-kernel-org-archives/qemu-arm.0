Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2284659njb;
        Mon, 17 Mar 2025 07:29:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWR/HRYVFMAfFj9E8dTpeLKXpT093x09oKTVyN0kpto5G9eC7vFH4uswksoMBRCrSZHlLVnxTB6CRzWjg==@linaro.org
X-Google-Smtp-Source: AGHT+IEtTjwbQV7lP5yqEo5DrbvvBxICTFidfVpLaPwjiXOj45r+NPIJI7H4Gsvg5EuppFlgwP9k
X-Received: by 2002:a05:6102:2b83:b0:4c1:9328:107d with SMTP id ada2fe7eead31-4c38323601amr9255076137.24.1742221781884;
        Mon, 17 Mar 2025 07:29:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742221781; cv=none;
        d=google.com; s=arc-20240605;
        b=UfW5dyylNjXDYtVmpFKLEsJlk66C5Tj+6gnyemh1MGl0WDTgiNz39ym5dIfU/UMX3x
         BylxRKym/DJJtlUmlpKOgW32ny6lAz2siXujK6LmMpd6rw7JiJVbIFvAxoYg00WiV2PA
         WZD8KH3QEncvu+Ff7vrfXazvturIu+cYjezU1EnmSQ8Y2b9dYsUfASmLy5477/8VmIrD
         7hl2wqHVAhjG52hqVY/DFlRO7shAI2m5UojtZYy713ufAjvaDMLSwCmZcpFJRYt1E2fW
         /wvw231CC3rE7nE0YTAYRxUzn3EWbgT556pRcPTOGLzpXvLCW4WHxx2Ed0WJsd3pOjn6
         X5iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=atXgH53MeniOdFRyZrcV1yr26nprAD2zadvZy6dUHWo=;
        fh=67uEhL0k/mKU2J+7vrwJ/SHM9gtVoUkJVBgqzVTLM0k=;
        b=cxRt/52WKEigcbBgUeB/m1HOUbK17SmiCQVQnEURO0fMMeJqxVYCdnZL5IT6CHeAwn
         xgWwAhr6jAmF4/RBx+PukQpXNzWDy400BeN0mDAczNKxucm0bzKZnrLNDIh8yRZGbLWd
         g3Qc8HWwvJh5/gRbnYgO3lIPAYNM03DlCH83vkcismwMDqhoxz1EgIijh7k4UvdLPMcD
         OQvr2N02II0DR5kMfC7jgTiqy1WHXfsqnzzQfakpAgXlli9TsjeyjzJQhR/wLuqL2TLR
         R21FwHv5nm3YMBCARDX5oO1NNV7TOtvXFJouBX/4iwEJ0qRqccuxOSca1N9/UYFdV5cp
         BpaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UCugk+Vn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-86d90d9d0f9si2461362241.60.2025.03.17.07.29.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Mar 2025 07:29:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UCugk+Vn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tuBSP-0000oU-FC; Mon, 17 Mar 2025 10:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuBSA-0000bP-KM
 for qemu-devel@nongnu.org; Mon, 17 Mar 2025 10:28:30 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuBS8-0001Ag-8z
 for qemu-devel@nongnu.org; Mon, 17 Mar 2025 10:28:30 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso23339265e9.1
 for <qemu-devel@nongnu.org>; Mon, 17 Mar 2025 07:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742221707; x=1742826507; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=atXgH53MeniOdFRyZrcV1yr26nprAD2zadvZy6dUHWo=;
 b=UCugk+Vng20OsnjC+Q6M/WVE+ldyhjzLLmsrGW6lWVcAgmrtNsaStoFm9R2CzdFmVa
 S/QkjOOFztyn9tTBjp8a1KHFioW9yNZDzZcsu5xmo2OccFDwDeObFKtZKAZYSRjXcq7n
 l1h1C0bX5cyyTu9BLCtnzHNAhUkxRVqVvSdo1RZe76BXJ3qFH+KdOtlzlSPpkt9CjrbI
 Yb5tCubVitJheIi0k3DfYX0q6veoeNyENHEfVWLf0vJqwdovaWHdDdLxEyT81N/LqAg+
 WfMJj2RuW+cC1pWHwn25HMyESwyLsxsmJLAmpqt7mKRMERlR9dQ+oslaridZYlng6iV+
 wGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742221707; x=1742826507;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=atXgH53MeniOdFRyZrcV1yr26nprAD2zadvZy6dUHWo=;
 b=Pm69YHaoA1sPZroGhs3XAqsMYIOgyqYgkcwoiD52yUYqlnqL2tmsi74Hnt/K43Fybu
 2VrCDFVGxCkTmgSW5URZQnIHGevtJbcCPSMUPZXZfuIXWFwJJnQu6Xsi6sHAAKaUHDke
 3IYJ4v1NBYrk+r1zWzqtLd799jhin2FgtqRj2qfpgZgH1NlL0VOlhYKp5Tg4r0JSm4W0
 6Vo1GlV52oJp/n9LZY5/0UWuMXuwRW8BIlL3rxQ65EsfUXRyQ7uqswKa6kNtb20HK8u2
 51e7395+jRyxwL/Bk+GVmjsP1YWAKLwpv933YA6VKH0UlFJfpu81feQjoW9a0bjnma0n
 6Hrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5lcYjxCf4MwlqB4CUskFFXC7RcJf0mP7i3SBxq0/OAVz3uHTnZibJWG+xilHeAn6vxbQ3Z8oH4lvB@nongnu.org
X-Gm-Message-State: AOJu0YzzJ3aC8pLIKgU/Rs0GEMGc0aZIaotWzYpHV5yCKUqhI3a1CrRB
 Jsdis7/jFRSnxzKkXRXS9/E7XiAN7YaVTsisiFIxumr4JnhIaXLQxxz16w5rNuE=
X-Gm-Gg: ASbGncsxSBObt90rp7y5C127QbSiByQoB0FvF2Zlmgg/UmwKyfA95DprN9yFv5Mv3rA
 +MJfz0ulsc5Xo7kFrHeBm29Au4zVBE2Q8w7ebV50zLZsKWMkglyRMjlSc399XoGt93g0+AuVl/N
 s7RLutcPpPOK3bZRsz12YHNadVYW1ibRVYxB1imuY6NSuEYd7iRRBIMid4c0ONB7SehF4p6B5m7
 y5GLV4qXrdMoYOH1sMBnVlahhyKlkB9XvzV8m1ow25en2p2YfTWYzGunV2sugg/mgd+9tVBJHg2
 o52dy3sIg21HVnXENsKN1Ru6lvlm6VYAcxCJY63d5MqsF0Q7ozA=
X-Received: by 2002:a05:600c:5489:b0:43c:e8a5:87a with SMTP id
 5b1f17b1804b1-43d1ecaa83amr145402645e9.16.1742221706689; 
 Mon, 17 Mar 2025 07:28:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe60ad4sm107914985e9.29.2025.03.17.07.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 07:28:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-10.1 5/9] target/arm: Handle AArch64 gdb read/write regs
 in TYPE_ARM_CPU
Date: Mon, 17 Mar 2025 14:28:15 +0000
Message-ID: <20250317142819.900029-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317142819.900029-1-peter.maydell@linaro.org>
References: <20250317142819.900029-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jxRdpkbTfYJB

Instead of having the TYPE_AARCH64_CPU subclass set
CPUClass::gdb_read_register and ::gdb_write_register to different
methods from those of the TYPE_ARM_CPU parent class, have the
TYPE_ARM_CPU methods handle either AArch32 or AArch64 at runtime.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c   |  5 -----
 target/arm/gdbstub.c | 12 ++++++++++++
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 3094df366ec..2f87df082cd 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -815,11 +815,6 @@ static void aarch64_cpu_finalizefn(Object *obj)
 
 static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
 {
-    CPUClass *cc = CPU_CLASS(oc);
-
-    cc->gdb_read_register = aarch64_cpu_gdb_read_register;
-    cc->gdb_write_register = aarch64_cpu_gdb_write_register;
-
     object_class_property_add_bool(oc, "aarch64", aarch64_cpu_get_aarch64,
                                    aarch64_cpu_set_aarch64);
     object_class_property_set_description(oc, "aarch64",
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 30068c22627..ce4497ad7c3 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -44,6 +44,12 @@ int arm_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
 
+#ifdef TARGET_AARCH64
+    if (arm_gdbstub_is_aarch64(cpu)) {
+        return aarch64_cpu_gdb_read_register(cs, mem_buf, n);
+    }
+#endif
+
     if (n < 16) {
         /* Core integer register.  */
         return gdb_get_reg32(mem_buf, env->regs[n]);
@@ -66,6 +72,12 @@ int arm_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     CPUARMState *env = &cpu->env;
     uint32_t tmp;
 
+#ifdef TARGET_AARCH64
+    if (arm_gdbstub_is_aarch64(cpu)) {
+        return aarch64_cpu_gdb_write_register(cs, mem_buf, n);
+    }
+#endif
+
     tmp = ldl_p(mem_buf);
 
     /*
-- 
2.43.0

