Received: by 10.223.172.38 with SMTP id v35csp5826153wrc;
        Mon, 11 Sep 2017 10:11:12 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QA1RS6iy80HeCUB9scspkor6PpA1iOi1JdX3JNSxlEfmQ96x/psK/N7vU6EWaCoX9bExCsk
X-Received: by 10.200.28.123 with SMTP id j56mr16522819qtk.299.1505149872676;
        Mon, 11 Sep 2017 10:11:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505149872; cv=none;
        d=google.com; s=arc-20160816;
        b=J1tHjxCPa5XLYoxDxzpEINiLmthGKJFZtE6DWoHmf2XnUT3ldSuctHz+A6NNCPEkqt
         cWTuDBcm3Cr6lW9iuEBD7YUuHQDp8eAvAbmQyAysrLYvt/8wIdGbhFQXp9N2UdNecsLA
         +9qyLAnbVRaLzcIKfGJgiHuGA5B7s5pONaKIDm5rQ88YR/+mnmnLJ4mDR/+Yfq9l0jpu
         Zd2PYkLm6VHuseE0bUGfJmcMfqPixK0vSkTlwGIWNd+k0VHPoXpbw5U5yf5a+3iCRz54
         MbjRVgUceO0abqYwANc6C3GupqQiwvEjXPYabu0+PVniKiqSOqEyhVWEyVnfh+H+AFjm
         5z+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=75nXu35JFXG7vRpQ1BoKQBIIPYS2qTRBQmgPlOUQuIM=;
        b=uXr15XlZf925SLQMFNRku2eeiNPFANkGixUvXJzaPFabUzA8dReFwbI7pxl7cIp6QU
         q5ym0UI7SO0ke1yHqYhk+1IBl8IEKSHpWa+4/mk+LiKJDHTt4mQzFMwD8kLpNLTNBSoA
         Mihc3zM0oBG9cF9Ioi75zowzNuJXRXvf6LSfIksIXnwncmGPfWIzqWmGP9AWHxqwa2Ob
         +GuP/oiHVq3S/O9jaPZWnE4lj9JgwEND8AcmpONMR45nDW60EojBybQ4ZGjB3Q8qP18N
         cOKl4CTz1RtQnvUvn8+ycWXmyWcsL8IVanCxbvzj8oHjgdu0RAON7k1XxR3VVvCvbKZG
         vmuw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i1si10402430qtf.274.2017.09.11.10.11.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 10:11:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59231 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drSEo-0006v7-7D
	for alex.bennee@linaro.org; Mon, 11 Sep 2017 13:11:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1drSAe-0003nH-Ma
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 13:06:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1drSAY-0001Bx-Ju
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 13:06:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47906)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1drSAY-0001Bf-Dn; Mon, 11 Sep 2017 13:06:46 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2DE6E1FE30E;
	Mon, 11 Sep 2017 17:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2DE6E1FE30E
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.113] (ovpn-116-113.ams2.redhat.com [10.36.116.113])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5C7F60842;
	Mon, 11 Sep 2017 17:06:41 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20170911142056.15643-1-lvivier@redhat.com>
	<20170911142056.15643-3-lvivier@redhat.com>
	<CAFEAcA_G8mEzB0Mox0TTz578LQKXgvhNHeZ8Bk7OwC4NbqiXPg@mail.gmail.com>
	<889d6ce7-073f-7860-e091-619c1202b1cd@redhat.com>
	<CAFEAcA9Wmq+G6H78NdsVs5mKDrMcUkB30yY2d=3+KOnbT-pmAQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <01a0cb88-6a84-6413-682f-67eb2af34b7f@redhat.com>
Date: Mon, 11 Sep 2017 19:06:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Wmq+G6H78NdsVs5mKDrMcUkB30yY2d=3+KOnbT-pmAQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 11 Sep 2017 17:06:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 2/3] hmp: fix "dump-quest-memory" segfault
 (arm)
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Greg Kurz <groug@kaod.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O22TU2IaGO2f

On 11.09.2017 18:40, Peter Maydell wrote:
> On 11 September 2017 at 15:45, Thomas Huth <thuth@redhat.com> wrote:
>> On 11.09.2017 16:39, Peter Maydell wrote:
>>> On 11 September 2017 at 15:20, Laurent Vivier <lvivier@redhat.com> wr=
ote:
>>>> Commit fd5d23babf (hmp: fix "dump-quest-memory" segfault)
>>>> fixes the problem for i386, do the same for arm.
>>>>
>>>> Running QEMU with
>>>>     qemu-system-aarch64 -M none -nographic -m 256
>>>> and executing
>>>>     dump-guest-memory /dev/null 0 8192
>>>> results in segfault
>>>>
>>>> Fix by checking if we have CPU.
>>>>
>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>>
>>> It seems a little arbitrary to assume that if there's no
>>> CPU what you wanted was a 32-bit little-endian dump.
>>>
>>> Why do we have a machine without a CPU anyway ?
>>
>> The "none" machine is always started without a default CPU.
>=20
> If it has no CPU then how can we create a core dump for it?
> We don't (in theory) even know whether it's x86 or ARM.
> (One day we may support multiple CPU architectures in
> one QEMU binary...)

True. Maybe it's better to return -1 if first_cpu is NULL to signal that
a dump is not possible...?

 Thomas
