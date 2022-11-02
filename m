Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp316957ejx;
        Wed, 2 Nov 2022 09:21:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM56WjOeR4fb/wo/ENTuyCpW8miD9vSR+LLSCD+VxhL6nq6yFIe9P+ewkwvRAUK6Ww0OMz15
X-Received: by 2002:ad4:5dc6:0:b0:4bb:798f:5272 with SMTP id m6-20020ad45dc6000000b004bb798f5272mr21762129qvh.131.1667406078026;
        Wed, 02 Nov 2022 09:21:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667406078; cv=none;
        d=google.com; s=arc-20160816;
        b=P97d0izNQTCwbL/5dt67y08CDDz3sXTvir96jiYdZwI7xKe1eSv4+CX8Q5Xxh69saC
         FH5k7KZTV3Ic+5557YP17k8mH57NYvVcIjXQ7270bCXEpFb9sawidIFPSwvx5+Hn3yCO
         c2MxTvjU2uFhRDmhXyxAJktpS1sPw8hzKx38mYKht1fmFpZ9JIEK3nnzq0v2fBJu6rJy
         lbZsehZAxQixIW26OyZTu49S14BivJK2ohDTFfywO1Skg5VraXnPiBuce7f+Vu+sxgu/
         gz0SW2egS6vM7F1/jLra1XZYxc5952J+tJ9T9D8fz4ddBs1baygQVzlPebL39O30GXmd
         LJJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Oy2j3dzraHwJBqN04p66ThFiaUmnAcs5Y2XrHOxqe2M=;
        b=vQtx+lrFhXfEpaFR7sVEjPVdb72k76Xx+x84wrx7WrrBhFbd74ZRKNda3aA7pMTnRL
         J1RP0LTa3IPFpR+wNFyXjkz/50VXwIxe5P+SymjoYkxU+zkmO9Z7xwu1mJOdNNjUlUO+
         9lA+i4ppQDMpvdVjtGECiVA9YbhOyXujRopHppGzzPgFxtdBdQHmXVkBgXCOOl3/WV6E
         Lk/1frfgm9FmkQaqcWi3UcHIJKsAq8EdufePx4mzDWlpP4XrDBD5VVavG/D1VH2v3zK2
         dJdfMQ/9o3z4gKx6dJelrdsaQr627bTrn7ClnTEUh9Bdpd0KjcBe2HaoL5A1nZz+TBcz
         Fuhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="JIdy/KtY";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jo30-20020a056214501e00b004aaa72ac30fsi8292794qvb.2.2022.11.02.09.21.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Nov 2022 09:21:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="JIdy/KtY";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGM8-0005Hf-Ru; Wed, 02 Nov 2022 12:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGLY-0003Xx-0q
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:12:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGLV-00040S-1s
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:12:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Oy2j3dzraHwJBqN04p66ThFiaUmnAcs5Y2XrHOxqe2M=;
 b=JIdy/KtYPhVPFClwzBcBQE1oa11niJ7uIsFMkP5mGPi5FVgAxyLWWpUDFJUklqxJsjyR8a
 DYM+ES6iEjzx6Y2y5Pg89fJg9fFKKMpr1t/XXe5Uo0G/nG6rFKY9K+aTfCMaB0r/uipkC1
 WKZvBBSoNaXpGqyaOq7QZalLNq8udn0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-552-vMdBxRRyMiS706ZyCanDqg-1; Wed, 02 Nov 2022 12:12:03 -0400
