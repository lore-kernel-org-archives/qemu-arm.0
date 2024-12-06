Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1015716njb;
        Fri, 6 Dec 2024 09:25:21 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCU7aDep+fFUUWw+dAwKcspC7h05aNTQXx/AsU1agM5hsDhbSsjJsUP5zMBD4qYDiPWD+Uy4BJbWK3rDcQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH16KElgQppX7HYGShm3lui963XROpICsMnr/mI0VZ5y5VYdNaBAyQrxgl/+7pPDpNuwnj0
X-Received: by 2002:a05:6402:2350:b0:5d1:f009:925f with SMTP id 4fb4d7f45d1cf-5d3be6afa17mr4752124a12.15.1733505921618;
        Fri, 06 Dec 2024 09:25:21 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733505921; cv=pass;
        d=google.com; s=arc-20240605;
        b=EfSJw4o2PvJzIJy5sjRzzKsMuTHdT4ci0jxKjx6ujQZwa9iFcAwI2fnX/UW3ptWxwk
         Xl101+SETxxYjkV432fo8pRUthziit6gdqGp2z1Q/3ZJZHlG5AUd7iTKj9xCirYRQ6x7
         rfIcpqX/AK38Q32aCwDpqhDrnTkCJbH951nfLj7EXla8sFPISq1Q4YLuur+HzPgsaZ1u
         JvlioRn0+JWVdxuB0+ecdksO5KmdnMb0OdeXVnI8dp603A2hwzGKaSyFH2MOsEKYuLKY
         YRhEVq91kT/GEe6qwSwdaYZVCfVHdMO3Iu9Q8/O0tTlk/0IIVHcbtHV4qbYbYUV9pPR/
         4LKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=86D5w03GN46N4hQDaUq12ULG4qFYMYOyr19ho9PI6qM=;
        fh=iUMV9EEFXu4MlKxCNfodurzM1E/+GIYNLUanQFJhC2M=;
        b=H0uxn2nVWcRxafYnX79UxumkqB2lESrCzuWvoVIus0vb2KCl1T0NySE0VSPb/v2dqK
         pdNKs4kJWnjirPOOocaIBfht1Pbb2wKXv9dmu7PobvjDfjVYqg7dALeD34sEDVoPXBjb
         egBNIEdeECS5UnxTgjZJv5v4BczDelDp5+LVrQ6bOW+9RzZNf6E/B/jbJJ1GsM9KcxvW
         LNbdIlUaJXeJelT74W3xfq3Eq16G7nI8Go0ZPOtxTJtiVfVp9CxQi3l5m6U6qLxCMLd8
         zgiYjPkUnApsiRWD2YVQpAGrMxWcpSZdGWUspCqH5vagJRIiITU1ucgb7P3CeHxsEuCu
         e1AA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=tNLjMhV2;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435410-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435410-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-435410-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5d14c74ace6si1961746a12.149.2024.12.06.09.25.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:25:21 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-435410-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=tNLjMhV2;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435410-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435410-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27BF6188213F
	for <alex.bennee@linaro.org>; Fri,  6 Dec 2024 17:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 469A6215BC5;
	Fri,  6 Dec 2024 17:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tNLjMhV2"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD5920459D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Dec 2024 17:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733505688; cv=none; b=LY60n2o1UNaXZslZIguYsm4MH81USY+rGxh67jW5vNc+EQYbTWhB55w1y/QlCwM0D93D/NUOVBkOyb1rNYsP5ZxIUnAwxTzKRTboDX53zOjZD7QAVTHuHj+4U1ngWXcpdXQXmOBQVSN9pTO8HX2+Zg3pGoPYrgg1mlL79xWTqeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733505688; c=relaxed/simple;
	bh=0CyS+5uMH4bliw7AWJd+kEIWAWXpqKGP1aXYbGP2T70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A5liVQDZULa8mYVFzNW/jAkNuXn8IftsHzrdPodwwxABv01vcswYI5Bq1sSVoqWSmgOUtCw85mgycSIfgw9ThPRdU7McBMQIAx4pTtbBatEI24lzyE6PjbQyNT3WyfQmPOdbukHIvmCB4bJKLiGSmauDF8gH8V4hImQKkQorJFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tNLjMhV2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 198DAC2BC86;
	Fri,  6 Dec 2024 17:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733505688;
	bh=0CyS+5uMH4bliw7AWJd+kEIWAWXpqKGP1aXYbGP2T70=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tNLjMhV25h/XaHHCCxu1uBpv6vnxVFDBVsaazCdVnHBCAsQOFklBt1ro/ehr7Y2Ep
	 ekiOeW3nQGxVEj9wjFhS706bV79oVPugDEX8livXjyxDob10KT5Uki2YY2++Gf78FR
	 FIyZONMMlKroqMIwWklKGutgqLH/n8Fv7MXETSK/a6koXa0ViiuGdu0cVgnsvCfMVI
	 MRcoO7LYmI2MlAO21IEKemJTu+8IuFXAWc0MDZtCMDStk9KlkEeRwZm2Rxq6U56MCE
	 pe/XIc5nS0e5x8XIW1DX4clmC52WxWc/DkYH0hu1URsB2lbjj5EoQA6o4zOwhwJxFK
	 kIDlEIrulh9iA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tJc18-00000005RLK-11kL;
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
Subject: [PATCH 28/31] acpi/ghes: Change ghes fill logic to work with only one source
Date: Fri,  6 Dec 2024 18:12:50 +0100
Message-ID: <ac26f611d58b467643ded09b64bf5149fb48800c.1733504943.git.mchehab+huawei@kernel.org>
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
X-TUID: 9rc9Pfx1uaXv

Extending to multiple sources require a BIOS pointer to the
beginning of the HEST table, which in turn requires a backward-compatible
code.

So, the current code supports only one source. Ensure that and simplify
the code.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/ghes.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index a4453ee357bc..5efa50413af3 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -387,15 +387,13 @@ static void get_hw_error_offsets(uint64_t ghes_addr,
      * As the current version supports only one source, the ack offset is
      * just sizeof(uint64_t).
      */
-    *read_ack_register_addr = ghes_addr +
-			      ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t);
+    *read_ack_register_addr = ghes_addr + sizeof(uint64_t);
 }
 
 void ghes_record_cper_errors(const void *cper, size_t len,
                              uint16_t source_id, Error **errp)
 {
     uint64_t cper_addr = 0, read_ack_register_addr = 0, read_ack_register;
-    uint64_t start_addr;
     AcpiGedState *acpi_ged_state;
     AcpiGhesState *ags;
 
@@ -412,11 +410,9 @@ void ghes_record_cper_errors(const void *cper, size_t len,
     }
     ags = &acpi_ged_state->ghes_state;
 
-    start_addr = le64_to_cpu(ags->hw_error_le);
-
-    start_addr += source_id * sizeof(uint64_t);
-
-    get_hw_error_offsets(start_addr, &cper_addr, &read_ack_register_addr);
+    assert(ACPI_GHES_ERROR_SOURCE_COUNT == 1);
+    get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
+                         &cper_addr, &read_ack_register_addr);
 
     if (!cper_addr) {
         error_setg(errp, "can not find Generic Error Status Block");
-- 
2.47.1

