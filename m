Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3616759njk;
        Wed, 29 Jan 2025 00:04:34 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWvFkjf5lDbb27vozx5nybpY5gfbX+GRSl07RgoUYc6QP7yZzMvCNPQBY1dnPOA5bSh1DkQfCU0cW2KVw==@linaro.org
X-Google-Smtp-Source: AGHT+IEdGx2z+8vQ7/1zlsEePuSVrFocrS177j/L5I3cn6omIpS9NraN8cWgphuvU2qTQe6nSF5z
X-Received: by 2002:a17:907:7f29:b0:ab2:c0c8:3841 with SMTP id a640c23a62f3a-ab6cfcb3ad0mr216955066b.4.1738137874151;
        Wed, 29 Jan 2025 00:04:34 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738137874; cv=pass;
        d=google.com; s=arc-20240605;
        b=G58RJ8k0aVUbA6a9OTioXwZBy4mnXllgVPAbBx8VSOii/Fi/4SdbHr+K+skZweIfl5
         mtwaIWUz2atunVC9HODD5X6b0Du3APeCWP5Fc4y+cVYTGUKeJYO33Os0268Cs5t8flEY
         t2YpDVhecna7o/mn9PPBYeS+b2y0PW8RVOHpb4TdlCxRlqK0svr29hb6i4bMgO/ZFH/D
         1lLtP8zK9mDYWDmlgdLiNcubUMfBmOugqMzTgLP604TTqPMQ1auKC7Oqc1qvXEJjk0Vj
         1fdkcqfnP6r+8KOPhswyqrtSY3ExJRhlod06kNsQuLh142mO8j7nVlYHeytU979Um+1t
         ijgA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=oDmJfGOVZeSeeL57tT4vSntTZo7R5u0zLCdcJrIAjsU=;
        fh=BaBMhsa8otE44w+eiuuCkoL0QFe4OiybwLz9x35r5BM=;
        b=P53SJ84q6GNkynYV0GCkGg01K3HYF3XiGzReUWrix1gY6dsD6bEtK3nD8oBY8vyttS
         eG28LQArmmPj4gG3zZW6B08yjrzydSOxAMkIq5LV5345fiogOE+1iQvzEs36UyG2BONc
         EYle+YDU536RiWhG3xvTZdXQwqMhsp3qzmjkD5iG5TT224mUETIQUtaroEomQT/JypoS
         tDudTTv4M7THV4LxZuJp5NyLQ661WFuEGU2EGjcvj6oZo6kl/OYbXablWj3ey0rULvSc
         z3X74QHC47Wh+GSOOOMjAc1W+2kicEOuzxIUv6HSqOhKiszp00FFULgrFoRK2fVZyRU6
         nYXw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=tbFWxgrL;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-492171-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492171-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-492171-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-ab67626c720si859933866b.422.2025.01.29.00.04.33
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 00:04:34 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-492171-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=tbFWxgrL;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-492171-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492171-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81F051888D19
	for <alex.bennee@linaro.org>; Wed, 29 Jan 2025 08:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A76B199239;
	Wed, 29 Jan 2025 08:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tbFWxgrL"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387851917D7
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 08:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738137867; cv=none; b=jLE58SfoXDv1DyFyZAA1thspc4RAPX5APO0xu/LuPEcDm+S5th3NQlpzD3f1JRj5HZ8AwLG6I0AkYijtJkCGC6XZYRYb3LIZhbuWfVvq/ZAXfYJwVEVhdt0LXR5oPRfD1S1KMeM5jYANzvCMdHPY500o62A+Uwlq7iBislkYf34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738137867; c=relaxed/simple;
	bh=wA2gzb83sON7tFk/pNwnU/0vKcR+cLDZhcB/0uBGZkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=br4J4wQZE8UVTaWrhmjFWouGxb4t74ZJz+rOslaZm9jFehWV8l7rEAPnpgC/ZqbVBeY4PLnroiIwEkR1QhaGz4SF4Xaxqm91IGhhXj2UnAv9OfLU6dswM0a3DFXng3Pg9G08VEio4ELs3M611YklQKY+0iBN37yHJWoG1pjyuQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tbFWxgrL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7B9C4CEE4;
	Wed, 29 Jan 2025 08:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738137866;
	bh=wA2gzb83sON7tFk/pNwnU/0vKcR+cLDZhcB/0uBGZkY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tbFWxgrLyGXUjXtMrNDUoud5Tb2tOMtRwiU0egd6yADHYB4Xo1XKpqbm8zNRVqK1h
	 nxoCjOMV8EHi+6q7EBaejlrZfOWEC/3M2BKZxUoNvMocX8JN4D8IA7IqNbM1k9d7M3
	 AMiMxWptA4AQ8kmAKBHCav9JZvMxIly9Us9NM2YfYxA2OLus1p8+ZxKFhiR2l3X9J2
	 tC6ZLOT0q086UPPPImFgQXM7GGWH1q/lEDMUV1368nXRpJc2ZEY8hS3KEkhh98nj5i
	 jaX8AWpVTx8ZuLVdTXKtCAnkqfRXZI861LZsN8hEhc73obW7diWRhOnSefwJfiydJ+
	 ijzR0uy+nLkWA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1td33g-00000004DPy-3UGd;
	Wed, 29 Jan 2025 09:04:24 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/13] acpi/ghes: add a notifier to notify when error data is ready
Date: Wed, 29 Jan 2025 09:04:13 +0100
Message-ID: <fa4e1c3af48cc164d3b6b227fdc762f18dfa6b03.1738137123.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738137123.git.mchehab+huawei@kernel.org>
References: <cover.1738137123.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: X3h9SljhH+y4

Some error injection notify methods are async, like GPIO
notify. Add a notifier to be used when the error record is
ready to be sent to the guest OS.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/ghes.c         | 5 ++++-
 include/hw/acpi/ghes.h | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 736287766989..38ff95273706 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -512,6 +512,9 @@ static void get_ghes_source_offsets(uint16_t source_id,
     *read_ack_start_addr = le64_to_cpu(*read_ack_start_addr);
 }
 
+NotifierList acpi_generic_error_notifiers =
+    NOTIFIER_LIST_INITIALIZER(error_device_notifiers);
+
 void ghes_record_cper_errors(const void *cper, size_t len,
                              uint16_t source_id, Error **errp)
 {
@@ -567,7 +570,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
     /* Write the generic error data entry into guest memory */
     cpu_physical_memory_write(cper_addr, cper, len);
 
-    return;
+    notifier_list_notify(&acpi_generic_error_notifiers, NULL);
 }
 
 int acpi_ghes_memory_errors(uint16_t source_id, uint64_t physical_address)
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index bfc8fd851648..80a0c3fcfaca 100644
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
2.48.1

