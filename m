Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp2892367wrq;
        Mon, 9 Jul 2018 15:04:02 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfDjivr8KE+pzG78TMeGiWqelhSoTjObOQPZvr1FqWtlK4SsO3Bqaz2v7B6Zu8Zb6N0WFdQ
X-Received: by 2002:a0c:9666:: with SMTP id 35-v6mr13591502qvy.137.1531173842717;
        Mon, 09 Jul 2018 15:04:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531173842; cv=none;
        d=google.com; s=arc-20160816;
        b=fSe6v9aWy94Fz4O024vEoLd/5mK1dEfkEHS+3FXWK7RNqhjMylKfAm6ys9QuE4mJIF
         BrmoeJjZv/g4Vu/KAAeKmGROdZjzyF1e5kMJQft79U5KiKi9vd3SOu3CS8ob2OwEYvzF
         LULLV+9z/Vt5rtksR50PqukYbislJgOK5StuwR0S205hMppeYnvxXXfW2YwB1YZA3Qda
         s+Lm/8MH9VxebyHmLxD2+gPw73gG5lPOp8Qg+FHZjPY3FYdQfr39onUg5qJCR/XLP93e
         s22MtVMm/lFA6TvN6TI0PKHNUidYIu5SG10oPx3TyAa6KVTktNy/9U4s41AA/iCUPwSP
         4WGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :arc-authentication-results;
        bh=dE4Jh48nyIyHq9M1Dn4GMfMnimBwiuA3hd70AE1z1TI=;
        b=upybhy+NMwghRKhl7MFqjXHIoURR4hv4ABtlaY6yV15Y6EJT6Vp4ni3KQlC372mky9
         keSWVqCdv8dnqC2IBTEnOo+QB/LQ4r575fkmZf3CgD3GK/2K2K3zAlrLDKbY0Pzvzi8U
         HNv9OsWDC23t4ftqr4DYXgC2rSwJz6TdLkjyz3RY2FICXx2/2YSLImWo1pEpyChMYx0o
         bcRIPdubgTwMt4PRVeutz/Ti7zyGs6cI4TtQ715b7dkJQ9Jqpk4MdroypguVj7kwM+1u
         66zz8tjpNCNjmZyUTbJN5gSDEN5+x1w5ETKeRjg1khkyrTZpa1j6L4AiiZS4tTllze7E
         lArw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 61-v6si3598449qta.266.2018.07.09.15.04.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Jul 2018 15:04:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44662 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fceGI-0008Af-69
	for alex.bennee@linaro.org; Mon, 09 Jul 2018 18:04:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46212)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fceG7-0008AY-TO
	for qemu-arm@nongnu.org; Mon, 09 Jul 2018 18:03:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fceG3-0000oh-0p
	for qemu-arm@nongnu.org; Mon, 09 Jul 2018 18:03:51 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48272 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fceG2-0000nf-Rv; Mon, 09 Jul 2018 18:03:46 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E47DA81A4EB7;
	Mon,  9 Jul 2018 22:03:45 +0000 (UTC)
Received: from [10.36.116.40] (ovpn-116-40.ams2.redhat.com [10.36.116.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7E1C2156889;
	Mon,  9 Jul 2018 22:03:42 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1531170180-21199-1-git-send-email-thuth@redhat.com>
	<CAFEAcA-T_d2kEU+Pb72=pJQhpvqvN1owgi4RLNtNY=L4t_1Z2g@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <5d0c7195-ffbf-1618-6106-ef6c82df3bd7@redhat.com>
Date: Tue, 10 Jul 2018 00:03:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-T_d2kEU+Pb72=pJQhpvqvN1owgi4RLNtNY=L4t_1Z2g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 09 Jul 2018 22:03:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 09 Jul 2018 22:03:45 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
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
X-TUID: L3wzzobBWygq

On 09.07.2018 23:42, Peter Maydell wrote:
> On 9 July 2018 at 22:03, Thomas Huth <thuth@redhat.com> wrote:
>> When trying to "device_add bcm2837" on a machine that is not suitable =
for
>> this device, you can quickly crash QEMU afterwards, e.g. with "info qt=
ree":
>>
>> echo "{'execute':'qmp_capabilities'} {'execute':'device_add', " \
>>  "'arguments':{'driver':'bcm2837'}} {'execute': 'human-monitor-command=
', " \
>>  "'arguments': {'command-line': 'info qtree'}}" | \
>>  aarch64-softmmu/qemu-system-aarch64 -M integratorcp,accel=3Dqtest -S =
-qmp stdio
>>
>> {"QMP": {"version": {"qemu": {"micro": 50, "minor": 12, "major": 2},
>>  "package": "build-all"}, "capabilities": []}}
>> {"return": {}}
>> {"error": {"class": "GenericError", "desc": "Device 'bcm2837' can not =
be
>>  hotplugged on this machine"}}
>> Segmentation fault (core dumped)
>>
>> The problem is that qdev_set_parent_bus() from instance_init adds a li=
nk
>> to the child devices which is not valid anymore after the device init
>> failed. Thus the qdev_set_parent_bus() must rather be done in the real=
ize
>> function instead.
>=20
> Yuck. The real problem here is that we're still requiring the
> code that creates these QOM devices to manually set the parent
> in the first place. It's not surprising that we don't get it right
> (either parenting in the wrong place or not at all). I'd much
> rather see us fix that properly than keep papering over places
> where we get it wrong.

Sorry, I'm still not an expert in all this QOM stuff yet ... so what do
you exactly recommend to do instead?

> Also, "device_add bcm2837" is just nonsensical: there's no
> way to create an SoC device like this with device_add.
> We should not allow it (for this and all the other
> devices that device_add will never work with)...

I'm fine if we additionally add a user_creatable =3D false here, but the
problem then still persists, e.g. with :

echo "{'execute':'qmp_capabilities'} " \
 "{'execute':'device-list-properties', 'arguments': " \
 "{'typename':'bcm2837'}} {'execute': 'human-monitor-command', " \
 "'arguments': {'command-line': 'info qtree'}}"   | valgrind -q \
  aarch64-softmmu/qemu-system-aarch64 -M integratorcp -S -qmp stdio

The same problem also exists for some other devices which have already
been marked with user_creatable =3D false, e.g.:

echo "{'execute':'qmp_capabilities'} " \
 "{'execute':'device-list-properties', " \
 "'arguments':{'typename':'macio-newworld'}} " \
 "{'execute': 'human-monitor-command', 'arguments': " \
 "{'command-line': 'info qtree'}}" | valgrind -q \
 ppc64-softmmu/qemu-system-ppc64 -M mac99 -S -qmp stdio

Hmm, maybe we need a qtest that first executes "info qtree", then runs
'device-list-properties' for all devices and finally checks "info qtree"
again ... since 'device-list-properties' should not change the qtree,
the output of the "info qtree" should be the same. Currently this is not
the case :-/

 Thomas
