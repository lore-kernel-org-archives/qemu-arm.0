Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1015088njb;
        Fri, 6 Dec 2024 09:24:25 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWRRRBAgnoIL42CzVZeAOjSxT/QNPjGANSVKUzVY6z7tu+DllX2xEQjwOh0DA/hnnv48kE9eIuwRxsfWg==@linaro.org
X-Google-Smtp-Source: AGHT+IHP12kuAp80XvdxSqutXMAccY7U3Sh6FozxEJdNzEMo88C5usdnjaMQ7m6tMUo1eO+u0//B
X-Received: by 2002:a05:6214:19eb:b0:6d8:a7f7:c3a1 with SMTP id 6a1803df08f44-6d8e71c84d5mr45118506d6.40.1733505864854;
        Fri, 06 Dec 2024 09:24:24 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733505864; cv=pass;
        d=google.com; s=arc-20240605;
        b=K8UbQpgPu6zO+hGw/Q+JvTicU1oH2NVy8H4m0alCFqgSRibmwPx32e3n2KJGyG0mbf
         iRwqKOmtv0RleP5B+MAaobM+/dmbB0URb2o/jW8JPWT07iiY3t5G3P74NXxlswgEKApn
         2QK5OA3kqZlLbASJi7ptwltyhRiuQbHmLA47GTmG4AgW6WR4bRzz4ye/NvzT5Q+JUDYu
         gEHjx7zXBEHMO2+a2Sj9SRXt9fkDuBwnOYqQ4ZCoTseXy2wCUQH6vaY0++AwY3PMMGKz
         /4fkzrj7Taul88A8RlG/pfk12QLlr/ii0Bwga3mAZrY7fKjxB1R+ah7QOqst0mNTs9o5
         mHeg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=bmonpJau5JoZAKEzjeFLTc+kOWyHutdGwxAadtqpJMM=;
        fh=iUMV9EEFXu4MlKxCNfodurzM1E/+GIYNLUanQFJhC2M=;
        b=ckzKl78gFSIlP7v6F2EXuCWyTJmAgLTvl/RielX7VeNsmeI+hsw7HU67mqo0Izwctr
         j1qQCQVovY/mhUU3X9/78a79GqiZfimZOy8Hl3lbkWHw7PqFUp+mzf8lLKk9WQ0GzZ0p
         fyH2wPAzbRbsp9VfPlCjUtS7DcE+HnI8Q9IBH/GC9teUMyBqFVXmm6nk7fczpykxk3oI
         V0Y6dSMaTSvmT0QPbS98rsu1o0bdiWDPXGTFxM4ac9s4R2EMO7i194l5WpwOfG5aaim1
         WiYzI7CjYS0QHH9kaqCXYS03T6tHGknh1GHBv8yj1SH1jnLOrq8goC4pbJCR2A2KCEMY
         BKvw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=s+8e1OJ+;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435398-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435398-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-435398-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5a5c7f6si548486585a.200.2024.12.06.09.24.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:24:24 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-435398-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=s+8e1OJ+;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435398-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435398-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D587168475
	for <alex.bennee@linaro.org>; Fri,  6 Dec 2024 17:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C60B9215BBB;
	Fri,  6 Dec 2024 17:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s+8e1OJ+"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A16E204572
	for <linux-kernel@vger.kernel.org>; Fri,  6 Dec 2024 17:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733505688; cv=none; b=e5n9bKCDLMlKXNNlQDTJzETOIXZ8rHJu89JYqUKgz6FsHYshD6OHMtBxdYM7Xk0qeqiGYnoeU+anXUHzjobl0ZITMV7WiClKWJUadnWAjU1vuRiyR+ds0PvcTc6wS35WzFTmrnZ0NqHjURc2AXR1AVCAB1Dw1/gNeC/YyZ+B4nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733505688; c=relaxed/simple;
	bh=C/8hgca52svymn9HbMA33VI55Heq4Dc2n1fspFeEgMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lcGevotegVcELFc/18sITvvg7RnGYKirpkHEmYLZGd7M4rlg4eCyFkE3+q93TaTuG+m2CcSDfB6Tc2nl7Ll6LGrZv1NdO6KO1k5DPKUDmOWrtpr8BYRDX743IKxEHCqskix3kvNmSDtbJ0/Ornw2jYTES49u9K/EDwLvkwJcCK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s+8e1OJ+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC818C4CEF8;
	Fri,  6 Dec 2024 17:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733505687;
	bh=C/8hgca52svymn9HbMA33VI55Heq4Dc2n1fspFeEgMY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s+8e1OJ+2X2yIHtacbjdM/rCZ6ABocUT26hJ71rYI7mhDCGGx8drxhTWVjo28BQc0
	 9v9HJPuYvrwkEu5S5z8GSZb4L8fYHGxBcfL0TlzSRNNpoR/LcL6I1dx2ZGW9Sxk96N
	 Jfx3BljSOcCbTnlvClELeHs3ig3UHK58k24iHrlNCyFCsJM4jfUO80fSc//o/p3U9Y
	 gr7ZDtpTihiK6A8h/GI565JczuqZmCEPfbf15VZpafW++AL1vdXzgmIjaOOdFqfRnq
	 4GxhmqnGJaH0WExZIqiszgdEvmVKGcVLKaOIUtj5CzT7NsM6b41ZYqSAvEjnmHqquO
	 GFSPRFve7pOMQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tJc17-00000005RKk-4BfA;
	Fri, 06 Dec 2024 18:21:26 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 19/31] acpi/ghes: add a notifier to notify when error data is ready
Date: Fri,  6 Dec 2024 18:12:41 +0100
Message-ID: <b24819c65b91fd2fed027946d3b2e2ba56cafc57.1733504943.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733504943.git.mchehab+huawei@kernel.org>
References: <cover.1733504943.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: dcuMrJ9T/C3m

Some error injection notify methods are async, like GPIO
notify. Add a notifier to be used when the error record is
ready to be sent to the guest OS.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c         | 5 ++++-
 include/hw/acpi/ghes.h | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index c9295a3b0db7..7035b76fd222 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -510,6 +510,9 @@ static void get_ghes_source_offsets(uint16_t source_id, uint64_t hest_addr,
     *read_ack_start_addr = le64_to_cpu(*read_ack_start_addr);
 }
 
+NotifierList acpi_generic_error_notifiers =
+    NOTIFIER_LIST_INITIALIZER(error_device_notifiers);
+
 void ghes_record_cper_errors(const void *cper, size_t len,
                              uint16_t source_id, Error **errp)
 {
@@ -565,7 +568,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
     /* Write the generic error data entry into guest memory */
     cpu_physical_memory_write(cper_addr, cper, len);
 
-    return;
+    notifier_list_notify(&acpi_generic_error_notifiers, NULL);
 }
 
 int acpi_ghes_memory_errors(uint16_t source_id, uint64_t physical_address)
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 164ed8b0f9a3..2e8405edfe27 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -24,6 +24,9 @@
 
 #include "hw/acpi/bios-linker-loader.h"
 #include "qapi/error.h"
+#include "qemu/notify.h"
+
+extern NotifierList acpi_generic_error_notifiers;
 
 /*
  * Values for Hardware Error Notification Type field
-- 
2.47.1

