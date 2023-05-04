Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp109190ejq;
        Wed, 3 May 2023 23:56:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4ByCX9djC4J2s4Ig5+ZxSVTHiBrm5RjEg0+ChqAxLysdKO5ZwO9AMwQnHRE40o7lhsuu+N
X-Received: by 2002:ac8:5947:0:b0:3f0:a108:8642 with SMTP id 7-20020ac85947000000b003f0a1088642mr3317809qtz.20.1683183385687;
        Wed, 03 May 2023 23:56:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683183385; cv=none;
        d=google.com; s=arc-20160816;
        b=KojGZBoeRvUKQ7RIF2QaTEty16yTGxKXp4WtdpCR9gHQJ7z8ABWwhcH87Pst3+l130
         6Qt8PDkU4VvS6DOLJKPjtBGlJ9GZ1+gwJacFucfIaPd1+GOtjOkoRntaIkWCjV3o66ij
         9Uhd4nzQDCAhD+YwhBreH5eZXX78wc3iB/0melSCo26L7SmdNNsMvIrN1Ixc4KTnrPYt
         ltbw6Oo77pOrbyXLXo+AW8OW/EAvi5OtkvmTkbzPkOE8J2uGUWL14rZLTeLfBK+DjCKR
         DFsmmSTDX6GooNCM1qidOwDynM5hjWc6MtzhI7ajUglWVzECyiwQU8ThDeJr7BMroVpr
         Ndcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=KSEdqS53iXoaCZxhq7JVYfhIWJEheAVKjupkF6jDTGU=;
        b=mFa8t7cFXp8GQn6ADbVuJf6Xfq/jwhdG2CpQSb700tAOk6dmKpI+o74wZ8HbZDuFNs
         TbaJgwj3un8J17Qy46Ce8XSix3VCkXBwCtX6+qxWoD0cgYuTt2oAPAamcxESATL/q3rL
         wghegLHllhmuz4+d80AEPqmD61CjwEWE6mRjpZwgmOLciShMjOs8CCJfkO4fPhB23nOb
         1Roy0uAfo3NMG0pN97sm2h9dKul4rMBgZHJ5y5idH/4IeKBx804swwPSanAH/CiFu1uI
         VfaYr0ZUh+Qz1g7R6inVEdIgDiiVKmq1X/taaCbWRYjhCPN19fAuQ/U+C7G+afABwZhm
         N7og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jMpVeRy2;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id y18-20020a05622a165200b003e4ebdeabcasi19965286qtj.191.2023.05.03.23.56.25
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 23:56:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jMpVeRy2;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683183385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KSEdqS53iXoaCZxhq7JVYfhIWJEheAVKjupkF6jDTGU=;
	b=jMpVeRy2eUNHKftsmqJTJ+JRC9LY4g1NyMpZi5CpQIW3oCJVoeoQRTPwozLYrCtFsDMvy7
	h851/tPz7Jwy8AECLGEmUyhcovMEFfc2s7QFzOsuSjeb0MqnIioAJeYkJ43L5SRe+peSK+
	6I/1UmrGVCxDz0viWbvAIInHm+a7OU4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-6XiWTepFPL6_uWaFkd6kfQ-1; Thu, 04 May 2023 02:56:24 -0400
X-MC-Unique: 6XiWTepFPL6_uWaFkd6kfQ-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-50bd7555c6eso67613a12.1
        for <alex.bennee@linaro.org>; Wed, 03 May 2023 23:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683183383; x=1685775383;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KSEdqS53iXoaCZxhq7JVYfhIWJEheAVKjupkF6jDTGU=;
        b=QVWODi7csFcSjIzsQrP1P5zcUwK/JTbP8vTNId7QVgGyOw/Aa281Ut8n+u+QfTUmym
         zDG6CWXN4KVw8mkl8kKfYvJsBALRLlc0RuISqCefVGKVGLXBzGMTxoUTa86n8EYQDn3q
         usy0hEKto5PRpqpkCV3oaqa+ERM3RD5qIUBVJ7Sxz5I8bMark0HOx7k394PdJRwpWwzd
         a0f6xXWzuUPcMwvN2jEKrv+VDVVrjLKAuazX6TCSFcm5UbhY11MiK4h0M+9He/FOWvKO
         ysdtGKlicKq4efyjrthInB/b4Xsx7ZSPVkHxU3qjpDkOFHaWxGpvo/ppxwlyFV1BggP/
         vo/g==
