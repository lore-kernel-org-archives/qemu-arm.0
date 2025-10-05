Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97175CAC5BB
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Oct 2025 19:21:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v5UEe-0008BT-KS; Sun, 05 Oct 2025 15:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1v5UEP-0007y1-Ho
 for qemu-arm@nongnu.org; Sun, 05 Oct 2025 15:17:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1v5UEL-0006Tq-Uj
 for qemu-arm@nongnu.org; Sun, 05 Oct 2025 15:17:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759691833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WnDfxrNxACMbmdDqRpMpScz5AxDAbZ6usd6ALPkfGkQ=;
 b=fFEuK8KzTDlEKJHWUcYICVZVmA+LFUFMjEuJRWpwTs8+FwrOZr1OmCaqqMZsi1YnC0nIe5
 avRwjER8MloBUdKFCjTtIKJqtsBlF2r8s/yFv4S8F+sU64c1MbTRXIvQ6xuyS19mhiJqBn
 2tCjwTPTDJFIPexG8fpVezujR8IG22Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-Vi6OGEfrNJqC-DNHCBHwdQ-1; Sun, 05 Oct 2025 15:17:12 -0400
X-MC-Unique: Vi6OGEfrNJqC-DNHCBHwdQ-1
X-Mimecast-MFC-AGG-ID: Vi6OGEfrNJqC-DNHCBHwdQ_1759691831
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3f030846a41so2461278f8f.2
 for <qemu-arm@nongnu.org>; Sun, 05 Oct 2025 12:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759691831; x=1760296631;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WnDfxrNxACMbmdDqRpMpScz5AxDAbZ6usd6ALPkfGkQ=;
 b=pf2XMF9tp5yW5sK6OGbd10poNxOyL4z6p0h7ehMcOXxqk+JB8wukVyS7cw+Q6yM81W
 qi+xWW9eUAxkLhy8TmR0h+bC9BFt4TM7IKGDrpMyTsMHyczNSyu1yTdc148fGSc+cA7l
 C4nsEJoQZ3VnExt1rSWse/qyG3S2olo+wKpswfU2gli2ETiiV0CT9TdDmPAlLbXWiK0Q
 xQwN7qJC1tbAq5U1myVCr9dUh2Fep6JEpXPugigZQI2gIB0fOUnwNl06tIQA7LDMyEu4
 bswNiWqo9ZjFErwR/QByJ+1EAk+vK0B3JG0oeFXdXEvFsplh5PNRPiIuOlZiJHoXrb1X
 piew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvJuzC4qucV8cfunh/WkReJBNUimSyuzwirJTG3WYaJ/fEZPn9DcJx12lUpyREyYQYgyHCe8BsuQ==@nongnu.org
X-Gm-Message-State: AOJu0Yyn+mx0ZZpZ4aK0glw9uVXGmc3W+Mgr5W9U8kscoOREdPY1Dk0i
 p+CVa/xg0mrLPkmEfA0cQZaRfJSOatGSZuqaGdqUDWJsjRksccOBuQPlv32gjOubgDSKZwLaVjg
 fi4UawKsYLxbFIc3tVo54He+0DyC1H9KOiODBd81q86DfMs7nWKIdzQ==
X-Gm-Gg: ASbGncs9GhOkip4IBFhNawDn/gVf5+GrGBLFsKnsaodwVxKFd0A6bekGs8dy0J7jKcD
 +uDyt+Kz+JPivtc85SYO4Gh+d1y7iW+gpcGKmmhE6r7SSlztV3aAPAxgQ9FIbEWvKo2GP0mA4Nm
 jgSN7AHem1XYyoLHdzLYUrTWu8wT6iVxJzrDqhth8joZylPT4fIrjRGHihAqXuAPwYWcXuVkZkN
 H739RUdnjqyAd6z5hr8z/ND8Bu0Txe7eQWtNP0VRI0YRNXckoZxQ5JNYYZIEJKNDJuLHbvR9USL
 v7KycrdZK7825jnfh5KEJwL1js/nbO9Ai9t5I48=
