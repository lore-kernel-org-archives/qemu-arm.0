Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02123FED9FE
	for <qemu-arm@archiver.kernel.org>; Tue, 17 Mar 2026 17:50:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w2YXa-0003pz-7d; Tue, 17 Mar 2026 13:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w2YXR-0003ds-SJ
 for qemu-arm@nongnu.org; Tue, 17 Mar 2026 13:49:07 -0400
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w2YXO-00075v-E5
 for qemu-arm@nongnu.org; Tue, 17 Mar 2026 13:49:04 -0400
Received: by mail-dy1-x132b.google.com with SMTP id
 5a478bee46e88-2c0d36f3888so1897096eec.0
 for <qemu-arm@nongnu.org>; Tue, 17 Mar 2026 10:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773769740; x=1774374540; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hUSbLOobWbo0z0ehlzPpMYjcHrg09tA0492KwnfG5oI=;
 b=GQI6GNbLMrFKDfjxUD1Ph94a1PfNT6fn7m9K6bgtz+BzO0fMGLbuSWw2+3VWWF9gqX
 aMJxxG9pRRd4rJPSc8jvYt7bSX6IegliJAsR4id/4M0azQMZNpVx1R8iLG5Hm4Rcg58M
 5tL2mgz8pgDe2VcbOPAOm+Xk8HrTvxNE/eMBZecPjauzpbZJVm7S5k2wJnedAKavVIrr
 nbcph28qqZloZ646G5cNXj6XDOCjSpHqGJAhBWzV1zHj9dHTVITCfQriUeyPdOFCQJ/N
 P0OwFaJPGzxKhHPVvrB3kp9xG08dylmPxxHDnRDrBPqNiuplWDVbcbZf5X8HJt5WXxcq
 24Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773769740; x=1774374540;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hUSbLOobWbo0z0ehlzPpMYjcHrg09tA0492KwnfG5oI=;
 b=XdjstKpBZn4aY/JusdgO9WTVj9A27JM/LNUzYUNPEnDvyBXQ/uhClpzpU18n9oO/Q/
 0avSnsFNmL+0wn9v/naEEIwoSYrmJ71Dkh5ObBYiJ53KPgeSQvxOQZgHlgVK99k/bnWi
 LUpwdyVShrZB3Sq1jQzQV2uTJ6fEeVeZe+qPYo51I0SBUHr7HyPoVSHEnQAneL2Lj8D+
 RTIOb5utxMS5w4/CVWzwTv4ytq7Iegyuh6p+wZ1+BjJcbI0r92gyf2RkaVzFDd2Kik+o
 Y4+1KVMvL0bKygFf7iDYiJ6yFN52Vf/wicitWFo5vB4OZ9VMriiIXctsTiMPkOf3Lv6Q
 6PMg==
X-Gm-Message-State: AOJu0YzU+5NZzNgDW6AiJhjbWrRiNE8E9+RKk/VlBkOnXJGiQOeHzVmi
 nli/2aBMpkb5o1I9XOCQelk8Nx4t4EBnEh8P9vtnlvHDTv5d+6+eJdk1
X-Gm-Gg: ATEYQzwbuUv8AKqXvpGa7AJszoejhJI13qaeMtI2QLcYRklnTZgWI3AUe2XXJay36fc
 RVaZ4ZEqXXA+Six94CEZciA1TRwzmwMu4i+82onAwOdVdYZ1IoTwVeijxZJYMCygalpF4kOR4EZ
 iokYKc5Pgk8veZEMABWKzMAJ7OrMhSF2gBDAKkhSmSlNW2nuJ5eXjJUuxnqh8ctiqnYPqfI1Uby
 QSXylD7QFndYBctM1cMJnsrjZoUxAl65yNV5VgNGymNNwv9dgVJpX9ojtDjy4GuDSFmAw7CSFxA
 cNVKH817JnLRj8qj2fpiptlaL/ziKdBrRAzs5xZ46szSWFBlPuUCx4ZBDgjwNCWEyZoLeVFwiIb
 yI4e8pQR+dEar9UttU5xXbHbnVKu+Qdr9yqSKTDAIxJLFjbxl6UHsKoPqbyJ2zdHIVnSK8Nb1nY
 F0TrSyOLZIbSWqBR1N9XeW9DiTBLuTgn34ead+6pACVyDUK/hGQ1t2
X-Received: by 2002:a05:693c:3011:b0:2c0:c55c:1574 with SMTP id
 5a478bee46e88-2c0e51930cbmr117430eec.21.1773769740308; 
 Tue, 17 Mar 2026 10:49:00 -0700 (PDT)
Received: from localhost.localdomain ([143.54.78.51])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c0e5583533sm190487eec.18.2026.03.17.10.48.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 Mar 2026 10:49:00 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, agraf@csgraf.de, peter.maydell@linaro.org,
 mohamed@unpredictable.fr, Lucas Amaral <lucaaamaral@gmail.com>,
 Lucas Amaral <lucas@lucasamaral.com>
Subject: [PATCH v4 3/3] target/arm/hvf: configure IPA granule on macOS 26
Date: Tue, 17 Mar 2026 14:48:45 -0300
Message-ID: <20260317174845.31768-4-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260317174845.31768-1-lucaaamaral@gmail.com>
References: <20260317174845.31768-1-lucaaamaral@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132b;
 envelope-from=lucaaamaral@gmail.com; helo=mail-dy1-x132b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Read the ipa-granule property (set by hvf_accel_init) and configure
the HVF stage-2 translation granule via hv_vm_config_set_ipa_granule()
on macOS 26+.  When ipa-granule=4k, use HV_IPA_GRANULE_4KB to allow
HVF to map memory at 4KB granularity, matching 4KB-page guests on
hosts with larger page sizes.

If macOS < 26 and a sub-host-page granule was requested, warn and
fall back to the host page size.

Signed-off-by: Lucas Amaral <lucas@lucasamaral.com>
---
 target/arm/hvf/hvf.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 1ba5bbf3..e3b1e3e1 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1269,6 +1269,38 @@ hv_return_t hvf_arch_vm_create(MachineState *ms, uint32_t pa_range)
     }
     chosen_ipa_bit_size = pa_range;
 
+    /*
+     * Configure IPA granule from the ipa-granule property.
+     * hvf_get_map_granule() was set by hvf_accel_init() before this call.
+     */
+    {
+        uint64_t granule = hvf_get_map_granule();
+        bool granule_set = false;
+
+#if defined(__MAC_OS_X_VERSION_MAX_ALLOWED) && \
+    (__MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_VERSION_26_0)
+        if (__builtin_available(macOS 26, *)) {
+            hv_ipa_granule_t hv_gran = (granule <= 4 * KiB)
+                ? HV_IPA_GRANULE_4KB : HV_IPA_GRANULE_16KB;
+            ret = hv_vm_config_set_ipa_granule(config, hv_gran);
+            if (ret != HV_SUCCESS) {
+                error_report("HVF: failed to set IPA granule: %s",
+                             hvf_return_string(ret));
+                goto cleanup;
+            }
+            granule_set = true;
+        }
+#endif
+
+        if (!granule_set && granule < qemu_real_host_page_size()) {
+            warn_report("HVF: ipa-granule=%zuKB requested but macOS < 26; "
+                        "falling back to host page size (%zuKB)",
+                        (size_t)(granule / KiB),
+                        (size_t)(qemu_real_host_page_size() / KiB));
+            hvf_set_map_granule(qemu_real_host_page_size());
+        }
+    }
+
     ret = hv_vm_create(config);
 
 cleanup:
-- 
2.52.0


