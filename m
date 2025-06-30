Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2458606dye;
        Mon, 30 Jun 2025 06:10:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWgsigj7bM/g/fWMlYmBjiz/n+6XqdvQpLBn6yJPJHEpGOaTRd0+q4FCxzLFN8KWPXkkxqoWbqSKimVtQ==@linaro.org
X-Received: by 2002:adf:ea50:0:b0:3a5:52b3:103b with SMTP id ffacd0b85a97d-3a90d0d6d11mr9567660f8f.4.1751289002926;
        Mon, 30 Jun 2025 06:10:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751289002; cv=none;
        d=google.com; s=arc-20240605;
        b=DbnZA318FxAazDnObp+bORT/YgpKpj/ogDUrXfbdKKXjbP8TC3MRwcGxQ4fybkFvB2
         jDOVQBf76XRguOyiZEJCPvRR7grLRG+1U/OhjXS5G4uBR8MpSRaZRpoJHfC4uFgatU91
         5R22acB4NwWX6GdmgxV6ROJgGjIbpCh92xrBp8C2iLEuANZHQDXer9ggNUavqAQQskRM
         u3SdNeGGpIDfeQSJBPyN5yQV/4aHAT+JObeU+31OwSnxmWsQYQxwtQggQAdyjAwIZ40O
         OO06qTk/6mEf8znrzLbE4Bqkfwyfitq839WJAXD3aI2a2lKXDXlX3BB0O3nSGB+pAmht
         f+tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xSFZQl2Y1B+z5K8w8pr70pd1f08StcXXxObqPQRr5Ms=;
        fh=0oQrQKZAcu9HEaiEe5aL7PRzLuZRrm1CHjbRhJUzWjE=;
        b=Pe8uFt/yVK3FjY9f5isNSlyMcA5aMK9l1hBzyk+9PQj7B4wZYI2UMzGD3dai+4nqZT
         dQNevWoT7D/rqmmfqPxD5JwoybBk7FelvUdVDWMVt+UL0KKTXxLxkJfj73/NM6KumW8g
         pfpyyN4BFhipMMOKFG2dzP7t45GiprO1sNumlFWu2pyUYsoLu8tmXpRhUSqHN8BLJTwO
         YiaCK5nFsLCtWOQK6NVM1foGSbLT1gqOX8OChpB/geVHmm0QJa+CEQe5nO40OcktmPD4
         r+uZ5C74wx59O52R0W6uDt2mePL/ZNzRWna6q0l9/kfF7T+sedRl466snNKXUY/8JbBL
         va3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=beYmWEPq;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a892e5b7casor2040830f8f.5.2025.06.30.06.10.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Jun 2025 06:10:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=beYmWEPq;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751289002; x=1751893802; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSFZQl2Y1B+z5K8w8pr70pd1f08StcXXxObqPQRr5Ms=;
        b=beYmWEPqLYwFSjARTPxts0XacpL2Bqx5haw8+LVtA8/22iAT6NAr2IWxzKRpEWdSWe
         hg3D8+yYYCwpiJbS9bWwJQiQXvKWSa0s6BZlNcpuOwYVxhdQNe2BiKQ+FbppKVwPDjhm
         7LCHpw7PcFR9hDoXt7PQ2UCG5b9CRqyEdO8cycrJGedS76qyzoPBbfZSN9oPoZyYTXyM
         6O5jy48CRgNEQ67eIW+wzPBWd1HOlnVEhVcguku4S6JVIvsZXRWJD1OQhG8/T3C2/joR
         zl+ic02qzMo8o+85MbMTVUEsKgRWZo1Z5haOm1bUzp3kp9kV7l6B4hVnNckSVcBIMSAn
         qgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751289002; x=1751893802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSFZQl2Y1B+z5K8w8pr70pd1f08StcXXxObqPQRr5Ms=;
        b=tDs6UFmeF3MDzS3NjNV8g6IzhjnnOhsJuU+NXI+MMJyqOBs+ar7uJUWDVW8U0URU1E
         o2LT/EzpuKxoU1b0hUHxK+kycZdVFeq1+6h8VYYzc65FoN4iCas04ZwthuIVr1uHfcPk
         gnsNRDe1nl+rqOGHL3lI1Ly7WvjdilCFm+W5jkgIUzB/Dvwp0ecNKX9goOFrULrVK1tr
         POSfn6IHh/skrFWFOcRFgXcLNZ78U6+2buRrX0x0kg7FHs3JvHXtQJVO5mOQqVPRgc08
         j2Zx+FGW32EqKEfvspQs5SxUDPjZKk0w182YkqHSlCAjMGi5hcXxqm9nkQ2+8QG4YmH1
         A5Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWRqTytGH1rO3NlnMg1WfpyeXKQ/bnpecLyEXKDyNPH8T+37YwKQnetgWoy0RTSO3hPRR3SedclRWeWoA==@linaro.org
