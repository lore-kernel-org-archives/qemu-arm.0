Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3040697njn;
        Wed, 15 Jan 2025 04:52:16 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCU66Oq5FBm7iLZfDhbtcZ35uZzQseNXWiUF4in6lrzMYBn2HcrFjlxkisvaj/XZkBsPe8i/QmPUWRKhMw==@linaro.org
X-Google-Smtp-Source: AGHT+IEqdss6uVUxXr2zKfKkqU9q/W9O3dFCR44ZpbndiQ/AE78mGIuOrlp92fjIBzGo4jIDVRvj
X-Received: by 2002:a17:902:da8d:b0:215:6816:6345 with SMTP id d9443c01a7336-21a83f52430mr457700565ad.16.1736945536415;
        Wed, 15 Jan 2025 04:52:16 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1736945536; cv=pass;
        d=google.com; s=arc-20240605;
        b=SujEfYgS+QsIsrEitenFm+mFKRYGgVP9bLus8KAsqqKIujYF9iEksi3Jcge4wAkBJP
         9hWHM4tS1pe3oAnJNqTCsYQ96vvw2lPz3M2cKdbDEa5pSRSJziflc0ufaobgyB2KVcx9
         57y0+OaxdpAoAB6zG9k8hH8JbxAqZR1zTzP3zv5OaZu768OydgMP/u5qdLMThF36CH2X
         aoRHVhQvtGxBQFIeidxL8AkiPMDl89P/6CJE07iXieDmU2rTYxEZNut4daGiNwCPuMZP
         TV+hzJdztLyBQy2lK01Ek8IszxOaBcsQLWG/ofMlReqNf8OxizXh0UWxppx6bnQrLtaS
         Oktg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=x7iUwWNBo32xGnEjnzn4zCJkzYBz1vpwa4XAmnrpU/c=;
        fh=BaBMhsa8otE44w+eiuuCkoL0QFe4OiybwLz9x35r5BM=;
        b=DuQ7T0I92gFXA46J5bDOPqFQ9P3W5Jtgiy4lmtBv/Q4ByFBU3W+96H+Ivdf6/W+ydW
         V3CXICzK9Nl0jsQ1pwaXKojLF8UpyZxXYShdRjhU2MfBBkMGunNWg8NFbZRskjTk18rd
         otshRpViM0BAJWYRpqZUPtnA0ZUqINiE9gjXy6ukvdhMS6mEf9XrijgISn/QVF7V1t/x
         n/gze6wAH4ROvWLGQpYRQtt5/4fPIidzo9+sJYqJq2ol0d11HF+o00YqeKCRY8bxlOSa
         zOE4aSAOmpI9canG8SKo2gYf4ZAbJxKwKEITDRX6PdzZQ/rZLnN47iIuYCJVCXkCHS6e
         mdhw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=qb2EVWmN;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-477914-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-477914-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-477914-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id d9443c01a7336-21a918b80e5si152091375ad.257.2025.01.15.04.52.16
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 04:52:16 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-477914-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=qb2EVWmN;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-477914-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-477914-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0C453A18F8
	for <alex.bennee@linaro.org>; Wed, 15 Jan 2025 12:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26196243871;
	Wed, 15 Jan 2025 12:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qb2EVWmN"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91102416AF
	for <linux-kernel@vger.kernel.org>; Wed, 15 Jan 2025 12:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736945441; cv=none; b=fjqhWlcg5gwXYa5ykqPtyU5u9ul27ZFgGvYcK+8UFcTbxRmjdGJQhQGUJZdFlD0qcbBbxLZCB1d2uq50SXYla4pzc+7wPkQ0Ostdb0t+jcv/sOolzOFsZqUIRoB89Tra4m+ANrv4YQ53L2tIV80o3R7fILIlu4iZvX6sz7ya+kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736945441; c=relaxed/simple;
	bh=V1mKz61FdUoHAGH3dpkETvRbC+klSr1z3HPtcSnP78w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uJydIsbcQFYHv8OFB3rDvzPRG87A62mABZT7G9D9d63pq5AqbO4+Wv2bv5mG7b7qrmrmJGKg9KUSOxwv7kgcTaYeghEtMOtX1M4Be2KOBii4vLsP8On7l/dyCM/xnANAUa3SUGUahhW4waaX9maey+rAfxpeFe31ZLiwq324wQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qb2EVWmN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FCAEC4CEED;
	Wed, 15 Jan 2025 12:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736945441;
	bh=V1mKz61FdUoHAGH3dpkETvRbC+klSr1z3HPtcSnP78w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qb2EVWmN8/ZGjzaoFfVhcFuGnVswwZ8MZj9i9+6ENbK5743RiAqEI4L1TZohQFd88
	 C73P7csuPGCBzBd+L9SUEhfNKAcWXkXZtJgWASm9t3cCXL61ePRbmW10ncNY+T7Tek
	 SEBYnbfs3mSALGoyhriJVxzg8ZlKQLy2+WogkU/hsEnUYLecFQdN5OdSMDT6VTC8Uq
	 vzlHXH5YFt4R+L9LZOULxvQ+13+X9CImLM/j+FhhOKXaSI4wqqhjkHhqNZXthxMdJt
	 e5Ztq7zOffaZevk2987D1GjzeRJqdOyLUIW/v7vuqDCPIS0r2OnJ+9PD78AYRyMCkO
	 6j8IeO+RUAALg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tY2r1-00000004yGE-1XDe;
	Wed, 15 Jan 2025 13:50:39 +0100
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
Subject: [PATCH v7 13/16] acpi/ghes: better name the offset of the hardware error firmware
Date: Wed, 15 Jan 2025 13:50:29 +0100
Message-ID: <ddbb94294bafee998f12fede3ba0b05dae5ee45f.1736945236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1736945236.git.mchehab+huawei@kernel.org>
References: <cover.1736945236.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: 81Fq7j/ugMJQ

