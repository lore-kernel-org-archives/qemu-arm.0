Received: by 10.223.188.70 with SMTP id a6csp5112713wrh;
        Tue, 22 Aug 2017 08:52:44 -0700 (PDT)
X-Received: by 10.55.154.131 with SMTP id c125mr1626544qke.23.1503417164556;
        Tue, 22 Aug 2017 08:52:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503417164; cv=none;
        d=google.com; s=arc-20160816;
        b=SfgoQAsEpQ1a6DxR7MMSp3v0OXSaedutrQ4FhigUeTwzVNpK9lAHFNyS/3bJbBjpRE
         NL1TW3HF7uBKb3ckn0x08DObS8zWxvnw7cbhB/J6YSp2oY+eNbyoVosfZHNakeCbvvIB
         XNqCOYtwz5l12twKF0OC+fTseTfWDOPWBqC9gGWja7EcBreWXmPMIUYN/y/74p0KUcKj
         shW9Bnh/TR0cG1dcKJ85zwDs8+KZh9EOLN4yXqWfb5u+LNtwHviUbOscGWuyLGsFijgX
         5J7WMIKVkpxQr6yLjWaimtqnVYRPI6sXy+fsYSc7cNZmHGi4ZgmS857cJ4dFJjGCFME8
         zRVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=VyR5R1hw1sX6SdopzowmCWzEWYiklQYd4V2oc0Ho+RY=;
        b=DFkdED10eOgkcfHVQUZr4TrYo4C5ISNAqzH+sxQohQWc2oTo2Zo3nV6mU0nateKvTP
         sy/00UAOY6DkoC4q2eJLfAERyVKTBtwSiWiG081Gmxe4Cm8HOHck/81cBYS24y0kdpg3
         U808LLnVxBQ8LYY+/T2HMgUYqvpeTvJYnkSJwsLGYq18jHAj1bGCyDEAi3o+8kebzKSk
         z+hybFjCzcarj0dfUi4QfXLdVDUHFmoqbcbuBKfGkB+50qq4lyL+++auSn9QqU25pNxB
         jytecsoZNcviN1FFI0xcAFzCNPJzLNuB392yoZBhenUJFb8NjJQn6fo+UFKnRYcIyBQc
         cn7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q2si13925526qti.76.2017.08.22.08.52.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 08:52:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56538 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkBTq-0003GU-NE
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 11:52:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dkBKg-0004Cp-KC
	for qemu-devel@nongnu.org; Tue, 22 Aug 2017 11:43:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dkBKf-0003Mn-Ou
	for qemu-devel@nongnu.org; Tue, 22 Aug 2017 11:43:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34886)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dkBKb-0003Iu-0e; Tue, 22 Aug 2017 11:43:05 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AD3D368C2;
	Tue, 22 Aug 2017 15:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com AD3D368C2
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.21] (ovpn-116-21.ams2.redhat.com [10.36.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D2B85C6DC;
	Tue, 22 Aug 2017 15:43:01 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1503414375-21009-1-git-send-email-thuth@redhat.com>
	<CAFEAcA-92Jjz2uCC387oX2u0NWfijPwB_8zGaagC1m=sKD8zhQ@mail.gmail.com>
	<443135b4-4b36-bae6-b50a-12fb4a55a858@redhat.com>
	<CAFEAcA-AG5XoOJr3p_UU9dACjawp3OtKDy8GMRMpdFfE8foqTA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <06c16109-cdd2-0732-176d-6ec80b1f7f4e@redhat.com>
Date: Tue, 22 Aug 2017 17:42:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-AG5XoOJr3p_UU9dACjawp3OtKDy8GMRMpdFfE8foqTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 22 Aug 2017 15:43:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] hw/misc/auxbus.c: Mark the
 aux-to-i2c-bridge device as non-hotpluggable
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wdQNctLXIzZY

On 22.08.2017 17:30, Peter Maydell wrote:
> On 22 August 2017 at 16:26, Thomas Huth <thuth@redhat.com> wrote:
>> On 22.08.2017 17:12, Peter Maydell wrote:
>>> Why is our default "hotpluggable" rather than "not hotpluggable" ?
>>> We must have way more non-hotpluggable devices than hotpluggable
>>> ones, and it takes active effort to make a hotpluggable device
>>> model, so it seems like it would be much less bug-prone to
>>> require hotpluggable devices to set dc->hotpluggable true
>>> rather than all the non-hotpluggable ones to set it false...
>>
>> I think most devices are already non-hotpluggable automatically because
>> they sit on a bus that is not hot-pluggable (e.g. sysbus devices). The
>> problematic ones are the devices with .parent = TYPE_DEVICE. And for
>> these, I think it is quite hard to say whether they should be
>> hot-pluggable by default or not?
> 
> To implement hotplug you need to write extra code (notably some
> kind of unrealize method to undo whatever you did in realize),
> at which point also setting the hotpluggable flag is trivial.
> 
>> Anyway, according to my tests (I'm currently working on a test that
>> automatically does device_add + device_del for all devices, as you might
>> have guessed already), there are not that many devices that cause
>> problems here, so I guess marking some few with hotpluggable = false
>> should be OK?
> 
> The problem is not the devices we have today but the ones we're
> going to write tomorrow. Having hotpluggable default to false
> "fails safe" -- the worst that happens is that somebody writing
> a hotpluggable device finds in their testing that they need to
> set the flag to make it work. Having it default to true fails
> non-safely -- as you've found, people writing devices that
> were never expected to be hotplugged don't try to test the
> error case of attempting hotplug anyway, and in code review
> the absence of a line of code is very hard to reliably spot,
> so we get devices in tree that crash QEMU if you try to
> hotplug them. If we make the default be not-hotpluggable
> we fix this not just today but forever.

OK, you've got a point. I'll ponder about this a little bit and will try
to come up with a patch / some patches ...

 Thomas
