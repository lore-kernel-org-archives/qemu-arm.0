Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AEFFCA191
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Mar 2026 22:18:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzitu-0003Ib-Hz; Mon, 09 Mar 2026 18:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1vziTW-0000uq-VV
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 17:49:20 -0400
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1vziTV-0002Cv-9f
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 17:49:18 -0400
Received: by mail-dy1-x132a.google.com with SMTP id
 5a478bee46e88-2ba9c484e5eso12002399eec.1
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2026 14:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773092956; x=1773697756; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2tuchCVVV/Puxk4LNxFCEHszeZBuFiHFk9yGxFArzvU=;
 b=lqmGNxqpZ16G7n2osLDmt+B9gD8fTBmAlOOJjUib8ii0whDmtdjd24hBJOv43fj/e6
 rflaqn5nsgX5obBztze9dGOupHOT4oRSXsuXNnapXX+8lPytOW2u0hjDq8TnQ9b2uf97
 SYSwKX6HWcI5NV1sGlwjBDW4NJCrirzoxX2dhXbjIAyFAwxNS5U2+anTs2jb4JYP3iMW
 82geekRIDBS5opLmW/rIS0AC83gqiaLqIh0DvbOLs294Sd/f5oll7cVjj2Vu1s3S1SmI
 CHM2e59a3pHB6Rcd0IkxyRXBnxTL2/14yhiBXeycpoy0sTS4eHphXL49qkkiYImpIaz7
 UEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773092956; x=1773697756;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2tuchCVVV/Puxk4LNxFCEHszeZBuFiHFk9yGxFArzvU=;
 b=eH5wr/bVkMEuo1WQCx1p1QR4RlZOMyhszIcuRDa2vucvtK8hzrLeTXPLIt+wkpMILM
 HFalYUCR1JoNSiEzo2U361drgnYt7q547rdfllc6WgH64TyH2Gs0UAtoNbxCwjiSBwGC
 McUgjzQ47CdaaYbueZauygsmhr0+TCk2+SlPU6dltpq3FjLjsNmfyN+KAmygbD08P+br
 VWOl21Xg5KUAPmgaDvnR+4yd8SSG2LYuFAsCiVtuZUaDaBj/Fpu3QXrjmTuUSZ7+wnLh
 IZDb2fgBpVljn+nYXZc/aFdONCHMpCUlAC+5jNKIMPCN0aNVgKeSMgj6PdqadTrymurw
 g6gw==
X-Gm-Message-State: AOJu0YyxLQm50HgxmG5RZ6x6fntLhXkwScWXyUjNCzetMQqq06uuT9ND
 1ARQQjCxXyB0O2ahdVMZxA3JAcpyqcTu37pXesp9qlLH8RhMz24ynnRG1+dnmiQh
X-Gm-Gg: ATEYQzzynMDTDAoq0LnOBBdqbHmVKw7JjKQO/9CflSFbw3/2qnh2pBOBHqwT8sBO286
 A72MA8AORRUUp2xQOcRV9i27x33XRsic8zoUq4lsryGhUKBU09yToBdlg0ppQFySSOIx1w/DBAk
 M8IiX+V9yIZKVHCaQbFgoYb5rkKCCrU35MxAHYFpi3h+PWYuLBwvfF/Cc+INIBxY/cakIE/d0B3
 LrkRRY91rOoHeqozLJ0rKRBn1b8C0iKyDxbsVUMZVMSx0/pBpkXFZRxPX1xWQWIF6VmdWLl+GQr
 KZomgZs8ZyNTFp5sIrG5ul1ixZErUmW6CnutHshgWHtBhQYEv5X87xFJfkz0C3BPCITWj1ThKgt
 wgXD2lx28MjAh95ZrhxhWCBbmXVSmkSEC5w8WqgFS2I+u55Lxy76it1lSdtWWbFQaRuQEdY+rSB
 3PinA4X88K2SH7ZZwleV3q9/zPYLNdTGSTsbQJWHdM7ARED6vm5Q0=
X-Received: by 2002:a05:7022:661f:b0:128:ced9:9409 with SMTP id
 a92af1059eb24-128ced99529mr3422909c88.37.1773092955767; 
 Mon, 09 Mar 2026 14:49:15 -0700 (PDT)
Received: from 192.168.0.29 ([2804:14d:4c71:86dd:4cc9:ee1b:bd8d:dbab])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2be4f82b1d3sm10821438eec.11.2026.03.09.14.49.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Mar 2026 14:49:15 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, agraf@csgraf.de, Lucas Amaral <lucaaamaral@gmail.com>
Subject: [PATCH 2/2] target/arm/hvf: set 4KB IPA granule on macOS 26
Date: Mon,  9 Mar 2026 18:49:06 -0300
Message-ID: <20260309214906.92578-3-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260309214906.92578-1-lucaaamaral@gmail.com>
References: <20260309214906.92578-1-lucaaamaral@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132a;
 envelope-from=lucaaamaral@gmail.com; helo=mail-dy1-x132a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_BARE_IP_2=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 09 Mar 2026 18:16:33 -0400
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

macOS 26 introduces hv_vm_config_set_ipa_granule() which allows
configuring 4KB IPA granularity for HVF virtual machines.  This
enables hv_vm_map() to accept 4KB-aligned addresses, matching
the guest kernel's page size.

Without this, virtio-gpu blob BAR offsets that are 4KB-aligned but
not 16KB-aligned cannot be mapped into the guest, falling back to
slow MMIO emulation.

Gated behind MAC_OS_VERSION_26_0 compile-time and __builtin_available
runtime checks.  Falls back to the default 16KB granule on older
macOS versions.

Signed-off-by: Lucas Amaral <lucaaamaral@gmail.com>
---
 target/arm/hvf/hvf.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 87ddcdb..b71a98a 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -960,6 +960,20 @@ hv_return_t hvf_arch_vm_create(MachineState *ms, uint32_t pa_range)
     }
     chosen_ipa_bit_size = pa_range;
 
+#ifdef MAC_OS_VERSION_26_0
+#if MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_VERSION_26_0
+    if (__builtin_available(macOS 26, *)) {
+        ret = hv_vm_config_set_ipa_granule(config, HV_IPA_GRANULE_4KB);
+        if (ret != HV_SUCCESS) {
+            error_report("HVF: failed to set 4KB IPA granule: %s",
+                         hvf_return_string(ret));
+            goto cleanup;
+        }
+        hvf_set_map_granule(4096);
+    }
+#endif
+#endif
+
     ret = hv_vm_create(config);
 
 cleanup:
-- 
2.52.0


