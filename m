Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp2190566njm;
        Tue, 2 Jul 2024 13:30:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV7+tQ83lED12lti2CocFF/jp8PWXjy39mWMj8wS7t5tT/kh3VubK6E1ktYfdWI5C23NTMBuVkAoJZGOEaPJlkOQWpXGAFD
X-Google-Smtp-Source: AGHT+IHlHRGKhC8QwFBCasM3CZbDorREKpNvCusmQjFexg3k/8IiobdkzKko9zAPendUJmOKAYtr
X-Received: by 2002:a05:620a:612f:b0:795:5b8b:7a03 with SMTP id af79cd13be357-79d7b7785dcmr1363628785a.16.1719952201066;
        Tue, 02 Jul 2024 13:30:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719952201; cv=none;
        d=google.com; s=arc-20160816;
        b=sZZFp9FJdbWLBudFmbBS6zr+C2W5vkiA0f0sd8mqQHiSmfvPDE0nFSZMInNffqQGad
         xd2F6dSzq8pTGH0rmrln9Yj+WiJnyhusjq+WMOeTUCDvVaMrvYd/vqU64X55gkfvaY+Z
         XVXbIn3eKVgwW1Ubrdeb2X0EBcxiIzuYlWhINwwT8JVVVgvwaonJ4xHACeMeVxtcrjXV
         DXf0AOgYgVUswQ2zLN9sCN+teoyMotCgC8gQTrekskDUfjZVUfgM+v8oCvUjrarXj4Uk
         26Kr/e73eOkscp8vUeb7cTqMMHkc7BPfQMWfHlbecA4UinMspBD2EbFwtAIacMn362gw
         s3Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=FXwifnBJIBh3zju1O5LT6q/8nalot/g3k4ePiwaH62E=;
        fh=Y5dbGDUGWwHC0UAca00IEDETkgooVBtZU4UdPAK9DKQ=;
        b=yo/IMRBf9MBbIvbZYTbtHd33foD66YMkeht53rVYWa8LrhYpx3lliwRhY9kX3fi9MO
         bmP7jSh8w7PfmmNv65GxM83zae4GNws9Uf4nn9VtzAAD0oRaNPiRsa5CQP+2eGjMOtoj
         svf7ox/NXKVZd9WEMZziRswszz77ZJCm1qoujgZkyermhE392GdlBHwy4QTgxkwn/rLN
         CqksFSGU3v+ZVCwrMkqqE6fDOX/Ll6VWaDVv1S5+KDwKSrYcmHm+LSntmOqXk6mRmbpY
         KQZ8k6blz97V07aDWPdQbUAhfJ03/2wqd+jqxBNFBsPSymxdDr5xD4YEBPKtJiRxKRSZ
         9hhg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ZRhmHm/0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d692614a6si1060160085a.149.2024.07.02.13.30.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2024 13:30:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ZRhmHm/0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOjyP-00014A-5x; Tue, 02 Jul 2024 16:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sOjyN-0000ya-Rf
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 16:19:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sOjyL-0001G5-W1
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 16:19:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719951569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FXwifnBJIBh3zju1O5LT6q/8nalot/g3k4ePiwaH62E=;
 b=ZRhmHm/00dKHFxJBFBp0xnRXSF1tqVOSyDZVUiRxp1jjtKsbTzm9d/Yc5MQPDrMjPX61l9
 vJDjreyzd3AZXi8ALKh5R35EAkT+EBJE2EZNbSnhd56XmrnF+VvwycsY/KgyE6N5XuiOIk
 eReJQEPD+ov0x4VUFn7DGSFTt1msfIk=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-_OML8g0OPtWO7uc-wgpfyA-1; Tue, 02 Jul 2024 16:19:26 -0400
X-MC-Unique: _OML8g0OPtWO7uc-wgpfyA-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-52ce04ea31cso4984890e87.0
 for <qemu-arm@nongnu.org>; Tue, 02 Jul 2024 13:19:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719951565; x=1720556365;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FXwifnBJIBh3zju1O5LT6q/8nalot/g3k4ePiwaH62E=;
 b=B/XlsVI9n+vezwM8AMZ7D8Qcl5BjKXPhVCvwZMissVi3tS/L6gQDZPb96uEQ5EGHOE
 LztLkUbR2X9rb0bJFsdp/KiVeuHJ6x2TP2DCC1vSxp3+M/TY/DznpBRe33f6mTKJJkqW
 VxvxVTT3z3+xHahnV69AA37iE1ZbwvSZZYSdja/XX5tVSBlsffv3WLPYRt/aUnu3TSex
 TcREmRn1f67h2GzUHSCkeojXtXRvqG+K6s0D/9MOZWIkHeuAMvyKdrCutcnw9a/0EPNm
 1jydc4am5ZE21+8BNdwMEIwvrlk5p0J7Yq+f9/jO9d51CVBg2pLAVtm6mxdPSVEbb5o/
 32UA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAYzLJaXcqRyxwX739gL9sQtL/FzM7OTkBKTk/BeqJcPPLJa9ycwelsyjMusnNZiheEmZlbTBROwUQCyjRmAYSmU5r
