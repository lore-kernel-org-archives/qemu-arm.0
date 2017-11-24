Received: by 10.223.159.82 with SMTP id f18csp2174714wrg;
        Fri, 24 Nov 2017 06:32:25 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYbbynGcQddxBjyXnpM8f1SSADgHjz+bcHEH9VB6S2SS2BdQGmcEe+NAIzm7wF2n1oRut91
X-Received: by 10.37.29.4 with SMTP id d4mr17653427ybd.168.1511533945094;
        Fri, 24 Nov 2017 06:32:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511533945; cv=none;
        d=google.com; s=arc-20160816;
        b=V7jb2k+JPWjk1CW4GGD2TOvRVu5aGEk26efR4WrVpJya4Nj6dtfb19SpoRXjJ/3aMW
         tJX65smXZTIBW+CHbLnj4wzAqWDqieNb7sXYkE8SvWkA9oOzlEf9ksnY7ToVp0wQS5yG
         lpuIZLuDhbgjIRYfCqDYPyftpfm3K6/5dMX8RnpwFAWhnK3qV71eVrZJmff+oNOa+HtU
         V/Rb98MeF0tQIMk1yA0TauRmk8I99zm19/FhqQnxfii+ancAwcEkec4pN6dLVlWwZO2E
         YkniQxOnRns7ehl8/Az1aFyu4UOiKXnYXZianQBMThd4cBFUaNqufcVgugNBI3rkbXDU
         oGMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=7fA9gh8fVzP0TPn58QKfI7eYl6p5UDxbmR0CPZLZm6E=;
        b=oO/S/PQqTy2SQvDSrNMUHBSMaA1DXXWiKL1PchNRHt7vBgrGp2gjzWLV5bFVj0UmS7
         oR3JYbGJkvBadYJlhkSphnAsymdh/Ecogj5bYgkUF55i93bpHH/V/8qsCiHbheiJls/F
         S2gVTsY3klpWvnih6V643Stw7LPl6JciWRy3CwwmJLdKnqUTRfLLIIe6VoGKcodHufrD
         c5mhzl/IxRz1heIj8MRiuRdiBMFNsIZwUfaZNRr1PaTt/kbVVlSYUicWf6IIrODx4E/y
         ce2MpStPZ5+QrdKQ71p9SG6hi460KDxVOFGPEue9t9C1Z4F1ip0zyKaVbPDep1dflr5G
         I1sQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s100si4742896ybi.92.2017.11.24.06.32.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Nov 2017 06:32:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49586 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eIF1k-0003LS-HW
	for alex.bennee@linaro.org; Fri, 24 Nov 2017 09:32:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eIF1c-0003LC-2M
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 09:32:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eIF1Y-0002GF-Uj
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 09:32:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45332)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eIF1Y-0002G1-OS; Fri, 24 Nov 2017 09:32:12 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B8F707EAAB;
	Fri, 24 Nov 2017 14:32:11 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-138.ams2.redhat.com
	[10.36.117.138])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37C4560A98;
	Fri, 24 Nov 2017 14:32:06 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1511533107-5315-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA_K4f=mmuoEbyuFCHP2dor5p2UPyedteELQoxPYFzAcEg@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <dd80f8f3-26da-5893-fa4b-cfa31790394d@redhat.com>
Date: Fri, 24 Nov 2017 15:32:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_K4f=mmuoEbyuFCHP2dor5p2UPyedteELQoxPYFzAcEg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 24 Nov 2017 14:32:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v5 0/4] ITS Reset
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
Cc: Andrew Jones <drjones@redhat.com>, Vijay Kilari <vijay.kilari@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, wu.wubin@huawei.com,
	wanghaibin.wang@huawei.com, Christoffer Dall <christoffer.dall@linaro.org>,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LD0sEqN/xusO

Hi Peter,

On 24/11/17 15:20, Peter Maydell wrote:
> On 24 November 2017 at 14:18, Eric Auger <eric.auger@redhat.com> wrote:
>> At the moment the ITS is not properly reset. On System reset or
>> reboot, previous ITS register values and caches are left
>> unchanged. Some of the registers might point to some guest RAM
>> tables which are not valid anymore. This leads to state
>> inconsistencies that are detected by the kernel save/restore
>> code. And eventually this may cause qemu abort.
>>
>> This series adds vITS reset modality:
>> - the 2 first patches bring a minimalist reset through individual
>>   register writes. However, with kernel versions < 4.15, this reset
>>   is not complete (vITS caches are not voided).
>> - With kernel versions >= 4.15 we can rely on a new ITS KVM device
>>   reset IOTCL. The last 2 patches introduce the full reset.
>>
>> Tested with 4.11, 4.14 and 4.15 host kernels.
> 
> Thanks. My remaining question is: how important it is to
> put some of this into 2.11? We're getting quite close to
> the release now so I'm getting gradually more reluctant
> to put in changes.

I fully understand.

Anyway clean and comprehensive reset modality would require v4.15 + full
QEMU series (otherwise you get the scary error message even if full
reset can be achieved by individual register writes).

This means the migration of guests while they are booting will not be
functional in 2.11. However it should not abort QEMU as it did before,
with a kernel >= v4.14.

Thanks

Eric

> 
> thanks
> -- PMM
> 
