Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6126404ejc;
        Tue, 28 Feb 2023 12:05:24 -0800 (PST)
X-Google-Smtp-Source: AK7set/NnolqnenRvRIdW3/5FvPEzN0jy+S0BJaxOovziYi2qvxGB9OiUMSCfg75huxTUmmKRP35
X-Received: by 2002:ad4:5c46:0:b0:56e:c1f5:137d with SMTP id a6-20020ad45c46000000b0056ec1f5137dmr8618422qva.29.1677614724354;
        Tue, 28 Feb 2023 12:05:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677614724; cv=none;
        d=google.com; s=arc-20160816;
        b=l3yRS6kkeFyrJFqapb4eUppl4Sxq7Lv2QeLAnN4w0CtRCEdenKFzj5U/gzlQaMyP0C
         WwMMQAvugTuCDEFIZ0MvxFbbCUjeQuB694RISFFe7Lh/+AyEMe7GXTp9n2gIDHYIaTki
         82E+H358yd3Y6FZ68OqWFzAuOtGPupWwnwJFhRTauNSfYNxEsvJ07O0DecRBWuGQGCOq
         Nt9foEBI02Ve8D+hqHHs125pO1kyY+Bo4dlhZ6oFGws14l6uwk5lZBbWIv51ZcBx2UED
         tPap+wpYAhbE2BVC74G6YHiWf5E6WORaF+U2cEX2SRTxa7IQvs18e5Qj4HVn1P+4x7iP
         WPnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:subject:from
         :references:cc:to:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=nQd+QhpwRnF3wyVrQuuVP52v3cZ2QpqTThkyv4Fl8ik=;
        b=lB8gxV7PQrZfCnPtEqOkUYhl3wTkrIW5IdGdsOE3wMLL75OxvQHQ63lCg8VtUMR09y
         JP+KbEFE+jJEzY+EWfI10JOPW49VuNfnNuIYAcChYDING1j1uGOsl/PHD4Z/TCqfT6Ty
         gPAW4aBSLlTdpAb4NBU0EdiugQP/AN0FM3cXoO1Bl+t5WRE+gfNnqKbNskxSqbXmYD/X
         Wh9xTm6V6zh5YtdgtVvyCpMrPdj/jE4MMRp2ib0ogsPsj7O24TDgvIm+wH/twK4ETOJQ
         DaPxYW+BcsfaVOzdKHsAkRxURmK6d2s8+yk//sKamG5GSxhAkqQLSimXxF2Kx3KnDYar
         npnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iujQtoOg;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id m19-20020a0cf193000000b00571f474a2desi9726604qvl.349.2023.02.28.12.05.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 12:05:24 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iujQtoOg;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677614723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nQd+QhpwRnF3wyVrQuuVP52v3cZ2QpqTThkyv4Fl8ik=;
	b=iujQtoOg/vphkJxwewKlF6Iu4LmW82xRr4skgeoBWVvqibnVw2LxCEcsyJqym3cbUYDMl4
	u8SimHyaGZMAoJgevG8TW5QZZhdzJ90kAfQVpIasgt56o6HeYFF0ndRCGGkxhXdJt0QOAc
	KB0spX596PlgiCpQ1Lj0wYs3hQw/4n0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-115-NqPPJrl6MBuY8DZHxZR-Tw-1; Tue, 28 Feb 2023 15:05:20 -0500
X-MC-Unique: NqPPJrl6MBuY8DZHxZR-Tw-1
Received: by mail-wm1-f71.google.com with SMTP id az12-20020a05600c600c00b003e8910ec2fdso4011890wmb.6
        for <alex.bennee@linaro.org>; Tue, 28 Feb 2023 12:05:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nQd+QhpwRnF3wyVrQuuVP52v3cZ2QpqTThkyv4Fl8ik=;
        b=wcIP82bZCLsqQr1qIFVUOfGf/EAfS8xEO2UasMUc8HDIAczQLQ7OOVB4Xq5agkgA8A
         91lthj4WQTdoS263GCbhJ4olAklaZjWK0PAc7yvXU8P1YFDYMqrLCbJ4bR7egylH8e+F
         aoSJ9BgmfXSKH4pNnyUW20j/tcAsBaIOMzgcvUx/ZiQtvGqpQECMwuP32lT2t5n5paHg
         9kHzhdtb5PjMs5YQQmasca3dQwc8kmLc3hHIpRlY4GutS/UPOjuOh9224VV9BjkjHrSI
         fGa/lBNtIngI7O67HFkq5HFPnKKxGCrl/JCs4ijhkqYaYXKkR4naNFmthslNJM60S4Cg
         Q3KA==
