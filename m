Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE27DCCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 08:26:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3s7e-0001OO-Cr; Wed, 01 Oct 2025 04:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s7b-0001LJ-EB
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:23:36 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s6p-0005z9-Ev
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:23:33 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3f0ae439bc3so3487389f8f.1
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 01:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759306959; x=1759911759; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IX+0YqpET4g31NDLY5+FZNI7uU5E3uyAuFWScssj2Zc=;
 b=C2sKA/PXhcE68K5CudvT79+XAwKqPesiWIpeRKMXhtHa36TEOduKJJnSqzlUWuv8zE
 EaJ2ThZfhOHjOtD5KBG+gD5ksEFZOR33DcGEO8CYqcsMyIw0CEH9XkAQuYdWvuFScoDx
 nEN7AXW73JrxLxUO8Jno0mk/279gRbRpXCbxsGlI5GIiJY8YgyzPLBkqHUqxhja4Cwrb
 YTj0PJq604ouWGEP6ObYZzt/DXOjjcXFasGKSZ11ljuLuWRnBqdONYJepFW8T5Y3QaFP
 nUieoCMB/HuFSHVjvEEI0GE1t6Dn7h40qOJbEogM9S9GhEowJYyXesDgBjM1JOJufL51
 0Gpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759306959; x=1759911759;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IX+0YqpET4g31NDLY5+FZNI7uU5E3uyAuFWScssj2Zc=;
 b=MRFTbHZm5IIRx8ZRlREiqVflySfIeFfync88i4tXeIrvGdpRld7LitJilT9od9fNKV
 gNcJCsCc+z/IhorEufsQhLjQqGNuZwXMBgeW8YefnBMf+x6Lxo6iBduDIbKCm3x4Vugw
 s0787B49VgbCLpfFoLebbH3yPPiUbZIkf7fWRDlHh76daocDSRZQVEBcKAfyM8mD5VAW
 2e+XZw1yCqo2tcPVM1SpMpXw9rVEvKcx0WgxmaASz5ogPlLWY5x52SLvamX7vCWCmajt
 fyfPiBaeIisVYteZLfMbvmkLg7ReYrfxawyvCuys8rnzmrVbj0XAlPHAtyOjNriWM22I
 7Rug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjZdBBnT2/ZpsdFUB1YT2K2KIT6weF9/Qjf2ylCUq1ZhHgXTUf03lq2IXMl0UzlNkmeyffMIShjA==@nongnu.org
X-Gm-Message-State: AOJu0YxMYOSW/ZWUAZj3joBtIHO8fpZ5Cx5G5EiZb64nD99ou4ZZx3Kr
 ldtuPGYKUB82lYDSIGl//e9WwdwJzQ0Ikxd/SkccJTcA3pGUnpRTEE6HsZGsvVb/ppw=
X-Gm-Gg: ASbGnct3ZjBmdx6kWJEOOANX9PQSFa7az+jmPvbKueYSuDMJP1tFKb4mB2hWiHh+cgl
 GAcJRqKD+u3t8OCPEKg1uq07I7mucIbbHaEXfKA1sWg7ZxB0vGnml3WklsYM2yRnfZ2s2ECrlu+
 mQWY+cB7v+Ow1fl+bpGlfL8KusUBM3SreQkCmGewZs0DkJxnlANBiKNaM4Um5onFk3mb20jCQ3D
 Hhc2pg4ChTHyGOPchbImf7piFxj+TFxDJKc8FpkNYQjtVolaph4GyYZb/MJV6swXzLO0MUR33HF
 O5qHz9BOCGOTKthjlVn37Q3t/ymFKoBJith2+yITVDffR3f+eNadd6SnVuRD57lxErpK/4/rXLE
 2KdyebxZWB8aE2RVHlD3MB+EdMiDSfQ31i58znNfzNt8C+e3+JbMILDVUbboWTKQr0VzF81UODE
 xZ9HYf5P5SQXi7YKlD9LQ6akpnh+BUxkQ=
X-Google-Smtp-Source: AGHT+IE/8bf21R3sZXOBj/IBWXVsuZtflY0OYXywlOPEETSJRqRNNcj4CdTyXwOOx1Abubt3QQ+Txg==
X-Received: by 2002:a05:6000:220b:b0:3fd:2dee:4e3d with SMTP id
 ffacd0b85a97d-42557818464mr1936382f8f.46.1759306959396; 
 Wed, 01 Oct 2025 01:22:39 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb985e080sm25891823f8f.24.2025.10.01.01.22.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 01:22:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, qemu-arm@nongnu.org,
 Jagannathan Raman <jag.raman@oracle.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 kvm@vger.kernel.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Fabiano Rosas <farosas@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH 13/25] system/physmem: Rename @start argument of
 physical_memory_range*()
Date: Wed,  1 Oct 2025 10:21:13 +0200
Message-ID: <20251001082127.65741-14-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001082127.65741-1-philmd@linaro.org>
References: <20251001082127.65741-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Generally we want to clarify terminology and avoid confusions,
prefering @start with (exclusive) @end, and base @addr with
@length (for inclusive range).

Here as cpu_physical_memory_range_includes_clean() operates
on a range, rename @start as @addr.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/ram_addr.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/system/ram_addr.h b/include/system/ram_addr.h
index 7a9e8f86be0..e06cc4d0c52 100644
--- a/include/system/ram_addr.h
+++ b/include/system/ram_addr.h
@@ -185,22 +185,22 @@ bool cpu_physical_memory_get_dirty_flag(ram_addr_t addr, unsigned client);
 
 bool cpu_physical_memory_is_clean(ram_addr_t addr);
 
-static inline uint8_t cpu_physical_memory_range_includes_clean(ram_addr_t start,
+static inline uint8_t cpu_physical_memory_range_includes_clean(ram_addr_t addr,
                                                                ram_addr_t length,
                                                                uint8_t mask)
 {
     uint8_t ret = 0;
 
     if (mask & (1 << DIRTY_MEMORY_VGA) &&
-        !cpu_physical_memory_all_dirty(start, length, DIRTY_MEMORY_VGA)) {
+        !cpu_physical_memory_all_dirty(addr, length, DIRTY_MEMORY_VGA)) {
         ret |= (1 << DIRTY_MEMORY_VGA);
     }
     if (mask & (1 << DIRTY_MEMORY_CODE) &&
-        !cpu_physical_memory_all_dirty(start, length, DIRTY_MEMORY_CODE)) {
+        !cpu_physical_memory_all_dirty(addr, length, DIRTY_MEMORY_CODE)) {
         ret |= (1 << DIRTY_MEMORY_CODE);
     }
     if (mask & (1 << DIRTY_MEMORY_MIGRATION) &&
-        !cpu_physical_memory_all_dirty(start, length, DIRTY_MEMORY_MIGRATION)) {
+        !cpu_physical_memory_all_dirty(addr, length, DIRTY_MEMORY_MIGRATION)) {
         ret |= (1 << DIRTY_MEMORY_MIGRATION);
     }
     return ret;
-- 
2.51.0


