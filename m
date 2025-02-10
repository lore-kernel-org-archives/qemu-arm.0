Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2250959njb;
        Mon, 10 Feb 2025 14:19:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCULa/8T0E42M8YccdC4hHKo+Orid/84KWKTpAR5X6+QX09Z1umHIUYVnE6UAkJrxOwJL/EsLQcnIHamAg==@linaro.org
X-Google-Smtp-Source: AGHT+IGJOOGoLzDyuS8uYiBkcC9up7BNvBS/IpQLzxiqjwYr5BQyfTznYatmKhf9DAdskOGtxHPV
X-Received: by 2002:a05:620a:1915:b0:7b6:6e3f:49dc with SMTP id af79cd13be357-7c0686facfbmr249515285a.31.1739225959134;
        Mon, 10 Feb 2025 14:19:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739225959; cv=none;
        d=google.com; s=arc-20240605;
        b=TpGtDUKwCGP8d29Iob8ueGRmlgV5MwEKbqMIlymFDkWK1FJVZNPAm5ZzwlmvOgjBPp
         Nsd6MtCpC098DfrWwrlUmB3g1+e3WwhfRnRBvfNNYFPaZJIVznkBHNXiFjz+ap8dEPNL
         ufxJCMgG/UXHjqVNtj5KUG7QvLCKyeuBfqVLV2TCcm9RjMfL1I23fEx2D98eLVJDTAEy
         upftzB4NG6ZXeGhDLoEmzJ5OHbupheOQfbbflxcdQaZ/CqFf4oB8axEevmreUvLC1aJG
         KW1dQyPpwroOEgEzLUOjnx23lydKSXCC/FMvtM9mHCjqkuubamm8sn3Z++kKD7iJJKOm
         VEpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=na4NIhR7KjWn9JvA007jmUlM2ztPp6QYgo9rPBZi7l8=;
        fh=gTloOz3hcaaNOIl6Yk1/UbfPcJyg7bUZlwmawbBQn5U=;
        b=Ts8GnOKRSx7Szl5KIEC1oAs/1IR+xYhsXVvacQdP2K1xMaJ/FGffu6zqjE8+iOT5Yu
         41sFWdrQcodHnluzKTn7nfWTM3wY9FOlTjipiciHdru4GzHvV1gur+1WwC2r2F8oCDxU
         9D2e97P311U+E+JjI/Bf3h98GmFjB8F6SK/JRlDyXRbrmQb3L9kWi6KeVGaKgHWC8iSK
         L5uthb6iIeglb5Vh3ejOF8aiB6u+a6zLAoecEd6HcrkSWLUSw94YyZUqbhJWHggKPWZs
         4KjjZRkxJVTdimTsrY+FVgHyy70Jmyepo+nLLq6Rar+GNdBnqKKrusz43EbgXFBjHJJ8
         OrKQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AzS3onox;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c0634ee39esi167238285a.213.2025.02.10.14.19.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 14:19:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AzS3onox;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1thc7S-0002J3-IT; Mon, 10 Feb 2025 17:19:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thc7Q-00028d-5P
 for qemu-devel@nongnu.org; Mon, 10 Feb 2025 17:19:08 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thc7N-0002w5-Pz
 for qemu-devel@nongnu.org; Mon, 10 Feb 2025 17:19:07 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4361e89b6daso33704545e9.3
 for <qemu-devel@nongnu.org>; Mon, 10 Feb 2025 14:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739225944; x=1739830744; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=na4NIhR7KjWn9JvA007jmUlM2ztPp6QYgo9rPBZi7l8=;
 b=AzS3onoxhCp7MlzD96P5kLZDVFz08q+Zu4WdLHoJQHZwgblTZv3W/ygJkrZoQ0P/Nb
 xkLUOc6UfzySYbsPXqa77+wCDoR9M3bHg/3aoyhboJ27W33mUhyS/4fr69LxKc8fV/37
 7s7IRuUzAsvBhAn5Iud2tunZ6S/LRoTO+MVWQb+cy1jZFq3bKRGePKZIJyGOskzTIMox
 etLsg2nqmVIVD0c8ncVis92eughFdWPKLgkHqx+PyKfbaq3aUXbxjEbgwCVheM/mcIa3
 NIwhqdSH9xQIvXIZK2B88OYs5m7c0+/bh9jChn/iyyCJYP4ut2wSJAZ45G5SJnXOx1g7
 FleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739225944; x=1739830744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=na4NIhR7KjWn9JvA007jmUlM2ztPp6QYgo9rPBZi7l8=;
 b=JXJf0JAc3NFacoOHVNFedJe4DuSSTyQrC/zIlZR5+Km1h4gBVjorb6PwTzhOwp7Gn5
 kd+D0I5uzpJbiobDeWvFI2DxlGH5KTORLilm0djXjLY4HvoYSdrPJZMEuuifGBB4wCsX
 nmVEU8VvAdR2uhmdUfi6KnmcPoMGQblQPK2mX03apcerht3Nan2uCAtECous/jZHGbaD
 RElAjFnEB2psOhey/Ky8cS9GHOZUe5x7VAf1c3Vn6Qv7eseA6yZAAdBa2zwUC8PxBHFa
 o/eoMmHxesVNEBwmKhvSI5M16DkhWzlErb8+q7DBDO83wWbbRW+dS+DnvV9ozGThmtap
 pjDQ==
