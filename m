Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp4423114wrq;
        Wed, 11 Jul 2018 00:22:15 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeUVInGbQuJQYNqUF8nA1D1BFraCs7a9mHuI4FvIB9LMJ7oyJaYhCEo4deM0itrGFD4IZlO
X-Received: by 2002:a37:8941:: with SMTP id l62-v6mr24481890qkd.204.1531293735288;
        Wed, 11 Jul 2018 00:22:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531293735; cv=none;
        d=google.com; s=arc-20160816;
        b=ZVilNztBL9pLP9PjgDi640D4dgvl1u2L/ZMCayPHdrKWxm5bzUVArk0NsxI0LwgsCm
         nG+p/FQ5ULrJh6XoELpR4plmCuDU+ZFdHRY3Ytd7IbxByh89LnVaQO2NVx551nX6UuD3
         bFPFBPe9sTBG3IA2jfiJIIwttz7pKMHixphpW8qPa5foIj408XmRXUxSYTgMA0yiz/k9
         0D173HwBuovHyTYar8TaWW8UP+8n0K6Y87PMva9UW3hLbRbj84BurxVKUBSqMNFFZqgK
         OvYNWUhsWt+PQr5ejJnYLf550RYki7erW7F7tOzoSBxn+QtQndOq+5aZ/76aeYXkmjWZ
         qGOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :arc-authentication-results;
        bh=wfmHTUfZPpBqn/Opq0Prmx+udkOD/rWIpEGueKWYH1I=;
        b=Ju76L5auTfYy4prmsB3PHlwYkmyqEGpevm8BxHwllbjafo8O+0G98rr4o/eJ9v/DAT
         q/fwXf9JnfGdMCqXtEvJkhsPyeRsWVjwLWEd/H0Wg4ycuAFnsJW5egZ/uRuqijd4ArI9
         37vAFD7fTghqWGjaL75qlZeJe1rQaOwLUWAlfvKFAVXUo4Kzlz/OGtT0qXc3NufFF1wS
         3VHOL2/5+GwJmEPJOkezblmFHGpALf8Qjf9G/sk0RJ2Xk1OC/o5cIOI4aj+zOe4lSUnj
         PdRJ5//gO6rZmeDZHVO0W003oD+APm6F6d72mMbVr/DtcC0LfhbigP4uvkKyEmh+xqox
         FMHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g2-v6si1174926qtj.99.2018.07.11.00.22.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Jul 2018 00:22:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52099 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fd9S2-0005HQ-K9
	for alex.bennee@linaro.org; Wed, 11 Jul 2018 03:22:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42940)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fd9Rl-0005DL-5C
	for qemu-arm@nongnu.org; Wed, 11 Jul 2018 03:21:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fd9Rg-0004Xs-86
	for qemu-arm@nongnu.org; Wed, 11 Jul 2018 03:21:57 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57510 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fd9Rg-0004Xg-2h; Wed, 11 Jul 2018 03:21:52 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2D7254070489;
	Wed, 11 Jul 2018 07:21:51 +0000 (UTC)
Received: from [10.36.116.133] (ovpn-116-133.ams2.redhat.com [10.36.116.133])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A2FE2166BA2;
	Wed, 11 Jul 2018 07:21:49 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1531170180-21199-1-git-send-email-thuth@redhat.com>
	<CAFEAcA-T_d2kEU+Pb72=pJQhpvqvN1owgi4RLNtNY=L4t_1Z2g@mail.gmail.com>
	<5d0c7195-ffbf-1618-6106-ef6c82df3bd7@redhat.com>
	<CAFEAcA9GspXJg2ioLrCknBgYHJ9f6qvM=n=y0dLeU12yv_5ETA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <931c0545-e3d8-fc84-9b69-59fab040265c@redhat.com>
Date: Wed, 11 Jul 2018 09:21:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9GspXJg2ioLrCknBgYHJ9f6qvM=n=y0dLeU12yv_5ETA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 11 Jul 2018 07:21:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 11 Jul 2018 07:21:51 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH] hw/arm/bcm283x: Fix crash with device_add
 bcm2837 on unsupported machines
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6EMx7o4Zh7yz

On 10.07.2018 08:50, Peter Maydell wrote:
> On 9 July 2018 at 23:03, Thomas Huth <thuth@redhat.com> wrote:
>> On 09.07.2018 23:42, Peter Maydell wrote:
>>> On 9 July 2018 at 22:03, Thomas Huth <thuth@redhat.com> wrote:
>>>> When trying to "device_add bcm2837" on a machine that is not suitable for
>>>> this device, you can quickly crash QEMU afterwards, e.g. with "info qtree":
>>>>
>>>> echo "{'execute':'qmp_capabilities'} {'execute':'device_add', " \
>>>>  "'arguments':{'driver':'bcm2837'}} {'execute': 'human-monitor-command', " \
>>>>  "'arguments': {'command-line': 'info qtree'}}" | \
>>>>  aarch64-softmmu/qemu-system-aarch64 -M integratorcp,accel=qtest -S -qmp stdio
>>>>
>>>> {"QMP": {"version": {"qemu": {"micro": 50, "minor": 12, "major": 2},
>>>>  "package": "build-all"}, "capabilities": []}}
>>>> {"return": {}}
>>>> {"error": {"class": "GenericError", "desc": "Device 'bcm2837' can not be
>>>>  hotplugged on this machine"}}
>>>> Segmentation fault (core dumped)
>>>>
>>>> The problem is that qdev_set_parent_bus() from instance_init adds a link
>>>> to the child devices which is not valid anymore after the device init
>>>> failed. Thus the qdev_set_parent_bus() must rather be done in the realize
>>>> function instead.
>>>
>>> Yuck. The real problem here is that we're still requiring the
>>> code that creates these QOM devices to manually set the parent
>>> in the first place. It's not surprising that we don't get it right
>>> (either parenting in the wrong place or not at all). I'd much
>>> rather see us fix that properly than keep papering over places
>>> where we get it wrong.
>>
>> Sorry, I'm still not an expert in all this QOM stuff yet ... so what do
>> you exactly recommend to do instead?
> 
> I'm not clear either, but I don't think that what we're
> currently doing can be right.

Hm, ok, so how to continue here now? Shall we at least mark the
bcm2836/7 devices with user_creatable=false, so that users can not crash
their QEMU so easily with device_add? The problem with introspection via
device-list-properties would still continue to exist, but I think that's
less likely used in practice... otherwise we could still move the
qdev_set_parent_bus() calls to the realize() function instead, and just
add a big fat FIXME comment in front of the code block, so that we
remember to clean that up one day...

 Thomas
