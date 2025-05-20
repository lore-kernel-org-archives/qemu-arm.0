Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp304558njc;
        Mon, 19 May 2025 23:43:32 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXti21khwNMGcSZsQ0jt7SrM+XOyBggv0zHFf8xjhMcDhZt54/0NoK010icxTraHgA1BOjevwGA2nY6eQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHKwWIC3XxEWgaQhc3wFL4zHY7lHCIMJm+Blo32oCafMpiWr7mCPzW1kQhRg677TexQcAt4
X-Received: by 2002:aa7:9d88:0:b0:742:da7c:3f27 with SMTP id d2e1a72fcca58-742da7c3f6cmr5034089b3a.0.1747723412372;
        Mon, 19 May 2025 23:43:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1747723412; cv=pass;
        d=google.com; s=arc-20240605;
        b=RLWItsQpr75zKqqjh9A5zkbA5zHU2X7bJC/MaxNDrh8hQom7Xbu/X91GjPxcOPxCyr
         3qtIi99zXS4d/g2auT8xg3dlCFikeA+li4/bg9gJgku50SO1QgC6NXj1Y4feTNuvECUF
         oUvQ+s5nGPAK25Nh1k/wmuajzLAT27fSsM9pAHO3CGI+y3Y+R/9bsFIlIxrkZvmBMV0z
         Ks/EYvCCF5p8kwL7BPovG3wy/zwz4YPon/RpCJTnuEE9YrYQ+DCxHvGQ6KBWEbx1roZf
         9Hv8cUo8zdoY9MRfdY/m0xJWE2QvLIHPqXXrBxJg8uTq1Ih8OwLUjiA+7hiaHsJZwOZn
         W+pA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=mtZs3EtbQBM2KieFk6ioqm+/qnqXFJF68JhXcL0px/4=;
        fh=BaBMhsa8otE44w+eiuuCkoL0QFe4OiybwLz9x35r5BM=;
        b=cRnyk38VWWGH4MMvNX3M66dS7feOUg6/hrowCvt7PzXnZjGvz89aPaSQozqs0G8o+y
         I3zZ7DhKUETBQ5fzGMrXICSbLBioxNG6PDD+hc5uKLr8CYKhv+aKDxvl5sYq2vMGoUgS
         zGh/d3Dd6tirkUrmlvqNP1TACJwS1tlRHCfP6OuUuuLZxoVpt8BaPuEqMKArR7qLmDBs
         5OVv3EpLRIt9t25ptL45mMFQbMRsQxKpyKl9QGEtzC86zmceF7jt5oLJ0rbkj8PwkBqi
         /0t9sd3hG1uL+bBYG+BZIPH/rcRXMjk38oGIY80QnVxQ3yjOzT4JpoWztfXY3HRa1Dxn
         f90g==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=oX9q0caB;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-655012-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-655012-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-655012-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id d2e1a72fcca58-742a97f2cd4si11724419b3a.218.2025.05.19.23.43.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 23:43:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-655012-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=oX9q0caB;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-655012-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-655012-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 041F47AAC01
	for <alex.bennee@linaro.org>; Tue, 20 May 2025 06:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B98AE25EF96;
	Tue, 20 May 2025 06:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oX9q0caB"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7875425D1F1
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747723316; cv=none; b=OoaCU/O3Er9pG1z6DCTmXlVAkRRiBmop7Gk8lb4fZPFK5dasCJ7iI14zSbyobbggx/nXc8XNkWae0IRHh7NOR0uLwVir8Qo/l53Onu3GjKNWnqIlBDqfmXqCsEWN5Ig0L2fmODVJOcTKEJkrjBLvGUgyQomWlYCHoDAd/tpKFNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747723316; c=relaxed/simple;
	bh=jUN0vZpicM1ninmp5QdTzg4Xor1R6VHYCafj50G+/4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NjrQ4r8UAViH0XpZDxtYqQCyGGDTiflWzlxGezR2HzH55II7MV3QznRsPnhU6YGouXYRUU+MZRd07MkCOvCPaSmEniAGQ8qQ32dLvpPBoEwbgeMqQkh8UkclQIxwffzzMPDDGVaVzZU7fsoqedgIeu6fY0Y2XLgZDcpikN8oH3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oX9q0caB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8158C4CEF4;
	Tue, 20 May 2025 06:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747723316;
	bh=jUN0vZpicM1ninmp5QdTzg4Xor1R6VHYCafj50G+/4g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oX9q0caBO9WUboHpmUTcZxNjEhG9QGgnhSDiCP6D8SrfM0bOaj4VDBUoXsmIKPxPn
	 akPF7x5v+GxsCeH5Y9pQFbQwxlB8rHka7h1B6itnwz7LdIBLoUbzCpSZAv11ddFZWo
	 kfQH/sbYLqHfZSGufeRWbFBzVvEgcKXBHLro2H2dpJU4QjY7boI7p28Vl6QUrDpIWm
	 1hwrZeoHHYumdCV92etqN4F7BJxnHUv1dgi9yN1bqA1gL9eaQbWLSeLRhr5Ecj0HPG
	 ox3L4NOTUPkqn8DfHAG/SY3yD1evYcn9shtfYhEhv4Rty9cZlU/S9EkWGPEclsN8kU
	 6D5wK6RzVmBjw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uHGfh-00000005qtc-3rZ4;
	Tue, 20 May 2025 08:41:53 +0200
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
Subject: [PATCH v9 10/20] acpi/ghes: add a notifier to notify when error data is ready
Date: Tue, 20 May 2025 08:41:29 +0200
Message-ID: <d1cae8918a49530ce6efcbdcca1a96b0c29b4cb0.1747722973.git.mchehab+huawei@kernel.org>
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
X-TUID: v0o2RNdS7LYt

Some error injection notify methods are async, like GPIO
notify. Add a notifier to be used when the error record is
ready to be sent to the guest OS.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/ghes.c         | 5 ++++-
 include/hw/acpi/ghes.h | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index f49d0d628fc4..0135ac844bcf 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -510,6 +510,9 @@ static void get_ghes_source_offsets(uint16_t source_id,
     *read_ack_start_addr = le64_to_cpu(*read_ack_start_addr);
 }
 
+NotifierList acpi_generic_error_notifiers =
+    NOTIFIER_LIST_INITIALIZER(error_device_notifiers);
+
 void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
                              uint16_t source_id, Error **errp)
 {
@@ -550,7 +553,7 @@ void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
     /* Write the generic error data entry into guest memory */
     cpu_physical_memory_write(cper_addr, cper, len);
 
-    return;
+    notifier_list_notify(&acpi_generic_error_notifiers, NULL);
 }
 
 int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 8c4b08433760..390943e46d99 100644
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
2.49.0

