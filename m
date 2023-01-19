Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp295896ejc;
        Thu, 19 Jan 2023 04:35:32 -0800 (PST)
X-Received: by 2002:a05:600c:31a3:b0:3da:6a6:739d with SMTP id s35-20020a05600c31a300b003da06a6739dmr10150214wmp.19.1674131732635;
        Thu, 19 Jan 2023 04:35:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674131732; cv=none;
        d=google.com; s=arc-20160816;
        b=l2bW9G/2UT9am9voQwTN3XV+1Si0nvQshgoreu7CcRVDy7oKKivMtFXhgU0ZSVuBra
         KZyanOn7UVszvD9SzR/kphgPqrziRlqH2f5XWeiT9g2MrW5X1kVDqUTg62Z3tQXjr+qd
         IRrQZyFOWiwjnXXGOATCgWbLRIQZ/+wtddZ2AAYT+s/4ckSm1+gIz5YyFE4BteREqqGH
         ZnNeqCaPSxug99TBGVUg7Sl4c7tGSKun5lMvn/ogE4IqKcelEFksLxI0FcentpJQ6NLz
         DRlxSOogKBXea0cTLfDDvRt3w+bjr/BCATyKqoOURndUQ8DA6P8rE6cbqiww6s9aVIHw
         Rp4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=G759XjHotxBmkEFBsVgdOmKG6oeAu6tQI5DaentPAtE=;
        b=Z3BOc1amIivVqeUtkauvfngpDy0FhBiBpLXe5WEDzzvJN2v+YBnXwqpL0k1kShRdA8
         sWHgX+d0dOAqqjeHQh+iyaj7PSJu5lt1wMdNjwhhjPteGmfNG7jxr/h3iTvHIG693wx/
         EdGcKJlskC5M4rAycIvTOLfy1zxNevV0mpzTiGoYyriUYOtc4+B1YBYxwB7JC7eoo6Jo
         0cNp5q5qWuDgS86VgTYCBgs2sBfy9cRUN1BGDaclsOlVsES4zfBg7P+9SkfxoaNRsv3u
         KJYeTb9iMByUw8lH2K4dQFrNuX5efbLpV95tntIXpHDPrCNQeI+2oOKaxP/tlnjD1N2u
         5cFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MahV4wzY;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ay34-20020a05600c1e2200b003d99a390c37sor1394187wmb.45.2023.01.19.04.35.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jan 2023 04:35:32 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MahV4wzY;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G759XjHotxBmkEFBsVgdOmKG6oeAu6tQI5DaentPAtE=;
        b=MahV4wzYgphoHXT4RIAyZ6kF0nrqFrNC7fGc0mBcPozd4xwv/pTAPaBYqENH7hzVzf
         Jz6lNPzTRHTT64j4dkhFM5HG4YbLQ7fX1kZWG6DRic7KNsFLgP8v43PLHzp/E0xHW0pB
         uatbI5MT8xCMteVyw7xnw1bZURkcYr1vzC7WuIqsQpo23fKMQ7ok47bJHJqSvTkvm7IF
         wmwyqyI/ZemVH1aTY7znbAnFEjkweXWiez6SEGF+eEr066qnAz93XE2TzqdIr96BCEhx
         Ku7srwC+/GYISCtcQ28hA4j7CaUEdMaqSjZ8n6lV8hY6eFOxnmNrfUM9R+uLCiP7ACv/
         sqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G759XjHotxBmkEFBsVgdOmKG6oeAu6tQI5DaentPAtE=;
        b=gsSOTdNSv53fzuQeQLH1O/1rk0dLHUIJM7/301DHGPa9VF6yG/6RuFn9WieNVzaOPR
         BQGZtY9llLnNvILPKrySGjuIk9z8vtrAEH+zyj4qclp1UEPv+VEn9KV/pUTjCxb075p6
         HjjqN7ysKCkfiJN/u6jo/nrB0VqVC/mojJoTKRl9r/Rv09DsEw/XNA7TGzcEZZFayeDj
         7aZpBu14YW4h+6eSWhjfAWcslU8LMlXQXtDCBH6lGXS3iwsQmyaahduqOIvifCprp8Pi
         xLQ7cKwsSFl6SYeM3ny6hH8w81Ztf+TTHa+uXjGv75OBR2MQFkf2NomXSsaUgEnPTR5s
         gk6g==
