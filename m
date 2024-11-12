Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7224193njc;
        Tue, 12 Nov 2024 02:16:45 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUkIeFMS71bFV+B0ldwux2ab3pjRRfnyPMi6Iq5AdxQbO3nCVi6csR6jffz9vgq6Xow+/8+TAUMpVUcig==@linaro.org
X-Google-Smtp-Source: AGHT+IFMdYZiuYtSyS2CHbRoitGSLVNwVSzQPNP2VIYbxOilZAQ5oi7YuMfwdwVCtLgBCHgccmkF
X-Received: by 2002:a05:6402:13ca:b0:5cf:4655:fe7e with SMTP id 4fb4d7f45d1cf-5cf4655feb3mr5764391a12.24.1731406605504;
        Tue, 12 Nov 2024 02:16:45 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1731406605; cv=pass;
        d=google.com; s=arc-20240605;
        b=AQju3s/AOgO3+GfllIeXZKnHnTcBWT6Hb5SPqLhYIk+wycmgc/4KnAoe5so5Wlk1YY
         m0PQ9SHdnWRz2hVJtz6FXGyuicz4EjCFcWFBep/NxqTYntrkLXMSxbnZvamOQA3diFvL
         9Nr0AuKeEVFaVFb7KWCWZ+YaCC3cYyq5lBGPtTobQtfKCOC3Yc2kqwqEuH/jj1INtoZ5
         +lyIapTXXm8t7HioinYY8zSzhAMgMw+S040nbRgz7eMfPae6+Dv2pKG6ECAiSTvJZGx4
         EM9Kba5dhQa+t+AWW8OlV4cttH0Akp7dvo8pwf7ZoO8FQ5IlQUswOEPFTBAnA5CM593S
         QnBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=wkuTbd42EZU0/Jocf7WfQTl85YBwM6uicqqf3mXzjEc=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=WJ1xLnhCAgtsvj0WdFkrm/qzbVDm4wQKeSbXh/CN0EJwwX7Lj/J3eGn/qlCvTZWHD/
         ZsYJSGm+zR3SEyTDFigzZpeKjSDMbK+yC9B5/a4NGRUnScrd9vIQ71rw06DjxgTAwvRc
         BmUek2ZW50MjNwttQSUZi+myOHr8nZ+3gHNClPOIzbJLFOMBHHg+VaF2pshHHnj2rO2J
         eIPM8FgFdQmxqooZy2pi2B6tGtXJLDzdAdFXAu8qxfbJQbpFdAPXxS3OqrkSpSRfM/rK
         StX8pervDpKCmHk2PsP+2YJHVINKzHH9/oJdBam/S+m3rQN2cJ3PEQoaBmyEjHJOXpMP
         QoQw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="VPSRqK/S";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-405565-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-405565-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-405565-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5cf03cbccfbsi7826663a12.498.2024.11.12.02.16.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 02:16:45 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-405565-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="VPSRqK/S";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-405565-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-405565-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16D891F242CD
	for <alex.bennee@linaro.org>; Tue, 12 Nov 2024 10:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE0992141AC;
	Tue, 12 Nov 2024 10:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VPSRqK/S"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EDD2123D6
	for <linux-kernel@vger.kernel.org>; Tue, 12 Nov 2024 10:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731406510; cv=none; b=ofWXV+w2+Cbdu1IQOQAMiBm4Rlu8cZdknbo7gpmf23pBicVMk0V4a6n0o2CajA6N2j2TSdv/fhjWrUwCd134WUEl7CjnvBtbZHtcHthzFXtWTSA737/k0EfV5v2nIwR8s4dZvJM3H0/hIx+Z4s2PzCP+FY0m8FaWEDdmRzIdCOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731406510; c=relaxed/simple;
	bh=x/EqlciAexRjOLdohp886lYLI6VXFWugrEheoNJPLkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UIIEE10Wfgac9bGk95KUbomdZrknpwfFpIEKt5VKYGMoFh1dM2MvO8fpYk8kzhgXQcd8hiyEp5C0pLeKaku+tC7l8oJ3jgI3/JV+eijYEe7pWo02Bgu9p+l4YIiRWXHIizOI4V9EXqcLhWV3pgf0+tcEbZDaH5r1dnf7Ojw3NBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VPSRqK/S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E27F4C4CEDB;
	Tue, 12 Nov 2024 10:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731406509;
	bh=x/EqlciAexRjOLdohp886lYLI6VXFWugrEheoNJPLkw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VPSRqK/Sdsopn9YuBYylG9rKq79PZom8q2hZxavh185khd9zj2vcKPEf3pSZvXhfX
	 P5W2O/qmUnA50C+/Q4Y1edobMdKGGIbc9/w+lPRX98TnU6Nbo7/DUXs8zlpevopYr2
	 hHuOLhypsVYMVYzPAZ9Fda2hDiW7Af0jEqzudaN0IZfajwVtpMHtmEVZA3F+NxJGTa
	 E0t9AElVun9KaLFU0aDON9KNyYWJAxquleRgEXWzf3kpEGTw5so7yxBMuf6riaykXY
	 A5mAxS0akk2TI7s3hyW2dbW4id/kaGmJq7gx41cexZ9xk1t00Nd7ffx6ewnrXonhtS
	 NXbFG8iXrBrkA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tAnvP-00000000Jcw-0bNH;
	Tue, 12 Nov 2024 11:15:07 +0100
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
Subject: [PATCH v3 07/15] acpi/ghes: Change the type for source_id
Date: Tue, 12 Nov 2024 11:14:51 +0100
Message-ID: <f26247323276a4b3416241294e8fda0574ae3586.1731406254.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1731406254.git.mchehab+huawei@kernel.org>
References: <cover.1731406254.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: RWbcXLut5zRW

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

