Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp379337lfg;
        Wed, 5 May 2021 08:01:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+1vYNPTnHpPQMub/IgESWnyzXiJ8kIyVSOwZaAaeAl8Xfb3+JWLVesbmQ0OsIz5ayXP/N
X-Received: by 2002:a17:906:6801:: with SMTP id k1mr27259026ejr.137.1620226909640;
        Wed, 05 May 2021 08:01:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620226909; cv=none;
        d=google.com; s=arc-20160816;
        b=PYySVzsNGPGdm5PTx4HUHfmSuKANFST60RnxRy0jg6WClF8XowznrRXG7Ghmb2ORaM
         rV+d5yCYDGFIPLMrfnAdTsFGgHtRGDlDubpuNcUh6Oq0NCbiEyndi0kJ6c2nPSB+UBpd
         gI8MukhNbVZkj641LnUGpUHlQUHqE/1lMJb26hpqHy9a9LWTh70D6SCtRurjo7Qymy5k
         HxkOYVptRUfF1zqCCJlEk1vbvq1zGe9XXjjk+2/VvCE0OyZaNJX2mhsqr0nfQFoozCAJ
         IbGGcTSBe2aU//92oq/uL55NElGscZ22+sxRGKglUazAbvrwVcvBzsQhra6XhVXnyzOQ
         XE0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:subject:cc:to:from:dkim-signature;
        bh=fhMp4x+KILijfTKHWUNCFvTuYIYiXuFj4VSPB80hbqg=;
        b=lQITsOwLs7PKzQ9eBxKbb83UDcpsdT6zDKDWLrEAD2ZgXPz+DgLNJaCqushUSyIOa8
         ufaQiSSGLb+i4mxu3CY/GUvIExQ3+rVhhmm+fwzquI5Ap/oavb9SM05gwOT8eXGslwR5
         podt7GBB5Qji0xtP5efgZh+Ave8YWsH08hC98Z/4xgQ7PmDemVzXIOwwZ9pExkpQpxSk
         8i4G9PjgcSE7CT68mKCP+BNktAdRGo+qTPVH6Zu70pREdHRh5MPLFXzizHFKIATjwsPG
         4LSFJCYBFtEh9CuhM8ftLMasIMGX6r+JoGSb6ZCjlHXpSGy8oCkFXlI5LvQNkgelJiUU
         r0xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=btv5fclH;
       spf=pass (google.com: domain of armbru@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id t15si4501232edd.1.2021.05.05.08.01.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 May 2021 08:01:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=btv5fclH;
       spf=pass (google.com: domain of armbru@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620226908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fhMp4x+KILijfTKHWUNCFvTuYIYiXuFj4VSPB80hbqg=;
	b=btv5fclHNLYXB7Q8KBcLLHzjPkDoriTBeYJwfTYA0KrBbezZ8e/1VudTA0QEV34kEeCts6
	VMecFyDZa8Bvs9XBuSuTNY+C1JmIGQ14n7Jlq56GovLiAn7qDAKZ8PFCssxfMVCZcyiQvd
	IXeRiMGde6ebCkojrKnODF9tTg7DH54=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-QXJDeNWnNMaHXWeVmloDqQ-1; Wed, 05 May 2021 11:01:47 -0400
X-MC-Unique: QXJDeNWnNMaHXWeVmloDqQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB3141020C24;
	Wed,  5 May 2021 15:01:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com [10.36.114.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 64EBD6062C;
	Wed,  5 May 2021 15:01:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D934A1138529; Wed,  5 May 2021 17:01:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,  Eduardo Habkost <ehabkost@redhat.com>,
  Juan Quintela <quintela@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Andrew Jones <drjones@redhat.com>,
  qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Claudio Fontana
 <cfontana@suse.de>,  Paolo Bonzini <pbonzini@redhat.com>,  Alex
 =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v5 02/10] accel: Introduce 'query-accels' QMP command
References: <20210501223638.510712-1-philmd@redhat.com>
	<20210501223638.510712-3-philmd@redhat.com>
	<87o8dpvet4.fsf@dusky.pond.sub.org>
	<918d1fc1-260c-57b7-2dd9-61f1125a2aa2@redhat.com>
Date: Wed, 05 May 2021 17:01:41 +0200
In-Reply-To: <918d1fc1-260c-57b7-2dd9-61f1125a2aa2@redhat.com> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 5 May 2021 13:49:45
 +0200")
Message-ID: <87tunhns16.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: IRfo87qk2tDq

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 5/5/21 9:07 AM, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>=20
>>> Introduce the 'query-accels' QMP command which returns a list
>>> of built-in accelerator names.
>>>
>>> - Accelerator is a QAPI enum of all existing accelerators,
>>>
>>> - AcceleratorInfo is a QAPI structure providing accelerator
>>>   specific information. Currently the common structure base
>>>   provides the name of the accelerator, while the specific
>>>   part is empty, but each accelerator can expand it.
>>>
>>> - 'query-accels' QMP command returns a list of @AcceleratorInfo
>>>
>>> For example on a KVM-only build we get:
>>>
>>>     { "execute": "query-accels" }
>>>     {
>>>         "return": [
>>>             {
>>>                 "name": "qtest"
>>>             },
>>>             {
>>>                 "name": "kvm"
>>>             }
>>>         ]
>>>     }
>>>
>>> Note that we can't make the enum values or union branches conditional
>>> because of target-specific poisoning of accelerator definitions.
>>=20
>> Let me try to complete this argument;
>>=20
>>   If we did, enum Accelerator could only be used in target-specific
>>   code.  But we want to use it in generic code, too.
>>=20
>> Which generic code exactly?
>
>
> cpu.c:133:#ifdef CONFIG_TCG
> hmp-commands-info.hx:271:#if defined(CONFIG_TCG)
> monitor/misc.c:324:#ifdef CONFIG_TCG
> softmmu/physmem.c:28:#ifdef CONFIG_TCG
>
> and more importantly:
>
> include/exec/cpu-all.h:430:#ifdef CONFIG_TCG
> include/exec/cpu-defs.h:77:#if !defined(CONFIG_USER_ONLY) &&
> defined(CONFIG_TCG)
> include/exec/exec-all.h:25:#ifdef CONFIG_TCG
> include/sysemu/cpu-timers.h:27:#ifdef CONFIG_TCG
>
> Thomas might provide more cases, IIRC he audited this recently.

No need, I'm interested in examples, not a complete list.

Please amend the commit message:

    Note that we can't make the enum values or union branches conditional
    because of target-specific poisoning of accelerator definitions.
    If we did, enum Accelerator could only be used in target-specific
    code.  But we want to also use it in generic code, such as ...

with ... replaced by one or more references to relevant code.

If we expect readers of the code to later wonder why we're not using
QAPI conditionals, then we should add a comment to the QAPI schema,
too.  Not a demand, since I'm not sure what to expect.
