Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5185251lfb;
        Wed, 9 Dec 2020 10:23:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2eMfwvLiIutSNZ03y+fgo5dTO6LPN1CN6BYw00VZB6R/f9vyNRXBI2e2ljCFxwEIYUwwq
X-Received: by 2002:a25:1846:: with SMTP id 67mr5399658yby.220.1607538239035;
        Wed, 09 Dec 2020 10:23:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607538239; cv=none;
        d=google.com; s=arc-20160816;
        b=olhDGm9CZ49RE3NdQGcUxWKl180jnvpJAesOeZtcUdHX8ixh5Riah3S1JVR0ejr/As
         Ja3UpEMqB5vMe82igB0xS9ig4qh2gBYRSl0AM4/ANse3sWdTcSsYjm/AHxHR2uRkYhv4
         tNerWCaPHwF84hZ8iejfo05ZALi8Cwrl3PTJf2sj05tsgH64Tgz/amYPpcjv8A/Uiyn2
         HFZI/4abwfVdP6nieqOtrDlJ2TYMBkEYtyOJ6jwpT06CArvmTkCuh26faKn5A+Gr1tFL
         1HxdXs5/J/2c7n+DMOPyxfTtbK5M+ye7RbFdcO98ZQ0ZE9i2sjLnL+l0o54JH27knuyq
         GAUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=E8KRj603PozPBooN+Hrw7u6hn2/z258ATjiH9hYG620=;
        b=pz65yt2aVW5fAFaUIdv2EzzGPmB3VExNgn4sJ8dBRCdWTESIjOuly5OQexGuOX7+Mr
         Sip4mYBsqQYAfsEGihAPWZ+xIb3wsKftuSHYeolQmZooQQTA2Nv4zQULJmyDXDrLZm47
         8gZyudq1B+OQLZUemfB1jP/zCQ8baRLAvtoBBtCg8cQeDK8KJsgVAlRVHccVt4eP/e7n
         /1cDfe9KbZpEY5bgVF6E71DADufYS/KWqWCjQiFZ2qdm23uxK5IL17dhh2U2JkUJgXNj
         yfqQJ2QqGUGf5fpRNAxH6KqjQ82HONLTumAWut+K+mbQTREDrYrIQxCmuj1Yqu/d/E2o
         EdYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bRz6ndgQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h31si2856577ybj.403.2020.12.09.10.23.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Dec 2020 10:23:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bRz6ndgQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kn481-0006nV-V0
	for alex.bennee@linaro.org; Wed, 09 Dec 2020 13:23:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3sf-0001yn-9T
 for qemu-arm@nongnu.org; Wed, 09 Dec 2020 13:08:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3sY-0007x0-31
 for qemu-arm@nongnu.org; Wed, 09 Dec 2020 13:08:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E8KRj603PozPBooN+Hrw7u6hn2/z258ATjiH9hYG620=;
 b=bRz6ndgQ8ZJVuwrcsK3t/wpfvZcBYLeOxSt01uz4HYzMsDrRn6jhJVQl0ei21Mb2/tfN0Z
 u12ZrbNAT8nMd70TbkOKdLbHPS9WuoZbl3VKpBnNMA06YWKI4IorAGRXOpzuGJSylHekK+
 9zVmTyTQWnkSLCJL7la5ILNF+wRrr9A=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-j40IzR5-M6ubvpKfGg9SQg-1; Wed, 09 Dec 2020 13:07:50 -0500
