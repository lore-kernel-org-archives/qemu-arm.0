Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2421439njc;
        Thu, 12 Jun 2025 08:19:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVU0FcAtV04TIpxkJH2GsyAcB4Q22IBVCzlRCNui3sFqnXWKf/c4DYVGWcOmlLYvr+OF+wbVEPqKrRTZg==@linaro.org
X-Google-Smtp-Source: AGHT+IF/39c0ZQRsopc/zuhRNhkP+H991hZIBFOb0Q5VDeRXN4CWdKsS2SbU9qe5P9FEeaVQG5TD
X-Received: by 2002:a05:6214:e49:b0:6fa:9baa:face with SMTP id 6a1803df08f44-6fb2c376053mr123735666d6.35.1749741528834;
        Thu, 12 Jun 2025 08:18:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749741528; cv=none;
        d=google.com; s=arc-20240605;
        b=FW8FOLRj0ZLvL16s6IbJJPipP03wZ61qIhKy8o3tfgw3i4imtGd/5y8bMIRWfocuKZ
         RyVxignNU5QacLuGROq9P+SM/j2bjrg1F37izE/TbS8oj3CgWez63LxB9HgFcRneGPMj
         75iKN0nsFOyl9FdNjK1ASkMUgi1eygNQFMOMsUCttcqDU9cOUGEEnKkNxx8LG8Rr2iyC
         LC+OeIkT0gD9S//rJxfFvC6Q8bBOr8GNnfguU3YSz/fCqD+OplVf1jsM+LPL1E/uHZJO
         K1lry6m+zn5TJ9eLHZHBXEdzHFv4AN1Ml9ZePw6V9fLHxh8dL/YLVdebXdPKljPRAu0R
         6vcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mtZs3EtbQBM2KieFk6ioqm+/qnqXFJF68JhXcL0px/4=;
        fh=hTLU5mNQKwnri22ef6rNORXQEnayYeGogGHi7V9gOk8=;
        b=eHLnXbFFUpcpxKt/sLG0TjwS8C/1g92uCX6HtrfgPFtCd4hCao0qtefr9EwoyIR7yo
         KNqs2XbwDEstTNDaNj7FnFig2GfMsO+p0ul4aWuaJxQWBVcVnPmIrRZ2F4Ub2yRPN0Tw
         EtanHXtD+RqRdIDprsedy8/nPBlS1dpVRxGsP66yhGvxkfsMWDlbpogsrFkDh7mCWIAs
         WEMn4VeHLVfyl4U/x/3qOE2+hbmfQhysA5FrL27tK2GpDO8iRRN+0QSXD3TZbYKJ5DhL
         51ZHabUF6EqUPxGMi2YwC78aG0r94c5SidDNficdRqZAcfjRJiyFpizphi3ug4LDMVLJ
         XDFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=WPnQBox5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb35ad9554si17765466d6.62.2025.06.12.08.18.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jun 2025 08:18:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=WPnQBox5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uPjgs-00039R-2r; Thu, 12 Jun 2025 11:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1uPjgi-0002nn-Tz; Thu, 12 Jun 2025 11:17:57 -0400
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1uPjge-0006dG-Fi; Thu, 12 Jun 2025 11:17:56 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 71CFCA51DCA;
 Thu, 12 Jun 2025 15:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07018C4CEFD;
 Thu, 12 Jun 2025 15:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749741469;
 bh=jUN0vZpicM1ninmp5QdTzg4Xor1R6VHYCafj50G+/4g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WPnQBox5S+yiz+0TTLKRMVoUqbGeTb1e+qze7z/ER4kf4MV5xRw8LBjWu97xHscFY
 QAj3rsQWRje9JLroUOmat3s0cWLqtqueVmE81WJNVBJR9m9k+ldjHtbWPsJBnYj7Xx
 7yFN+pl5EI8wcuZ/F++s+EeIMehYcfmZgs94fJZaqOLDUgrMtYh11zWBrNvFTQ9pMD
 X9wo1Qpo2ySaJhIk5+LxY5sbtsBlRIwZdDQETTM9ZmbouF0iu7QkvjVGmVBDLABaJN
 tLYj4PJB3S7KvycJ6HTJMTG/0cQj+1KWuXzPeYWEuL4Ua1e0owTxL1xCg+2+rUBbaT
 mmB2ryNymRcxA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1uPjgZ-00000005Evm-0s06; Thu, 12 Jun 2025 17:17:47 +0200
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
Subject: [PATCH v10 (RESEND) 10/20] acpi/ghes: add a notifier to notify when
 error data is ready
Date: Thu, 12 Jun 2025 17:17:34 +0200
Message-ID: <93416a3f6804f8f4c42b55d379b8efd22e45bc26.1749741085.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749741085.git.mchehab+huawei@kernel.org>
References: <cover.1749741085.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:45d1:ec00::3;
 envelope-from=mchehab+huawei@kernel.org; helo=nyc.source.kernel.org
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
X-TUID: c34TvvIXiK4T

Some error injection notify methods are async, like GPIO
notify. Add a notifier to be used when the error record is
ready to be sent to the guest OS.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/ghes.c         | 5 ++++-
 include/hw/acpi/ghes.h | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index f49d0d628fc4..0135ac844bcf 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -510,6 +510,9 @@ static void get_ghes_source_offsets(uint16_t source_id,
     *read_ack_start_addr = le64_to_cpu(*read_ack_start_addr);
 }
 
+NotifierList acpi_generic_error_notifiers =
+    NOTIFIER_LIST_INITIALIZER(error_device_notifiers);
+
 void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
                              uint16_t source_id, Error **errp)
 {
@@ -550,7 +553,7 @@ void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
     /* Write the generic error data entry into guest memory */
     cpu_physical_memory_write(cper_addr, cper, len);
 
-    return;
+    notifier_list_notify(&acpi_generic_error_notifiers, NULL);
 }
 
 int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 8c4b08433760..390943e46d99 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -24,6 +24,9 @@
 
 #include "hw/acpi/bios-linker-loader.h"
 #include "qapi/error.h"
+#include "qemu/notify.h"
+
+extern NotifierList acpi_generic_error_notifiers;
 
 /*
  * Values for Hardware Error Notification Type field
-- 
2.49.0

