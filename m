Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1677795wrq;
        Thu, 21 Jun 2018 00:54:33 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJxFwVYUk+NtWOdZA1Opgchxm+Y4jdkRi1W+YHs256SqFVF3ucp4mb1Ae9w8xj3cm7Kmejh
X-Received: by 2002:a37:8202:: with SMTP id e2-v6mr20505457qkd.443.1529567673134;
        Thu, 21 Jun 2018 00:54:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529567673; cv=none;
        d=google.com; s=arc-20160816;
        b=fUXqwIQeB1J1468E81hwvQ6ZDFHUYOrkrG6ZCGm4J7b3+eOzC96vxZesiZBno1+XRY
         Fs+NL1ee2BsQ9WUU03iPTqh9oBrX0h1zSoWp/nNfwRc469sygSieV/jwb6UfuIT7khId
         +pQ0n/8JXea90ywHOXlva8JpzEyiDxTjOzo49h/nC8Lhc+BFlveyRO/yfpY8ukOrcQo0
         BmiEi4MBF+cDF4wXEC2N1oqBOZmz7zy8hvHHB6M47q5WtJf//45rvNsSX+2nxCAfjVYw
         L3Zn7Z0d/gkL0HuwdGK7N/vrzbhpk1LPqEJ/mM5HLW5VloH6SMTEGVa6vHT5B3vLL3+2
         K16g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=fwogHR4B9RzVD3pCi8iNReP1mXUmLxYNDtm8B1Kjxvg=;
        b=Zpif9uEk3jYPdLPjdcLyD7FJWmT8rSUYK5iAdu3kMyaBNfnOjckqoafjh4zq4alXnT
         8bQpkXZXvXHuDwQkufl8MW37SWUPaIeY9WOox/tBfQsx/ON61EO28ODHHSZXugiXtHVs
         qdRnRygK2XLcLvGnFETsS8VXV8PMruCJpg/kEOs5MeS+HcyX43B0GslKXdTUwfz+uTkv
         QpXMtaDDmF2e05G+DCDc+SYQGnqOFbyY6Laj8GqRVLU3WgHrREMSuBVMOaqyDDJrYD/3
         0hAw2eTkX/2oyWFbH93D8MOgAta0BBr6Dvy0inv5/ZQpq4EG/Fkpt9ikY3YKdaLt5ZPL
         glIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m127-v6si4079788qkc.186.2018.06.21.00.54.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jun 2018 00:54:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53670 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVuQK-0003vz-ML
	for alex.bennee@linaro.org; Thu, 21 Jun 2018 03:54:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fVuQC-0003tt-4p
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 03:54:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fVuQ7-0002NS-7H
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 03:54:24 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49248 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fVuQ6-0002NF-Tn; Thu, 21 Jun 2018 03:54:19 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0D48468802;
	Thu, 21 Jun 2018 07:54:18 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3CF42156880;
	Thu, 21 Jun 2018 07:54:16 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1528790908-23441-1-git-send-email-eric.auger@redhat.com>
	<1528790908-23441-3-git-send-email-eric.auger@redhat.com>
	<CAFEAcA_rgm7KX+Tm+TkgoKEfAV0f-vAeoQ5dv_jBzfA47kAWNw@mail.gmail.com>
	<CAFEAcA84MpwJj8n0LvyE0BrfuJLCfB4rVWT=o0GcDn-6HpMThA@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <dfcf6ddb-5bde-ea8c-6b26-e44cc5e1632c@redhat.com>
Date: Thu, 21 Jun 2018 09:54:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA84MpwJj8n0LvyE0BrfuJLCfB4rVWT=o0GcDn-6HpMThA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Thu, 21 Jun 2018 07:54:18 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Thu, 21 Jun 2018 07:54:18 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v2 2/4] hw/arm/smmuv3: Cache/invalidate
 config data
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, jia.he@hxt-semitech.com,
	qemu-arm <qemu-arm@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
	Jia He <hejianet@gmail.com>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zmn6j1I0ptu5

Hi Peter,

On 06/20/2018 06:10 PM, Peter Maydell wrote:
> On 20 June 2018 at 16:56, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 12 June 2018 at 09:08, Eric Auger <eric.auger@redhat.com> wrote:
>>> +smmuv3_config_cache_hit(uint32_t sid, uint32_t hits, uint32_t misses, float perc) "Config cache HIT for sid %d (hits=%d, misses=%d, hit rate=%.1f)"
>>> +smmuv3_config_cache_miss(uint32_t sid, uint32_t hits, uint32_t misses, float perc) "Config cache MISS for sid %d (hits=%d, misses=%d, hit rate=%.1f)"
>>
>> Does our tracing infrastructure really support floats? There
>> is no other use of it in the tree. There is one instance of
>> 'double', though, so maybe we do.
>>
>> In general I think we should prefer 'double' over 'float' anyway,
>> though.
> 
> I asked Stefan on IRC and the systemtap backend doesn't support
> float or double, so we need to use an integer type here.
> Lazy approach is to just round the % to an integer; if you think
> the extra precision is useful then you can have %d.%d and
> calculate the 10th-of-a-percent digit or something.
Oh OK thanks.

I will adopt the lazy approach then ;-)

Thanks

Eric
> 
> thanks
> -- PMM
> 
