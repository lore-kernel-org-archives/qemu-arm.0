Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5323231wro;
        Tue, 30 Oct 2018 02:18:43 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cuSYz1DdBGnk3H+PB998T2YpTFpqaSpG2Tfq1rVhmTWJEY1xJnrk04QgNVC3J5J1KzeJBK
X-Received: by 2002:a37:455:: with SMTP id 82mr15285600qke.60.1540891123644;
        Tue, 30 Oct 2018 02:18:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540891123; cv=none;
        d=google.com; s=arc-20160816;
        b=FJvt7n0ctirzZoE1doh9GkZkVLqTEke4p21GyusM1azoRWC9bouIs/kATQJNvC7EPA
         FHIfu/Ogq64YXmP4V+TUeG0IYLEUk4Jlr78sP/cqX1hq7bJkqecL4GDKXYTeeH7Ats4z
         yY7/+A2MCc6Ytw4pUYf07j35UxFhXQMeHvUbIoakH7Os2neuFdyGAIyhEwgBq748JI/e
         8siq5UdHaHCVvBZtjE5t+8oXd7MsjuZdFEabgBnTM4U3Rd/HYjR0pQdGuHjUOVUn8QwF
         ZGsLnN9jYivT2+zKdPQfEgyWf7Qh4YDd90PtCOhDn8n990J9acp8v/zXYfF5o5D76lAT
         uhoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from;
        bh=3Mqeif6UrEyTcDXScwKFkQKGVJgbn7wuK1Sfm7VxIfw=;
        b=CB4n1YwLdH4Cm/6kQDdRg15MJCi2stEUOpNaKmknFWS6TpQsUyGgWIDtdwByeQ/jtJ
         9/gdFmvaW/aJKfWObbB2DcfAWI3FgVKZ4WS7KvGiXLwrBO/1Vyu+G+PkqSKWmkZFqHlX
         IQ5wli4UG4+rjqoKgnJXuL4qJvSYvXCsdAv91zEf1qnEJ2/dEndR2mrs9oZ5em8ogXlN
         DVyRMsGpXRNXWwX7ZLEapjUFbBcQ0INs/D5+zEi2kZSKan1EqzlDER9N5F2WtSsU2kOE
         R/HQdyaP16K8JY7fpITtXvMbIbZeLiPXlF5eKuVqGOzgemxtAYP4VcaSAe0MyzC+mwwK
         zCKg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b2-v6si9295075qtj.219.2018.10.30.02.18.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Oct 2018 02:18:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51746 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHQAd-0008UE-65
	for alex.bennee@linaro.org; Tue, 30 Oct 2018 05:18:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gHQ9x-0007KW-CV
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 05:18:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gHQ9r-0000d1-D6
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 05:18:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48102)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1gHQ9r-0000c2-6I; Tue, 30 Oct 2018 05:17:55 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A07DE308A94C;
	Tue, 30 Oct 2018 09:17:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-34.ams2.redhat.com
	[10.36.117.34])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A2B92A2C7;
	Tue, 30 Oct 2018 09:17:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B9A0C11385F2; Tue, 30 Oct 2018 10:17:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Guenter Roeck <linux@roeck-us.net>
References: <1540548409-22560-1-git-send-email-thuth@redhat.com>
	<CAFEAcA8EubWya8ey9VxhaCw4m2U=KA+i2C-R9P-p+P6oEBBLew@mail.gmail.com>
	<7fc49925-36ff-bd9a-0cd7-e5f8d4bb3672@roeck-us.net>
	<CAFEAcA-UF+SyXvcU+NGZsbqBF2qg+s_x4HPU7yvf7B2G-=HPOg@mail.gmail.com>
	<b4f6cbd2-68fe-5b07-e8fb-93b1c4d8a6de@roeck-us.net>
Date: Tue, 30 Oct 2018 10:17:51 +0100
In-Reply-To: <b4f6cbd2-68fe-5b07-e8fb-93b1c4d8a6de@roeck-us.net> (Guenter
	Roeck's message of "Mon, 29 Oct 2018 07:09:29 -0700")
Message-ID: <87pnvriyio.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Tue, 30 Oct 2018 09:17:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/2] Deprecate the "collie"
 machine and Strongarm devices
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: myTwnTupz/hH

Guenter Roeck <linux@roeck-us.net> writes:

> On 10/29/18 6:24 AM, Peter Maydell wrote:
>> On 27 October 2018 at 12:04, Guenter Roeck <linux@roeck-us.net> wrote:
>>> On 10/26/18 3:12 AM, Peter Maydell wrote:
>>>> Hi Guenter; there's a proposal here to deprecate (and eventually
>>>> remove) the 'collie' board (strongarm) from QEMU. Is that one of
>>>> the ones you're currently using in your automated testing of Linux
>>>> kernels on QEMU?
>>>>
>>>
>>> Yes. I can run the test with older versions of qemu, so it is ok for me
>>> if it is removed (as long as that removal is not backported).
>>
>> Mmm, but if we have an active user who's testing them then they
>> probably shouldn't be in the frontline of boards to remove.
>> Which other boards do you test with mainline QEMU?
>>
>
> For arm:
>
> akita
> ast2500-evb
> beagle
> beaglexm
> borzoi
> collie
> cubieboard
> imx25-pdk
> integratorcp
> kzm
> mainstone
> midway
> mps2-an385
> overo
> palmetto-bmc
> raspi2
> realview-eb
> realview-eb-mpcore
> realview-pb-a8
> realview-pbx-a9
> romulus-bmc
> sabrelite
> smdkc210
> spitz
> terrier
> tosa
> versatileab
> versatilepb
> vexpress-a15
> vexpress-a15-a7
> vexpress-a9
> witherspoon-bmc
> xilinx-zynq-a9
> z2
>
> Though not all of them are supported by upstream qemu. For some of them I carry local patches,
> for others I use out-of-tree versions of qemu (beagle/beaglexm).

Would it be possible to get useful parts of your automated testing into
upstream QEMU's CI?

I'm asking because I think we should require at least a smoke test in CI
for all machine types, and drop the ones that lack it.  Not today, but
in the not-too-distant future.