X-MC-Unique: j40IzR5-M6ubvpKfGg9SQg-1
Received: by mail-wr1-f72.google.com with SMTP id i4so943984wrm.21
 for <qemu-arm@nongnu.org>; Wed, 09 Dec 2020 10:07:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E8KRj603PozPBooN+Hrw7u6hn2/z258ATjiH9hYG620=;
 b=MPbSai3Y46c6dKJhgckK7EePMiFuAYGaCXOErh/idpdFre773VP7a/uZuWE8Td6Bdk
 ll2YqdRY+l5zJiSsnYG1lhs7Sxtrry7Ft39MP/nyb/cHXEXhCOiXtqgEkkmzsTs21PkR
 P4EK/XHEuo7djxJos6Oyo/TSr/IDyTv6B5C4Xi/hrcEGm3VRGSpitAFdvgnqK7h8kRt/
 Pdmr6F4Pgj6C+4MA/BGNQ2uo3t8652R1++81Ffq9hQpctgmnxEq4VeU4YJvYI5JouToV
 /XJwW0ZT02/qPw8xN5zqrS54nRLPJE9LIFn29X9CFmkYYA7dGB+Qgv8om19RaVtaBFEa
 thgg==
X-Gm-Message-State: AOAM531avdkBOjIsLHKrnxM7PDc17GVaMloeG2koNfDnGfGK2iHT9Vwq
 IZiO2kk/4Mo1ioTvuJLyAiAnpH5jh/C+j/fifNicpavNSJVeuOe4DSH8jzGte8JQ0V/8e9gLJ+S
 my7UaLaOD4bzg
X-Received: by 2002:a7b:cc0f:: with SMTP id f15mr4059383wmh.29.1607537269441; 
 Wed, 09 Dec 2020 10:07:49 -0800 (PST)
X-Received: by 2002:a7b:cc0f:: with SMTP id f15mr4059344wmh.29.1607537268978; 
 Wed, 09 Dec 2020 10:07:48 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id 125sm4920272wmc.27.2020.12.09.10.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:07:48 -0800 (PST)
Date: Wed, 9 Dec 2020 13:07:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 13/65] acpi: Align the size to 128k
Message-ID: <20201209180546.721296-14-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jiahui Cen <cenjiahui@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Yubo Miao <miaoyubo@huawei.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vlCTMSFQFgCU

From: Yubo Miao <miaoyubo@huawei.com>

If table size is changed between virt_acpi_build and
virt_acpi_build_update, the table size would not be updated to
UEFI, therefore, just align the size to 128kb, which is enough
and same with x86. It would warn if 64k is not enough and the
align size should be updated.

Signed-off-by: Yubo Miao <miaoyubo@huawei.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Message-Id: <20201119014841.7298-7-cenjiahui@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt-acpi-build.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index e0bed9037c..711cf2069f 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -57,6 +57,8 @@
 
 #define ARM_SPI_BASE 32
 
+#define ACPI_BUILD_TABLE_SIZE             0x20000
+
 static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
 {
     uint16_t i;
@@ -656,6 +658,15 @@ struct AcpiBuildState {
     bool patched;
 } AcpiBuildState;
 
+static void acpi_align_size(GArray *blob, unsigned align)
+{
+    /*
+     * Align size to multiple of given size. This reduces the chance
+     * we need to change size in the future (breaking cross version migration).
+     */
+    g_array_set_size(blob, ROUND_UP(acpi_data_len(blob), align));
+}
+
 static
 void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 {
@@ -743,6 +754,20 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
         build_rsdp(tables->rsdp, tables->linker, &rsdp_data);
     }
 
+    /*
+     * The align size is 128, warn if 64k is not enough therefore
+     * the align size could be resized.
+     */
+    if (tables_blob->len > ACPI_BUILD_TABLE_SIZE / 2) {
+        warn_report("ACPI table size %u exceeds %d bytes,"
+                    " migration may not work",
+                    tables_blob->len, ACPI_BUILD_TABLE_SIZE / 2);
+        error_printf("Try removing CPUs, NUMA nodes, memory slots"
+                     " or PCI bridges.");
+    }
+    acpi_align_size(tables_blob, ACPI_BUILD_TABLE_SIZE);
+
+
     /* Cleanup memory that's no longer used. */
     g_array_free(table_offsets, true);
 }
-- 
MST

