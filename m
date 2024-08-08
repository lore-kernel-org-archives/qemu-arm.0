Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp485657njc;
        Thu, 8 Aug 2024 05:28:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWmA/hGIP9EwVZkZDyDEySTWAoG5paF7p7SHmpI0lx8dkwZlZ2DacQ+yaokJjq+z018/O7sC3YcsqRB3ce9OVz3J48tFB+L
X-Google-Smtp-Source: AGHT+IEr8F6RTNP48hWMlTnYQEkDZ7XTLBIjsT3jd/ucwdZmsYh5DWV8oVR3tHoQqn9CaWCgu86w
X-Received: by 2002:a05:6830:6b0b:b0:704:4563:b66a with SMTP id 46e09a7af769-70b4fc3006emr2250860a34.4.1723120080402;
        Thu, 08 Aug 2024 05:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723120080; cv=none;
        d=google.com; s=arc-20160816;
        b=SRmFWq8yOal//WIYAZWMF6qY77tEKRZdXimEccsii8UKAh+6ej6bf3ALudnEcOYT2g
         qC38/+yqiYKbv9CjYjVJPSgrxLj5m7TyDe+hQy7patUhZ7jy4p1CqIBqK1Fl9QXaztIw
         fafyU8uEJUbzKPHLiIw3r65t0MizRkaWOBMaU2+V6pdFipZR9Hz2vDg7A6emTuW2unys
         Ece53WDjxnEiffdLOrCI7LJGJGmQdyMra/lqewNjFe3fyY7hl2u6jFFPUKyLSbhxeWQQ
         DGjoQLk1PtHwDuMKVfr05rwk6uWOjl4N8veknYVyeO/9rRVQu8cQQyjEvmErmIFfTaQ/
         ULRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Po30n7VH0ZE2I+bK3oZoCRnQoFud/i6cfVqRsnuziXI=;
        fh=gqudsHnZg0ZDHHy1LzB0UiSg6Nrf/2Xtvvf+ciJMjcM=;
        b=RS9AYjnlMhmoMsmU68xGqoqoFxMo16GWsQ9jzzGrd2AscLpYdY67KavfTzxLgljbWE
         tkagqek8Tal9vZ0/en0AzJuckW5tFuyNrqXWFUM5azc5xmbSG8WlyXBaDOZdcJ+bQMNq
         ew+fxrx/Wm0FwZApAAqvU8UkI96urELKdBgQXCo3Pm2g+rp2pe6jGzuOkeMv+r764rG9
         i/saboO9zYE9wjBrDUdo3Rnt+4olNXsaAhdgZSPoLwzIQpWdywYL5eJQe4eURNcuOlqS
         jLgdivGIp4JTtfsY68IrPP57CMIn7ut4B9zIQ4CYvRAu5tNaMAlxuEux8BYbhCwg9tGm
         6kpA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=UOVb1vRm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bbbb90a0b2si43572886d6.431.2024.08.08.05.28.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2024 05:28:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=UOVb1vRm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sc2EI-0000V4-8D; Thu, 08 Aug 2024 08:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1sc2EC-0008VD-SA; Thu, 08 Aug 2024 08:26:48 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1sc2E9-0005xN-B0; Thu, 08 Aug 2024 08:26:48 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 231B5615CF;
 Thu,  8 Aug 2024 12:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C7EC32782;
 Thu,  8 Aug 2024 12:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723120002;
 bh=u+gtNcYPnwzIRNiBgtrexQw/P62CjJ4KAOxlXUYS31Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UOVb1vRmy7xP4czfIIFhRtb08tspyh+2pJJCOZDcRycIvlJbpzco+8m9UoEo35M6A
 cQDpbp6gCbhXFGdTMBLCBkdrLZBT+PDHGwwOTwB4IR6XCrrS5AY0L9W81HySxrwFVW
 DerW1OdriegC2dLOnugF+f9d3XCXbqF1BsRg8ScAcYKgUH2Ppb+P/Z9KeNk1EOXfdV
 /a7FEiDa20f+nfLE2aJcPVSIDNGEIxo/rcmx9owHZENZHBL1XCclDLHldiAuWtx0lG
 g684BeDwcXMn1qeUGz6djBFlMP3O7XaCMoiWfoQ2B6oCtdQvCIFUOMoYPkT7etUDEM
 joSGivAYiCEcA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1sc2E4-00000000oDa-4AWQ; Thu, 08 Aug 2024 14:26:40 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v6 07/10] docs: acpi_hest_ghes: fix documentation for CPER size
Date: Thu,  8 Aug 2024 14:26:33 +0200
Message-ID: <93ae03bd89b47731f6703dab5925ed2f7a9fd426.1723119423.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1723119423.git.mchehab+huawei@kernel.org>
References: <cover.1723119423.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
X-TUID: suRy1R/i9rxe

While the spec defines a CPER size of 4KiB for each record,
currently it is set to 1KiB. Fix the documentation and add
a pointer to the macro name there, as this may help to keep
it updated.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
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
2.45.2

