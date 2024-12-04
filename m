Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp24593njb;
        Tue, 3 Dec 2024 23:44:31 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXkybJnxpzaLATYJGfzwFC1UPTMOpXmuQVj9ORAJfD1HRbPlaswP3NQqADHNVeKeJjrhJWMuVSccy8HDg==@linaro.org
X-Google-Smtp-Source: AGHT+IHkRom4LpR9AGJ6iHT2fJBT1wTSlYU+r5WOk/QI2ZnF1PxRbYLKNE37yOshnK6iJ8QJbNyU
X-Received: by 2002:a05:6a20:c908:b0:1e0:d240:19c with SMTP id adf61e73a8af0-1e16539f323mr8949131637.6.1733298271726;
        Tue, 03 Dec 2024 23:44:31 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733298271; cv=pass;
        d=google.com; s=arc-20240605;
        b=fDLpU2pRsYEa2M/MfJlLdJabd4U9ELAdrfmPV2WGlf/2fhI194zGSBKfEBtatDmpU4
         VSypMYPnWrYray9j7XyRBEiz/07A9A2HwPNwrpVPbxFgoBneXYF9HzJfnlrzlSARRrGC
         BWi7GJet+y6g1PRMhSzDdHzcOArOjZvJv5mFPkLp2k8J4psMRzoIqxOIqYyB7+iSnzFM
         XsgOmckKJuNSMjIgdaxJh712axQZcyx+9TIDIzHv2v9mpeTMLP+ZA1vfRniduLZgMeOU
         RbKe4nSkixOpZCtg1GDQDsmRuIHhMD23LtgtsjMqdo/eHR1oj6Uoe7kpo/jH5OmqEUco
         4Ecg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=9nt4KlWOzhCkiHLJ0olSqTWQDZ9CNEkViz2E0+NphzM=;
        fh=6LPOnTcbTsvQ1x6mYB7ZKvTdhCFv5PNp3A8TxpvAERU=;
        b=GYws7pn1J1E4yPHTWIObpmdFOnIcLZCTz7l+ymt7qSMZ3SB5mfD1gCLi++UeuJYFQk
         eUUVFJcvh8T+AqPxFpm7qUEdFsCP9dvliPp9uz5aT9PLuHeQe5UgLbZWJyta6QANoQuk
         RyGMVCM2XnRcUSofxzZsE099ei+9siZFo7fQiIsb7NJBEef99wtIRMg9NnzVuOahe7uF
         mD59L66qagszQYM3XwKldh0pBIvjBgujNO70QrrcvY8EmS+72sJstS2C4QuwcSp7nTsU
         04v1RW4FJ+qk2Kx3KJiAlNfpS3Z6M9uzJdchuLaaKOU9QCscprqN+DwUvS5L2uG0Pei+
         C59w==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=YECxV4o4;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-430679-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-430679-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-430679-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d2e1a72fcca58-72541840c8dsi16039068b3a.228.2024.12.03.23.44.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 23:44:31 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-430679-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=YECxV4o4;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-430679-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-430679-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BFFC285B7A
	for <alex.bennee@linaro.org>; Wed,  4 Dec 2024 07:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FCDC19992B;
	Wed,  4 Dec 2024 07:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YECxV4o4"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D631A18FC83
	for <linux-kernel@vger.kernel.org>; Wed,  4 Dec 2024 07:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733298153; cv=none; b=YqaS2ztvFSy63W8IyuWdsPk5vBkysWRqUPC3l9FJ4HQ3qAkgqEKx2lgJzGhw4PeLTAT8rAHq4Uo9myd5nSfafjoVyT45bTltAyExMI9ppQrLeQ2qRUxFMgUyL54pJGMRHK6LdsCrcPSUMLgYKtSv2xN8UiNZQxEzCFvKY2FSvQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733298153; c=relaxed/simple;
	bh=DZq3ehynlc63lZ3iGs1SNcajfqzDutIBxgWe19LJFlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YBVD95qj4LwfwYhoAZ2SEZjQCYd90lyvKStXx2VewuUAFKg9RPVSCnBE7CSmix1R21glebkkfGIS2WgjKoZtnstJpgd7JiZ0UwFcSoG9tUF6x+c9XKvKEG2WsqCDlpI/XCe+pdiQs+6fSBv66FTnTyLGPy2kKuQSjmiNB+RjDlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YECxV4o4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39EC3C4AF0F;
	Wed,  4 Dec 2024 07:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733298153;
	bh=DZq3ehynlc63lZ3iGs1SNcajfqzDutIBxgWe19LJFlA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YECxV4o4AY+5zzyzQww1VLIUoA/rFeR77HUsq3vSP6lpI1OCW6HJf195bLPHFjtgv
	 jNp1eF5FQuio14fP2TDuMxii8lJ3b0tALlGDEGrRY/te3jSHx50NEHyCRiIySz945V
	 4lqTwmiMffvDlLlc6f9TGFJ/4x7r5wdb1ssEtUdBpa5fuUCLr6KfKYplUGjz7xzZeZ
	 5TeuZA+w9cTXVZwK32on2FqOl6RguAXq5CtpOoqHPXQswb9+G8eH+1wwK7WkgLRDYB
	 3WsRItln7wr3p8e+2iSmTgu1FD1IWIWdQCQhv92uGvv01uVqrqoA4G9duE4z33W5Ql
	 yszxKUCXt61CQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tIk1n-00000004Kjg-1UAq;
	Wed, 04 Dec 2024 08:42:31 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v5 16/16] docs: acpi_hest_ghes: fix documentation for CPER size
Date: Wed,  4 Dec 2024 08:41:24 +0100
Message-ID: <c9a291a9b3fa22000ae100d980a0ada5d6ba9a24.1733297707.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733297707.git.mchehab+huawei@kernel.org>
References: <cover.1733297707.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: XjamtuKTN7b1

While the spec defines a CPER size of 4KiB for each record,
currently it is set to 1KiB. Fix the documentation and add
a pointer to the macro name there, as this may help to keep
it updated.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
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
2.47.1

