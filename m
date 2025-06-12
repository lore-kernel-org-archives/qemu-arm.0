Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2421849njc;
        Thu, 12 Jun 2025 08:19:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUPvputdgo8PsWCO2WDd9Ar5KB7zFk+qT0z+e+YsNFR5lOdMgKON0WLaO/kj1HkYmFQny7Xks3hlcGYuw==@linaro.org
X-Google-Smtp-Source: AGHT+IHYi+O1qr/W9C+tfXNDOmCA/39gQQ7XQ1/0avqLx0+71U/TLrfJ5x9qE7BSghPgYL6pqpHL
X-Received: by 2002:a05:620a:800c:b0:7ca:f3d0:e7c8 with SMTP id af79cd13be357-7d3b2aa43d3mr565628185a.52.1749741570832;
        Thu, 12 Jun 2025 08:19:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749741570; cv=none;
        d=google.com; s=arc-20240605;
        b=Z6RTdE4gBHhlVXU5SdvZ2d+UW6E27g/PGT6tdfiVemOBm/sJv/UKTDq+AsSIJEErP2
         crDbG8/3S+vR3c7YuzUfCBdiStHot19wmi4ge9IvHafLc/psTNbWCu9IYagWvcoobUcd
         sN+JhHbdwD/Pu6Gp/L+3+neRAcRGw8duRpvG1yzbxXAjVdPO+AnsahBBAhrZFN03cs2Q
         ZUchx0qPxcoMCmoJEe8iFeCIbsLzGN5VmaJjySMlj0cbzIW3jMpNX684LfjJhrKA3VuX
         KM+w43i8dWpSkKxKY/Xwz1SFz27e493ixnzsQx2X9nU7e8R6Wgalp94RxrHwYgqxvqN9
         3NeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4qxGklo/JtayfWexug5mhPqTKDFRg9klTXYdFFJRXGs=;
        fh=hTLU5mNQKwnri22ef6rNORXQEnayYeGogGHi7V9gOk8=;
        b=O3WJBFvVaHNz0G/wVxPpkpp53XgewWaAS5GSzGl+kd0cJw4FCp77AXEVDWtHONYROr
         G1HzFwyK6VCzyGZvAl21ZlqMbIM9sqsUdzw2O4N3AIUkFVjmnOQoZvxS5VjF6UEB1bF+
         /2S5KU6c1LI2VYU6d9G5utnigFG07P/O2SUr/d43uaDgYXLiQtFBbwht6NMvR5o4BbwY
         hbG0AOqjvjmSlvNqif7r4quDRerjVhRpVLWyyI8fgAriCqtYeGqYhO2IrLywqmQkn6hE
         omET5k+pROLmcz0TKGw2amtlRAq0z3k72XbSCNY0M0D4VkwTKU1zYhIEpG6KpdtXIUNf
         UJkA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=gnwk1gdh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8dc3330si103626285a.32.2025.06.12.08.19.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jun 2025 08:19:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=gnwk1gdh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uPjgu-0003JV-Cp; Thu, 12 Jun 2025 11:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1uPjgj-0002p6-OK; Thu, 12 Jun 2025 11:17:57 -0400
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1uPjge-0006dS-Je; Thu, 12 Jun 2025 11:17:57 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 45F084A7A4;
 Thu, 12 Jun 2025 15:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A065C4AF09;
 Thu, 12 Jun 2025 15:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749741469;
 bh=Ru70Z0gfk7r/ztNDvEUpiGKGD5w8V2rasl2zsjCvPA0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gnwk1gdhM/3kbf8HHrU5zzhlH6cnS2A81Xtk2CK4MJethML2GjTybiMCalB6rD6J1
 NNZulKG0y3Vc58Ul9XTmHOipZe6b9aw6+q1IHaQPWVgei06/q6JQuJWXlDIrS2xWel
 UDORctuaOCujSkInB0xcF56QjYvaLsG114CiNSW1/Lk0RtNnk+I7u61WD4Ke6uJd5Z
 a4POzcQTr28dT7PBgD++1WxFEg2O+mnns/9NzDYDo8ZBDADHT/whBDf93RUEb3wx0Y
 rWmCqjPyqY4a1lgf+LpTQl1dLyael+8vEWfniXfjpHJ8fSCVU+ZKjqupXayB5MXPt0
 XimEFSiXxnBrw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1uPjgZ-00000005Evq-17RR; Thu, 12 Jun 2025 17:17:47 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Ani Sinha" <anisinha@redhat.com>, "Dongjiu Geng" <gengdongjiu1@gmail.com>,
 "Paolo Bonzini" <pbonzini@redhat.com>,
 "Peter Maydell" <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Shannon Zhao" <shannon.zhaosl@gmail.com>,
 "Yanan Wang" <wangyanan55@huawei.com>, "Zhao Liu" <zhao1.liu@intel.com>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 (RESEND) 11/20] acpi/generic_event_device: Update GHES
 migration to cover hest addr
Date: Thu, 12 Jun 2025 17:17:35 +0200
Message-ID: <8f07e0535b4b1d4ae11e643c1885b85f4bcdda6a.1749741085.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749741085.git.mchehab+huawei@kernel.org>
References: <cover.1749741085.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2600:3c0a:e001:78e:0:1991:8:25;
 envelope-from=mchehab+huawei@kernel.org; helo=sea.source.kernel.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: XkUjbXYVKbMl

The GHES migration logic should now support HEST table location too.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/generic_event_device.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 7a62f8d5bca1..d292f61b4e41 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -386,6 +386,34 @@ static const VMStateDescription vmstate_ghes_state = {
     }
 };
 
+static const VMStateDescription vmstate_hest = {
+    .name = "acpi-hest",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (const VMStateField[]) {
+        VMSTATE_UINT64(hest_addr_le, AcpiGhesState),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static bool hest_needed(void *opaque)
+{
+    AcpiGedState *s = opaque;
+    return s->ghes_state.hest_addr_le;
+}
+
+static const VMStateDescription vmstate_hest_state = {
+    .name = "acpi-ged/hest",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = hest_needed,
+    .fields = (const VMStateField[]) {
+        VMSTATE_STRUCT(ghes_state, AcpiGedState, 1,
+                       vmstate_hest, AcpiGhesState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_acpi_ged = {
     .name = "acpi-ged",
     .version_id = 1,
@@ -398,6 +426,7 @@ static const VMStateDescription vmstate_acpi_ged = {
         &vmstate_memhp_state,
         &vmstate_cpuhp_state,
         &vmstate_ghes_state,
+        &vmstate_hest_state,
         NULL
     }
 };
-- 
2.49.0