X-Gm-Message-State: AC+VfDwE4MJuxHa80K/ik/EwbJ/IWbxyVnWRXD17MzAv4nHl2vFA4WyE
	wimLLSuj/I1tWSvB9zE4YnpcoT0RHXHJZoEmN8k4kkc1tuSIUxU8+1jJDrUkekSKhzogjnpA+ng
	d/Rhz3xHYrL3FfGhv
X-Received: by 2002:a17:907:3e22:b0:94e:c40a:cca9 with SMTP id hp34-20020a1709073e2200b0094ec40acca9mr6169892ejc.35.1683183383106;
        Wed, 03 May 2023 23:56:23 -0700 (PDT)
X-Received: by 2002:a17:907:3e22:b0:94e:c40a:cca9 with SMTP id hp34-20020a1709073e2200b0094ec40acca9mr6169878ejc.35.1683183382781;
        Wed, 03 May 2023 23:56:22 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.3] (ip-109-43-179-91.web.vodafone.de. [109.43.179.91])
        by smtp.gmail.com with ESMTPSA id re21-20020a170906d8d500b0094ea48e9052sm18269263ejb.32.2023.05.03.23.56.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 23:56:22 -0700 (PDT)
Message-ID: <6ed176f9-be38-b4ea-ac90-906cc62c24c4@redhat.com>
Date: Thu, 4 May 2023 08:56:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 05/22] hw/arm: Select VIRTIO_NET for virt machine
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Helge Deller <deller@gmx.de>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Andrew Jeffery
 <andrew@aj.id.au>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Radoslaw Biernacki
 <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Song Gao <gaosong@loongson.cn>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-6-alex.bennee@linaro.org>
 <531a2eab-f0e6-46a5-c021-c82746c1ae38@redhat.com> <87y1m5s9yl.fsf@linaro.org>
 <5fb214d8-4a54-f896-f23f-fe9e646e4b2d@redhat.com>
 <CAFEAcA-Cfz8CkNeTQodoSitocBmm4ddk25Dq8x=5FiiGvaS34Q@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA-Cfz8CkNeTQodoSitocBmm4ddk25Dq8x=5FiiGvaS34Q@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: aCoRAtlFQIHD

On 03/05/2023 20.32, Peter Maydell wrote:
> On Wed, 3 May 2023 at 18:06, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> On 5/3/23 17:35, Alex Bennée wrote:
>>>> You should select a device only if you cannot even start
>>>> the machine without --nodefaults.
>>>
>>> Which is the case here right? We could skip tests that explicitly
>>> instantiate a device but these are tests failing with default devices
>>> the machine tries to instantiate.
>>
>> I'm sorry, I meant "select" directives are needed if you cannot even
>> start the machine *with* --nodefaults.
>>
>> Devices that are added *without* --nodefaults should use "imply"
>> directives instead, as is already the case.
> 
> Do we really want to build a QEMU that then barfs unless
> you pass -nodefaults, though ? That doesn't seem very useful.
> Something somewhere ought to be saying "if you want the
> virt board then you almost certainly want these". Or
> alternatively we should fall back to "don't create a
> network device we don't have", maybe ?

I think we should do the latter. If you compiled without certain devices 
that are used only in the default mode, the board should not try to 
instantiate such devices (since it is also working fine without them). Just 
my 0.02 €.

  Thomas
