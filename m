Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1633963wrq;
        Wed, 13 Jun 2018 23:28:03 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLWm5z8FvLSQrbfAncaSIwCOycponJoJrZd1ZP2+nfgUj1mVc5aMbuWvXevqQCgDRve/NAm
X-Received: by 2002:a37:66c5:: with SMTP id a188-v6mr1019242qkc.201.1528957682959;
        Wed, 13 Jun 2018 23:28:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528957682; cv=none;
        d=google.com; s=arc-20160816;
        b=nfTcwFYQ/V5i8NZAO0aPpftP5SIbh07acx0rND1voB7XpAPFw9j7yA8i9t3f3LT3qy
         e8SgChsX5s13jvKGV+HruFGVpjrszgSMOsZjl7z2qXgaAu/oNM4XbOmga5ZhTokP//cB
         QxU/OqU46dBMhSF5DzUOOTBhsYElvMeE3EiMbwiSMgrYJoRyvwINmQJpjUG6vlFm//NX
         ITVgtncN4hVY9Ni1QlmdNhTqStfWKsY5aVd5SFF33HTUo+TluSj0mM0FkgCaWunf6UH6
         0By+P5jgFM5/swAMexzCEinKS9G5uPDgZQe3TqsCgYov9J41pqULMGEFcMkPeipFFbZ+
         IOXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=n9Zji2LLsVgeJqdZwGxjbzwMQBdzh1rRT1zad/hUvJw=;
        b=FH+dNTYdcPUngx9OcKSiaZRYwgVh5iLvx9zqVDBgQ5urRNXWx+qNumNgJgNtS/0PLN
         6O2w1jDNnjxyxCJifuj+DbglKwynTv5pxv+x8Jt1PFvgDb8e84ggFF0okT+q9mJCexmk
         5E619TDBBXAgpoNjauf0IJHIqBY81wdB07wX9h7a68FsCciovxHEOjWP0Agr2Gtj771g
         kLJQVIfBd3o6P5SgYdaTIc4mNKsL7UEUliidh2DGopge+UOFpSvzTYgl/N00QJ8ecPeT
         NkcZt29K0Tr44pmMSnnACCnUq4idXEXyMw6Kibb6VeX19A331fxG9s8Ba9QS/dh2hKVW
         aQUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 27-v6si4260619qkp.140.2018.06.13.23.28.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jun 2018 23:28:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38526 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTLjm-0002mm-Eo
	for alex.bennee@linaro.org; Thu, 14 Jun 2018 02:28:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43260)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTLjf-0002mT-Kg
	for qemu-arm@nongnu.org; Thu, 14 Jun 2018 02:27:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTLjc-0006vi-Fm
	for qemu-arm@nongnu.org; Thu, 14 Jun 2018 02:27:55 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48000 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fTLjc-0006vU-Ae; Thu, 14 Jun 2018 02:27:52 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ADECD4023334;
	Thu, 14 Jun 2018 06:27:51 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD2AA111D3CE;
	Thu, 14 Jun 2018 06:27:47 +0000 (UTC)
To: Laszlo Ersek <lersek@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <1528879723-24675-1-git-send-email-eric.auger@redhat.com>
	<1528879723-24675-10-git-send-email-eric.auger@redhat.com>
	<8bf1bccc-b32a-9982-6123-b644c41a96d3@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <33a3fa10-bf1a-45cd-73bd-403cbd8d4792@redhat.com>
Date: Thu, 14 Jun 2018 08:27:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <8bf1bccc-b32a-9982-6123-b644c41a96d3@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Thu, 14 Jun 2018 06:27:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Thu, 14 Jun 2018 06:27:51 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 9/9] hw/arm/virt: Add virt-3.0
 machine type
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
Cc: drjones@redhat.com, ard.biesheuvel@linaro.org, marc.zyngier@arm.com,
	christoffer.dall@arm.com, zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XfH5blCwaosL

Hi Laszlo,

On 06/13/2018 11:05 PM, Laszlo Ersek wrote:
> On 06/13/18 10:48, Eric Auger wrote:
> 
>> PATCH: merge of ECAM and VCPU extension
>> - Laszlo reviewed the ECAM changes but I dropped his R-b
>>   due to the squash
> 
> Was there any particular reason why the previous patch set (with only
> the ECAM enlargement) couldn't be merged first? To be honest I'm not
> super happy when my R-b is dropped for non-technical reasons; it seems
> like wasted work for both of us.
> 
> Obviously if there's a technical dependency or some other reason why
> committing the ECAM enlargement in separation would be *wrong*, that's
> different. Even in that case, wouldn't it be possible to keep the
> initial virt-3.0 machtype addition as I reviewed it, and then add the
> rest in an incremental patch?

Sorry about that. My fear was about migration. We would have had 2 virt
3.0 machine models not supporting the same features. While bisecting
migration we could have had the source using the high mem ECAM and the
destination not supporting it. So I preferred to avoid this trouble by
merging the 2 features in one patch. However I may have kept your R-b
restricting its scope to the ECAM stuff.

Thanks

Eric
> 
> Thanks,
> Laszlo
> 
