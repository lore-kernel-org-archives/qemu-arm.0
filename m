Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3948935ejc;
        Wed, 11 Jan 2023 04:22:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs2E+5EOqJDeeNRILYuzfChVUfa6gbWz1w4WRbImIM3u3qk9nT7ergjCj67SSKKKQFSDISO
X-Received: by 2002:a05:6214:350d:b0:533:bcd4:3509 with SMTP id nk13-20020a056214350d00b00533bcd43509mr8193853qvb.7.1673439764838;
        Wed, 11 Jan 2023 04:22:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673439764; cv=none;
        d=google.com; s=arc-20160816;
        b=APkspLucoPJS5bb5EsL6QGDmkPXHzB/+U3vnmf+oWCrPAHnkvITEt0blTCfpBYcodg
         TccM2phf0P9vhQ2ZoP/m+Nqd998N7SPcI5Jd3KVP0Iki89Q7CSqtc16hL5wb8xjT2ThE
         AIp5+Hqg3OND2CKBU0Xsu/eMrpdnTqCEYJEmuO5Dtr6UmdYVTOGovZd7eF5sJfm1nW0x
         jtzir4HCDJYDAlzPl4Ggk+91sGtcR3jN9t1iqsTrs/FRIv3/6yFbNz2vOpled9wP6h/K
         6IEzNV3qdeHvi6haA5rX94Aqg4voEJigu6ZjkIlHJNiPjJXhe3PjjDIRms4H+DceWDI4
         bfqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=yEYZiH/Ph6zRFMocgLriJV3qKykFL1ySLUuMpvE1co0=;
        b=ntWWPb1IWXMJ9CVpzsKtl3Qbh/yAEQXZgurtjPRO5mCOrrJlWnwMPEa0gzIpTe7DBB
         2sQZs+Nb26sXRKJRG7dMntIA9zh+05EVYMoRud86os00sz5FRE2WMPzTD4eszIveEP4b
         42PU3xJv0z9F8we4EwTxpLGid8djfFqwxArcu7EeReMqkceBd8bKEG6FLa1R9IG0rBjR
         GGyuq5Getk9x71LH1TYx6IZy5dA5ctshmPHX72c5xEnsB9/9ELMzfvHt96e4rgtcF2lP
         1EQMpb00wh5GObXu4xShKcvI5k+XcLU13o66OYUsyfRZemAo/tlHjjHEJ73eBiuayjIn
         FvbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QRfz3WpW;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id a2-20020ad45c42000000b004c62f35ea86si8536477qva.273.2023.01.11.04.22.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 04:22:44 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QRfz3WpW;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673439764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yEYZiH/Ph6zRFMocgLriJV3qKykFL1ySLUuMpvE1co0=;
	b=QRfz3WpW8ehBzPS0/ql4YMeydnoL4OGMDFh2tXlIa/CWcXnVVcjbY046HYlU/dzAydR6+s
	FDx7o+72gV8EfUTtaiYIBKsTvoKFtqIkIIsxlRIGRh7tEJ4HtpbqI4aNW0BE6oyOQZIZfJ
	BGH6wZCMc3vxGglz833oIC/6UjVa59c=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-546-WQg-CIuUMtKxHz_8TBpNUA-1; Wed, 11 Jan 2023 07:22:41 -0500
X-MC-Unique: WQg-CIuUMtKxHz_8TBpNUA-1
Received: by mail-vs1-f72.google.com with SMTP id 190-20020a6707c7000000b003b134bce1dbso3699580vsh.21
        for <alex.bennee@linaro.org>; Wed, 11 Jan 2023 04:22:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yEYZiH/Ph6zRFMocgLriJV3qKykFL1ySLUuMpvE1co0=;
        b=PsdGaDh+LwztDs3fxqyoSZdJ6UGWUP3B+Q255fbRWjTH/lqvCyqCNhUe0oApUDynTN
         Ki+BN3Ed01EaS5W89UAOoXcCAGF9zvy8WgZv2cZY8YNMHzFlRKY1uU5rYkoTBzH1nhyz
         rQlpkh0D8AspI9qVD3yWprYO3G/1cRtwf2YzRVYOmTS6nXL62ygoioevePY4iAxHteyb
         rCPFrnIEmX6J962hiL8vnB0Wc2syRKKXrCJ9+82qljXSpiRpynbh1WNdvQy0tgsqnDrL
         cLtV7a9SvBtcnuLwPZ2anTYkmHj/Aq4DF3O5pBQMO9hGpRJccrwVAJRot40ddSUxRR6c
         qMkA==
