Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp1960305njb;
        Sun, 2 Mar 2025 00:22:27 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVVBKtpB1ITRD7AIGinEskC/EEpNtAOGYgRwqStaxsH9+zo41YTYqApt0c9C5ac2qSRcJPFvryy32+BAg==@linaro.org
X-Google-Smtp-Source: AGHT+IGqouMwBQeYNO7jKO9+At8dkmvbQqzKFAG1oDHI8kaXl4JhUU4ImJm6QdJE60s0UNUGdhpB
X-Received: by 2002:a05:6a00:a16:b0:728:e2cc:bfd6 with SMTP id d2e1a72fcca58-734ac41a22emr14520154b3a.18.1740903746714;
        Sun, 02 Mar 2025 00:22:26 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740903746; cv=pass;
        d=google.com; s=arc-20240605;
        b=JZTzoHfu1T4yfqkuln531pYk9JFso6dMIVfZV9nGauc/n9W1JLvhieBN9SVuWnN/1m
         bzn8A90VatEP227w7NVs7rFZHuL1F7tFQiJwFDqaVJR4VP4EZ5tEaE4E+1mJAL8xn/IL
         3uPbHOjisylBqVPGb37NCOHMo4kxRSx4AuMj/I5Vu9jJ0eWtcH4DwWeNONQg2xzD3gXH
         aapn3PMfx657e0Do2oUh4lWKUi2P8PntGzs/z8BRHNkzu3ZBk8f5wG9zx0cGXOp1aDmC
         NC1KNABHUFfgWCoZDAPQk3jH002KCm/4C2bwmrqGPZx1u2X7oYG3L29tuXgzgVjRm4Lt
         EhGg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=yKFCxpIKeMaHnN25xUYyu3ku/ITNkFeiNAkngEmoVF0=;
        fh=XcviKWAv15CvAgnyQyizsjZv6212yvUpVNhmcTByU9E=;
        b=HxPFApNUC6aQMrgbTdlsvtjr+h2L9c9Srh29Enzkt8ldeUvuzugBAhToBHVqfvTBFf
         oZpvLA+waYxQBBdxl/6f2zZbmnbb9a9kvlKhoyUNV/XizpfrUcwYk7+BYwrsmZkr7vKW
         QJPNzaNNjtBWn/mgqovJGjlZ55IyU9o0bb8wzg6QG37T1tZkb+J3YgXiyOG8xrcHk+u4
         rx+Q+kJdKHLqMfIOr9QwfyJNbBAoze420ziG/uu/k6kRC+As7zumy1HI2l5Zh6DUOyyU
         ewLq2TGBk7yYGBnankOBnIZXrj7sJCcPerEuJJXIz13a9Bu3lUrXT5JQxt/nrSi0ET1U
         1M5g==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=jemOMNJ0;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-540429-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-540429-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-540429-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 41be03b00d2f7-aee7dec9b11si11048499a12.485.2025.03.02.00.22.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 00:22:26 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-540429-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=jemOMNJ0;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-540429-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-540429-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A6553B4D79
	for <alex.bennee@linaro.org>; Sun,  2 Mar 2025 08:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6DA1D86DC;
	Sun,  2 Mar 2025 08:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jemOMNJ0"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E3F1B424F
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 08:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740903737; cv=none; b=rpON5ZirAM0zQUreZ+YeknQ+5rXdmKIPJoD092m0VYxxg8ehaov9AvEO8uiMMnOzFy51TRkc94aOCzUSwVtHDROhwsHq1Vy97n5tNknACR22rIDafLxQLsceenvYdVAMKEtsR66iHlr1kLQH5ijL5UNMYPxqhQb3a6XTeuzdTUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740903737; c=relaxed/simple;
	bh=J/oceRB+tMp1dlwMr5XDGzHWlOY6Ma1Afet+7GnEmTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qnLTEq6E0+oOc5eUf0tQ8zwU0kaN5KeciZdWwW5SSBJFIONhKvONU/m9xzJ2MLDeK//wXAfyd86VTfzwlc6QHZXELi6DA60oghsSixtlHl2hZ+BdxWTucKthyB2oOg2QYUNXNV/t1CLPeFZWedwHXHiExhCYnP41zP/ZdEJDtxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jemOMNJ0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A54C4CEE5;
	Sun,  2 Mar 2025 08:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740903737;
	bh=J/oceRB+tMp1dlwMr5XDGzHWlOY6Ma1Afet+7GnEmTE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jemOMNJ0sdMYkrmDAGdHlOsQXBPs+xpwwJpuqmCYVvdI5oGpqD3C4guBhoxUxg6/I
	 pxVAMYbyoHQKZqyqytzF1WdOyPKkJHrxJdxzFjv4Q+4yILOuk0i+nlV4DJOA5beqpQ
	 HmsG4rmKwUYJlUx3NUf0vbRGlEXcg+SML0YRHf4K4W7sqlUMsDCyCvfachi7vwpZKb
	 8nh6TZdOgnaFHCxXSiFFJ3WR6pwnauS5se/MwHxt0C49w6kKeR1YM9V+RS85QM+YBO
	 yo2vB/B8wUxZQaGCuMpsngMmW8+TpXN2GEon3+2M/fasMhEwHKlJ/zewlJ2F6q5X17
	 46ULWBFAUt2MA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1toeaU-000000043Sg-40PD;
	Sun, 02 Mar 2025 09:22:14 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 18/19] docs: hest: add new "etc/acpi_table_hest_addr" and update workflow
Date: Sun,  2 Mar 2025 09:22:05 +0100
Message-ID: <01c7709b139038dd2845f4f3904bf9d7075e4292.1740903110.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740903110.git.mchehab+huawei@kernel.org>
References: <cover.1740903110.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: VFlsvDLAex93

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

