Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp865143njc;
        Wed, 22 Jan 2025 07:46:45 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWp+lwB+ojYzRWylGuHyPo7qGHVMKrJCbxYmPywvpuZvmVWu/FZuK+J3ntTr9WrdQ4sWxy0iAibjES/ug==@linaro.org
X-Google-Smtp-Source: AGHT+IFeQg2dWLQSaS6spE+srBO9Z7f7MvKGS7MqrugStPwCIImCm5Ghj92ShQPr8csQu2PK8ETC
X-Received: by 2002:a17:907:3e1e:b0:aab:eefd:4ceb with SMTP id a640c23a62f3a-ab38b0a2b92mr2195112266b.10.1737560805342;
        Wed, 22 Jan 2025 07:46:45 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1737560805; cv=pass;
        d=google.com; s=arc-20240605;
        b=QdqvWCLETi7JCUd34sBAgMxcu1gdbm2ijBtcff8EY2DX7r3VeNHnZGnJFErPO8R3mO
         5eDokuoZW4bXTotl9zeYhwCZkPWBs2dOWsoTS1A+v2pWdxrumj4DT2Cfek2RwUqD7mps
         yAbhPXNBQ9Pkt5xk76i2y9cDmXP9QBgg6r78ZF5pZZLdTbPTpHtTMzMX0yvBHcGpsi1U
         N7oRe5AF4/nb48pjbR4Ec4NqxnjP3wiC0jczT7bU/Ld3BKvdRm7jD0331MQ6fiEPT6QM
         iQ+mAqurYf5GMX51mi9m5jdrMKIhv3zjJO4i2dqAKAZ2mUy2PD940JKJf+XQZdqrCz6A
         G8MA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=jJ4Lmnq/a7TYyJFTn6tOsCexHKi6x7jYpKGnWFUMPZ8=;
        fh=BaBMhsa8otE44w+eiuuCkoL0QFe4OiybwLz9x35r5BM=;
        b=KZzw7UhmsPyv192H7TuYYi32HueT31iPC8QAGrbjwductsDeJG1la/6e6eAfB0xGYJ
         GqZrXBCfModeCBhahB7ARBG72/m9RInSfbvDnov0zr54HdwVz7dnd0y1ksEehXK4haOe
         ZYbf8qpghLxRYrGLBTIb686tSoHBA0S50Dsjr9W4PyqfUv8MhdCOgsWRXufXuWD0vUvF
         nCINdlXV4bnpO/FniowY1GaU4UaJQPekdLV1/lJKIAGTLqaykqDFFDObhStiQ+OG6gZG
         J3SPezrYZcDwT50m9ZsxAyjbqSqSV0akJ9L+JgQzxNZ1L1bpjZyQiOatok8heIWsJfiM
         2Rhw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="d5E5U5/Z";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-485592-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-485592-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-485592-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-ab38501c3b0si966895766b.603.2025.01.22.07.46.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 07:46:45 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-485592-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="d5E5U5/Z";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-485592-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-485592-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A836188735F
	for <alex.bennee@linaro.org>; Wed, 22 Jan 2025 15:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 555282147F1;
	Wed, 22 Jan 2025 15:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d5E5U5/Z"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175E0211A18
	for <linux-kernel@vger.kernel.org>; Wed, 22 Jan 2025 15:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737560800; cv=none; b=hqCPtQBCOav6AH1vbi4xOQPtgRfNcSRei7IHjnFCwbMgU1FF6d8Fm/QsK3eJfQCTfb011atAXgMmqeKhudbNJiKb73uTpscykWwiZYkCixmqRHNadSflzmG0cJtTetJzGhtG8GHpQ6+O5XVsFiLiT4N3N3PNhbOXq/9cbQ13urM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737560800; c=relaxed/simple;
	bh=L9zIZD2Brt7xrZs2jK5Zsf83XHA4Wpm8uMTXvnIC9LU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eY5zLwcijfn+1yDGRUm/sND/NeqrPfIcE5UWUkD8oeZy1gPLMzGkp6nFtXKmPy3dqVOcYTjoPzUyWzDTUQRfjY4gVQi3mp/5UEjcRyXXV2s8JP0jDmH/Is93kjGZsIfHQAJeam0eaGOkmcbU+h/9CWis0leiMhxztHAKiOC5M3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d5E5U5/Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D76BFC4AF0B;
	Wed, 22 Jan 2025 15:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737560799;
	bh=L9zIZD2Brt7xrZs2jK5Zsf83XHA4Wpm8uMTXvnIC9LU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d5E5U5/ZnmqZmiZDowtfuTIlDQT1MCfXdiXtVI5lvCLNI46dwlawZceD/klFQ6jRT
	 Od1QHpqsYcRcrZeINQzeP3zaeaIrreL3szF9YCKoT54+9GVGbuEqAC9IjCviFrTzxt
	 ZGe2+yx9276HHaLtXav9Rh+3FUjgPU09/xTlaEhEVzr1RGAvKycLLpSfuXvmlDasA+
	 V+2OU6yJTxnHaz57CBGFqeinPdqsZ4x5JbBSZWhDSKMGNLfynY5TEyYnRnYW07k9+e
	 nDq32RuM7Z2ywWBLZElTWMFMiDArk+68Qeu1MyFBY7BpiUwPADmxO7hiR+4jh86/bv
	 YKYE4/UJe5Riw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tacw9-00000008ogc-3qU0;
	Wed, 22 Jan 2025 16:46:37 +0100
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
Subject: [PATCH 06/11] acpi/ghes: add a notifier to notify when error data is ready
Date: Wed, 22 Jan 2025 16:46:23 +0100
Message-ID: <b359780154cdd4b4813ee0f6c3ae5a0bb622eb8a.1737560101.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1737560101.git.mchehab+huawei@kernel.org>
References: <cover.1737560101.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: zHZl6915E2wa

Some error injection notify methods are async, like GPIO
notify. Add a notifier to be used when the error record is
ready to be sent to the guest OS.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c         | 5 ++++-
 include/hw/acpi/ghes.h | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 86c97f60d6a0..961fc38ea8f5 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -506,6 +506,9 @@ static void get_ghes_source_offsets(uint16_t source_id, uint64_t hest_addr,
                              sizeof(*read_ack_start_addr));
 }
 
+NotifierList acpi_generic_error_notifiers =
+    NOTIFIER_LIST_INITIALIZER(error_device_notifiers);
+
 void ghes_record_cper_errors(const void *cper, size_t len,
                              uint16_t source_id, Error **errp)
 {
@@ -561,7 +564,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
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
2.48.1

