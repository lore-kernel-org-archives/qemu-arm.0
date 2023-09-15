Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp1152849ejb;
        Fri, 15 Sep 2023 04:24:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdAGVI+lcOI1GXFo0YBhhc3t0yYanP33TU6lZBmXaNHAniEUnPeq5pgEVn/sW43ZHwzceV
X-Received: by 2002:a05:620a:4011:b0:773:a83f:4170 with SMTP id h17-20020a05620a401100b00773a83f4170mr1533207qko.63.1694777056240;
        Fri, 15 Sep 2023 04:24:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694777056; cv=none;
        d=google.com; s=arc-20160816;
        b=ywQmyqinSI1Dd2zILJD1DKDBpY0AzRlm3FR9LAcOr0WSisxD3AqF/Q/dzk4ewZjYx+
         pdgyggIjszXIncbLHHlteWxIS/KrT9J5nG5oQ4wcIRjPw4GZjO4p1MPx0TqRfh/bzFDa
         cplzXnbb9MRmKFDirXUTkD87g3OLFPf1EeLkqNX9y9SdPk2u18ovkdMZYdjvTaoPIWE8
         bWKEdoUMr2OnCcwLSx15PI/to3hyNPK0HMUV4MKHEwpIvUDyUmzYHw+q2P+WZq6sid68
         Q9fuv2pyQVvlEygMEiXolsycBIli3XM5ugwFVrszHLBWXcQxFrKT1YD/pieUMDcDspG3
         ua0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=TBc/uVBazeKY4iJBuo/xzGp3L+IEGUgDpqNfs+vuw50=;
        fh=hgHabdvU0WGCcTaHDtB0H3ZJu92+INIVQuWz8DQnCzY=;
        b=qvstEZ3hJty7ZaJEyyPhztXehDoj1DkVTnEXYKYRox+De+RdjI2mmmjH6G4GiCNC4Q
         ad9AluF+Bw2b3qHoUAeKDGDW5XrI1lUnZSkuhKevKR1x9/p5gpqbq8qcTJi8Gzyk6V6l
         Jlds055Jvz+fv7zvxPr2sZmQKTsJovjmXbq94a3xKCCZ2ghNMny19L0BpUZbqRphCezB
         V3d5NfQLivRQ6AGkDq7eQwqDnDEnzOuZVWvzbAujzwX0Vst4MgjhNr1Oup5z2BcCTrY2
         lMS820hb4ZWs2BuHYI/aqexVYJrv//swIBPkbB7c8QhDTl5arT2UvtnYNwT+fAhMBD8f
         FSuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UlQcp91V;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id k17-20020a05620a415100b0076f19bbe6e0si2340179qko.536.2023.09.15.04.24.16
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 04:24:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UlQcp91V;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694777055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TBc/uVBazeKY4iJBuo/xzGp3L+IEGUgDpqNfs+vuw50=;
	b=UlQcp91VrrzEcBcD+hgYH1WAITh72d5TXgQiEOz2JprkgQn1wCCk3jsU2FItWiSFLjzQTE
	X+BFGJIXMYsJIoCG8zITxgWYDzPH7YcCx9tzTj4x8XWdp+K2P3P/enEHYdWZ09bm4enJqQ
	DIjWP1moAYLXC7Da4p1vKDXNJvyj8yY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-UuL2tu31P3madrSIP1vjiA-1; Fri, 15 Sep 2023 07:24:14 -0400
X-MC-Unique: UuL2tu31P3madrSIP1vjiA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-40309efe8b1so15032415e9.2
        for <alex.bennee@linaro.org>; Fri, 15 Sep 2023 04:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694777053; x=1695381853;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TBc/uVBazeKY4iJBuo/xzGp3L+IEGUgDpqNfs+vuw50=;
        b=fy6fKzF/7KuS7uyE3vDGzOhDtoCPOzA6CEiZSJtusekcT+F+tHiZeixECskEmtOkQV
         /Tb/vmZBeWvsIANc8yjouFMjV50FobCA7L2pFAsHLEnNDFKJhoONv9Y4SB75K8wXqPQn
         yClj5hokNVKm3m8/IAAf30yPS9BHgajH205Ivp1UYpkY+AhBnjuqFFkF9USIazgZSUOA
         sxj7pWaqkMXee5xDGdIrWezGFrgUoLMMJTZKGKU10UUjVKVrF7+vJ3aPMpC5k9mfd9KG
         eiy4EtsafoqNYJtERHWTaw2WSP97atU4khsqT+G+5smwWKk/vN4eNiO8MOicZ8UIxNDD
         hC5A==
