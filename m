Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp243476njk;
        Tue, 16 Jul 2024 08:13:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWT2dUjTEoGpAwH9DntmQysvkzM9xYe+3DaS5s64vKNO09yElv3/luq1N/kcThzwS1iRY0KEVj8YmTEdS/uyKsOYK5jFvki
X-Received: by 2002:a05:6a00:1407:b0:70b:a46:7dbe with SMTP id d2e1a72fcca58-70c1fb6652emr2614354b3a.6.1721142838224;
        Tue, 16 Jul 2024 08:13:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721142838; cv=none;
        d=google.com; s=arc-20160816;
        b=qPxZpwcglupHTwtsKBCyo0MZe1HIQ1qn2zFpU/0rdZTy2qEC4n6oGlxsjWxpgpy1OC
         VH4Bri9Hi2g7mu4fwITANkQCJr0cYTHcHuaicZBT5gN8vV0s2OO4r9MwgQOz/LV6d5VJ
         32qjXfSUH6Tut99yQvsGdlQ+86VIicjAwedl6sG93T/LAAeY9x4nmynRcyeyC/xfZBjG
         hJrTEXffENa2LSk8gYrPjgan84Ejmitw4HL3TPNbidylEebsnBOJE5Hir1SoWl07fLEX
         768bafJpYw1mVSoUZwcd3wcB9vBwU/EEd9dA/whuY7GFCWK6X9BY1Y9IQ3uDSUnjPWV1
         +Ocw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=LxdKLwiszjoWg7E5lJOQHiqf4Bh0YUwQE7ZoZ+voD+g=;
        fh=hwepQjVUWsvDUvu9eQLv3tigf8wuw86wk+VsI69EiWc=;
        b=NsNQo8AAuCgQtvjtFNYGZMkGpy3DChxS3RalFmMph/Ths3x6QcXbjEKGlsgjVwbOX9
         W/lhWg9aUeCFsJrEH+EUCNa9XBkvr1mukgnrJITPuy8tyoNvJBbn2Piobchwj72U9jcJ
         QMQl7+MXCO5q57XS2L/KoEXI9wtkVm+MA9okFwkxQKCsdzNj3zAvUKLVFe9SsNNnD+pq
         DWIqNldZ5R4zqkkeUWhYBVuRQ/qB/8uKnKwmBjeMIB3tJB4d0gDpSk14Z8iCGQE4Zn+I
         qjEATECCehDDNnCzd8msEla3E/9gcVdnUPhiZLeb9EiyDAxKRsUDurrkkEm585MS0rl1
         GqMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UFtPmExo;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-78e374899e1sor2230657a12.4.2024.07.16.08.13.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Jul 2024 08:13:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UFtPmExo;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721142838; x=1721747638; darn=linaro.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxdKLwiszjoWg7E5lJOQHiqf4Bh0YUwQE7ZoZ+voD+g=;
        b=UFtPmExorChiX6ruBorpZ2z2VcgCZmOJ/Mnvd5uT3Py2OeCbejtSCAJ4O/9U8gunji
         G1HWQ/k0lvtvI7tItQmPP/daH05O1mnaMnZUTUKTykqUgZBE/Os23z/sgqoUdkvWQCFy
         HbCwYCEYy2eqGPy4ZzuILSHtlJ4jUIinOUW3Xj/3CYKJD5PtkGalX7AAmZsfsZrcHHOm
         22h8Dor7oYI7cu9YujHTyOtW65/n3jV8GJjuASh6gZVgDtR0yUXsUK9/0UntXRirVfgY
         Q5Mc3V9xe6c9keLHEZuB8ppMV9jntAdF7GxoP6YEkfImTEpS9QYlT16gdE7iDWft6gxJ
         L5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721142838; x=1721747638;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LxdKLwiszjoWg7E5lJOQHiqf4Bh0YUwQE7ZoZ+voD+g=;
        b=VdEd85Nb+zjx5sQto8inG+A7MvMwxIT0gN9z4I+0qXXidNt5XzPo37iy8CIuyMle6B
         DWInzI4xlsbP102aJWHQPrLnC20Zzr2qXEgkLa6/epkiVkfxr/agMXBzB6fdbQA4H/43
         8e918yl3SZqhxsGBncWHFlNtDbn8XzAQB2fqow5mL8DA470t9KPPaNJNAURBOqmb6iQP
         +Iv0qjo2RK708oma+l7daQZ/sGWxh4ic3L0hZFpued/QIzKTq280TiCs17tMnCHsgXS3
         m5f34c/JH3rXUICBBYEBwUH/HzsauphmIOyA7MYVz3xUkx8K8TTkz/NZtxAbh+y4TcVs
         gP8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUM0VdfxjXg7W7QtDc+anM02fAIQZXF03etGCORSy3dV458/L9TfUw+PCq+mRKzmbI8O84lCai5Mvje0BKE8bp+AzATx+Bo
