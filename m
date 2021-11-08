Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp5622391lfv;
        Mon, 8 Nov 2021 00:13:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxoGweKS5E3KJGDW0A/oKY30R6qSpWMU4eJJnQm5KPPgK5eXIJSb+hW9OXgV4wRLO9hUl8G
X-Received: by 2002:a05:6602:2e86:: with SMTP id m6mr6653483iow.55.1636359214667;
        Mon, 08 Nov 2021 00:13:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636359214; cv=none;
        d=google.com; s=arc-20160816;
        b=NoRRvenPPwKA1EgSqAOEZLQkKH+2l4sAawxjYzaHv4r5OuzQQf3uBjzY/v33neFdEw
         UFrpvgVdD2kuDpZ+ci4OReusVlGo+xHbqwgv+EFrdLyBL+UrrlhdczwI09ZaM0zQBcJs
         RXYdFCTPnx+KA49mUtL4fkXn4sxStu+QdzGbuyC10ZNFig6RGzmwdsntDVGp0N+cVg3u
         e4Eux60dKN4Mxj0mbcJUwlNfxR144w7ekRmmvmvy+AjdrDsiyJy/7Y4EoGPjtqB3D4+3
         UzEHANrJRNXcObxQEOe2WHGbRw/wxNqTU2rKRGvrBc/P8bhYSKzNxoBP3VhV/8ctE+n7
         pRPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=CCj/GzgBFoSers8GP+4nWJZs5q/Soocjun4t1mqTh5c=;
        b=oAlEpn51396M1/J0E/tqZN67x15bJt3Y3mz65IeJ3L+Q/1GjhlcFEcUhwOcxxEpjGz
         oYEbj6UrT+HaGmPl0hEtvTkd4cLy4bMRL1H32LKpVUH2Q7DfdLNyP5bSEhfc3xEfpeqA
         zXjRcSvVFDVzDpsnWqeDzUZRDIm/4s5xJmu9y3PABP+WlQp/LLpZ6B3BfzL7eCrq/Jqu
         oTsnvBm8z34drf3Dby2E8beC6dPyMBD5fJEk5jTGu+QVGC5RXyN5OmJ0sz2XbQRkFq9V
         2mAsP9sIcgXCd0MadE+Arre33sjHchUNXekQfNVAtq0pkCGIXMDuGgcFbLcXsR/ZTMZP
         FX9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xp8BmZfB;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id z6si24929184ilb.156.2021.11.08.00.13.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Nov 2021 00:13:34 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xp8BmZfB;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636359214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CCj/GzgBFoSers8GP+4nWJZs5q/Soocjun4t1mqTh5c=;
	b=Xp8BmZfBPoBQurDqPnRcb8ZtZ6/jHWBG6/5qke3GhsCz9ffGikCsETwUfClFjzteGiBFNZ
	lCQLT6YxXk8GXVVwGa16iNhoP1ksran7f5NmDRZIaeARSIA4wJywEeZqyfKCWeSapAHe4v
	MhzTul6Hu5fDCUFpqVfCvwM6jpf6xKs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-JEWaloa9PwSDi_u48jn97w-1; Mon, 08 Nov 2021 03:13:30 -0500
X-MC-Unique: JEWaloa9PwSDi_u48jn97w-1
Received: by mail-wm1-f72.google.com with SMTP id r6-20020a1c4406000000b0033119c22fdbso5883712wma.4
        for <alex.bennee@linaro.org>; Mon, 08 Nov 2021 00:13:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CCj/GzgBFoSers8GP+4nWJZs5q/Soocjun4t1mqTh5c=;
        b=mr+mUxw5mMI0HEgXCvbZXusUmaQYyA6musax9ET/ws+VSSONCYzTu+saxRDfOkIfyn
         dXI7uRwckt/GOQnx0oGrEIAW86bSw1m8lFqdyiQQhAE8jx2qZjbRnjYrAKdLWDXaJqpy
         bS3TtYxhGVjk942QQL+IpSsLdxXs1wiqGuI9rl8xK79PRMr7LO1XcPmsoGFKPbtY7tsz
         EpKSgrOezCZhRGt5O+An1zAfxK1wNJUvyNyMjy+gJNjmZm9wyhgUr0D53BcQNSMbwBCs
         IN6F43ogo1VQCdFzzmHpz7NYvdaMTn+kUV1BR6UUFtCe+u1vu2pbNN3WZSJTb02NAVxG
         EcfQ==
