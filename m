Received: by 2002:a05:7022:698c:b0:8b:e46e:3391 with SMTP id cj12csp65127dlb;
        Tue, 1 Oct 2024 00:05:33 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUgBCZHczx2QhSV5UmibTOvn+jmbMVrnx+As/Rn8yLZBBsLThDNBEeU1CLanQxpVBdU5PTUXWBrDBK9XA==@linaro.org
X-Google-Smtp-Source: AGHT+IHzNQ7glLlFPa+uixI2IgDNp8O5A41JVpuaAchMgA2KrPpZve8Rg8RxXH6peIhAk3faAVd/
X-Received: by 2002:a05:6214:5404:b0:6cb:7396:ee39 with SMTP id 6a1803df08f44-6cb7396eee2mr30032196d6.20.1727766332899;
        Tue, 01 Oct 2024 00:05:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727766332; cv=pass;
        d=google.com; s=arc-20240605;
        b=FaBPxIzfjoUUvaWF43k80CBTqC0GOt5RNnXzcKxzxBiHAiaetIgZ/vEsdoGi+8gI6x
         vmNmiVsci3JZCA/glgJLAK9Cec4VDLQE6Hh4NdEgHNF9Hkf1JuBaO/LnCyhZQRd6Pe6B
         LefNZFTlGD1SFt1zmgCurYq7dJv1hZcvWQDSJ6ezj3roa2/jPGT3ZToCnT/aCYoyJflM
         zHURt7YzoNEYSyNNzoNN0g9LN06vhSGCSoT9upNVeqvLgjmG/FJLQgmsFlVvtK3COsHQ
         PTxWs+Q+7A62N84WWSuSaiA0303jR6pYzO1mo03ujFaJNfA8nwRkSd69MhTqmBwjUJHD
         6k3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=1fPeVkI9Fac+a8baNKYkH5k9C5SH2HqK1qUS3r0L2BA=;
        fh=rzGDMRJFBBrjbOaW7dLpUOdm+9c++WP8RCbD+hTQXmk=;
        b=ZST9t/kZGLnKaTyJisoEIO4La7/r/eVFR/V/kP8bTVZ7uh8uG6GPiRhUcZxU077cYL
         wzl9piXfzy9UGwvRwEDh8NFZlQK5QN+kqrVk3+rbtqqDC3IdFmIhPqTxvg4cmRWH/rxx
         Y4HAEwsVsMrwxoh6fbQZvbdrWYYfgHdnzYvpJQcrT7zHAwl7nhdVNmqPyzZ/O2p5LJ07
         6Zx7vDb5WWS5BGguiO3VqvqCsXtrYsvh08vpC+KLoD64hUaRebP/FEOJ2uTIFuplnefH
         XE2+yVQa2FG/elvZksgzoNlgW4U7o3l5y9+/fp3aGaJpa2fyJKboX8KXjFEg9U5AP2tP
         p9aw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=d7mD9MOw;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345354-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345354-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-345354-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id d75a77b69052e-45c9f2be58fsi101420091cf.183.2024.10.01.00.05.32
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 00:05:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-345354-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=d7mD9MOw;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345354-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345354-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88ED21C22C00
	for <alex.bennee@linaro.org>; Tue,  1 Oct 2024 07:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA701BE24F;
	Tue,  1 Oct 2024 07:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d7mD9MOw"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AC31BD000
	for <linux-kernel@vger.kernel.org>; Tue,  1 Oct 2024 07:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727766251; cv=none; b=BQXSo7Cp/0ymGzF3vtByHT06DRS9nzfa+Yimpv7p9rsd+6MTszVcfRg1A2r6fqLQ40LPLaIp2n7rTFEcWNfn0+hYBJpmR6pkOTJnxCfbnEEs9ra9M2FSg/3D0A4gHCfhSBDJ+Z/uFVoTq9ur99zKI4Ef0zK0DDU9xdp4akpq6iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727766251; c=relaxed/simple;
	bh=TwTF2mnhrd+9LftrnNkLoqHQQWwH22SVS4oBsWanv3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EICvJttiKIea47G5VuX/sxUmI1qnbT7iFPJHsXOaI3Q1w4xoRLzuA5NWQvLJexfQeXSlEY6SW8I9Ps6jsmC0wWcRqkdCmtqFbT7wjT0IDTdw/pjDwqIK5GACgMlH/kYl4++4jaUfxtqQcZuxXbW5LgkcNaQYnlr8XrVSy2EZtTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d7mD9MOw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AB2EC4CED3;
	Tue,  1 Oct 2024 07:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727766251;
	bh=TwTF2mnhrd+9LftrnNkLoqHQQWwH22SVS4oBsWanv3s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d7mD9MOwsa5ipXDofPPxEjhNFI5X5uGhhytuBwP2hSz373grn6kQB4pbQxJsshlKh
	 T+059G+HXCwJyyW02powSBX6ZqTk0AChuTNGRMp3j6ihEZjIvh52zmZX6+RDeOkyx7
	 0qrKdbXTRKzC/xP1EYrEi+opfTwseU3Idw6D95ClVvomdOo2L4AuANytptXIUY8T9k
	 bcdepUw0qozJ8ZGI47V2yUB13PQs6xJVicmsq5jNonQx1E/O+7045hLYYxNhcOYeTu
	 Kmy9pgqORmM4vHdYWn1a1kjLYtdFY7rPnvCs5ZHAJI7AMy78qHq9lWBLs7Xg/ZQzIu
	 TwotLzXEUkgYA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab@kernel.org>)
	id 1svWvY-00000001V0O-1IkM;
	Tue, 01 Oct 2024 09:04:08 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v2 01/15] acpi/ghes: get rid of ACPI_HEST_SRC_ID_RESERVED
Date: Tue,  1 Oct 2024 09:03:38 +0200
Message-ID: <c1514e6bc32eb9bb407ebc94e3dbcea4da5a5438.1727766088.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1727766088.git.mchehab+huawei@kernel.org>
References: <cover.1727766088.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
X-TUID: aAl94cuxZt+a

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
2.46.0

