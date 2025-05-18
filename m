Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp3426279njb;
        Sat, 17 May 2025 21:56:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVlvIfDvCv7kduiw4KhEXRT6OU9xH7RSo2nI+JH3oFO3y/13hmsuRW+OTviin59wNp3l25D9gQ5hpphUw==@linaro.org
X-Received: by 2002:a05:6a20:3d1c:b0:1ee:d418:f764 with SMTP id adf61e73a8af0-2170ce33ad3mr12441037637.38.1747544201669;
        Sat, 17 May 2025 21:56:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747544201; cv=none;
        d=google.com; s=arc-20240605;
        b=CkSP5fu6OuXrWDWILnlHF6fJV+Q3srScewNoGttx/412LfCN2sXHSRy78A3xdMjht7
         FwfVyAzfLG9DUYmgVepjfNxxb/ahWPGJidOYteWtcYwAPLHj5yQxM2WwleBt1b307KY0
         +wSYMI7Gvxd/yCZBj5FiLYW6Q24nVGgpLvKcqn2ptLC56Ed0pF4p+Q/cg9otaTSzZrFb
         Qwce08sPFkiojYAdsht7Tmf2vjntC2LK7oXKNdcd3ZJWrsNEh362gWV1Kh41O9aPojbf
         A3r0nQ1LyiLJHzt5rmkypVeJYAC6hrZIx6cfjVxa1tJMBbGBdYR1D/C0UU4ponccWbJu
         QUTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=W9/cBnVIez29CLs/L+Yh/duA+f3i6XOG+65a+hphMz4=;
        fh=W0y4btdEQpNzIp/UFSJEVozq7VYd1fQUuKFKwBt0E/U=;
        b=lDSgDZIW0L+lcnrK7KSJ1TdB0ct/dTx4L3s6xKp7Ib4nXpeG+PzdH5apZg7sGEdyiy
         EynCDMs3YM0FWLwow9IlgLXLS0/6KaJtBfVtUHZofv7fJr/DzBCgIW5UM0Snt+RETFgt
         KHdKtbQE3oQo+buW/UjVJ+YUhArabaeWmWIiEIo9KbSyGwQ8YWMskpus40tfOCbge+78
         MBIHXy8aZMa8SRKxyKjH0R6Xf2Do0OK2S6F2UcmnkzKUzpeEipArzvmgLvrZ0D8peAr1
         X7S5U8WSppDTLk/CV1qvDfXdSOUwJgDjyJtWUPxQqTCLM0rO4oxRbRS6ZEJoTAR36dzm
         lq6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=NvtXzMBY;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b26eadbb29csor3731946a12.0.2025.05.17.21.56.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 17 May 2025 21:56:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=NvtXzMBY;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1747544201; x=1748149001; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W9/cBnVIez29CLs/L+Yh/duA+f3i6XOG+65a+hphMz4=;
        b=NvtXzMBYCIL3mQuuz7DRMCsS+lv7DvJjwGzriYdorU8kThnyIN5a+25I5YjbwzDb6N
         h3QFc0lAQn+b+gFBKDJRsIQP22mTk8ew7Am02W3eZHWzIDE+UQayv470AQBKsDepbAQU
         J05uFWuHV2GkEloLsFcG/rdhXlAOU1VDwUupJl+HGyMWTFZDrhxKcW2B4ixlumUCTcbh
         8NLuNcdRIYJBWJWNE0PT7eBUxLCK0f3o+gxxMAFolfDQo4sJUIY01vXZFfs8mX4vap1b
         vu1DSS0cqHM1E4V2RXTWhAjGQAGJ9Os7vBL8y6IwljzInIjtU54HTpitFjkBeg/03rpj
         76sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747544201; x=1748149001;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W9/cBnVIez29CLs/L+Yh/duA+f3i6XOG+65a+hphMz4=;
        b=dxavVg9CFanovpvP5l85nZ9QIBs1nfgYIkbHI+KNgYbaiBVwrmykrDhpg39kZWBxja
         FBw9ANg28d0wr3wA8Q8JwnkAJKS4RREG+g94SQobWNGRnVph1pXKw6/P1y+N/NyJ5nQd
         EMGJdlUihkkZeDH3G7k8uQ1KNhkhtshhJuukaKIYaJRC+OScm8o2JXuN8cLdd3SttZ8q
         g4Q0dlbaKTgTkjlcJ4fMXqxc6sG64uea9lGXFpC3fCSds+cwtOEYJgrjbYh1AaqzRpoy
         WkCkNGUoLuCKioN6Fe3lE/wudbRWYTkaCandV3LzI+DYuIOZXh8AWe/ihNre9ov67wdY
         L24A==
X-Forwarded-Encrypted: i=1; AJvYcCUKsCEhJDlHJ5j+dhcJOCD4DVD0bmFp9ApK2WVX1ITX5vpfWkqi50s5HwkWJ59K5wNGV1/SMGFTVJ8eNg==@linaro.org
X-Gm-Message-State: AOJu0Ywj1B9ZrOKyqqOa+R1biq/Xhw69dNx5tmOn5pFTr3SaN2UqfFyd
	qGJjkjJ15uXCYa92Xfz22dU9CBT5Z/tQBUrBpupShqWXItz+hHV/TzaXruP3gECt9Tg=