X-Gm-Message-State: AOJu0Ywv1rVbat+WmNZvwSlz4QIrMVK0S2jTTDx/ala7QO3oeikEdryX
 7iBG4Im2h3iLrqMuLBe/t4SFbc33vvjy40mf0KRstiUFh7G2oajyEpXoujz+hh7HerRPJwCefEI
 hBZQ9UckjjsEgqKbRI+odc25bx67QX99qMD9PlPkW6a7WTKiUhg==
X-Received: by 2002:a05:6512:110e:b0:52b:839c:78dc with SMTP id
 2adb3069b0e04-52e82687e37mr7654784e87.29.1719951564758; 
 Tue, 02 Jul 2024 13:19:24 -0700 (PDT)
X-Received: by 2002:a05:6512:110e:b0:52b:839c:78dc with SMTP id
 2adb3069b0e04-52e82687e37mr7654763e87.29.1719951563926; 
 Tue, 02 Jul 2024 13:19:23 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f5:eadd:8c31:db01:9d01:7604])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42578800bf1sm102892125e9.1.2024.07.02.13.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 13:19:22 -0700 (PDT)
Date: Tue, 2 Jul 2024 16:19:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Nicolin Chen <nicolinc@nvidia.com>, Eric Auger <eric.auger@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org
Subject: [PULL v2 62/88] hw/arm/virt-acpi-build: Fix id_count in
 build_iort_id_mapping
Message-ID: <4e517c43d2d6bf8f261b7e2b263209a7f924ac5f.1719951168.git.mst@redhat.com>
References: <cover.1719951168.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1719951168.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: p8iRHH/O34RE

From: Nicolin Chen <nicolinc@nvidia.com>

It's observed that Linux kernel booting with the VM reports a "conflicting
mapping for input ID" FW_BUG.

The IORT doc defines "Number of IDs" to be "the number of IDs in the range
minus one", while virt-acpi-build.c simply stores the number of IDs in the
id_count without the "minus one". Meanwhile, some of the callers pass in a
0xFFFF following the spec. So, this is a mismatch between the function and
its callers.

Fix build_iort_id_mapping() by internally subtracting one from the pass-in
@id_count. Accordingly make sure that all existing callers pass in a value
without the "minus one", i.e. change all 0xFFFFs to 0x10000s.

Also, add a few lines of comments to highlight this change along with the
referencing document for this build_iort_id_mapping().

Fixes: 42e0f050e3a5 ("hw/arm/virt-acpi-build: Add IORT support to bypass SMMUv3")
Suggested-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Message-Id: <20240619201243.936819-1-nicolinc@nvidia.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt-acpi-build.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 102e2da934..e10cad86dd 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -209,12 +209,19 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
 #define ROOT_COMPLEX_ENTRY_SIZE 36
 #define IORT_NODE_OFFSET 48
 
+/*
+ * Append an ID mapping entry as described by "Table 4 ID mapping format" in
+ * "IO Remapping Table System Software on ARM Platforms", Chapter 3.
+ * Document number: ARM DEN 0049E.f, Apr 2024
+ *
+ * Note that @id_count gets internally subtracted by one, following the spec.
+ */
 static void build_iort_id_mapping(GArray *table_data, uint32_t input_base,
                                   uint32_t id_count, uint32_t out_ref)
 {
-    /* Table 4 ID mapping format */
     build_append_int_noprefix(table_data, input_base, 4); /* Input base */
-    build_append_int_noprefix(table_data, id_count, 4); /* Number of IDs */
+    /* Number of IDs - The number of IDs in the range minus one */
+    build_append_int_noprefix(table_data, id_count - 1, 4);
     build_append_int_noprefix(table_data, input_base, 4); /* Output base */
     build_append_int_noprefix(table_data, out_ref, 4); /* Output Reference */
     /* Flags */
@@ -305,8 +312,8 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         }
 
         /* Append the last RC -> ITS ID mapping */
-        if (next_range.input_base < 0xFFFF) {
-            next_range.id_count = 0xFFFF - next_range.input_base;
+        if (next_range.input_base < 0x10000) {
+            next_range.id_count = 0x10000 - next_range.input_base;
             g_array_append_val(its_idmaps, next_range);
         }
 
@@ -365,7 +372,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         build_append_int_noprefix(table_data, 0, 4);
 
         /* output IORT node is the ITS group node (the first node) */
-        build_iort_id_mapping(table_data, 0, 0xFFFF, IORT_NODE_OFFSET);
+        build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
     }
 
     /* Table 17 Root Complex Node */
@@ -418,7 +425,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         }
     } else {
         /* output IORT node is the ITS group node (the first node) */
-        build_iort_id_mapping(table_data, 0, 0xFFFF, IORT_NODE_OFFSET);
+        build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
     }
 
     acpi_table_end(linker, &table);
-- 
MST

