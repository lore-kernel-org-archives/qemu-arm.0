Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp2027330njb;
        Sat, 10 May 2025 21:47:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXmltYV9/0fy0rQblHmd7VU4a9q0HUS/3DMOXIYptJLX7NQ7FxKTxfQVzG/aT4oeSKM8ujn9qvTPaI0Dg==@linaro.org
X-Received: by 2002:a05:6a21:1584:b0:1ee:e96a:d9ed with SMTP id adf61e73a8af0-215abb4fd7bmr14489155637.7.1746938865921;
        Sat, 10 May 2025 21:47:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746938865; cv=none;
        d=google.com; s=arc-20240605;
        b=G6efHe/ZcvrrwWQ1Ff6Hsb8SFfIcddsUgYwyAvQW417FbF/QZjSC3rT5o0jegai+fu
         foeb3XE8PBWfUrirKAcXEZ5OqbO4yVcsj5AUtA1k+ftFFa45yRt/SMpjv9kcKz+VrBnC
         jE+x64js+z4Y6QH5ZnFadLQBVT9oKTVeCaiUBNYRxlUuEeWR60T8KcofH3gDBkWLXAnR
         KyZGsjpljOR8aCmYfTjjbPL7W5s27Wp9FvM/O6jSQuUN599wruHGrOME18N/5Ung/6mJ
         iLKU7YA5ZiaMwrKpYqEDT74vdMWQ5N3fG3ohzzdi1WDQLjLSBeDosV8eMoFYZ7X4kyYA
         S9vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=SrRtF81GH+qwnsWqM1CfEyu3ujI3f2cd1a7b3ZRta5Q=;
        fh=JDJ9QXfrr6ramMRM4jUDUqbzCFKK65JWi96qDrVuHac=;
        b=IsfWJBiG/ZnWSuLOZ3QtwUc8JKo6bz0dQAiI3U8nOw7rkShZ3bpipRpITy3YcVw4ka
         dyGv/xl9ONH1wsf6jkBZS5skFvPHkB9IaSrj4jfksz+CFknhE0O9myq11o5Thq4/dbc8
         vRB4JLnmUmv3WG8X+XNzyoiuavMq1ICuHcvSUGHe5Af40CuIVQq5gISdS3q+JiBDBwo2
         pgprM5m+VNx+KJB+FuAcg24iK9ZrMhL6NFwomG2wjy2t1JNjXW26r6GvJq6N3QuYPykO
         iXVzS407BRmMjq5giJIShXnKV+fVBcczAMRqkA6b6YVR2c6bKRK8meGgr5MJj5YLezgf
         VSIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=kXvWrPkI;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b234b7e3a01sor2906858a12.6.2025.05.10.21.47.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 10 May 2025 21:47:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=kXvWrPkI;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1746938865; x=1747543665; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SrRtF81GH+qwnsWqM1CfEyu3ujI3f2cd1a7b3ZRta5Q=;
        b=kXvWrPkI8uHSjlAKx5R6xR5BE7goqDmaf9kUbvjvA7jpfOPcF11GeD32R8BuwUiYUV
         lAxnDU0zDRHM0IKraRfdLXKwPKSFBT4cfzsDogwOFfVCaxVwaxoULDoPhLL6o/KgIvqj
         LeERNEVg1GTtJ4tmxRNl+hnumF9bjTNOf12SEp0PyCzBvSNcgCX8gM6QqDuwgYQ0MlYt
         uVtPn0GfKWL0+ljoHrvG9crS4zsZ9Tt5jepjEQ4WZ+Sl++J+pCy/vR+XX1Oc8E3OXejx
         2qwFM7sPEW3zM0xu5NR31QOM0y9MrsUpg7OhvHFK3dPG0Z01KCTrfGv6w1Elz+Nrg4Rf
         JLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746938865; x=1747543665;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SrRtF81GH+qwnsWqM1CfEyu3ujI3f2cd1a7b3ZRta5Q=;
        b=EH1d8jLhJGadBOhJrheW8lGGZ20Xo2FR4T2PNYtCOMrMg4+e1Y7sad8tV9zx+D1vNE
         xaQNN7v09gWU2F8KLO1NQG3R//THrwZzGb9DfAN7IT0unBefzmUTmgOri7AJhb3CMJFF
         tUMYTbzztPRFbi7fYYkxywFz0EWt3O/dNAM3kmXFDzn4ELni6Un6fhAgUTA/z5d4tcY0
         FIz+iYNirSADLQoiOj9HohzEDuK3gtBYIlWGReeIcLTsL3QQBISLlLsojfj2JcqMIQE+
         W4UDQ/3+4Ka6gG+lZLf8q/6EYY9Wa+dX8YP6xS5ToTDNpojVkqkO38yrF2ZoWXw2BWyB
         O9gA==