X-Gm-Message-State: AFqh2krdcNHYV8aMikh3OUYibTaG/0IDKNLSifGMA40ur0CB6Y9I7Szh
	41jQwl3GNMx/mNuUM3WTPkhXvO47
X-Google-Smtp-Source: AMrXdXvDTTfl0uW5AMHs9RgqxO3y3yKSgOW4o94yqwvAPtOsbtsBUWpiXC1UQSFbVgD7fzyNWlCukw==
X-Received: by 2002:a7b:cd9a:0:b0:3d3:5d69:7aa5 with SMTP id y26-20020a7bcd9a000000b003d35d697aa5mr10130733wmj.25.1674131732270;
        Thu, 19 Jan 2023 04:35:32 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id z6-20020a05600c0a0600b003d04e4ed873sm5826487wmp.22.2023.01.19.04.35.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 04:35:31 -0800 (PST)
Message-ID: <854dadfe-e98e-bacb-2ee8-01f53ed8798d@linaro.org>
Date: Thu, 19 Jan 2023 13:35:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 00/20] target/arm: CONFIG_TCG=n part 1
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Thomas Huth <thuth@redhat.com>
References: <20230118193518.26433-1-farosas@suse.de>
 <39bb348d-e3af-6a20-e7d5-d7a1c918a389@linaro.org>
In-Reply-To: <39bb348d-e3af-6a20-e7d5-d7a1c918a389@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 08VV6EwO55fI

On 19/1/23 08:41, Philippe Mathieu-Daudé wrote:
> On 18/1/23 20:34, Fabiano Rosas wrote:
>> These are the already reviewed patches from the first half of my
>> previous series:
>> https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de
>>
>> This unbreaks the --disable-tcg build, but there are issues in runtime
>> that are still being hashed out in the other series.
>>
>> For the build _with_ TCG, this should behave the same as master.

> Reproducers:
> 
> $ ./qemu-system-aarch64 -display none -S -M mps3-an547 -accel qtest 
> -monitor stdio
> QEMU 7.2.50 monitor - type 'help' for more information
> (qemu) gva2gpa 0
> **
> ERROR:../../target/arm/helper.c:2495:arm_v7m_mmu_idx_for_secstate: code 
> should not be reached
> Bail out! 
> ERROR:../../target/arm/helper.c:2495:arm_v7m_mmu_idx_for_secstate: code 
> should not be reached
> Abort trap: 6
> 
>      frame #4: 0x0000000101fdd6cc 
> libglib-2.0.0.dylib`g_assertion_message_expr + 116
>      frame #5: 0x0000000100360ce0 
> qemu-system-aarch64`arm_v7m_mmu_idx_for_secstate(env=<unavailable>, 
> secstate=<unavailable>) at helper.c:2495:5
>      frame #6: 0x000000010035f7f4 
> qemu-system-aarch64`arm_mmu_idx_el(env=<unavailable>, el=<unavailable>) 
> at helper.c:2514:16
>      frame #7: 0x00000001002d17ec 
> qemu-system-aarch64`arm_cpu_get_phys_page_attrs_debug(cs=<unavailable>, 
> addr=0, attrs=0x000000016fdfda50) at ptw.c:2982:23
>      frame #8: 0x00000001003c660c 
> qemu-system-aarch64`hmp_gva2gpa(mon=0x000060000390f0c0, 
> qdict=<unavailable>) at misc.c:714:12
This problem was previously fixed by this series:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg777719.html
In particular by this patch:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg777724.html

Since all issues have been identified:
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
