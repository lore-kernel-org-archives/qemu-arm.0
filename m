Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp404592lfg;
        Wed, 5 May 2021 08:29:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAUNvCQ9pKiAjZt/JOPx031JACyPzpkEwLEYUm3XlxMEyTvyBjzPGfJipdc3dexu0dXJ0H
X-Received: by 2002:a05:6402:4305:: with SMTP id m5mr18049225edc.143.1620228542984;
        Wed, 05 May 2021 08:29:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620228542; cv=none;
        d=google.com; s=arc-20160816;
        b=EwqmbopM+C8Z7EJzUgmEiTu5bCremXmdAL40lDrWLe72hwT2HRKFSWzYGVRZcae5Vz
         abcEZxLHQzJ3yMSUCWpDKneb2uR7kHTDGTarwhoWSrXIVum9OmyMnUImcw+k3HNVG7dA
         C+Z7wZgtZYLC3xqKwlMkhkSRfU12DAhYlrzVp3Y+BdCG2G/KrKTsatFDsjvmL4Z7rqsN
         U+eStEDDiyBM1NJJhjkTv8iJlgWbNiiwjzeyqwyyzdJ6JYbRkDQ4qtlDxaVd1AWNOyuO
         3b+3wkazRoZTOO8pnpko70DMQwYnQ8N1T4vuDnuOHDgAiiQaPNKbC9a70/I3UqPZKeZ9
         A6Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=wDdpqs3tfIWJVrHbBw8hZ+NCVPTorvGxAt7OMDVgjCo=;
        b=ntsaxknKapNxhX7NYw8x1tmBPhW5FExET7GSMdHXXHd9Y6Wy+B7jIDsk3oe1+Yy0My
         VpbpsRHvl0tZnLuu/BZJj93QkfJfXR162pbhuo9a9BdLt5fcOm5ylTlbNO1Xfq1itctg
         KbGYIfKtZpt/ytW0IW2Vz4FSsbRVU9pbV0MuXhXkjiR8kjI9PeYoojCHvyYXiDP4TBQ4
         wH07P0nfOjUHPGClETSPs3KWt/1jd4tK0Bn9Dk2B7wtOnYM7vQPxSNVK+x2DaQa1gA8L
         7c6jxh18xVbCZal6RPeS9ewHLa0tw64XKGQdTmPNpgR9KCJhVFOF6nWyCZcJ3Y6kNdXq
         bG4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FEX0buyS;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id hc43si7097894ejc.387.2021.05.05.08.29.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 May 2021 08:29:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FEX0buyS;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620228541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wDdpqs3tfIWJVrHbBw8hZ+NCVPTorvGxAt7OMDVgjCo=;
	b=FEX0buySwUeBMzbl7ZeVUL6vgVecXEntn2tmPb3Pnd/X/lLMkBckulq95Gy07L/JY1FgvG
	Lh+bO9xlc1e3jDgoc3GVVvbT6rHMTier1B7chmiT0QS/XGkDD3tDN4ohfhL9reNewD0mrv
	OWetdPhoVFhL1qQy9UD08R80YDD8VJs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-Yd6e-tkXPgSILp1LQ4BdrA-1; Wed, 05 May 2021 11:29:00 -0400
X-MC-Unique: Yd6e-tkXPgSILp1LQ4BdrA-1
Received: by mail-wm1-f70.google.com with SMTP id n24-20020a7bcbd80000b029014287841063so459609wmi.3
        for <alex.bennee@linaro.org>; Wed, 05 May 2021 08:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wDdpqs3tfIWJVrHbBw8hZ+NCVPTorvGxAt7OMDVgjCo=;
        b=DObol+yp9hHHfl0asy70STlA2QUXLbVta6/bmgWRV/IjyzQQlBzRHYdxE5KLW7a8Ec
         aDq58vTQHrPpftFuqhr0omfHCKY6eFnSvzrw+DOsii6lP/jja/iOeHYSrzRED789wOaH
         L4YlcquDf230cAcV6/YEGACLoLGkfqmQ+7VEOiSprBapa/anZNvjEQG+HHOvlGfw9ZY+
         3R04fIwzh+uJFE1U5a8z7U051rw7k8XqDLDSO77bH38R669s73UdQzEv1LnEl9gvJ3ys
         S5gf9J3JuCWJ+u3e0S8Zc0YEFzcDkwEZqhzjEkm7OQxpCLXxwsKC1hPjgddD10eZax37
         UZJA==
