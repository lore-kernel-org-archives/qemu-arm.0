Received: by 2002:a05:7022:4195:b0:8a:132c:44a7 with SMTP id i21csp213934dli;
        Fri, 13 Sep 2024 23:15:35 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWhuAEnqihN0YkbS/ndxq01TTfH9EnEplvCEhkp4r8/mRZXE3SGnsxg0fvgi4KukN+S80c97GQiUQ/BxA==@linaro.org
X-Google-Smtp-Source: AGHT+IFr4W4qLowCmmS0IYf8Tk0IsxH4u1hTm5WTMvMlwGseCwrr3oh5UqVSjWVNssEKC7bKaFwh
X-Received: by 2002:a05:6402:510b:b0:5a2:6e1c:91e9 with SMTP id 4fb4d7f45d1cf-5c413e0a3a5mr6828465a12.7.1726294535459;
        Fri, 13 Sep 2024 23:15:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1726294535; cv=pass;
        d=google.com; s=arc-20240605;
        b=S/J+yMlZR//CV43r0SznizwqkNK8uTcGnIgwCwYme6K2EWup+iuzy8xvpLnYfmc2u7
         lNN1F49rXg5o6MNQ1KnH71FbNszXJiPaFRAOpICygO1VQwN1T04hVXIKaTNKPIFE7fUR
         cJheYVeaWAfxHC32v8zK4Lpq7jzvrbDlWp1hGptKeXB13868ktECtIRBuPwT7TRsFuqJ
         Gc2mFE4G++AeMxm5VlKul8DIDkx7XJGcmSfuPvE00MPRFFRwVFLIWYRxYIefyUxKInYC
         fZouAiWQbmktvRVzGu/ZcFBPODQ04+ra0nMLPM/f/J7Od6Ztx3+MrZkedciHzcWVgtK7
         jC3w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=oi+AkfqZapq0X66wnZlEwkqzPOdMevouaZE4Wf7zPAU=;
        fh=6LPOnTcbTsvQ1x6mYB7ZKvTdhCFv5PNp3A8TxpvAERU=;
        b=f+hikKcVV1H05w6fiThKc5ARqtgny28805rRhj82ji48XbqwdX+AwNImNt+f7JkmnK
         iUxEsFQ4Cx9PHbofdJRhhoDEOioGmcD7y/W2y9i70U2URN/vXe8yYUIhXOmCjLPC58gz
         cAlZl7Mnn1LbU69+GtEujCIPPRJTNllAe1rACx8HY0MCvtr7Wthgg2ytFohUjH7jzgIE
         RwLn6HPDhWCWK6OcCYzkMYFFKSpMdGw1Lnxq8S6um+05PURiomFeU1ac8YK6lwICvj+/
         dsuciby1De3eRVRQ8UKqTy15p+eV86knvaofrxovFxkWfJDAKckJqEwEevJ81GZT28vi
         pZ+g==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=pyASSiyx;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-329169-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-329169-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-329169-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5c42bb50bdbsi543078a12.91.2024.09.13.23.15.35
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 23:15:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-329169-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=pyASSiyx;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-329169-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-329169-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0478D1F21702
	for <alex.bennee@linaro.org>; Sat, 14 Sep 2024 06:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1AC514B07E;
	Sat, 14 Sep 2024 06:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pyASSiyx"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C9A770FB
	for <linux-kernel@vger.kernel.org>; Sat, 14 Sep 2024 06:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726294434; cv=none; b=Rse37uDk5iMsAiJXaiHJKgz3hEW6BUG9EksPubdH0Aw8MYun15mCp7hx0Mle0O5wSde/LLxWArYDrWT94wWCydAxn2HbrbYAydd/gFRLWCEtmmSRDPsdNdbEyseZXf5bvSEFtAscacaEHKEinKGA1Qw85Y1WfWWPXLO/cinIQz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726294434; c=relaxed/simple;
	bh=LhonfX5szAcii0iSJEisUGaz09LnvbNzPlyCpn2Dcys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I4ZfRzMTae7glRNF3al6YIs0YzOP7Jj5dARtE2qqaH3DR2NkzL8tyNr0jlMqLZJ6CcQwuAXo3DS8x5b1iiqxlTpH5kav5zI4oVZPdX22Y5c9TYmzYr1KmaHY8jSV3xTeXZ6nQsLfX65gYwx04F5OMi7NVbbArtpyvlUmcWlZ3VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pyASSiyx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50EC7C4CEE8;
	Sat, 14 Sep 2024 06:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726294434;
	bh=LhonfX5szAcii0iSJEisUGaz09LnvbNzPlyCpn2Dcys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pyASSiyxXko4KQL9eCsQhYFF4S1a6HBpMBDj+FRQhwjaH0FTAcZm7rR5ggIsJL5uY
	 eJ+ECXL8Vmfv86xI07m2DTJpzjhcb76XK8apqva8CUCq6bxJVlLNX6Ac8p/6tPVT+e
	 +XnJbMFGjk38sQkrullIq5sDmQpixh67u+ttwntAYdDzPpZPeFrrIRz15UVuHhbuNV
	 cF8PyTFutrMcMQRVnxdQdl7tdVXT9VQWsRkW2bClNSSdzuuGb4hiGo0NWryfHZ0p8B
	 4uXjQQtIrQu17weiZ15LLBmKBRQGIoKWTmW1wiAIH6b9nryx0yI8i6gavIYbjTk+m6
	 gHAVvvKmnkiNg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1spM2a-00000003V6Z-1il8;
	Sat, 14 Sep 2024 08:13:52 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v10 18/21] docs: acpi_hest_ghes: fix documentation for CPER size
Date: Sat, 14 Sep 2024 08:13:39 +0200
Message-ID: <025e8d78625cd9a4a938e154bf6b7e2d5ced1c76.1726293808.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726293808.git.mchehab+huawei@kernel.org>
References: <cover.1726293808.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: df/wBos/m26O

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

