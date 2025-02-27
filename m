Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp324573njb;
        Thu, 27 Feb 2025 08:03:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVIsIMUpXWUbDTEaenFIBX/9ktLcfREqgmHwe34pLA1+Wiq5ZBlnwflIqY/VL/y1enKVWvQOYm4Flsa7A==@linaro.org
X-Google-Smtp-Source: AGHT+IEpsVErKSVPqSbBh2IWCXjPWZha4g1zLU1Xx+caxkmhV+6yEbvZRGBwXhkxCSFU8tNO5Gzv
X-Received: by 2002:ac8:5d4b:0:b0:472:28d:62b0 with SMTP id d75a77b69052e-473813652d9mr107977141cf.41.1740672200409;
        Thu, 27 Feb 2025 08:03:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740672200; cv=none;
        d=google.com; s=arc-20240605;
        b=fCR9fAzVsZ4WJgL7PP05NIeqGK/m42lxg2+nQVOukddgtgkzXeMr2MnLPsRad2mduw
         DM5hwOPlGwfamvpazhkyaNPPgchQrcIm94CaMYZK3NRFtagPFeU/KtlMWYgxxC6h90Sw
         dffb/2tsUdR+WkIjbLsAFtVAPr9xrUjfGozWJPsmI3GF33Tl4XdFz/3BRl40fWE0/MPh
         NHpxUtMb2JKTfEN+oGq3qAlwDHrbufiqPeCXSRc71BiNIteE6JKE7nOG2eudFMnxZ22/
         CTYskKHalMMyjIdIozno/aHTsX90mdPMn2GicVX7EkNOAxd2C+GoZ4NJu82u/Yqr0z05
         giYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0z6zPqdiPiBw8AI1magqaaUWXFZreXvboapSLU5/2lI=;
        fh=vRlcgZ7942FHQd1Q9f6uT6HY2D7AnE0jt7dFCXEYTHw=;
        b=jxlzU1uHrSLxvHJgLCYvQOfhtPEM7MQyOzfNNmYjNKW1qoPr9mjq9tOkEorr8h5Hvx
         M3NfghucjYsX9MumIwJ52Wy3mr0kB7JjeH1XiKkFQfNRkLA1XPeraO8g4TVBEvhxQ87C
         TkV4uJzdSiHKnyT34Fm1f4Cj94Fy3e+h7HOuvzOa//BrvnKnDOpTWc6D+yxfACJtz0P3
         BKE1QLQYtIwOghRtCN9xmzXcge9VYZO4Wuk/WX5zUmtE6jR8S7VcjQq0iE+ZYDKYqAlf
         Qprv1wMaLMkbUWlDWIbX3qZk0GQQIofuCbphNZGRCbtWO3W77ZcSFFi4SixYqdNz8qiS
         kUoA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=usLEb5qU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4746919d91csi15243901cf.42.2025.02.27.08.03.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 08:03:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=usLEb5qU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tngK8-00078y-Qa; Thu, 27 Feb 2025 11:01:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tngK0-00071s-Sh; Thu, 27 Feb 2025 11:01:13 -0500
Received: from tor.source.kernel.org ([172.105.4.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tngJx-0007Hx-IP; Thu, 27 Feb 2025 11:01:12 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 25E3A61F3F;
 Thu, 27 Feb 2025 16:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DABC5C4CEF6;
 Thu, 27 Feb 2025 16:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740672062;
 bh=DA6h6NCIFzbHc/LBuE5Nc7E6U4uAC+b5NlL7eVnRDsU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=usLEb5qU1wRv+o2+n2D8TlO/RwEBj3VXtUlYZ5NNABe+2jYbgfLtQnFI6A7Aq4W6P
 puDv2UD2lwXEum5jc4RmvjrLgxdubv4tD6Stk5VrVMg+7KKYSLO+TNVPh6cy7ZULII
 d4ZQgw9rUi0Hea2k5bfKumqumALF0f1OmSKxLhOG04Jbw71cgJN0cgEOjLyt18opjg
 cICATzPZaopFlQN+/biu1SlZurnD854etUTsLCIctJRK+j4DaWbFQEKjZjul9lPPfN
 RcKdOvUOhxN9pCjuXNT8soe1pxiji8iXjvPndEy2Wm8abT8cVtIljoqddS61QIzr2x
 eoKhzv21uSy8A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tngJp-000000023bX-0L9q; Thu, 27 Feb 2025 17:01:01 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ani Sinha <anisinha@redhat.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v6 13/19] tests/acpi: virt: allow acpi table changes at DSDT
 and HEST tables
Date: Thu, 27 Feb 2025 17:00:51 +0100
Message-ID: <9b15b83ec3726b6f29583d419e0c6c6aa01a9447.1740671863.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740671863.git.mchehab+huawei@kernel.org>
References: <cover.1740671863.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=172.105.4.254;
 envelope-from=mchehab+huawei@kernel.org; helo=tor.source.kernel.org
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: lphlHZPRrAp1

We'll be adding a new GED device for HEST GPIO notification and
increasing the number of entries at the HEST table.

Blocklist testing HEST and DSDT tables until such changes
are completed.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf4..0a1a26543ba2 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,7 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/HEST",
+"tests/data/acpi/aarch64/virt/DSDT",
+"tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt",
+"tests/data/acpi/aarch64/virt/DSDT.memhp",
+"tests/data/acpi/aarch64/virt/DSDT.pxb",
+"tests/data/acpi/aarch64/virt/DSDT.topology",
-- 
2.48.1

