Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA27FF8864
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 23:24:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHVIx-0000yG-8a; Mon, 27 Apr 2026 19:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scottjgo@gmail.com>)
 id 1wHVIr-0000xG-M3
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 19:23:51 -0400
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <scottjgo@gmail.com>)
 id 1wHVIo-0004r4-Uk
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 19:23:48 -0400
Received: by mail-dl1-x1232.google.com with SMTP id
 a92af1059eb24-12c1a170a50so13599028c88.0
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 16:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777332225; x=1777937025; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=odA0IPTIBedM8iKPBA7J9zqBhAg6a99RkWB/Bh7jxvE=;
 b=Th9XeWhYxSSoV9oKO2GCX1OvUcS05ZEekmoaC0rk8KaKQBXu04nhvTZtd7kpipDvm0
 7BHMTgDV6A0SCWb4wXBfty6eV8qi0BazZalkmFZh9dqOw0aYiH1KK4r6Vsvwkg5saGnc
 Bra4a+ktaPHWsFh4N0r6RFT/iKwi+UrKFPftVOZhs3XiQtOqdkTkC3yl56PPcfb9CFlS
 w4ntFTg83F3hpx2Q5hwX2R5dRdrv3pdZ+BhC1XZ5tbMqzCzbB2K1C/1Imn1zrVoKUdfb
 PEdtLeIN9u2w+xAl9wXmwYk+117uTVRtQ0XfXf5OVHLZGPTMhZEPQIe7u4uNE0tusvMn
 NLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777332225; x=1777937025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=odA0IPTIBedM8iKPBA7J9zqBhAg6a99RkWB/Bh7jxvE=;
 b=TTWFg3c7K6icZLICuRgGTlQ5ziL4xDKodjSMtUzfnEwPeZCenRPObwh4UOr5M7O9Td
 O399iIM+9v7yX+QogV9ME51AcappWPXChnTUNtXTrE83PzpIhri+RJO5LgUCwVJStwSQ
 /TpMEjzOcsG6xuCWQuCuKMAgduPk2APN4e4ThVwOOB3Zowyx+8fpspXdo8MvOx/LeKr7
 97IItE0gn8UGqvDNMmTRUIMAh58KH89WYbMEB8iliFpNBp3NoCxYKwxOfIXjy5ZgdZZS
 onoW3RWHV0G/K9Of8Kp8yb3uad7B7ARS9UO7sH938OcNwoBCS7Pz8PcMrWWGMLFeRQKw
 Etkg==
X-Gm-Message-State: AOJu0YxjT0/PWbcbEx1cIYVm1fCv8zsyDkC3nc7G64rx5WPOk215nu4X
 oi1Q2f2xu9YjkGe9oU/cn7Vn2iKSQor36GA5Nyo10M6ICaeIFskXF/j7
X-Gm-Gg: AeBDies1gIo+i+M4AUNacBeQqFHrn7K5K+/buf8X8DBHrkvepBFW8n6bK9pfmCsyeDH
 eZSHO5RAZmIQabcWd4J7XpWKpuEQAD35DCP7VvXg0wU0oHqK92/s71e2bq7QVWaiIHVyvmgcZaW
 G5pWzJnmTmSKBa52JBSYSAECBCkYikTp0KYqsoHgpnUpy/nCeFAqO1mn3FDpOyqSHoXDpdP45oT
 qi3BtMzp8uQkXfX+QCvQaw7ufu5fPboIY8sSxSKpRi/0dL1vZlsq2uU3V5nfghhhRW3zoNitkrZ
 4vfmLGrkwea/0BG68Bf/043EoAMJhluU3c+38/Iwg/Pt1UGzEdbKAIJxPuSfWiW0032drRAMCCr
 Ef/TSPcRziIRApPlO63CUW8GahWj2glb4atljUYJAcR5VrkoNU9s2P/NDNo1UaI8sSYO5qWOB1y
 VdvpevyAJHlNo0z6zD3J1fvJf5EWXHkSpfL6VSOHSSPrnVz2Xw8DpYwRB7irHnYLSgwypSXhA8m
 3ZmqCTLJieCgansmvePKEgTl4swqtLwL/EVGw==
X-Received: by 2002:a05:7022:2385:b0:12c:8b9:71d9 with SMTP id
 a92af1059eb24-12ddd9b5758mr395647c88.27.1777332225460; 
 Mon, 27 Apr 2026 16:23:45 -0700 (PDT)
Received: from localhost.localdomain ([2601:645:8200:47:f4a5:bd04:3ca7:5727])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2ed0a0ce710sm849973eec.19.2026.04.27.16.23.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Apr 2026 16:23:44 -0700 (PDT)
From: "Scott J. Goldman" <scottjgo@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Roman Bolshakov <rbolshakov@ddn.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, "Scott J. Goldman" <scottjgo@gmail.com>
Subject: [PATCH 1/2] target/arm/hvf,
 target/i386/hvf: Pass MR-relative offset to memory_region_set_dirty()
Date: Mon, 27 Apr 2026 16:21:15 -0700
Message-ID: <20260427232116.50586-2-scottjgo@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260427232116.50586-1-scottjgo@gmail.com>
References: <20260427232116.50586-1-scottjgo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1232;
 envelope-from=scottjgo@gmail.com; helo=mail-dl1-x1232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Both the arm and i386 hvf accelerators have the same bug in their
dirty-page logging path: the address fed to memory_region_set_dirty()
is computed as "<ipa,gpa>_page + xlat", but memory_region_set_dirty()
expects an offset relative to the start of the resolved MemoryRegion.
address_space_translate() already returns that offset in xlat, while
ipa_page / gpa_page is the guest-physical (system address space)
address.

Adding the two together produces a bogus offset that for any non-
trivial RAM size walks well past the end of the MemoryRegion's dirty
bitmap. With dirty logging active (e.g. live migration on a guest
with several GB of RAM), this triggers an out-of-bounds atomic write
inside bitmap_set_atomic() and crashes the source QEMU as soon as the
guest writes to RAM:

    Thread .. 'CPU N/HVF', stop reason = EXC_BAD_ACCESS ...
      bitmap_set_atomic at bitmap.c:213
      physical_memory_set_dirty_range at physmem.c:1038
      memory_region_set_dirty at memory.c:2191
      hvf_handle_exception at hvf.c

Fix it by passing only the MR-relative offset xlat. ipa_page /
gpa_page is still the right argument to hvf_unprotect_dirty_range(),
which works on the guest-physical address space.

Signed-off-by: Scott J. Goldman <scottjgo@gmail.com>
---
 target/arm/hvf/hvf.c  | 2 +-
 target/i386/hvf/hvf.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index a19d7a5e1f..a36c634423 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2243,7 +2243,7 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
                 assert(!mr->readonly);
 
                 if (memory_region_get_dirty_log_mask(mr)) {
-                    memory_region_set_dirty(mr, ipa_page + xlat, page_size);
+                    memory_region_set_dirty(mr, xlat, page_size);
                     hvf_unprotect_dirty_range(ipa_page, page_size);
                 }
 
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index c0d028b147..cdc8bd1950 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -146,7 +146,7 @@ static bool ept_emulation_fault(CPUState *cs, uint64_t gpa, uint64_t ept_qual)
     if (write && memory_region_get_dirty_log_mask(mr)) {
         uintptr_t page_size = qemu_real_host_page_size();
 
-        memory_region_set_dirty(mr, gpa_page + xlat, page_size);
+        memory_region_set_dirty(mr, xlat, page_size);
         hvf_unprotect_dirty_range(gpa_page, page_size);
     }
 
-- 
2.50.1 (Apple Git-155)


