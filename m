Received: by 2002:a05:7022:4195:b0:8a:132c:44a7 with SMTP id i21csp213477dli;
        Fri, 13 Sep 2024 23:14:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXc1adBXWwwgwTDtAPfu/RCgoaI4865Mjyh0dPhDXb/QfyXkQ+aaZ50pejQGoyoopSFgvAc/W1KclOOow==@linaro.org
X-Google-Smtp-Source: AGHT+IHTDrNs8GPA/zdhfdhyeBIdrxH2gRhtx4GCWUJs4WnU9DB2eafYeqGQvIcvGzbiY6ytFsFI
X-Received: by 2002:a05:6214:5d93:b0:6c3:67d5:aa3 with SMTP id 6a1803df08f44-6c573592b9amr105889476d6.53.1726294447928;
        Fri, 13 Sep 2024 23:14:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726294447; cv=none;
        d=google.com; s=arc-20240605;
        b=aPfwFxqNjucO0EwK9ZTr/SZVXxNyKXUeJJ7XHqiyn6ylyS8iP9GqG2KC3xJp4SvZmV
         CzF6OG1G8vvP+AcOGU6S5bJnnEKrCNyfHAM5TDhBrmPiILtslfBRUEN8PeZEqtvWEG7s
         R1NbRVMzSJBv6nHQ9XLkivUNn5lsHdCrOd36QWD7KEmWgIv4EJG1bF10bvCYkDiIPz5u
         QzrCZ1BHz3Y2s/2qQP6yLov/wSQ5UL3HrBnHVfiKEx9sOSffI3aYxdPNeZZi034tZZG9
         Gld6Qk6Y7sDRMktqOMAYCrifkmJbXkOZUnoALrdOaDRVC1KHUEiLARQ895xHRLn0LRXZ
         v/Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RPbfqOCY6RiY/gy13BMdL+8qrx4kwL/+MZMp3gIe+Ok=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=IRqsq6kYxtEYUbknVE4jR4i8DIFAIpiXArIyV8xcgIFD8+CyOJ1klPvQ9GQ5yJDcwO
         ioPGPAIrFyoBMLv3hXof7ocEeVNXyumNUmIkKEnAholgf7oVtfpj9bwV73eoD5xl1dk2
         cNSl6QXgiFXPDk6ZmObjYvOEG/fVVf7eEVufqWm2ymzrTNm2n3EDXrkl4Ag7VBqZmaze
         c4PTK64LSzuVDt+DNwoxBJzzDAR7hqVj1jEXJZ4IFWpsEARzkD815AyWOJ7mrrn1u+uY
         7Ii1VrQmtELv8NRckrcmtOfm29/lJdRtWDVnxY5VKQD3/RlZXUx/1jQb8eZmvOhVwMwm
         HMkg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=CKtc53yV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c58c7afe85si8804246d6.397.2024.09.13.23.14.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Sep 2024 23:14:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=CKtc53yV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1spM2j-0008Cb-BU; Sat, 14 Sep 2024 02:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1spM2h-00082u-0i; Sat, 14 Sep 2024 02:13:59 -0400
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1spM2e-0000vF-3P; Sat, 14 Sep 2024 02:13:58 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5A31BA40270;
 Sat, 14 Sep 2024 06:13:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 287FEC4AF0D;
 Sat, 14 Sep 2024 06:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726294434;
 bh=rOz2cndH3nNMcDN2uIMMMoryGTnl09uDUgmaCBrSPzw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CKtc53yV3Irs96TZAqTudg8emR0URa67qodP02zdVGPrMX8LxRyCRlO44LF9AoFg4
 vK/AF+AXcskeHQH25OLrFLo87iSQmL1PrfuS1oOiqNlODG5mqzbgFTTAKe8PPZsEWP
 xeL4WJV9pwFfQ9WUxaQTzPgx+uhvYEFR9eigEmWZpv/VHCEl9EpELpbHUU4EPCoDGC
 a/STbxLG2IbS34rdKN305o+HqaISAZ5yCxbXf3l/hxjO3wocyW80w3bUuPqsH8cT1H
 tOvWZeQ0XM1SUBKerL6TybU7DYyJEgluT3eW8t4znXpc+g7RWoB9e8B+ZyRbcOot3g
 8cIOVxkpnW2mQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1spM2a-00000003V6J-1Gmn; Sat, 14 Sep 2024 08:13:52 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v10 14/21] acpi/ghes: add a notifier to notify when error data
 is ready
Date: Sat, 14 Sep 2024 08:13:35 +0200
Message-ID: <bdcbee82bbcb614dd7ed57fd63d504af5cd5c558.1726293808.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726293808.git.mchehab+huawei@kernel.org>
References: <cover.1726293808.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:45d1:ec00::3;
 envelope-from=mchehab+huawei@kernel.org; helo=nyc.source.kernel.org
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.147,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FBsGBE4N6IQp

Some error injection notify methods are async, like GPIO
notify. Add a notifier to be used when the error record is
ready to be sent to the guest OS.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c         | 5 +++++
 include/hw/acpi/ghes.h | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index a8feb39c9f30..7bea265c7ef3 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -409,6 +409,9 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     ags->present = true;
 }
 
+NotifierList acpi_generic_error_notifiers =
+    NOTIFIER_LIST_INITIALIZER(error_device_notifiers);
+
 void ghes_record_cper_errors(const void *cper, size_t len,
                              uint16_t source_id, Error **errp)
 {
@@ -499,6 +502,8 @@ void ghes_record_cper_errors(const void *cper, size_t len,
 
     /* Write the generic error data entry into guest memory */
     cpu_physical_memory_write(cper_addr, cper, len);
+
+    notifier_list_notify(&acpi_generic_error_notifiers, NULL);
 }
 
 int acpi_ghes_memory_errors(int source_id, uint64_t physical_address)
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 7a7961e6078a..83c912338137 100644
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
2.46.0

