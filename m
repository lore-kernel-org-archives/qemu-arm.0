Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2626800ejq;
        Tue, 9 May 2023 03:53:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ45DKJXC5LZlGfBecJUyOlNIr9qAgsRVsvCHLzC3BHf54xczuRnuFlhZi5KP5y3Ekx9qpLi
X-Received: by 2002:ac8:5f0c:0:b0:3e6:6acd:e03d with SMTP id x12-20020ac85f0c000000b003e66acde03dmr19108270qta.33.1683629595017;
        Tue, 09 May 2023 03:53:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683629595; cv=none;
        d=google.com; s=arc-20160816;
        b=EYcHdzLLMQjfKQ/uHNTbDQCEYUyHuk3H10KW4njFVsznLlFrnysUdzxwOQ7dClmobJ
         D7IWkeV0I2qbJTG/dUxMfrFiKExOySymfmlM8wOCFVaHzsHbMI+LUUS0eqRyK+JHRV3X
         esRlVXKaq3fB0n0nSopn1w+xmQHSMwm07WCSzaslswqknXed0uzW5R/QEyziM5RRKmQH
         KNp85aUncGVdwbLlg52YnQKaANzsw7/YlXuVGVaCfdf0Ri4yx+PlHkAwHtbmDr615H4j
         B+3lONG/yMQhQGoPY1TWFMQ4U/ZamXZ1nSHFuKJJfHNuBNo0ZpFxiK5sOgSKurmUysbF
         iOnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+5lilG6zaImp8647W11W+cB5+tLa4YVBSYeh8tGPN+g=;
        b=Ei9mncqg8NfIRxpYy9q0qYkdgyHUc+21X1qJt4NgfNc71ckTXpSGq4cQn9kDH8BH/i
         r8vZpcoEZnDGIU6l8SdZWN5Fn1NodktHF/YEm6Pe0fsddn2uMJO5XdfCKwJG0vb+5H4S
         A5l3C2WK0rVGTTjAOXcEHL+/rq5R8GDIc+sfgWXaYag5BFHYWAZeMKNrTgLuJxJsvc70
         qXF5yjsqCJFJzjQ4WPSYwKKUo1GesA/KJj9DvtRpwLX0WNgWNiAsWkION112cx/sEbl6
         2kzM3L8dIJgf2LUZuUVHNckYRwjZDCc6m7RZJ8DIPk/3nlvKui/w6MLbxcotKkfIu7XX
         wG+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="EwxSa/dd";
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id j17-20020a05620a001100b0074ac827b113si3785559qki.176.2023.05.09.03.53.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 03:53:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="EwxSa/dd";
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683629594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+5lilG6zaImp8647W11W+cB5+tLa4YVBSYeh8tGPN+g=;
	b=EwxSa/ddiNZuuoSFwxPXFkxbRtWKKB5/nkPpm5zFQ1qJRoMLIIVw4zvTGvKNQa83OMX84C
	rOWsdUnKoc0YTlAM83lhkCeQx/S0KqxxvpYXnqP5xrCHNqc3vuP9Jf7QwA7UQMW/RRkWPf
	uVu3X4ByDcWuTN4zYI9o3YvBpeODhdY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-Ff85Xz_aMdqe3pO5T2182w-1; Tue, 09 May 2023 06:53:13 -0400
X-MC-Unique: Ff85Xz_aMdqe3pO5T2182w-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-50bc88edf7eso5450071a12.2
        for <alex.bennee@linaro.org>; Tue, 09 May 2023 03:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683629591; x=1686221591;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+5lilG6zaImp8647W11W+cB5+tLa4YVBSYeh8tGPN+g=;
        b=GOFw52xUJHXigFpB8/l1Rwb8pwpr/HnSDkpIXZGtR84dETgrmvoDs9/XrOekEXlivs
         7BWfKFo/jjqhC7cdtcSBIzZdKjsLhWR0k9hrUzUfLEeuP1dc2TqvaWItazWT0jgAD7RT
         9r2ZLW721pUMjclB4cAC0DlqnS0hYcMDbckYBlFXYv2OlczjXUMuGDtbnonRxBMNhTpN
         Bk+vIqBoNx/YSVRMI/SZm3EIJXAprNJhIC851uJus2YLYfn27azb8fbvCJ3eh3zaaJq0
         GdGPRl4ehbUlpdAmp+9mFq5yCVi4TTGaCP+rMt7HqJ8yHFLWocSg6IF16cvz1PLTVh12
         HDhA==
