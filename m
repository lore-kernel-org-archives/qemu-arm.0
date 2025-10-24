Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B95CCCD1BF
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Oct 2025 19:35:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vCNZN-0002tb-FZ; Fri, 24 Oct 2025 15:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNZL-0002sJ-VQ
 for qemu-arm@nongnu.org; Fri, 24 Oct 2025 15:35:23 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNZI-0002Er-7u
 for qemu-arm@nongnu.org; Fri, 24 Oct 2025 15:35:23 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3f99ac9acc4so2267871f8f.3
 for <qemu-arm@nongnu.org>; Fri, 24 Oct 2025 12:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761334518; x=1761939318; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gBgrmxISukx2phyh25lifUJ0WsSDdFWGHFqh9r4mLPo=;
 b=OZ8AVjsMAeVhniWSat1X4qZ+wf3tp0xh54xiKUfvU0iN7s8QIE+8yi73xBRBJ623NT
 oIDcgeKJ/fjHKT1ms8f8OFgTiNPd1Z/sQZ3U3x4nk7ij2GqlKpjnGCHkKcjNkt5aHGar
 X6kqWBpCE6SWUmrDivis1qqI/F35F5ozY/B5OosZ4BQ3bZMS0awIecyzQ0PrHS/QQioU
 uedWqRQIC8YvwrMboRRSG6R9/SoRHMFSmqk4BViX/PzZncNZn93/PBeb0LNWfZ+oJ0bf
 YYY5i05n/S4tzlSAWQ1SqCsnpYIHdOjlmdz4VD64cSRf0Ha2kH0CrZGDYt+YkG050IPo
 o21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761334518; x=1761939318;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gBgrmxISukx2phyh25lifUJ0WsSDdFWGHFqh9r4mLPo=;
 b=KZVzdfKF+IzmgctE00fxkIXXR279KpSN1+g5mMBl080qCNZww9tAhveNfqMp7ngp3l
 oNJFrD26/JsNO74m39tShXxnx4M3bRqf1Wt2xuOUAVqLNLJ2sMQAxsqmK2Mtm4qkjrF+
 NZlNHiWYLUIAi+x5JRUDsCMNligqLOeM5XPiFcppbWaN8wh23OYcqwqVISyAyYU8SBGy
 GzHf+qQJlOf39SSOvHJRRXtkXIb84XxrtJK8dJo4gNF4NoRWU78KaBXlJ51ARhsQDGjF
 LpPMVh1dDynuJ/FHWn0PKT+MJMcZ9R+8szXSfQHOlx6as9gKfOilMo616g39sfa/dB5F
 5PGg==
X-Gm-Message-State: AOJu0YyNDp+xXbx9T8u2+k3JZ9qbAWSaKJNLTA7X0qyt68zhHaef5yeX
 T9UB7kRw4Db1i2B3OPgJDK7mnpVpthJ+f+l2SeBmsMccxLEGUkI9jmgPcF759miubwM=
X-Gm-Gg: ASbGncu7K/6rRMfwr+HyH2LxzTRvoOH/dSjb1BTOBiN4ERddDpsnrPaIxw2s3JZkJ/T
 Nf0C5bNaVmcYYq2H+ZXh3+tXPWhd3eDvrwyn41pPI9DiuPuGoB+Rll0KzK7fjbASqaFB/yUCOX5
 FMKdJvDiOULoZWX+hMkcpB4KyvJBGtpez9YsMoQ0FYnv16Cs7ceQv+4vaC1RHhmxuEtK2gatvdx
 RwApqsnQKbHPZ9YBOYeI9da9ED8mCeK0v9g6AERPEX62ak0Ah/24D7Jkp7juA8n9CGLtxYOsy2q
 bKQej1mLwn3dnd0U1D2VpgpeiShmjBEdcHtDB6721ySmlMTPxR10UkBpkYovyJbWGO90ef/tY/O
 PuGt7nGdbTn41fbt074xTq8hD4Cq38k3f4wTlLqnBcJDFSGqXudp7miDZJ4RXJVEA4w1d7B48BX
 ErrCdrpoaFQinP9dd3V7cSIOu8O017pqUbvIj6TOn8OMaQfYM9hQ==
