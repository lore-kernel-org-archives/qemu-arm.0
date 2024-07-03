Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp249884njb;
        Wed, 3 Jul 2024 15:49:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXNe93Jp8ln0aAzjRangs6oV+ZpAWIBLo1VttuwDV9QNcGjK+LkVNjhHgFzpWjJOWSKhzQk1Dsv2X14f8/5En7SyLKf5mMG
X-Google-Smtp-Source: AGHT+IFjDq2ITQofTWyfgwTapK8we6kpMg/2upBiutb3gBr1RQPObHUHFdGv3Ijh0XBhhpuv5J7C
X-Received: by 2002:ad4:4ee8:0:b0:6b5:eb34:6e72 with SMTP id 6a1803df08f44-6b5eb347099mr3674516d6.11.1720046997950;
        Wed, 03 Jul 2024 15:49:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720046997; cv=none;
        d=google.com; s=arc-20160816;
        b=vZ6fFnyMGuDfbuS/eqZ8pNF13WUoKcWLydaSY0ge8HwoV8qzpuBnvfYjtB+rLzCkq1
         Igk0Ek9sKnE+H0aqP4D3EYsYiXTxOWjvzCCQS6l7u4htWFfTn1gsJBc1qkLX0ieSs+b3
         ZxvaxONiVEUjve3WQES8o6BWviMfRGkXTUsiBG46iuSBKWbsvxW+/cWcfn8y7Cu4J62E
         br6i7iLLJ70R/H14s1YfAQ9WFY6A7XMdaqX6mtSIDJhjgy5wNcPuGGTsEsgQ3FxNJ+Wi
         GHeDGgsyiXopUpQvb6cjdFG0YXQ2Eek+xtgn5cYO7Ow4cXNxBT9LGCke+UHG8Knvf72S
         kT0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=SUxXXLDnAjmmN0Yi+4nhd+mhBCkrJEwNWiEK8gau7L4=;
        fh=rXj/gvUZIpks29k+f1oJjz5zI5tmFJAWSfysmFLw7CI=;
        b=X4FXj2/SppAHC9mawb8fWGuvaa5shbnxi6a+36LTsC6HeMfCcgPGAMk7JO7HA23g/G
         1/xLV5mbn46iLZwflp9i+rFCDdan5F9ZacQXX9dARuLDz2jBvcGeU/+n22XzgbtDnjZA
         QzIt6xOmk2tnrvn2qWdCj4jDe5QHbO/+5Nzo8OuWRNFKeaKt9e8A9JO+pLoXWQ3bUAer
         NtDSifedmsib5zWgOs93ZOuA4Wr3G4QP8YI4RZvgNK55dunbCYPQJpRm2B5LjlMOD5YA
         jFZCxtGtdpEJpOOdaU/T2MYmg3Kl2dsQHNsx3ilY59P4JRSG/QxY6nKWSnv0+3diTa+J
         inMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="gpk5y/x1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b59e36c367si136717096d6.132.2024.07.03.15.49.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2024 15:49:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="gpk5y/x1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sP8mb-0002jT-W3; Wed, 03 Jul 2024 18:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sP8ma-0002af-MR
 for qemu-arm@nongnu.org; Wed, 03 Jul 2024 18:49:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sP8mS-0005NP-Mb
 for qemu-arm@nongnu.org; Wed, 03 Jul 2024 18:48:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720046931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SUxXXLDnAjmmN0Yi+4nhd+mhBCkrJEwNWiEK8gau7L4=;
 b=gpk5y/x1WS5FHbVS/doZt6z/NSMLXt5NYl1IWFtDzrx0hTtP4yQgbUs03izzeDxhSB3jre
 XegnPUmFt3VzT0FdEnjFt/WJEZcCSykLaP8RwNomSP152Ui+rPdR3DFlcs35k3ZU3duomS
 EP6lLmP6tQzYbWSmfxwHCRwEOqdubQQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-AXKX6BuePiWGtyGCwCU9_w-1; Wed, 03 Jul 2024 18:48:50 -0400
