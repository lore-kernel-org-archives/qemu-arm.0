Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp965677njb;
        Wed, 12 Feb 2025 04:42:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWVCEuC0pdZCTY4ypA57ZFDrcGgzukZnJbTTiGQTaoyVjC66CWPYY1yK2z+x5Ubwg3vV0qYV+WDULKg1A==@linaro.org
X-Google-Smtp-Source: AGHT+IGU7mClsfLeVAvfj/gUo1H4UwhHy/oTDaUSIeGpVUL08bZm2DjtklE3r0wQak7teOhZ5Ru9
X-Received: by 2002:ac8:5ad1:0:b0:471:9cba:ad35 with SMTP id d75a77b69052e-471b0608892mr35473041cf.7.1739364135002;
        Wed, 12 Feb 2025 04:42:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739364134; cv=none;
        d=google.com; s=arc-20240605;
        b=gFRelj2Sg950RIqYlhtupdI611ie2TVkDp36ENJJHa73GQ13+aJ9UKsdNtoFKrZ3Ec
         Pffz3ibKKuMi/6VoId/L4In7HaVD4J4hKHty1cN30VtKpQtNE/3ze85iHZ++UfZJrCXW
         1BZym5LzcIurNv1KmYHPxGmnmt4CyxYvNt9aPSqrZuM8vCMLoYKzaJmQGg/ULTLfclnv
         lj539a3L8Dt/73L3353lx2zSlQBaD1+JWEyl9ezmqDMhinQs+6HKxs293HQABd9cCw/1
         sqCWzuPcWyV401cIBJHpT5I9O+mYXRNX83GBmOMYA4CVWNKFMfHaAz+CJJL6vg7uzKiO
         HVkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=reXXm8X+zlZP2Y6yVzIRnVkTJgqUEMG013HELmRkQIw=;
        fh=HlENWry5pBMj1xy+XPJJKz1+KJ8prrg3FvBcv7/VjNo=;
        b=KB9MWJ7bCXq4A6ys7G8fv5BXpE7xbZQqZcP+fsrL9YxUdzIsm4aJimmrZCMSEWPZCF
         IBLkvoNkVFK6TmXgBWRmHUZsX/PTvtxFOwpyFmvq3VwR++41tH+h8pK4R5Fh0QX1prEr
         Y3Mj5iHrWrYodABq1lS3aJ4E/lXinoZiNUbTd+WW8h4RVMr4kCZ2KahBoOBADsi+cNRd
         Tzxe/V2gujPxt+6jV8fJo9avPp08dFYCm3YyJpLHDDpgkrCgGE583brbm4tawg0QmaOY
         NCKE9jW/ug4IpGLJfFnB5yeUWGThz/zn1vUSIoUuAytp4Dk5s5bSHxCgsNOvUcuHg8E+
         gxuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xk6/5GDM";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471781f9320si91763361cf.594.2025.02.12.04.42.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 04:42:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xk6/5GDM";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tiC1t-0006fA-IU; Wed, 12 Feb 2025 07:39:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiC0F-0003z5-1d
 for qemu-devel@nongnu.org; Wed, 12 Feb 2025 07:38:07 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiC0A-0000fo-SW
 for qemu-devel@nongnu.org; Wed, 12 Feb 2025 07:38:06 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43957634473so11228295e9.0
 for <qemu-devel@nongnu.org>; Wed, 12 Feb 2025 04:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739363865; x=1739968665; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=reXXm8X+zlZP2Y6yVzIRnVkTJgqUEMG013HELmRkQIw=;
 b=xk6/5GDM4lginpeM5piaDxAyRepcRwowY6vEhprL7rMCybL3l67LLtVWfMDERPpUAF
 vFxngLZyE50IcQF1kplfVs802dYs2Ph9cwqFaDciDdF06La+SU1iaGj32wxQXw+OigFI
 2nJdX6CandphjrsYNiGCn3RzGvZtdTIUKLmRLKqWXf4SrXUespjRwRHphqpy24Rzqazz
 jIy1J8luKqSzsZ9ONkk847de8YzI+oSH6I2oGNubPcMjeNPCXoR5a7mzia7xYj+Uvffj
 Ky7sIrybCSF1fdhfxjHqERckxgAQOl0M+25iusXZu04kGaabOtrNVVMwVyQ7Fk0G6fQy
 hYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739363865; x=1739968665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=reXXm8X+zlZP2Y6yVzIRnVkTJgqUEMG013HELmRkQIw=;
 b=phHgyuoLcLAmWaAorwZIBi5oxG2pMdD3O06zjTCa0WsvG7q89cdyMsu+oAgy+y/MVQ
 ZfoDduU/3gcQPkolqqkjT86d7h7LY7tfw2MtZoKxdVb9Cc86XFBQFCHTqULFFHt4EmrC
 5iV0zr+kU/eP8it6iAgwWdEup5aoqVxP291ejA2IJld3ja3oBBVmQbzgkMIWrezhd/2r
 Ye5xULCBztkwRWmTx27JZ+5YPdCCq3QcQ8WuXJN4YCwsZC6NO211r2cW3J7yMyAa9Am1
 qiE6dg/7KDf3tYpe6p0AAPgE6Gh5/3VzQGpvKflMFz497Vv5kbiWBIxHPmiawYbxfzYM
 e6bQ==
