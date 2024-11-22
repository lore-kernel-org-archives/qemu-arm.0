Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5249086njc;
        Fri, 22 Nov 2024 01:13:25 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXQS+2/7wr1LXRNHNPOLdB4rIpo1KDX7UALcbWdMEt9jAK5btxE8coCD+9IfklJLBVUu9Tnm1uZMJgeyw==@linaro.org
X-Google-Smtp-Source: AGHT+IEJh566veczgOy0+540bgxlxwYrk3AUd13FuNWjLJ/nE5HFkAL4ozOck6vAyOCTzdRjD8aV
X-Received: by 2002:a05:6870:6128:b0:297:28ee:8d24 with SMTP id 586e51a60fabf-29728eeb040mr1425560fac.42.1732266805353;
        Fri, 22 Nov 2024 01:13:25 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1732266805; cv=pass;
        d=google.com; s=arc-20240605;
        b=D3AMBzI4bSshPW2G/iX1ndqzI7oQ/qdwTdbr0hdYhvBPLi6kfNGKYPauJuIBy5mPpR
         pllq+qhDtr5hc0QplAM5d10kXKvkgzRZm2GzSOvKzw1mgf6552JtDrOVVWrlYYa2Flmg
         /oe4GXSlqpMbPcLkPBIVnRYL1yMsb9XeWo3T5aKZjrDB+Dv0bOagP5EeLJEJ/qMB7S2r
         9c4z/+R3QFkT8h27fOk2RCrowm+5EJxh3SDlbD2t3EVdz3d0oBhYc5f2pBfIvpCAMGfa
         9EeSUJugEiOnWrwK8FJlTp++JjKsRsvS4BAJ0Jv7J9bhPLNVbk88mxlLuLaU1lvbbbxN
         xDWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=9KD47xPPQPoZmBs6zXPg1Md4lZegPfNtfPWkecqusNA=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=UebaHfiCzoF3lMGqaH2wjApbRU9BBHypd32FEYc4Ty/ncTq5QbzfbGfq4J9woCgMQt
         WtmxV/odNce7Yy/EEP+d2jYenRRCDJFUvQaEOTZWAi98BDpDXxojnjyLBFNveNMtglGN
         mgYeJC7mi7zzKp4HQ43Vli5aE21Uh2u8mKR0fwvqfCenPrRvDaec74tUHVPpQRgd2R0T
         pV+lvTNuM02ysXrqae95ucYXp0yk+1a3j1T1pNc+PeGXkSf6tkC/xlIr9lHYciMPl46l
         rdm7LiymttugV3lieEq7PIvl7KkmIRcbISZZxdGDPjp15nvEJ0uA0aLcpOokcJUfx+m6
         cNMA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=eqBfwoAv;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-417990-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-417990-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-417990-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7fbcc3eacc8si1716810a12.364.2024.11.22.01.13.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:13:25 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-417990-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=eqBfwoAv;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-417990-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-417990-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47759B22CD3
	for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 09:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5215C1DE89A;
	Fri, 22 Nov 2024 09:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eqBfwoAv"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AEB1DDC38
	for <linux-kernel@vger.kernel.org>; Fri, 22 Nov 2024 09:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732266710; cv=none; b=T7SMX74QVzMCmD8y9VquACgEs49Wlm5drxd744trHzCnaxku0UdtFHtGZk/TOCwZ/MDbwXy1Wq3ZVAyn3tgANc0PYoW4PyA0IKbL2nagKgt90vIUPtAGaGRGkxZOfzDhRVhz5pqNs7e71L3uOUFx3fDqhnN82WWmFSUr3O+D9cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732266710; c=relaxed/simple;
	bh=QJ/9nC0AC0LVeMW5CIbUqcXtgVzZi7ledKJv1fQ37fc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a2mmqCwiBP5R3taD0hVn+Wgc1my+U0wsJArRPZaNl4y1wdjD42VlJPjHZIKxIZXwXsgVvYEwBo6tb+voW7p42WqcLS38m0rSVou03RYo+DDuejYyqCtyBXAA9VJukQGFhDm3PwmSo+9v4h9sR40apx9XxdYrxJBMLRpe1tlpBFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eqBfwoAv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEAA7C4CED3;
	Fri, 22 Nov 2024 09:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732266709;
	bh=QJ/9nC0AC0LVeMW5CIbUqcXtgVzZi7ledKJv1fQ37fc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eqBfwoAvumZlfEVeo/fHikPFbd7YCqqtki1FECoVXdoLUxH0mSfU3KVFzibF75Idl
	 9fB66XbRhO2Ap+QX3bpPdNliIoaMTvvE1LTPrA86ZyIt3iHSCFUkGSlC6RO0ZSeR1v
	 wmExPU9gxKumGEaHjybIPYRzG8J5tMfVxFCwMbSOSP82e/3kU7X3XbvPPva0XbRwiM
	 0ZiZljb7v4VD0MP5IdPxPJ9O0bzwHtsXJC/aPDdwOjukQvDUCfUERDrMe6m0dl6H74
	 Bm/q1B+oEQPVnEXVNxucOYVGpembhcWjpgEVgIQDTqUThLUir7bn8PgNGh/v4sdGx+
	 C4Cgpsmxe1pIA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tEPhW-00000006l3Y-43rl;
	Fri, 22 Nov 2024 10:11:42 +0100
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
Subject: [PATCH v4 01/15] acpi/ghes: get rid of ACPI_HEST_SRC_ID_RESERVED
Date: Fri, 22 Nov 2024 10:11:18 +0100
Message-ID: <9190c5106ac8e99aeef69a155b393c90ddd97d97.1732266152.git.mchehab+huawei@kernel.org>
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
X-TUID: Oi/iGyWE1MF5

This is just duplicating ACPI_GHES_ERROR_SOURCE_COUNT, which
has a better name. So, drop the duplication.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/ghes.c         | 7 ++-----
 include/hw/acpi/ghes.h | 3 ++-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index e9511d9b8f71..dc217694deb9 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -34,9 +34,6 @@
 /* The max size in bytes for one error block */
 #define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
 
-/* Now only support ARMv8 SEA notification type error source */
-#define ACPI_GHES_ERROR_SOURCE_COUNT        1
-
 /* Generic Hardware Error Source version 2 */
 #define ACPI_GHES_SOURCE_GENERIC_ERROR_V2   10
 
@@ -396,7 +393,7 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
     AcpiGedState *acpi_ged_state;
     AcpiGhesState *ags;
 
-    assert(source_id < ACPI_HEST_SRC_ID_RESERVED);
+    assert(source_id < ACPI_GHES_ERROR_SOURCE_COUNT);
 
     acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
                                                        NULL));
@@ -407,7 +404,7 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
 
     if (physical_address) {
 
-        if (source_id < ACPI_HEST_SRC_ID_RESERVED) {
+        if (source_id < ACPI_GHES_ERROR_SOURCE_COUNT) {
             start_addr += source_id * sizeof(uint64_t);
         }
 
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 674f6958e905..59e3b8fb24b9 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -59,7 +59,8 @@ enum AcpiGhesNotifyType {
 enum {
     ACPI_HEST_SRC_ID_SEA = 0,
     /* future ids go here */
-    ACPI_HEST_SRC_ID_RESERVED,
+
+    ACPI_GHES_ERROR_SOURCE_COUNT
 };
 
 typedef struct AcpiGhesState {
-- 
2.47.0

