Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1378494njb;
        Sat, 7 Dec 2024 00:57:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW3NR3AdpRjl4PAf5nnG1bmfThMaMoJiznOR/Z8uz0eYnzZClNZDrs2TtqH3bSF4fKra2D1eqiQoyf+Ug==@linaro.org
X-Google-Smtp-Source: AGHT+IEypcjO0bOU/6RNn5Wnak5FGQUZP2IepnoKE1kMqZTJEHsDnTjetE1HhvMHPK+Rexa9Z6r6
X-Received: by 2002:a05:620a:45a0:b0:7b6:670f:b91a with SMTP id af79cd13be357-7b6bcb45285mr770800385a.43.1733561873095;
        Sat, 07 Dec 2024 00:57:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733561873; cv=none;
        d=google.com; s=arc-20240605;
        b=Oaa/jgEYp+5C1eokNs7ggB6Ux+NTrI2QErEZSPqIECgy3WVJvZAUJRZ5HSVPNNxh61
         tH+9noRWrSCwslWnh0BwDNA0QYMB2yziYk2kTM+69rtobRe6Bfkl9W+VCC6AtchwccRD
         UGBZoA71LJowk3pGc0aOt64rtm41KR0zy8pfRkkf0oZHyyQ8BWjnwRmjxxG5prpZzvOA
         9ajWLdueL4k8loV8JyBi0MEp7G+EbiXF/YvibXnY5HHaxDAph5XSzYZzg4Gxt2wAJ30L
         3J+5ymLb3NFRJPUekeXvHWHkiYOqq1MiZ5C213hFltqZDb6NdlSsM6CPi5ltOQh8GKNG
         EXjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9nt4KlWOzhCkiHLJ0olSqTWQDZ9CNEkViz2E0+NphzM=;
        fh=73c+dtNzaFRVpvsBR36BcpiNmJ0taGeotADmghun9vc=;
        b=XLbFA5TzNMXOWA0zLC8jGhQy/mZcGsTOobOKyrViMIZtjmi3k+soBaQ3zQ6//z28rA
         k+CUnzilVzA+oWC7royVXoHTE9hbnl8kKEmsWXwstucz28DjGBU24v1SPVf+tOxtHGBZ
         c2DsmHveLh39ynVuyxZY2AyA9bDKZaUbHOW/s/uFlEPlyIHCY7g4/v4MdKmUivoXQO25
         OGInuMHcFPibD4jctOpRoWP/hxh3L7EIyJrJg72xOkpSHxmxjidu60w21MjABej+w/O3
         FyxHvoA1hbhYZWnuylGy8SQ6clEHP8BQGF0RluC9oljt0cDAQvVObPQ4khuqrfgYofXN
         ifBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=BcshqpXG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5aaab09si600414785a.386.2024.12.07.00.57.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Dec 2024 00:57:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=BcshqpXG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJqcS-0007Z1-GD; Sat, 07 Dec 2024 03:56:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJqcM-0007VP-DK; Sat, 07 Dec 2024 03:56:50 -0500
Received: from nyc.source.kernel.org ([147.75.193.91])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJqcJ-0002Sw-J3; Sat, 07 Dec 2024 03:56:50 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7F987A40488;
 Sat,  7 Dec 2024 08:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E44C4CEEF;
 Sat,  7 Dec 2024 08:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733561805;
 bh=DZq3ehynlc63lZ3iGs1SNcajfqzDutIBxgWe19LJFlA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BcshqpXGdyreUxNpcsFnw7ITSsNsVJEb/omufpr4NPWnuZ72upCcQYzw6w/5LCMdB
 tQ0UKs43aA51YheAaBKEFh53Xv3u4j66yLEfnJoUncuiyGyVjXVj1KTtO1HANO/JP6
 Ec1Q5pDODHPrXHyxLMy5J9dUfGw8WUXavz+FlL2tcAoihxvKl8jV8RPfOQ1VnjkZIE
 XTofhKemiZduxzVEFSV58GI/dMSWDZLNCZBcSpVInyKJaUNDLkBRvJRAWJarHeUtCO
 rEBt+QlCBRF2HCWwmCzvOX226J7lHSfUHM0T493vB+SuycgItAqsZyuPN5+C8vD9wA
 Q0Pzlp+3jVgzA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJqcF-00000005j5W-1Pqb; Sat, 07 Dec 2024 09:56:43 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH v6 16/16] docs: acpi_hest_ghes: fix documentation for CPER size
Date: Sat,  7 Dec 2024 09:54:22 +0100
Message-ID: <c9a291a9b3fa22000ae100d980a0ada5d6ba9a24.1733561462.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733561462.git.mchehab+huawei@kernel.org>
References: <cover.1733561462.git.mchehab+huawei@kernel.org>
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
X-TUID: hRsMFcj/hfZl

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

