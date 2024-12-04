Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp489089njb;
        Wed, 4 Dec 2024 12:27:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVLO7zpsaaJyKArM4PjGEx6n+5YzUejwpAK869iDbCJjD4ZUnw1bPMRiWVIxhpJOFa6+EyuO7tz+RBeqA==@linaro.org
X-Google-Smtp-Source: AGHT+IHo1cpiSrkxUz0dqY37GPOBQYuMRdXfEPBogs4Lxged3Ser1KfRSs9z7TeHe4rK+qu2ne1M
X-Received: by 2002:a05:620a:4725:b0:7b1:ab32:b71e with SMTP id af79cd13be357-7b6b40bec0fmr152803385a.0.1733344054377;
        Wed, 04 Dec 2024 12:27:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733344054; cv=none;
        d=google.com; s=arc-20240605;
        b=iCjv4lR4WfXd4860lipjQNCdMLduqFjl9DLIkZl3iT4R+UeD3id1TQBhe+XNa76XUi
         Klpb/tl0uGM5bv3g1Y55hSytB7WPEM5IEeF2f/xx81Wxeh1TvsMsPapyTwFTVWuqBddt
         WFigqP8sRsme3iRnULXKkGrUhiFyjez5Crc1Y6LK7Gohf7ylPiAHJX14qPTPmjzSDRSo
         UV363gZx+M6cgk5dLVuPNwPQOU0qNdGYT0ZRewhw2rqZJWFkJR0G74hzuuPdYGA7EuLj
         LJhkQvH3xA46t6xgP2OWa9E3fYZ5VpDhv4MhT+zjc1xlbymOQh7AEXepfmV3XkaSH1m7
         bCjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NhKSMfIut/lDTwvjTF8AW4idKBvUZ60ritdW+EWnr7g=;
        fh=82LwtowOEnQ0m0dV3IkS3EEebG9ZLF60FpQVNg+8E5o=;
        b=k91X7S9jUXnBxmQr+pVJTUqdArfMW4n5PwPT9i7nS71KZ3cyOoHlzP2zifCdHF/Isj
         ++3ksxM9fX6RfDqDpZl0trokBsm7AfpHLOC8G8h1s3uw7krGw87vQ6nT7TImK8S2Ztu5
         vRTsfywwNxsKqeCmFjs/aOELzEFRlnVXuWh3GCUFAxlZvnVNp++FdPd8tRSSQuHxNDdA
         8fZXeugAPzpubjVq2NSSBVP4RAzf1Fp5R0HuT5ZQGgrPRC4egCYqZIntTkq8gY4psc9n
         1tcJSdt6TfM63OI29qVcy4G2vMoHtW18VhQLHNibjvMsNHiQP3TC2nqQM4Tg/T7CsVOo
         ENBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gvOyf5t2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b684931857si1732262385a.163.2024.12.04.12.27.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 12:27:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gvOyf5t2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIvx5-0007Ub-52; Wed, 04 Dec 2024 15:26:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvx3-0007U9-Ni
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 15:26:25 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvx2-00071c-5j
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 15:26:25 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-385eb7ee7e2so106070f8f.3
 for <qemu-arm@nongnu.org>; Wed, 04 Dec 2024 12:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733343982; x=1733948782; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NhKSMfIut/lDTwvjTF8AW4idKBvUZ60ritdW+EWnr7g=;
 b=gvOyf5t2epwIy3CQvNhQBPbIs2QT0OCLdG5TB6sIRX7CqUAisqIkGeUIHouTdo2IeW
 fbqmQ2uZLqUYObH9kMMTFYCYiLeN9PpYcVVmKYhN6BsYqdGffFg9F+/hEHr9MMI7ifc0
 Kbnc7zP3ETRX7/ichdZKr9u+F4YB4CK4HzobDUVWXefcrQUzO6c0KUbx237oVj7xG9eY
 98ZUD3QgJptFreeCWoW1BS9cuNF4yIFchPsRoOEVLdEqP75pOSsF+CTkS24O5y+LmDcK
 VBa2J9UILy5gfJ5Ln2X34F9rT8VBzZgZWhrlT4Qj51063gJO1tK+iRc4326enjpKgfav
 F2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733343982; x=1733948782;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NhKSMfIut/lDTwvjTF8AW4idKBvUZ60ritdW+EWnr7g=;
 b=Y2Gw6Cj3nOnvfVkMcquusT5rAj3YqBtuIyquklu3/4zH/k+MnSRsVu3p5j2KgdP/Ii
 oP/O0ohStnOBW4cfmlwoQxMadR0+YUhciumktwHf3jh4D8dBk12ZO8YSUViCN51V1HQX
 9sbiucHgzHiDMy3BpdNRmQxQzAzBC7q+b+lGlYijCY6J6rWEyoPzGaeiAeBwjXm4hh1A
 rqHMhgJtz+S3jRwLOj/vM9qwS28EFzbAGTqscU0XMr3zt3TLhhLo6cH08YCWvOfRHGfH
 xFO055kIM+YhYnUndPwQmd+tLtqzWTnEHVcoXhSWjMk5ruSPgTJXGvjGOV321s9YjNo0
 dS4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2HInWZTFSrYU8dq5IFMWKr+uuYQWdU6jAupskYZhsnHzQyAG6BLQmQK3q5qsHWuaku1is3wZthA==@nongnu.org
