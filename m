Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1015107njb;
        Fri, 6 Dec 2024 09:24:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXfHo1yV9e7pL+6hhrJ0hT8/AtCsrX7d5CXNyIZ95aJZysckg4Botsm5fB8RKEUJc7g0F+pJX5E+cG+5A==@linaro.org
X-Google-Smtp-Source: AGHT+IFSIZTP/e9S2g2hXs8D/KzLZ7uL0Jb5vS2gHbt650Wix4DpZMerSePz8yIemHZyL94BsBGQ
X-Received: by 2002:a05:6214:20c3:b0:6d8:6bd7:5710 with SMTP id 6a1803df08f44-6d8e7202e21mr71271516d6.41.1733505867158;
        Fri, 06 Dec 2024 09:24:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733505867; cv=none;
        d=google.com; s=arc-20240605;
        b=Jgxqk9z5rTn9cVr8UxO4AzVh+DIsR21FsUHo02EEJpUp0uF5KKCKKZEYTMVMPBaB7Q
         Inlb+AZhA+ifPI2NK29P7S5ruQZ6Zv2DZmE3KDr7X1qW533P/HJgPkdlFszKTFhMrgSY
         05WzKl3Qx0T2a4Lj2AkaHtd+zjVObuhNr0ukTizMnSzoYMB9BQ1dAVp9shcuN3YV82IO
         Cs9m3mWmPfAF3PC154d/SIcVh3lUfcgvOhuZBaL6AmQ+okePeruuN8eALGFu+Fn2FRuf
         s31PfRnch6hpadM2Q252SA3LrUf4bQ/vh3S3jwTSOLcRmtdFA86Dss3+ZI5wj8evVeWg
         EA9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9nt4KlWOzhCkiHLJ0olSqTWQDZ9CNEkViz2E0+NphzM=;
        fh=73c+dtNzaFRVpvsBR36BcpiNmJ0taGeotADmghun9vc=;
        b=EP9bZcr6RkIUlCOlq5XILpLxT4Ej8qfiR+FlcIyZdpcAVCxU5uupor4ql7NPpqXymz
         BdRXrrqnODvY1dXy7OLmkHxZnE580IPbVMuggSvdLZvHdoI6eTWhpzfjecR5cgkorxVO
         PRXVrDXKChZw+mUMCZ36mVjqjTNtqlr6avBFnj+mBGhDeiSff4Z+VT69x9seoNZh+j5t
         rzDjrtHYKKEFOp6Uewi2Z6N76mndNJd8/ewi5LWA7myEWuBpgnfdLFJSLqiHx5TwKY0u
         lgEB+5IwpwyCR+naHRekWtfvh+3339Aw/As/PUbqSAI5CE6G3MyIMifymajnI+0sL+91
         PClA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=g+RyoIW8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8daa0854bsi45762026d6.248.2024.12.06.09.24.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 09:24:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=g+RyoIW8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJc2w-0006jW-Oj; Fri, 06 Dec 2024 12:23:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJc1S-0004FB-2y; Fri, 06 Dec 2024 12:21:46 -0500
Received: from nyc.source.kernel.org ([147.75.193.91])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJc1P-00010s-GX; Fri, 06 Dec 2024 12:21:45 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C9B47A443E6;
 Fri,  6 Dec 2024 17:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A59EC4CED1;
 Fri,  6 Dec 2024 17:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733505688;
 bh=DZq3ehynlc63lZ3iGs1SNcajfqzDutIBxgWe19LJFlA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g+RyoIW8bHE/jCi5h2WD2niAuaS+GZ1/o3Mynthkk8pQy+XooGoRNwvV7fnHo9bHq
 g+E3icfW2ETNZUdbtcdh+ErCOZ6PXfOOBvkZ1VC9qhm2Ojn8Xf5jT4mw5xGdyJesqW
 tZjAjwCEUOVmo0s7j85HDASUad56eJVIXNkQ/oI445EIO4h3bROnrlOav2+cMZDuwi
 vlrdENRTN5b2XUHfpCFHAeRKQswxGpik5ynKkdGCj5svn/HSUWACWRS0e6GROlHOZS
 99SxzijvGNLI+lRgLNU9cCZsTpATEn9i5fqCtjj/Sj0J1dm2Vnvp4KCeeL49GyJDcK
 pr2Is0anIslwQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJc18-00000005RLT-1FIQ; Fri, 06 Dec 2024 18:21:26 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH 30/31] docs: acpi_hest_ghes: fix documentation for CPER size
Date: Fri,  6 Dec 2024 18:12:52 +0100
Message-ID: <abd4dbe629f95a5c0d5f26d052e3f819b37c89fb.1733504943.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733504943.git.mchehab+huawei@kernel.org>
References: <cover.1733504943.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=147.75.193.91;
 envelope-from=mchehab+huawei@kernel.org; helo=nyc.source.kernel.org
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ycpzTaRM6rG7

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

