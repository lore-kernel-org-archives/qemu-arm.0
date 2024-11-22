Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5248325njc;
        Fri, 22 Nov 2024 01:11:57 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCU5tPoR2BZ4etvY7tW2A5xvQezaKsvKMdEEvkKueQtphiqMrCoGnbR6E6MaaX/t0dm39/cUnizq5HHskA==@linaro.org
X-Google-Smtp-Source: AGHT+IEq7Ff0RMPp7tHuYA/t3ZZQ/kQXVqMKcEbAUmynrLjogXbB53FxSBs+G8/36QxgRIzPHOvz
X-Received: by 2002:a05:6808:181c:b0:3e7:be26:e38b with SMTP id 5614622812f47-3e915a5880fmr2327536b6e.32.1732266717660;
        Fri, 22 Nov 2024 01:11:57 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1732266717; cv=pass;
        d=google.com; s=arc-20240605;
        b=fpKh3tdoVmOqzWFSygJMXQMcbF89Bgas0W/r3XmPP5FCDUBefauKVVbikJPXXBE3y2
         zbO6L+G4kHdKe5ZK76l/0tIn8XBF+ooFdU55FC1SEr34XKME2xAMH9/9eT57Qme50I/z
         uUd60IkBkmYp4mfAAFr+lgVo4XcyOx4wOEWYaCNKD+WsfcLlO3dZpyEt4eFOjxlOwZrY
         x9J19PukE7UHTSxCcBh76E3gNTBtiq8Lisjl9jYMd3nK0dipdrz8JibDhw3bi/rd76MW
         G9pIMk/hqnfM5QR9x6TO2ItvE1NyAAn0IQmbEppY44b5IUsir1RW78MtbJGRVPgVnPwX
         xTvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=uEOiDkcqAO6Vk0m98QVnY4BgPL/BtSZCGhaVMC1TVwQ=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=XSXN5lqzw2bG3ybgzwlRvS4QMFA1ZhVLkWL2zgmIKJR/h4AcN36qC19kDSHz1sNvcw
         3O9F5GL5K6loS4xFdXDjDiner29EGt5r6oGrdTz4ZHxW+vigf9rpv8QuBIs2nICDhiqv
         zC6DGjhzxgGzCivmqRNFuoTWIqCiJa3ruhmnRBKFyzRzQFpe0ys/0IQ33XZRcGI7kG9h
         d+29Ey6CyS5Df9Wl8vDUuJCkz8AjhXzP975D/+/eNASKM8Mxd+PKmBUkEkw0GiataESQ
         MSj0IO8FMIMnHM7+tLFNrDARC5UqxihTGEoR/zpJV8pC8MWRvOyA9nPLP4PyjOVNHu+g
         66lQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=R52bK5dT;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-417978-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-417978-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-417978-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 5614622812f47-3e91500f93csi827798b6e.212.2024.11.22.01.11.57
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:11:57 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-417978-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=R52bK5dT;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-417978-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-417978-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35B16281EB1
	for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 09:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B4E318C029;
	Fri, 22 Nov 2024 09:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R52bK5dT"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF0215D5CA
	for <linux-kernel@vger.kernel.org>; Fri, 22 Nov 2024 09:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732266708; cv=none; b=cDRb1GGyMWZsrEXtS0UXBFAD7oWpkd4tzoQqi+0qLdflr+kU4Q443laM37atFeO4gVLUgNDgKNOV46lJTERHa/CKkqsmLdIa2k84rwKUnex6v5yNRYqLYjyrfrGw9jR/tNcxZlEFAlUVY1bG+zSxniEXezdZDafstrobJsNT690=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732266708; c=relaxed/simple;
	bh=Jpw03OAVmKrjW75U8f0KTzCuzLgX024dWth/Db/t5WE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bifAela9BIkYp4bwWtLf13NKefb4vTsYIUj4urvNGwbDK8tIm7RyHtz6nU1CFQzFheHWaDzBo4EN7uJitYvgSHp/pIKFgCuZlH2P2h0zdQfcz4ut121SqmFjizRqKdWs9h3U4ZC0W21k4Zo8XLEbY+/QUmQeftuTBCCgGma8XFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R52bK5dT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67097C4CED0;
	Fri, 22 Nov 2024 09:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732266708;
	bh=Jpw03OAVmKrjW75U8f0KTzCuzLgX024dWth/Db/t5WE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R52bK5dTR0zzen9fII3gqQNS4BqfPmKY2XVN7fqHlHtzQbv7MkRM2K9MvopXr1vCf
	 JrAdzM/+ac6x4mKhoG4pfvxcJQLHXm+9cJIaXrOnhP+ZIWbysvHAIjlXnOKmBk8O7g
	 5NKQ9gGNm38HiSZUh5UcoaD8jd7C57ZHrBwKZuufAc5sgRj0s75iRpw3TPAMMY2L6u
	 wdDq3Ho7VJWej2CilYvDFxWAN6XMHRJ9aC4eVrVRjfZYDfNM4/+d1aYTj+b5K+faC4
	 7aaC5xWOIktemQTzc12dMe0NQ256PFkZ3PiBUTEcDj5UfX+dIqVJLBgzKdVnMSJ6ok
	 dTw5LBsCxW4dw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tEPhX-00000006l4E-1JNH;
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
Subject: [PATCH v4 14/15] acpi/ghes: Change ghes fill logic to work with only one source
Date: Fri, 22 Nov 2024 10:11:31 +0100
Message-ID: <cf16e0900e10c5a39e11b590f5267a4b9c228060.1732266152.git.mchehab+huawei@kernel.org>
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
X-TUID: RGiHRvRFTIeR

Extending to multiple sources require a BIOS pointer to the
beginning of the HEST table, which in turn requires a backward-compatible
code.

So, the current code supports only one source. Ensure that and simplify
the code.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/ghes.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index d99697b20164..b0b1865dc8d3 100644
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
 
     cper_addr = le64_to_cpu(cper_addr);
     if (!cper_addr) {
-- 
2.47.0

