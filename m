Received: by 2002:a05:7022:698c:b0:8b:e46e:3391 with SMTP id cj12csp65241dlb;
        Tue, 1 Oct 2024 00:05:46 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCX6PPWtkkMbmU/ERXJ2OJwMx1bWNGHsaSXnyRHKZH0x5oi/gbcGZD3tMW7+cCvexL0Q9mzH24h5cfNTUA==@linaro.org
X-Google-Smtp-Source: AGHT+IEgHiV1jvW1NVc+XsmdK/C+i8BQggT9tP1dFvksxrf8RytuXQfu/lkeVdIgbKLJ6dKxQkTl
X-Received: by 2002:a05:620a:4496:b0:7ac:a0e6:70c with SMTP id af79cd13be357-7ae378dc8d4mr2133649585a.60.1727766346168;
        Tue, 01 Oct 2024 00:05:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727766346; cv=pass;
        d=google.com; s=arc-20240605;
        b=horxBvFSNHlEnFRLcXHZsJtyMwE8+y02SxowjSSJyk7YFyFAXU7kjHcubQZWu3H5ag
         S2ljJk6gYv9b6+f6+SmUAHnnrA2PxqOWwOpAZGXLBCxhVl+mbxAO73FeQwOVQruQVaBA
         7G3L0zKk3LzpfjiAzvn/9S5zL+e2n/yWYwETz6tzqhKSiR5BzNbzelx5ykoEvlG/wH0B
         FwpNPfiCegdfYbqyV9At1FCInDr6j6Xi6d6tmZyZ3t+PkrUsV2rFncMeJsK7L1DLKL2X
         93WHZlnrSrbidfvo0bsDiMe6zwpLVy5+tRoukV8mB8zFZnyAtEH41YqF2Sow+njMWLlY
         kXsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=B9ZfS91Xmoy4esdwcBsJ6pgcCdpBaCxmt/BtRBB7+GI=;
        fh=8V+a+TSi6njESsVevA5NPzncyETEiQNxW1MTRf5cXDs=;
        b=WC7TOKt2n153jHWrhRmf0oeAWZD6nxVTKzBXLB7qFBRG0nn0jTiaeylvZ8wYm0JV9Q
         7o4rq2Zuq9lDBBmiPFVyZE7/YOCcLEd3p+/qyK5XBTwMixtZXovI+sPN1BFJIGB3e/j6
         XogGu1uTrq4ksBW1phVGF5WBR9gy62Z9bLl22LJaKqmCoTfIwOiaLWOYb9HTQc5m/Hr0
         dW1rmWOOmBt3jYBG4rpSOlueSiJEXriTAYxxW8PLuMwbqLpBd6hmQs4a/iwQ2hPLG8Gy
         nvxDmwb/uXIJBGaBwsHZ9D0tDIry70/HOxeJyMkSkUY5ff0qhFEcL3U3zJK4TfpAtO3s
         6fVQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=IGsrzWfa;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345364-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345364-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-345364-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id af79cd13be357-7ae3783aa86si1018504085a.260.2024.10.01.00.05.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 00:05:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-345364-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=IGsrzWfa;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345364-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345364-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEB271C22886
	for <alex.bennee@linaro.org>; Tue,  1 Oct 2024 07:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B4741BE856;
	Tue,  1 Oct 2024 07:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IGsrzWfa"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2021BD51A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Oct 2024 07:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727766252; cv=none; b=qzmK1c61sPbLySCw/cruzmQ08E7e0JtFlmx4d8XBiOeSNoa0+lKGWP3EYe/bVGtRQeCjWYkdZssNYyT2F53aJG+QzCOfAAMHUnwqcsah2OKvCAObQ8rKkwc75hVpY5Md0CybmSA73Nm2yPCvzLd7TWcZprTz18T72Wfm8fsXcVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727766252; c=relaxed/simple;
	bh=bZBTFsxaIkRHKH/tMfUarpWye8vmGL/o69fO3i5EElA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hKpV/OfSe2LzpjKkh0hiC2dkFTjJs7bA0VFFALc6zmgw+P18OfkonutvCTFDUyG242kTdAPlW8PS5oDRryCsKIxpgCZjG6LzHJT0Sy094IyJjzpGbJtlX4FTkL6wX1vynbOuVsXSo+HF8hvVGAuldIb0HYGQpUso8rWzVa2TtRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IGsrzWfa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AB54C4CEE1;
	Tue,  1 Oct 2024 07:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727766252;
	bh=bZBTFsxaIkRHKH/tMfUarpWye8vmGL/o69fO3i5EElA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IGsrzWfajA9Mf6z3n5LvEQ3g9cBwTF6hVuULNaoOMuE1pbu3OfussfwUQLdWU/K0L
	 cEZTiYIWhnu4hJ4gp3pprr0EvX0TZxtx6PFHDbAwk0VRBW38y5J/4vudvA0MQEFMOk
	 wZKVvY7a6qdP1mwSr2cPYNLuu0XLaDDJMmpHOFh5/y7JPqVvjE+rF8ZslUXjLH5gAm
	 WfDSBg+TQuIcFWmK/nS2XbyNfxHvjDu/UJ0ACoVOAKaVGknm/F78BVIHhuG5TuCgRW
	 cKpGr4yG1+e86KtVELRvaP44WbiSrKTwk9+1emeo+IScaAU+u+xUQ/Wgp/mLiAu3Uc
	 flXPGiD2GLxbg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab@kernel.org>)
	id 1svWvY-00000001V1L-3xBi;
	Tue, 01 Oct 2024 09:04:08 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v2 15/15] docs: acpi_hest_ghes: fix documentation for CPER size
Date: Tue,  1 Oct 2024 09:03:52 +0200
Message-ID: <1d2c5d8dfe077677a1a45558c518b4e58f77e830.1727766088.git.mchehab+huawei@kernel.org>
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
X-TUID: HesKUh3K5NPE

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
2.46.0

