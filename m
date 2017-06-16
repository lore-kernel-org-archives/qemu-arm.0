Received: by 10.25.0.23 with SMTP id 23csp1341564lfa;
        Fri, 16 Jun 2017 08:28:51 -0700 (PDT)
X-Received: by 10.55.1.65 with SMTP id 62mr3857324qkb.210.1497626930893;
        Fri, 16 Jun 2017 08:28:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497626930; cv=none;
        d=google.com; s=arc-20160816;
        b=NlHe1fU3WNEIFA+kP4A9tLOFUSGHWmkcWtNK8DmOskdho3F8T3hRMG72nvmeD+7+Kz
         TRvJgsmty3cFzPeq1J68mCEvc8wBBgRta1y979GKAYX80Mddx7075wXoIiPHRJLMeGA8
         4Ze1yIBwwmqlakfXaapenV+rGz8bAYCC7Z/vn9VQ18Zvx/QtuFY386SouxuZjZfU9tep
         1Gtf2rp5IaULqw1oFNwQpzVhKCrcNT9kAsiwB93tFPkOWAy30eDxQSYAszHD/FSKpKNh
         V4NAyCNSL/iwzyshfgm+9VCp+hXjvEOtlWi0KQCBUodv8ELEgQiMbPv5FwKgriaKYytI
         YB9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=VTBu7Td6IrvWDujsFAsDCqPyj8pTiWPXKo62d8zHpgU=;
        b=IyNyHBulIWJFE77cY7F1lO7OTQPmwWeKJxes+cB6WBgeEIwUEOc5xfFYI7mmQWFl0c
         8OxayIwcN868y9DJGaeNLDvTTZEkZQY4JJtH0+kT9vQh7Nsj2nQ4l7fPtHqvu7mQW4mS
         N0ol12x2aeVHMkg8dGC9tCohbkX/cfl0Hn/IleN3vfUzcmmuS8FGx/whxWmCX1Tq6V2N
         jutj+DFiRcA2DylwtXI1HBcQbpN5pxdH28DfvZpbrWyj91TxyyDUx4XDKUZpB7+XzK0R
         wAOJynM918g6DwEl8pItn2g3zKXAN5svWvIx5/5r3BUbLdC9eg5jx8LJ2gaVUomAsmB9
         Bsew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n3si2272011qtd.367.2017.06.16.08.28.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Jun 2017 08:28:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59424 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dLtB2-0001Ab-B4
	for alex.bennee@linaro.org; Fri, 16 Jun 2017 11:28:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34862)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1dLtAw-0001AR-0t
	for qemu-arm@nongnu.org; Fri, 16 Jun 2017 11:28:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1dLtAs-0006pt-4m
	for qemu-arm@nongnu.org; Fri, 16 Jun 2017 11:28:42 -0400
Received: from smtp1.lauterbach.com ([62.154.241.196]:54892)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1dLtAr-0006oJ-Ps
	for qemu-arm@nongnu.org; Fri, 16 Jun 2017 11:28:38 -0400
Received: (qmail 29311 invoked by uid 484); 16 Jun 2017 15:28:35 -0000
X-Qmail-Scanner-Diagnostics: from 41.224.44.126 by smtp1.lauterbach.com
	(envelope-from <abdallah.bouassida@lauterbach.com>,
	uid 484) with qmail-scanner-2.11 
	(mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
	Clear:RC:1(41.224.44.126):. 
	Processed in 0.0486259999999999 secs); 16 Jun 2017 15:28:35 -0000
Received: from unknown (HELO [192.168.187.23])
	(Authenticated_SSL:abouassida@[41.224.44.126])
	(envelope-sender <abdallah.bouassida@lauterbach.com>)
	by smtp1.lauterbach.com (qmail-ldap-1.03) with
	ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
	for <khaled.jmal@lauterbach.com>; 16 Jun 2017 15:28:34 -0000
To: Peter Maydell <peter.maydell@linaro.org>
References: <1701daf4-b2de-a9fb-7337-7aa791676516@lauterbach.com>
	<CAFEAcA_+rS8gjjU+g1e71vBBioxaWX94+SvMqVh=Ta37ZhYGjA@mail.gmail.com>
From: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Message-ID: <5f1df0fb-6c63-a0db-90fc-1e6c455ce2bd@lauterbach.com>
Date: Fri, 16 Jun 2017 16:28:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_+rS8gjjU+g1e71vBBioxaWX94+SvMqVh=Ta37ZhYGjA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 62.154.241.196
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target-arm: Bug fix in filling
 the cp_regs hashtable
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
Cc: Khaled Jmal <khaled.jmal@lauterbach.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mSOzqBjLaNoV

Oh, I see!
Thanks for the details!

Regards,
Abdallah

Le 6/16/2017 à 3:51 PM, Peter Maydell a écrit :
> On 16 June 2017 at 15:42, Abdallah Bouassida
> <abdallah.bouassida@lauterbach.com> wrote:
>> Check if the CPU supports AARCH64 before adding  the 64bit view of
>> the coprocessor's register to the cp_regs hashtable.
>>
>> Signed-off-by: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
>> ---
>> Bug description: if a register has the .state = ARM_CP_STATE_BOTH, its 64bit
>> view will be added to the hashtable even if the CPU is not 64bit.
> This is deliberate and required. Where the AArch64 and AArch32
> states both have a register which shares underlying architectural
> state, QEMU chooses to implement migration of that state usually
> via the AArch64 version's ARMCPRegInfo struct. If the AArch64
> version is not included in the hashtable for an AArch32-only
> CPU then the state of the 32-bit register won't be migrated.
> The AArch64 register is of course invisible to the guest because
> it is only accessible via 64-bit instructions, but it's used
> during migration.
>
> thanks
> -- PMM

