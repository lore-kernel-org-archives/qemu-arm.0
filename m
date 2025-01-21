Received: by 2002:a05:7022:639b:b0:92:a90b:6588 with SMTP id q27csp154291dlq;
        Tue, 21 Jan 2025 06:27:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXoAO4Se23Z5fKIEVnwmppvGCfzPPQ6Hi7mUHBRxIv5iAkff8AkYY3lv6QcYXNcm3EXldr2485xgz95sA==@linaro.org
X-Google-Smtp-Source: AGHT+IGfLKwbl8KFtRWU0MyvlyG12elTHs/f+13DwzDN5966xDBqqD4oEN3BuukAyOVB/tGaI3te
X-Received: by 2002:a05:620a:2807:b0:7b6:913f:3df3 with SMTP id af79cd13be357-7be63253d55mr3038442185a.47.1737469654689;
        Tue, 21 Jan 2025 06:27:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737469654; cv=none;
        d=google.com; s=arc-20240605;
        b=C5ejxRR+Q2lQP9Z9jlZv/LnD4VS4WY+I/gd3bNLAjY0CVWmjzNFzXe8IfhGDBUN4D9
         /IQ6adWrbdzDhE4JeszRqs+JlntlcQ0dTnlIgRwUg4BPKmkG0zOMpJuuZj1WvWMvCnOC
         jHfJvGmNdxdMgeh7uIeN4MEFCDbSPKhwHb0Cs0+EjvARnY6B+DIqpjeIypUONu7nqd3X
         VGjlTdi7rwnWjelTecCg/WH2a7fuqZ4tvPNP4WC29TJ+jZzHOGCBS1OylWyG9gqtDvsH
         PJEY14FQfEivsV2S4lYzat57rM4XJ4tidAoD+si7yW8dmsFnpJ7K31zUQEWzEEZHwBt7
         pG8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GkHLGnbNtUXznuzSD8HY730UHLCtgMSWFluNpwmKQeM=;
        fh=T9nLPmYdz8kSl8qI33evWuh/VVTqN+U2Q3T/ETy8raQ=;
        b=U1mqEIBz+yXymA3rohi9yXxDgtt4kljWVy4Fn5IS9W1pU07/XSvOR3oVlabbZEaaDL
         U2Ho1enJNZypykrHa7hLta+HuYcja8ZDutUiu1hHBcodAByqU0LqBIfZ9fgnXETNS+W6
         ogwgqJJStjRDUTQzev0qtdBBfyYVP8PwhDkgo6da3DRLlUSeC+3dAnofYlUvEaa9LUIX
         Kzro4VRV3DtMyQtzL8HGrSlj27aNbKP09/+67BsoWOB1VYuygU2Uwx8NORjUUtJoYAm1
         20IBvJX4BPJY/t1kc22gSYPM3ZTdOPNX4zndJQPsBIkq6SHuNllRCpU82r8H0xSKMhvE
         WpMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y55VdusC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be614f4e20si1346705485a.600.2025.01.21.06.27.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 06:27:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y55VdusC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1taFDr-0004HO-KH; Tue, 21 Jan 2025 09:27:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFBq-00021D-73
 for qemu-devel@nongnu.org; Tue, 21 Jan 2025 09:25:17 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFBo-0003VL-IK
 for qemu-devel@nongnu.org; Tue, 21 Jan 2025 09:25:13 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-385df53e559so4382172f8f.3
 for <qemu-devel@nongnu.org>; Tue, 21 Jan 2025 06:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469510; x=1738074310; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GkHLGnbNtUXznuzSD8HY730UHLCtgMSWFluNpwmKQeM=;
 b=Y55VdusCRh6NRwkgQrV9LWzBaxaMP9zNebptp8syRImpceW2JUrAbDmlBfxFdrx7In
 gixa++qGF/ruAYBXJvfXwMBG1D+FtP0Un8Lp9/RfyxapDotSi5Fu3O+E9ieLqfEeFWuf
 4p9gIE45BH8wjKtJT7HnKoeVX9ZACOAwkEourgakv3i+1295KY7BWtK2JyNr5yFnR2CI
 9FBJtN/OeYOZL/FDTDKLa0Zcrfsl5oOoel0q42lRsYk19fuCj8DHbYnz7v8dVsfsJOHI
 5IXO4z8bcUEF8R7SVUJOGNlB42r/zgkXDgYYB/61ADFZ8cWFTphQHmZyHvlVgyOZNztf
 Ii3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469510; x=1738074310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GkHLGnbNtUXznuzSD8HY730UHLCtgMSWFluNpwmKQeM=;
 b=XuPyDFEUFn6yBciEuFHfscRz1N6HtWGbH1tg4AYut7fsW4VoUdNN3yWOJkBKRqVzpL
 l6O3H/rxC4qduBqICtO0biXbCKO7Raqun7rrT8E+mPOxQlT7/H0UYyi523bCf32Cxg6i
 WOf2yKTxCZWyjpihW3SGpmwgtA3tIolD1QUgwGm9PeWyjoaSYt+pcj7PzZ2Brgvg8kVq
 qnIMgyj4mGAvO0OsrVCq43vmS4+RzPByHAZ0kxhdY3Q7YfkDx3+QlqsW6hQ9C2YmbmM6
 P64wOqzHJc4nbsqAEwKsSEw4NuGs1oMyNXagE5zjTfARxd3cxHZyn7RkIW5HrZIvAG8H
 ASrA==
