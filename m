Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1015350njb;
        Fri, 6 Dec 2024 09:24:47 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVL4f6pQ1126MqjMXiLZRH1/c81XInJoxgb49odYwd0vG+qcfcPRWyp0wVZBE0YyxP4ucWJtPHbKySkMQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFQAUUfujoRrWSNUYYJZcIkS/Gda3zsxCeh8UeSZ2mpmJV8RPCy7aVT8q9KWnLeGtHGLpxO
X-Received: by 2002:a05:6870:b251:b0:297:554:c660 with SMTP id 586e51a60fabf-29f500b2650mr4953055fac.9.1733505887644;
        Fri, 06 Dec 2024 09:24:47 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733505887; cv=pass;
        d=google.com; s=arc-20240605;
        b=P6WYaB+i+WpAdhKXU5XMLSGtTJECNgx9VmRX7u1quDtlXTgn++TXisW2FoPcwD8xdY
         4NRaHqVrxzVlqksEMSCnd5iOVPgipv45ZCV6Irf7fdxOwvHqKRUzQnfqGxRYwLbRiuE4
         Y6P81MqKeo9zHFuRWc0PWq9Ho+iGUgve+5Yan92RNSYP6neSZsN8SbvBejsSq1f8uCiZ
         89u6e7qsSdSbIBxBPMvYojHFwSJVMVj6aCJbdFhDs0cU1rZh1kmxbqCYORYNLADlFFS1
         Nkuwigpal/ztArimPvc4WyjfqMkKf8dHnCUoxT0GVGjUFgGil9WFeOvIaARQVa0jKRP2
         g2NQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=WGnmOgl/dFtIj/RHNUj0kDEcqWWeHfL228nuti+0UqI=;
        fh=iUMV9EEFXu4MlKxCNfodurzM1E/+GIYNLUanQFJhC2M=;
        b=LKiH04Nck01Q7qoGMiOCYAgEBujeaEAR5T5Ces/xvzM2ptcy3Nq84IC415dlqtzTI0
         vlNZoR+7z8pF8Dg+3aJ2pCZfN6W7ctCC4dByjUpZ/KVv5xH+1AOvVwtuG0zK5W5iit4+
         rd4qKpQqbhZcFeIoIiqJXF3RyVYr7hVGr5aqvJKJnjy6K/yc+eauy/F8mM7cTPqrtVIE
         MT6TH/YVC4fAvjg1TCQ+9dCazVQjT55Quv5N5lnz+8XdbAMZYAACViyobAuUKynGGNch
         WuCSX0iqi/ddrQ0GgMTg5pz7fjCq84a/rtQGL0Sn2ManV6niU7ICfnb6W2ynGacuzu1Q
         6utQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Uq7lj3JA;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435404-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435404-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-435404-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 586e51a60fabf-29f56645abesi1995938fac.20.2024.12.06.09.24.47
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:24:47 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-435404-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Uq7lj3JA;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435404-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435404-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27D49287898
	for <alex.bennee@linaro.org>; Fri,  6 Dec 2024 17:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA3521AA06;
	Fri,  6 Dec 2024 17:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uq7lj3JA"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CA6204582
	for <linux-kernel@vger.kernel.org>; Fri,  6 Dec 2024 17:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733505688; cv=none; b=mkuu4YYZnVi1m8yImB/UvuU88Pkg9O/uO/0fS9ijasij3k+XN/Ia55lryJJMvSyFu08+V9HFQDdgHfVYMPUgkJGeTlORSmXjppOrmO1X9xFV4sqkOvUaccmeugKWgej2H7AydfyloyeNu7HtzCHRNOngT7ne5ve9BXZqHqr4LTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733505688; c=relaxed/simple;
	bh=I+JEPNOmxK5peel4DRzhTq9WP6nim8bwrqmeY99lxXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GwTwvcgxSER9YklOI9UsmwLGeILatQDb0i367qJaz3yQ2I4nQp7u1J3VbJ3GhrQOVN/uKHUwMT8CJmnCUSyDyL89/Ml9hJvkgnyHtpYlyVv7vFqFsKFgEoNT0+3zZgwnYd4/SvjyG/ZQsmxPeex8C3TcdigEV/7OuB/p/hxCFfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uq7lj3JA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0744CC4CEE5;
	Fri,  6 Dec 2024 17:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733505688;
	bh=I+JEPNOmxK5peel4DRzhTq9WP6nim8bwrqmeY99lxXI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Uq7lj3JAj5a611SqfCuBJsj4jQ4RaLdq84TdqvwEJSJik4qG7Zbh5oDyXGoJGm6nQ
	 15z4jmbcfd07QEnlFXXvPyv0nKsZ8oGSWUJxFmgfm/3/pLGUw9h6Ss6kpiwbnjoo5C
	 nzQMM145WD4iDHai+H6T/ZfHSDdvquz5+xtlixx/OoHA6/HJHJ5s13FNhSJTB0DnOZ
	 nQvVnyvxfEtiitkzAp4Qfjia2ibc3e2ezL19yTDswyv3FeipG/nd313c4T6XxtjMdk
	 HsnrB72KgW6jndHP8PiNB1vQWnUZvXySPg4CaWtIgDIz5MSKAMdAAMhaS0ZtCBwbT2
	 lva7g1eW9Y7Bw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tJc18-00000005RLC-0nJ9;
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
Subject: [PATCH 26/31] acpi/ghes: move offset calculus to a separate function
Date: Fri,  6 Dec 2024 18:12:48 +0100
Message-ID: <0a73530b8d48f3bd0534b1e371195405434542b4.1733504943.git.mchehab+huawei@kernel.org>
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
X-TUID: kq67b2aBs1aZ