X-Forwarded-Encrypted: i=1; AJvYcCXGzShWWSSB8115ljP1b4bw/gDuMRaXNtTh1+CzD/YPfsHRi3PnpJELLTmjYkmeP8yxD/mhUh9+FRTCDQ==@linaro.org
X-Gm-Message-State: AOJu0Yyqfx/DvTaifYx46+e2NTjqOrWRKh60YAXxTYWuqpQTR2OJL5x4
	g/dVhqPRWu1A5OpJH/bT8/QKauZ4Uf/QERFy/Hb1lNwPaMMTZSDQn/kLaFThZek=
X-Gm-Gg: ASbGnctCLw84tpYyjtq/Gn7GFidlygb1sRmUEexokU09lrTEKTsy0U/yCemGpoxPT9F
	fohLeHCP47lPR2YbOxmvvTllPaLO2keh91CoCmDq+pB2y+jtI8mnuFp7VjeRCXWQL3n+KYUU99F
	YD1Gk4Idp3qanKU4pUyi6hMTIrOnD1Nbvh3lt7u7gvYQ+8rOI0LoSBGtUdcT6mlAT2Vbdjl7gG9
	2mhm2OAizNtwbn0aGmJ7Pb7pTxwPSGLeGseO1xQEKCnV2/EUCb8jPSV3SuUNGhRKB3N3V/xDUT8
	gc/vXE6ahtnqzfDvPpsMc5PULgD82mDUeO12GJrnob/+QxUfEe2mZTAj4AybKFzC
X-Google-Smtp-Source: AGHT+IGOFC6UJsU6buYjnhgoT0/PLos+jBVFPbbBRktrvOZaJPyBBfGvddUn5CfkJfLeuw0zYftIeQ==
X-Received: by 2002:a05:6a20:72a2:b0:1f3:388b:3b4b with SMTP id adf61e73a8af0-215abb8f2a2mr13495228637.15.1746938865446;
        Sat, 10 May 2025 21:47:45 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.203.223] ([157.82.203.223])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7546b48sm40933275ad.30.2025.05.10.21.47.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 May 2025 21:47:45 -0700 (PDT)
Message-ID: <f7d65908-cd12-4c44-a80a-07e23ff27833@daynix.com>
Date: Sun, 11 May 2025 13:47:39 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/14] ui/gtk-gl-area: Remove extra draw call in
 refresh
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Peter Maydell <peter.maydell@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Dongwon Kim <dongwon.kim@intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
References: <20250506125715.232872-1-alex.bennee@linaro.org>
 <20250506125715.232872-13-alex.bennee@linaro.org>
 <d5a8cec1-f689-4d31-b6bb-b63eaa4ce2af@daynix.com>
 <d370ffec-f430-4377-80bc-323d5087834c@collabora.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <d370ffec-f430-4377-80bc-323d5087834c@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: tTiGz6YfR8Y/

On 2025/05/10 21:12, Dmitry Osipenko wrote:
> On 5/10/25 07:52, Akihiko Odaki wrote:
>> On 2025/05/06 21:57, Alex Bennée wrote:
>>> From: Dongwon Kim <dongwon.kim@intel.com>
>>>
>>> This partially reverts commit 77bf310084dad38b3a2badf01766c659056f1cf2
>>> which causes some guest display corruption when gtk-gl-area
>>> is used for GTK rendering (e.g. Wayland Compositor) possibly due to
>>> simulataneous accesses on the guest frame buffer by host compositor
>>> and the guest.
>>
>> Simply reverting the part of the commit may re-introduce the problem the
>> commit tried to solve, which will be a regression as the commit is
>> already included in releases.
>>
>> I guess the problem is that the gl_block callback of GraphicHwOps is not
>> properly implemented and it is what should be fixed.
> 
> The reverted commit made QEMU GTK GUI unusable under Wayland. It was
> fixing problem which requires very specific QEMU setup, while breaking
> generic setups. The offending change should be reverted as it introduced
> a bigger problem. A proper solution should be found, meanwhile QEMU GTK
> under Wayland should be restored, IMO.
> 
> For the reference see [1]. First bug reports about a mirrored display
> problem were made to me on IRC a year ago and the root of the problem
> was identified only couple months ago.
> 
> [1]
> https://lore.kernel.org/qemu-devel/5aedf1ad-d9b0-4edb-a050-f3d9bee9bccb@collabora.com/

That describes the context well. It should also be described with an 
inline comment so that we will not lose track of the known problem.

> 
> As of today, the GTK problem isn't understood.
> 

If your guess about simultaneous accesses on the guest frame buffer is 
correct, it's a bug of the emulated device, not GTK.

Regards,
Akihiko Odaki
