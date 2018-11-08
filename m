Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3045791wrw;
        Wed, 7 Nov 2018 23:04:56 -0800 (PST)
X-Google-Smtp-Source: AJdET5esOq165i3izHp3CVq90krDSn4ckljvI3Y5ZxsOpvb82HBzmeRF7HWBoQcg+tD1gHtl1nK2
X-Received: by 2002:a37:b101:: with SMTP id a1-v6mr3065923qkf.222.1541660696161;
        Wed, 07 Nov 2018 23:04:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541660696; cv=none;
        d=google.com; s=arc-20160816;
        b=AFFk+I+p2KQV3tu1vvvJkXWV90FoEvJye78jdOTqFYiNZH2VROFMerRiNAH9NKgQYW
         ciWdQkMJ9tF/mTsa3g+vk5lhuhMbiCnvSHpav4VjfFpW6Tw8hqpw1x5zshUiy+J8n2VY
         99botJfRd0OYPMAQaxu/5/Diw10/dA2ZGCynuIDQ3sR7/TXsDghqD0fr4dUh/4bS4Jjp
         lq8r/LJQVIs7ie8CJqNnuDBuBjzpd5yi/9gUq2lcrTPfJtPhBtvZX9CSYViOqJAWPkhd
         WOCJj9IsHmz2bz3P1LPQb9EeeshQi5X50Y+vDnye7arADXJ0wKOEZM0aOrS1pMaLvFmo
         GmGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:to:from;
        bh=5Q42DlulGdOeFCVCxgGvTDzo9lLFUJxlh7BBJh1hN70=;
        b=gJGeWiQ346xTSvfeve36VkTXTN/IdMIQC7Eb1alNzTP89KvZjT93JLmrWTwbh/lw/w
         hTrv9243HNOjyIemneQxw5PQL1V3hAlNYL/2dEYYiJtJI9XvJcT0BC5OVvrrRWWdBIHq
         RBjdwRatnItkzPJWLcnfgRScy7hK38zA4HuelnZW/ZXdmFUXJbvVFNNeDgrc00L+TAVD
         /lsjDYRJU0IZvhH3zR955HiIOkEtjbpSyHUtBPX8OyFKz5guLJB4aLkr/pSUSMrmpIws
         tKApi/J0jnNRoaNc5QqL7EhDPaslCiCXhNoa4kqIhDoUa0DDxtHzgSmqWSjQ+JfayMDW
         eZcg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q3si2465847qtd.95.2018.11.07.23.04.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Nov 2018 23:04:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54698 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKeN5-0002gv-NM
	for alex.bennee@linaro.org; Thu, 08 Nov 2018 02:04:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43438)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gKeMx-0002gk-RD
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 02:04:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gKeMu-0000D7-HI
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 02:04:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58218)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1gKeMr-00008Y-87; Thu, 08 Nov 2018 02:04:41 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0D4CF2D7F0;
	Thu,  8 Nov 2018 07:04:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-34.ams2.redhat.com
	[10.36.117.34])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D3D0183C3;
	Thu,  8 Nov 2018 07:04:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A612211385F2; Thu,  8 Nov 2018 08:04:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1541528230-31817-1-git-send-email-thuth@redhat.com>
	<c0febf9a-f098-112d-9c8d-c320cc66b04a@redhat.com>
	<12974ebb-09de-c6e9-1dd7-5199a8ae6b05@redhat.com>
	<CAFEAcA-B74FQgj3COyGZ_SAAvSUA6=OaLdy5--NoAgHgEGZkpg@mail.gmail.com>
	<87k1louaze.fsf@dusky.pond.sub.org>
	<4b0e9b3f-5d88-9ef2-d0c5-f241067001d0@redhat.com>
	<CAFEAcA_N7zeuMGGvUBC6xu-AK2gH0n+aNwJOkhs7yWFx_3DbsQ@mail.gmail.com>
Date: Thu, 08 Nov 2018 08:04:25 +0100
In-Reply-To: <CAFEAcA_N7zeuMGGvUBC6xu-AK2gH0n+aNwJOkhs7yWFx_3DbsQ@mail.gmail.com>
	(Peter Maydell's message of "Wed, 7 Nov 2018 19:42:11 +0000")
Message-ID: <87in18qccm.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 08 Nov 2018 07:04:31 +0000 (UTC)
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
X-TUID: 10+repr+/3zm

Peter Maydell <peter.maydell@linaro.org> writes:

> On 7 November 2018 at 19:39, Thomas Huth <thuth@redhat.com> wrote:
>> On 2018-11-07 17:08, Markus Armbruster wrote:
>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>>
>>>> On 6 November 2018 at 18:52, Thomas Huth <thuth@redhat.com> wrote:
>>>>> On 2018-11-06 19:49, Philippe Mathieu-Daud=C3=A9 wrote:
>>>>>> On 6/11/18 19:17, Thomas Huth wrote:
>>>>>>> There is no active maintainer, but since Peter is picking up
>>>>>>> patches via qemu-arm@nongnu.org, I think we could at least use
>>>>>>> "Odd Fixes" as status here.
>>>>>>
>>>>>> This looks more as "Orphan" to me...
>>>>>
>>>>> I'll leave it up to Peter for the final decision...
>>>>
>>>> I think we're not very consistent[*] in our usage of the various
>>>> statuses in the MAINTAINERS file. I guess "Odd Fixes" makes
>>>> sense in that, well, if you send a patch to this
>>>> code and cc me I'll review it and put it in the tree. (This
>>>> is true of any of the arm boards we have.)
>>>>
>>>> [*] We have one thing tagged Orphan, which is bsd-user/,
>>>> and some things tagged Odd Fixes with no listed maintainer,
>>>> and some things tagged Odd Fixes which are in practice more
>>>> like Orphan (for instance sh4), and we list "fpu/" as
>>>> Odd Fixes despite having given it a pretty thorough
>>>> overhaul very recently, and so on...
>>>>
>>>> If you wanted a mechanizable rule, you could try something
>>>> like "every file which is in status Odd Fixes or better
>>>> must list with M: at least one named individual who has
>>>> submitted a pull request in the last nine months" :-)
>>>
>>> Sounds like an excellent idea to me!
>>
>> Well, for me "odd fixes" means that there is someone around who might
>> pick up the patch and throw it into a PULL request.

That someone should be listed with M:.

>>                                                     "Orphan" means it's
>> mostly in vain to send patches for this subsystem, since there is nobody
>> going to pick up your patch. So for the ARM boards, I'd say that "odd
>> fixes" is a better choice, since Peter still picks up most of the
>> patches via the "L: qemu-arm@nongnu.org" (big thanks for this, by the wa=
y!).
>
> I think there should be a named person, though. A list
> isn't a maintainer (at least not for the big whole
> subsystem lists we have).

Agree.