X-Gm-Message-State: AOJu0Yw/mNXfhULhmfXIM+VbROOL0RqIX8HQ3iHH2N/9kWyqzEsjSczC
 6HBNsSl01D2IkRKkJRUDTIc0+PZFD/2xYI9gFl2OjoamjQHksMt9D+pxaGmbAuoILawRiygTbis
 eWrY=
X-Gm-Gg: ASbGncs6cy2yYsEOEEwwgHC5gs9A3MjSaKlvQYnTAhRceUb3tyXp3lI9jIsVYgxfqDm
 szBk+3bPnIJIxq7tO3aSC4+ZJFeyFrBgdWq0gBU25YxFshfQxeVybc5/wvdtaCRGDDrM09Thap3
 tHN3/bpllZojpLSWCRNMM/MmpHDfuO4zghlGjnVQan6B4Ar6m0mUjkXFra6bvpvJo1x+kOFQLLo
 hL2xxAgENNCgTv8M45uhGZZ+l2SXUg2oSL4e6Sroi1qG7FHaYBkZCDzn/enxx+VQPd9AHWrWG+Q
 LFeS/MWBlroRXr1W9HRN35nM5sFoUim9y0af4fwzOob3
X-Received: by 2002:a5d:47c9:0:b0:385:fb56:5596 with SMTP id
 ffacd0b85a97d-38bf5663956mr12725335f8f.19.1737469509642; 
 Tue, 21 Jan 2025 06:25:09 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf3278088sm13563656f8f.73.2025.01.21.06.25.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:25:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 18/28] target/openrisc: Move has_work() from CPUClass to
 SysemuCPUOps
Date: Tue, 21 Jan 2025 15:23:31 +0100
Message-ID: <20250121142341.17001-19-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121142341.17001-1-philmd@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: ds6G4tQ5u5ni

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/openrisc/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index b7bab0d7abf..5d80c4aa9ac 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -63,11 +63,13 @@ static void openrisc_restore_state_to_opc(CPUState *cs,
     }
 }
 
+#ifndef CONFIG_USER_ONLY
 static bool openrisc_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD |
                                     CPU_INTERRUPT_TIMER);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static int openrisc_cpu_mmu_index(CPUState *cs, bool ifetch)
 {
@@ -228,6 +230,7 @@ static void openrisc_any_initfn(Object *obj)
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps openrisc_sysemu_ops = {
+    .has_work = openrisc_cpu_has_work,
     .get_phys_page_debug = openrisc_cpu_get_phys_page_debug,
 };
 #endif
@@ -261,7 +264,6 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
                                        &occ->parent_phases);
 
     cc->class_by_name = openrisc_cpu_class_by_name;
-    cc->has_work = openrisc_cpu_has_work;
     cc->mmu_index = openrisc_cpu_mmu_index;
     cc->dump_state = openrisc_cpu_dump_state;
     cc->set_pc = openrisc_cpu_set_pc;
-- 
2.47.1

