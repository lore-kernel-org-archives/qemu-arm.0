Received: by 10.28.4.212 with SMTP id 203csp2356007wme;
        Thu, 26 Apr 2018 08:27:45 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoSlNH1ppdIzECuXfMoRE7P7Olj7w5ju3Pl7YsXhQHw2IU+8U28SwReKksAHChsxp/9N7np
X-Received: by 2002:ac8:2f8f:: with SMTP id l15-v6mr30243811qta.337.1524756465720;
        Thu, 26 Apr 2018 08:27:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524756465; cv=none;
        d=google.com; s=arc-20160816;
        b=cp7eSydJQINhRcKaNm839lDXlRd3JPnCjyqrMtLU00KxXL8UTZvAHLSlThLyhWr6vo
         O5Cr81aFV45gJ/4oz3anrFdhV0KY61jj1s5P3HC9EGrb6kb76hCAkqQzPtwDrjnkng0l
         FiF9C3lDecOLMLWSkLmmrh3hVAnEJxi+jP/6ATJmiNH5pLck7erYrYsKo+a2Uu/amtXq
         FtsPI44l/LdDRzQ9QVxVrX4Zz2G3Uh0pPmdnAl9qgjs/Mu1d24YqUNu0mr0M7w/sx1QJ
         333sHFgGrgHQGjoBsseGN9HUYkUYMn7FrrlZih1JfD60Wx+HxlDrMrlXX02ApLIoLXNM
         MkIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=0JLBzfmMT1oc26lHaMev4Ar80aMgJ+xS1vgqcO/HX4Q=;
        b=KLLC61vC68rExRlWsVfEZhSysy5u2NBu7echaIJ7MJ/E7IaNaFZJMb8rcKTAzAQLMd
         FacF9joR/MVM6WHIi27UmQLtFKkWkb7/N4fRwcIDt2bx3E9qt6EqQhA04+S5fmB2j8t/
         RvmAAysQzrudat97Fg5KFVLuldEV0IgHuye73jX2371uEHaJEKpdhDJ82emMlV+PmV8v
         kotEfcS0ueDgAWFOlxvYdXR+pyHlYPlF2qVPSvkxVP/6nakxoT3bFc20SK5I5ssqOVaG
         rQHLTUkvEDtMMR8yWVaU8gyLQBVLtgeETDdIDhzk8LfNVfy9+6FthP7aQE+bou0qVpi9
         XNpw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x18si1880041qva.53.2018.04.26.08.27.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Apr 2018 08:27:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42881 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBioD-0003BG-6r
	for alex.bennee@linaro.org; Thu, 26 Apr 2018 11:27:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54981)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fBio2-0003B8-UK
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 11:27:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fBiny-0007Ka-Rj
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 11:27:34 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37446 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fBiny-0007KP-NW; Thu, 26 Apr 2018 11:27:30 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7EA998DC56;
	Thu, 26 Apr 2018 15:27:26 +0000 (UTC)
Received: from [10.36.116.75] (ovpn-116-75.ams2.redhat.com [10.36.116.75])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DAC8B63536;
	Thu, 26 Apr 2018 15:27:21 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>
References: <1521452376-25099-1-git-send-email-thuth@redhat.com>
	<87in8qf2w3.fsf@dusky.pond.sub.org>
	<62dba5cf-b497-1a98-0af5-971e169a3458@redhat.com>
	<877eou2nek.fsf@dusky.pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <71e91497-42bd-eea7-636d-9e725c4d2906@redhat.com>
Date: Thu, 26 Apr 2018 17:27:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <877eou2nek.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Thu, 26 Apr 2018 15:27:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Thu, 26 Apr 2018 15:27:26 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH] tests/device-introspect:
 Test devices with all machines, not only with "none"
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
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hf0GtL3cG6EC

On 26.04.2018 13:54, Markus Armbruster wrote:
> Thomas Huth <thuth@redhat.com> writes:
[...]
> Actually, a worse offender in the "waste everybody's time via redunancy=
"
> department could be qom-test.

I guess we could also change the logic in qom-tester to only run with
all machines if we're in SPEED=3Dslow mode, and rather only use the "none=
"
machine by default?

>> Anyway, do you think my patch here is useful and has a chance of getti=
ng
>> included? I.e. shall I re-spin this as a non-RFC patch? Or shall we
>> rather wait for Eduardo's python-based tests to get included into the
>> repository?
>=20
> I don't mind having make check SPEED=3Dslow run more extensive tests.
> Assuming we actually run them at least once in a while, which seems
> doubtful.

If some developers (like myself) are running it at least every couple of
weeks manually, that's already much better than nothing!

>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>  In case someone wants to help with creating some bug fix patches
>>>>  during the QEMU hard freeze phase: This test can now be used to
>>>>  trigger lots of introspection bugs that we were not aware of yet.
>>>>  I think most of the bugs are due to wrong handling of instance_init
>>>>  vs. realize functions.
>>>
>>> Yes, that's a common class of bugs.  There's little guidance on what
>>> kind of work belongs where, and plenty of bad examples.
>>
>> I think we urgently need a file in doc/devel/ that describes the vario=
us
>> states / functions of a device, where we should properly describe the
>> differences between instance_init and realize. ... I'll try to come up
>> with something when I've got some spare time (unless somebody else
>> volunteers to do that first).
>=20
> Please do.
>=20
> Widen the scope from just TYPE_DEVICE to all of QOM?

I don't have that much experience with QOM yet that I'd dare to write a
doc about it. Would you maybe be interested in writing something up
about QOM?

 Thomas
