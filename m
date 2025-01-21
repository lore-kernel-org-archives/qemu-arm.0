Received: by 2002:a05:7022:639b:b0:92:a90b:6588 with SMTP id q27csp154275dlq;
        Tue, 21 Jan 2025 06:27:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUYVQv0FnS1RSWsCB2HnHZKfIYy39X7KHeLFn4iesAQ0aTS3g9iqnrP8I7g07y8nUYXv5HPZD2Bxc2c+A==@linaro.org
X-Google-Smtp-Source: AGHT+IGjyx+xq4BqI969tFr4kQhgppiH5gWHLyQ7ThyDZVwt6drFEt02xs77K8v1A9m/GTMUBWD+
X-Received: by 2002:ac8:59ce:0:b0:46c:7651:158c with SMTP id d75a77b69052e-46e12bb3ec1mr275682441cf.48.1737469653870;
        Tue, 21 Jan 2025 06:27:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737469653; cv=none;
        d=google.com; s=arc-20240605;
        b=SqIe9Z8Z3PkoLaKdaXm+hMMbN50Cl9nST/WU0xOewmy67H+S3BEa+HZlAgNb+UZSox
         g+tMgEB7SMrgjSbp7yjBzI0YhDItBo4vu/O2E9oPwuVy5ygwUyD+tC57gHmSu4zfQTIp
         5tOHJ1RCFHEABk/e+dkSkKI5nJ6ht921aV+opD4UgL+J6oOl3SxdKdiMdRPNVEwnTH7w
         9YXuntuMyd1T/MVZ2VKXshB0HneLseG1URKNFWq4rBRb3qAmu/newkZCaLi6SrI57pP5
         R1ylu6ECo/WKtppcu9EclXrBjUizrrvZi0V9HnLt5522POTv4bswoqjwGZjIF9sCQsDJ
         FHDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=i0IEgUTUoJtMoDUBjCVWUA9LQ/fRvYT8kph+CQLQqnc=;
        fh=T9nLPmYdz8kSl8qI33evWuh/VVTqN+U2Q3T/ETy8raQ=;
        b=HMGaPUGheRf5n0iStx+WgcDofcKL0/Ybxr0J9bCUl1v6xiOuF7rE9/S9OYpzmVNWeN
         XyW3ujk16brCNWR6R+f9OCUJkD1lZcKa8PCJcoqW3/b2orlCm28ySQKOdBFnOZbw4wM/
         6WxEvqe95BY2eQ4EcG8acXA7418XqMPHnu147R/CTXeRBpYCFeAZ/KiRpMjGKI1iHw7s
         KmoASEsJWfbbtUww8XhV1tfCLYMvCQMNfTtFfHg6HN60ot2FNMBPFSoAirAXY3mz2ufc
         g1noK3EXt6UliG/Nmz3/Ma5AJQzibx1OQfolFBlHKAR8tFcxa/n1p/267kLIkj9xpwvb
         3Bbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OLHDIXs4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e10409e53si135866621cf.240.2025.01.21.06.27.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 06:27:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OLHDIXs4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1taFBO-000193-UR; Tue, 21 Jan 2025 09:24:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFBM-00012I-Eh
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 09:24:45 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFBK-0003CZ-Jm
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 09:24:43 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4362f61757fso58487355e9.2
 for <qemu-arm@nongnu.org>; Tue, 21 Jan 2025 06:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469481; x=1738074281; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i0IEgUTUoJtMoDUBjCVWUA9LQ/fRvYT8kph+CQLQqnc=;
 b=OLHDIXs4a/Pf3z8kFmoMXIh1gin6KSzrNPk3FvTLFnWbTG5v9MQcBAL5NcGntDBxLR
 ++EKQafU6UBlmEIN9ESTi/ac2sbLcMiCHoXHfWpnDsWSncxlFX3WnjgJf8Z201PjEng/
 bJAc8Z37BhWLlJ7/yTbLHu7R7tepSVbhc2gxPe8iTUAc0Xh+8y0bWVplEJyIRmdhbou4
 0bxSmz0LotzfbeB/skshRiTUNZmN+Sdggg9kzCgwFEEbYmMECwK0WKaqhKMBFUh69LBC
 NNAkrQ7rPIUkKFuhy8ZMjqmrn3LKZUBvmQFwuzWuFcEhw/e3fcvNrr97H0a2HofjwrQ7
 PP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469481; x=1738074281;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i0IEgUTUoJtMoDUBjCVWUA9LQ/fRvYT8kph+CQLQqnc=;
 b=OtPjs7ZsJz/m1fq1hJsUR60Qr8AvOONHYP01ruXTJvHe3dyp+rlubGt8eAzeFJ0i5S
 /JFYHZSUXvCWeKB7+hJhlz7QVVlXjD6x0dK/2w54ha20aAZo53CEaItYVhzuYsTV8RBq
 5QGmXb9DS8e/SV0UMCEsMkuLkPX9k/+dRyIyK15XqxRKtYnJSbcR/NGct+5qlF7hKrDA
 ZXomjz0ekfLPPNDZl7BJyG3+1vXGk5LAebyzBQLm5PQdKYdahaW0os5tIBt3T7ePffuD
 mwbrUUzchsMWV4d6zBR5C9wsb0WS6DbKBd6E3Ul1fUi1GTkK7/bnRm/DPd+VhgxoMopD
 omBQ==
