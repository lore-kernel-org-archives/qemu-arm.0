Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6131722lfg;
        Thu, 4 Mar 2021 02:59:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwT5Y9jv5xKLsX6wnRyUwyrIFoBy5kGXfiM3WINM3jjQiFpvO8xAGFbvYquEDJT5DIVxa8B
X-Received: by 2002:a5d:9245:: with SMTP id e5mr3002961iol.97.1614855594763;
        Thu, 04 Mar 2021 02:59:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614855594; cv=none;
        d=google.com; s=arc-20160816;
        b=RkP23+yUmETb0kFWnEkWzQa40tGxWlwsN0nqNOPqtfrmbHlBoxt3PlPuDba+71WeZA
         w5AwvYo2949qULU6PloYw+QMVDJbiuL4iMEVe3lE6e23oQrZVNuo9Q88We8z6mzEpJ1A
         tiOXraZDflNQvMZlVc+JqmOegf900VTsPO6pVxyMzk3wyM3775u7Vv0YgXCh5llDVXPl
         yt3z/nx9gET8yYfwNLqGrtKGM/FoXWZ2R8CuAJhKOZC3OdQ4YrEW93oh61jPkKUO1l6u
         CAB0N1LixcFLXPoUad6qjq8rUe2QNg39p51ZjOP2VHzyQkCcwRbHSGbonEtfTcbzRecv
         d4Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5SOwtyN3Zbc4Z927SH0l0jz+6PoxQQXJFaiIPfeFKOQ=;
        b=ctQySXyumd206VRVJFnFaqCw+7YRn6pmBntDpeBA8lDVUhhJRZmGDEQxCbf7WjjrPe
         LpUllZDhAZt5jncOAoNcUI2rRPOGXfV2o895IFLibF1rdA+F/ldhWuxS4gluyKA4EXIF
         sNKI+hLf3pDgMiPjqJEzHGKAapqoWw8iSrSpiAzVJVIQSm8blqxx9Thtp96wJ1UqQ+JJ
         P/4sN4Nu1HjUIbTH8UP6Tg8k9tEmtLDVMbt1txqKS0tVJNTObtyiWq5uz0FZYTpfDqoG
         kwdsFxwHvt73ldEKmPzG+VKMfaBwaZ2fW8nCKNQnbKB3vixg6WX1SnFVT4a/mc8epZ7E
         vMnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=i9ekjixO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s19si20005249iov.23.2021.03.04.02.59.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 02:59:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=i9ekjixO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHlhy-0005TS-3O
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 05:59:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHleX-0001B4-PO
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 05:56:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHleW-00034p-0t
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 05:56:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614855379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5SOwtyN3Zbc4Z927SH0l0jz+6PoxQQXJFaiIPfeFKOQ=;
 b=i9ekjixOIkIo5GDKokX6ihGg1r6YlkUq1bdvzpZEHYDIEZAhJMHpP2b4uV4xX58Rnebl5u
 4ojckfdEiAMnGS3j8gVafqb9MdXEVA48aLKzfABb0uZnjdrbwGsbwoj3RZj4oOlJkeDNfT
 apIp+xJYddr/iRg/rfFD00EvhQ7keqc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-ei-ldS5NOou_OcrXB0wmLg-1; Thu, 04 Mar 2021 05:56:15 -0500
X-MC-Unique: ei-ldS5NOou_OcrXB0wmLg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0241D80432E;
 Thu,  4 Mar 2021 10:56:14 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-171.ams2.redhat.com [10.36.113.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A632F5D720;
 Thu,  4 Mar 2021 10:56:11 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/4] acpi: Set proper maximum size for "etc/acpi/rsdp" blob
Date: Thu,  4 Mar 2021 11:55:54 +0100
Message-Id: <20210304105554.121674-5-david@redhat.com>
In-Reply-To: <20210304105554.121674-1-david@redhat.com>
References: <20210304105554.121674-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sPUvAgdLA9CS

Let's also set a maximum size for "etc/acpi/rsdp", so the maximum
size doesn't get implicitly set based on the initial table size. In my
experiments, the table size was in the range of 22 bytes, so a single
page (== what we used until now) seems to be good enough.

Now that we have defined maximum sizes for all currently used table types,
let's assert that we catch usage with new tables that need a proper maximum
size definition.

Also assert that our initial size does not exceed the maximum size; while
qemu_ram_alloc_internal() properly asserts that the initial RAMBlock size
is <= its maximum size, the result might differ when the host page size
is bigger than 4k.

Suggested-by: Laszlo Ersek <lersek@redhat.com>
Cc: Alistair Francis <alistair.francis@xilinx.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/acpi/utils.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/utils.c b/hw/acpi/utils.c
index f2d69a6d92..0c486ea29f 100644
--- a/hw/acpi/utils.c
+++ b/hw/acpi/utils.c
@@ -29,14 +29,19 @@
 MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
                                 GArray *blob, const char *name)
 {
-    uint64_t max_size = 0;
+    uint64_t max_size;
 
     /* Reserve RAM space for tables: add another order of magnitude. */
     if (!strcmp(name, ACPI_BUILD_TABLE_FILE)) {
         max_size = 0x200000;
     } else if (!strcmp(name, ACPI_BUILD_LOADER_FILE)) {
         max_size = 0x10000;
+    } else if (!strcmp(name, ACPI_BUILD_RSDP_FILE)) {
+        max_size = 0x1000;
+    } else {
+        g_assert_not_reached();
     }
+    g_assert(acpi_data_len(blob) <= max_size);
 
     return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size, -1,
                         name, update, opaque, NULL, true);
-- 
2.29.2

