Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp304448njc;
        Mon, 19 May 2025 23:43:18 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXWlO+3csS3YKPfeaitCm4l6NiZw1TfYFsqWaNGgD2W69iSo/y11own/1D5cqlk+Nv6jW0HYjkXVdkmNA==@linaro.org
X-Google-Smtp-Source: AGHT+IEtP8d9lzK6DnJ1wusqDLhnPSsPSbDX1uKGBTI4rFZO4vz4Ha+z4LrQWOB2oaB6Dmuj3Qv8
X-Received: by 2002:a05:6214:494:b0:6e8:f4e2:26e1 with SMTP id 6a1803df08f44-6f8b087f5d2mr237661206d6.20.1747723398459;
        Mon, 19 May 2025 23:43:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1747723398; cv=pass;
        d=google.com; s=arc-20240605;
        b=LlJN3kAZs31jP2ycZBoBR5rW6d+2gPfEnPI5FMDlzU/OYtdh4y96DeUmpk6BmIVypJ
         JmeXk2wuWGWYcgpEeTpPWZbJ3wMQI1/aW5rH7YgcvKamcS7uc2sLvYK+bT30whEZ/irl
         0z1dQ9kA4CWZCeYcKbakrSBViojzUy4ANZoglfnNki6agCZoW5nKg0wzAGiyac+hV7KL
         AMUWpu+OH7iCFJxEQq9ezj2ppPM8GOy59iRz5m/rZvS+Ldd+F8CUrejp0MNuCjmCYqRg
         YGAqcOTywfrnIPsoYjf4vX4KqUhQaCif03pCbxac840nU0EWvMztMeYzBZHp/wvjHZ9Y
         Zr7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=Wjx0S+7+WcdiY2P+TkhYYhNZtZuapG6iHnd83FqfLqQ=;
        fh=XcviKWAv15CvAgnyQyizsjZv6212yvUpVNhmcTByU9E=;
        b=S52gpRIJI7QzW4qSrz2LLJY9KgXtnRUyPGgykoVp8M2VO6f4SW/LoxZ7WE6JRtmI2q
         9jmnFzVVhaN2etGwMhT82XBHMlCZh6IJEeeZbhpH0mZezCAHUx8admeW9TmCJkXxY5Ph
         nCEQcdHRSrYiZmYypC/SwUx135vtwK6cwOiZOCt125Mk/F303ZLX6S7kwIAopd6bllTn
         lONgNtYQ9ZNqQ2dqjJPQgCMCPJV+AllZocV+VK+Ccw/0PEXMSsIsotmcVcWKjcw5ML77
         fEevCyy1yvTyB+QG2L9ybuRzJ4oRSHdrgam5hIMsqNzLe5FjXlGsxhlVa2IHjKKE8w9x
         Ug/A==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=NaiqgnuF;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-655014-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-655014-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-655014-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f8b0997258si100027286d6.267.2025.05.19.23.43.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 23:43:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-655014-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=NaiqgnuF;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-655014-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-655014-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53ED717EE72
	for <alex.bennee@linaro.org>; Tue, 20 May 2025 06:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2CEB25EFAE;
	Tue, 20 May 2025 06:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NaiqgnuF"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7882D25D1F4
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747723316; cv=none; b=HHgID8sItI4Ai56nNm5UdL7pyvhhNRa2CvF3nP6T4TCdXTzaZfcoceCHtg6tiGvz0wvBfrSdeMgCk5v8QOJE4uWUGzat3nhwAb+mOwXAvgAVyJOgex8dHNb6vYDejbOunLEe74Sw8K/NIZ6OaDG2IcEgEO7JIPAJNx6ePFlyndY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747723316; c=relaxed/simple;
	bh=U1Hyh++FbbQjcYY3cPFX1njwwCp4wpvVjBJyLtaysnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mv6/8yUKRYu9b9rNhMoIFYoQrKpWQxn4wKNtFdzBKc98Kvsqj7THbcBDL7f3QX6mAITtJph6WBm3yrf2c/YETRQCEvSdwvOuM3nhRat9A3q+JguCnZNlyKsRt+CjC4wCK9w3xGUDWHD+HF9MoOvxu8upkUqgWpAPFmkcm+xGNww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NaiqgnuF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B40C4CEF9;
	Tue, 20 May 2025 06:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747723316;
	bh=U1Hyh++FbbQjcYY3cPFX1njwwCp4wpvVjBJyLtaysnA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NaiqgnuF7EVtx3XYo4baUObbsrvrxP2SK+vzcx3LuzBLItA3x8c9i7ypkRGoFwFaQ
	 VEO9QttakkvrYLBWCUKfwhfrSZazMvXEK0xV3GXg0a1ywExDR4sxuwuCNuCwsDVi0L
	 Z47Xx2FSnNf72Ta3pOaRPIUiKdKPXuzyfN0M41RWsDEnIWleRkoBrIlYJ4WFUw6+HW
	 ziQlNLbrjbTcFqD3CI9PMp6I/r+tRHCNgyacqVV6Jjhfb5aJGX7sIMFaGtVls+KTfU
	 L/2YHjeymJtKAJtEo1BL1gxoT2Z6NmWsVl5mFVXDkaIHsq1kZy2qWYcDULCvxMXnfZ
	 2Iooa4lDCiATA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uHGfi-00000005quC-0iPR;
	Tue, 20 May 2025 08:41:54 +0200
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
Subject: [PATCH v9 19/20] docs: hest: add new "etc/acpi_table_hest_addr" and update workflow
Date: Tue, 20 May 2025 08:41:38 +0200
Message-ID: <030d9db1b72fa639493ff879991cfdfdbbb53b95.1747722973.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747722973.git.mchehab+huawei@kernel.org>
References: <cover.1747722973.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: ddqxywPiIkPW

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
2.49.0