X-Gm-Message-State: AOJu0YyH/hODdZ52c73HY+ZtSITBOOkGtGRaaD2u1gh3Km31fuYCE2Pk
	6FyS/uaQUb//6vFhuX5zlkD0igZFP9G6R1FJnnhY5KDcPo3nzo08C6fkj7WmjkzsmQ==
X-Google-Smtp-Source: AGHT+IGnNrEKD6Q5Hn3VFNNS2UoOXEKZsuX2yoRfbjmrSOKF1x8tocdHohmYAdbqA+41ZaGj7D1lNg==
X-Received: by 2002:a05:6a20:2589:b0:1c2:8cc4:908f with SMTP id adf61e73a8af0-1c3f12b3814mr2997985637.48.1721142837676;
        Tue, 16 Jul 2024 08:13:57 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] (201-1-50-128.dsl.telesp.net.br. [201.1.50.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cacd706349sm8400448a91.57.2024.07.16.08.13.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 08:13:57 -0700 (PDT)
Subject: Re: [RFC PATCH] gdbstub: Re-factor gdb command extensions
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20240716114229.329355-1-alex.bennee@linaro.org>
 <b9690162-170e-1f74-f148-0642a8503002@linaro.org>
 <87plrdh2i3.fsf@draig.linaro.org>
 <CAFEAcA8+KXykmmk_4BU990kj3nY4xfr0zn2MtM0cYTuhNnsWtg@mail.gmail.com>
From: Gustavo Romero <gustavo.romero@linaro.org>
Message-ID: <1a40f484-18bd-c452-fbba-4e59e2b07294@linaro.org>
Date: Tue, 16 Jul 2024 12:13:53 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8+KXykmmk_4BU990kj3nY4xfr0zn2MtM0cYTuhNnsWtg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: IlmuMpHVn46G

Hi Peter,

On 7/16/24 11:09 AM, Peter Maydell wrote:
> On Tue, 16 Jul 2024 at 14:48, Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>> Gustavo Romero <gustavo.romero@linaro.org> writes:
>>
>>> Hi Alex,
>>>
>>> On 7/16/24 8:42 AM, Alex Bennée wrote:
>>>> Coverity reported a memory leak (CID 1549757) in this code and its
>>>> admittedly rather clumsy handling of extending the command table.
>>>> Instead of handing over a full array of the commands lets use the
>>>> lighter weight GPtrArray and simply test for the presence of each
>>>> entry as we go. This avoids complications of transferring ownership of
>>>> arrays and keeps the final command entries as static entries in the
>>>> target code.
>>> How did you run Coverity to find the leak? I'm wondering what's the
>>> quickest way to check it next time.
>>
>> Coverity is only run in the cloud on the released build. There is a
>> container somewhere but I don't know how its used.
> 
> The Coverity cloud stuff comes in two parts:
>   (1) you build locally with the Coverity tools, which creates
> a big opaque build-artefact
>   (2) you upload that artefact to the cloud server, and the
> actual analysis happens on the cloud
> 
> The container stuff and the integration with the Gitlab CI
> is there for the sole purpose of automating the "local build
> and upload" steps. You can't do an analysis-run locally.
> (Well, you probably can if you have the paid-for commercial
> version of the tooling, but we haven't got any kind of
> setup for doing that.)
> 
> We only do analysis runs on head-of-git because the Coverity Scan
> resource limits for open source projects give us about one
> complete scan a day. So this is all "after the fact" stuff.
> Developers who want to look at the scan results can create
> an account via https://scan.coverity.com/projects/qemu .
> Triaging new coverity reports is a bit tedious because there
> are a ton of false positives...

Thanks for the explanation!


Cheers,
Gustavo
