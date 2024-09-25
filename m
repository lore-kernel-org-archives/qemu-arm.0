Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp94606njb;
        Tue, 24 Sep 2024 21:06:21 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCU6ay0vh7jhAdHceslq3uwwQ9WRqCxEy7mbxUycEDPPZPRrqC2xbqsyAYJSev1Kq6jYK16+x1M5mhsp8g==@linaro.org
X-Google-Smtp-Source: AGHT+IFYEz9fNBJfFy+tMLau2OGXD0tg55XLgMWITOE4PUFwgP1aNxmTm7PoaRHb/JHLWGZpOTaL
X-Received: by 2002:a05:6a20:6f08:b0:1d1:19fc:8ae7 with SMTP id adf61e73a8af0-1d4d4b860d7mr2257997637.38.1727237181057;
        Tue, 24 Sep 2024 21:06:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727237181; cv=pass;
        d=google.com; s=arc-20240605;
        b=bh8eV0qdQLQFVRIV6zpPXrZzYHINNOu8jf0umKjudTM+qMRloiGwi/xqjaxg/BGzQl
         OVDsUOn2IW83aiVrOuENkXLja8Y1rtAmCWWjgpt1irUyfhSFuuKyjeiN6vxLn3zQIXo1
         3R8QJIOOxu4YWyU27fQe2Hg9aLBvw7HNWz98qjVLERf48R8uzVqEp7RTYUyFlzMzum0w
         NHEDXy09qyl9/k/wqMeNqTi6DAsN//V4oljM66ocO6+Zkfd8n43mpTB0h+mcJs2PqcsK
         56euW/ZTCGGt4DpSoAGXG8pVWLPUMlWyrK3zhRByT9KKnWuZrIEHYRQELMU5wH2R3t9/
         r/Cw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=JXQha5fjCarEf4JQbe1urYQw93FOFJiEMREgmZN9aTw=;
        fh=6LPOnTcbTsvQ1x6mYB7ZKvTdhCFv5PNp3A8TxpvAERU=;
        b=SpH66C867EiKSZU31rOd/Id1cMjq7BHBQJfmNoISSLOi1/NrO+/mPzXDmTvPMssihy
         L/9ifeUNM9pH6JFZ/mmPtXeUo0IodKn/sKRf4ualDc5XLV/MBH/98Og2XidUyfLftVju
         M1C1HwdwTXOS9Jncj0ZoT8TkJASGed4b1nCGUVnWxfjL4f8f4/mTLVEXmS9q9u7SlYx4
         madU2/8cAYqaPa2aF3yukt5w3NNgRXE7AzvJR/7T5mjEUVcnU5G6FatgGoZTnoDhPkt0
         DTzerjjnxnWgsY9wMOiEEc++DVdtYMqMRFFeEkaBslAe4a2dtF6KTnBWIF3ifj/kLd5M
         mRew==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=BSYNnVFk;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-337982-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-337982-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-337982-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7e6b7c445e6si2980424a12.150.2024.09.24.21.06.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 21:06:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-337982-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=BSYNnVFk;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-337982-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-337982-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96135281178
	for <alex.bennee@linaro.org>; Wed, 25 Sep 2024 04:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE94157469;
	Wed, 25 Sep 2024 04:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BSYNnVFk"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91B214D2BB
	for <linux-kernel@vger.kernel.org>; Wed, 25 Sep 2024 04:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727237088; cv=none; b=WomFReo2bZs/4q/yoTMf34b0bIB1FCIFi9XwDQ1iov6XGzhfw3OVF2S7/D1Dxg0cLKEMHDhGRqIST1ULGNEd0VRfa3dUaFdGrpwTIgFtkrkw6ugbypbrDf5v5489uSqfEOFEigr3tE9qZ+Mo+lMeV6iOm1FBQQ5nJBNRBpbvbj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727237088; c=relaxed/simple;
	bh=KpPfWeFVL9I1pGqXt68avBh+cLPKBq8f9RqfgLUmWPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=omIAkixMOm1p1B0J55xT9CAJb7+Vz+GhBiMY8aJOVZnjdIyUKulOUWt9b8xzUyNnEBMi8ur+5xan1ppuaD2U5604iwaqIRv9dxk90/2IOg5MGifb3w7QFcJiw8ed9kNrPmvXFHhEeHhRHaasba2EFdvUisfTHW0ipZWPNAPNsN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BSYNnVFk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30403C4CED8;
	Wed, 25 Sep 2024 04:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727237088;
	bh=KpPfWeFVL9I1pGqXt68avBh+cLPKBq8f9RqfgLUmWPQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BSYNnVFkHyi56KbIq1Qi3cIvE1rRqscX370j3bu8jp4ULJovkifd4bg0zcd7hcQZm
	 ApgeqCBFs+cMKoGecw1ZOElA//vsq+mYQHdiiX+IstUMIEOy7HY1tV/n2bnBtjvPVC
	 XsjZlEdK0wmjt7RUi1oaS9wd4EsmVvyqdigts0BTmU3ZI8maHVjUHvnfCr+/Znw+ym
	 mYpAHJAQjCm3r18BC2DHZ9bcd1zhAfm7yKJcxXxtvNT8gZGsI804Hdiafq0mQ8Pwdm
	 2rMD3vL4LO4lw2mLMGwjte0WIp7SIme/H1T/4q9pqQPb8b8RB4VaJQjVPP0riMVNrJ
	 XkSErS4x4uhlA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1stJGg-0000000828b-1sm9;
	Wed, 25 Sep 2024 06:04:46 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 15/15] docs: acpi_hest_ghes: fix documentation for CPER size
Date: Wed, 25 Sep 2024 06:04:20 +0200
Message-ID: <f6604a9dba8b5dcfe4e21d1f2a8b68ad05b265f4.1727236561.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727236561.git.mchehab+huawei@kernel.org>
References: <cover.1727236561.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: 4jiEbhP1L6QO

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
2.46.1

