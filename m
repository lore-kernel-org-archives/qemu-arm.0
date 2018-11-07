Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2304103wrw;
        Wed, 7 Nov 2018 08:08:36 -0800 (PST)
X-Google-Smtp-Source: AJdET5d5xEACFrJBnxW9vw20XcPihK9h85KkEiF8nNRNjbaCe4UMXEEyrFux+fyQe68c1qvfAwt0
X-Received: by 2002:a37:c891:: with SMTP id t17mr750641qkl.31.1541606916108;
        Wed, 07 Nov 2018 08:08:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541606916; cv=none;
        d=google.com; s=arc-20160816;
        b=VpsHU2ElxibS9CxaeERyOjR2LJB6zxfPCooE5bwg9n4cfhIwcbG7AfuQ5WpIHsYHvl
         1Zg2EV2Hn+OU6JnDxSEtYevc934zBl+E2fv+C0G2+ZrpyBjsEAm1d7DPVYnfv7dETuZc
         RQXkCMeYVs4ZOXftroOlizX+NBCpLHPjPH49gpxTkPZqbYmuhyjCA0SP21Vyw2WDob+l
         v2b/IExp+508PRt/TiGrs6oEAYcwgcEQfI8sIGQyPaM0p60yddmPeBx7Tb4+xCkKRsrf
         lFBwyDrzFhaG4j6PRcmJWH7zJI3sGyD83KwwHbdJo0/lAnhBYkrWQjpy5oJ/NQ8h3VDb
         3Wlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:to:from;
        bh=lkGiAmthicvW8asxs8ub8FVxHZ5oXdDVcV7+cMZZ3W4=;
        b=yXjaaQoRhPE7pBs8Ux0hYIDhUFv5E3gsqD41aVkl77mIy8OTe/Qv8svzRQZbsJboIZ
         VnxDFMr0a+SgGRwzSvhLz1cb1OhR44lF4G26SYAEa0f7M88Ujw+SemGb8zhY0k0Vd9mN
         saKIfFbOIB/beYNg1PYJPaOQq/Pr8VBeymV3Tk6fDynXmlf0ywqLCCSm76KLDwf8iQv2
         xdWhqdeAiBcCL357JV00LgsDChNzm1VTo1lp4nkpNztqQjNSg+h4AB410U0/lh5ddc9r
         UCzjfJBEm4KMOsHKnOJ64efBpNcKOI4obeIEQy+1zlnta/oSal9tT12egahQsI++f0LH
         kdCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j25si57079qtp.145.2018.11.07.08.08.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Nov 2018 08:08:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49081 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKQNf-0002u3-3h
	for alex.bennee@linaro.org; Wed, 07 Nov 2018 11:08:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47691)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gKQNT-0002tx-F0
	for qemu-arm@nongnu.org; Wed, 07 Nov 2018 11:08:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gKQNN-000614-O6
	for qemu-arm@nongnu.org; Wed, 07 Nov 2018 11:08:21 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49948)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1gKQNI-0005vY-Hc; Wed, 07 Nov 2018 11:08:14 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D795A30001E3;
	Wed,  7 Nov 2018 16:08:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-34.ams2.redhat.com
	[10.36.117.34])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 81CEB607BE;
	Wed,  7 Nov 2018 16:08:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 0499B11385F2; Wed,  7 Nov 2018 17:08:06 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1541528230-31817-1-git-send-email-thuth@redhat.com>
	<c0febf9a-f098-112d-9c8d-c320cc66b04a@redhat.com>
	<12974ebb-09de-c6e9-1dd7-5199a8ae6b05@redhat.com>
	<CAFEAcA-B74FQgj3COyGZ_SAAvSUA6=OaLdy5--NoAgHgEGZkpg@mail.gmail.com>
Date: Wed, 07 Nov 2018 17:08:05 +0100
In-Reply-To: <CAFEAcA-B74FQgj3COyGZ_SAAvSUA6=OaLdy5--NoAgHgEGZkpg@mail.gmail.com>
	(Peter Maydell's message of "Tue, 6 Nov 2018 18:58:44 +0000")
Message-ID: <87k1louaze.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Wed, 07 Nov 2018 16:08:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] MAINTAINERS: Add an entry for
 the 'collie' machine
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
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XDe9f5i8eLp5

Peter Maydell <peter.maydell@linaro.org> writes:

> On 6 November 2018 at 18:52, Thomas Huth <thuth@redhat.com> wrote:
>> On 2018-11-06 19:49, Philippe Mathieu-Daud=C3=A9 wrote:
>>> On 6/11/18 19:17, Thomas Huth wrote:
>>>> There is no active maintainer, but since Peter is picking up
>>>> patches via qemu-arm@nongnu.org, I think we could at least use
>>>> "Odd Fixes" as status here.
>>>
>>> This looks more as "Orphan" to me...
>>
>> I'll leave it up to Peter for the final decision...
>
> I think we're not very consistent[*] in our usage of the various
> statuses in the MAINTAINERS file. I guess "Odd Fixes" makes
> sense in that, well, if you send a patch to this
> code and cc me I'll review it and put it in the tree. (This
> is true of any of the arm boards we have.)
>
> [*] We have one thing tagged Orphan, which is bsd-user/,
> and some things tagged Odd Fixes with no listed maintainer,
> and some things tagged Odd Fixes which are in practice more
> like Orphan (for instance sh4), and we list "fpu/" as
> Odd Fixes despite having given it a pretty thorough
> overhaul very recently, and so on...
>
> If you wanted a mechanizable rule, you could try something
> like "every file which is in status Odd Fixes or better
> must list with M: at least one named individual who has
> submitted a pull request in the last nine months" :-)

Sounds like an excellent idea to me!
