Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90432D58B08
	for <qemu-arm@archiver.kernel.org>; Sun, 15 Mar 2026 03:43:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w1cMj-0004yV-N4; Sat, 14 Mar 2026 23:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w1cMi-0004xE-BG
 for qemu-arm@nongnu.org; Sat, 14 Mar 2026 23:42:08 -0400
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w1cMg-0003lJ-QU
 for qemu-arm@nongnu.org; Sat, 14 Mar 2026 23:42:08 -0400
Received: by mail-dy1-x1335.google.com with SMTP id
 5a478bee46e88-2beab594d8eso3930488eec.0
 for <qemu-arm@nongnu.org>; Sat, 14 Mar 2026 20:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773546125; x=1774150925; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hUSbLOobWbo0z0ehlzPpMYjcHrg09tA0492KwnfG5oI=;
 b=k7FAMz83i8B64qtbi1AGEVo74T7AsSryE+b9nMT6JcupWniqtwx4HQMQWY/8lV+SaR
 89rlZ0OnfhBLAWmZHedktlv/pQyxYkYhUz5qW7y1lBAKBPAK8lkit6owI96rl1rob6Yx
 vG+tTl9JgHUymi9tzSyFpPt5FoDfGludzNwBj8Us7d2O2lAnKl67zQ7zpyx0bgM3OylO
 mTe6IGKTVJNm3qzQiubhdWKALOUZ1tJRnGHtnAbLzrSWUHtcT4b5EpqSHkY06NyUVNEh
 hmr6bcT9CJeP5OSZmUtLbWL2M5cEQmVZtXRbnyb/CKFAJXKggLttWqSdcwAjI8jqCCvZ
 32hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773546125; x=1774150925;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hUSbLOobWbo0z0ehlzPpMYjcHrg09tA0492KwnfG5oI=;
 b=mp3uWC4An+mr4VfXZ8D/GfTznBWchotiKk7O+bkUaSC1G8dqZl+E+mmRhUydSVnQM1
 bgNdIZur7yg5FfeHemjtkqA11NBp5QUc312BzE4W2ApSCqLcH/zxSfTnErUG5MVyvxIJ
 ysNbFJwVgFbw1bBIzWbzf1EemXX8npYEawSrFHiCejegJVL+9HqK05GU2Dn3PSf5JJA8
 WLTMzU0oUxG5NM/BN5B9Cd+fjNQNmUkq5VIlLKksvO7QW3NmoleWmUxJvj3ZNMcV+S2H
 FmmpLU3c1NVimWpgF55qieH3yJrq3q20B4R+3BZ4WN1r+4FjoINIeUxsOB2YXs4xFnqR
 EZgA==
X-Gm-Message-State: AOJu0Yz0IhIofYXS8ZJiT9ysPkbwCIAIrFG/91nhlJuUaggYufHyleOl
 GSPY3sq9P8rl6XG8M3Ol0qbZHetnzvhHpJJ4GU8z1Aq8MD/PY+03Hbd0
X-Gm-Gg: ATEYQzyzOqDsQVCIJPAVn1hZWHU2ORvzXWZtwqWYlR3vvOxgTk41oPx0KMBnS0+sXUK
 uLFHw8X0o1bj8H16PLL9qRMb8n831zsVyv6bWZrx8VfbdZ1Ss8Ld26O+1jrn/Hi42PdHfwFVSbL
 uv0ryVpaxhTBW/Mv+eFSfvSrLJ0f24wYvfqSE8/s0dyH1JJaAJFVgyqes55bXwz5BGFT0XH44KJ
 iNd1hBsCVkfjvxI55zJDhO0I3LMPjmBShWkEX/1i2IlY/sPf/5YRGdEGH6aZ2Vhj84t+/AKMtRu
 plvh/67JqSVh69YNaHORFblx93Dn0aAor8JoPhTgvt8uNOcJLDinui2O3MMIexZnM3Meq6A537E
 S9DJqLx5PgNJ6U2F9HglR8GPMDZex6k/v7BOktLXl6qWxPrArT9kqbVkQJM3PMy2Pxm59R7QBX6
 TG+CdE1E897NawMFJ0Xu2CmugWBoeWt7ro/KxKWJDX1mDCdFfldg==
X-Received: by 2002:a05:7300:c9e:b0:2ba:6b03:909b with SMTP id
 5a478bee46e88-2bea558f037mr4190582eec.19.1773546125341; 
 Sat, 14 Mar 2026 20:42:05 -0700 (PDT)
Received: from 192.168.7.2 ([189.6.247.75]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2beab57b2b2sm8862982eec.33.2026.03.14.20.42.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 14 Mar 2026 20:42:04 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Lucas Amaral <lucaaamaral@gmail.com>,
 Lucas Amaral <lucas@lucasamaral.com>
Subject: [PATCH 3/3] target/arm/hvf: configure IPA granule on macOS 26
Date: Sun, 15 Mar 2026 00:41:54 -0300
Message-ID: <20260315034154.41986-4-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260315034154.41986-1-lucaaamaral@gmail.com>
References: <20260311022732.64141-1-lucaaamaral@gmail.com>
 <20260315034154.41986-1-lucaaamaral@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1335;
 envelope-from=lucaaamaral@gmail.com; helo=mail-dy1-x1335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_BARE_IP_2=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


