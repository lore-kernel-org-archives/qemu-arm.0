Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5249001njc;
        Fri, 22 Nov 2024 01:13:18 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVFaN+JRtcPYpca5fP4TDrq80KDsJGHP/Rt7RHnwGO97VDIPG5JAcV9FG8DwzUFm/VfStnZD/A0bkVQ0Q==@linaro.org
X-Google-Smtp-Source: AGHT+IH/u/adhAwHO/2Ev5q2EST3oJBvvDcZzy+tHLwgU/5Rirerz0RSsDIfwA4j8Z2t01XhMLzW
X-Received: by 2002:a17:903:22ca:b0:20c:d5d9:95dc with SMTP id d9443c01a7336-2129f680c98mr29536865ad.40.1732266798425;
        Fri, 22 Nov 2024 01:13:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1732266798; cv=pass;
        d=google.com; s=arc-20240605;
        b=DzbTejCbsSaKpxaYeXtYaR/a96THMN5p31a0K1L/+nstH1cCBo0r58aNN2CplcyvON
         VbSudqbunY6RVW64/mK+wMCO/IWxTsmXU1UJ2MxtQxdOv3c6qNuWfalOSrB2KEVJ7WGK
         pPmMRXZBHf7YTU1qke/SfsE6eFMOpZlgqoeNnBuDWU2TvEzjPweR3CxdNfhwS6basjdZ
         0MMbIEXGcZ65HAxNPJpFOU0mcVPLkb0JWnV8RoSQsdMKMVI/p6UYgTmd3i3HGMMbBPwd
         87lxzzQSirYvnmlo2fXfokU9X7Dlh9Mma8z2ojxTvtHmsTe6AGaqdhAVyR4sWVcTorEn
         5wjw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=6hQvjDjF25UDCXeVlXJVi/7cUZSlvkBfIRsUrDE1ZL8=;
        fh=6LPOnTcbTsvQ1x6mYB7ZKvTdhCFv5PNp3A8TxpvAERU=;
        b=SUrxy23VL2+ov9pRcaHclHNChkJRj2jM6MCvyU3UNj5S0fS6zxtCw6eGMV+O50oS9Z
         09C91g+io36Y38AfmGFVT6Bffat59eKQUnMiMdVhIHWhafgSMN/Rgsur9ADq9ONfHkzt
         kW9PHIMc3RffWS+0zf70XfhaKv4lIIMj6ey4a5/quUTylQ5+QwlLQjATzTik+qAhVcnJ
         MKstwUNNSMXq99K+XM5jTQp2CJU5wqIRK7Rzh7e0+F/CsgS53BDTiQTeM0zfBPEbkHDk
         393OvxopkHFSLAgjOoy5XBk7O4Y54HEsinni5oNyLcVo3BOeVVQewXb76RzDlOUFLSR+
         /ngA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=jS8pVzYE;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-417986-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-417986-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-417986-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d9443c01a7336-2129dce9b11si19254835ad.530.2024.11.22.01.13.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:13:18 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-417986-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=jS8pVzYE;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-417986-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-417986-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01207283AA6
	for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 09:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39AAD1DE88C;
	Fri, 22 Nov 2024 09:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jS8pVzYE"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1931218BBA2
	for <linux-kernel@vger.kernel.org>; Fri, 22 Nov 2024 09:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732266709; cv=none; b=EvUMi8TnytdMA2ikDunhgM4qwWbbhlI6ctM3DormbRSCNWByvnaGr0e5sbBVM+N2KRc81jzeCdCW1b5xeXozTn647Iv5jlGJ1vnkR+vFrwJeMVFI9gDhoEGItE1MTVaVfLgNARwtDMgZscIPoNUxuMSMUbudvD27Xb2zJTpzNzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732266709; c=relaxed/simple;
	bh=3q4iw0X8CIIZSET8d9LVRHez80oiBXEYI6La10ZBs2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RUr6jSOUsC8RVNxbACO7ag5AhEtZgaeJf557oav+fSUDx4d/8kqcfAfqbnuoiUQ6/aKQ8z3F1NFJp4LlkAvgmTiF8s/Q62wxndLyruwZG76DqajQVA9QYRfONYGkfjpkmpr51h7AR4RsLjJlWm+TMfUEd6I5KoSCgacE6qHuAdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jS8pVzYE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83057C4CEDB;
	Fri, 22 Nov 2024 09:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732266708;
	bh=3q4iw0X8CIIZSET8d9LVRHez80oiBXEYI6La10ZBs2s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jS8pVzYEGdbIOf/LBSWmnly7FTCZTAoGJWxB97Cq7HFPyhat1ohlQdORYAPkhi5HE
	 dalvTn3KTjHgFeLNYUHYUTXhqEGVQX4IG6xEQsJUUPakjtSgjrJzelsh80vWYjo/Zh
	 QRBZJywblfOa6a3nEy9a7kf2m/4bN0iRZz4mwjvuzeBa3aHPV3fuiNpxelHY3D4STa
	 3FH1hbRbVi+QX4/U1UkaJ+uKFlJfsBGSAwvI8HDD34yS72BS3ndyRP972SvVSen6/6
	 2Ld64jsIh6b4/3UNPleUQhVTaOoBE+rkMQ2YXwwogJonp/wm6UPgTDjMkVpWxLah+9
	 gfA5MePoZ2iZQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tEPhX-00000006l4H-1Q5o;
	Fri, 22 Nov 2024 10:11:43 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v4 15/15] docs: acpi_hest_ghes: fix documentation for CPER size
Date: Fri, 22 Nov 2024 10:11:32 +0100
Message-ID: <3bfe6c991d187f48b9c34500be106296b9480059.1732266152.git.mchehab+huawei@kernel.org>
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
X-TUID: IBDCE/o6+Wdl

While the spec defines a CPER size of 4KiB for each record,
currently it is set to 1KiB. Fix the documentation and add
a pointer to the macro name there, as this may help to keep
it updated.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
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
2.47.0

