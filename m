Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp43877njf;
        Tue, 13 Aug 2024 01:32:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWjtuC22iJAhwtUZcnSRmhSjRUsB5fpCaa0CxhuSVRfvzkEUIxOJscolqtCxpdAqyCM3wYI+BMIhS2GWWUTwur4fMRBzyMu
X-Received: by 2002:a17:906:fe07:b0:a72:9d25:8ad3 with SMTP id a640c23a62f3a-a80ed1a86fcmr231719966b.9.1723537973800;
        Tue, 13 Aug 2024 01:32:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723537973; cv=none;
        d=google.com; s=arc-20160816;
        b=R1gxtCO4SNdnJtFPPmjgc9ZVbwEx3pWp6SFM+SqcPsMoHH1IuH5v/booghCu7+X0Gp
         uhv5Hdnx3G1vFgehG82AjBWepzGfmkLjZ7NR9aGCh2ge5q/hkISBega6mYnMSyAY/p9I
         ocXsNLbL/OgD2FxRjr3j03Q4vOHd/xuNJjxob6zX5aHRxguXYqk7xjadu+XT0Plz7Bdg
         ZjWZu1wJQspE9gI2uj0XxuxWMGCB+2WXbcn44vcMTiE+S0FRkwCfFx0EtKYivpyrOupZ
         rKcZvH8s41oYW36RY9fPxbVLCQZV0ugo56roliaPqxraTVuR70C1r4CWuxW6cJowGiQ9
         5A8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=K39hCVxZDiwh10XPpZXeqLUXFggILY6z0KTzVQEe+E4=;
        fh=P+Uk4fPcufmOOLJ9WBgbSOh+Vm9P8QJWc4TPqYnYlW0=;
        b=uo1K31DnC4VfrI0BvOMKs5tHPWUE+p36+cySZ74n1U+3eR2XlMRlLWQM2EJXA+ZyuQ
         F8Ivg3P1VLOLv0rC6Us+OoKphSHM2rXikIWjQI3nQOqFSpoORHwBP5D604svKs9h4Pqz
         sRBq14YRW3bRujswk/4QUDBwoqyk0lY2L8RTH+eTUX8pxzJrEpnAKeQaM/rgLYLrNhy+
         ayK9/88rNwr0l+ecFAtXh7X3aix9E1a4cDudS2qgP5H68K5U1lM0TyNtyobSDjosBUsg
         gFd0I8KC4bqEZ4mcOgm1GX1ugKmAeY58HXs8Zi2i5fAaAEmsQYmvxxQs79tNY2RaaG6V
         GjGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="T3Mujr/C";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a80f41563fbsor33971466b.21.2024.08.13.01.32.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 Aug 2024 01:32:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="T3Mujr/C";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723537973; x=1724142773; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K39hCVxZDiwh10XPpZXeqLUXFggILY6z0KTzVQEe+E4=;
        b=T3Mujr/CWmtgr50i4XEe7AhVLyOfTQxg0BB5yUUk/vz3LGKC7Wmz5sXvm0rETAZ5XT
         HOUXqLeoeM9Gx4YactPMf6rPk9uttBF2GYLJLrI2FOkGRka9ZJ0y9IWC2PD7JQx/x+Vg
         y3EDRC4t1+WFBGVNcrcxW0aCWK3Cgr4dHmQKoQxMTfgqNxtKPRCnABUovv6YXtNphKUn
         NpyJZME+ascKsHJ55g6ynUu8OpoBa5EIhxBCbcxzIH5q1uIcis4GdyVi6y+xMRsUZvuj
         50wCc1q0nQSmcG0oMJmX6Y/S2iotJtpEWKHF2iePtfLbo+p1Lx4MHBptOIYFziB6iTbQ
         nmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723537973; x=1724142773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K39hCVxZDiwh10XPpZXeqLUXFggILY6z0KTzVQEe+E4=;
        b=i1m/mWisTJTLng1Gbx3oXcVs52fl3pr0FYCYT5BMPFDqd2ctoHnwbn1rXQtK9acjB/
         oCf1RNMPeBWnEytfgKYzCo2jEC2Kes+QZdRFF0AyjejGkCRtXZOTqtYj66YT5osIw4m7
         md0j2lwC4Ess4gFn/uUY2eEsGazpmeV4J6UK82YiW1MDkR3zAmtzo8Dg3XYx53Ceedu2
         VT2uxCtNmLWT7OVKWXo4rdz1p3/SzzEQqGacQfrLyHGh4+Jb393KZvHT9YZ4frlyZEFQ
         G8GiD32YlmpwcRSdvtZ3PwAZnxXRAG4p7hGPeuektDPy229aEKrQLpTrOclAqgL2Tbjd
         63ww==
X-Forwarded-Encrypted: i=1; AJvYcCVzth0aZBeEU+71ru9wU+eUoNWpzDvGEwf7CocWw+RJb9ZQX5enTLXd+wDIolLT2P6vlEJIHNtdT7kGll7tWWBa/QtVXcG1
X-Gm-Message-State: AOJu0Yzs1r/ocNfuGEi8qvUVeFJ/vpGoV7VSWvX4QHWarS4CZ9vwE/RV
	atrYyW5Wn8wJP+jGIdelFgnvpIuj7u4cZ/y2lwCwKsqUOzPt1FMWy5vyAm9DHsiaOQ==