X-Received: by 2002:a05:600d:420d:b0:45b:47e1:ef6d with SMTP id
 5b1f17b1804b1-46e71172104mr65548695e9.36.1759691830774; 
 Sun, 05 Oct 2025 12:17:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9KHgQKdExKVBqM1EG7cJqjJT/Waixo/3fiECA9mcAeyF3g2gDVdnVPPHr8FrKC3uk1qB7Lw==
X-Received: by 2002:a05:600d:420d:b0:45b:47e1:ef6d with SMTP id
 5b1f17b1804b1-46e71172104mr65548595e9.36.1759691830274; 
 Sun, 05 Oct 2025 12:17:10 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1518:6900:b69a:73e1:9698:9cd3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e723432c9sm124149855e9.1.2025.10.05.12.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Oct 2025 12:17:09 -0700 (PDT)
Date: Sun, 5 Oct 2025 15:17:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, qemu-arm@nongnu.org
Subject: [PULL 30/75] docs: hest: add new "etc/acpi_table_hest_addr" and
 update workflow
Message-ID: <92aad3fc4a0f511819a18a443797069aff77b9ba.1759691708.git.mst@redhat.com>
References: <cover.1759691708.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1759691708.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qcU8JLF1cwLFqrIJjQuKYls2H46Mg6jESTxJ0EntyiA_1759691831
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.43,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

While the HEST layout didn't change, there are some internal
changes related to how offsets are calculated and how memory error
events are triggered.

Update specs to reflect such changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-ID: <e3e8bd92ce40d997c67ac1d4d973c0041b8f59fc.1758610789.git.mchehab+huawei@kernel.org>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 docs/specs/acpi_hest_ghes.rst | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/docs/specs/acpi_hest_ghes.rst b/docs/specs/acpi_hest_ghes.rst
index c3e9f8d9a7..aaf7b1ad11 100644
--- a/docs/specs/acpi_hest_ghes.rst
+++ b/docs/specs/acpi_hest_ghes.rst
@@ -89,12 +89,21 @@ Design Details
     addresses in the "error_block_address" fields with a pointer to the
     respective "Error Status Data Block" in the "etc/hardware_errors" blob.
 
-(8) QEMU defines a third and write-only fw_cfg blob which is called
-    "etc/hardware_errors_addr". Through that blob, the firmware can send back
-    the guest-side allocation addresses to QEMU. The "etc/hardware_errors_addr"
-    blob contains a 8-byte entry. QEMU generates a single WRITE_POINTER command
-    for the firmware. The firmware will write back the start address of
-    "etc/hardware_errors" blob to the fw_cfg file "etc/hardware_errors_addr".
+(8) QEMU defines a third and write-only fw_cfg blob to store the location
+    where the error block offsets, read ack registers and CPER records are
+    stored.
+
+    Up to QEMU 9.2, the location was at "etc/hardware_errors_addr", and
+    contains a GPA for the beginning of "etc/hardware_errors".
+
+    Newer versions place the location at "etc/acpi_table_hest_addr",
+    pointing to the GPA of the HEST table.
+
+    Using above mentioned 'fw_cfg' files, the firmware can send back the
+    guest-side allocation addresses to QEMU. They contain a 8-byte entry.
+    QEMU generates a single WRITE_POINTER command for the firmware. The
+    firmware will write back the start address of either "etc/hardware_errors"
+    or HEST table at the corresponding fw_cfg file.
 
 (9) When QEMU gets a SIGBUS from the kernel, QEMU writes CPER into corresponding
     "Error Status Data Block", guest memory, and then injects platform specific
@@ -105,8 +114,5 @@ Design Details
      kernel, on receiving notification, guest APEI driver could read the CPER error
      and take appropriate action.
 
-(11) kvm_arch_on_sigbus_vcpu() uses source_id as index in "etc/hardware_errors" to
-     find out "Error Status Data Block" entry corresponding to error source. So supported
-     source_id values should be assigned here and not be changed afterwards to make sure
-     that guest will write error into expected "Error Status Data Block" even if guest was
-     migrated to a newer QEMU.
+(11) kvm_arch_on_sigbus_vcpu() reports RAS errors via a SEA notifications,
+     when a SIGBUS event is triggered.
-- 
MST