X-Gm-Message-State: AOJu0Yy7HZz8pxmgD1d23NGAyw0kIxPKB+plbbwCK/kbAL49IDPa1+u3
 6kjWEjkiiJf8ScyKg6es7PhtC512Pa1Yum9oudz3Y7XVMnAf69mTxW+5exWipQf1UEy13uWjfFt
 /JIU=
X-Gm-Gg: ASbGncsfxfoFMewyPiw2ixlZ30Tf5Pdhn8AUf0L+Y7G1CQyVmydtqMaw7i+I//xHjFP
 mFoTTAqtYN77kQgAln5V9185JMYavJa5UaQEm70JChpbDxtiek+omdTyYaBCM2Fpq2vANPw8jXZ
 HVAHQWxfKp3qEE5EZYqHLPqJyF54jrYnRrHhKWVnVoYh8ZV8SLR3JJk55+gO/9YcslKAzJcLDlt
 qo1oqnWcmJ1is1m2mozBC9EJwzE/1X3OaNzTkn1W4UDPStql7pQTiXtAUacW3aji6S/W2XEgjxc
 Ts/Xz7RYzU/GevJ9fayrKPHN36uh6ShnRWUfa1i3Pv6u
X-Received: by 2002:a05:6000:86:b0:385:ef39:6cf7 with SMTP id
 ffacd0b85a97d-38bf5673ea3mr11098765f8f.32.1737469481194; 
 Tue, 21 Jan 2025 06:24:41 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf3215099sm13303268f8f.3.2025.01.21.06.24.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:24:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 12/28] target/hppa: Move has_work() from CPUClass to
 SysemuCPUOps
Date: Tue, 21 Jan 2025 15:23:25 +0100
Message-ID: <20250121142341.17001-13-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121142341.17001-1-philmd@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: migWRGctc93T

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/hppa/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index b0bc9d35e4c..d5a58a03cbb 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -125,10 +125,12 @@ static void hppa_restore_state_to_opc(CPUState *cs,
     env->psw_n = 0;
 }
 
+#ifndef CONFIG_USER_ONLY
 static bool hppa_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static int hppa_cpu_mmu_index(CPUState *cs, bool ifetch)
 {
@@ -231,6 +233,7 @@ static ObjectClass *hppa_cpu_class_by_name(const char *cpu_model)
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps hppa_sysemu_ops = {
+    .has_work = hppa_cpu_has_work,
     .get_phys_page_debug = hppa_cpu_get_phys_page_debug,
 };
 #endif
@@ -267,7 +270,6 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
                                        &acc->parent_phases);
 
     cc->class_by_name = hppa_cpu_class_by_name;
-    cc->has_work = hppa_cpu_has_work;
     cc->mmu_index = hppa_cpu_mmu_index;
     cc->dump_state = hppa_cpu_dump_state;
     cc->set_pc = hppa_cpu_set_pc;
-- 
2.47.1

