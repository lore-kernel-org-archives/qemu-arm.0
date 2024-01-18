Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp402261ejg;
        Thu, 18 Jan 2024 08:56:27 -0800 (PST)
X-Received: by 2002:a05:600c:6555:b0:40d:917d:25f3 with SMTP id dn21-20020a05600c655500b0040d917d25f3mr716188wmb.25.1705596986891;
        Thu, 18 Jan 2024 08:56:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705596986; cv=none;
        d=google.com; s=arc-20160816;
        b=ujpa6Y5FtLOmbtsblYAqCKEW7buxYRa7ifcuWDoJi+29nSHRgdJyaIe7541aoeaYWJ
         nK6ZuQ2h0sC4qVDBim7QZZWQ04WUq0ugye3uPQ15OHyLanX8hmV5jawXvx0klNW1o+iP
         OgyJimz39fTWglDu4SMUI5h5G3PBiyZoP9Wuy3IFCiYke/eTsEGzmT5N8g92JjHzX/ll
         ZN60SLhcbiBcqVB12xN3NnYgc7piknO7ki8H2E49R5ukGKgaCDjPj05KTbPQSxQr6zAn
         7563OTbRTCS2jv6IELQIpKX+2Bbr4//y5iA8DX1F8q58GhYDtMsyBSlDWi6Y8/NMVBAf
         N66Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=JRiAuIR7NslMCDA6HVVrOEfiS5lwAHj4frCfOgvKbvA=;
        fh=vrC/h28SPi1cRBWZ3sYUN1zf943pPYjSe8iWSUfoQqY=;
        b=NBic+wsmOIp7BZ0W41eEWF4OtSKTv9M/IuQnabxl5SqhCtc8b7cv5rWxcAYb6BhsS/
         2ndfyHq7eKrkjzE0vCJFLzYisGzOt+v8URrA70taf9z+4xr7Xr5dm987bsCrgGLdFGYg
         hq3hvCaXv4y4mVu1dOtq/wOb+nySCiNzWTF84rFVNSGI7PDsw1WdFYV5R8ZbqFNt4y+W
         N3uyT+l5sOvtDgCM57X1CnKiQnaMAUCDiyjCeZdagVtZ1xsr+L88RhPfmyNLj2GjRdGy
         ld85FoQmAHzpQlAlMd3uTHpWgEzHbemnMRsfPHOwR1a/JhMlbzFykGPYej2glQ44Up8k
         lfuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w+UEmTar;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id fm8-20020a05600c0c0800b0040e96fe6c93sor125174wmb.9.2024.01.18.08.56.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Jan 2024 08:56:26 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w+UEmTar;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705596986; x=1706201786; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JRiAuIR7NslMCDA6HVVrOEfiS5lwAHj4frCfOgvKbvA=;
        b=w+UEmTarKbtK/QidyWR41Fggmk6U5/N5g/FO4t8oWCpmkKEdIBPK7DM0MS2RWvqkJS
         Tot3Yo86zRkafazhMAN8BRIM2jVmccoJBRQi4hllOHFsHBC9Ltarry9NhkAefrINKcCc
         /cCSYD6wwYaIZRYdO/oi3mWimpjIGzAw7ojRbT4sEuublFjcjgZ4ddJKtp8JUKbfmoce
         Sz4DZmuZkih3NI/ZwMr5dskRbsxA7tDS1AfbpU7o5s42kfZNgvcZExwun+CdIsFaa2D+
         JhXSrAYGcLP3s026cGFh6RO0K2BeV2P6fLshh77gejPoHFT4YO6heUkX3idL/bL1xb7w
         UbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705596986; x=1706201786;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JRiAuIR7NslMCDA6HVVrOEfiS5lwAHj4frCfOgvKbvA=;
        b=fh0lrHJU0YXSGgX0R3SDzdPVujGFfZmK8Gbf/ZHG5+SbjMdi+Qi0IXMhvoIGrVEijd
         WD25fQs7VXqBKcY4BX8GBoyLMOZ+XveO9PyZMqEjqV3nn2KbfytJHx0x1o/82EhtvANI
         V65TYbZdZAvNSF4B5H5bjVw8cC10zIN40kWsF6dom684YiiakrImJtATHehJ1dvkuFG/
         4ysx5qCEkqienWP/2v19FsUgjWlES+25GVxyl8T0dXbYLF0Z/ls4P20GqpHcSCoc64wI
         l2+xDPiAbeoz1hFslXe7cH7Y5Lne1nyTJF8J89PyCkvZZXR9a6lkksBB5rPGX6ZUWD3D
         rJWw==
