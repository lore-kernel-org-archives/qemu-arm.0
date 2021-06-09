Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp5317293lfa;
        Wed, 9 Jun 2021 04:58:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6phDSIGEaYs1ljP8YTT9m2g8WTvLj6x6Ph4djsAPHzAdaoIGZt9ZFvGSyw08RacVc72zj
X-Received: by 2002:a17:906:27d3:: with SMTP id k19mr27341349ejc.368.1623239935144;
        Wed, 09 Jun 2021 04:58:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623239935; cv=none;
        d=google.com; s=arc-20160816;
        b=QKFnIvynSUZkpLVXAvU6X92mlV7R7psKNNpLWiqMCP/Ti88Au9QKHKqfWJVy/JWV5Z
         Z9+SVub87JyyAjmM5vG5C8DC0qmcjhHBB09Q1U7zATeqdoDDKY2Vy0hGplv2ahQ/1bmZ
         qVZHaOmIW6HeU0Y4ELo1fhy/DMSox60J6x/vObS4K3ymvB5iTPYYrNA2RXOMfjCd2fUC
         +uRvc0aIwnvHGqQzK7LkzLGuw9gS/NAwhcgtbGr2FCaBMpSog760FNjxrtx8rjy+gSt8
         Y5zYQOz5GpRFB6oSvUbT6ZjBdUm0dlUw+zr1g3XMk7417D3TuqenOXFJUjk9JNKJG2Nh
         g3BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:subject:cc:to:from:dkim-signature;
        bh=V8tyxxcAYpa83qpatDMd0uJjULBtRmwb7HYcI1mWBF0=;
        b=hkuRI7EMKQ6uW6Bn5qatPz6ASQNmg6LXxisuN4/Yjxksh3no/QxNhPsXEHPx0BNMc4
         W6ASqOTRPSbVPruM8M4+QWtd5QovRSdi+lTG8d7YLnNx1g3+rF7I/11wXlx4AbjPDTo0
         zhBlPg/kNAImFvKTTQxgbSeqnAIxiVRkuAErc6mBRHfL/S9BBow6xvUnigXhq2yJdhRU
         qNwCeuuq4dvrmCEjO1qLvzSsJjP7wzn5orm/WvcE1oVC+yDVQMwXEx9kEg4R1//SxSfP
         ucFZzcyZLGVnHcDpXSKCVbHQLC2ObjuhITkIK06r9yJlDmKC0hmlXqzi8f0xGKp833Dz
         1elA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G9X3sOM7;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 18si2249146eji.288.2021.06.09.04.58.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Jun 2021 04:58:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G9X3sOM7;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623239934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V8tyxxcAYpa83qpatDMd0uJjULBtRmwb7HYcI1mWBF0=;
	b=G9X3sOM7+GGTP4pssr9sVpr1H0jtLdaDZuUigRKx/DJm2hza1W1J7O82lcD6wSjC3Qqge7
	U77GQuaCSUMh7D+787+LR4V/qrpBtUshAuSgXzc0VBD2z68nb5W0t7NTHh4x4uV+Ai+xKG
	BYyAUvy+m3ere7qsUrcBKPZe5kOeCvE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-ESST1H32ODK8kvHx0vIXhw-1; Wed, 09 Jun 2021 07:58:53 -0400
X-MC-Unique: ESST1H32ODK8kvHx0vIXhw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1FBF1922023;
	Wed,  9 Jun 2021 11:58:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com [10.36.112.222])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BCF9620DE;
	Wed,  9 Jun 2021 11:58:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 37B42113865F; Wed,  9 Jun 2021 13:58:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,  qemu-devel@nongnu.org,  Markus
 Armbruster <armbru@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,
  Eduardo Habkost <ehabkost@redhat.com>,  John Snow <jsnow@redhat.com>,
  Richard Henderson <richard.henderson@linaro.org>,  qemu-arm@nongnu.org,
  Paolo Bonzini <pbonzini@redhat.com>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Subject: Re: [PATCH v8 02/12] accel: Introduce 'query-accels' QMP command
References: <20210526170432.343588-1-philmd@redhat.com>
	<20210526170432.343588-3-philmd@redhat.com>
	<af5b2b3a-e223-c8dd-91eb-51f9813d82ae@redhat.com>
	<9613547f-2e68-1bb9-5be8-c77f8c5c148f@redhat.com>
Date: Wed, 09 Jun 2021 13:58:50 +0200
In-Reply-To: <9613547f-2e68-1bb9-5be8-c77f8c5c148f@redhat.com> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 8 Jun 2021 15:38:32
 +0200")
