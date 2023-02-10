Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1887187ejb;
        Fri, 10 Feb 2023 06:07:42 -0800 (PST)
X-Google-Smtp-Source: AK7set9OGEodUu9UizDkWLOdgqLfP0IBuAcWzpU4qwqhbGtIME5muIiOsE+HWNbCzWVXzREnTcrZ
X-Received: by 2002:ac2:4111:0:b0:4b5:7a91:70f5 with SMTP id b17-20020ac24111000000b004b57a9170f5mr3896008lfi.63.1676038061908;
        Fri, 10 Feb 2023 06:07:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676038061; cv=none;
        d=google.com; s=arc-20160816;
        b=iPA7Pqqhg820WKiQLzzdwxMInLDQc6+wirsqRVfzxQ8CTbVlTply/bbbSjYWy1AERU
         IdR3tcZPbbzIg4FVK57CzXaUu4BAXXcIVUDvDOBWR9D9FV9x8jb0AeHZRjfg5U7AoIml
         AAhmgoMPq/CCehLc99sZeAxcw7oBzltTA/eK30M8xcsdgVvMaNb6b+m5EcKHUDouBuwR
         BpNbAYjD9yaUN/0RxeJxw38dNFKB3oXzw7VNj0/Bl1LjHCz+bIZb8akX5G+RkAKH5ZBH
         qKGcf6deL0Ym6s9OK4/HV5W+AX7S55ok6iv7JFNCjzegEBjUHST0+ZsHQhKV4ildvhnY
         Agcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:subject:cc:to:from:dkim-signature;
        bh=0mztsREDFOI25lDCAUKXFWJOP09qFYtUQKnhTnKIEco=;
        b=jz28a9ItFV4m23elm9es4DNh3J83POtPD8Pv1nC9kumcxKGJDAIU0sd6UTxAa0IyNZ
         BMT1aGifG11D/v75APxJ/6RGrcu5Q5ZZ/Rg321Yu0gYoIFEwqwsLumQIHV96G0hXw0Ov
         0oiIIKTRCENFf8jgswqsn9pkGOZFs1GzkMtRV2gIIbGA1WJccAGH+eIkSL+L2OxHdsMD
         kKNLf1yrfMTOfUnAbNSucht7mcejWFyAnf4rrsMet1f2rC/iGISxXXcmxriMcHQczebu
         GpHFRR9bFKg6PniY1Py7GDXeAWrVyw0qtVoeJ2hSwssMyD3ghdDi+AE4MiJ+wJy1EmVJ
         5W6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ca3Oe9En;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id p13-20020ac246cd000000b004d877961909si2647199lfo.26.2023.02.10.06.07.41
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 06:07:41 -0800 (PST)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ca3Oe9En;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676038060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0mztsREDFOI25lDCAUKXFWJOP09qFYtUQKnhTnKIEco=;
	b=Ca3Oe9Enb8n+srILE04sBVd16H1D7QRE3BUiKEMPewFwFoGDtZrnx9SGu3toAR3sxtfm0O
	X/hcYo77nf1Ce3RmS7Fp7gT/d1dWSu06+2e3yOuzSLTJvdWLRFll6wm/R9DxI5G88OsANN
	yxxdDXQ+gCLkmrX6eRxH4TbynB4N+ts=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-LPGpIT94OPCsvJANpqntjQ-1; Fri, 10 Feb 2023 09:07:32 -0500
X-MC-Unique: LPGpIT94OPCsvJANpqntjQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A765280D0EA;
	Fri, 10 Feb 2023 14:07:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D6C92026D4B;
	Fri, 10 Feb 2023 14:07:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 79E3521E6A1F; Fri, 10 Feb 2023 15:07:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Fabiano Rosas <farosas@suse.de>,  qemu-devel@nongnu.org,
  qemu-arm@nongnu.org,  Ilias Apalodimas <ilias.apalodimas@linaro.org>,
  Peter Maydell <peter.maydell@linaro.org>,  Markus Armbruster
 <armbru@redhat.com>
Subject: Re: [RFC PATCH] target/arm: disable FEAT_SME if we turn off SVE
References: <20230203100551.2445547-1-alex.bennee@linaro.org>
	<87cz6loahb.fsf@suse.de> <877cwtpl1v.fsf@linaro.org>
Date: Fri, 10 Feb 2023 15:07:30 +0100
In-Reply-To: <877cwtpl1v.fsf@linaro.org> ("Alex =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Tue, 07
	Feb 2023 15:09:57 +0000")
Message-ID: <87k00p7gwt.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-TUID: lOy9LaxmlKLf

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Fabiano Rosas <farosas@suse.de> writes:
>
>> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>>
>>> Before this change booting a -cpu max,sve=3Doff would trigger and
>>> assert:
>>>
>>>   qemu-system-aarch64: ../../target/arm/helper.c:6647: sve_vqm1_for_el_=
sm: Assertion `sm' failed.
>>>
>>> when the guest attempts to write to SMCR which shouldn't even exist if
>>> SVE has been turned off.
>>>
>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>> Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
>>> ---
>>>  target/arm/cpu64.c | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
>>> index 0e021960fb..a38d43421a 100644
>>> --- a/target/arm/cpu64.c
>>> +++ b/target/arm/cpu64.c
>>> @@ -409,6 +409,13 @@ static void cpu_arm_set_sve(Object *obj, bool valu=
e, Error **errp)
>>>      t =3D cpu->isar.id_aa64pfr0;
>>>      t =3D FIELD_DP64(t, ID_AA64PFR0, SVE, value);
>>>      cpu->isar.id_aa64pfr0 =3D t;
>>> +
>>> +    /* FEAT_SME requires SVE, so disable it if no SVE */
>>> +    if (!value) {
>>> +        t =3D cpu->isar.id_aa64pfr1;
>>> +        t =3D FIELD_DP64(t, ID_AA64PFR1, SME, 0);
>>> +        cpu->isar.id_aa64pfr1 =3D t;
>>> +    }
>>
>> What about -cpu max,sve=3Doff,sme=3Don ?
>
> Gah - I bet this is going to depend on ordering of parameters as well.
>
> Markus,
>
> Is there any way to represent optionA implies optionB in our argument par=
sing?

You meant "in the one of our multitude of ways to parse arguments that
is being used here".

The commit message implicates -cpu.  Which is its own special case.
qemu_init() passes the option argument to parse_cpu_option(), which
splits it at the first ",", interprets the first part as CPU model name,
and passes the second part to the CPU type's ->parse_features()
callback.  Three implementations, all bespoke parsers[*].  ARM CPUs
appear to use cpu_common_parse_features().  As far as I can tell, it
parses the string as a sequence of CPU properties PROP=3DVAL,... and sets
the properties.

cpu_arm_set_sve() is the setter for property "sve".  Checking the value
of another property in such a setter is usually wrong, as Fabiano
pointed out for this case.  Check in the realize() method instead.

Questions?


[*] Yes, having in the order of twenty ad hoc option argument parsers is
an embarrassment, but it's what a decade or so of unsystematic interface
growth gets you.
