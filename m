Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp1960275njb;
        Sun, 2 Mar 2025 00:22:23 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWbVJHgQxwSuAm+A7wBu4hMyaEIn65rneVhCSmQr+NJiWgPr42MBbhYgJCaRixjruffX8LklKAug773uw==@linaro.org
X-Google-Smtp-Source: AGHT+IFe+QkEPPPlz7MuWc6WNZAjf/0IPWVYnDJzUEjJqZHA3i8JHCbHI9Lbe+oWlK9p2RnB5mtV
X-Received: by 2002:a05:620a:170e:b0:7c0:a70e:b934 with SMTP id af79cd13be357-7c39c498f96mr1673407585a.7.1740903743416;
        Sun, 02 Mar 2025 00:22:23 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740903743; cv=pass;
        d=google.com; s=arc-20240605;
        b=c5YV6Tbu7PfYtTAptWELf1iGFOzAexqyr8ceFKUdhs2bVCLjESsMMtTtvNWuNnJszs
         1VLS1aS1xbBIfa5NbOP8aZiKRkPQ55b3qhVcDtDhlpBER0n2m3O841n0Y3HsvREsDTe0
         /Vx6xz2ZOQkaNr9GSBlcaIxMvmp7J2yzuL/rhi/foY7k1MeqSW5F/ZhvlMXbHGuyCuCG
         tCuAxJmnv6lIxSp+iBXs3UzyZTmIa3JAvlwzBAKJuHJ8WtxULp62IFPRShvogB/S4mB7
         Vxnk1UoHQDyv2MoZ7kNJKh5svluqWt8Uqx/3hkLNFZ0yNX85nKE98PPPZjEb6UHoGs5M
         am0g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=tlMFKNywuwsnGRyliUKsDYPpVTeyaqJgrVhkY/F2wnc=;
        fh=vRlcgZ7942FHQd1Q9f6uT6HY2D7AnE0jt7dFCXEYTHw=;
        b=bGn3E6cV3x1DAWaRJfzeR32mKxmcBn3joqrz36h0KgKMFEd3GcD88D8TkqUYR2Fx7Y
         PoFv1ple3hdPiAzTuwZ4IeitCX1e/oXypSO696LHD9S1JLoHEwSaeljGPsRqNSy5FS3u
         WAUZBaGtMjw5y0ndEEUlBeeeqJuADTl2UAPDUjyG+DYT1pj8JGUgnEfuNoGq4M19MZHR
         Hh1/cEx176KmRZ5VjX1ZVamHHt5xdG2caVD1LFpSY1RV8XwImgSK05TqN6l3+EQrDdi4
         LVopoLj75lDwgz3Ak5aRr8iJoej55S4aX/8BcjlfeSiPRAJjTLu0Smt4X96+CStZvI8j
         x1PA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=dPL3OAI5;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-540430-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-540430-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-540430-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id af79cd13be357-7c378db3be4si657653785a.597.2025.03.02.00.22.23
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 00:22:23 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-540430-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=dPL3OAI5;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-540430-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-540430-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E7DA16DC95
	for <alex.bennee@linaro.org>; Sun,  2 Mar 2025 08:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6F4C1D86C3;
	Sun,  2 Mar 2025 08:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dPL3OAI5"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DBFA944
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 08:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740903737; cv=none; b=kxxfxKaZ/3lDpdYnKqutTCrISC4F//UaSK6m4Y3On07AGt77KRXMJOBdCO5ke5jyDNMD4XKSmS7d/cgW2DlmiVcPTcr6W0RKrgkq1ecmWOm2MVgpHVnwR2L1mxdeRoG2OuEM1WOX3v24ZUKnm9vdgKE4/I6kKj3rSX/fKQqudqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740903737; c=relaxed/simple;
	bh=Oy1d1NtjIuq8rVPzyJSOrQ/KFfdLC18cbst4NO1Tvbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DMofVc1N0f72KF4QpJahTwrT5hBs9LMAhNJJWBDVF6E+yK0hc5KjZ2LAfrIC7MUYgRnUVYz0XekRNTkdF2gRwxQT2GvLDu6oofmQEx7FQrtGSZ3lFdDlAEdbxaqOJVUAro0SWzp330t7XMFruCaWMdWuIdBk4kDTB0vE0M9xp1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dPL3OAI5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 064C5C4AF0C;
	Sun,  2 Mar 2025 08:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740903737;
	bh=Oy1d1NtjIuq8rVPzyJSOrQ/KFfdLC18cbst4NO1Tvbg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dPL3OAI5kGobdUdUiX9iD77UqxgeGSq+Cf6Z3uIzjKjtq53kWzzozZd3XMJmeaB58
	 FYsNugDJ5raqp4nWqjO8rQG0G0MEAwzucQstClaZbywd5r9FU4yLR/cQ6i0mmqrdtL
	 6+CFutkGquLPFThot1a3M5otXyi0StLi4cdD2lPaEvWCG5P3SMzqZkelqCD3mbKfwb
	 +k31XmWj86ZPqEXIs98F6Rag9GiyFw5Jem8pp9Z9UavN3teZTHUC4d3PyOgFSiMWRO
	 +N0iIWgbGlWd/K61k8vvfARQL5zxTs8kdJN1Jt9htx3Atr3dSmPvYi7me8Wgy5LTUM
	 AKvGIbesZyyBg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1toeaU-000000043SK-3QUW;
	Sun, 02 Mar 2025 09:22:14 +0100
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
Subject: [PATCH v7 13/19] tests/acpi: virt: allow acpi table changes at DSDT and HEST tables
Date: Sun,  2 Mar 2025 09:22:00 +0100
Message-ID: <414fba74b2c9fb50169f7a3a3f05d87d2eb1f783.1740903110.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740903110.git.mchehab+huawei@kernel.org>
References: <cover.1740903110.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: nijHAnX9F8Je

We'll be adding a new GED device for HEST GPIO notification and
increasing the number of entries at the HEST table.

Blocklist testing HEST and DSDT tables until such changes
are completed.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
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

