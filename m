Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp57236lfk;
        Mon, 8 Nov 2021 01:49:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyACG2s+aF/nM1OQDLP+h9EjgnorCp48i9TiPQCQ4PxykEEucJfniRGoQWI8qvXww8tmLUt
X-Received: by 2002:a17:907:72d4:: with SMTP id du20mr27317231ejc.419.1636364998109;
        Mon, 08 Nov 2021 01:49:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636364998; cv=none;
        d=google.com; s=arc-20160816;
        b=oBizKIHdsHdZt6AStmlPdARxAKWDEfcD/KLk3vP4vJgM+wr9eDrwQJHpixp9d27KrP
         E5zWb6Nzb6fjC63d2mzv45G/ahWIHfCypr+y9+Wa1hADcna1N0u+T6y4W04Qw57iBzuR
         gq+VUhxyThimgXSDHbNZcqBTa27AFQ6JEWvfnwtr/i85HoKHkdAbrnj33sG44vWD4mUM
         5bAJ6TMNiwtuxr9TTK0Njrq2PeC6QQ40WfuelrU2r7bBQk3yjY2xG2c78vmHh6k9NF6+
         ELKzdAY13Hj8Pf6KfiD30v+0CelySsTZSl5IOOOV03pwq2TEqRzysi/I4pQjkP9oB1Ox
         EbOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=r5H4heBn42+wJmaEq4ggakEYhlmxRR9i0VEeqLLwjak=;
        b=ks/iLKHmnDOinu1RkkxMiww+EYLUtx9v60n9ept3mPQb+JdStVaL/8nWdG4NJoDPWM
         q9CjrxYfOpqpMhFSlV5zvUbA/SYlav9wC05J2tV9PbSpi1LQuAoutyr5mVL504bgb1ET
         sjt/0cdPAwUGoc9zNm3vEDX5aPulsHWGhlvOJqQEUAsmhOHRYr5QnFN2yaoDjNrtIfqI
         8tmFxXaWgxied2aQ0bjQmicTTuHJyXpu58ERJ2kItLzOgQ9x336p+5KkozjlX2a68AnM
         wzLw5jzTDOAzzDVjPgKAvBDP1AipKTJXZJEV6QUihQnSm3OylcDyKinRvLlbRkvfhIDk
         7J5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WeRnHjC0;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id sc33si32917370ejc.409.2021.11.08.01.49.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Nov 2021 01:49:58 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WeRnHjC0;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636364996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r5H4heBn42+wJmaEq4ggakEYhlmxRR9i0VEeqLLwjak=;
	b=WeRnHjC0+QmC6MX+oaBeUCElp7kjQjz9Md0fxuuZa2Sz+rfGYQEBFN3mogHsKFQC7nT36X
	Elt4HcLxMX5Mt7C6Qq4wlH62neQ8Y9cAngoNJ8ft+g/Rjq283zgvyrZD651/QkzCOcoTyy
	+UoXybK+IT5XoXnSq4IIElR3DTD6ugQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-wqXN56OUNJSd7cpO-3vfuw-1; Mon, 08 Nov 2021 04:49:54 -0500
X-MC-Unique: wqXN56OUNJSd7cpO-3vfuw-1
Received: by mail-wm1-f70.google.com with SMTP id l4-20020a05600c1d0400b00332f47a0fa3so5540865wms.8
        for <alex.bennee@linaro.org>; Mon, 08 Nov 2021 01:49:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=r5H4heBn42+wJmaEq4ggakEYhlmxRR9i0VEeqLLwjak=;
        b=oa3UG2/EfMtDwBEsUwvz8kWWJF0JyMWnr0EImDU0cKpU76r0NEYwsfFQDYJxZ+LqQw
         TgvxmiWK4fQc6i5iIikLX2zoa7CrKzAyUS57VIFTN+P2pjR58itjrVwwc6dg2jRTZEEV
         bk7Yys5dfODHLoSZiHiOZ0Rkx0efs04HqkMnbbuX1SX9DYYIgW3wOMB8cCpAg5MMg+7x
         jGWfGmyuRX84yu/3vI/OBT9L+dWfFSinnE8XieLbSvLyR0tOayHs3XOVlYEVzRWqu2yz
         6YDjCEJi+vj0RQHalo+X7daWTqyZQ8TpDqPRIAcZWzwgYISh40eeXw8RHu5LVPAJ8ZwN
         QDDQ==