X-Gm-Message-State: AC+VfDx6sVIyq2NY1cY218ogpstbWJ+qqsvLoFsOoph0fjH6gTU/yta7
	m7OuGfQyWq5562KG4MGFFBFhXgl5QNGIVye3iOVdIhzcACDDWAaoXEykLeWCOFg54NN/kOPeGTg
	NNHBP+Hx99eAfcdnJ0zjYdX4z
X-Received: by 2002:a17:907:70d:b0:94b:d57e:9d4b with SMTP id xb13-20020a170907070d00b0094bd57e9d4bmr10854167ejb.2.1683629591546;
        Tue, 09 May 2023 03:53:11 -0700 (PDT)
X-Received: by 2002:a17:907:70d:b0:94b:d57e:9d4b with SMTP id xb13-20020a170907070d00b0094bd57e9d4bmr10854143ejb.2.1683629591229;
        Tue, 09 May 2023 03:53:11 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id hb38-20020a170907162600b009661cf921b4sm1132839ejc.202.2023.05.09.03.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 03:53:10 -0700 (PDT)
Message-ID: <70da6b28-d731-7e3b-b5a6-7d9983389d57@redhat.com>
Date: Tue, 9 May 2023 12:53:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 05/22] hw/arm: Select VIRTIO_NET for virt machine
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Fabiano Rosas <farosas@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel <qemu-devel@nongnu.org>,
 Laurent Vivier <lvivier@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Helge Deller <deller@gmx.de>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Andrew Jeffery
 <andrew@aj.id.au>, qemu-s390x <qemu-s390x@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Radoslaw Biernacki
 <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Song Gao <gaosong@loongson.cn>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-6-alex.bennee@linaro.org>
 <531a2eab-f0e6-46a5-c021-c82746c1ae38@redhat.com> <87y1m5s9yl.fsf@linaro.org>
 <5fb214d8-4a54-f896-f23f-fe9e646e4b2d@redhat.com>
 <CAFEAcA-Cfz8CkNeTQodoSitocBmm4ddk25Dq8x=5FiiGvaS34Q@mail.gmail.com>
 <e7185f74-f041-05b1-0f76-bab6d724e796@redhat.com> <878re4cl1u.fsf@suse.de>
 <CABgObfYYFfGk2X6M5MxbEbVqCYOp1Km53xkTNrfHwkK=aZOpyw@mail.gmail.com>
 <CAFEAcA91kfdgP3GD8OzgpePX6yXxsLZgARfsNhjY8WyEtKwUuA@mail.gmail.com>
 <c4545a92-8e37-a916-9f1e-ef537dcb1e06@redhat.com>
 <CAFEAcA9h2JKPeMinDFqsJ_5wN1rtAfr6YSSbfyf6JK9ohdxXmA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA9h2JKPeMinDFqsJ_5wN1rtAfr6YSSbfyf6JK9ohdxXmA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: MG/SoIysPctn

On 5/9/23 12:00, Peter Maydell wrote:
> On Tue, 9 May 2023 at 10:42, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> On 5/9/23 11:27, Peter Maydell wrote:
>>> On Mon, 8 May 2023 at 23:24, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>>> --without-default-devices is not about choosing to not build
>>>> some devices; it is about making non-selected devices opt-in
>>>> rather than opt-out.
>>>
>>> Hmm, so it's basically "the person doing the configuration needs
>>> to know what they're doing, the Kconfig system will give them
>>> no hints about what devices might or might not be needed to
>>> make machine type M functional" ?
>>
>> It depends on what you mean by functional.  I would say you do get what
>> is needed to have a functional machine, but not what is needed to have a
>> useful machine.
> 
> If you need to pass '-nodefaults' to get the thing to start up at
> all, that seems to be stretching the definition of "functional"
> to me.

Then, an accurate description that uses "functional" in that sense could 
be as follows:

The Kconfig system will include any devices and subsystems that are 
mandatory for a given machine type, and will flag any configuration 
conflicts. However, the person doing the configuration still needs to 
know which devices are needed (on top of the mandatory ones) to obtain a 
functional guest, and Kconfig will not provide any hints in this respect.

Paolo