X-Google-Smtp-Source: AGHT+IFdofLhOfFifpA+P7ZaxNI4/pULSNg6TgI01r5b24JFRuedSJkXPHAnHJVSh0WZqCxdNAEkdg==
X-Received: by 2002:a17:907:d861:b0:a77:c95e:9b1c with SMTP id a640c23a62f3a-a80ed1c14f1mr213588866b.27.1723537973011;
        Tue, 13 Aug 2024 01:32:53 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.129.17])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f3fafb6csm49649766b.75.2024.08.13.01.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Aug 2024 01:32:52 -0700 (PDT)
Message-ID: <e9ea37c6-a9b4-4708-bfce-0869d1bd9cbb@linaro.org>
Date: Tue, 13 Aug 2024 10:32:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 03/23] scripts: add script to generate C header files
 from SVD XML files
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Octavian Purdila <tavip@google.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefanst@google.com,
 alex.bennee@linaro.org, thuth@redhat.com, peter.maydell@linaro.org,
 marcandre.lureau@redhat.com, alistair@alistair23.me, crosa@redhat.com,
 bleal@redhat.com
References: <20240805201719.2345596-1-tavip@google.com>
 <20240805201719.2345596-4-tavip@google.com>
 <CAFn=p-abeXP+dUtp_gwH3dcD5DT-sTAFg=udVugrzcU1r8fXpA@mail.gmail.com>
 <CAGWr4cQL_LMWmEUdoPprRSp2k=CkQ0UJp5Q45qbAtUvvE6fDHg@mail.gmail.com>
 <9080f7e5-a40d-4cbd-a734-74578dd27894@linaro.org>
 <CABgObfY1hGKhBjwjDeKSSd5uxbe8Lc5=hVL6psB0NLbnX1bJ0g@mail.gmail.com>
 <ZrXokj7du0YgRHpz@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <ZrXokj7du0YgRHpz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: u0FIjhImvB88

On 9/8/24 11:59, Daniel P. Berrangé wrote:
> On Fri, Aug 09, 2024 at 11:42:38AM +0200, Paolo Bonzini wrote:
>> On Fri, Aug 9, 2024 at 11:30 AM Philippe Mathieu-Daudé
>> <philmd@linaro.org> wrote:
>>>
>>> On 9/8/24 00:30, Octavian Purdila wrote:
>>>> On Thu, Aug 8, 2024 at 2:56 PM John Snow <jsnow@redhat.com> wrote:
>>>
>>>
>>>>>> diff --git a/configure b/configure
>>>>>> index 5ad1674ca5..811bfa5d54 100755
>>>>>> --- a/configure
>>>>>> +++ b/configure
>>>>>> @@ -956,7 +956,7 @@ mkvenv="$python ${source_path}/python/scripts/mkvenv.py"
>>>>>>    # Finish preparing the virtual environment using vendored .whl files
>>>>>>
>>>>>>    $mkvenv ensuregroup --dir "${source_path}/python/wheels" \
>>>>>> -     ${source_path}/pythondeps.toml meson || exit 1
>>>>>> +     ${source_path}/pythondeps.toml meson svd-gen-header || exit 1
>>>>>
>>>>
>>>> Hi John,
>>>>
>>>> Thanks for reviewing!
>>>>
>>>>>
>>>>> I haven't read the rest of this series; I'm chiming in solely from the build/python maintainer angle. Do we *always* need pysvd, no matter how QEMU was configured? Adding it to the meson line here is a very big hammer.
>>>>>
>>>>
>>>> I think the minimum we can do is to install it only if CONFIG_ARM is
>>>> enabled. That might change in the future if the models we create with
>>>> pysvd are enabled for other architectures.
>>>
>>> Similarly on how we manage libfdt, you can have meson defines
>>> SVDGEN as:
>>>
>>>     config_host_data.set('CONFIG_SVDGEN', svd_gen_header.found())
>>>
>>> Then declare SVDGEN in Kconfig.host, and finally use in the Kconfigs:
>>
>> That would force people to install pysvd on the host, which is a pity
>> for such a small and little-known library.  We have used submodules
>> in the past for much larger and common dependencies, for example
>> capstone.
> 
> As mentioned elsewhere in thsi threads, IMHO we shoud not be running
> this generator during the build at all. It should be run once to
> create the headers needed for a particular device & the output committed
> to QEMU. There after any changes to the header (if any) need reviewing
> to ensure they don't imply an impact on guest ABI. This avoids having
> the 8.6 MB XML file in QEMU git too, as well as the pysvd dep on the
> host. Only the very rare times when we create a new device would need
> to have the pysvd code & XML.

OK, fine by me, as long as we don't end in a similar use of dtc where
we use distrib dtc to rebuild outdated dts and emit a bunch of pointless
warnings cluttering the build output and that nobody agrees how to fix.