X-Gm-Message-State: AOJu0YzxOrM7HGMtmKyZJcJvqun3IwBff4fAN+9g71L5LewdHWboos2P
 xswWrD7UEJ3diGu9PzYX9gl5AxyD+LcjUepTKwUOFTLU2jtrow7GWz3SjP/JDdMMMFw/fKUb2+0
 uMgk=
X-Gm-Gg: ASbGncsnTcHnhR6IqchF9Vy7wMnT0/NJO8fqd7Hws7bJWoTL2aBSnrHrvSXP8d7OfRN
 FzIUDn6M/fZa6xaJ7a8ZEzBjrFsEVVXxWWKrq+rFfu+oa1B0uncDFx47oalijIWOqZZ7tUzw7BA
 seX0sx+PAY5WmgdcmmrpxNJtyujE9YToRp6bVMAHDmYJy2iBH8QnLrnQj5iRTR9y2k2v1EqKPxL
 PoAbRo48RnTc2oDjKS1ERq8YhRbRAr5260F1zyCJIBtvAYuLQZUZVEkM32H+d+RR7paxrfEudeD
 dWQT04BDcUsxDpUP8WU2n6MmY7oFc6oNbENKzbw9F7/DEG547iczcxGMETK6mj9W4A==
X-Received: by 2002:a05:600c:4fd4:b0:434:a29d:6c71 with SMTP id
 5b1f17b1804b1-439249b2af8mr119969575e9.27.1739225943639; 
 Mon, 10 Feb 2025 14:19:03 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390daf4438sm197149585e9.25.2025.02.10.14.19.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Feb 2025 14:19:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 06/10] target/ppc: Set disassemble_info::endian value in
 disas_set_info()
Date: Mon, 10 Feb 2025 23:18:26 +0100
Message-ID: <20250210221830.69129-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250210221830.69129-1-philmd@linaro.org>
References: <20250210221830.69129-1-philmd@linaro.org>
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
X-TUID: 7Mqwob7xKYhl

Have the CPUClass::disas_set_info() callback always set\
the disassemble_info::endian field.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu_init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 25e835d65e7..e816d30114b 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7398,6 +7398,8 @@ static void ppc_disas_set_info(CPUState *cs, disassemble_info *info)
 
     if ((env->hflags >> MSR_LE) & 1) {
         info->endian = BFD_ENDIAN_LITTLE;
+    } else {
+        info->endian = BFD_ENDIAN_BIG;
     }
     info->mach = env->bfd_mach;
     if (!env->bfd_mach) {
-- 
2.47.1

