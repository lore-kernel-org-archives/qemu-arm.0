Received: by 10.28.4.212 with SMTP id 203csp239223wme;
        Fri, 4 May 2018 09:53:25 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqIhoKjgzs56Z8udvoGimJnCsMVB3g+KxtVqbSsThoZBi79PlSOKQqiV/AGgx2tesBrAizf
X-Received: by 2002:ac8:2c98:: with SMTP id 24-v6mr24592721qtw.420.1525452805377;
        Fri, 04 May 2018 09:53:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525452805; cv=none;
        d=google.com; s=arc-20160816;
        b=IjVZHsK2kh6DE6usvg1fryZSz4DO0vvW8Vf+zPhX8yYk9W2OMI5JWZD2FSjSV7T94f
         CzaUu+D/Zk7Y8phoRGgIvQiSy5c19xGvgGAZa+mlNx5wZkQVIHrajneWcgIIxq2SmlTU
         brvdmMF1guxK1o//Q9NAKcELpFZEMOjHFiNJOOpdZgTLds5rZD57UilAFpQe67kBVCwi
         vZRX9CamOmBhAU3JqZstUrx7dd5oe8mEHSLqX58hYQ2cMCIRPsF6Mkcp5mbQh5dqih4o
         C6fJC7xSx6aIJ8zIIW/4gV55fi5fPVKr0Ngs9hXe+wnlNHQ0P0bVWgmnvkpx5ADeYY63
         HKtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=yHvEvxZ58sVv+tSNkf8oIHI5+0AxfwFfeo/byG6t0Pw=;
        b=j0kKlA0W7Lnq9qssIVvH7pMZF1108KEgCGunKCymV9eo0mp5Xs8tKB0YBUDOsYqePk
         rHSDHp5KK8qaQNpOFVOb3fikc7pGoSdYtPOgwm4iUyLRKZsFlSKmI+Fv0vobRRi2tkxP
         SETqPS8xIXxJhdZHH7I/7A4qgph0gG4wDxWhJlBoxTdY6P9HyVtqk31v+jZctIrEU0iv
         c29vZREf0pKfff779gxnb6K9hVFP1bR1ECsQ+2Y7UyU708ycBuFwCkcUd3MoU57b2KMB
         s9HsFTEqb9OmxfqJ1sUYxaK3DMhvLAfKsmm9PSGDJFhZqoMvJ6d35OxBBD1Pap/oMfR4
         +ZBA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u5si3321715qkh.146.2018.05.04.09.53.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 May 2018 09:53:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35481 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEdxU-00015B-UU
	for alex.bennee@linaro.org; Fri, 04 May 2018 12:53:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44391)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fEdxN-000153-CS
	for qemu-arm@nongnu.org; Fri, 04 May 2018 12:53:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fEdxI-0007qT-EA
	for qemu-arm@nongnu.org; Fri, 04 May 2018 12:53:17 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51352 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fEdxI-0007pj-8O; Fri, 04 May 2018 12:53:12 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F2B814025F12;
	Fri,  4 May 2018 16:53:09 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-57.ams2.redhat.com
	[10.36.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 163667C49;
	Fri,  4 May 2018 16:52:58 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1524665762-31355-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA9SyY=1eVdXkHpxyES004T5WAx_h9axDSSo-vk440sfiA@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <0df11de9-aaa4-0fb4-afc2-f4841bb9006b@redhat.com>
Date: Fri, 4 May 2018 18:52:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9SyY=1eVdXkHpxyES004T5WAx_h9axDSSo-vk440sfiA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 04 May 2018 16:53:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 04 May 2018 16:53:10 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v12 00/17] ARM SMMUv3 Emulation Support
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
Cc: Christoffer Dall <cdall@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Jintack Lim <jintack@cs.columbia.edu>,
	Prem Mallappa <prem.mallappa@gmail.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cY/4hyHGnRml

Hi Peter,

On 05/04/2018 06:51 PM, Peter Maydell wrote:
> On 25 April 2018 at 15:15, Eric Auger <eric.auger@redhat.com> wrote:
>> This series implements the emulation code for ARM SMMUv3.
>>
>> SMMUv3 gets instantiated by adding ",iommu=smmuv3" to the virt
>> machine option.
>>
>> Only stage 1 and AArch64 PTW are supported. [1 - 14] bring the core
>> emulation code. [15, 16] bring optimizations and 17 brings the vhost
>> integration.
>>
>> Important Note:
>> I added the last 3 patches for consistency but I would be happy
>> if [1 - 14] could land upstream first, without waiting for the last
>> 3 patch additional review cycles.
> 
> I have applied 1-14 to target-arm.next; haven't looked at 15-17,
> so I suggest you repost those as their own series once 1-14 are
> in master.

Sure.

Thanks

Eric
> 
> thanks
> -- PMM
> 
