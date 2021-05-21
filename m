Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1130325lfm;
        Fri, 21 May 2021 05:49:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw97XiAbZYXVuXsLlnxDMAwvXNIFUlzZJ4TWi71eLMDP/gsqPAqagWpxEO5ShT1OAUShbui
X-Received: by 2002:a17:906:2a56:: with SMTP id k22mr10321799eje.551.1621601369926;
        Fri, 21 May 2021 05:49:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621601369; cv=none;
        d=google.com; s=arc-20160816;
        b=kiYRhItqJ+02UBnOW/QAWKioPcVwuBLAm3h9HnanRbQNMzC/n3kYEzl6xv5SC/b6PF
         50+Cl8dgCiW1DfSVfGBtMgF9sYUfGYDnVivM/ECTocAGtq5H0YOEiDhIciOCrF4NFp0k
         dNlj8nDM8bb66afDiHkKkBlR9NyL7UZxGPvIlXyuceXJWICNn4ifk07zjRfJsG7x8UMH
         /n/RmmCXzKaCaS/NpABda9xK0hsVOSeG1QPzHQ/cKfNGi0jW3RqHclEKPybKPHxLhRRF
         X/fZ03aH0lYRf0vxUmnxwzISH91g00NJjA7Z2T+T2lW7lrLd502C47oJUqCb1OO+KiFZ
         d3Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=FEpsemIRGu5oOuQUZUwUiVUxbSGPmrzNuO7HnUiioZE=;
        b=EhumY88twvUa+QVILAw3oZAYSysLApRNrvKW+Q6PvvOORWrUVjEeYsd+wc2Y6Nnrpn
         oqT4maMMom3A0yGxWWcoCSDYUVcClg3YE/nWT3bryNNHPHSJMHN4jhjUzwgE79R0HTe0
         I0EcRavb5vJQtBQUv/zevBUINjyMX1JFzJWfH2jk1b6f6f+q/SMGnhEAbbcgVeFNbxkU
         uZ+ICuBBGJ7Z/wJ0xS3GEarN4kujTdlK635lr3O6KPhDodob/ptAbBv3BtAmy2bqmJRg
         k/c1JCHCCRhBXxG5rh+1d2xPc9NwwRCBpTu6JOQ4rqptOc4Iw2wOhbqHQNvXmqhk2Qbn
         P9fw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="TjjoY/ZV";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id m2si5290985eje.253.2021.05.21.05.49.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 05:49:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="TjjoY/ZV";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621601368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FEpsemIRGu5oOuQUZUwUiVUxbSGPmrzNuO7HnUiioZE=;
	b=TjjoY/ZVjlc0XM6KKFUDvhuvBMgT+YPyKqRm9VCJGDAYpHr6E2wsBTGMnphSiIHVju+lGQ
	wKJI8S4ly46FenJ8VbMFazE5Q8sSMIl/clHKI+P3RNBWJP8wBjBVeGKVIVnfudarPgSzRn
	8BeLbBoj5wQLZiJYM3s6fWOkF1DV6Ag=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-KdS5BMuLMruttJQzbbtuUQ-1; Fri, 21 May 2021 08:49:27 -0400
X-MC-Unique: KdS5BMuLMruttJQzbbtuUQ-1
Received: by mail-wr1-f72.google.com with SMTP id 2-20020adf94020000b0290110481f75ddso9428513wrq.21
        for <alex.bennee@linaro.org>; Fri, 21 May 2021 05:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FEpsemIRGu5oOuQUZUwUiVUxbSGPmrzNuO7HnUiioZE=;
        b=bIaymScEz+ZOzUxh3YswQJro3DChTaHaPlU+x6vP5liPksEcjJSr8Mz1VEH+dgmXZl
         zymyUYFf2Pzpi46V8rjMc4a78vmHzzAqvpSUKZ/kyfKKPvHlkd6pXJ63sFgSObSmc1Fw
         Wqlv3w685XigKWG0ZyiMxgn38rNr3sG9qINm2BsjOwsBVqcVd0Zgd6gjRx5pA518RTO2
         wr86GIe4d6GiXr3ICM6uQzOeTjTo6II4f1ExY+waHQiE6MRA2LFzbv2aRCB5jz93jD+q
         MWij3LTrZrjcQHP8z86uEAwU5OhBjcZgRgq1hcRRJJFyh4dKqpPX4BawyyS+psntptTc
         xYPA==
X-Gm-Message-State: AOAM532P845sjn3wAuGG6UtTkS8m9SQXmECOtFcjYMhOQzFAXpcSyboG
	beoCG5mbB0nsbPAb26YBQMZnEhX1YQn1UNRBqM+J9h+B1Rx2wdiM+ngWhwcseMjKWQgU/4j/8hm
	XJy7Be+JGQPLpizIHl4un+ThzEvER4o+LdSCQgCsSfaiz4rAI/uLPSrMCr7c8225xeg==
X-Received: by 2002:adf:eb82:: with SMTP id t2mr9464100wrn.337.1621601365909;
        Fri, 21 May 2021 05:49:25 -0700 (PDT)
X-Received: by 2002:adf:eb82:: with SMTP id t2mr9464082wrn.337.1621601365750;
        Fri, 21 May 2021 05:49:25 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net. [83.51.215.31])
        by smtp.gmail.com with ESMTPSA id m6sm10672246wml.3.2021.05.21.05.49.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 05:49:25 -0700 (PDT)
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
To: Thomas Huth <thuth@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210520195322.205691-1-willianr@redhat.com>
 <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com>
 <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
 <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
 <82f5ed3f-3047-bfa3-c7b2-d91300f393f8@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0b970add-1804-f841-819d-e77a64d616e8@redhat.com>
Date: Fri, 21 May 2021 14:49:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <82f5ed3f-3047-bfa3-c7b2-d91300f393f8@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: TToUsvWl7zQh

On 5/21/21 2:42 PM, Thomas Huth wrote:
> On 21/05/2021 14.28, Willian Rampazzo wrote:
>> On Fri, May 21, 2021 at 4:16 AM Thomas Huth <thuth@redhat.com> wrote:
> [...]
>>> Alternatively, what about renaming the "acceptance" tests to
>>> "validation"
>>> instead? That word does not have a duplicated definition in the
>>> context of
>>> QEMU yet, so I think it would be less confusing.
>>
>> While at the beginning of your reply, I started thinking if
>> "validation" would cause less confusion for the QEMU project. Although
>> validation testing is a broader concept inside the Verification &
>> Validation process, encompassing unit testing, functional testing,
>> integration testing, system testing, and acceptance testing, it may be
>> an option for the QEMU project.
>>
>> While system testing would be the correct terminology to use, if it
>> causes more confusion, using a less strict terminology, like
>> validation testing, is valid, in my opinion.
> 
> <semi-homorous-friday-bikeshedding>
> Or we could come up with a new, artificial name instead (like "qtests").
> It certainly need a "q" in the name. For example what about:
> 
> - avoqado

+1 for 'make check-avoqado' :)
