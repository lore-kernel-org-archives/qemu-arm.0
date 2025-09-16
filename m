Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90780CAC599
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Sep 2025 14:26:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uyWab-0005z7-Tz; Tue, 16 Sep 2025 10:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyWaB-0005l7-RI
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:23:05 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyWa3-0008Im-Tx
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:22:56 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-b54dc768f11so980100a12.0
 for <qemu-arm@nongnu.org>; Tue, 16 Sep 2025 07:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758032567; x=1758637367; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kofh5Wdw7zo/AWgs+4bb6219c2CIplWZ+zmDJNsKxAc=;
 b=El7c6qoiOxV1nVQfAjRdqV0O+axfTTcOK0iBd/XFOztsOXmGCn45FuK/O2EE0ficB8
 mEcSnvyGx8S7IGc+dYnc/Kbkhx0X1vvmisHFr1Krb8/XphFia3KT/RgsdUClO2mlelp9
 TUd4k/x3wweYqgqpjFAZPPeHheyV72YjuNG9NMn9Gt9mHz5xdhmkqywqsbP94+ndy6ww
 NQCqJMKoPKyLte6N5WthDgW+sxdv5MiEX19DJGIlD6hwQEtSfguaiq/S76nAdoZ/3fHk
 eVgYhOAxu8/j1roN4sO9dkRcTHgpbF5GwbG5/ciz/+WlERNHvztm07y0wObvku8yYmUx
 YRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758032567; x=1758637367;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kofh5Wdw7zo/AWgs+4bb6219c2CIplWZ+zmDJNsKxAc=;
 b=I56aNDTvz2j1a0/xINkmdBZBskB5ADTP0KUw0YQ0XKuWxVFGUuJlfGKgmLuPsYXjUB
 jvy1Tmkoj15NPv84/EySIb686Il+D9Ar3pJl2HQGoalpyPL/bJ4OowFddHmaBgGsp90O
 IhcZ6Shhgd/+U4rAlbjLUt9BWRUibwP2YmWF3oFyf2Jbq/8i4khVvwIn8RAj1QAVK6nN
 elL0/q6SByaHcowd0bOMPi+/DDAsKqIwV2kUeKv4X1UfM/XX5ohm0zB4A6vaZYAp7VnI
 BJr6QCuHMprirfzZuFbRhq3qsU+IIznw9RdGD4yVqioGFi4WQSjJYadxUmWlMRWeRWku
 VGoQ==
X-Gm-Message-State: AOJu0Yyaom97menyAyv35rWLd8nOj+KLQS/DpFax7Kls8YD1WSPqTQ2l
 pWw8xbCaxDqU4IIdAie6kLwhQ5w0b6/UyetjIzHC4kZ+quq6qrAFB3nki2zM2e2EL9w=
X-Gm-Gg: ASbGncsVHrfxYSdxuJ1yp3N49LVvwpp6BOrjzf42OuS+FeagKge9jbGcsxWPKPPtdnt
 pCo1lR5QqHsxjzwEZdtPU9QsW00Ngu6/aXH4u8UuAglh1K4TuAxkdFcOkldBonEgwsqMwyAQZ3g
 AX/NS0kgJVlH8K11Ha7fm9+Gd1KPIsFClAmrUsyuXO17qZnIkGmijPUwxmiLXNRjlYCOW4jrIzn
 bQiUoYP2XI378W1IHkSR8TBl4v5MdTUaKx2ARdR3Cw+hyscfvxUMsSTA7AfSJAns/jxhBs7xnpA
 EkMBZws5yUvMPATnZhH1VW9VY3Ew75phj7toFtlUXWeqe5D9j4zp8d31+lEUx2P00+3nUfJ6far
 5uzeSnMHuiVlYRKEPplmPUaOFID/UuQDnT/lNZ1A=
X-Google-Smtp-Source: AGHT+IFr6bmo8R76A1kIwdM0DmIrtBRMUEQ0YNJqHacot8QVQLXRVjqOP3HHT2GaUNn2laAoMQxoYg==
X-Received: by 2002:a17:903:1207:b0:250:b622:c750 with SMTP id
 d9443c01a7336-25d24da7babmr202078045ad.27.1758032566607; 
 Tue, 16 Sep 2025 07:22:46 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2651d2df15esm73459905ad.45.2025.09.16.07.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 07:22:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 08/36] target/arm/hvf: Sort the cpreg_indexes array
Date: Tue, 16 Sep 2025 07:22:09 -0700
Message-ID: <20250916142238.664316-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916142238.664316-1-richard.henderson@linaro.org>
References: <20250916142238.664316-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index b043eac8c6..99d8672b9b 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -925,6 +925,9 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     arm_cpu->cpreg_array_len = sregs_cnt;
     arm_cpu->cpreg_vmstate_array_len = sregs_cnt;
 
+    /* cpreg tuples must be in strictly ascending order */
+    qsort(arm_cpu->cpreg_indexes, sregs_cnt, sizeof(uint64_t), compare_u64);
+
     assert(write_cpustate_to_list(arm_cpu, false));
 
     /* Set CP_NO_RAW system registers on init */
-- 
2.43.0


