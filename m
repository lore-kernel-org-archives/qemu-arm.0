Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp140516njb;
        Thu, 27 Feb 2025 03:04:21 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXXuD1uVySu/G29WDN/UWYB1jOIvG2kVSI1QxQLH5Q1Q1Zjk/xgAItjl0kpIfx5k0MfwZvDEwlr0RRhqQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHvy3DKJ6TCMiHq4VubvQZqBXlAm6lHPAVkT7QFSdH2N0tFgrq8senwVDvIpBfJSYi5indj
X-Received: by 2002:a05:6214:f0b:b0:6d8:9cbf:d191 with SMTP id 6a1803df08f44-6e6b0077691mr315783906d6.12.1740654261299;
        Thu, 27 Feb 2025 03:04:21 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740654261; cv=pass;
        d=google.com; s=arc-20240605;
        b=cvOa7lWDCO1ZgbX/iHecOmS6+MLRvy3uVO2WtJEXpxlEY62ndtxQT6hz3looOI3IJG
         B85LDfyJMSm/6p3bgbFKkOv48ctpBg4SyaodTSnkgNzSz4ZHQ2UblcOjgv++i3BrEVc+
         924q2MFZnaKif5J23HLwsF9ouiTTI9Bo37qw7PmgVMGY0pvnaHJWA7csxQUI+UiCAWVw
         VNxN6EI9VDaIcgU6nRdH2iAkYQEFLmuNiA6tWZiT/TUC3uQbIGMv8O0t5ryk8bWaqvtr
         eay4/4fF5Ur2MWrhHxxTYTzmBcH2ilwgG84nSY4tNh84QCypgOgWefzKqjUr8U9sJvls
         iMPA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=PVf/QwJhDIOgfQqd40ttTGKjS5IVRsnjZtcvU+0f0ng=;
        fh=vRlcgZ7942FHQd1Q9f6uT6HY2D7AnE0jt7dFCXEYTHw=;
        b=bSPUlMzcZzVgJUaRXURJ51HCboaFR8eqAdmxlKAeN/gpwJ9nYXse7/+89ZYfzxibSr
         5vD94bTUi+6pJFd+MazDY0ZUXS/LLtAqY3xVdUcX4lkg5LVh2P3yuovboyNmp9iupt4/
         bnQsu28t7p9juVM2oh47IzRvD87QiNV1oikckNc/7feTjjtLZ4hxldj7EuTaFJ17VfAH
         oOzwXDNSWvGzdjwkFogyQ8SkKF8J0Z3EINMXpFniTs19eJCN9ui2/kzImxSp75JLCl3d
         j+uUGUfv1sl4mRxOFA/KG81t1m8I+90hk8XriSai2uVECxtdxB986BrUTm5BMBlf10Gv
         ShsA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=p2CQdGU7;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-536066-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-536066-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-536066-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8975e792dsi11157676d6.75.2025.02.27.03.04.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 03:04:21 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-536066-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=p2CQdGU7;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-536066-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-536066-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8267916AC9D
	for <alex.bennee@linaro.org>; Thu, 27 Feb 2025 11:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B3022B590;
	Thu, 27 Feb 2025 11:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p2CQdGU7"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7972322AE65
	for <linux-kernel@vger.kernel.org>; Thu, 27 Feb 2025 11:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740654238; cv=none; b=qIOaQ7XB4zhmGHfzDZOsxny6j/AqQ8uiJku2yyQwZS/T4K0spAn2V3I7fy0BbCJ3M9CNMuofUX1/zl/nj1QYKj/uGUOT77w0CmLQihxaxPMWKfqVBWhsyr73vwoaBSVCq6HiE2UiAqmt1jiB4/7jPYzwZTowWEVBk1dHdkyu/Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740654238; c=relaxed/simple;
	bh=lEo2jNIgAk3ZjJgy5xIzg8AzQhxCgrbkVelQc/it8Po=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f72E4X5JFsKG2efIJ5OOc/JqSw5237BrNuxiosj+rV5YEuQ8WXzaHhvCsvqS2FWmY1YqyI5T91mooOL4cGOoGFAXshqQCrYRsE9IxqbufQV2HYZmuDAWBXQxaegl+HrQAIP6uUGKACHccVyzxlNGGysprjSavq7wKRT4eRuXHhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p2CQdGU7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF75C4CEE7;
	Thu, 27 Feb 2025 11:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740654238;
	bh=lEo2jNIgAk3ZjJgy5xIzg8AzQhxCgrbkVelQc/it8Po=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p2CQdGU7i6faoDJLGZ7crDGcRR4Bg1TsSA7iCjt44ot3hIkO+UCOju0tThQSVecdT
	 XuA95nrBN/pjZ37KUx3Kq2rAp+s0eg7ipzC9c7r2RvVv15r6eFGj6mkJF1M9Uvm5hh
	 wA2pQY5vqgV16yRYofuMeYvDOYLzFoBVkl3oT5j4wHVH1vhk9skSSa4kHB5JV1MQMs
	 8dwhpq7CEwtyiWFVAP9wzm83Hh3fibDr09zWYVljxaOEv1yMBcwBiXaaFV39uS8ooe
	 De5JRmQQvFmiAXTvLcK35NMbYpoQq3zNQP26AvaJOxboLf3ewkmIcVrLE18NB1YjgW
	 ygc7yBDdAWWnA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tnbgK-00000001mQe-0Eii;
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
Subject: [PATCH v5 02/21] tests/qtest/bios-tables-test: extend to also check HEST table
Date: Thu, 27 Feb 2025 12:03:32 +0100
Message-ID: <3ebde58416b8be1140c569538192399feeccf412.1740653898.git.mchehab+huawei@kernel.org>
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
X-TUID: 6N5GKwgy/GrZ

Currently, aarch64 can generate a HEST table when loaded with
-machine ras=on. Add support for it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tests/qtest/bios-tables-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 0a333ec43536..8d41601cc9e9 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -2122,7 +2122,7 @@ static void test_acpi_aarch64_virt_tcg(void)
 
     data.smbios_cpu_max_speed = 2900;
     data.smbios_cpu_curr_speed = 2700;
-    test_acpi_one("-cpu cortex-a57 "
+    test_acpi_one("-cpu cortex-a57 -machine ras=on "
                   "-smbios type=4,max-speed=2900,current-speed=2700", &data);
     free_test_data(&data);
 }
-- 
2.48.1

