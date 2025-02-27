Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp327555njb;
        Thu, 27 Feb 2025 08:06:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWpIlCSCt6sL12077mfjFSJ1kl2i4+eIMKJUEhByuyZnx9LLIHIeZzfZ31d8zI6BnWK+qciEFC2zlNWgg==@linaro.org
X-Google-Smtp-Source: AGHT+IHK7IkJdC0920po/Mih1NxU69oB2Tn9rQN7ZwYd32Jl4gaYsNEHUJD8z0M+njp6IsDBjoYB
X-Received: by 2002:a05:6102:441f:b0:4bb:d062:455 with SMTP id ada2fe7eead31-4c01df745ccmr4182632137.0.1740672373546;
        Thu, 27 Feb 2025 08:06:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740672373; cv=none;
        d=google.com; s=arc-20240605;
        b=Kw3HnfyAmStxQyXj8Pf8Vphn4F66JCrDMi/iUx3TPLN6MgsZOPC/+TVV1i+ftKPfOg
         G1W5qUCNHyvuieDGtoDNSZRUX9xmdGk4NAJmhSk78MJDLbjKj8bE4gzLc9VC2LvRsQYN
         Js+YRQNkCZNAigy43xmDuH21xJO367Q5dUyfYG/L9LDXMM+b7Q+slparuQjJFWPmZaEP
         eZMy6Adlv+NjfHp+FSgPUZtWY5bkjPKWJZtvihNkNitqbw5PWdH4h+o7jWf2i1TGn2LP
         IzDhZtmSyh5JbwFH6Dck5KuUWTGQ2yg5Phr9jR+AWcA5sLfCO3k9EeQOEKSEWrcnXc3P
         iihw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QM9+Kp6NZFa2rGHL+zpcs+xBZBueAr1j8AORaj7jV5E=;
        fh=BaBMhsa8otE44w+eiuuCkoL0QFe4OiybwLz9x35r5BM=;
        b=TwO3D7g8RbxL+FGolqz7QWsb4Rih53dfApEAKZVpaW1ZSq7zUBC4IXIXAOu9bgqjVw
         IKUNnatJVOmlpyqHRWERCjmiua9lsu9KqzHb6UbJzD8o8SBPp9EGuAu2oSpC3pG0Yfxn
         4mMX5Om0P1bw7D5K87XacVvLEMxETcWMhC5saqM+qu7IpZTsHwES+3bdqOdD4EVA8OAd
         K3qzuJT4LSocanqNT6HeGwDieONHASO4WFQ3k9DovtoCTL0AFFqCwEb5mrNqff/deGb7
         WzqxcSSaRI3NzUAls2InCYilR8nL7Dtwsa5MWjiuYIZP9QGwf2Ab+zCT/eG+crMKRdzi
         Ualw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ZawRAFEf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c03490087esi317971137.655.2025.02.27.08.06.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 08:06:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ZawRAFEf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tngK0-00071i-Mr; Thu, 27 Feb 2025 11:01:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tngJw-0006yN-8G; Thu, 27 Feb 2025 11:01:08 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tngJt-0007G0-EO; Thu, 27 Feb 2025 11:01:07 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7C1A35C59C6;
 Thu, 27 Feb 2025 16:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C282BC4CEF1;
 Thu, 27 Feb 2025 16:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740672062;
 bh=gCKFAW7Z2A6kbC2aXCcaFJfusets8MNdT9H4ztHpIKg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZawRAFEf4He0RAGPLzzojlRUmLa9qJrdF18Izbem/LjqM+v3e7yGbAjohI7QOta9k
 PW/ra8WF29ZhGjA93B13f2+nlSMAek8yjF4D+8hmV+2I1p1k+FWzY6qXFd4YXocswG
 0WwFEdI0UZK6PUMraM48c59APp6ZoXN3IH0waMmMslvaBQscddX30zVa3P9X7z1D6A
 NRIxOCWpf9tX7r4avKpwIvxE8FrsH3UEM383xGAk+P+nHHfSIV10UckkweDnvlZN3G
 Vak/AMAkDk/KNdxEwMi+HJXY56wfihZK0Pr6CjoKgW96JQdcex0e33RZHuCrU9ruHx
 xrTkna3t8kgtA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tngJo-000000023bH-44QX; Thu, 27 Feb 2025 17:01:00 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ani Sinha <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 09/19] acpi/ghes: add a notifier to notify when error data
 is ready
Date: Thu, 27 Feb 2025 17:00:47 +0100
Message-ID: <a6a2b8b68a12df8ef9018a9756b3ea95b1c84eb9.1740671863.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740671863.git.mchehab+huawei@kernel.org>
References: <cover.1740671863.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 47DAyDNUjO6A

Some error injection notify methods are async, like GPIO
notify. Add a notifier to be used when the error record is
ready to be sent to the guest OS.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
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
2.48.1

