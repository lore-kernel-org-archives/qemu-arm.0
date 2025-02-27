Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp140528njb;
        Thu, 27 Feb 2025 03:04:22 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWHHn5b4wY3Z3ZOal4Lzf1WnX5m1OrrhazzkqvCrLney5pUnmePyRot48Pf0mdEo5gutqa4/Lfjb2unYw==@linaro.org
X-Google-Smtp-Source: AGHT+IE2XU2XLoc3LYyarrpkmGSfkkcqap44C+cpjs/l92DbIaZDSt0/l/KFIw1WrKRwjEOdwaCV
X-Received: by 2002:ad4:4145:0:b0:6e8:9021:9095 with SMTP id 6a1803df08f44-6e8902195a4mr55163786d6.32.1740654262306;
        Thu, 27 Feb 2025 03:04:22 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740654262; cv=pass;
        d=google.com; s=arc-20240605;
        b=I0hYrhlEi/Rwr9kcz/lHy0+cKxEHU6Q5ziQWlOm9NjIcjwmZWyRGJOQ+MJpRVD8miC
         WHT6I4jqHGrgccr/FzFiB7UNjxtMyX9UlwmnqD0Mz/O0aHEVitpZPUmNv65QaH5qcsTz
         j7yv0vR5vrPqXVJg8XGeh157WKtXjmYF6DI//yjEZRQnBp4+odahZ4RUqtYEF0F6YFM1
         d/tpV1F9pKMw/dUXTNRIt26vz/tgvzm9ICECIOgZpCxpn2UfqQyx01Oa/jzMvjrZ04mt
         ZQ+XjSngXz49W3mp9iaxxSDk5RfL9dlE7ihurzjTgu/gHQnoUP/9hh34bUItTav3uTzq
         xobg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=jBfdailMoCpFJPXVF1J/swwcq8dpPageM1oRQIl7Hes=;
        fh=vRlcgZ7942FHQd1Q9f6uT6HY2D7AnE0jt7dFCXEYTHw=;
        b=fuLHr+Cv1ZxvjKxMZ59GluaRj45btKzcson93TkVzxAKbU1Q22gYSyjyr3smbhzu4O
         hWXvCQi0Rwz5Beb4upCaInIkDuChBozcoOHkkvR+/zms1LNsU/SbdGp5QsDsYvBZkpYr
         1Xev2CqNN2Xob5A3uOGufj9jWu1PPrh2YVzaoezQMIE4SImvo5J2j9Gm4q1gqY8EsuGd
         IdRRN4HDYIPxlAIuSVj7ArV0kfNlqF0g5hryUAeXHT7WCia7dXOgdNJZp/JsoZRmKqRf
         XOcmC80G34isA92E5I4hgyigtjCmmG7vk5WQuwL/lxw0e5+ERcGsz1PecaofKMoiW+kL
         l2+A==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=iEg0GYNr;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-536065-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-536065-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-536065-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8975e792dsi11157676d6.75.2025.02.27.03.04.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 03:04:22 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-536065-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=iEg0GYNr;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-536065-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-536065-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C46F16B0BF
	for <alex.bennee@linaro.org>; Thu, 27 Feb 2025 11:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C3822B598;
	Thu, 27 Feb 2025 11:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iEg0GYNr"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795E522AE42
	for <linux-kernel@vger.kernel.org>; Thu, 27 Feb 2025 11:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740654238; cv=none; b=g4COQDwd8mcvfyF0SaD89BvGS6WLasLpShcKdsJrkCOTNu0sSVHycdGu09nLn+sIAmhvXMGgcknrayBYpLjkkx69Du69LxPrwEy8Qf3Kmaq3GvpN1IIsxBfcb1Za7+tB/ky4l/hwmENFHKEL1rmyLZlqpgJGsRKPl/BICmYTRQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740654238; c=relaxed/simple;
	bh=WFSs/B3Y34immM1a4OhkanKgJ7jJZGY58fcV+6YM6P4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K5cIpNF3o37ugMHib3zZMFRfjWk2KrkvQbuEmOU2LXBVDpFQYbBS+sO8RwX7XbpBtlCWlf+Ft02XXkxOwb8CLgcEFw4pAwevm+ClOf95CJXISLIl1PeAo9nXVq+WkhLEWtCwHW2JWSD17BYRCT85nX/I8EdANRA5PvZRQ7rNV2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iEg0GYNr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D4CC4CEEA;
	Thu, 27 Feb 2025 11:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740654238;
	bh=WFSs/B3Y34immM1a4OhkanKgJ7jJZGY58fcV+6YM6P4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iEg0GYNrvGcLEdkYD3sIqziy/IPNKk8xMz9vEDSXYibyAXRX6mnL1hO4hT/QkXcMX
	 tiwTsroWWil5RobhnMO5dXKnEUghjC/UrH43z5SGmMuY3nN7W0oyWbuFClOsUzgDsK
	 ZEY6CsWXr0mlUV6rcgZf/ooNykBBL8Dih0DrZZpcFigfzinlpltlkFIELrxTQWQ3q/
	 zEVgm+slR3VF7AnbmrlQhz8PzdFKt6DE6lB6G+v5LMdiLkP0L1A2JuGTUAA+1ApUPg
	 tJj37K1ierPwX5R+7239UhwqZyQAxY1HfndMldXXz7xdyt3emqM37rv1+pYAd9/DXW
	 u5q5Z/Y2gL9Xw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tnbgK-00000001mQa-07zQ;
	Thu, 27 Feb 2025 12:03:56 +0100
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
Subject: [PATCH v5 01/21] tests/acpi: virt: add an empty HEST file
Date: Thu, 27 Feb 2025 12:03:31 +0100
Message-ID: <3da2d197610ada25dacaee54d113fb87c5448b04.1740653898.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740653898.git.mchehab+huawei@kernel.org>
References: <cover.1740653898.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: qMo1/8o+DKdo

Such file will be used to track HEST table changes.

For now, disallow HEST table check until we update it to the
current data.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tests/data/acpi/aarch64/virt/HEST           | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 2 files changed, 1 insertion(+)
 create mode 100644 tests/data/acpi/aarch64/virt/HEST

diff --git a/tests/data/acpi/aarch64/virt/HEST b/tests/data/acpi/aarch64/virt/HEST
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf4..39901c58d647 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/HEST",
-- 
2.48.1

