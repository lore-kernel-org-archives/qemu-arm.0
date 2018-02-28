Received: by 10.28.91.67 with SMTP id p64csp363097wmb;
        Wed, 28 Feb 2018 00:44:32 -0800 (PST)
X-Google-Smtp-Source: AG47ELsVLOe5k9uhiS4koByalNrHpOXjyQjk2M5B2aHVuKeP1V/+tdqsqAtmZKRf3nMY/Cb82rW6
X-Received: by 2002:a25:ad08:: with SMTP id y8-v6mr11429402ybi.35.1519807472160;
        Wed, 28 Feb 2018 00:44:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519807472; cv=none;
        d=google.com; s=arc-20160816;
        b=aU9ZNbYMEYTgwiXgBmC5E40YpSneokFemc0ARJtP6YKBLy2oUjcLgQjRUzZxeEccHJ
         zQj3wJlQrTpgrd+Gf4Yzpm+nfoZ1QUu+iBKTdGHgBcAYjnrAwe4R1Uje+yT6zWjksQPm
         rIAxVVA1bAoRkx3UwkxEp4vSGcim9BvzER2xfYD+qDeqXX1fY9zoAjS7lTuE5xOTxaaT
         GwV6OPhsAoQM2NcSUvXx5yXwQBs7pYqNP+u874uEPyQGGlgMhzIyA7cQw9QyO+I4gcS5
         n4uQIr6kDW0W+S/cpgJKiu79qr9qN6Uupy8IfH86l2SpXzW6bk58JG4qn6aRT5N2cx+R
         wlUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=rgNOfgLlX0yDz81g0Gg0pTtwM1wQwYSmubPmTBWAKBo=;
        b=ZCBAJ9g0Bv6vECLyHgtjcod3+Yy5HYMBanOP8iLCoyrsEeTSUiYVRzMGT2nfV9eWHU
         JMgrYfszuLwOnkzEKoijuH/AlvCZxOu9aq5y9ov9w1n3Ne2m6wBf2CMtOpZcJpNWEEnF
         PA98Ey25ZUflcYm/VXBQRCb9HAhI79Xu1Q7cPydI7z6XzdH395kr1DYjQlRgqokiBfzc
         Q7etMpmlaHDs+0KmqXcUXIWt5/srsyRXljhsJgWW4A7UUl3U6eTEHFtS4kKpQgsScXiG
         Wznh1hQFQxra1JOgLV9lPA1kW9buW6V7OuHUglyhKWuiutUWG8QFIwRX1826Z5yuX44L
         Io/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i66si203321ywe.138.2018.02.28.00.44.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 00:44:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42862 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqxLj-0002F0-KZ
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 03:44:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40502)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eqxLc-0002Ei-BK
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 03:44:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eqxLZ-00063j-7V
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 03:44:24 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:47056 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eqxLZ-00063V-2E; Wed, 28 Feb 2018 03:44:21 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B092D17CEF3;
	Wed, 28 Feb 2018 08:44:12 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10CE52026E0E;
	Wed, 28 Feb 2018 08:44:04 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA9KzitEO21Rgh8Azip+gVJjyobzNbk8sHuQf-ngg+Jjxg@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <74aa2e5e-ed1b-3cf8-8ddc-41f7ef90ad7b@redhat.com>
Date: Wed, 28 Feb 2018 09:44:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9KzitEO21Rgh8Azip+gVJjyobzNbk8sHuQf-ngg+Jjxg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Wed, 28 Feb 2018 08:44:12 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Wed, 28 Feb 2018 08:44:12 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v9 00/14] ARM SMMUv3 Emulation
 Support
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
	Prem Mallappa <prem.mallappa@gmail.com>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D3PT/jwNlM+7

Hi Peter,

On 27/02/18 20:02, Peter Maydell wrote:
> On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
>> This series implements the emulation code for ARM SMMUv3.
>>
>> SMMUv3 gets instantiated by adding ",iommu=smmuv3" to the virt
>> machine option.
>>
>> VHOST integration will be handled in a separate series. VFIO
>> integration is not targeted at the moment. Only stage 1 and
>> AArch64 PTW are supported.
>>
>> Main changes since v8:
>> - fix mingw compilation (qemu/log.h)
>> - put gpl v2 license on all files to respect initial license
>> - change proto of smmu_ptw* to clarify inputs/outputs and
>>   prepare for iotlb emulation
>> - fix hash table lookup
>> - cleanup access type handling during ptw
>> - cleanup reset infra (parent_reset)
>> - replace some inline functions by macros
>> - fix some CMD fields
>> - increment cmdq cons only after cmd execution
>> - replace some remaining error_report by qemu_log_mask
> 
> What state is this series in now? Is it "seems ready to
> go, needs review"? Are you hoping it might get in for 2.12,
> or targeting 2.13 ?
Yes I think it is in a decent state and I would be happy to get some new
reviews, for a tentative pull in 2.12. In any case I will be reactive on
any comment in that prospect.

Thanks

Eric
> 
> thanks
> -- PMM
> 
