Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp142619njb;
        Thu, 27 Feb 2025 03:07:31 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXFbMmlBxD0lOpKiC4nuwshoF/8Hb1YoKU0sxdJQ3GPWYRTJS2a1sGHvysyjjL1ZvIt6iLD1zpvCmoYcg==@linaro.org
X-Google-Smtp-Source: AGHT+IHZo+/wPt0EeCkOXTmkRm/X09ml6rutO/mjVtZhE7twtSS5+RvfNBBklhp888KXnmb392ES
X-Received: by 2002:a05:6870:a113:b0:296:5928:7a42 with SMTP id 586e51a60fabf-2bd50d8bd71mr16251792fac.22.1740654451392;
        Thu, 27 Feb 2025 03:07:31 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740654451; cv=pass;
        d=google.com; s=arc-20240605;
        b=Z2KbPjrepek39PT8ntj1lkDiCfMzbVP6SFIrIoLAK+7222u512yINKTEz1o8hsHjOR
         Ih6I4M9EyYKjnlwgi35sj3sIY3uoXdRrT4ETHKJgnqozK1QnQk/gzEMZDe6PNUx1917t
         lWkcURG4G+tisDridMuJqZjddLmofi/6Xo9ILBdEPRFELSa6RhFDxD6OFMiHgmYy9cZh
         bKmx5Ucz7tPTIxQdFIr8bzhC++FjpWxJiVDVZZ7HZkg1b/lp9dzIuOGr8YA2dn2t8vTH
         WzxRv6t7EIvHt80PYLlY3m8CYt74R2a1GHabNGPYsHvYJCIWXxtD7c+DrzZnBmoAGHHZ
         tdOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=OuKD0v259QtVD8TXDmEAifB1YLwrNNFUwyWKUz6rTb4=;
        fh=XcviKWAv15CvAgnyQyizsjZv6212yvUpVNhmcTByU9E=;
        b=cUKvXWg47gikwa4aySGCO0L93u2HsmywVNw1ZK69Ai0w8zRU8HL/0sSpIXYm4hxJpy
         oitSnRFQMDjvQ7UAkTbSnShIGj1n+s3/rbTyxQIjeItxjhcX6QJuaDIKqOUQkRxkhFCr
         GbtT8Q4RqXQBS6lTp8532CCHblckE8JFxLJur358dT3S7V43+5nK6AsGZ4qYfV3+yWq/
         wo5M3XPURVq8VsFk0E9U/qUHjwGSWKHdvfNR1Z+EVGADBOyM5iG2t7rYSz0rDxaQ2pij
         fLKZq6otSu6x/KJNBPaCAj1eNFjIlKCcsAqfFFWP5kMDExQ6DD14bpkZb9CWHcf6PUXa
         PQvQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Suhz0bRS;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-536085-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-536085-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-536085-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 46e09a7af769-728afda4644si790229a34.179.2025.02.27.03.07.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 03:07:31 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-536085-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Suhz0bRS;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-536085-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-536085-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 236AD3A111B
	for <alex.bennee@linaro.org>; Thu, 27 Feb 2025 11:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465FB231A36;
	Thu, 27 Feb 2025 11:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Suhz0bRS"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08BB22B8AC
	for <linux-kernel@vger.kernel.org>; Thu, 27 Feb 2025 11:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740654239; cv=none; b=ievuDfM2rbbcJznbYR8HfbkVonsSOn1HeL7XZqynYNEAG8Bb1SiyXA/wmB/5VGng+qtMQXGsYNhtdof/C9CcED0NbLDeuWev62JNGbXGFk0yJoiDzlAMpsqBrTEMo/nlzIxvnRYARBVOiLH3wASppRIsQO2GFx5zZluKU8wEUuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740654239; c=relaxed/simple;
	bh=eHspDGfSHDBjvGed5owJw/mr3NFNxLc1K/KjIKK4C1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XZv2LiZGNVkESOy8Vaz29cA3bfkdBDySng8M6lJnqfpEifdFZoUnADolnO7Uelkgu1VGcsacnj8C7CXA3vKEVoA1whjbvEMkpRxChSSbl0oXzozcaJAPpMN4+JAUdM1KYWwZZ1iOwlZwBaCWrCfjfWSejWzt9PSI99P2fp1zJ5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Suhz0bRS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5031CC113D0;
	Thu, 27 Feb 2025 11:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740654238;
	bh=eHspDGfSHDBjvGed5owJw/mr3NFNxLc1K/KjIKK4C1M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Suhz0bRSJUGn8iilEsSyF8S/LOTdn2uZzefkx23HdbGdQfVpLEFJMFBSBNhc0nWDC
	 WREI5iVZvz8i3eQJvlipVwoHn+3nUv1PC/HN3Z0nm/Y7BkoxaA+8EZJR7SW/YjmiTb
	 gF4kyk3Es7MptGe8LS/3IheP+ILrK+ZXrq2COvLEPYdKwZX+2vj+QjbCxNHDyLg5Wc
	 9b78JG0GI8irKHghv/bH3Y8il0AuUqkHmtkU6Wzcsnt1CbO4cvviVEzycss0wWpCYz
	 ScC3v4dg7q4A0QyBIO0OYnuNt3Se9AqtkhvIjuhYwsGQJulqsZneJKiTTahsM6HUgd
	 UgQ8iFpoCF4BA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tnbgK-00000001mRm-28au;
	Thu, 27 Feb 2025 12:03:56 +0100
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
Subject: [PATCH v5 19/21] docs: hest: add new "etc/acpi_table_hest_addr" and update workflow
Date: Thu, 27 Feb 2025 12:03:49 +0100
Message-ID: <205abbc22ce816d88aa6c1c7058607fe35aae1ea.1740653898.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740653898.git.mchehab+huawei@kernel.org>
References: <cover.1740653898.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: fLJLcoVhrDsT

While the HEST layout didn't change, there are some internal
changes related to how offsets are calculated and how memory error
events are triggered.

Update specs to reflect such changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 docs/specs/acpi_hest_ghes.rst | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/docs/specs/acpi_hest_ghes.rst b/docs/specs/acpi_hest_ghes.rst
index c3e9f8d9a702..f3cb3074b082 100644
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
+    contains an offset for the beginning of "etc/hardware_errors".
+
+    Newer versions place the location at "etc/acpi_table_hest_addr",
+    pointing to the beginning of the HEST table.
+
+    Through that such offsets, the firmware can send back the guest-side
+    allocation addresses to QEMU. They contain a 8-byte entry. QEMU generates
+    a single WRITE_POINTER command for the firmware. The firmware will write
+    back the start address of either "etc/hardware_errors" or HEST table at
+    the correspoinding address firmware.
 
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