X-Gm-Message-State: AOJu0YyjfjRhI+04zMo8a0HbvqXZHk5AWo3/6hCLZvM/TbgZmgbqcTuY
	iqGs/IrxxLHoaQBbC++J1m8jFe0lVAcKa3Uy5+VNuqpjIbwLZYHK/J4rBbaXNOymAA==
X-Google-Smtp-Source: AGHT+IGkGlsZM2o/2MILFi8ImEAVlInhnyIhIF3IsWfY8Ba4QR2uERQ1JybXztSkMPuNFLEIvbCkOw==
X-Received: by 2002:a05:600c:46cf:b0:40e:5118:5046 with SMTP id q15-20020a05600c46cf00b0040e51185046mr703538wmo.21.1705596986462;
        Thu, 18 Jan 2024 08:56:26 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.76.175] ([92.88.170.175])
        by smtp.gmail.com with ESMTPSA id l34-20020a05600c1d2200b0040e89ade84bsm5893971wms.4.2024.01.18.08.56.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 08:56:25 -0800 (PST)
Message-ID: <f134d01c-603a-4edf-ad47-f6f2d5a7bc57@linaro.org>
Date: Thu, 18 Jan 2024 17:56:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm/virt.c: Remove newline from error_report() string
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Thomas Huth
 <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20240118131649.2726375-1-peter.maydell@linaro.org>
 <1f34e941-5b0a-4091-95f9-0d0c8e302aa9@linaro.org>
 <5531b75e-86ef-4543-b62a-1457666d9585@linaro.org>
 <CAFEAcA8hfdZAkCodJZHxuOF2YAnKp=XR2_SeezJkcyaCAHOMaw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8hfdZAkCodJZHxuOF2YAnKp=XR2_SeezJkcyaCAHOMaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: OWXS35tvvCYC

On 18/1/24 17:09, Peter Maydell wrote:
> On Thu, 18 Jan 2024 at 15:30, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> On 18/1/24 16:17, Philippe Mathieu-Daudé wrote:
>>> On 18/1/24 14:16, Peter Maydell wrote:
>>>> error_report() strings should not include trailing newlines; remove
>>>> the newline from the error we print when devices won't fit into the
>>>> address space of the CPU.
>>>>
>>>> This commit also fixes the accidental hardcoded tabs that were in
>>>> this line, since we have to touch the line anyway.
>>>>
>>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>>> ---
>>>>    hw/arm/virt.c | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
>> BTW there is another case:
>>
>> $ spatch \
>>     --macro-file scripts/cocci-macro-file.h \
>>     --sp-file scripts/coccinelle/err-bad-newline.cocci \
>>     --keep-comments --use-gitgrep --dir .
>> ./hw/arm/virt.c:1775:38:"Addressing limited to %d bits, but memory
>> exceeds it by %llu bytes\n"
>> ./ui/gtk.c:1094:56:"gtk: unexpected touch event type\n"
>>
>> We could run this some of these coccinelle scripts on CI,
>> as a new job in .gitlab-ci.d/static_checks.yml or extending
>> the check-patch job...
> 
> checkpatch catches it, if you read the output, which is
> how I noticed this in the first place (I was originally
> touching the line to fix the tab damage).

Ah, no need to waste more CI minutes then :)

Thanks!