X-Gm-Message-State: AOAM5339Az19gUTgaMkQycLuxtUFIhWqBdYo1hOWnTawh6PjLbkNMMpo
	mfuB31jrzaakcMpNeN2LBkIqzV20yY/MczgHPOy+uyKx5BTRNz1Nco5pZMQ1YBjL9shwc3Ijl0K
	xoRpAlXUsstQkyadL
X-Received: by 2002:a1c:e387:: with SMTP id a129mr34177985wmh.61.1620228538875;
        Wed, 05 May 2021 08:28:58 -0700 (PDT)
X-Received: by 2002:a1c:e387:: with SMTP id a129mr34177964wmh.61.1620228538695;
        Wed, 05 May 2021 08:28:58 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.19] (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
        by smtp.gmail.com with ESMTPSA id i3sm5716808wmq.28.2021.05.05.08.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 May 2021 08:28:58 -0700 (PDT)
Subject: Re: [PATCH v5 02/10] accel: Introduce 'query-accels' QMP command
To: Markus Armbruster <armbru@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210501223638.510712-1-philmd@redhat.com>
 <20210501223638.510712-3-philmd@redhat.com>
 <87o8dpvet4.fsf@dusky.pond.sub.org>
 <918d1fc1-260c-57b7-2dd9-61f1125a2aa2@redhat.com>
 <87tunhns16.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <44333ee1-6096-1fb4-cf95-6e3d74b36bf1@redhat.com>
Date: Wed, 5 May 2021 17:28:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87tunhns16.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: ueeKMBL8XSUI

On 5/5/21 5:01 PM, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> On 5/5/21 9:07 AM, Markus Armbruster wrote:
>>> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>>>
>>>> Introduce the 'query-accels' QMP command which returns a list
>>>> of built-in accelerator names.
>>>>
>>>> - Accelerator is a QAPI enum of all existing accelerators,
>>>>
>>>> - AcceleratorInfo is a QAPI structure providing accelerator
>>>>   specific information. Currently the common structure base
>>>>   provides the name of the accelerator, while the specific
>>>>   part is empty, but each accelerator can expand it.
>>>>
>>>> - 'query-accels' QMP command returns a list of @AcceleratorInfo
>>>>
>>>> For example on a KVM-only build we get:
>>>>
>>>>     { "execute": "query-accels" }
>>>>     {
>>>>         "return": [
>>>>             {
>>>>                 "name": "qtest"
>>>>             },
>>>>             {
>>>>                 "name": "kvm"
>>>>             }
>>>>         ]
>>>>     }
>>>>
>>>> Note that we can't make the enum values or union branches conditional
>>>> because of target-specific poisoning of accelerator definitions.
>>>
>>> Let me try to complete this argument;
>>>
>>>   If we did, enum Accelerator could only be used in target-specific
>>>   code.  But we want to use it in generic code, too.
>>>
>>> Which generic code exactly?
>>
>>
>> cpu.c:133:#ifdef CONFIG_TCG
>> hmp-commands-info.hx:271:#if defined(CONFIG_TCG)
>> monitor/misc.c:324:#ifdef CONFIG_TCG
>> softmmu/physmem.c:28:#ifdef CONFIG_TCG
>>
>> and more importantly:
>>
>> include/exec/cpu-all.h:430:#ifdef CONFIG_TCG
>> include/exec/cpu-defs.h:77:#if !defined(CONFIG_USER_ONLY) &&
>> defined(CONFIG_TCG)
>> include/exec/exec-all.h:25:#ifdef CONFIG_TCG
>> include/sysemu/cpu-timers.h:27:#ifdef CONFIG_TCG
>>
>> Thomas might provide more cases, IIRC he audited this recently.
> 
> No need, I'm interested in examples, not a complete list.
> 
> Please amend the commit message:
> 
>     Note that we can't make the enum values or union branches conditional
>     because of target-specific poisoning of accelerator definitions.
>     If we did, enum Accelerator could only be used in target-specific
>     code.  But we want to also use it in generic code, such as ...
> 
> with ... replaced by one or more references to relevant code.
> 
> If we expect readers of the code to later wonder why we're not using
> QAPI conditionals, then we should add a comment to the QAPI schema,
> too.  Not a demand, since I'm not sure what to expect.

OK, will do in v8.
