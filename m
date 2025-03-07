Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp2405858njm;
        Fri, 7 Mar 2025 11:16:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXTC+cwS1A5fYdemApVaxHcqAiht+vyw+EHVynfJGsGu+nUXWwRFhKcqM2CCrceKURWz2mFIRWedVqf7A==@linaro.org
X-Google-Smtp-Source: AGHT+IFv9LDSM0mGZ1dxYrYMSpLcnudrs8t1wQmax9ZddppvrcjEsSg/SPyNpwXjvMI2+QxXWIUq
X-Received: by 2002:a05:6122:54b:b0:520:3e1c:500f with SMTP id 71dfb90a1353d-523e424c958mr3638425e0c.8.1741374998548;
        Fri, 07 Mar 2025 11:16:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741374998; cv=none;
        d=google.com; s=arc-20240605;
        b=cMtWdqpT0nHnNb5Dk0rct78VWuHTCrZ64vdtHOHHQgjV/2T8bjc9tWYXgVV6TtLY7Z
         D9rBw736anwuFocfjsvz0hBt6u7JNFcFsuHNMWAo3UbPkzpE4p902G+1GxJ4HMjdyAde
         1Q0kjhTIV5acUVqKZzYTxbn9llSwkmcBd6PKAi812H+8qFuQ5HKZBbrIGkYo4sNteo4N
         RojPiC0jFNzzOJXOjlBH4+xSCwoKr7Toel9X8MN0Vsouzknj3++j8q+ANFxIYl60jZG1
         BelN2Mc8O2C8S+RM9OaWJfQ/ZftWsvD9kltMWi5VaZsEiQZ3l4rkd3pH2E4lnBPOR8H8
         GF3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yKFCxpIKeMaHnN25xUYyu3ku/ITNkFeiNAkngEmoVF0=;
        fh=GCX+GKJnnvaVtdKGMdKtBufC7lBT4LFhHuptwlcQW0s=;
        b=KpLDjwzyJUd+sD/ZINOtD0y2EEshBEj6UIvhPvirVYwzPJUWnLxtxdVsLxPUq+xjlR
         ZwkO3ipWYDwviovbjsUL2JgJ+paF03oUne6UFAdfzZqg7z479F3C4CPgwj44gIqkG2mb
         PtzyR4+KhzFlB1dMXUIarp34LebfhJUBp0nWSUetTfFKxc5bLDLQgSjxHei9ireGB2nk
         Qud/YjCmVSRDnINCpCXRLScbJbUCYM9rchIK1CQL4GM80xU/a85HdaC1WBCog6kA2lt3
         MqFEC2WJez4E0f8CUIGLBvh4u9PdjmKbeU0qldydfPj9bwlymB2CjfBixaeS8YLRlMEs
         z/mw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=SwtCCb0R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-86d33cdb15bsi989134241.183.2025.03.07.11.16.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Mar 2025 11:16:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=SwtCCb0R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqdBT-00088F-2p; Fri, 07 Mar 2025 14:16:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tqdA9-00059j-8O; Fri, 07 Mar 2025 14:15:13 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tqdA3-00086l-DA; Fri, 07 Mar 2025 14:15:12 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2CAAB5C5EE2;
 Fri,  7 Mar 2025 19:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3C0BC4CEF9;
 Fri,  7 Mar 2025 19:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741374898;
 bh=J/oceRB+tMp1dlwMr5XDGzHWlOY6Ma1Afet+7GnEmTE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SwtCCb0Ro0LiZmwFPPWMIpptkzE64sp6hkpc96HCL6G3cRqYOyVR9bs9VqZ9+6drp
 KeNYivajAc+Z8+/yqeCeQNTjCjhyo55SUBVlAk+CGqjdcnqt4wM6R+GeU6yGFX9CQb
 mVRwAo/sQMJYk0tKNqB81qdgKQYi5A9gExf9dKQdEUNcp+i9pzl5F7MoQHPRKpjquZ
 KhSqwfgc47W4aHG3Mkqk8NANzlHvRTIoWkCFrGVjbWFBTQ+IYLJ2Rynkiu132Y4Fp3
 YsXADhey233FuKH5u3Ra+rJjzyNyMXRgmHZJyrYHL1ylH1vF06Mf1RBghvr1yEDYau
 NX4VmYdyYArMw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.1)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tqd9s-0000000BQnW-0WMr; Fri, 07 Mar 2025 20:14:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Gavin Shan" <gshan@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v8 19/20] docs: hest: add new "etc/acpi_table_hest_addr" and
 update workflow
Date: Fri,  7 Mar 2025 20:14:48 +0100
Message-ID: <1cceb0e97bdddf0eabb8da794fdaaea295faee41.1741374594.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1741374594.git.mchehab+huawei@kernel.org>
References: <cover.1741374594.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: HIfA8vnyBWFH

While the HEST layout didn't change, there are some internal
changes related to how offsets are calculated and how memory error
events are triggered.

Update specs to reflect such changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 docs/specs/acpi_hest_ghes.rst | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/docs/specs/acpi_hest_ghes.rst b/docs/specs/acpi_hest_ghes.rst
index c3e9f8d9a702..3d1b85d74b70 100644
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
+(11) kvm_arch_on_sigbus_vcpu() report RAS errors via a SEA notifications,
+     when a SIGBUS event is triggered.
-- 
2.48.1

