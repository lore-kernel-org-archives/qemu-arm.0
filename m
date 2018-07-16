Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1172207wru;
        Sun, 15 Jul 2018 23:41:24 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcxvde+RUsF5lXGuTnaDLEPnT4QGjFeQSbK1ajVLcJynRunnu2RQ0eZP7sxzux/Ql1iejK1
X-Received: by 2002:a37:4bc8:: with SMTP id y191-v6mr12331696qka.98.1531723284428;
        Sun, 15 Jul 2018 23:41:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531723284; cv=none;
        d=google.com; s=arc-20160816;
        b=aMzTURJ/V1oX4MUnfnp3bfeGn+Rxgk1Y9IEPazux4EGtEjvfN1rXZmAa0Ps4um+LKy
         EXPpAXkk9YmnxV8IYoN0LU+/LBuqx2UeL0z5haqOAcYDBjVNTuvUJd0wk7R3hnx//Ain
         S79SOi3jNeABXoGYfStIFrxcCdRKb/7N1kHAWmPE+Fi6VaWYPku/tYXVeivUkmjvXyK+
         wprq+RvgKGm8r92FJ3Ly30RrJts0KoKddHTCQ/LVqshF4XJs/Rr2veVu36QaSBUa8F4R
         3PkcWPWFl/8jDbwRBkdnYTbd4/Dpt7376wLk0NdKSEzEgyz5XmvDS325OCgvd0Z+A0dH
         qxOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from
         :arc-authentication-results;
        bh=X7Y2AyJ/AsILjKKSqf9D7vMz1UCj87daGrhJVpftkU0=;
        b=O5cdKLJ2KZN0HtAUJRUqFxXUzNigLd5xojLyYsF9pbG2nozotYMpnT76tLTiH4vQf8
         M+QUL8UtRjpl9dVE1OtXJlYF6mCpRuqQHOiUNWncKMaVppvzx5taty3EHt1hnv9lfQ7V
         4jOLtSNqtcSIG0qyLjMBq3+uH/MMHFR0nRd3z2p4fTp6y2dLgVJkbM2V3TNiCOuiZZbX
         X3mzWlngGbO6U2ekjc01u2sj6xyLkiMu54awafUSdJvgDjlCwPQv6rvDQKOMAry2rqmo
         T3hKkmd3D92McI+LupIWhgR5gwZJy18v9WU44e9+E9EOpv4bel24FFFZYDn1sWdrmBst
         Zybw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f26-v6si1088205qte.45.2018.07.15.23.41.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 15 Jul 2018 23:41:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49109 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fexCF-0006HG-W0
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 02:41:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39256)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fexC7-0006Gs-V4
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 02:41:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fexC4-0005ZO-Im
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 02:41:16 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49662 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1fexC4-0005Yb-8g; Mon, 16 Jul 2018 02:41:12 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C70F9402333A;
	Mon, 16 Jul 2018 06:41:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-125.ams2.redhat.com
	[10.36.116.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 783357C21;
	Mon, 16 Jul 2018 06:41:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 5759B11385D6; Mon, 16 Jul 2018 08:41:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
References: <1531170180-21199-1-git-send-email-thuth@redhat.com>
	<CAFEAcA-T_d2kEU+Pb72=pJQhpvqvN1owgi4RLNtNY=L4t_1Z2g@mail.gmail.com>
	<5d0c7195-ffbf-1618-6106-ef6c82df3bd7@redhat.com>
	<CAFEAcA9GspXJg2ioLrCknBgYHJ9f6qvM=n=y0dLeU12yv_5ETA@mail.gmail.com>
	<931c0545-e3d8-fc84-9b69-59fab040265c@redhat.com>
	<20180711161216.GV7451@localhost.localdomain>
	<CAFEAcA-3aBQPwiwDfZSjspiwv4L-U0LXBKaOQ2m+=OzhqRq3OQ@mail.gmail.com>
	<87y3egmzem.fsf@dusky.pond.sub.org>
	<6cc1c007-4bdf-2b8c-b0b0-d32979a56ecd@redhat.com>
	<87muuwo2dz.fsf@dusky.pond.sub.org>
	<CAFEAcA9g0Vu-cF50maC2cVrSffZA5F6AsoM5pz2XT09YKG4WHg@mail.gmail.com>
	<585e3fa1-7d56-ccb8-0357-77597ca78fa8@redhat.com>
Date: Mon, 16 Jul 2018 08:41:10 +0200
In-Reply-To: <585e3fa1-7d56-ccb8-0357-77597ca78fa8@redhat.com> (Thomas Huth's
	message of "Thu, 12 Jul 2018 18:32:17 +0200")
Message-ID: <87in5fisxl.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Mon, 16 Jul 2018 06:41:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Mon, 16 Jul 2018 06:41:11 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'armbru@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/bcm283x: Fix crash with
 device_add bcm2837 on unsupported machines
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
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E+E+oKTk1ACz

Thomas Huth <thuth@redhat.com> writes:

> On 12.07.2018 18:22, Peter Maydell wrote:
>> On 12 July 2018 at 17:16, Markus Armbruster <armbru@redhat.com> wrote:
>>> Thomas Huth <thuth@redhat.com> writes:
>>>
>>>> On 12.07.2018 14:06, Markus Armbruster wrote:
>>>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>>>>
>>>>>> On 11 July 2018 at 17:12, Eduardo Habkost <ehabkost@redhat.com> wrote:
>>>>>>> On Wed, Jul 11, 2018 at 09:21:48AM +0200, Thomas Huth wrote:
>>>>>>>> Hm, ok, so how to continue here now? Shall we at least mark the
>>>>>>>> bcm2836/7 devices with user_creatable=false, so that users can not crash
>>>>>>>> their QEMU so easily with device_add? The problem with introspection via
>>>>>>>> device-list-properties would still continue to exist, but I think that's
>>>>>>>> less likely used in practice... otherwise we could still move the
>>>>>>>> qdev_set_parent_bus() calls to the realize() function instead, and just
>>>>>>>> add a big fat FIXME comment in front of the code block, so that we
>>>>>>>> remember to clean that up one day...
>>>>>>>
>>>>>>> Crashing device-list-properties should be a blocker bug, IMO.
>>>>>
>>>>> Seconded.
>>>>
>>>> Well, maybe I should then not suggest to add a hmp("info qtree") below
>>>> the hmp("info qom-tree") in test_one_device() of
>>>> tests/device-introspect-test.c ... otherwise we'll be quite busy in the
>>>> next weeks...
>>>
>>> If we can't fix these bugs in time, we can bring back
>>> cannot_destroy_with_object_finalize_yet, as Eduardo mentioned upthread.
>>> Would be sad, but sad beats crash.
>> 
>> ...but are they actually interesting crashes? Nobody is ever
>> going to actually start emulation of an integratorcp machine and
>> then try to add a bcm2837 device via the QMP interface, except
>> if they're deliberately doing exhaustive testing.
>
> It's not "device_add" that is a real problem here (otherwise we could
> simply use user_creatable=false which we likely should do for this
> device anyway), but rather the "device-list-properties" QMP command,
> which also works for devices that are marked as user_creatable=false.
>
> I think it's valid that an upper layer tool scans all devices for their
> properties. But since nobody complained about crashes in the past here
> already, it seems like no upper layer tool is currently doing this. So I
> agree with you that this should not be a blocker for the 3.0 release.

Fixing the crashes by bringing back
cannot_destroy_with_object_finalize_yet would be a bit of a cop out, but
it would also be so easy that there's really no excuse for leaving them
unfixed.