X-Google-Smtp-Source: AGHT+IEV4OMSIcqrrZUp/PLoSTv+oEYKatypcoz+g00LHCca0FFl5wOaR3GUGM5GkDydxJfu3DuZCg==
X-Received: by 2002:a5d:64e7:0:b0:429:8bd7:774a with SMTP id
 ffacd0b85a97d-4298bd77939mr6244458f8f.40.1761334518282; 
 Fri, 24 Oct 2025 12:35:18 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b79cbsm27584f8f.4.2025.10.24.12.35.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Oct 2025 12:35:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@kernel.org>
Subject: [PATCH 20/27] hw/int/loongarch: Include missing 'system/memory.h'
 header
Date: Fri, 24 Oct 2025 21:04:07 +0200
Message-ID: <20251024190416.8803-21-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024190416.8803-1-philmd@linaro.org>
References: <20251024190416.8803-1-philmd@linaro.org>
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

"system/memory.h" header is indirectly pulled by "hw/sysbus.h".
Include it explicitly to avoid when refactoring the latter:

  In file included from ../../hw/intc/loongson_ipi.c:9:
  In file included from /Users/philmd/source/qemu/include/hw/intc/loongson_ipi.h:12:
  include/hw/intc/loongson_ipi_common.h:37:18: error: field has incomplete type 'MemoryRegion' (aka 'struct MemoryRegion')
     37 |     MemoryRegion ipi_iocsr_mem;
        |                  ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/intc/loongarch_dintc.h         | 2 +-
 include/hw/intc/loongarch_extioi_common.h | 1 +
 include/hw/intc/loongarch_pch_msi.h       | 1 +
 include/hw/intc/loongarch_pic_common.h    | 1 +
 include/hw/intc/loongson_ipi_common.h     | 2 ++
 5 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/hw/intc/loongarch_dintc.h b/include/hw/intc/loongarch_dintc.h
index 0b0b5347b2c..01bb1e465cb 100644
--- a/include/hw/intc/loongarch_dintc.h
+++ b/include/hw/intc/loongarch_dintc.h
@@ -8,7 +8,7 @@
 #include "qom/object.h"
 #include "hw/sysbus.h"
 #include "hw/loongarch/virt.h"
-
+#include "system/memory.h"
 
 #define NR_VECTORS     256
 
diff --git a/include/hw/intc/loongarch_extioi_common.h b/include/hw/intc/loongarch_extioi_common.h
index c021ccee0fa..1bd2bfa07fc 100644
--- a/include/hw/intc/loongarch_extioi_common.h
+++ b/include/hw/intc/loongarch_extioi_common.h
@@ -10,6 +10,7 @@
 #include "qom/object.h"
 #include "hw/sysbus.h"
 #include "hw/loongarch/virt.h"
+#include "system/memory.h"
 
 #define LS3A_INTC_IP                 8
 #define EXTIOI_IRQS                  (256)
diff --git a/include/hw/intc/loongarch_pch_msi.h b/include/hw/intc/loongarch_pch_msi.h
index b8586fb3b6f..ef4ec4fdeb8 100644
--- a/include/hw/intc/loongarch_pch_msi.h
+++ b/include/hw/intc/loongarch_pch_msi.h
@@ -6,6 +6,7 @@
  */
 
 #include "hw/sysbus.h"
+#include "system/memory.h"
 
 #define TYPE_LOONGARCH_PCH_MSI "loongarch_pch_msi"
 OBJECT_DECLARE_SIMPLE_TYPE(LoongArchPCHMSI, LOONGARCH_PCH_MSI)
diff --git a/include/hw/intc/loongarch_pic_common.h b/include/hw/intc/loongarch_pic_common.h
index 675ba96e64e..179361eb567 100644
--- a/include/hw/intc/loongarch_pic_common.h
+++ b/include/hw/intc/loongarch_pic_common.h
@@ -9,6 +9,7 @@
 
 #include "hw/loongarch/virt.h"
 #include "hw/sysbus.h"
+#include "system/memory.h"
 
 #define PCH_PIC_INT_ID                  0x00
 #define  PCH_PIC_INT_ID_VAL             0x7
diff --git a/include/hw/intc/loongson_ipi_common.h b/include/hw/intc/loongson_ipi_common.h
index e58ce2aa1c4..8b51af83e8b 100644
--- a/include/hw/intc/loongson_ipi_common.h
+++ b/include/hw/intc/loongson_ipi_common.h
@@ -11,6 +11,8 @@
 #include "qom/object.h"
 #include "hw/sysbus.h"
 #include "exec/memattrs.h"
+#include "system/memory.h"
+#include "system/memory.h"
 
 #define IPI_MBX_NUM           4
 
-- 
2.51.0


