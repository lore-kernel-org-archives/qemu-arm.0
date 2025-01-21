Received: by 2002:a05:7022:639b:b0:92:a90b:6588 with SMTP id q27csp159468dlq;
        Tue, 21 Jan 2025 06:34:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXqvZ23uP1kRToIZBnqbiDIUPfJAatPosAdAtJCm3guokVq4taIjHYoy5wnJwcFxjDoqUtJR3e+2VeZYg==@linaro.org
X-Google-Smtp-Source: AGHT+IGsk9MnfDFefU001wJ316mmrOJnxcCfwWQIaz9RD8yuT68Cf9+P7+IdSR+V0hWqq2/uqQ24
X-Received: by 2002:a05:620a:28ca:b0:7b6:f595:36ad with SMTP id af79cd13be357-7be6324d832mr2930404285a.37.1737470064714;
        Tue, 21 Jan 2025 06:34:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737470064; cv=none;
        d=google.com; s=arc-20240605;
        b=Lyi1lHuC8P1y7WVSUBcgn5vrds9O401hYoG6QhHBJLe6O9heFBFPvi+BcV8ut4vCkU
         iG/3MzDdKoIAAo9IDWhmYdmwrFH2yK4Ys4PY/C3pxZQMCqv1MFgndZIc8lXwvDCZEl5s
         zpNY6UGYtwwX7nzK7EMG83ZuIUBle56k7EqzATimFi/LupIT7jPeUM5v51/BMv1UTTmj
         Brs2yX740Ma0oOTZ81A3IghpUoZGVAOPMdYcbv9Itri+zEi776iA4QFxTXd7wlNmXjSH
         G4zHxXTEAHZr86eTea7hTbyKg4cj6D6QXKO8zCzr6K0POJ8TeQa/J7Gct3iGY7H9smNS
         6i3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0FrZU76fBoB9L58Ptipeoob4B1ixlMZUB4jhFVr30a8=;
        fh=T9nLPmYdz8kSl8qI33evWuh/VVTqN+U2Q3T/ETy8raQ=;
        b=Zy0fvTL/eDmLqPF2LoHrNvfCHVQynCnFnTGPSn230u0FwDg5fy79bLnrKqqibavZxK
         B3jUN04/kuI4IsGlIbi826SxwlBXmsdfWaNTWDnEByQr1LCxjzNjLeVzAiFOrU9RNtc5
         1pnEsJeEiESNXF1R6N4fawMgDK3CzguZUwFNyvKM+bNxBqkKTJ2lswBoXjyCIWR0B4Ie
         eVyB7HQK6kfy6lBEfAUIq+IMA1pV6rKmwzz9YH6f4iKzYnO528wKSyR9oISjzWiP0C6H
         kwbpzJAddI90R7kkDRTT5bPYXYshGO5u9E00WVJERYAYOReSFOrViT9SxFFUUFpHw7Jn
         3wew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GW6mmm4m;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be614f4883si1251810485a.592.2025.01.21.06.34.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 06:34:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GW6mmm4m;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1taFEV-0000Wj-09; Tue, 21 Jan 2025 09:27:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFCU-0002ea-4S
 for qemu-devel@nongnu.org; Tue, 21 Jan 2025 09:25:55 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFCQ-0003g4-1S
 for qemu-devel@nongnu.org; Tue, 21 Jan 2025 09:25:52 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43634b570c1so41590385e9.0
 for <qemu-devel@nongnu.org>; Tue, 21 Jan 2025 06:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469548; x=1738074348; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0FrZU76fBoB9L58Ptipeoob4B1ixlMZUB4jhFVr30a8=;
 b=GW6mmm4m/6iyclK3TlIzNM1Ve36GvZ+Su7+pJhRfXGFXSixFyiYVKMXdm2xbqFyqkt
 b0ZqMyO4IKDShyLvxZ0/gkNNkpFZiGxKrGu4f01S69Cmwlzk9/N5SunQ5X2Xc8jd5YN2
 AZH5yyvYr9izNup/JchyUcKB8PKqoMDL2DhQ7nYDpLOA7ZAynzAeJlla3GALGqTq2Nfs
 roPSnsYs4LnWS4GFDMQnAyUPlLCo6Gs55I+05Dn9brYEfANS4UT3LW945sugSDzPcuJW
 Eo+q0UfxvMPZsKNrohUduqFwyhbboHYDzYM7uOt8CZZUM72zuTZAf39FXFDzldxWdeow
 vXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469548; x=1738074348;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0FrZU76fBoB9L58Ptipeoob4B1ixlMZUB4jhFVr30a8=;
 b=KjPDhQIJwctQfFAt5uceSrpqcMBarMm4gpCYxzsJurE4lk3WWEcV18ffZEE98ZjHQD
 HSrpw1+lsWoZEAtF6pct9dSoT/1YRAAv3EOOwjkPzrcvzN8RG7RNoPZBvHYECXS7tPiI
 l7+oQ6M7/gd2DZszs10mziikwyQ1eTDH7fMf0o6dxAFHR3r1j2EInI4OskvGXUgD8YA5
 OWRBVS1f/JckYlvIAajcqgNPd0AoOeuIdMV/6yXJZg2hrBvDsLbE0fYbI0UIMuH92ONA
 dAdlJeqwRFFdnn27yqkbXQI8Lneb6HPHbWwbGSXQKqw1oMVVL4+bdx20yvKOzch2Ya6J
 PYXg==
