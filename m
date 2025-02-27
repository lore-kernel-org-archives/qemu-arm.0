Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp324380njb;
        Thu, 27 Feb 2025 08:03:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVtdiQJr54b0c1AM8FjQ0iFtBmalDbs44XirWwDsjkEEVfLxAbHE9tYOKMfhFj5fzQKxxMBSO+OO4qD1g==@linaro.org
X-Google-Smtp-Source: AGHT+IGqALB5ccsCKdxd8MVL7llS2s8nTlmYr88Da62gj1KCazohcHGNBZ0VFeeNFReCTJOwU/re
X-Received: by 2002:a05:620a:24c4:b0:7c0:b185:a952 with SMTP id af79cd13be357-7c0ceee6234mr3177490085a.2.1740672188531;
        Thu, 27 Feb 2025 08:03:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740672188; cv=none;
        d=google.com; s=arc-20240605;
        b=b7x/vaHuD4+JkyKP8uRRaunEWxLwVXAUmn8sA94KwlifAJekOj2XCPAWaYsTqALTrd
         MZBPACcQ0PlClyUmJbU8oz1gX9KaMjsCmXA9gF8WAP4qql3KEDXRyakxZB39x+dc2LhC
         T0LvivZkEErCJSCIw+n3eeZ+ltlpYxqV1N5LKa2MCnWQC5VYRM/6WevCrDEQjBJfKcR6
         Egx2rTg9RvsCj8ZEEL5TEBcoY2YuVpx2GIg8p51UFtdLF5+r+ihWfiS6S4TU8hyn/stC
         g9xeslyXEbVhrpT8iKogzIEvED3sBlEmIcPqvmqFWLY7LAhm5T5XZpj6dgTk+VepaGbn
         3DQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sMLu4AUsJgKwUuY+74zcuobRNgDOH49lkeD+ovyQYFg=;
        fh=XcviKWAv15CvAgnyQyizsjZv6212yvUpVNhmcTByU9E=;
        b=C4c7rbdTSqPpKjH51wDLR+WoJrCiNfPZ2VlG9LlNNNgJTiBY6oXLS91WepKnKqyTbA
         oxLc7ozXJ9Wu+KOjGS/6sYr/6pWyaOB54uHZEdrcZ3xHKqKrrHdy9gMZ4AD99SON3RLZ
         j0mV6cChdutIUl+nObRiwRtDNBoNK9kG2VUD+/cdDCSxFv79c/dd4yKBv4+4UypwrWe+
         l600xTTmNDZ+1rGnW5tRo/M8mnxCZp9dCQfVewCyT4SjysHR74D5SwmWUbi/Og7d3MzW
         trBWl0Ar8wTeJVi0zJ/DKk64W28nWauvMX2TnrrrhFFPw+KXP67tWjgYP2spd4uG8fPA
         TgTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Ey7RwX5u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c36fee9675si140496285a.48.2025.02.27.08.03.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 08:03:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Ey7RwX5u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tngKI-0007Jk-N5; Thu, 27 Feb 2025 11:01:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tngK2-00073i-I5; Thu, 27 Feb 2025 11:01:14 -0500
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tngJy-0007Ig-51; Thu, 27 Feb 2025 11:01:14 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 35DDA61F43;
 Thu, 27 Feb 2025 16:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 149A3C113D0;
 Thu, 27 Feb 2025 16:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740672063;
 bh=bxK9Et1UjLido8TcaM0YtPM1EGz6KNWSFKPtGUAIaGc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ey7RwX5uYigzJuDdeBDBXHhjx2+oD7DhU0XnlvLVuXcnICl2v+ztVZqLXR0B9s3Mr
 NF9yngAHJ4OdGd8+YuC/OeU/3O8uuZxMNlDwvOUJdmSbiKeQbgMsry2iyZwMxKOUnJ
 yQGdeoQ/FYCbQvC3A8LdNHpkBWaohJw2d87ZBgmQi7Rywx47jWqekQHVI3KYJHZ9Zc
 W1Hbrr+lbJR9G1AKOS8r4NSHoc89q0+Y7LcApvdfHAC0uVhDGMxqYuW33cJ9SxVyqU
 Daox1uiMXivZBZXgRkaqzV63xALQPHyMs6yksUKyAIYgbH+fu3pq13GAGJdWymCITP
 4RBeR2DfVs1Qw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tngJp-000000023bt-0vId; Thu, 27 Feb 2025 17:01:01 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v6 18/19] docs: hest: add new "etc/acpi_table_hest_addr" and
 update workflow
Date: Thu, 27 Feb 2025 17:00:56 +0100
Message-ID: <445f7d41b01ffc5bd79d6fd83bc7c4c621bcbc85.1740671863.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740671863.git.mchehab+huawei@kernel.org>
References: <cover.1740671863.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2600:3c04::f03c:95ff:fe5e:7468;
 envelope-from=mchehab+huawei@kernel.org; helo=tor.source.kernel.org
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
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
X-TUID: PyYj/JCtz6rF

While the HEST layout didn't change, there are some internal
changes related to how offsets are calculated and how memory error
events are triggered.

Update specs to reflect such changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 docs/specs/acpi_hest_ghes.rst | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/docs/specs/acpi_hest_ghes.rst b/docs/specs/acpi_hest_ghes.rst
index c3e9f8d9a702..4311a9536b21 100644
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
+    Through that such GPA values, the firmware can send back the guest-side
+    allocation addresses to QEMU. They contain a 8-byte entry. QEMU generates
+    a single WRITE_POINTER command for the firmware. The firmware will write
+    back the start address of either "etc/hardware_errors" or HEST table at
+    the corresponding fw_cfg file.
 
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
+(11) kvm_arch_on_sigbus_vcpu() report RAS errors via a SEA notifications,
+     when a SIGBUS event is triggered.
-- 
2.48.1

