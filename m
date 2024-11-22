Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5248376njc;
        Fri, 22 Nov 2024 01:12:00 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWBfkY1GuWG9pHrqJpgpc2exojau7PPeUrfiqLxSO0MUFOSXThQP4c075lPbVVed+MooxvEbmYWPh4J5Q==@linaro.org
X-Google-Smtp-Source: AGHT+IG0a4PIdu5W5qFeQu0mHEo8CIU57ZTGyrj7LasdFvqjOjtH7oW6pYNGJZhBJV9sS6OJR1yX
X-Received: by 2002:a17:906:23e2:b0:a99:f972:7544 with SMTP id a640c23a62f3a-aa509bbfb75mr178949266b.38.1732266720608;
        Fri, 22 Nov 2024 01:12:00 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1732266720; cv=pass;
        d=google.com; s=arc-20240605;
        b=ej9mrgyUtfrGGkkHYLUXB0nTPsUbERKyC64mvHE3YuRQdoaPDFdnr0tGxHaF9qWkXU
         54he3U+AUqkVLI3Krw807JBCnmvPjtqXjwCMAcUE02K2ylUHsBf6bj7tZld9JMtyx+VN
         fe9mCzO7OnEr6OhGnbgPmqZOqjKklfL2sMi12qWcGrKyHElkfDkbGFcwv7SLLvgwMT/T
         kzsM7+OmrkSmHNdjRtojkRPKZWAgOaFk5hOwhl6vqz51V1SibopgCoRKYvntn04TI6ZJ
         pLQ3tEtyEoLBWF8rKDNoiN0VCapap/yiQCsFRjE1aguTyfWayy7FpqTlnooIefgwIbLm
         v2gA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=wkuTbd42EZU0/Jocf7WfQTl85YBwM6uicqqf3mXzjEc=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=IU1O2em6AmXjce/y71hmbJYmn3+mFgw2yvmeuHrJ3wydrH8ZgYkWxaAl94SD7kf4Rh
         RsiSWzV6rPzgZiE2C8KRW0gOAxtp5YnDsuTtLEAzXLzwwUb0y8mX/Q1sSzDGF8JjaZ2+
         mZTzjxULeh65EaptPF0oK/3u0IZ8FYaYwNjH5IRI3Lvl4HbMIEyblpKqYu78X0PF9JA5
         0XDJAEx5vZ0Q2/h/kGijp6Gyj6RPXqsqI6RIax/vcfr4t7hSLwFolLPWt9JH9sOieQaD
         I+0UXCfP4BtgM4aZLM8k3v/bqv+iky4ZxFF07Rdos6u0/8ozNuj9ggUOmVuw2qfzQ/Bv
         gjCQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=JGc6myAp;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-417981-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-417981-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-417981-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-aa5161d6babsi50207866b.781.2024.11.22.01.12.00
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:12:00 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-417981-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=JGc6myAp;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-417981-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-417981-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 361281F22C3E
	for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 09:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B3421C8FD3;
	Fri, 22 Nov 2024 09:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JGc6myAp"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5708175D44
	for <linux-kernel@vger.kernel.org>; Fri, 22 Nov 2024 09:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732266709; cv=none; b=buitZDSn18WSxOjyAV3MKH7YEvVQl3RKMfA8UIy+bEBXbfZD0msUEK2H+lV6mekb6bgrlfDMqAR/GIPoSseZ4Venf2DvVAodRERFnzXbysEjSoWJ1l0LnB/cssgUJNGb7yqtI17NFXq7cqezgaZv9nh5N0j9yGQOMYkvmDb67Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732266709; c=relaxed/simple;
	bh=x/EqlciAexRjOLdohp886lYLI6VXFWugrEheoNJPLkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C3aqt1eWZWAiEf/V05SQTrpbFqfOmyHFKlKy9s0TuARvMWglYcxvgB2AC4drKDeJetqlC5qn0P8xmuqIPQ7LQ4a/VcRgT0OCVUJdiOrcBkVcN8vvgZqpfF0kUSblcsbyYrXs5QQh0/rFJASk9jmFsvRhyjkQF28dxrD9ETtvEsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JGc6myAp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E9B9C4CED3;
	Fri, 22 Nov 2024 09:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732266708;
	bh=x/EqlciAexRjOLdohp886lYLI6VXFWugrEheoNJPLkw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JGc6myApwGSDIhgTQWYRAImRb4EIXwiP63pKoNIVOT5VTOaAiSYeE9o9W+8PZITTH
	 ap6NWMSWtQL8kZ6A+42PirfvRPhtfE/bPoWk/1NjAnvNzK3jvtgXlKqDDa+m5QJnU6
	 aLcSy/NT7Ni8wFoW19L/h+wYDxgi9MYctEmB1A+abDDUC9l6wteaqLs0d7PFyCFDSG
	 VO2jIYisbV7vex+//Xswf7TKmhbNre5M3OENKkh3CNFmJTPyfw6tbUHo7CduEYXy/y
	 SAuNpUfOBd2M/6Ie+pq/aem2lOpoqFYpBi4Fhr9RU6YOMl5DTPFUSDDYxDzPmjNcbX
	 nwIFtDR934BAA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tEPhX-00000006l3q-0WlB;
	Fri, 22 Nov 2024 10:11:43 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v4 07/15] acpi/ghes: Change the type for source_id
Date: Fri, 22 Nov 2024 10:11:24 +0100
Message-ID: <84475e30b69680d93697ec666214482e36cd8844.1732266152.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1732266152.git.mchehab+huawei@kernel.org>
References: <cover.1732266152.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: 61TjTbMczkQH

As described at: ACPI 6.5 spec at:
	18.3.2. ACPI Error Source

In particular at GHES/GHESv2 table:
	Table 18.10 Generic Hardware Error Source Structure

HEST source ID is actually a 16-bit value.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/ghes-stub.c    | 2 +-
 hw/acpi/ghes.c         | 2 +-
 include/hw/acpi/ghes.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/acpi/ghes-stub.c b/hw/acpi/ghes-stub.c
index c315de1802d6..2b64cbd2819a 100644
--- a/hw/acpi/ghes-stub.c
+++ b/hw/acpi/ghes-stub.c
@@ -11,7 +11,7 @@
 #include "qemu/osdep.h"
 #include "hw/acpi/ghes.h"
 
-int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
+int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
 {
     return -1;
 }
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 5f67322bf0f2..edc74c38bf8a 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -383,7 +383,7 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     ags->present = true;
 }
 
-int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
+int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
 {
     uint64_t error_block_addr, read_ack_register_addr, read_ack_register = 0;
     uint64_t start_addr;
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 50e3a25ea384..9295e46be25e 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -73,7 +73,7 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
                      const char *oem_id, const char *oem_table_id);
 void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
                           GArray *hardware_errors);
-int acpi_ghes_record_errors(uint8_t source_id, uint64_t error_physical_addr);
+int acpi_ghes_record_errors(uint16_t source_id, uint64_t error_physical_addr);
 
 /**
  * acpi_ghes_present: Report whether ACPI GHES table is present
-- 
2.47.0

