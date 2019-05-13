Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2760559wrg;
        Mon, 13 May 2019 05:46:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy4U2GvpIFYQXcKyyA1rFWDWafN5HI3geF8HzIghjDdSSqW76YImMPAYzKWzVHWMWcJEPcM
X-Received: by 2002:a17:902:8ec4:: with SMTP id x4mr20956832plo.249.1557751611499;
        Mon, 13 May 2019 05:46:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557751611; cv=none;
        d=google.com; s=arc-20160816;
        b=tW27FvESDolJqI2Boj8yFb1BshOUD/P0/Jo9wgFJVejIMILbi2sG2XOdRy5L9xG1TG
         hMl0PWpaHSKpsmy21MPyDeaJO6C5kdXrxpV03qpz9HftSsZpZadH4ztNR/LWRZ/ePw7Q
         HljzfuwrTMVmvlm8ZdECRvxJtnymqoJQuoItKDpZ3OorQZzyzrOXTLSMKqLRqQzVkLFT
         dgbcgVImwP4LKNLStkhEbcZFFchenXbctZrWetPqQlthVNoOfRrrW68Iqc03oYw7cEWf
         6u7XJOKIs+2xumK/Yibk9OaH6yIMw50RDAaw+fkCdsha3gqt+zxlIp+1noHvdhQBLBAC
         qT2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=wXfNUKzBVjVyxD7hoIYLWfcz/ruM+61t8MI7ZgW3f20=;
        b=bdE5Bt6BXAEiTvw5DQlgHPZ77+D/3JL9Y08PT0BEc+TIuzfKqxmj9UYF1mW+9tfH7w
         VcSCWD5mUexShKxGEaSTBy6c9RE/h7GSrjIxR0cmju15edOcq5TeTccIvvj8MkAAZdSJ
         16rvNMgfe41mQ5QnCLKJmArPWvnXxXF7xwMMF59P7MGNUo4Hgd2umaEhMgme/IeK9Y4c
         B2DFlmj4DcxS89U7N+6DubVEcqVa3lqT6+JqI1ir9n0bNBZmlBV20ULxxajAm/YkXiEe
         cUOE9AObai8g5rAXtTL1+k/vd1A8/IJrP+6fEPlbfmWynl8ytcMUPtJcTai0hB/E7hsv
         SZdA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s23si16032343pga.580.2019.05.13.05.46.51;
        Mon, 13 May 2019 05:46:51 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729952AbfEMMqu (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 5 others); Mon, 13 May 2019 08:46:50 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:39526 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729925AbfEMMqp (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 13 May 2019 08:46:45 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 556FA658F4A090B11089;
        Mon, 13 May 2019 20:46:43 +0800 (CST)
Received: from ros.huawei.com (10.143.28.118) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Mon, 13 May 2019 20:46:36 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>,
        <lersek@redhat.com>, <james.morse@arm.com>,
        <gengdongjiu@huawei.com>, <mtosatti@redhat.com>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <zhengxiang9@huawei.com>,
        <jonathan.cameron@huawei.com>, <xuwei5@huawei.com>,
        <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>, <linuxarm@huawei.com>
Subject: [PATCH v16 05/10] acpi: add build_append_ghes_generic_status() helper for Generic Error Status Block
Date:   Mon, 13 May 2019 05:43:03 -0700
Message-ID: <1557751388-27063-6-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557751388-27063-1-git-send-email-gengdongjiu@huawei.com>
References: <1557751388-27063-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.118]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: gHrYAlzxUWO3

It will help to add Generic Error Status Block to ACPI tables
without using packed C structures and avoid endianness
issues as API doesn't need explicit conversion.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 hw/acpi/aml-build.c         | 14 ++++++++++++++
 include/hw/acpi/aml-build.h |  6 ++++++
 2 files changed, 20 insertions(+)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 102a288..ce90970 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -296,6 +296,20 @@ void build_append_ghes_notify(GArray *table, const uint8_t type,
         build_append_int_noprefix(table, error_threshold_window, 4);
 }
 
+/* Generic Error Status Block
+ * ACPI 4.0: 17.3.2.6.1 Generic Error Data
+ */
+void build_append_ghes_generic_status(GArray *table, uint32_t block_status,
+                      uint32_t raw_data_offset, uint32_t raw_data_length,
+                      uint32_t data_length, uint32_t error_severity)
+{
+    build_append_int_noprefix(table, block_status, 4);
+    build_append_int_noprefix(table, raw_data_offset, 4);
+    build_append_int_noprefix(table, raw_data_length, 4);
+    build_append_int_noprefix(table, data_length, 4);
+    build_append_int_noprefix(table, error_severity, 4);
+}
+
 /* Generic Error Data Entry
  * ACPI 4.0: 17.3.2.6.1 Generic Error Data
  */
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index a71db2f..1ec7e1b 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -425,6 +425,12 @@ void build_append_ghes_generic_data(GArray *table, const char *section_type,
                                     uint32_t error_data_length, uint8_t *fru_id,
                                     uint8_t *fru_text, uint64_t time_stamp);
 
+void
+build_append_ghes_generic_status(GArray *table, uint32_t block_status,
+                                 uint32_t raw_data_offset,
+                                 uint32_t raw_data_length,
+                                 uint32_t data_length, uint32_t error_severity);
+
 void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
                        uint64_t len, int node, MemoryAffinityFlags flags);
 
-- 
1.8.3.1