X-Gm-Message-State: AOJu0YxnXNH4/DF0Gz8bcQhONrO2OJ1o3IKlaAxlCttulvDL6sgnwmIG
	tnMhQRqIjiR9wmhIyzNdWJVjr537Bg7UKf24tk2WAMmEcwPyTPGIPbI7aGL5HP8zD5g5AbP4MmI
	RwecHn68mkfuLCqAp
X-Received: by 2002:a5d:6309:0:b0:314:3a4b:6cc6 with SMTP id i9-20020a5d6309000000b003143a4b6cc6mr1121845wru.53.1694777053382;
        Fri, 15 Sep 2023 04:24:13 -0700 (PDT)
X-Received: by 2002:a5d:6309:0:b0:314:3a4b:6cc6 with SMTP id i9-20020a5d6309000000b003143a4b6cc6mr1121816wru.53.1694777053005;
        Fri, 15 Sep 2023 04:24:13 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-179-28.web.vodafone.de. [109.43.179.28])
        by smtp.gmail.com with ESMTPSA id s10-20020a5d510a000000b0031971ab70c9sm4208989wrt.73.2023.09.15.04.24.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 04:24:12 -0700 (PDT)
Message-ID: <665c03fe-37e7-4e2c-666d-156cf70e0f70@redhat.com>
Date: Fri, 15 Sep 2023 13:24:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/9] tests: update Debian images to Bookworm
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Cleber Rosa <crosa@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-arm@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, John Snow <jsnow@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20230914155422.426639-1-alex.bennee@linaro.org>
 <20230914155422.426639-2-alex.bennee@linaro.org>
 <30ac04ad-eb02-90ad-57ff-089538413602@linaro.org>
 <ZQQi6n+3mp+bQIgu@redhat.com>
 <242dc7bd-f0c4-d58c-fc6a-f3ddc0168bf2@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <242dc7bd-f0c4-d58c-fc6a-f3ddc0168bf2@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: fpBBruH6Yvnf

On 15/09/2023 12.53, Philippe Mathieu-Daudé wrote:
> On 15/9/23 11:24, Daniel P. Berrangé wrote:
>> On Fri, Sep 15, 2023 at 11:14:29AM +0200, Philippe Mathieu-Daudé wrote:
>>> On 14/9/23 17:54, Alex Bennée wrote:
>>>> Bookworm has been out a while now. Time to update our containers to
>>>> the current stable. This requires the latest lcitool repo so update
>>>> the sub-module too.
>>>>
>>>> For some reason the MIPs containers won't build so skip those for now.
>>>
>>> Debian removed mipsel:
>>> https://lists.debian.org/debian-devel-announce/2023/09/msg00000.html
>>> https://lists.debian.org/debian-release/2019/08/msg00582.html ...
>>
>> Wwith our general aim to support latest release, plus the previous
>> release (capped to a maximum of 2 years), we can still consider
>> mipsel supportable in QEMU CI by sticking with oldstable (Bullseye)
>> for the mipsel containers.
>>
>> Once Debian 13 comes out, however, we'll be discarding Bullseye
>> from CI and so we'll be unable to do CI for mipsel. At the very
>> least this means we'll consider mipsel to be downgraded in terms
>> of supportability when that happens. We might then consider
>> explicitly dropping it as a buld target entirely, as the writing
>> is on the wall for 32-bit OS platforms in general...
> 
> I'm fine with dropping system emulation on 32-bit hosts, but a bit
> reluctant to drop user emulation there. Anyhow I agree with our
> distrib releases support rules, so the mipsel buildsys part is
> effectively condemned.

Could you maybe send a patch for docs/about/deprecated.rst to make this 
clear for the users, too?

  Thanks,
   Thomas
