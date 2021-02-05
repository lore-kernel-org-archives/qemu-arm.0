Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2228429lfo;
        Fri, 5 Feb 2021 10:05:30 -0800 (PST)
X-Received: by 2002:aa7:cc98:: with SMTP id p24mr4878225edt.126.1612548330291;
        Fri, 05 Feb 2021 10:05:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612548330; cv=none;
        d=google.com; s=arc-20160816;
        b=zMnZHRE5A4+XRGiwtpdeZ3W3Kr14YIXmfmEbsbq5K1nHlAvw+w2Z1BFqeJtTzoFDXa
         5xKRyZAaJERwKQsdY1roThZa2Q+nhZblylvIut2iInIHX9TaxdXkkUvEWmbIXba53prS
         TQygVmDG0hJ8k4vz6tbPQDRaVHADayaBHOjXTSPimwBkkUeeTP3Nu2DE5vXKFB8Zfyka
         Zf8qjGeXKjlccvfdXKQ9GdEAaQzZjcZ7iuc7BV0IxFcrGk3e83Ina7dBs/yIqz5xhdB/
         ZBnle2tgnsO0iQrNEe0STQObVY4CJtoDpXQbsRkFZKZBWnnp2YmesGEmyPW0JzlCUGEg
         /QhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:cc:from:references:to:subject:sender
         :dkim-signature;
        bh=bKZtXOGrUV+huIokx5vWjxW5/cJu+3tmYrHxLXL3uEc=;
        b=mz9VhQPkSOZB5xvgUlaANaMCXxTlcEuetDMNtT75ij1ZaePuHe6RMcPcERtJYZ0n6B
         LpVuXA0TcXZnZ2CvOfPHWuXpKP0lGsEsE7CDgJ1DNVvTwjaCVw9RMRC/rePCvOzA7rSR
         KabCp9FVfOJ9KWbuThnsFG/pXxE+7O6Ekg7CbZ3/6eLSQbNZlmdYTqlkGqh81QpU2wQP
         jo3j0HvkPNqjGSczgHTCBiy4iXtPKWAXnJbwWd4KBCvPm5bdNBLLevAC8fYkGT2lcYD6
         ucuzY8R+IdTiLvF9lJ4xX9dQ355dGJMEB2yS9X4OQLVdNADnBZ+Hsmur7h7xcaemDn2a
         tqkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=uBRAgKBL;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id du20sor6389403ejc.15.2021.02.05.10.05.30
        (Google Transport Security);
        Fri, 05 Feb 2021 10:05:30 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=uBRAgKBL;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bKZtXOGrUV+huIokx5vWjxW5/cJu+3tmYrHxLXL3uEc=;
        b=uBRAgKBLKG82ZhLOik6lRqbTxpkqG4AJeNW3m7GtRHuT6ZE5F42YXU6mEUR7FMJudB
         O5rzuz/fpkQzji5USa57sQlUHiJpehjR9AkcVDQal7o8gMnlKZZQ5zdVRTpSX9KeXNpv
         jXOFIvJhDcTdB2OJkbXXJfHEdwFMJVqJ6ABSmnmExzhsv7JICQNoVyFLQjGpCzbhKg1N
         CrDy0t29d8+kPoJAywIdPC3g3y+9xDlRmbBOVL5Tw0ZoXRHSh4vFu0EyEXclFpjYfv0s
         SiRQMkq3oOG3LlQ8wav/t514keitsZ8adKDu13hkm5RyHzWCTAPumNadWxKKbqzmA7xg
         eUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:cc:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bKZtXOGrUV+huIokx5vWjxW5/cJu+3tmYrHxLXL3uEc=;
        b=hHEhW3uSHNz/1YeEAj+71kVjptJpsXxbvno8r8ty+s62RLg8f2wMSGN8StHrpIUO21
         qjLrP/RgZoRV+oZKG3fW1bJuNB7t7i1nlhvmMBhbzEBeabbIvqKCkyd5/86Urw2Nw+Hp
         eqPkmhS3w+oIN3zDXCJ8Dnw5dbTeIKmTDhClDe3dl4eFmbyajSqbzIyvZngSEjx/DCCD
         aSLpBdcjKCRsM6MDCi+HlynadhEytYWjrqZKPE5atleGgRDv4HNajR+pu9IHVYsmkUhO
         L2H730Kyz8nWeYM6jEp9qofwmtxirsQ8mSyP2qxiw7D+cN1Fia9N1vfDiUVVec++Nld6
         DleQ==
