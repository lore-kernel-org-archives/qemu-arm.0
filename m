Received: by 10.223.188.70 with SMTP id a6csp5038182wrh;
        Tue, 22 Aug 2017 07:48:48 -0700 (PDT)
X-Received: by 10.200.47.71 with SMTP id k7mr1320413qta.319.1503413328639;
        Tue, 22 Aug 2017 07:48:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503413328; cv=none;
        d=google.com; s=arc-20160816;
        b=d1Z32aUsJrZUbA+6Q04nZta6YilaRq1QeNre/NPsOtyYG4lxhbmwhXrF21ht1CPhJY
         GPf9Xj1jSxmIMlpEXHN6n7AOmD7rBIjOeqAZimVe+xORtncU586TNsGp2E9/RTGlaJOo
         e1iZpn/Uw7xDN/05rFcMFapUkiEgehLCS17Uevyn+ao/JuleXTLObcD67mfxKJIxNpRV
         cmzN55uckSY/OjejXUpDUW83quNOFt6d+/0KZI/h4whlCKtlwvBCY/Ac0anlwSevKanZ
         sjbrDRhnvmXRLieLt1WnmlcpBogE1H1EIMnq/mt8ZJK8gHaw+zrUV6TOQx5R/qOsg/+g
         13GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=s45MihBsJ31bqzHSZq2yEfReVhv4Smr/YaUwdbsHk5s=;
        b=Lsin8AQYwnXtbUcGvl+x6hfmvkE+pjz3r1pMEK2WXtZ3V84MEigsmxi7tle/iomvZF
         Sum8A8m9yO0xuq+//nNj1VS0GaDn8nWyXyjMTgAE+3AUd5ObgSvJ1lSGIrxUv4gWLO8v
         kk8u5M5xNzK3E7z+Z2pSXekKUPixNtv2NwyB3OBSs1yUyo3S7qhGNLv/I/Um9D8FrxHC
         AHPXKHoOq8b4GTCHFQSRL97U3UdjBLIgKi1T+mYzn5AnCqxNXbTuCu00Jej0WcJ4p08W
         IOwZSAHdqzB3hsDzIPjeZEZlIIPnGk+qHapJNHW+N9fYffPt7JLid0HDEk2KtpJWtdSF
         5o8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t65si13527086qkd.83.2017.08.22.07.48.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 07:48:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49761 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkAU2-0003a4-Bu
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 10:48:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39611)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dkA0z-0003tS-BD
	for qemu-devel@nongnu.org; Tue, 22 Aug 2017 10:18:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dkA0y-0002xh-EF
	for qemu-devel@nongnu.org; Tue, 22 Aug 2017 10:18:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44772)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dkA0t-0002vw-3I; Tue, 22 Aug 2017 10:18:39 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2195AC047B71;
	Tue, 22 Aug 2017 14:18:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2195AC047B71
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.21] (ovpn-116-21.ams2.redhat.com [10.36.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13C7381883;
	Tue, 22 Aug 2017 14:18:36 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1503407712-9894-1-git-send-email-thuth@redhat.com>
	<CAFEAcA-V1igN7Sz3SusczcPadtZC-z4fyw-pvPggGT5VFFMvRA@mail.gmail.com>
	<8fb75274-09a6-dbd3-5dba-1069d790b689@redhat.com>
	<CAFEAcA9PdXkh4t7gCT=3GNbD8V+_Abtqe31p2DV+=emyR1chcQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <6bdaf758-98d1-d99d-20ae-b0f25747d6b1@redhat.com>
Date: Tue, 22 Aug 2017 16:18:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9PdXkh4t7gCT=3GNbD8V+_Abtqe31p2DV+=emyR1chcQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 22 Aug 2017 14:18:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] hw/arm/digic: Mark device with
 user_creatable = false
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hSi3fKj+LqDc

On 22.08.2017 16:07, Peter Maydell wrote:
> On 22 August 2017 at 15:05, Thomas Huth <thuth@redhat.com> wrote:
>> On 22.08.2017 15:52, Peter Maydell wrote:
>>> On 22 August 2017 at 14:15, Thomas Huth <thuth@redhat.com> wrote:
>>>> QEMU currently hangs completely when the user is trying to do a
>>>> "device_add digic" on an unrelated ARM machine like integratorcp.
>>>> Looks like this device is not meant to be hot-pluggable at all, so
>>>> let's simply mark it with "user_creatable =3D false" to avoid the ha=
ng.
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>  hw/arm/digic.c | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/hw/arm/digic.c b/hw/arm/digic.c
>>>> index 94f3263..208dfb3 100644
>>>> --- a/hw/arm/digic.c
>>>> +++ b/hw/arm/digic.c
>>>> @@ -101,6 +101,8 @@ static void digic_class_init(ObjectClass *oc, vo=
id *data)
>>>>      DeviceClass *dc =3D DEVICE_CLASS(oc);
>>>>
>>>>      dc->realize =3D digic_realize;
>>>> +    /* Reason: Hangs QEMU when trying to device_add this directly *=
/
>>>> +    dc->user_creatable =3D false;
>>>>  }
>>>
>>> Maybe "uses serial_hds[]" is a better reason, or does it hang for
>>> some other reason?
>>
>> When I kill the hanging QEMU, the stack trace looks like this:
>>
>> #0  0x00007ffff13afaff in ppoll () at /lib64/libc.so.6
>> #1  0x0000555555bb3179 in qemu_poll_ns (__ss=3D0x0, __timeout=3D0x7fff=
ffffda60, __nfds=3D<optimized out>, __fds=3D<optimized out>)
>>     at /usr/include/bits/poll2.h:77
>> #2  0x0000555555bb3179 in qemu_poll_ns (fds=3D<optimized out>, nfds=3D=
<optimized out>, timeout=3Dtimeout@entry=3D1000000000)
>>     at /home/thuth/devel/qemu/util/qemu-timer.c:334
>> #3  0x0000555555bb3f88 in main_loop_wait (timeout=3D1000000000) at /ho=
me/thuth/devel/qemu/util/main-loop.c:255
>> #4  0x0000555555bb3f88 in main_loop_wait (nonblocking=3Dnonblocking@en=
try=3D0) at /home/thuth/devel/qemu/util/main-loop.c:515
>> #5  0x000055555578d927 in main () at /home/thuth/devel/qemu/vl.c:1917
>> #6  0x000055555578d927 in main (argc=3D<optimized out>, argv=3D<optimi=
zed out>, envp=3D<optimized out>) at /home/thuth/devel/qemu/vl.c:4791
>>
>> I haven't investigated any further, but the usage of serial_hds
>> in the realize function could certainly be the reason. At least
>> it certainly is a reason that this device should not be creatable
>> by the user - so let me send a v2 with the comment changed
>> accordingly.
>=20
> Has QEMU itself actually hung (no response to monitor etc), or is
> that just the guest sitting doing nothing? "QEMU is sat in the main
> loop waiting for something to happen" is what you'd expect in the
> latter case. The backtraces for the other threads might be of
> interest or might also be unhelpful.

I thought that QEMU would hang ... but now I checked again, and it's
just that it does not return to the monitor prompt as expected. If I
press CTRL-a c again, I can get to the monitor again.
Anyway, QEMU then dies if I try to remove the device with device_del:

qemu/qdev-monitor.c:872:qdev_unplug: assertion failed: (hotplug_ctrl)

... so let's simply mark it with user_creatable =3D false and call it a
day... ;-)

 Thomas