X-Gm-Gg: ASbGncteAUD8dCFnBHEl6jbojHTjOtiDgIqi3hgzeL8OC3vBlFsFU0moO/53OT9jCKQ
	VNb+ooA71ojcl7/UN7Y4KswbxhBJ0H64bCAVOtyriJGwB1ThgWKWB/VJJgngmKsAZrqH6T1cvmf
	kD68IaOSqryYjsFXwS9aNsBsyGyHqOaHKDJoWi9GAPpMx0fN8gxDq/3E4nnIpzdS1flrcqc9cgo
	+Heym8JNd17KPjVKjMZ8TblLdjcA+Sym/RlQxbrchp8wMtQmSF23jQihNEn0Nd59KcFvmfw3A8b
	7j0cK5fUjnCPVZidoASF5XKsg6j4BUt+FSRZmGQcDqxPdQ1Gmgwhom5k6ZoNjw==
X-Google-Smtp-Source: AGHT+IE17VcvEavpeRxgfxNYGu0UiZ7U9RqdxTzGf4RpgZpNRkZpAOWxK+qNbKtURBc/tvnxO+axHw==
X-Received: by 2002:a05:6a21:31c8:b0:20d:df67:4830 with SMTP id adf61e73a8af0-216f85ac739mr11814951637.0.1747544201109;
        Sat, 17 May 2025 21:56:41 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.207.61] ([157.82.207.61])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb0a906bsm3979875a12.71.2025.05.17.21.56.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 May 2025 21:56:40 -0700 (PDT)
Message-ID: <63911dcc-482b-45c5-9468-120ae3df691b@daynix.com>
Date: Sun, 18 May 2025 13:56:35 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/14] ui/gtk-gl-area: Remove extra draw call in
 refresh
To: "Kim, Dongwon" <dongwon.kim@intel.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Peter Maydell <peter.maydell@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
References: <20250506125715.232872-1-alex.bennee@linaro.org>
 <20250506125715.232872-13-alex.bennee@linaro.org>
 <d5a8cec1-f689-4d31-b6bb-b63eaa4ce2af@daynix.com>
 <d370ffec-f430-4377-80bc-323d5087834c@collabora.com>
 <f7d65908-cd12-4c44-a80a-07e23ff27833@daynix.com>
 <PH8PR11MB6879FBA9E5133649714D74AEFA97A@PH8PR11MB6879.namprd11.prod.outlook.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <PH8PR11MB6879FBA9E5133649714D74AEFA97A@PH8PR11MB6879.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: W8VG+OuyL44L

On 2025/05/13 2:01, Kim, Dongwon wrote:
>> Subject: Re: [PATCH v2 12/14] ui/gtk-gl-area: Remove extra draw call in refresh
>>
>> On 2025/05/10 21:12, Dmitry Osipenko wrote:
>>> On 5/10/25 07:52, Akihiko Odaki wrote:
>>>> On 2025/05/06 21:57, Alex Bennée wrote:
>>>>> From: Dongwon Kim <dongwon.kim@intel.com>
>>>>>
>>>>> This partially reverts commit
>>>>> 77bf310084dad38b3a2badf01766c659056f1cf2
>>>>> which causes some guest display corruption when gtk-gl-area is used
>>>>> for GTK rendering (e.g. Wayland Compositor) possibly due to
>>>>> simulataneous accesses on the guest frame buffer by host compositor
>>>>> and the guest.
>>>>
>>>> Simply reverting the part of the commit may re-introduce the problem
>>>> the commit tried to solve, which will be a regression as the commit
>>>> is already included in releases.
>>>>
>>>> I guess the problem is that the gl_block callback of GraphicHwOps is
>>>> not properly implemented and it is what should be fixed.
>>>
>>> The reverted commit made QEMU GTK GUI unusable under Wayland. It was
>>> fixing problem which requires very specific QEMU setup, while breaking
>>> generic setups. The offending change should be reverted as it
>>> introduced a bigger problem. A proper solution should be found,
>>> meanwhile QEMU GTK under Wayland should be restored, IMO.
>>>
>>> For the reference see [1]. First bug reports about a mirrored display
>>> problem were made to me on IRC a year ago and the root of the problem
>>> was identified only couple months ago.
>>>
>>> [1]
>>> https://lore.kernel.org/qemu-devel/5aedf1ad-d9b0-4edb-a050-f3d9bee9bcc
>>> b@collabora.com/
>>
>> That describes the context well. It should also be described with an inline
>> comment so that we will not lose track of the known problem.
> 
> [Kim, Dongwon]  Do you mean we should have this info in the commit message?

A comment in the code is better.

A description of the current version of the code should be left as a 
comment so that readers can find it without git blame.

The commit message is suited for a description of the old version of 
code (e.g., a bug fixed by the commit) or a comparison between the old 
and new version; leaving them as comments will infinitely increase the 
amount of the code.

In this case, it is about a problem with the current version so it 
should be written as a comment.

> 
>>
>>>
>>> As of today, the GTK problem isn't understood.
>>>
>>
>> If your guess about simultaneous accesses on the guest frame buffer is correct,
>> it's a bug of the emulated device, not GTK.
> 
> [Kim, Dongwon]  "Simultaneous accesses" was just a guess. This problem needs to be debugged further.
> BTW, the problem the original commit was trying to fix is some lockup due to suspended rendering on
> minimized or hidden GTK window. But according to Dmitry, this case wasn't hit in his setup with wayland
> compositor so I assume the risk of not having an extra draw in gtk-gl-area would be low.

It is better to describe the estimation of the risk in the comment too.

Regards,
Akihiko Odaki