X-Gm-Message-State: AOJu0YzqpJ3LxIMGrKBzBG73g5BXV9RUTvB4IQqIwBXyk7kZpS5akfok
 /PWjEDJa119Vjp6JWxV5HbIQSEIpBSegs2YYfA3NsucfYbiMjs4AXaSVM0A8Ys4=
X-Gm-Gg: ASbGnctpNjmG2d7BCNxWTI/RSVLekTm7+ubnh4Lmsvm2OGjOtsH9spdE9pOlsyI7xI9
 RWSBIWFkHeLDV+J6kdrqAPx111R78z2Tf4+cTmS3bIyoyj3NgtgGhAD9RiKRyuWzoeRqe1CLOP/
 X8703vmnFzNXnG25fyc+NJFa09sXZf+k6FJFfhY7l+U3E/u9v9aGw44W89bXaN27o00B2AHRZtm
 ECFDkaofsFuiFqbHYRlF9udfEKLfVHQyVTV3J7OtEb9dgwoKSa6c/BYamMqt0vBn9C6oHC4e7dq
 dIZ7IQGRFeZEqmV5yUqe9EY8
X-Received: by 2002:a05:6000:4411:b0:385:ded5:86f0 with SMTP id
 ffacd0b85a97d-385fd3e797bmr3942400f8f.19.1733343982632; 
 Wed, 04 Dec 2024 12:26:22 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385d7611af2sm17657530f8f.22.2024.12.04.12.26.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Dec 2024 12:26:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair.francis@wdc.com>, Anton Johansson <anjo@rev.ng>,
 Zhao Liu <zhao1.liu@intel.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 03/20] target/arm: Implement CPUClass::datapath_is_big_endian
Date: Wed,  4 Dec 2024 21:25:45 +0100
Message-ID: <20241204202602.58083-4-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204202602.58083-1-philmd@linaro.org>
References: <20241204202602.58083-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
X-TUID: HYBxNnIlGm3m

arm_cpu_virtio_is_big_endian() already returns whether
the data path is in big endian. Re-use that.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 6938161b954..3061b2ac18c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1132,7 +1132,7 @@ static void arm_cpu_kvm_set_irq(void *opaque, int irq, int level)
 #endif
 }
 
-static bool arm_cpu_virtio_is_big_endian(CPUState *cs)
+static bool arm_cpu_datapath_is_big_endian(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -2664,7 +2664,7 @@ static const struct SysemuCPUOps arm_sysemu_ops = {
     .asidx_from_attrs = arm_asidx_from_attrs,
     .write_elf32_note = arm_cpu_write_elf32_note,
     .write_elf64_note = arm_cpu_write_elf64_note,
-    .virtio_is_big_endian = arm_cpu_virtio_is_big_endian,
+    .virtio_is_big_endian = arm_cpu_datapath_is_big_endian,
     .legacy_vmsd = &vmstate_arm_cpu,
 };
 #endif
@@ -2709,6 +2709,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
                                        &acc->parent_phases);
 
     cc->class_by_name = arm_cpu_class_by_name;
+    cc->datapath_is_big_endian = arm_cpu_datapath_is_big_endian;
     cc->has_work = arm_cpu_has_work;
     cc->mmu_index = arm_cpu_mmu_index;
     cc->dump_state = arm_cpu_dump_state;
-- 
2.45.2

