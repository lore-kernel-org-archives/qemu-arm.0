Received: by 10.223.172.38 with SMTP id v35csp2806421wrc;
        Fri, 22 Sep 2017 00:34:10 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAP4VL7tUHEAww91hwPiBphGRE4LBG0LqhYOUYukkmJFavAHOCOe3DSP9P32eu42uvHCSTl
X-Received: by 10.200.3.111 with SMTP id w47mr7013059qtg.144.1506065650619;
        Fri, 22 Sep 2017 00:34:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506065650; cv=none;
        d=google.com; s=arc-20160816;
        b=Uue05CtpZtZBx66IHThszS228+sIgIyCdtrmoi7LHpITfgxEfjMv+yqKUWpgx50lIG
         cBcNOd7ssRVeht3ZZJMztfqMpKsazMDJ1odHHuCnJFXPvwztUKBP9su2tCXpDjgNeeCE
         ZUaZJZL7KdewpWsFajn0tBh3Zzln4DWRRTh5lVLUj7AfZKmqtDZVWwWrjhGPBAakMdo5
         tinKgZm8V4nCV+V0KXi7DNaTqfLZBHh9EDMsqPXh5AeOaXMVAK6TD4EQqdl2J6YPXB4W
         tGgOGWQd4txDM+RCf36/zGJxijaek1376lCudcFybi5b2LyRJXt3bqtlurnySNEwRE0O
         R3iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=8wVwRiXlLQhBVE0ECpdqN7C5HfDsfnaUaHBnejMCXQ8=;
        b=G9qkfZbcGzPVPwfptjT69OwuHAihtMIb6h61YpTITJpG9otD4zGqWcp5tTOIFpW9Ef
         bBbq78WKxpXgKhKcs+9RuKtQGc3QHlotLbg2Qi0EwNJDzOW+/Amkkv5ZyIC3t1sDU4kE
         0wx3sn0ACMrO4pegX1zjH5H9iGwfgcwFhTdbaqyv2x4Cjt8w5X9Vghbtd8atZZvqzKvF
         ZtB32+ULuMPgIVPwqZe1o/YBX5AEm5yO8lTWflmOd/Mp+OHCYiJZoU3xBRCxvF+PF2Bc
         2SeUhPcBOPE9GsBoZiedtXxz6JXUeU6KFbjn107P27578z6pbi8EhFETGojODY8nZYes
         JqXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t3si804341qtb.375.2017.09.22.00.34.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 00:34:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57086 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvITQ-0002j3-3h
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 03:34:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1dvITH-0002il-KG
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 03:34:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1dvITE-0001OL-Gh
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 03:33:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37446)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jasowang@redhat.com>)
	id 1dvITE-0001N3-Ai; Fri, 22 Sep 2017 03:33:56 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5FE50883B0;
	Fri, 22 Sep 2017 07:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5FE50883B0
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=jasowang@redhat.com
Received: from [10.72.12.19] (ovpn-12-19.pek2.redhat.com [10.72.12.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7361660F89;
	Fri, 22 Sep 2017 07:33:53 +0000 (UTC)
To: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
	<20170918195100.17593-9-andrew.smirnov@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <10a9c31a-5bd1-5915-4b82-1c3cf9cd8bbd@redhat.com>
Date: Fri, 22 Sep 2017 15:33:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170918195100.17593-9-andrew.smirnov@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 22 Sep 2017 07:33:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 08/17] imx_fec: Add support for multiple Tx
 DMA rings
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1mgCsERCmbwr



On 2017=E5=B9=B409=E6=9C=8819=E6=97=A5 03:50, Andrey Smirnov wrote:
> More recent version of the IP block support more than one Tx DMA ring,
> so add the code implementing that feature.
>
> Cc: Peter Maydell<peter.maydell@linaro.org>
> Cc: Jason Wang<jasowang@redhat.com>
> Cc:qemu-devel@nongnu.org
> Cc:qemu-arm@nongnu.org
> Cc:yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov<andrew.smirnov@gmail.com>
> ---
>   hw/net/imx_fec.c         | 97 +++++++++++++++++++++++++++++++++++++++=
---------
>   include/hw/net/imx_fec.h | 23 +++++++++++-
>   2 files changed, 101 insertions(+), 19 deletions(-)

Is there a register for driver to know about the version? (Looks like I=20
didn't find it).

Thanks
