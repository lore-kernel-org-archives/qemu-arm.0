Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp5067126lfp;
        Tue, 5 Oct 2021 09:22:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQtFE0JXXOH+0PvemijQaqenvwvbuH+0ELZOdijJ88lFB7GKsBBXmOBHJsc8GiTTe4w00h
X-Received: by 2002:a05:622a:15d6:: with SMTP id d22mr3843158qty.214.1633450936274;
        Tue, 05 Oct 2021 09:22:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633450936; cv=none;
        d=google.com; s=arc-20160816;
        b=GlMwGY4/6ImrYGZ4YoWZk/+CEWp0DKVAdu8tY7G25/REirC21eJYnsrHgjS9zXIV38
         cIKTU8V8cPzIkeIjx++8vZ2ibbu5KCSoRH9uvVfgzpkHJoyD736S6a9D8uRe/CQvYbXl
         M41YTBDYtcu1ZSU6J4YWajlzoTm6iQh9bfpB3A3CUD1jdnb7kKBa4eORGuGw+2y5tAOO
         D1HeczuZXUO2kZZOm+nl+0C1oAbimhxNnIWg0N9v3y2x2nIPTwG5onVCzAI0bDpMAP6W
         8v+EgOCjMiQKErT3QZfHTeVXeZ76sT5Yrztmz94a7DmV61BwpJrKSehbz4iWmR5pADB8
         iKxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=OCIxQsk7jhQmV5lumZAqEAV5I0Q6nMdVi6zQWr5NyRs=;
        b=eI9h9slBZqw6iLdmOq9B9C6oaxrWbp6xvOQtm0ep7Jv8CMiEkVeTPX7BCO/30g/zqG
         JbbVUsltzr64eLYIlN+HlSFNLojPzH4noLVegwpumj+ECMwFbEOYmBbpDz5b43OnZOT1
         4h5XHDFb8LqO+6YAi0+kGat9abmBGxDWaUT+hWInbEH+3luZTbUO3xK0iXTZ91vviQiX
         sHxkHaQHYfQlqHBLq5+Fzz+Lm+ZpiZ/kqIPBvLmPN4TMkIFYFT+lcL0Bgu3dAHiSZh2S
         sK8/tcT8wRwWu3cFkhhdN++B6PmeWFLRxAHc9rPmlHbJ/f3p2knVo1NOuKhiUXEDb1Aa
         Bjag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=A6iP0WzH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f2si13664173qtf.77.2021.10.05.09.22.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Oct 2021 09:22:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=A6iP0WzH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mXnCp-00059T-K1
	for alex.bennee@linaro.org; Tue, 05 Oct 2021 12:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmtP-0000y9-7W
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 12:02:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmtL-0005Ui-Bo
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 12:02:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OCIxQsk7jhQmV5lumZAqEAV5I0Q6nMdVi6zQWr5NyRs=;
 b=A6iP0WzHMVFW7gvv17Yig9BplGHLdS6mTDFyx4ePj7lELusDXe7czHkmW8i+b+JLylToMc
 q9CsiETkt6azcnzg8bHAmvfoErnJ6K79gRmkOpSpLlNsQjPBW2kXcVHR67fzTxrSBUIEE2
 0qHfW6JdMWuJvU/ZEhz4QmNY++6iAT0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-Xhik7dW_PXaJwIodgKL4xA-1; Tue, 05 Oct 2021 12:02:05 -0400
X-MC-Unique: Xhik7dW_PXaJwIodgKL4xA-1
Received: by mail-wr1-f72.google.com with SMTP id
 s18-20020adfbc12000000b00160b2d4d5ebso1459309wrg.7
 for <qemu-arm@nongnu.org>; Tue, 05 Oct 2021 09:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OCIxQsk7jhQmV5lumZAqEAV5I0Q6nMdVi6zQWr5NyRs=;
 b=EPDdGFzU+BylDAzv22a/5j7Fqb08C8c6SFxEXj1DD9BRCxO7qpQDQ0NFJf67ebh0FO
 IzO+sCZzf4aluPy6uh6a46j+GCaX8o9p16hrG2hlJOBhQJimQ8pgyKbEHdbwJZnFK7d6
 /YNZLnowoLXgJq/VmQaGkCuYoJhNTET0Mb3q8Ks19V8yURoL66zZXcy98tpzOnaeZaEE
 6jy4yxYeHU14P4fnFnGcsuB7e5lApxZR53Rm1xBFx3DhbVCAKdidWQrhl147+qSFDPdf
 YBFejcgOM/mnJshMFXA7YYXhqhrICpd0xvOSfFykrES1wqIzhsMNA1fQssV4T//FPyeM
 tPmw==
X-Gm-Message-State: AOAM532vzgiv6lNFrRLBvISRNU4bqpSU/aaFHTLRUuoZDmJ0XdiC5ef0
 LvGwisuQq5DCEkUd66nksRMR0u3aYR6eAXC/0trDotAkVdqkkNbOHyl1bCkMXm90rv+eiO6LvJE
 5a1OsT/CocEZr
X-Received: by 2002:adf:a4c7:: with SMTP id h7mr10063426wrb.57.1633449724232; 
 Tue, 05 Oct 2021 09:02:04 -0700 (PDT)
X-Received: by 2002:adf:a4c7:: with SMTP id h7mr10063402wrb.57.1633449724089; 
 Tue, 05 Oct 2021 09:02:04 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id t11sm17911151wrz.65.2021.10.05.09.02.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:02:03 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:01:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/57] acpi: acpi_build_hest: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Message-ID: <20211005155946.513818-22-mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Dongjiu Geng <gengdongjiu1@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WCyuDG59Kvaf

From: Igor Mammedov <imammedo@redhat.com>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Dongjiu Geng <gengdongjiu1@gmail.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210924122802.1455362-8-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/ghes.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index a749b84d62..45d9a809cc 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -362,18 +362,16 @@ static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
 void acpi_build_hest(GArray *table_data, BIOSLinker *linker,
                      const char *oem_id, const char *oem_table_id)
 {
-    uint64_t hest_start = table_data->len;
+    AcpiTable table = { .sig = "HEST", .rev = 1,
+                        .oem_id = oem_id, .oem_table_id = oem_table_id };
 
-    /* Hardware Error Source Table header*/
-    acpi_data_push(table_data, sizeof(AcpiTableHeader));
+    acpi_table_begin(&table, table_data);
 
     /* Error Source Count */
     build_append_int_noprefix(table_data, ACPI_GHES_ERROR_SOURCE_COUNT, 4);
-
     build_ghes_v2(table_data, ACPI_HEST_SRC_ID_SEA, linker);
 
-    build_header(linker, table_data, (void *)(table_data->data + hest_start),
-                 "HEST", table_data->len - hest_start, 1, oem_id, oem_table_id);
+    acpi_table_end(linker, &table);
 }
 
 void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
-- 
MST

