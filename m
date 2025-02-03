Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp2017536njb;
        Mon, 3 Feb 2025 02:48:30 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVho7dtJlYBkm3UYmdLr8TGZrLXT6qTfxioKbpmo4s9XK+Vo1VCJosK+fwDYj97T6CNd5lvZZzd9boz/Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGnZam2joKWRMYtjIMLH5nB3kwES05KJ5EeSwnzjyA3/l8ixhtSv1W/HONxA15MybYlLz+I
X-Received: by 2002:a17:907:d25:b0:aa6:7ec4:8bac with SMTP id a640c23a62f3a-ab6cfcdf329mr2191001266b.17.1738579710241;
        Mon, 03 Feb 2025 02:48:30 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738579710; cv=pass;
        d=google.com; s=arc-20240605;
        b=eOlyXUl/gAhAUD14awDr2KKijXfrWbjUpkS9NjdJcY0SoAlSoITNsOoC56WODGKgQO
         NeKM1OIYa39QrdLRjLDSQDOWR/vC/hnAOvJegV5PFuAxm/CDP2i1B5S40uiE138eoPac
         1eniUm2eAyqHgiIPjMxc+S3BpV2HL9AvQicQDoc/QqheU+OkmXwMr+jl9PVymtJSwYto
         Aa+mAKG8jiSrwk3GkGOM+nzRI8qcFssDjaLj2pnV8gFtECLOsnPTjSszn4rV8rXokMuj
         aiwDf+7fjE4ZAUZVtUQb6EadIoETbwhqPuPP9PH/9iZ+Kc2ICtdLyL6Rau7aAPfU9hme
         1xRw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date;
        bh=LjmTkWffHpJuMiy2hvbzRATCaXX8xvXsyUV/broSJK0=;
        fh=DjfmP4GuGmv+HIZ6mSuNbs+OASAdIuzO7/WHsW02d/E=;
        b=CqX7QFCiMw62W5oUMtdvMN6PDOgoV43RiZA+arG+pidf2Biccn0cYuiaRbA899Q7lM
         IIyw6tdtGeiM0as/NAKHxWVlIgpr98GOcNiAFD57HMlcLzxhAIbFZhgV+ZVAc+B7agDB
         1B96wWvKIs/eooFLDgfrXX6JgxbVwrLdKm7f58Q8cwpWikPOFAXEoCymrXn23BsshfRs
         BlF+O4zRwd0TX7dL+xBU0ZxSwWLNgadwEiLtLxKMnRkRdSUT0mgooomt8y7gBI1nJzrn
         w7CH/cBgqT1Lg1d2H2skJ51zb5ZH9vFh28U0rqzSMELF1FfL6vVoPY9VPjWVuP+jfs1k
         TEeg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-496349-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-496349-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-496349-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-ab6e4a31237si852292966b.453.2025.02.03.02.48.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 02:48:30 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-496349-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-496349-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-496349-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE6391884779
	for <alex.bennee@linaro.org>; Mon,  3 Feb 2025 10:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A45420125D;
	Mon,  3 Feb 2025 10:48:18 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763DB1E0DB3
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 10:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738579698; cv=none; b=kzHOkZDuuAJ2mShgI8H8y1C4ct6AcUwqMetG8eAdk7kXJWGl9X1sHImEBWKgbAFxjJC0F7pJkHu390zQqoXxTLrEiGRhOqwDbWh9EVXhrDHOAuD5SePwlB1eUEMxNuTuRGm2wPeQgfpQgmxtGb3foJYqi8OyjDZNPS6sJWUHhdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738579698; c=relaxed/simple;
	bh=rWhqo7cWXmDaDOxPmSGtMMFh1rZMXRwWbQYw7ySRD3o=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rJqmaanBwy/y2tSI9fEJeb9cHB18/XOLrKN7RVjXJ/o1PuHlKvfyhTJ+Nd0GICOMlJl6UHGnkguAcTLZgX7lzsK++HZdYJENlE9FZAXRPD19wjVL/ENR15BM/xZieRrkSmEJRKkCg5pKHF3gs6iPi7t9YkARlv8RK+wExyIcJOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Ymjnx1zTjz6L4yY;
	Mon,  3 Feb 2025 18:45:41 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id EEA59140C72;
	Mon,  3 Feb 2025 18:48:12 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 3 Feb
 2025 11:48:12 +0100
Date: Mon, 3 Feb 2025 10:48:10 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
	<mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
	<gengdongjiu1@gmail.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 06/14] acpi/ghes: only set hw_error_le or
 hest_addr_le
Message-ID: <20250203104810.00002200@huawei.com>
In-Reply-To: <7fbe05cb97c50addb61920c68e1aa5027a64610c.1738345063.git.mchehab+huawei@kernel.org>
References: <cover.1738345063.git.mchehab+huawei@kernel.org>
	<7fbe05cb97c50addb61920c68e1aa5027a64610c.1738345063.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: /hcE9vqVhRjH

On Fri, 31 Jan 2025 18:42:47 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The hw_error_le pointer is used for legacy support (virt-9.2).
> Starting from virt-10.0, HEST table is accessed via hest_addr_le.
> 
> Remove fw_cfg logic for legacy support if virt is 10.0 or upper.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