X-Gm-Message-State: AOAM532P12/p/UEhcztLowN1rlPjTGicEh5itlYq+yIqrGfZ7aWeW1n+
	81jdU0RYkRr2wwOoYYz2u+VXEW4F1hgI4/8wm8p4FoOUB7fWgim45AgLrA3SEh+O6mv9IsT9v4q
	EgFsf/QYbXFboAZj8
X-Received: by 2002:a05:600c:430c:: with SMTP id p12mr52934275wme.127.1636364993414;
        Mon, 08 Nov 2021 01:49:53 -0800 (PST)
X-Received: by 2002:a05:600c:430c:: with SMTP id p12mr52934251wme.127.1636364993220;
        Mon, 08 Nov 2021 01:49:53 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
        by smtp.gmail.com with ESMTPSA id f8sm14641994wmf.2.2021.11.08.01.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 01:49:52 -0800 (PST)
Message-ID: <3aae05e7-823e-2761-0442-7fd92f3931c5@redhat.com>
Date: Mon, 8 Nov 2021 10:49:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/2] tests/acceptance: introduce new check-avocado
 tartget
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Cc: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, libvir-list@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20211105155354.154864-1-willianr@redhat.com>
 <20211105155354.154864-2-willianr@redhat.com>
 <e7d8e96b-cfca-c41f-257c-a70cb899ca9a@redhat.com>
 <YYjsvY3W27a1jUCD@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YYjsvY3W27a1jUCD@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: PLv89Cjn5w20

On 11/8/21 10:24, Daniel P. Berrangé wrote:
> On Mon, Nov 08, 2021 at 08:59:51AM +0100, Thomas Huth wrote:
>> On 05/11/2021 16.53, Willian Rampazzo wrote:
>>> This introduces a new `make` target, `check-avocado`, and adds a
>>> deprecation message about the `check-acceptance` target. This is
>>> a preparation for renaming the `tests/acceptance` folder to
>>>   `tests/avocado`.
>>>
>>> The plan is to remove the call to the `check-avocado` target one
>>> or two months after the release and leave the warning to force
>>> people to move to the new `check-avocado` target.
>>>
>>> Later, the `check-acceptance` target can be removed. The intent
>>> is to avoid a direct impact during the current soft freeze.
>>>
>>> Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
>>> ---
>>>   docs/about/deprecated.rst | 13 +++++++++++++
>>>   tests/Makefile.include    | 17 ++++++++++++-----
>>>   2 files changed, 25 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>>> index 56f9ad15ab..7bf8da8325 100644
>>> --- a/docs/about/deprecated.rst
>>> +++ b/docs/about/deprecated.rst
>>> @@ -410,3 +410,16 @@ nanoMIPS ISA
>>>   The ``nanoMIPS`` ISA has never been upstreamed to any compiler toolchain.
>>>   As it is hard to generate binaries for it, declare it deprecated.
>>> +
>>> +Testing
>>> +-------
>>> +
>>> +Renaming of the acceptance folder to avocado
>>> +''''''''''''''''''''''''''''''''''''''''''''
>>> +
>>> +The ``tests/acceptance`` folder was never used to store acceptance tests
>>> +in terms of software engineering. This naming can confuse developers
>>> +adding tests using the Avocado Framework to this folder. The folder
>>> +name change to ``tests/avocado`` also changed the ``make`` target from
>>> +``check-acceptance`` to ``check-avocado``. In this case, the use of the
>>> +``check-acceptance`` target is deprecated.
>>
>> Not sure whether we need  to document this in deprecated.rst, too, since
>> we're normally only listing the things here that affect the users of the
>> qemu binaries, not the people who want to recompile and run the tests...
>> OTOH, I don't mind too much either if we list it here... Anybody else got an
>> opinion on this?
> 
> Deprecations are only things for user facing changes in the apps.

OK.

> For build system changes we don't bother with any deprecation cycle.
> Just make the change immediately and document it in the release notes.

Understood.

Willian, do you mind updating the release notes?
https://wiki.qemu.org/ChangeLog/6.2#Testing_and_CI
