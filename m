Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp253061ejc;
        Thu, 2 Mar 2023 14:07:59 -0800 (PST)
X-Received: by 2002:adf:e5cf:0:b0:2bf:f735:1310 with SMTP id a15-20020adfe5cf000000b002bff7351310mr8972652wrn.2.1677794878971;
        Thu, 02 Mar 2023 14:07:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677794878; cv=none;
        d=google.com; s=arc-20160816;
        b=UDnY5lqDbkQfTM5eks47XiPlFMgBin3YG8TuOSwydfjk+5OR9+ex8ZUku899UbP09b
         OgVCN+jW0i4IWMiAHoe2/PuJR2oE+qNz8cOAltEx58fdL1Aopm+CyqClGZo6hFD103jQ
         fjxBn3CKdBeNKam30ZN+QhBHjfPD2lEkJkkB1524gfVp8N2Y74ZO/zmHedajKn9CyYnM
         4sbaKAxW/IYaJKsyZ6DN6fQbtOh3Pkr5cR0AyF/r7D1G0eK88jdklxi+AEyoZgrdYMkO
         yi80cMKNGgFap/x5QWpUSPrzXXUXAG1A8IE/hlw6tuZXA9pGoh+WsEUNDZE6Qd3ufcA0
         vfnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZK+UEBQ2lF5D2tpIcjSM50wLk0IHyAejs4TzwnTVW5k=;
        b=yonipM0lU96laRyrKIsB0ud0wZsvwJRhUPBf1WQi3RRZZ0WI+U+ha7KHsEDQPlnJR4
         isi27XMX2rt7pSXWDBjvr8UXxthNBAUDVyHIMntIRhrckvw63ISHnxr56rTppcV7svTQ
         jowr4p+14VIhy3di4TdtZ1Uz0Yngwibr9FqQT5IhEjXlgjudfWuScL1NCQF+vAmnQOZM
         TRwTwXeIhnku92381lpAjpshafLtdETqmiZU92EXN05eTYVXxngvGZ0hwCR0HzDmjjY5
         OYmvh0VGUdn7UbBNuMKfCmgAVQrXJ/hYzXD08VfSjlZhog6xgx3FJcPsCHKYmIWSEOkS
         a3Lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U82HnNmn;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p7-20020adfe607000000b002c7088dd815sor200638wrm.43.2023.03.02.14.07.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 02 Mar 2023 14:07:58 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U82HnNmn;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677794878;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZK+UEBQ2lF5D2tpIcjSM50wLk0IHyAejs4TzwnTVW5k=;
        b=U82HnNmnIlR8fsbUOzoyUOrcyk+UF0aCzllzpum/8sOkxYueGYisYF+f0M4+iCitPt
         lA8X8eIusLZIDxCoW2ITywyqVxF102PaWtOcX2ngEQtr3sbtWCAs/RK470AZYh4aObfW
         xTXSkcztl32ehSaQNeKck4QZslyEpWK/jOZXrrrb+S8Xs10olWuagHCYfiescykm5jIO
         /WGN2la8HKlJaJoSDvW+oIU8JDxhFsyJ+csnc2HLPgMUfUqrAqihbd1YnsYSyzLNPQlZ
         BG0M2UJM5hmPHw3pzydrf6s4Yo5XBR9Cq0TJauUFlBH79CJTfmytfyhWZXbHZ0hXHhdh
         gSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677794878;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZK+UEBQ2lF5D2tpIcjSM50wLk0IHyAejs4TzwnTVW5k=;
        b=t5+zYUQ40cyfi1r/F3EvANzQzUuTA/d9yZZsHLalZMCkhYOwXtLrMrJvQUpuCSHmNt
         mFtm/3JgRBI3zF8W7J+89UEiDIRlCwUoshfXUc1wjjEPkYiCwm3NwTosqIQkutyh7XiO
         Ij39TR8zdSSnLM+Q9OF/aaABXtuXLn4zsamsVxFI+P3SM4xvwdbpS1cIBAinTpasrRZ/
         T2K+07/9LFKz7Jxo7ljVolPaxFnL0lo/OFjCULo86yA34fo67jX95Vbo6GKwNlJozpUb
         ZR/n7jrNEPynjMnzILzdaENCQS31JVB9+cI91CgMDtOaUZQ2ksCeKOhvJHwkPubSnj1V
         Mehw==
X-Gm-Message-State: AO0yUKXZ+O0RIO4T1uyaupGj9DQH+1PFR5WlhUiEeS7rBuzUTxqMJtmQ
	o0/TaxbPIklJ3jO4lmSEjU8XWONo
X-Google-Smtp-Source: AK7set/zRREzUl4g52CStSVhdiUVcMgbt0PP1P8PqAH2s47EeF75hS+bGX8bzaTEyaGL4tkTSSuiOQ==
X-Received: by 2002:a5d:468e:0:b0:2c7:1b42:1cec with SMTP id u14-20020a5d468e000000b002c71b421cecmr8344921wrq.23.1677794878584;
        Thu, 02 Mar 2023 14:07:58 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.27.175] (43.red-95-127-39.staticip.rima-tde.net. [95.127.39.43])
        by smtp.gmail.com with ESMTPSA id k8-20020a5d66c8000000b002c573a6216fsm448290wrw.37.2023.03.02.14.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 14:07:57 -0800 (PST)
Message-ID: <4bed38c3-ab4f-cd32-05a4-afa090ad8b9a@linaro.org>
Date: Thu, 2 Mar 2023 23:07:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 0/6] Deprecate support for 32-bit x86 and arm hosts
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Helge Deller <deller@gmx.de>
References: <20230302163106.465559-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230302163106.465559-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: GYZyk5/45ptD

On 2/3/23 17:31, Thomas Huth wrote:
> We're struggling quite badly with our CI minutes on the shared
> gitlab runners, so we urgently need to think of ways to cut down
> our supported build and target environments. qemu-system-i386 and
> qemu-system-arm are not really required anymore, since nobody uses
> KVM on the corresponding systems for production anymore, and the
> -x86_64 and -arch64 variants are a proper superset of those binaries.
> So it's time to deprecate them and the corresponding 32-bit host
> environments now.
> 
> This is a follow-up patch series from the previous discussion here:
> 
>   https://lore.kernel.org/qemu-devel/20230130114428.1297295-1-thuth@redhat.com/
> 
> where people still mentioned that there is still interest in certain
> support for 32-bit host hardware. But as far as I could see, there is
> no real need for 32-bit x86 host support and for system emulation on
> 32-bit arm hosts anymore, so it should be fine if we drop these host
> environments soon (these are also the two architectures that contribute
> the most to the long test times in our CI, so we would benefit a lot by
> dropping those).

It is not clear from your cover that the deprecation only concern system
emulation on these hosts, not user emulation.

I wonder about tools. Apparently they depend on sysemu now. I was
building a 'configure --enable-tools --disable-system' but now it
is empty.
