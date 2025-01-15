Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3040557njn;
        Wed, 15 Jan 2025 04:52:04 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUGnTveNCJM4hbFu5uXx3wXy9cO4qwXS+FhewQ7T4szmUMvr6BwDyJsoIEXt7BMXiF7J6dGsmsRCd6XZQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEYy79MwScwz5p+zkgONyoaxCWvqT5XZphmYtPIkLHeUYNfVjdrb5DzC0oY2+DPc1lFFCzW
X-Received: by 2002:a05:6871:6317:b0:29e:3132:5897 with SMTP id 586e51a60fabf-2aa0666a876mr16826805fac.5.1736945524533;
        Wed, 15 Jan 2025 04:52:04 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1736945524; cv=pass;
        d=google.com; s=arc-20240605;
        b=DMOghYuUX/J100AGFQ6QfswF87wzxCduG3y0fOR/9lB0LT9HKGLTUEkc3qjDuBpqF0
         oqmF+Z5TIqZGXzCS8/KaA97blHzs/tiV+2Rx2riISQkCx5DlHQFJcKBI5wV1LHSK8yhb
         BMeIbiUHtEwHGPDykCB/r/AsgSezZh8txmIhmF5CZ3U+AU9Kgo9dbBu2JcPlAECl99hg
         5h6+K9XSTb5ANGjCCa/IFO2hddtxz5IMYzcJuq0RHogzdtGMVjZ3rJCtnp35xnNcbg44
         BmwHImqdKG8SGCDVchugUboF+ekhSC0Yd70q2xTgn1P+ptLpy1od+0h9B5fnH3K+CbZo
         BnQg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=8auGG6UHlng8A5TbQyfRr78KAjuPFnRiWCGjaM5j314=;
        fh=BaBMhsa8otE44w+eiuuCkoL0QFe4OiybwLz9x35r5BM=;
        b=UjmcRMS6X8n2JoIQ6HN9brh51e8KuagCqm2d284ljK2rwe93kGD0b8H9seoO0tkj3R
         TykNOynd4PEs5EsG/wWuAd0JL594kV2gXHOEip94spH6BBvD/n1xMdto5AHi3nkD+uqF
         ZmDWEbioLccZTr5PGlYgUs+mF+J8gyLEF2XQ7IRGv+eXabnwS/74Aatt482bQ6A1MMRj
         LEqjjEut17uuf8CjsrU4RtUrhV4Xfvv5JJT4fjKuioJEdZYXxtIccA91Axa2RkgElIFt
         P+iUvEQA7xGnU5y+9ySkOqxwwqiAwk6j3AZF9TTqZz7HSeCfTWSKjd8DBX8Om2hv5QIN
         z+Uw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=DDU0nqJA;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-477906-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-477906-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-477906-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 586e51a60fabf-2adc31fcfb2si7151572fac.46.2025.01.15.04.52.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 04:52:04 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-477906-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=DDU0nqJA;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-477906-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-477906-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE04A3A8C88
	for <alex.bennee@linaro.org>; Wed, 15 Jan 2025 12:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C53A3243856;
	Wed, 15 Jan 2025 12:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DDU0nqJA"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63EB241680
	for <linux-kernel@vger.kernel.org>; Wed, 15 Jan 2025 12:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736945441; cv=none; b=dt3Vx0+XIDC0A6jZijsta2Xppd/DmFaIA9dxeWiHnGTmDIrbKFuMmg+BeFibhYbBNqC52/vtADlWSZzzBWpcYPjYvl+yuozvYiWQ0B7KOi0mtaEYoXPyQ1MbR//AlxMkcewN0PjcvRc1TasMtJiAFpO+GMXY1p6WVHqFeSVs2/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736945441; c=relaxed/simple;
	bh=k4Q14dwPPOhRIb8/2yHsoINkB9h/Hyj5Algfj5coTgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z6hawUSPZDFihJRoVAsUzrAAKdhnUJkwREB+ugYMJVug5UfT1XUoq2QkOHzT0+U6gPfbN0o9+KKwUr+pp44SbksdtMPP7dbsllhIL+kPE5JodQQ2aaFan4A5X090IS/h9L3hPOz4PApTYSmFnTL15RvzCI+JQZjcVUA9XuhZq24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DDU0nqJA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB4BC4CEE6;
	Wed, 15 Jan 2025 12:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736945441;
	bh=k4Q14dwPPOhRIb8/2yHsoINkB9h/Hyj5Algfj5coTgk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DDU0nqJAQJuNCbozk3DuEWPZ7RTF7CyyDs6uqrrQjenKkZyYxcHOAZz9s7KqvKrU+
	 V2ayzWfIkixomR4+mJyOX4xN4uG6DrS/7/mum/k8HPt0LqrZZZRQwhBa46+/BbC0r1
	 sFc8ZTYMK+IK7P738/Z29LRczn0wXod750BDgoeFEBlkIoS8DJcbYoX7jVir0haN7x
	 ObfjXYIOubP7fcEzJ4EuW/CVodEYaT2fJuyFUzet9hLyoJ746nw4FfPRv4W3ciMHP6
	 bgg2UeYp0Zs6atdUm06GPI/2k2lIo8m+lnzSxC9YmkKTgwgFgQVbmHmUcEn1rpcR0Q
	 GT377FzyxZ8XA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tY2r1-00000004yFu-0y0f;
	Wed, 15 Jan 2025 13:50:39 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 08/16] acpi/ghes: don't check if physical_address is not zero
Date: Wed, 15 Jan 2025 13:50:24 +0100
Message-ID: <da32536bf4962e5c03471e2a4e6e0ef92be4a1be.1736945236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1736945236.git.mchehab+huawei@kernel.org>
References: <cover.1736945236.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: g0MvrQWDs5Q7

The 'physical_address' value is a faulty page. As such, 0 is
as valid as any other value.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/ghes.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index edc74c38bf8a..a3dffd78b012 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -400,10 +400,6 @@ int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
 
     start_addr = le64_to_cpu(ags->ghes_addr_le);
 
-    if (!physical_address) {
-        return -1;
-    }
-
     start_addr += source_id * sizeof(uint64_t);
 
     cpu_physical_memory_read(start_addr, &error_block_addr,
-- 
2.47.1

