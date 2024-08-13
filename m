Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp300576njf;
        Tue, 13 Aug 2024 16:24:27 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXzk9A35sYn0ITkVlNFZNmamgspAMyjiZ+Ir5ibmeWxPfa/bunXSTWU7vXz9+PTY0foyJ8gmOJ+JsiObjvzJFNtHl0OkbXU
X-Google-Smtp-Source: AGHT+IFIrCVvgD+h1FhsNyXNYZdDVDbt/Xg7vh1Ce4VVIADGdjUQwVXN0zEe31pfc+tAjqoMLtrm
X-Received: by 2002:a05:6871:739f:b0:261:20f:c297 with SMTP id 586e51a60fabf-26fe5a2af53mr1363210fac.11.1723591467375;
        Tue, 13 Aug 2024 16:24:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1723591467; cv=pass;
        d=google.com; s=arc-20160816;
        b=VhcEVhX4nuuxSmuQjE1INBv6TZm+NXT/Uxfu94XFoGBJeWzLq+fCv29YD1LkahPAyG
         BLxiz39eF0NAY6QQmxHtfZ24dft+1yzCSa4S3pvebRKeL/VHSfZ36FSwJKqVcmWjrTFk
         S5jcv8TZTD4uOSMO/y+yBnd614QxpsHNwTqP9Hm8nAZzqUUW3Q9CqLu7aHuubUI48XYz
         5uwzLGN7t8cl9M1wUVmr/CcmyteQE7wCj7kQNyLLaYTBnIDjk/5ZaCXcNMvhsHtVu/EP
         WxoN0lqt9z3V9/bdEzeL0jDrsI6aB+T4jF4hJc+GmiPdo6TssIxxDgo7nXrgSt+lMHyt
         Y1xA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=oi+AkfqZapq0X66wnZlEwkqzPOdMevouaZE4Wf7zPAU=;
        fh=QXl+txXhD5RE+zdgPNT9jwdt7ujaY2VGHPWLIzq2oqE=;
        b=mwJ9j2kx9H+4Y5uMo7PCQVhPT8CJvc4AqbxI73cJACNG1ehVO6uOVJ+85Hgzx0dZDV
         dlJ71AXuCoEsRB1znVOCm+Wqgan2fwe8EPmroXjSMp7ki1cCjABK87E+Xeuuj1EriU0z
         9iRwUzVaZdxxYGKn8PkCH6J51ZDMWEiz4GkR3FQSLfw5pKOX77VkUJeeODd0NK+jHmYM
         vXt1F2DTWWM16vS1ewtb4C2S+Np6u9UUu8iocaUpON4/8TJDPrUZAtY0QOFXhLGRv68H
         DZmV0yzybDZAmFeNuo61cohsYcU7D0XZVelI7SSlu13611Lnw0u2dAmw3NGH59fcAvCt
         zlyA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=hSBjYnXW;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-285621-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="linux-kernel+bounces-285621-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-285621-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7c697ada236si2627688a12.646.2024.08.13.16.24.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 16:24:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-285621-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=hSBjYnXW;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-285621-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="linux-kernel+bounces-285621-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41814B22FAF
	for <alex.bennee@linaro.org>; Tue, 13 Aug 2024 23:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31931AC436;
	Tue, 13 Aug 2024 23:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hSBjYnXW"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8621AC421
	for <linux-kernel@vger.kernel.org>; Tue, 13 Aug 2024 23:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723591451; cv=none; b=sdEo4WbceAG2Kq9bqnxRUMTHiCcZT8i+4uvYvefI3wHc4bGQKwiY4NvrNPIbnNu5nEi0gX56KOXwwPD7312rbtOOkn4+Lb72BHhWB6lhyHoqCDmo6XV3PXb3f5H9qGjqA7L1zwCKNQ2Ps+2KsXL++4TBZqdQ5YN13IjVvQIr/94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723591451; c=relaxed/simple;
	bh=LhonfX5szAcii0iSJEisUGaz09LnvbNzPlyCpn2Dcys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dqStvQWKph8Qqc9LJlTHt09qcZ8pUgzUD+Lj52JSOyddX27pnb+idmQNEds0AZW9FDvglm0K7pazNWe2R0HC62GtRyhM19h7QlwDiygWKvNk2WaytitVCB7j/Z1/UUPo3NB2m5F+HCgnVHLzw/9wQ5seZe1zoRSbDoIjtMSo9Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hSBjYnXW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E8D8C4AF11;
	Tue, 13 Aug 2024 23:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723591451;
	bh=LhonfX5szAcii0iSJEisUGaz09LnvbNzPlyCpn2Dcys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hSBjYnXWRr+QLyi4RFPXVIWToOlwx9s2LbVoBmBqJ/yIhJQ6ZJhUjTKbig3zqOlzZ
	 BbNs2RcnQf+DgR6cEIMr8pRsF/OX4a3KM4Fo5lfw8nBiIhv7SedVWk2Wz+KQ4aCq1b
	 Ue5hCMyMKnmxIrgVIL92fzs8WIUPlTiIGd1bNGtSg3oDWE8d9eMMxCildMjKdKB3Ou
	 WFAKZAjcZDIzwis6nn6kmn5BlSuZ5GhNMq9XiegBftPp/PgygAMTjkXjgg6THhhrKE
	 yjp2ZlbQ2/AdmM+F2gfnJOY66WD4eY3iJ+DPMlIBFn0FbHuihnAmY9QB8EqOYCFxQ/
	 zVkxbafngrNbg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1se0s5-00000002asY-1ssk;
	Wed, 14 Aug 2024 01:24:09 +0200
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
Subject: [PATCH v7 07/10] docs: acpi_hest_ghes: fix documentation for CPER size
Date: Wed, 14 Aug 2024 01:23:29 +0200
Message-ID: <55354bc0c5cfed5f6f042ae746c84983263c8019.1723591201.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1723591201.git.mchehab+huawei@kernel.org>
References: <cover.1723591201.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: z2d9wjED4lzK

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