Message-ID: <87mtrzp7ut.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: RdRW24at6MCJ

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 6/8/21 3:27 PM, Thomas Huth wrote:
>> On 26/05/2021 19.04, Philippe Mathieu-Daud=C3=A9 wrote:
>>> Introduce the 'query-accels' QMP command which returns a list
>>> of built-in accelerator names.
>>>
>>> - Accelerator is a QAPI enum of all existing accelerators,
>>>
>>> - AcceleratorInfo is a QAPI structure providing accelerator
>>> =C2=A0=C2=A0 specific information. Currently the common structure base
>>> =C2=A0=C2=A0 provides the name of the accelerator, while the specific
>>> =C2=A0=C2=A0 part is empty, but each accelerator can expand it.
>>>
>>> - 'query-accels' QMP command returns a list of @AcceleratorInfo
>>>
>>> For example on a KVM-only build we get:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0 { "execute": "query-accels" }
>>> =C2=A0=C2=A0=C2=A0=C2=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "return": [
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 "name": "qtest"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 },
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 "name": "kvm"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 }
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ]
>>> =C2=A0=C2=A0=C2=A0=C2=A0 }
>>>
>>> Reviewed-by: Eric Blake <eblake@redhat.com>
>>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>> Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>> ---
>>> v8:
>>> - Include code snippet from Markus adding to machine-target.json
>>> =C2=A0=C2=A0 to be able to use enum values or union branches conditiona=
l.
>>> - Use accel_find() on enum to be sure the accelerator is enabled
>>> =C2=A0=C2=A0 at runtime (chat with jsnow / eblake).
>>>
>>> Cc: Eric Blake <eblake@redhat.com>
>>> Cc: John Snow <jsnow@redhat.com>
>>> Cc: Markus Armbruster <armbru@redhat.com>
>>> ---
>>> =C2=A0 qapi/machine-target.json | 54 ++++++++++++++++++++++++++++++++++=
++++++
>>> =C2=A0 accel/accel-qmp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 32=
 ++++++++++++++++++++++++
>>> =C2=A0 accel/meson.build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +-
>>> =C2=A0 3 files changed, 87 insertions(+), 1 deletion(-)
>>> =C2=A0 create mode 100644 accel/accel-qmp.c
>>>
>>> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
>>> index e7811654b72..586a61b5d99 100644
>>> --- a/qapi/machine-target.json
>>> +++ b/qapi/machine-target.json
>>> @@ -329,3 +329,57 @@
>>> =C2=A0 ##
>>> =C2=A0 { 'command': 'query-cpu-definitions', 'returns': ['CpuDefinition=
Info'],
>>> =C2=A0=C2=A0=C2=A0 'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) ||
>>> defined(TARGET_I386) || defined(TARGET_S390X) || defined(TARGET_MIPS)' =
}
>>> +
>>> +##
>>> +# @Accelerator:
>>> +#
>>> +# An enumeration of accelerator names.
>>> +#
>>> +# Since: 6.1
>>> +##
>>> +{ 'enum': 'Accelerator',
>>> +=C2=A0 'data': [
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { 'name': 'hax', 'if': 'defined(CONFIG_=
HAX)' },
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { 'name': 'hvf', 'if': 'defined(CONFIG_=
HVF)' },
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { 'name': 'kvm', 'if': 'defined(CONFIG_=
KVM)' },
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { 'name': 'qtest' },
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { 'name': 'tcg', 'if': 'defined(CONFIG_=
TCG)' },
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { 'name': 'whpx', 'if': 'defined(CONFIG=
_WHPX)' },
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { 'name': 'xen', 'if': 'defined(CONFIG_=
XEN_BACKEND)' } ] }
>>> +
>>> +##
>>> +# @AcceleratorInfo:
>>> +#
>>> +# Accelerator information.
>>> +#
>>> +# @name: The accelerator name.
>>> +#
>>> +# Since: 6.1
>>> +##
>>> +{ 'struct': 'AcceleratorInfo',
>>> +=C2=A0 'data': { 'name': 'Accelerator' } }
>>> +
>>> +##
>>> +# @query-accels:
>>> +#
>>> +# Get a list of AcceleratorInfo for all built-in accelerators.
>>> +#
>>> +# Returns: a list of @AcceleratorInfo describing each accelerator.
>>> +#
>>> +# Since: 6.1
>>> +#
>>> +# Example:
>>> +#
>>> +# -> { "execute": "query-accels" }
>>> +# <- { "return": [
>>> +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>> +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "n=
ame": "qtest"
>>> +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>> +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>> +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "n=
ame": "kvm"
>>> +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +#=C2=A0=C2=A0=C2=A0 ] }
>>> +#
>>> +##
>>> +{ 'command': 'query-accels',
>>> +=C2=A0 'returns': ['AcceleratorInfo'] }
>>=20
>> What about Markus' comment here:
>>=20
>> =C2=A0https://lore.kernel.org/qemu-devel/87mtsoieyz.fsf@dusky.pond.sub.o=
rg/
>>=20
>> ?
>>=20
>> If I've got him right, you don't need the command at all, the Accelerato=
r
>> enum should be sufficient?
>
> Yes, this is the part jsnow said "we are waiting for Markus to comment"
> on the other thread ;) We'd like to only have enums, but QAPI doesn't
> seem to allow a "leaf without branch", we need a command or struct to
> use the enum else it is elided.

Correct; query-qmp-schema shows only the stuff used by commands and
events.

>                                 Or maybe we didn't understood Markus
> idea.