X-MC-Unique: vMdBxRRyMiS706ZyCanDqg-1
Received: by mail-wr1-f69.google.com with SMTP id
 p7-20020adfba87000000b0022cc6f805b1so5066311wrg.21
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oy2j3dzraHwJBqN04p66ThFiaUmnAcs5Y2XrHOxqe2M=;
 b=ubPK0PuKFXgO7comq+RuqCeoTmVPElo6ZphvOGufvyUygH1E28UBDWpR9QW1b18bOI
 WhD0YgfHqOKVf9cnLQQ7YAkYvmT1l7bex3Jp82AB6BKhTvyIml7RzeQMLHGP9fXktGfA
 MWJUJEHAUjvrMy96xT7toi4vG4CZX62Jk/Rkav+EgClFMPJVkkSb6FDKkZ9UFC93clIZ
 GxYCN3v1IXUKgmslVnjh4bDAhfTGEyHL7uITdX04yLMId7jFccSyFUMJN99J7Ax7iYfw
 SZVTwZhl6/kej49l6zkVkcS1u605gIwgwGgX/IRi7+NtDHTIvHVp87sMieVfo94SNyLJ
 NtJw==
X-Gm-Message-State: ACrzQf0IWPQa4vsuEC2AhZhnrDZ/GtGDMWZbWttsneDykPdGSLUAsE/q
 bJode5tqacDnWCQf+IjktDtFYN9xo6Vn6L0Rn5w9IYxbvNZ1JbNptzh/ddc47ufZpit4KuikS9/
 6AmLElWZn2g4KPd7EjvD1TyGrHBjbXOALCGOR+cIr4+qcjNqzQogfXCMpGrkA
X-Received: by 2002:a05:600c:4307:b0:3cf:85fe:4d97 with SMTP id
 p7-20020a05600c430700b003cf85fe4d97mr2952301wme.89.1667405521744; 
 Wed, 02 Nov 2022 09:12:01 -0700 (PDT)
X-Received: by 2002:a05:600c:4307:b0:3cf:85fe:4d97 with SMTP id
 p7-20020a05600c430700b003cf85fe4d97mr2952267wme.89.1667405521521; 
 Wed, 02 Nov 2022 09:12:01 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 bi19-20020a05600c3d9300b003c6f3e5ba42sm2363998wmb.46.2022.11.02.09.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:12:01 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:11:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xiang Chen <chenxiang66@hisilicon.com>,
 Hesham Almatary <hesham.almatary@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Yicong Yang <yangyicong@hisilicon.com>, Ani Sinha <ani@anisinha.ca>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org
Subject: [PULL v2 75/82] hw/arm/virt: Enable HMAT on arm virt machine
Message-ID: <20221102160336.616599-76-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +9IQf2jlxSLp

From: Xiang Chen <chenxiang66@hisilicon.com>

Since the patchset ("Build ACPI Heterogeneous Memory Attribute Table (HMAT)"),
HMAT is supported, but only x86 is enabled. Enable HMAT on arm virt machine.

Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
Signed-off-by: Hesham Almatary <hesham.almatary@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20221027100037.251-7-hesham.almatary@huawei.com>
Tested-by: Yicong Yang <yangyicong@hisilicon.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt-acpi-build.c | 7 +++++++
 hw/arm/Kconfig           | 1 +
 2 files changed, 8 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index da9e41e72b..4156111d49 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -42,6 +42,7 @@
 #include "hw/acpi/memory_hotplug.h"
 #include "hw/acpi/generic_event_device.h"
 #include "hw/acpi/tpm.h"
+#include "hw/acpi/hmat.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
@@ -987,6 +988,12 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
             build_slit(tables_blob, tables->linker, ms, vms->oem_id,
                        vms->oem_table_id);
         }
+
+        if (ms->numa_state->hmat_enabled) {
+            acpi_add_table(table_offsets, tables_blob);
+            build_hmat(tables_blob, tables->linker, ms->numa_state,
+                       vms->oem_id, vms->oem_table_id);
+        }
     }
 
     if (ms->nvdimms_state->is_enabled) {
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 15fa79afd3..17fcde8e1c 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -30,6 +30,7 @@ config ARM_VIRT
     select ACPI_VIOT
     select VIRTIO_MEM_SUPPORTED
     select ACPI_CXL
+    select ACPI_HMAT
 
 config CHEETAH
     bool
-- 
MST

