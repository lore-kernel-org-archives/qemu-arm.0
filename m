Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp783901njb;
        Fri, 28 Feb 2025 01:16:16 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWEHcfpq6OJrCWpKgm6/velOGL0BihOnT6iVyvgqn5/YXnWYe3+ZhcXzjRWVcx2ZMtSjGWySxZL66USvw==@linaro.org
X-Google-Smtp-Source: AGHT+IGCgPyfYpSljHQqHeW7mFJj4pMg/4y3tdcV8Z5grJAHGlCPw61q3SrMa3QCFtERxV/V6dWD
X-Received: by 2002:ac8:7c4c:0:b0:472:4c9:617e with SMTP id d75a77b69052e-474bc0ac555mr40510121cf.31.1740734176377;
        Fri, 28 Feb 2025 01:16:16 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740734176; cv=pass;
        d=google.com; s=arc-20240605;
        b=abZZinOY6hp/L1/hte9/aON9H0Rv64Y9nJruTWo08En36zsR60UmI3oKoHRHNvCjrj
         +5fALK8vtlhHCthI0T3d85dRkA9dGFWNbVnhfC2OA15rzYRvXQ0w5UAxLJdHgiLEcPjc
         7lOyzNXRzU16kPnGMwkSTVPnxdKzgPKKNZkyoxehjrmtaY+DjYXPxOCrFtvAP3PGjAIe
         8ldsLqt1a/Vt+4z9/eNN3CiMajICsDU01XHhzvp6424VwPo2gzqFY4HNuu8VgDZs4TrW
         +TaxgMKXWUmNIWmoahlHvJpotSfU4K768qvGABGXgK6bXl6ypAhRmr1cfLYUrcM2WXgq
         y4iQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date;
        bh=rewVkKP9FWDX6KRom24JX26ze2Uwe1TX6UBzpf8WKfs=;
        fh=t/xybFWV2B884dK2bO1HGz5LnOWlFKzKgenI2zgFzYc=;
        b=htHeNgCd8XwpTjKPuY5WBDQb0wSTaoYXN4Phog/O6Yz8XMEaafAgh6Hj+UCx/XNxKy
         NnAbZI3JT54cjFq7hCBRth6vFn7VedXSUdVyPBu4+y1SkI6WfHuN18ru3bVXmmJ+8j2i
         +Z/TJyQE2N9LiXziy1jKPzt5vaGXKRn3YrfAOXpCvNmpMPj7k3sIa/WYL9iWxY5pawcb
         p0dU2wvQqhS+9TxKCRSSXOCyWS9/m+i+TmL0SS2z0QFpcTYgOdKcdJ3oPs+WiDzxutf4
         43p8OJSPayJQJwzsh4Fz5dJ4NxoA0gSQBuzcT5yIduz1eCvP7WsbzrEuWF8ArbSlF/iq
         dkOg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-538099-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-538099-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-538099-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id d75a77b69052e-4747243becbsi27677341cf.602.2025.02.28.01.16.16
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 01:16:16 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-538099-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-538099-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-538099-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E50BB170D2B
	for <alex.bennee@linaro.org>; Fri, 28 Feb 2025 09:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7EDD1CAA99;
	Fri, 28 Feb 2025 09:16:13 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7CA1C2324
	for <linux-kernel@vger.kernel.org>; Fri, 28 Feb 2025 09:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740734173; cv=none; b=akLkAf2uq/YTrCZiQisvRWSwp4XGq9JAiUL1tzUGfx+4yzGnIBw0mRQZuMSIskw6Bllz3ke/zeWkH1oNVA9XxtUGgfS6RcsEZikL1m79vZVml5sOwOY3SQh/QzJeAc7nCXMIHzOaUWiGALvkkozDbOv/Fpq1BKfWUIXS2TjGxwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740734173; c=relaxed/simple;
	bh=WO+i6VyjRmz2zkns4WnjNQ7uU9UYZ492QMjESSX5P0A=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LnjWEHodBsvO/ssnZgLtYVTWdabs3V8v99FvojJ7D1rRGC96tf9Y29gK/XZYYJmSZJmg4tOQLYWfV9SVmatQSEPQtsuNAE4I9/Lg9af11E7mwEK7oc2iHldavsmEJ0oFJx1rbiawq1X0oHsVPCAkicYclgaudjS91Yni+4aVaPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Z42Xd4FDNz6L5Lh;
	Fri, 28 Feb 2025 17:12:17 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 14B3B1400DC;
	Fri, 28 Feb 2025 17:16:08 +0800 (CST)
Received: from localhost (10.96.237.92) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 28 Feb
 2025 10:16:05 +0100
Date: Fri, 28 Feb 2025 17:16:00 +0800
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
	<mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>, Ani Sinha <anisinha@redhat.com>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 01/19] tests/acpi: virt: add an empty HEST file
Message-ID: <20250228171600.00002a63@huawei.com>
In-Reply-To: <4d281b9312cac07460ecf7822512031e778ef6b8.1740671863.git.mchehab+huawei@kernel.org>
References: <cover.1740671863.git.mchehab+huawei@kernel.org>
	<4d281b9312cac07460ecf7822512031e778ef6b8.1740671863.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: MTJNIpyQxVxb

On Thu, 27 Feb 2025 17:00:39 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Such file will be used to track HEST table changes.
> 
> For now, disallow HEST table check until we update it to the
> current data.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Acked-by: Igor Mammedov <imammedo@redhat.com>
Hard to argue with an empty file ;)
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