X-Gm-Message-State: AOJu0YyjWhUkfUAqss/a40zsnlAfyCE8c1tGqd8eIOizjup05HFopRDb
	Jvwedkb5Cb92/vhf7mpGDBWfTIttuHb8u2F6nqtekXShR664FZwdJrXGcPfkVEWi7j4DsW1JVDG
	Sk+thK7o=
X-Gm-Gg: ASbGnct/rHojHS6c3ivNK+95qrXHRvF+PBSGBGl4TVntttugqpTAHmUXAsuFk7cVVBE
	e9xLW5GfI1JEON7UQoBcN+uhGOmu1AnOibY+cqruNRo3Uz8M1360haU2LNvINCL2qFMku+6cEnz
	GizFtUypEiAjPCuwrYV7TU4UbcNOiCb8+EvgSEq5b8h2f/Fy1p7v05sVz1sg+9MRBjAh2Penchr
	WV/QUZf9h5srFFEMirVMlH57qXT+z+f/Tg+Cs2SnkjBdex61dAtZC0Of3LLoyPQdEM/h3Uz4hxH
	Qh1ynLiBO1gNjRt+ze7wvWpQY6Xr4GjS3+lIx2xL8WE0S8jgJ+sbuBX28EjPLUnUUC3VaeYDagA
	GF2kLIhw4snqHIZEIJQmNmIpLHT9bPV36cIfN
X-Google-Smtp-Source: AGHT+IFAlJ80xOGBOyFxZo2NZIOHdxKYjm+1CdKBS1lraLFsm3S5uMTDv2XFll7zZDusbC+I3loMVQ==
X-Received: by 2002:a05:6000:402a:b0:3a5:300d:5e17 with SMTP id ffacd0b85a97d-3a917603734mr11874570f8f.29.1751289001928;
        Mon, 30 Jun 2025 06:10:01 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e71dfsm10191580f8f.7.2025.06.30.06.10.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 30 Jun 2025 06:10:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alexander Graf <agraf@csgraf.de>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/6] target/arm: Re-use arm_is_psci_call() in HVF
Date: Mon, 30 Jun 2025 15:09:35 +0200
Message-ID: <20250630130937.3487-5-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630130937.3487-1-philmd@linaro.org>
References: <20250630130937.3487-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9SSfvdMd1ebY

Re-use arm_is_psci_call() instead of open-coding it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 52199c4ff9d..7a99118c8c2 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2084,7 +2084,7 @@ int hvf_vcpu_exec(CPUState *cpu)
         break;
     case EC_AA64_HVC:
         cpu_synchronize_state(cpu);
-        if (arm_cpu->psci_conduit == QEMU_PSCI_CONDUIT_HVC) {
+        if (arm_is_psci_call(arm_cpu, EXCP_HVC)) {
             if (!hvf_handle_psci_call(cpu)) {
                 trace_hvf_unknown_hvc(env->pc, env->xregs[0]);
                 /* SMCCC 1.3 section 5.2 says every unknown SMCCC call returns -1 */
@@ -2097,7 +2097,7 @@ int hvf_vcpu_exec(CPUState *cpu)
         break;
     case EC_AA64_SMC:
         cpu_synchronize_state(cpu);
-        if (arm_cpu->psci_conduit == QEMU_PSCI_CONDUIT_SMC) {
+        if (arm_is_psci_call(arm_cpu, EXCP_SMC)) {
             advance_pc = true;
 
             if (!hvf_handle_psci_call(cpu)) {
-- 
2.49.0
