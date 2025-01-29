Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3616758njk;
        Wed, 29 Jan 2025 00:04:34 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUacTlxah3VBeuJUkBOr5re2agHyVLa0d5Zn5847taC58pQma5E+irejrnD5R9fcKGrlyBWHde/N4Kt1w==@linaro.org
X-Google-Smtp-Source: AGHT+IGLojaflgu0mqozxVKyF52oEMksdOiJ1SJRmMw8zb334mz8cvDimSdCFMFOmJtePoq+ApCt
X-Received: by 2002:a05:6a00:21c8:b0:725:9d70:6ace with SMTP id d2e1a72fcca58-72fd0bf00c8mr3162756b3a.6.1738137873911;
        Wed, 29 Jan 2025 00:04:33 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738137873; cv=pass;
        d=google.com; s=arc-20240605;
        b=NRdbVER6HKEajgrjP6xYd/4KGap5th1hjyesTycRFzbTx63v2RRUjbzAloz1iHfImx
         6aG3T5hBxqtbt4K2ymVFC31jlZZ5aVOoLKMwjLmMhibY1GvXAvCUP5bG6j14HOoIbnzV
         3ttRjVHT/qY4aQUUo2O6JPzZHrOW1hUNctN3lo0Mp8bxkW3yNT1f3qgOfgeM9zPjUO3g
         emHRk1SpSrS3NZMl4TE6ci8FNsH+K2KpaBFQyjdm+WF/QkNWGYT1IREOH0JkUSq14XCW
         mKbJlLliSEift+ZhXLO/+G3FssJrn7iLYrrbhfWO/Y3Ino/Ve06Kbi8NHXufI0IL4UB9
         JH4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=QxpoHezLvsMDV+/8fu7fO7toMEvDB83DKRdCOj05tOY=;
        fh=vRlcgZ7942FHQd1Q9f6uT6HY2D7AnE0jt7dFCXEYTHw=;
        b=NBzQSOyjtMDfNbtn/oNCm2jlM7O18egnqh2UHf2X4W2ESvIo+XiRqYsMvywVrVK3/d
         ONE02AAlx8WLBRTrnRXubNu5kzYGYIt5C15uNcIIHCVWqg90SxIV6qmsNKgtYcULUxCt
         OCpg8kOl2se/QlNF2X1TB3CuqJedLBDFy/R+BF/posXSQMRqsWG8fw8RP4EFi68w5VJW
         2lIWa43GGk1EjmNerwKpYt54a6aUGvhbfzGc+j8aQFzGdGykBHY8lcRXkCRML/tpL9tP
         ce2s6a7r/ivQWy/HqcDjaMm7ecOJPN+oRFAhcswsWuqjPy4DSiuG3Er/rQpV1gsdTsqp
         1P5A==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=CTutfBDy;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-492171-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492171-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-492171-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id d2e1a72fcca58-72f8a77814dsi14636497b3a.203.2025.01.29.00.04.33
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 00:04:33 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-492171-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=CTutfBDy;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-492171-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492171-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0D093A52B6
	for <alex.bennee@linaro.org>; Wed, 29 Jan 2025 08:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7BC19992D;
	Wed, 29 Jan 2025 08:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CTutfBDy"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387E11922E1
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 08:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738137867; cv=none; b=ofmsBa5gY1hoU5AMcOXYFGQ6RxxorTd7MY61jmped6A/Y2EMMCXG7DMONzkBI+NcQO1wdJQVqKAsaphi+G6w3TOSY63xEfuespbtkMj6AV84mOaGTZpZij2/Tm4jLXPu+lLhNXK2SJRyXIyV1d0j5RPIA9N3Dk2k+ARjJHCHzPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738137867; c=relaxed/simple;
	bh=0b+60rXVrbu/hiTiZ4OpvRNmenUzwizWLirm4Ep1lTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o6ULGd1vmMaM34T9RV2v3YfyERAYIDUfmRFopo0yd2NiqTFUVPpGVttCdm2sKc8ExT9QbLYCun9mxPglnyFHag2qS13qjf6VeLqIZftVIxQkOP4JT1TW1p6HzyN8eBXI1GhJ5tYjTOUNjAbyxYjI8aEuc3tEuFMo/6UQ6V2V/u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CTutfBDy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE44C4CEEA;
	Wed, 29 Jan 2025 08:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738137866;
	bh=0b+60rXVrbu/hiTiZ4OpvRNmenUzwizWLirm4Ep1lTQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CTutfBDyM9KoPCHYDOqxxwbzJlfXn1zqlGPp+gLXftpgbOPyrsynQg8JKhW6W+ufY
	 iT0lPXZUnqdDcVkmjPunoZ40eEEAB+dx+c2HqlLEUUXzuxyLhcXnRkGxQENMPnQ/fT
	 P4GSnBZIIqxN8i7lcoPpZ9jc7Is2ivoG33EbUBVMcgjZPi3EZ8H3e2/CABOdFg8bOo
	 ufC+/lKsInFDU+nQY22IeM6+cUWmG6fSbUCnt58PsbTrVmJUUEqR73VvDC6sFgDtyL
	 WNVigzWWczvMb4NX3mZf8Q4dSRyFImjJjoXLkiltp/yPAKERjgy9q8Jx0NV89RMy11
	 Kk1aqMOOkLWlw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1td33g-00000004DPe-2uk9;
	Wed, 29 Jan 2025 09:04:24 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/13] tests/acpi: virt: allow acpi table changes for a new table: HEST
Date: Wed, 29 Jan 2025 09:04:08 +0100
Message-ID: <1390b46682f2bac3587239d03a0ba22d18a9a044.1738137123.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738137123.git.mchehab+huawei@kernel.org>
References: <cover.1738137123.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: 5jUH/IH2xin9

The DSDT table will also be affected by such change.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tests/data/acpi/aarch64/virt/HEST           | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
 2 files changed, 2 insertions(+)
 create mode 100644 tests/data/acpi/aarch64/virt/HEST

diff --git a/tests/data/acpi/aarch64/virt/HEST b/tests/data/acpi/aarch64/virt/HEST
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf4..46298e38e7b8 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/HEST",
+"tests/data/acpi/aarch64/virt/DSDT",
-- 
2.48.1