X-Gm-Message-State: AOAM533ukbNcQuvjTWVVWIj5xOj6FK3wMXE4mr9bygmF5BOiKa+DFP7G
	mz8GQ28lOBRrBEpeocw/G4ohzTewVO22CjNwZCwJlf+RwGGMY1UP8rVCPNGYo2I76bgY7Pa3u8e
	Zcmy3wgW52ahdrRtt
X-Received: by 2002:a05:600c:1c87:: with SMTP id k7mr51359135wms.103.1636359209601;
        Mon, 08 Nov 2021 00:13:29 -0800 (PST)
X-Received: by 2002:a05:600c:1c87:: with SMTP id k7mr51359113wms.103.1636359209373;
        Mon, 08 Nov 2021 00:13:29 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
        by smtp.gmail.com with ESMTPSA id l26sm15417929wms.15.2021.11.08.00.13.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 00:13:28 -0800 (PST)
Message-ID: <929c590e-bb67-105e-2d18-78d7638b329c@redhat.com>
Date: Mon, 8 Nov 2021 09:13:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/2] tests/acceptance: introduce new check-avocado
 tartget
To: Thomas Huth <thuth@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 qemu-devel@nongnu.org
Cc: Michael Rolnik <mrolnik@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, libvir-list@redhat.com
References: <20211105155354.154864-1-willianr@redhat.com>
 <20211105155354.154864-2-willianr@redhat.com>
 <e7d8e96b-cfca-c41f-257c-a70cb899ca9a@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <e7d8e96b-cfca-c41f-257c-a70cb899ca9a@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: h83ZhcAqRqs2

On 11/8/21 08:59, Thomas Huth wrote:
> On 05/11/2021 16.53, Willian Rampazzo wrote:
>> This introduces a new `make` target, `check-avocado`, and adds a
>> deprecation message about the `check-acceptance` target. This is
>> a preparation for renaming the `tests/acceptance` folder to
>>   `tests/avocado`.
>>
>> The plan is to remove the call to the `check-avocado` target one
>> or two months after the release and leave the warning to force
>> people to move to the new `check-avocado` target.
>>
>> Later, the `check-acceptance` target can be removed. The intent
>> is to avoid a direct impact during the current soft freeze.
>>
>> Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
>> ---
>>   docs/about/deprecated.rst | 13 +++++++++++++
>>   tests/Makefile.include    | 17 ++++++++++++-----
>>   2 files changed, 25 insertions(+), 5 deletions(-)
>>
>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>> index 56f9ad15ab..7bf8da8325 100644
>> --- a/docs/about/deprecated.rst
>> +++ b/docs/about/deprecated.rst
>> @@ -410,3 +410,16 @@ nanoMIPS ISA
>>     The ``nanoMIPS`` ISA has never been upstreamed to any compiler
>> toolchain.
>>   As it is hard to generate binaries for it, declare it deprecated.
>> +
>> +Testing
>> +-------
>> +
>> +Renaming of the acceptance folder to avocado
>> +''''''''''''''''''''''''''''''''''''''''''''
>> +
>> +The ``tests/acceptance`` folder was never used to store acceptance tests
>> +in terms of software engineering. This naming can confuse developers
>> +adding tests using the Avocado Framework to this folder. The folder
>> +name change to ``tests/avocado`` also changed the ``make`` target from
>> +``check-acceptance`` to ``check-avocado``. In this case, the use of the
>> +``check-acceptance`` target is deprecated.
> 
> Not sure whether we need  to document this in deprecated.rst, too, since
> we're normally only listing the things here that affect the users of the
> qemu binaries, not the people who want to recompile and run the tests...
> OTOH, I don't mind too much either if we list it here... Anybody else
> got an opinion on this?

Hmm OK my bad, I asked Willian to add that without noticing this file
is for "only things that affect the users".

Willian, if you agree with Thomas, I can remove this change from your
patch.