X-Gm-Message-State: AOJu0YxqISJQHmcL6T0GudmECt38vOb7j/qvzvM5LkZ4Du4YzOO7wbwI
 mNjoS6cTokgkyzGD0eAa0EnEC+EOPPdwhaBzJjdOgMrydKUinueSqpCFg+8czF5bmXT0NhuXzSt
 7QGg=
X-Gm-Gg: ASbGncs9yD00bz4/zHV2P3D1x5e7rSXNlpQQjvq8mL4o4YeFyb6AASJe25P+7YViT70
 WhKDLwUKJc3DPjeMpiJiK3AiJGRUCEmwbLsJuoCd7QByeHMpiShhFocf4oPc9QBmtz7/WGrNoT4
 LluYfl8cqUh8Z+cdtT7ALVgWojCmbB7NLgrOhF6mxg6M4JrUvOO5egYE7pKyWlDWwmqXCe5jdCg
 yq7+RWu+VdhYAAZSixLAvgNe5kVZEvQdPUVVEAD0dyd5hJXqQwf2CT1j965sTKeYbI3mm7I1qb5
 C2eukS8lKwlP5o6lxMAYDH/p9aLxNo//uFh9nzwrqEb0qN09+Rsoe7didEg3p7rrOw==
X-Received: by 2002:a05:6000:d0a:b0:38d:d18d:262f with SMTP id
 ffacd0b85a97d-38dea2880a1mr2229435f8f.26.1739363865520; 
 Wed, 12 Feb 2025 04:37:45 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a06d22csm18950785e9.22.2025.02.12.04.37.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 04:37:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v7 09/10] tests/functional: Remove sleep() kludges from
 microblaze tests
Date: Wed, 12 Feb 2025 13:36:58 +0100
Message-ID: <20250212123659.52764-10-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250212123659.52764-1-philmd@linaro.org>
References: <20250212123659.52764-1-philmd@linaro.org>
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
X-TUID: sMmXItR0J4pO

Commit f0ec14c78c4 ("tests/avocado: Fix console data loss") fixed
QEMUMachine's problem with console, we don't need to use the sleep()
kludges.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20250206131052.30207-15-philmd@linaro.org>
---
 tests/functional/test_microblazeel_s3adsp1800.py | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/tests/functional/test_microblazeel_s3adsp1800.py b/tests/functional/test_microblazeel_s3adsp1800.py
index 715ef3f79ac..60aab4a45e8 100755
--- a/tests/functional/test_microblazeel_s3adsp1800.py
+++ b/tests/functional/test_microblazeel_s3adsp1800.py
@@ -7,8 +7,7 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later. See the COPYING file in the top-level directory.
 
-import time
-from qemu_test import exec_command, exec_command_and_wait_for_pattern
+from qemu_test import exec_command_and_wait_for_pattern
 from qemu_test import QemuSystemTest, Asset
 from qemu_test import wait_for_console_pattern
 
@@ -31,9 +30,8 @@ def do_xmaton_le_test(self, machine):
         self.vm.add_args('-nic', f'user,tftp={tftproot}')
         self.vm.launch()
         wait_for_console_pattern(self, 'QEMU Advent Calendar 2023')
-        time.sleep(0.1)
-        exec_command(self, 'root')
-        time.sleep(0.1)
+        wait_for_console_pattern(self, 'buildroot login:')
+        exec_command_and_wait_for_pattern(self, 'root', '#')
         exec_command_and_wait_for_pattern(self,
                 'tftp -g -r xmaton.png 10.0.2.2 ; md5sum xmaton.png',
                 '821cd3cab8efd16ad6ee5acc3642a8ea')
-- 
2.47.1