X-Gm-Message-State: AO0yUKV3j8jFAMkqKSU070sQ1UbmA9LlcW3qgMuyM5VrfCOv3y2yFz4p
	ve94OAB58BDPYsM2JvMLTyAFthCKs86dfY9ebvlqAVzaNatT2zEXCIe7vN1dmIaht/3AJG5QLw6
	xNmPi3GRLMryfVP9g
X-Received: by 2002:adf:e945:0:b0:2c7:17a0:c6b5 with SMTP id m5-20020adfe945000000b002c717a0c6b5mr2892265wrn.34.1677614719636;
        Tue, 28 Feb 2023 12:05:19 -0800 (PST)
X-Received: by 2002:adf:e945:0:b0:2c7:17a0:c6b5 with SMTP id m5-20020adfe945000000b002c717a0c6b5mr2892258wrn.34.1677614719335;
        Tue, 28 Feb 2023 12:05:19 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.8.100] (tmo-112-221.customers.d1-online.com. [80.187.112.221])
        by smtp.gmail.com with ESMTPSA id c16-20020a05600c0ad000b003e214803343sm16622509wmr.46.2023.02.28.12.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 12:05:18 -0800 (PST)
Message-ID: <99a83e65-273a-ea1b-e7d9-bbdd8ca32145@redhat.com>
Date: Tue, 28 Feb 2023 21:05:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <Y/z4rwv09Ckhbtfp@redhat.com>
 <001bedba-b12f-4dd8-0866-7ccb9ce877d0@redhat.com>
 <Y/3C+jC3Lk5MJxfu@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/2] Deprecate support for 32-bit x86 and arm hosts
In-Reply-To: <Y/3C+jC3Lk5MJxfu@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: UL+y5Ya0vJoB

On 28/02/2023 10.01, Daniel P. Berrangé wrote:
> On Tue, Feb 28, 2023 at 08:39:49AM +0100, Thomas Huth wrote:
>> On 27/02/2023 19.38, Daniel P. Berrangé wrote:
>>> On Mon, Feb 27, 2023 at 12:10:48PM +0100, Thomas Huth wrote:
>>>> We're struggling quite badly with our CI minutes on the shared
>>>> gitlab runners, so we urgently need to think of ways to cut down
>>>> our supported build and target environments. qemu-system-i386 and
>>>> qemu-system-arm are not really required anymore, since nobody uses
>>>> KVM on the corresponding systems for production anymore, and the
>>>> -x86_64 and -arch64 variants are a proper superset of those binaries.
>>>> So it's time to deprecate them and the corresponding 32-bit host
>>>> environments now.
>>>>
>>>> This is a follow-up patch series from the previous discussion here:
>>>>
>>>>    https://lore.kernel.org/qemu-devel/20230130114428.1297295-1-thuth@redhat.com/
>>>>
>>>> where people still mentioned that there is still interest in certain
>>>> support for 32-bit host hardware. But as far as I could see, there is
>>>> no real need for 32-bit host support for system emulation on x86 and
>>>> arm anymore, so it should be fine if we drop these host environments
>>>> now (these are also the two architectures that contribute the most to
>>>> the long test times in our CI, so we would benefit a lot by dropping
>>>> those).
>>>
>>> Your description here is a little ambiguous about what's being
>>> proposed. When you say dropping 32-bit host support do you mean
>>> just for the system emulator binaries, or for QEMU entirely ?
>>
>> Just for system emulation. Some people said that user emulation still might
>> be useful for some 32-bit environments.
>>
>>> And when the deprecation period is passed, are you proposing
>>> to actively prevent 32-bit builds, or merely stopping CI testing
>>> and leave 32-bit builds still working if people want them ?
>>
>> CI is the main pain point, so that's the most important thing. So whether we
>> throw a warning or a hard error while configuring the build, I don't care
>> too much.
> 
> If we're merely wanting to drop CI support, we can do that any time and
> deprecation is not required/expected.  We should only be using deprecation
> where we're explicitly intending that the code will cease to work.

Well, without CI, I assume that the code will bitrot quite fast (considering 
that there are continuous improvements to TCG, for example). And who's then 
still volunteering to fix bugs that have crept in months ago, for a host 
architecture that nobody really uses anymore?
Clearly, 32-bit x86 host is pretty much dead nowadays, especially for 
programs like QEMU that need beefy host hardware. Why do we still waste our 
time with this?

  Thomas
