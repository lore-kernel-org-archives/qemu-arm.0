Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1553543lfc;
        Thu, 12 Mar 2020 20:25:57 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuJ9nEhEC9tmTcfXuncTAVsXOZBbfIUByB5ognpyBHt+jUE9Ez438ICETiZO3QRuhdUsENY
X-Received: by 2002:a37:7f03:: with SMTP id a3mr10919275qkd.121.1584069957454;
        Thu, 12 Mar 2020 20:25:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584069957; cv=none;
        d=google.com; s=arc-20160816;
        b=iMDKKe+drsgx7c/0Ok+4anhvMEXxqeTaOW9Wc6TN4jD+h4z5Orrlx7PHwNcZT80w4w
         DWdWm+FCgzyuzmS5GG2UJxQhl0yKjL08fr7AHgiQy29Am2NWWmDKyeoxJaY8PMUJilgA
         i6DW07PuPpTYiS6cd4HwOF6Gb71ufnhW3MX1uo6Dd1sS+cgWf2qrY4wr4jJl3Zus0s0q
         g31g7CNSoRZa0Q7vUnngEYL+NxSFGnK0Ny+zRatED/oms3QtZXp80/U52xCd+vpsl819
         F5mLejf+yIHzeHYx1pNRqddjS1Z991L+QAfq5eyQ2TLPrDEn2CdZc35mh0jNBznFzXAE
         nNng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=pBxq8+I8hd/+XLj4RIr8QgpB57LKc57NW/tR4QiHdOE=;
        b=eKswbOYT5Zz9xr7mdiftcRamGjoX5RZg96wrxuwB17FLjl/ifmHogbCC/VqI7SSxfA
         y2urZ399GE271ih3anbNKvJMx1QUWWpsS8tDm8W/8ZTlTuPemXKE4qdEO3U9PXRqzgjW
         rIpCOHzrHYfw49EsDxC7uS+Rfbrrp9HXsrrNa02ueBQdF+C1+joArsTKspWfRWxnjMfx
         2dcO8g2UnscbCraDZopBIg+6K5INE2bUbBG999iQLeFeaVW0W84KQlL7N5n+zBZt5HBV
         KTsqMt5Vr6OtLsXc36B5woEvXqqA0UCT91J/+vv9hkGeiHAlK4x1GoGxYBKetsalayCt
         aFWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 37si3925194qtb.216.2020.03.12.20.25.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Mar 2020 20:25:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCaxQ-00073Y-Tj
	for alex.bennee@linaro.org; Thu, 12 Mar 2020 23:25:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38106)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhukeqian1@huawei.com>) id 1jCaxI-00073P-NG
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 23:25:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhukeqian1@huawei.com>) id 1jCaxH-0003AB-N7
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 23:25:48 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:44372 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhukeqian1@huawei.com>)
 id 1jCaxH-0002zc-BW; Thu, 12 Mar 2020 23:25:47 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id F40B1C7ED93B429C1D3E;
 Fri, 13 Mar 2020 11:25:39 +0800 (CST)
Received: from [127.0.0.1] (10.173.221.230) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0;
 Fri, 13 Mar 2020 11:25:32 +0800
Subject: Re: [PATCH] migration/throttle: Add throttle-trig-thres migration
 parameter
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20200224023142.39360-1-zhukeqian1@huawei.com>
 <20200312180735.GL3211@work-vm>
From: zhukeqian <zhukeqian1@huawei.com>
Message-ID: <66e1b7b4-1563-ef23-2dbf-a19311f3ec1d@huawei.com>
Date: Fri, 13 Mar 2020 11:25:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20200312180735.GL3211@work-vm>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.221.230]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 wanghaibin.wang@huawei.com, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GiyrRLPzNrmm

Hi Dr. David,

On 2020/3/13 2:07, Dr. David Alan Gilbert wrote:
> * Keqian Zhu (zhukeqian1@huawei.com) wrote:
>> Currently, if the bytes_dirty_period is more than the 50% of
>> bytes_xfer_period, we start or increase throttling.
>>
>> If we make this percentage higher, then we can tolerate higher
>> dirty rate during migration, which means less impact on guest.
>> The side effect of higher percentage is longer migration time.
>> We can make this parameter configurable to switch between mig-
>> ration time first or guest performance first.
>>
>> The default value is 50 and valid range is 1 to 100.
>>
>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> 
> Apologies for the delay.
It is not late, no worries ;).
> This looks fine now; so
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> and I'll queue it.
Thanks.
> I think we could do with a better description than the current one if we
> can find it:
> 
>  The ratio of bytes_dirty_period and bytes_xfer_period
>  to trigger throttling. It is expressed as percentage.
> 
> assumes people understand what those bytes*period mean.
> 
> Still, until we do:
> 
> Queued for migration
> 
[...]
>> -- 
>> 2.19.1
>>
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 
> 
> .
> 
Thanks,
Keqian

