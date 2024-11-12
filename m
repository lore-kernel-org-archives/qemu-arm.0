Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7224206njc;
        Tue, 12 Nov 2024 02:16:47 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUrhjFcYQ9LQ/h6U9Z1IFT/SnPf4NWem5cP2oFe5BFdGMpjfsTmS5A2OvFt+PoIvAimCenDYm7q+DRnQg==@linaro.org
X-Google-Smtp-Source: AGHT+IF34VZoUx/Nz/xqn5MOxEdfoA+CAkAOtN+89aALKLVdiOnjobeQo+7BGUKeKjNBpTopjaLd
X-Received: by 2002:a05:6a20:244c:b0:1d9:3456:b702 with SMTP id adf61e73a8af0-1dc229a6b68mr18900484637.17.1731406607200;
        Tue, 12 Nov 2024 02:16:47 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1731406607; cv=pass;
        d=google.com; s=arc-20240605;
        b=gEYXvdmCNmrQPdNjCwEfnLGfBT7L1chIItGVm4MSGCAv2YgrovJtzQxvANp5J/XlOa
         iH7/iqZHrOWvj00bEN0Tx0Pn0OJqRK06o8/ggLvXd4z+zGEt350IvhCbKtbj0ZoZYpVo
         FZGy7UHk1k4Xk9bzkOc5jJgjxYAlqADBIE6StMdJL/x/mYSUW4PxuQo94yJNFhxwI35Y
         G3KrAjDHMOjo/WnFHmAUe21DBTf5aGM1abNAA9zUFfqymMj3T59Ty76yPhpoVHAyoSIC
         1iyLmBd+RyI3CCZ8r9aVz92pwMYIQ9Qc3nIuJLKjzjQS0qwdZ3MaEq/3WfGsADdwONQ3
         8o+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=6hQvjDjF25UDCXeVlXJVi/7cUZSlvkBfIRsUrDE1ZL8=;
        fh=6LPOnTcbTsvQ1x6mYB7ZKvTdhCFv5PNp3A8TxpvAERU=;
        b=DX6F37YxkgDll7XSaxGl0Axz9MI8xWq7DAMjqrVXyrDuhDCVNgzmODP6vd98Z21mWK
         18epfb7zUTMryvIvpPnQNxUIaZ9GVHQelrzNd/VYFex2JlDDuS1HD3tgRkHfXmN2bS3K
         u7X2UMOH6xRFLifiJXih/c0vwZRV7EfAxV2w74u0i9y+nkcZIVcuFnIaFpPRwOZlUZ3q
         t4a0zyHP/8K4/POVi+BMuRtcvs+trleBYo3ahno7gIx3mTwvpsP7Zq/4+dwnpF/jbv/9
         RhmJeoKmdAZwT4ULLn+kIUDhbs2WTtO/R1klS+v8koANL24l62hZEPlzqH8YxBlhVdsz
         rZOg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=MmqZTv+o;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-405568-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-405568-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-405568-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2e9e340cc8dsi2077902a91.129.2024.11.12.02.16.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 02:16:47 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-405568-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=MmqZTv+o;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-405568-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-405568-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B585D281E1A
	for <alex.bennee@linaro.org>; Tue, 12 Nov 2024 10:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC9C92141B1;
	Tue, 12 Nov 2024 10:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MmqZTv+o"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8037A2123E1
	for <linux-kernel@vger.kernel.org>; Tue, 12 Nov 2024 10:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731406510; cv=none; b=mDGCKwOZw1Kj1BwXtf5iiUK//ZEUj3WdmJqeb5F9Rj9Q8hHouHyfyxTwXZvGAmKZZcGXLlVJiMszQREy3TwDM9qYZ2cKxTLno00tIFYoqMMPz7EQ/ZH8oElVIPC27SKjmtznVtOMzdz/wEwm9bekV4iYvk0GvLrKGsT5s9hC+ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731406510; c=relaxed/simple;
	bh=3q4iw0X8CIIZSET8d9LVRHez80oiBXEYI6La10ZBs2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G45GWeeZe4RcROPK3TG12q8XVHbxdAThXAED/G6ZajeqbRGLMkw3ccrBsUMSZSF/nnJzEbJlpDe4hFRXBe5a/zJ2lZPRq7OiZV+PHSPld5CU8/SbNHPP+Pa6/LH9w9YuMnFfxgVWAAvnmbs0E/CVHCnvYnxeMSZeMFQfDiu6hkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MmqZTv+o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7B59C4CEDD;
	Tue, 12 Nov 2024 10:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731406510;
	bh=3q4iw0X8CIIZSET8d9LVRHez80oiBXEYI6La10ZBs2s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MmqZTv+oK5ggXcxbbPaIytID0MnR9Z2nrjYzXB3+wpepvmvSvgIonMh8zC7xU1vjy
	 OSKV2ifImFEeH3hp69d10SIfmX0CtriSBEmp3FM7PUgHJgXX6rhPZetvTEnabV8FIs
	 JWXpR9JlGNAE0hx3N753JEFWtSvNAkZ8Dg3LR8TDmRayt4Np1xO+uswWokfyTi3X71
	 86Zm2TDGVhCBse3WCbFXYzflLzFrubZEFtuDwmtzoz2+EHaFtv1w5QFf8ONdQq7NLr
	 OgtEbmUg+ZVtcBOTH+MWdvevmouuLwrKL1usDKkEiQmI9arsBGE30wnquPPYb/pvE0
	 RDjWTM5mW98nQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tAnvP-00000000JdO-1ULZ;
	Tue, 12 Nov 2024 11:15:07 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 15/15] docs: acpi_hest_ghes: fix documentation for CPER size
Date: Tue, 12 Nov 2024 11:14:59 +0100
Message-ID: <817b8a3146385c911de003911ebef922ed397839.1731406254.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1731406254.git.mchehab+huawei@kernel.org>
References: <cover.1731406254.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: skIiXnJddEnW

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