X-Gm-Message-State: AOJu0YwQ0ZsmwL/bBzscT5x9Del3DXB9tINnJ/Zm5IAQYjmXA07TXx1V
 h/+6OZP29NjHOeXvHWBqsHgGrN/Q5+XAyEFqNFivPTZGg7rvYJhL0sK/SWHYo6eTin05WXkSVrz
 SyR8=
X-Gm-Gg: ASbGncufXBDGjxDIuYW+S0G+H7puJml9ixyquU01IDezctmgArnvXafM21ZPbhYO4LB
 p8bhaYWwgb25nwiQe/eWk6imufeSlNm8bnIw44AM8IAnd8l00xSixUfknBMrP689JYF7AN9USBd
 ejHR3XtD8RCfLcFNGIy02wWy3IhWuHScRag0tg2CcSisgnWSd6/nigrzuIyvaPIIqa/1MpzAarn
 qROYmqDR37ubtqlLRWK4KXzfqezUgSvXySitQ90Np76euGRUbgVq3AyGbqC2vYf3Rt72ZctA6BV
 pkruDv2NSrSHu6A6nEo4QHg2nzPmvC+/OF9jDpotA77P
X-Received: by 2002:a05:600c:3542:b0:434:9e1d:7626 with SMTP id
 5b1f17b1804b1-4389145137dmr137502485e9.25.1737469548047; 
 Tue, 21 Jan 2025 06:25:48 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf3221c25sm13311295f8f.23.2025.01.21.06.25.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:25:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 26/28] target/tricore: Move has_work() from CPUClass to
 SysemuCPUOps
Date: Tue, 21 Jan 2025 15:23:39 +0100
Message-ID: <20250121142341.17001-27-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121142341.17001-1-philmd@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 6cKoJCKjfrD3

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/tricore/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 95202fadbfd..e4f95876efd 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -165,6 +165,7 @@ static bool tricore_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps tricore_sysemu_ops = {
+    .has_work = tricore_cpu_has_work,
     .get_phys_page_debug = tricore_cpu_get_phys_page_debug,
 };
 
@@ -193,7 +194,6 @@ static void tricore_cpu_class_init(ObjectClass *c, void *data)
     resettable_class_set_parent_phases(rc, NULL, tricore_cpu_reset_hold, NULL,
                                        &mcc->parent_phases);
     cc->class_by_name = tricore_cpu_class_by_name;
-    cc->has_work = tricore_cpu_has_work;
     cc->mmu_index = tricore_cpu_mmu_index;
 
     cc->gdb_read_register = tricore_cpu_gdb_read_register;
-- 
2.47.1