Currently, CPER address location is calculated as an offset of
the hardware_errors table. It is also badly named, as the
offset actually used is the address where the CPER data starts,
and not the beginning of the error source.

Move the logic which calculates such offset to a separate
function, in preparation for a patch that will be changing the
logic to calculate it from the HEST table.

While here, properly name the variable which stores the cper
address.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/ghes.c | 40 +++++++++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 90d76b9c2d8c..a4453ee357bc 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -364,10 +364,37 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     ags->present = true;
 }
 
+static void get_hw_error_offsets(uint64_t ghes_addr,
+                                 uint64_t *cper_addr,
+                                 uint64_t *read_ack_register_addr)
+{
+    if (!ghes_addr) {
+        return;
+    }
+
+    /*
+     * non-HEST version supports only one source, so no need to change
+     * the start offset based on the source ID. Also, we can't validate
+     * the source ID, as it is stored inside the HEST table.
+     */
+
+    cpu_physical_memory_read(ghes_addr, cper_addr,
+                             sizeof(*cper_addr));
+
+    *cper_addr = le64_to_cpu(*cper_addr);
+
+    /*
+     * As the current version supports only one source, the ack offset is
+     * just sizeof(uint64_t).
+     */
+    *read_ack_register_addr = ghes_addr +
+			      ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t);
+}
+
 void ghes_record_cper_errors(const void *cper, size_t len,
                              uint16_t source_id, Error **errp)
 {
-    uint64_t error_block_addr, read_ack_register_addr, read_ack_register = 0;
+    uint64_t cper_addr = 0, read_ack_register_addr = 0, read_ack_register;
     uint64_t start_addr;
     AcpiGedState *acpi_ged_state;
     AcpiGhesState *ags;
@@ -389,18 +416,13 @@ void ghes_record_cper_errors(const void *cper, size_t len,
 
     start_addr += source_id * sizeof(uint64_t);
 
-    cpu_physical_memory_read(start_addr, &error_block_addr,
-                             sizeof(error_block_addr));
+    get_hw_error_offsets(start_addr, &cper_addr, &read_ack_register_addr);
 
-    error_block_addr = le64_to_cpu(error_block_addr);
-    if (!error_block_addr) {
+    if (!cper_addr) {
         error_setg(errp, "can not find Generic Error Status Block");
         return;
     }
 
-    read_ack_register_addr = start_addr +
-                             ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t);
-
     cpu_physical_memory_read(read_ack_register_addr,
                              &read_ack_register, sizeof(read_ack_register));
 
@@ -421,7 +443,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
         &read_ack_register, sizeof(uint64_t));
 
     /* Write the generic error data entry into guest memory */
-    cpu_physical_memory_write(error_block_addr, cper, len);
+    cpu_physical_memory_write(cper_addr, cper, len);
 
     return;
 }
-- 
2.47.1