X-MC-Unique: AXKX6BuePiWGtyGCwCU9_w-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-424a5a5f024so38478905e9.3
 for <qemu-arm@nongnu.org>; Wed, 03 Jul 2024 15:48:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720046929; x=1720651729;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SUxXXLDnAjmmN0Yi+4nhd+mhBCkrJEwNWiEK8gau7L4=;
 b=LnEyFUmg2GFYFCkbffDgZDW5nFZhwomj7yXc167ba6Es4JQZd2rgtQlrJu19EMhCDD
 cK8qISlAHgOxOcg535/MTFSTROQJnTgdkNYVrXdOHmLJZyaG6ekJwLOzmbxvhtzdiKes
 1vh2l+FINrjhd4HpVJJO5IO/hrXcPNSJnim0RbW3f1Jj+AHm4U3uPSeA+eZahOLj9+Lq
 VLVc0z+eeUaPl1iYbeoZ+34Ngud7p3Exsf2m/xgMySVxyWZM6JKZr8fHiE8ZYvrdhRcE
 rIxwyLdw4GLi5oMWalgZrFA6erHcpP3RgDX74PQGiuiqew+CNl2BwHIWWmuXJPqUoz2/
 wovg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUglhaYStyu7eljADsi1sYTe7JQ5gZOg4bn/vRe2VR3lf3+C+/KP5SYcMLiXOUFpOniIQd+aS7OTTUP21rBi3+8rY/m
X-Gm-Message-State: AOJu0YwvNsBHqbRK5TxKyYLdTXf+xsJ+4AKi28oLmVIY/KjC3aYQjCK0
 UTxRhZH4hzMIj/DZhO0nLMq8JjVGCyeakYfr+jwRuB2+OIGYX5VE7fBAk7Pm4BnOm/XB4F6tRdo
 hQCUU3t858wRcbfEEN/fsfS6P4uPN+jopTs2pnLGCsKtzQTkwqQ==
X-Received: by 2002:a05:600c:1584:b0:424:90f4:309e with SMTP id
 5b1f17b1804b1-4264a3d83famr341955e9.6.1720046929609; 
 Wed, 03 Jul 2024 15:48:49 -0700 (PDT)
X-Received: by 2002:a05:600c:1584:b0:424:90f4:309e with SMTP id
 5b1f17b1804b1-4264a3d83famr341895e9.6.1720046929043; 
 Wed, 03 Jul 2024 15:48:49 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:91a8:a47d:5a9:c02f:92f2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0cd623sm16964110f8f.16.2024.07.03.15.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 15:48:47 -0700 (PDT)
Date: Wed, 3 Jul 2024 18:48:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org
Subject: [PULL v3 57/85] hw/arm/virt-acpi-build: Drop local iort_node_offset
Message-ID: <e9fd827711ed47edfe8cf23036a56e5a83f2bfda.1720046570.git.mst@redhat.com>
References: <cover.1720046570.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1720046570.git.mst@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: pUJOi27H26yC

From: Nicolin Chen <nicolinc@nvidia.com>

Both the other two callers of build_iort_id_mapping() just directly pass
in the IORT_NODE_OFFSET macro. Keeping a "const uint32_t" local variable
storing the same value doesn't have any gain.

Simplify this by replacing the only place using this local variable with
the macro directly.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Message-Id: <20240619001708.926511-1-nicolinc@nvidia.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt-acpi-build.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index b2366f24f9..102e2da934 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -269,7 +269,6 @@ static void
 build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
     int i, nb_nodes, rc_mapping_count;
-    const uint32_t iort_node_offset = IORT_NODE_OFFSET;
     size_t node_size, smmu_offset = 0;
     AcpiIortIdMapping *idmap;
     uint32_t id = 0;
@@ -415,7 +414,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
             range = &g_array_index(its_idmaps, AcpiIortIdMapping, i);
             /* output IORT node is the ITS group node (the first node) */
             build_iort_id_mapping(table_data, range->input_base,
-                                  range->id_count, iort_node_offset);
+                                  range->id_count, IORT_NODE_OFFSET);
         }
     } else {
         /* output IORT node is the ITS group node (the first node) */
-- 
MST

