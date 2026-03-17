Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529E9FED9EF
	for <qemu-arm@archiver.kernel.org>; Tue, 17 Mar 2026 17:58:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w2YgT-0004Yp-FW; Tue, 17 Mar 2026 13:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w2YgG-0004Wm-DJ
 for qemu-arm@nongnu.org; Tue, 17 Mar 2026 13:58:14 -0400
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w2Yg9-0000kA-Fh
 for qemu-arm@nongnu.org; Tue, 17 Mar 2026 13:58:10 -0400
Received: by mail-dl1-x122a.google.com with SMTP id
 a92af1059eb24-126ea4e9694so839035c88.1
 for <qemu-arm@nongnu.org>; Tue, 17 Mar 2026 10:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773770284; x=1774375084; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lRfNN7dQR71XGPxf5F8n2Fq8CgG24SE+5S4X1Hu3a50=;
 b=HnButinxL6BGEgsm1RKsVDdiMS7a4nd+299pG1o8OeKeCL7qDAvTqd07ZSxQwH7rHK
 JqupGKbc28Vir0tCpu6X8Ii5evDMIJV2rgsEECkPij0lqgCK/KCAZop1Rhv4FAUmi6DF
 s+SqS7lW3/5tjZn/vWNI9DaOUI2Zl78OELF2faruaGJM9z8aZUO04qzjfRFEc3v6HYaN
 Y6muCnVmak5O1fNxFymNbdsYrygF1cPXvU/dg0qLgi6XmwziLpmjxNmpwNbv1Iae8mwE
 K/0aHRxUper0z1do1RgF85Psv/kPDNuMBhD9D6bbALSb6tnQAEeoMqx5CYhegZYyPhO4
 c2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773770284; x=1774375084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lRfNN7dQR71XGPxf5F8n2Fq8CgG24SE+5S4X1Hu3a50=;
 b=UYfEJhiPLgZTn7NJxLMzaCJmCnqgt1Mg/Nbq4v1mtgipa4zKZG9Yzfhd9zKkbnG8m1
 BEsJz2FgpHDut4cWd1sCuK1z1DlJotu/kCZQo4PFUS8hR9EDpwhlHG0HgyzK7YRqq9D2
 hUR5ws+4QSnnkY8mStwrchFJC/cugB3c0qPGSot9TMbrkEIRKQb9rEQsDBU5NBOV3SmJ
 ISD/uH/J7/si+jlpHLU9erGcDGaStRzLbS9eHL+VwjVXwf4YAjE0t7gjDhFk2+usLW7s
 9hzW8aFb7JK7QqMcF5kmMajulUhRiBgWgH4+teCqYbJQzl70v9fYWBoWvwB/pLVAI9HY
 c0Dw==
X-Gm-Message-State: AOJu0YyJzx37ySU/07xBFzSJTURJXz/KZq+Pitr0BfwKlwV2OG/2lu+Z
 YXAX5ib3kWY5D/uZcgsCUTn03qy/uZxhwPbyjIRXfay9HJXdPYblyh8s
X-Gm-Gg: ATEYQzwssku+CtjrNfPZIMLxESoBW/qiQMXL3mlb6hl8aRlTzSO3RX7O/nisMxMBn5T
 FZmzZ4F+iy+Qf0oxi4n29GpYtEZqFPPqQkiFGhSkELqbYoO5DSMb95dfk/LsWFJbFgojWwtOSp6
 u4Rit+TJ4pLYM0kmNP4KHNy7Gda2nfJy1cIM8wgDUnp6x44SufvlReQI2KmSDrdc9cF53vpofLd
 GwlEOwj0X0Seke1o2oFJaNM8R9wCqZC7tcY3jeM1zxbcHzWnfE5GkzyZo+s6zBGNPznOWyvm14j
 k1rlTf1U0u0GzZiQdfkVdnKVcXE18Pzs1DMneKPal7SZpnl3dq5PJgCBvPFBle2TNd7MYlyfZG3
 i99pLf0P5i+CdudlNXIneaGO85vjavqzkwIJVEC8UvagzuOv/0+m6pxPLr6skyZ8AQ6wTZsjjw9
 1+F+ugXVeoFsZHb0Kj2QModRasEP+XWRQFWqw/jYZS1LqPgYkcIRWL
X-Received: by 2002:a05:7022:10c:b0:124:8d7d:2d63 with SMTP id
 a92af1059eb24-129a7195e45mr209803c88.35.1773770283404; 
 Tue, 17 Mar 2026 10:58:03 -0700 (PDT)
Received: from localhost.localdomain ([143.54.78.51])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c0e55a2be4sm237884eec.22.2026.03.17.10.58.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 Mar 2026 10:58:03 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, agraf@csgraf.de, peter.maydell@linaro.org,
 mohamed@unpredictable.fr, Lucas Amaral <lucaaamaral@gmail.com>
Subject: [PATCH v4 3/3] target/arm/hvf: configure IPA granule on macOS 26
Date: Tue, 17 Mar 2026 14:57:44 -0300
Message-ID: <20260317175744.32469-4-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260317175744.32469-1-lucaaamaral@gmail.com>
References: <20260317175744.32469-1-lucaaamaral@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122a;
 envelope-from=lucaaamaral@gmail.com; helo=mail-dl1-x122a.google.com
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

Read the ipa-granule property (set by hvf_accel_init) and configure
the HVF stage-2 translation granule via hv_vm_config_set_ipa_granule()
on macOS 26+.  When ipa-granule=4k, use HV_IPA_GRANULE_4KB to allow
HVF to map memory at 4KB granularity, matching 4KB-page guests on
hosts with larger page sizes.

If macOS < 26 and a sub-host-page granule was requested, warn and
fall back to the host page size.

Signed-off-by: Lucas Amaral <lucaaamaral@gmail.com>
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


