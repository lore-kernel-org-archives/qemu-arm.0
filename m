Received: by 10.28.91.67 with SMTP id p64csp1075865wmb;
        Fri, 9 Mar 2018 10:03:25 -0800 (PST)
X-Google-Smtp-Source: AG47ELsjwkx7x9Mo6cBcjG+AlRar0o8AO1h9EUn5VdtxeMgrm5algmUSNHtTcObewvcuniSooNA3
X-Received: by 10.129.36.4 with SMTP id k4mr19736501ywk.238.1520618605185;
        Fri, 09 Mar 2018 10:03:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520618605; cv=none;
        d=google.com; s=arc-20160816;
        b=mXeHF4UxDpKPKPH4GermdoaO5O4aqPZ0whOF06UAi+T7mlx/6jPHyK5ujirhB1kxw+
         HjX3zlpaa7z3zSCc0vykeGqzDCiq3qpBhCDfVnHTJHJvOCiNM0lRTY7PwQBlmdxiaXwb
         8fLn/4ZndOpV+vkrM1KamFF/N/Sro/wZF1NhBbc21mSM4nULRv77JxODBt54L9EROq2a
         uRh/7Vc6UDpyCvJFQp8QAkSakGrLtcfhX+WCcZLl+6FDo2bHk/+1vTJPrnc3TzK9fdlK
         6oALgQhvyiaCx9YWySCFs7pQMkJdiY0yEkEevBhyoiQ15yDV20StjWUKpsom0B8uEqW1
         dbTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=B6fevJWzLPVMMb8RgC8tJnEjhmfaJsrJNOGIFei8GKE=;
        b=L2TXnr+fYqo41U0ym47KRSWIAw+2hh5s/FTdVnyl1q3YVUQsiaFUULu6Mcgva5/izH
         0BNZrInjHPX7DpoBrEfAwcqKJx3s551mF2NY/+0QWDa0DDww4zr9H6DbXTvX4oOOIlwi
         CZQIcX+DQB0iAFKsGI6Gqo8ZN+hCtAiLdJdWk6ChHr5FHaeScwt2v1ft4cgCAWqUXj/Y
         yBMc/WrTkKOHnBEVDLmHK1Mvy3S/D8ioLt+wMJg0/1fn1wCmw9jcGjiBZvaf6rXkoBh/
         qBwvNfFZcTb/E8NAHaKODLDcw5IcD4n54TSCEviPVQ6euXYATiJ73O4domqsML6GNiVP
         Yaaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a14-v6si237272ybn.422.2018.03.09.10.03.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Mar 2018 10:03:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47093 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1euMMW-0006oc-Gn
	for alex.bennee@linaro.org; Fri, 09 Mar 2018 13:03:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1euMD5-0006o9-Re
	for qemu-arm@nongnu.org; Fri, 09 Mar 2018 12:53:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1euMD2-0002x9-NV
	for qemu-arm@nongnu.org; Fri, 09 Mar 2018 12:53:39 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35808 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1euMD2-0002wu-IE; Fri, 09 Mar 2018 12:53:36 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C082B4023BB3;
	Fri,  9 Mar 2018 17:53:25 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D77132026DFD;
	Fri,  9 Mar 2018 17:53:16 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-11-git-send-email-eric.auger@redhat.com>
	<CAFEAcA8grbFO7E0yoci_dwr2xnH8ujS8cJnpNxGdz=JOged=Gw@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <a35ca106-b405-8c07-95b6-ff65f324fae4@redhat.com>
Date: Fri, 9 Mar 2018 18:53:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8grbFO7E0yoci_dwr2xnH8ujS8cJnpNxGdz=JOged=Gw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Fri, 09 Mar 2018 17:53:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Fri, 09 Mar 2018 17:53:25 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v9 10/14] hw/arm/smmuv3: Abort on vfio or
 vhost case
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	linuc.decode@gmail.com, Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3zleyWiLxo5i

Hi Peter,
On 08/03/18 20:06, Peter Maydell wrote:
> On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
>> At the moment, the SMMUv3 does not support notification on
>> TLB invalidation. So let's abort as soon as such notifier gets
>> enabled.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/arm/smmuv3.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>> index 384393f..5efe933 100644
>> --- a/hw/arm/smmuv3.c
>> +++ b/hw/arm/smmuv3.c
>> @@ -1074,12 +1074,23 @@ static void smmuv3_class_init(ObjectClass *klass, void *data)
>>      dc->realize = smmu_realize;
>>  }
>>
>> +static void smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
>> +                                       IOMMUNotifierFlag old,
>> +                                       IOMMUNotifierFlag new)
>> +{
>> +    if (old == IOMMU_NOTIFIER_NONE) {
>> +        error_setg(&error_fatal,
>> +                   "SMMUV3: vhost and vfio notifiers not yet supported");
>> +    }
>> +}
> 
> Is this triggerable by the guest, or by the user on the command
> line, or only by a bug in the board or other QEMU code?
by the user on the command line.

Thanks

Eric
> 
> thanks
> -- PMM
> 