X-Gm-Message-State: AFqh2kqZuU79co5auOaV/0ysSUgK2gRbQ17vh+dPy6od4BS3kYnvO2Ix
	rccx5IlQEk/3M6anH1lQU05RiGspFz4oks0jHO6+IKgaLI2MqhBXVDFRXV8+q7t3fiT1pwa57eS
	iXT3PMYz1hzNprpID
X-Received: by 2002:a67:d902:0:b0:3cb:bbc5:ba60 with SMTP id t2-20020a67d902000000b003cbbbc5ba60mr26218353vsj.5.1673439760824;
        Wed, 11 Jan 2023 04:22:40 -0800 (PST)
X-Received: by 2002:a67:d902:0:b0:3cb:bbc5:ba60 with SMTP id t2-20020a67d902000000b003cbbbc5ba60mr26218338vsj.5.1673439760586;
        Wed, 11 Jan 2023 04:22:40 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-176-91.web.vodafone.de. [109.43.176.91])
        by smtp.gmail.com with ESMTPSA id q5-20020a05620a0d8500b006eee3a09ff3sm8920213qkl.69.2023.01.11.04.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 04:22:39 -0800 (PST)
Message-ID: <dd02aa03-1c97-9a1f-4d06-6f9802ce7644@redhat.com>
Date: Wed, 11 Jan 2023 13:22:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH v2 13/19] tests: do not run test-hmp on all machines
 for ARM KVM-only
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-14-farosas@suse.de>
 <35870ab3-1da6-c222-b708-06ac71a5883c@redhat.com> <87zgaqa6jk.fsf@suse.de>
 <CAFEAcA_x_kTdNt8+5YAjo518Wj_Ej4jZ=0OrCQmutNOjJx=3Gw@mail.gmail.com>
 <87sfgia4uj.fsf@suse.de>
 <CAFEAcA_AaWfwAbCLOC3ELf3c20Cv5jQhWc71Py4ww4kLo2nYeg@mail.gmail.com>
 <9fb63a5d-d839-016d-b0a8-4151b6d6946c@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <9fb63a5d-d839-016d-b0a8-4151b6d6946c@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 4KOrEJcFcMg1

On 11/01/2023 13.08, Claudio Fontana wrote:
> On 1/10/23 15:02, Peter Maydell wrote:
>> On Tue, 10 Jan 2023 at 13:36, Fabiano Rosas <farosas@suse.de> wrote:
>>>
>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>>
>>>> On Tue, 10 Jan 2023 at 13:00, Fabiano Rosas <farosas@suse.de> wrote:
>>>>>
>>>>> Thomas Huth <thuth@redhat.com> writes:
>>>>>
>>>>>> On 09/01/2023 23.42, Fabiano Rosas wrote:
>>>>>>> From: Claudio Fontana <cfontana@suse.de>
>>>>>>>
>>>>>>> on ARM we currently list and build all machines, even when
>>>>>>> building KVM-only, without TCG.
>>>>>>>
>>>>>>> Until we fix this (and we only list and build machines that are
>>>>>>> compatible with KVM), only test specifically using the "virt"
>>>>>>> machine in this case.
>>>>>>
>>>>>> Why don't you fix it immediately? ...
>>>>>
>>>>> My idea was to have in this series the minimum to unbreak the
>>>>> --disable-tcg build and later bring the rest of the changes
>>>>> incrementally.
>>>>
>>>> This test is basically checking "all the machines should
>>>> work". That's an important invariant to maintain, so
>>>> I don't think we should just skip it for Arm targets.
>>>
>>> But what does "all machines" mean in a no-TCG build? The original intent
>>> of the patch was that only 'virt' should be present and therefore the
>>> only one tested.
>>
>> It means "every machine the user can create". If the
>> machine can't run then either we shouldn't compile it
>> in, or else we should be compiling in enough extra stuff
>> to allow it to work.
>>
>> -- PMM
> 
> Hi,
> 
> once upon a time there was a series by Philippe to accomplish that (KConfig) right?

Maybe that one:

  https://lore.kernel.org/qemu-devel/20190903114729.3400-1-philmd@redhat.com/

?

  Thomas