X-Gm-Message-State: AOAM532q9/Gw+GR3kFWxSDVkYrAKhtpMwnyikaYU13a9yytYtD3tuUYu
	Txkik6DLMy3nAby6kmolGl0=
X-Google-Smtp-Source: ABdhPJzl1eFZ19eOnxJpjcAN7T7Bu7Ml1Wrcdy8ATgaCIc+wA8dG/mvR1NNXizyaCJmwO1QbRs4Eyg==
X-Received: by 2002:a17:907:9483:: with SMTP id dm3mr5118892ejc.120.1612548330004;
        Fri, 05 Feb 2021 10:05:30 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id j5sm4332446edl.42.2021.02.05.10.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Feb 2021 10:05:29 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 00/24] hw/arm: New board model mps3-an524
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210205170019.25319-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>
Message-ID: <7d4db6f0-1e11-afb1-2b58-2e115a0a2dd0@amsat.org>
Date: Fri, 5 Feb 2021 19:05:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210205170019.25319-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: M8Ag5mezQLRY

On 2/5/21 5:59 PM, Peter Maydell wrote:
> This patchseries implements a new board model in the mps2/mps3 family,
> based on Application Note AN524:
> https://developer.arm.com/documentation/dai0524/latest/
> 
> Like the other MPS models, this board is an FPGA image; the AN524
> image is based on the SSE-200, like the mps2-an521, but it is
> for the MPS3 board rather than the MPS2+. The major differences
> are QSPI flash and USB (which we don't model), and support for
> 2GB of RAM (which we do). Since the MPS3 is very similar to the
> MPS2, I've implemented mps3-an524 as a subclass of TYPE_MPS2TZ_MACHINE,
> sharing most of the code with mps2-an505 and mps2-an521.
> 
> The motivation for this model is two-fold:
>  * Linaro's Zephyr team would like it, so they can test their
>    code targeting the MPS3 on QEMU
>  * It's a useful stepping-stone towards a future MPS family model
>    which uses the SSE-300 and Cortex-M55. All the "make various bits
>    of mps2-tz.c be driven by per-board data structures rather than
>    hardcoding them" changes will be needed for that future board model.
>    This way they can be code-reviewed now, rather than making the
>    future patchseries even bigger (it will be pretty large even so,
>    because of all the "implement SSE-300 model" patches).
> 
> This model can run the parts of the AN524 selftest image that
> would be expected to work, i.e. the ones that don't rely on things
> QEMU doesn't implement.

Yes selftest are annoying when emulation :) Lot of features important
for real hardware but we can happily bypass when emulation.

> (The selftest is part of the AN524
> download so it's behind a EULA click-through and we can't put it
> into an acceptance test. We might be able to get something
> based on Zephyr or Arm TFM.)

Wondering about that... If anyone can go/click/accepts the EULA and
download artifacts, then I'd like these tests to be committed to the
repository, with a comment containing the download link, and the test
can use the skipUntil(BLOB_PATH && BLOB_HASH) syntax to assert the
binary I downloaded is the same you used for your test. Then I could
run locally:

  $ PATH_TO_EULA_ACCEPTED_ARTIFACTS=~/Private/DL avocado run ...

Would it be acceptable? What is missing or should be fixed?

Thanks,

Phil.
