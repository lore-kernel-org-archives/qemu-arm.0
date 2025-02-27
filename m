Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp141007njb;
        Thu, 27 Feb 2025 03:05:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWExZJA8tN+MkWuPGlPVRFhsPLmbg+efR21J+PmWykGsGyMlExNWPpW3GnW7FAuOLRSGfjCnIsPXXWx7g==@linaro.org
X-Google-Smtp-Source: AGHT+IGR6lq9NDz0dFcfUY5Xri0vhicR8WCnlJ8I7h4XlNiR/5j0Ea90bN4x7eySHZUuLrMoLLkz
X-Received: by 2002:a05:622a:b:b0:472:1886:ead7 with SMTP id d75a77b69052e-4722485d3b6mr317773641cf.27.1740654306919;
        Thu, 27 Feb 2025 03:05:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740654306; cv=none;
        d=google.com; s=arc-20240605;
        b=QMFpSgbbq/oyk3/eSuUCnyXy6EfFQbPjLMR4Vm7wC+XatRhj5I6KQCxzQ3w9nbhblJ
         x/Mk21EEMncZ2UBuF4XwMCQxVW/zavn7B3SPey2o22mP8h3tVMLt2RMj8yfi4h00pnHa
         U4hotNL3n4N7AOfEx8L0THtCUuporyamLtohz91tLXTE3SAICoEXI+hyRtt2JGwY0zGS
         XrUwgBER2LRBaF5FowMNKHMyNxNSVruP4LcuVZ3SZXndtv/KOauFaunDngKOpm3dEnjj
         /26THKrUwdsNoogpvpLDPs36k8K87b0hKYH3kDa4ATV6KFagIq/7frwPaaA84yW+Jw7C
         /I+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=aAFdPXGS8tt3OBdgZdhXHZihEPlbIMjlQ7L/GC4DRKU=;
        fh=vRlcgZ7942FHQd1Q9f6uT6HY2D7AnE0jt7dFCXEYTHw=;
        b=UY5pCCDO0DBedCiE4/cxT+RcKdUbYp1/0CuOnjU9o3crcVzX5ZzqEedEAvijpWZyGU
         h41Ea5iJwtf2bS77oabl+pD/iAJQvYspXJba8de8fFkjCvfRpQzf/HZb7aejV9i2juUG
         DO+M7JM9fQ7LfF3OaOxpQs3qWVYSRvLiY0xBrx2u7CW0lMKLqN2AHSMpsObCjhpJrEWX
         o8iLt9p5fgNCiSwHJLx1ABkNJOsotBxC9QibcE8MXk3rlVitp2u3UhnyuJy9Rie01mmI
         m2sqkzwdUjASUHGlwJHPwj2YL4AOYfL2JPbSWLFD5UC0ruxbVREsaxyJ/iwo9eKoRmv4
         5YsA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=kFaRHEdp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-474723fe1f9si10874111cf.254.2025.02.27.03.05.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 03:05:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=kFaRHEdp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tnbh3-0005A4-Hu; Thu, 27 Feb 2025 06:04:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tnbgb-0004pD-KK; Thu, 27 Feb 2025 06:04:17 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tnbgV-0007Vr-6S; Thu, 27 Feb 2025 06:04:11 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D68695C4AA1;
 Thu, 27 Feb 2025 11:03:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28656C4AF0C;
 Thu, 27 Feb 2025 11:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740654238;
 bh=IzD7ej6+MnEhTQSr1xYZdmpq2RxnkugunFxTJOIMeHU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kFaRHEdp7iJdv8YpnN1KKmuln6cq14aVqrlrccAm5jSIeUyf3zMYM54ALHen26Ox6
 iVxe9orcWsLRt6h655KtSiIZ2OYwhHqpK3XJIS6mqAtX1tNalyuCb4QpPU2GYzB2td
 bc67ody9D8UlbsAWh2l+rsNHYevjns6NKh/Xi+1qrdmV8a+Awq0is2w0fgXEOTJ0vO
 0BZJoWrgOekqNO2auHjgcZYW35Biso8JqU1x6vI3RWxVVH2EYdHS8uCB4hqr0olojV
 Ghdx8VYahw/0O65P0kwlCiw2t9ESTZrvjsV6QrjZvME7vQbLV7pcpTJmvzKw1csJTE
 nm+/QcTPy6Fxw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tnbgK-00000001mRQ-1Zg5; Thu, 27 Feb 2025 12:03:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ani Sinha <anisinha@redhat.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 14/21] tests/acpi: virt: allow acpi table changes at DSDT
 and HEST tables
Date: Thu, 27 Feb 2025 12:03:44 +0100
Message-ID: <11f37e677592494c7e73b2ff5fad700e8726205f.1740653898.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740653898.git.mchehab+huawei@kernel.org>
References: <cover.1740653898.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.44,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: v2KP0xLOnOLM

We'll be adding a new GED device for HEST GPIO notification and
increasing the number of entries at the HEST table.

Blocklist testing HEST and DSDT tables until such changes
are completed.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
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

