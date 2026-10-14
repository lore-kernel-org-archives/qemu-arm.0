Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD06ECC6B1A
	for <qemu-arm@archiver.kernel.org>; Wed, 14 Oct 2026 09:44:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGvVe-0002jM-B0; Wed, 14 Oct 2026 05:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvVb-0002h3-Ra
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 05:42:51 -0400
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvVY-0001g6-Cc
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 05:42:51 -0400
Received: by mail-dl1-x122f.google.com with SMTP id
 a92af1059eb24-15ea896ddc8so1087392c88.0
 for <qemu-arm@nongnu.org>; Wed, 14 Oct 2026 02:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791970967; x=1792575767; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=UMv3P7LT5eVeaLvzcHhKXPCVXwqK6FvuxNT3/ZpShFM=;
 b=Sr1SLthT5dT4d9y603sBsDCyRfbin4szv7Ivv/1w1uNXV0NxnPnSevDDZ40kImTE12
 wBuuFSx9rFI4cWu+s8qHNAqWFMsSDz7Wax8m8qnITtl8pxpgE8motXXUaU7bn3ITOQkp
 d6vUg3VF6IgQy7KJnmixPMr4cTQNUmKSnozDWxLj4aoXrqGVUQigTYZxpGTTbU7nh921
 hJCw6CFCTuDOeu3P91VqJJn8ZhSZrDOThsQA2c4oXBubjTUr2mCGgsc/K45KhRglbuM/
 68CNNjmq81g8yzBvmv8Glu1KrKDCJ0Gbf0uXu0w2aNlQGIPYsyNcRtI6GZdy8Ze1JMFY
 fXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791970967; x=1792575767;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=UMv3P7LT5eVeaLvzcHhKXPCVXwqK6FvuxNT3/ZpShFM=;
 b=yb48GC/mWk9SNkkImEdHpUAYIxvi0DqNh9Uao0+gI70S8MVYn59li70Xy+14p7Bm+G
 Bs05tHKzmNFEnYPTsorI2NUeqO2DxtlcFNdebKGByCStQKIGQigNgAiZDZDxSy8MfTbQ
 1WPbZDTi7IuZt3+5vLZLgEnzxlITLSrpSiYpBCHUBUetkF4UjY07albDC8huH23a0BGg
 ov9TF7CZLFREcN1OxLqyRRykb1BAi8bZP/41fz59hgfb+jViiPqBWTsySpTdHnvlz425
 Z9V+ksrgcewSUt3xMpMJVNubVXtVwJY6WHxyX2q1WRM1hvyn58coy+s+0Nqp/3J7E2Ew
 orgw==
X-Forwarded-Encrypted: i=1;
 AKwUvByugzuZsSpawc/P2i7vFb8jfIUWsZnZYpOSa8iyQAGJr0/ve8X79M9ZH2KBLP/5Llyewx2H1jQFmQ==@nongnu.org
X-Gm-Message-State: AFq9FYJlqn0ZSoldhwufpyLEkAP3vZguUe1JGqN/pj/ohPdi+4VZ8jVa
 XtoVC1vrL3T3ihRwpVqX24jBgxbLEMDi8aIndxgO5Dm/BmuMRlrtTbp5
X-Gm-Gg: AYBFou0SgmvDZfgypoFCjJ15cZuyRU2Xh4Djpn+cy77BTsWNOPpZRxwc3ILpDvaR6cZ
 O2WY3PphMGlHxdVkTgee2JbdUbXfMefB4tMOH8DuqchlEwGiJky5h3EzLZis4Y/hMyIjMs+TU41
 C3ry0lFpaTXu4uWxOchv0hN2sg0nfx2qA1MVPsaKFb836Vwa/EFrbM/9z89M0f1LrINlu4QGB3C
 tgRSnFa7xLGqkYjWKSqjGsAc/XXJitQ9qzDH1UseFZNF+f6pUxauq8bh8J512PXvKZcY0NCzEhz
 YcK8Hfzk/OdvEfxOtMDFv3nqC1XBhOiqk3EBZLthukhDXplvTu5scEM1J+YsEymEkzjdHyoLxfI
 a6u+PmXWw5KsjQit4CCVeC4WxGj43jNtY6KV0jQLnH8tNfLqfaTccQ58UlJEKXp0qxp15syXEtI
 chCMCmqGSqx9ChGyC+EBhxks5GtsxipHD5UG8r+pOiqg6MeEiktXwhZ616zxmDTSBaCU1GYiQ6N
 AblyPa5xA4xhPcCYw==
X-Received: by 2002:a05:701b:2403:b0:145:152:b547 with SMTP id
 a92af1059eb24-16a56ab0d40mr20014077c88.1.1791970966688; 
 Wed, 14 Oct 2026 02:42:46 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-169a31f6f5csm44348380c88.11.2026.10.14.02.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 02:42:45 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, Eric Blake <eblake@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-s390x@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 David Hildenbrand <david@kernel.org>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Fabiano Rosas <farosas@suse.de>,
 Song Gao <17746591750@163.com>, Fam Zheng <fam@euphon.net>,
 Markus Armbruster <armbru@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Chao Liu <chao.liu@processmission.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH 17/34] target-info: add a combined-binary query stub
Date: Wed, 14 Oct 2026 17:41:32 +0800
Message-ID: <20261014094224.1976-2-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261014094224.1976-1-luoyonggang@gmail.com>
References: <20261014094224.1976-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x122f.google.com
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

Declare target_combined_binary() in target-info.h and provide a stub
implementation in stubs/target-info.c that returns false.

This lets target-independent tools and single-target binaries use the
query without a combined qemu-system implementation. A combined binary
can provide its own implementation returning true.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 MAINTAINERS                |  1 +
 include/qemu/target-info.h |  7 +++++++
 stubs/meson.build          |  1 +
 stubs/target-info.c        | 10 ++++++++++
 4 files changed, 19 insertions(+)
 create mode 100644 stubs/target-info.c

diff --git a/MAINTAINERS b/MAINTAINERS
index fc60193aa3f..669814d29c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2146,6 +2146,7 @@ TargetInfo API
 M: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
 M: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
 S: Supported
+F: stubs/target-info.c
 F: include/qemu/target-info*.h
 F: target-info*.c
 F: tests/unit/test-multi-targets.c
diff --git a/include/qemu/target-info.h b/include/qemu/target-info.h
index adda363ac39..9704ee32605 100644
--- a/include/qemu/target-info.h
+++ b/include/qemu/target-info.h
@@ -42,6 +42,13 @@ const char *target_cpu_type(void);
  */
 bool target_big_endian(void);
 
+/**
+ * target_combined_binary:
+ *
+ * Returns: %true if this is the combined qemu-system binary.
+ */
+bool target_combined_binary(void);
+
 /**
  * target_base_arm:
  *
diff --git a/stubs/meson.build b/stubs/meson.build
index 29b6644b254..ed7aeb61d0d 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -3,6 +3,7 @@
 # below, so that it is clear who needs the stubbed functionality.
 
 stub_ss.add(files('cpu-get-clock.c'))
+stub_ss.add(files('target-info.c'))
 stub_ss.add(files('fdset.c'))
 stub_ss.add(files('iothread-lock.c'))
 stub_ss.add(files('is-daemonized.c'))
diff --git a/stubs/target-info.c b/stubs/target-info.c
new file mode 100644
index 00000000000..8873aa21594
--- /dev/null
+++ b/stubs/target-info.c
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include "qemu/osdep.h"
+
+#include "qemu/target-info.h"
+
+bool target_combined_binary(void)
+{
+    return false;
+}
-- 
2.55.0.windows.3


