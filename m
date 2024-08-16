Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1117657njf;
        Fri, 16 Aug 2024 00:40:26 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCU+q6XezEP05BZTExZfZu2Pd4CzbRBBU3/T598l0wFJMWNMS0AjMoZ2Hza31gPAznnBajUSaMD5nlxGIjD7p559VoCLlYzB
X-Google-Smtp-Source: AGHT+IEcAY0b38F4PN+Oi0tUsVoMX44AoPgEOe9FQn7+h9nqcQmMfjIf9qObuwODiA/NUsdXPjqu
X-Received: by 2002:a05:6870:c0d3:b0:260:e713:ae8b with SMTP id 586e51a60fabf-2701c3a7660mr2297388fac.20.1723794026410;
        Fri, 16 Aug 2024 00:40:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1723794026; cv=pass;
        d=google.com; s=arc-20160816;
        b=ea4IYQXqPyNKTTlm2mJXdLhOyx5lSsQUsJCEDn+hChf/uCfLKo3lw0U7Cy4tTAt/Li
         ehSFwVwpMAx0WnMlyGOkX3HfFEk3El49QFwBWsXlt7DZUsJctUvB0eF3KMXSJI6QqHLt
         TqrLCH4Ut/1idPWLY7H0DAfmKhkv15bIlKEOa9NWq94cOav5/854Yu3aWnpp1P69zRVG
         iyiP4xnjPVpSAvffUeKTmehbJrBGqeZiYAGAe+A4/GMBVAXYznwp3S256uc8f/lCFhQK
         9qRRFvEf2WaFbqFu6U36eSkfXXTV79gyKkvCYrF7JJtNGAnntp1jJIhRmWw5Zg692Li2
         xM3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=oi+AkfqZapq0X66wnZlEwkqzPOdMevouaZE4Wf7zPAU=;
        fh=QXl+txXhD5RE+zdgPNT9jwdt7ujaY2VGHPWLIzq2oqE=;
        b=bEnOW1vU0s4astI9jtvY4E90Uylu5yutwX+kgpV1KPZbchD8HeIAp05PlKjhIvh6Yv
         lTK7HO7c/dMbg6qpJDgItQYGlZKQNFqJVfEqliGNqbELJkKK14zAGVfoZJSIqqycK7PC
         vU1Us7Ytnj8xgnx0P4nMEcpqGOMJhnldP01qczXaOrykXEv2IikjMpl9koC5EU3rYGyi
         IisqKDt5kLJ5Q0CZZW5a8kqX0gTi/SiHAe/KAGL+i2dQsx3ThgVCe0UZCloBslGeYhoW
         rDRI0RgdEzRW6dyst6dU6nhGWG4aLccxAOMjXYqWVTNBDgQSyG+oR6jYELxoszFV5yB4
         oNng==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=iPnHQlGf;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-289193-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-289193-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-289193-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d2e1a72fcca58-7127af4451asi3312688b3a.332.2024.08.16.00.40.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 00:40:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-289193-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=iPnHQlGf;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-289193-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-289193-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D991A288BBA
	for <alex.bennee@linaro.org>; Fri, 16 Aug 2024 07:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3D4142E80;
	Fri, 16 Aug 2024 07:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iPnHQlGf"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21648139590
	for <linux-kernel@vger.kernel.org>; Fri, 16 Aug 2024 07:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723793874; cv=none; b=A+ZNkggZLgVTPW0NVgyJtWfEWnAiqz4bfehVjHGjxwF4CfKJeiYPXZwsU7iqDCrxnPh9V8w/SsVYxVW/0XF7DqwsXHeFsJLF+3sXhEBjePV/cMqXkU6UXFgDm91VtrEzb9qkdDuhE9qhGgILhY86Wm7prJcRi9EJmjErh4R8wK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723793874; c=relaxed/simple;
	bh=LhonfX5szAcii0iSJEisUGaz09LnvbNzPlyCpn2Dcys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u0Xg5f7mP6PdVx6Y5x8sEj09bCJBTfxB9bYfNjHKWgnxKSDTNe720j2yvjIX+8oZ03J57GI9Aouwo3PoVutkqtHA+z0RyrYNZcigILc/4HcHtKlrRM84wyZnrBSAStQKpswHUxDh3AR6Rs6C9l2N14F8mwmtYylfE8X2YTmBbBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iPnHQlGf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73B8BC4AF16;
	Fri, 16 Aug 2024 07:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723793873;
	bh=LhonfX5szAcii0iSJEisUGaz09LnvbNzPlyCpn2Dcys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iPnHQlGfj7oEFjKfob4/34r5CTTUH/bzK/dJoAyJlI8UY/0xZAwng5cD3bIgkVIg3
	 hr77iH6c/9xfUU+KmPlRjCE8rNW7gtOjyfqLibObsnj+t9XSdmDnB5vKvz5qodIP+v
	 8QmnZlFl2tBtAfgddDVja/mOppKyECF8BEmew8KNxrF251yNz7qRRBHxcAcuhMekc+
	 qUvxZ3fe9Jfm/wv7yzR472kBb/uib8zbxyk5vJ2UXQ22P8TyHWvnUxaAvhtD53c0y2
	 Xoi0qY5qc9/oUa7cJNJ0HQw0o3HWs0BHT3wVMO8piOZYHSm6xCxWOUocHrv+nvaHxf
	 wh907YVpkjP7Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1serWx-000000055en-2aTs;
	Fri, 16 Aug 2024 09:37:51 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH v8 08/13] docs: acpi_hest_ghes: fix documentation for CPER size
Date: Fri, 16 Aug 2024 09:37:40 +0200
Message-ID: <e9c2a180d1c68fb114409c9ee5f40b64c332c390.1723793768.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1723793768.git.mchehab+huawei@kernel.org>
References: <cover.1723793768.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: cYRfUoH8s0uV

While the spec defines a CPER size of 4KiB for each record,
currently it is set to 1KiB. Fix the documentation and add
a pointer to the macro name there, as this may help to keep
it updated.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 docs/specs/acpi_hest_ghes.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/docs/specs/acpi_hest_ghes.rst b/docs/specs/acpi_hest_ghes.rst
index 68f1fbe0a4af..c3e9f8d9a702 100644
--- a/docs/specs/acpi_hest_ghes.rst
+++ b/docs/specs/acpi_hest_ghes.rst
@@ -67,8 +67,10 @@ Design Details
 (3) The address registers table contains N Error Block Address entries
     and N Read Ack Register entries. The size for each entry is 8-byte.
     The Error Status Data Block table contains N Error Status Data Block
-    entries. The size for each entry is 4096(0x1000) bytes. The total size
-    for the "etc/hardware_errors" fw_cfg blob is (N * 8 * 2 + N * 4096) bytes.
+    entries. The size for each entry is defined at the source code as
+    ACPI_GHES_MAX_RAW_DATA_LENGTH (currently 1024 bytes). The total size
+    for the "etc/hardware_errors" fw_cfg blob is
+    (N * 8 * 2 + N * ACPI_GHES_MAX_RAW_DATA_LENGTH) bytes.
     N is the number of the kinds of hardware error sources.
 
 (4) QEMU generates the ACPI linker/loader script for the firmware. The
-- 
2.46.0

