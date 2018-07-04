Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp505313wrq;
        Wed, 4 Jul 2018 05:53:34 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdWUhwMiq9mXhonZe+zRcG8XTetwo8vFeMwinWBWex+sCUIVp+HiFhmOeg/SyzsjQi3MuWd
X-Received: by 2002:a37:a6c6:: with SMTP id p189-v6mr1480843qke.9.1530708813938;
        Wed, 04 Jul 2018 05:53:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530708813; cv=none;
        d=google.com; s=arc-20160816;
        b=N84OGpqA78v2C2mNRApYwH0kxdFgqgNhZdeB+zfax52qG9u+N4FTYNaAdzxGEwsOGK
         lC4XRTD50E/NlPq9/s0GrPUalD4z+fLkaCNRRJcICPdTcH2sLnISPgVEsipwmTtJ5zEC
         oQOQSIhI35bdj/08XvmgvwjGj9w8aPCf+bwud8qpnyDngfUiFnT5nh351s/mKQHRxcRa
         qlJeQ7zXkw45BMODXy9Ssv8uh9rHcBKPd7cBpv0PB8B9MlXfKf6gqF0OHhXEYGCEVtCm
         +1uUnqlsFoTJ9cMKKcPjUxxLjv6N7oHd49e0Iaj42lFxueqK/9QuBERta7PBN3T01Vbn
         Hfxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=lS8Y8lEHDCSVn7gTLr2ikAFBQNr1jUbeF2HPiwsOC4w=;
        b=NV/+MsZtmetoLVn21NjhgH2zHZwV85Ek2QmzGAaSAwuNfTT61yaCx3RbXbRD5HBp8C
         sHDmbxTSMiLB/ts3x9UXe932uvE5KHhRCuK5FMb03qrCfAKabSgME4IzB6sslYIpDA9b
         dzsB1WvMc771a0c58znUGGdh7WYdSaU2I+MzqPTs2OYKKXo8rz/4hTwFOGYEpxHuno4g
         ewnecfx8RTfaBphF9KL86bkd/N+YsaG391vEuf12jDiebMbWUmt0sya1J281n6i1rXs6
         JRGBWXQ+lOxDr18HaGIiiJi6fiAbIi5mSzScj8i9jNJ2GVVYWRZXLLz2EC37FVyRY7D2
         3OGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j8-v6si391032qkm.293.2018.07.04.05.53.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Jul 2018 05:53:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46930 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fahHp-0001so-Bn
	for alex.bennee@linaro.org; Wed, 04 Jul 2018 08:53:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46493)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fahF3-0008Tc-0N
	for qemu-devel@nongnu.org; Wed, 04 Jul 2018 08:50:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fahF1-0000s6-Ob
	for qemu-devel@nongnu.org; Wed, 04 Jul 2018 08:50:41 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53942 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fahEz-0000rF-6u; Wed, 04 Jul 2018 08:50:37 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2318EC12C2;
	Wed,  4 Jul 2018 12:50:36 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-71.ams2.redhat.com
	[10.36.116.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5CB0111AF00;
	Wed,  4 Jul 2018 12:50:29 +0000 (UTC)
To: David Hildenbrand <david@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com
References: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
	<1530602398-16127-6-git-send-email-eric.auger@redhat.com>
	<8495014b-5811-4f4f-5af3-d065cd6561b7@redhat.com>
	<2513e4a9-8980-6274-b933-a5e107b32da5@redhat.com>
	<401ccabc-584a-8754-bcb6-b4fdea6fe836@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <96e207c4-96e2-5d86-f27f-9dfb80577a9b@redhat.com>
Date: Wed, 4 Jul 2018 14:50:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <401ccabc-584a-8754-bcb6-b4fdea6fe836@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 04 Jul 2018 12:50:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 04 Jul 2018 12:50:36 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [RFC v3 05/15] hw/arm/virt: handle
 max_vm_phys_shift conflicts on migration
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: wei@redhat.com, drjones@redhat.com, david@gibson.dropbear.id.au,
	agraf@suse.de, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oso7cs7hjwQQ

Hi David,
On 07/04/2018 01:53 PM, David Hildenbrand wrote:
> On 03.07.2018 21:32, Auger Eric wrote:
>> Hi David,
>> On 07/03/2018 08:41 PM, David Hildenbrand wrote:
>>> On 03.07.2018 09:19, Eric Auger wrote:
>>>> When migrating a VM, we must make sure the destination host
>>>> supports as many IPA bits as the source. Otherwise the migration
>>>> must fail.
>>>>
>>>> We add a VMState infrastructure to machvirt. On pre_save(),
>>>> the current source max_vm_phys_shift is saved.
>>>>
>>>> On destination, we cannot use this information when creating the
>>>> VM. The VM is created using the max value reported by the
>>>> destination host - or the kvm_type inherited value -. However on
>>>> post_load() we can check that this value is compatible with the
>>>> source saved value.
>>>
>>> Just wondering, how exactly is the guest able to detect the 42b (e.g. vs
>>> 42b) configuration?
>>
>> the source IPA size is saved in the VMState. When restoring it on
>> post_load we check against the current IPA size (corresponding to the
>> max the destination KVM does support). The destination IPA size is
>> chosen before creating the destination VM. If the destination IPA size
>> is less than the source IPA size, we fail the migration.
>>
>> Hope this helps
> 
> No, I asked if the *guest* is able to distinguish e.g. 43 from 44 or if
> the device memory setup is sufficient.
> 
> Once you create the machine, you setup device memory (using the maxmem
> parameter).
> 
> From that, you directly know how big the largest guest physical address
> will be (e.g. 2TB + (maxram_size - ram_size)). You can check that
> against max_vm_phys_shift and error out.

Ah OK I didn't catch your question. Yes indeed you method is simpler. At
the moment I don't think the guest can make any difference. But the
guest sees the CPU PARange which is fixed currently, as far as I
understand it; also the guest is GPA limited at compilation time with a
given CONFIG_ARM64_PA_BITS_=X config.

So we come back to Dave's remark, if we make CPU PARange match the
max_vm_phys_shift and make the former dynamic, then the guest can see it.

Thanks

Eric
> 
> During migration, source and destination have to have the same qemu
> cmdline, especially same maxmem parameter. So you would catch an invalid
> setup on the destination, without manually migrating and checking
> max_vm_phys_shift.
> 
> However (that's why I am asking) if the guest can spot the difference
> between e.g. 43 and 44, then you should migrate and check. If it is
> implicitly handled by device memory position and size, you should not
> migrate it.
> 
>>
>> Thanks
>>
>> Eric
>>
>>>
> 
> 