The hardware error firmware is where HEST error structures are
stored. Those can be GHESv2, but they can also be other types.

Better name the location of the hardware error.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/generic_event_device.c | 4 ++--
 hw/acpi/ghes.c                 | 4 ++--
 include/hw/acpi/ghes.h         | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 58540c0aaf26..c85d97ca3776 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -363,7 +363,7 @@ static const VMStateDescription vmstate_ghes = {
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (const VMStateField[]) {
-        VMSTATE_UINT64(ghes_addr_le, AcpiGhesState),
+        VMSTATE_UINT64(hw_error_le, AcpiGhesState),
         VMSTATE_END_OF_LIST()
     },
 };
@@ -371,7 +371,7 @@ static const VMStateDescription vmstate_ghes = {
 static bool ghes_needed(void *opaque)
 {
     AcpiGedState *s = opaque;
-    return s->ghes_state.ghes_addr_le;
+    return s->ghes_state.hw_error_le;
 }
 
 static const VMStateDescription vmstate_ghes_state = {
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 3f94a5542bb4..983e28505a08 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -359,7 +359,7 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
 
     /* Create a read-write fw_cfg file for Address */
     fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
-        NULL, &(ags->ghes_addr_le), sizeof(ags->ghes_addr_le), false);
+        NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
 
     ags->present = true;
 }
@@ -385,7 +385,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
     }
     ags = &acpi_ged_state->ghes_state;
 
-    start_addr = le64_to_cpu(ags->ghes_addr_le);
+    start_addr = le64_to_cpu(ags->hw_error_le);
 
     start_addr += source_id * sizeof(uint64_t);
 
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 21666a4bcc8b..39619a2457cb 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -65,7 +65,7 @@ enum {
 };
 
 typedef struct AcpiGhesState {
-    uint64_t ghes_addr_le;
+    uint64_t hw_error_le;
     bool present; /* True if GHES is present at all on this board */
 } AcpiGhesState;
 
-- 
2.47.1

