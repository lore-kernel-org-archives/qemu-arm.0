Received: by 10.25.77.65 with SMTP id a62csp381060lfb;
        Fri, 10 Feb 2017 01:07:24 -0800 (PST)
X-Received: by 10.200.38.196 with SMTP id 4mr6683555qtp.96.1486717644659;
        Fri, 10 Feb 2017 01:07:24 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f59si776035qtb.330.2017.02.10.01.07.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Feb 2017 01:07:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42594 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cc7Ao-000375-4I
	for alex.bennee@linaro.org; Fri, 10 Feb 2017 04:07:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cc7Ah-00035B-RB
	for qemu-arm@nongnu.org; Fri, 10 Feb 2017 04:07:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cc7Ae-0001fM-JK
	for qemu-arm@nongnu.org; Fri, 10 Feb 2017 04:07:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58074)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1cc7Ae-0001fI-DM; Fri, 10 Feb 2017 04:07:12 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 91B9480481;
	Fri, 10 Feb 2017 09:07:11 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-36.ams2.redhat.com
	[10.36.116.36])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1A977FS006695
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 10 Feb 2017 04:07:08 -0500
To: Peter Maydell <peter.maydell@linaro.org>
References: <1485422381-29019-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA8FWjeV+Gyd5J5zwiM4yajwPjt7obTNiLJa7S7DXDemLg@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <fbab658f-fc8b-61b8-5d81-90e93d6c71a3@redhat.com>
Date: Fri, 10 Feb 2017 10:07:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8FWjeV+Gyd5J5zwiM4yajwPjt7obTNiLJa7S7DXDemLg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 10 Feb 2017 09:07:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC 0/4] vITS save/restore
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
	Peter Xu <peterx@redhat.com>, "Kumar, Vijaya" <Vijaya.Kumar@cavium.com>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qer9tNW10Rix

Hi Peter, all,

On 07/02/2017 15:36, Peter Maydell wrote:
> On 26 January 2017 at 09:19, Eric Auger <eric.auger@redhat.com> wrote:
>> This series allows ITS save/restore and migration use cases.
>> It relies on not upstreamed kernel series ([1] & [2]) and
>> QEMU not upstreamed series [3].
>>
>> ITS tables are flushed into guest RAM on VM stop while registers
>> are save on pre_save() callback. Tables and registers are restored
>> on ITS post_load().
>>
>> The code is based on Vijaya's "GICv3 live migration support"
>> series [3], based on v2.8.0-rc4.
>>
>> The series also uses one patch from Peter Xu that aims at allowing
>> the explicit ordering of save/restore handlers [4], now upstreamed.
>>
>> That work was tested on Cavium ThunderX using virsh save/restore and
>> virt-manager live migration.
>>
>> Best Regards
>>
>> Eric
> 
> Looks overall OK to me (you've had some review comments from
> others but I don't have anything else particularly to add).

Thank you for your reviews. Yes I have followed each comment and I will
respin shortly. I have been mostly busy with the kernel series respin
taking into account Marc's comments and supporting 2 stage device tables.

Thanks

Eric
> 
> thanks
> -- PMM
> 
