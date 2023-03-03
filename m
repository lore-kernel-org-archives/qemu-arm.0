Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1193798ejc;
        Fri, 3 Mar 2023 07:24:28 -0800 (PST)
X-Received: by 2002:a2e:1505:0:b0:295:ba28:a42 with SMTP id s5-20020a2e1505000000b00295ba280a42mr1552820ljd.20.1677857068003;
        Fri, 03 Mar 2023 07:24:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677857067; cv=none;
        d=google.com; s=arc-20160816;
        b=pwxtXZ0CRYQmXLtPrARydhyoNctXaF26zvgb0w2Plma3lWr+UCmCvyC3JKtl96Ps70
         tcsX5hxBx5WF2BzzWkQeibJ3JftN9a9tklV/LCft+tdXa33+6UtRtBZC/XFt/irlNUbx
         4mqLDa5ii3DfNr7NepJWErbEa64X43lpoaufAkV2q2jh9c/CKxXHWf/LudvygW8mlfLu
         hLqu/J2Up9ZhTZvbuF1+TTaxfksgD8JfP8Jy9gViZnTmKxNSa5+11IeU1dt55Qm19y/G
         0AFIo+RHKwTQHvZeV5mKp0pBZ+3P9Z7EnOFOhmpFCz9IlWWxb/rhdKNsQP1LF6ozO2Pc
         Ug1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=+nq9aiHykai5Duy7gY8qa0DAFcNCmGsD2HIYvCEEajc=;
        b=w/ZJZjme45jOvEVCcHc6Qrc7t7eT5B4nrtVYKUbJXbVp1qCLQ1XuWhj59QEYDLEu4l
         Y6xsYHcvOglTlw/L+fEwxSBNOcAMfPXBe/CxhfKy/10ANBcwbQGdJ3mh9W3BibZgEJE7
         qvqWxrSo2pkrE9lWdigw5c0HqujGXHtvoqdA2T10W2bdVXlRifohX3ZjRjNchqrgBf9F
         MZW1xHQYC2QlDiFXqsp7sdgxiHojj4CzOqquqEisc8nC0o+0WRjji+QapVfwcjaiSv82
         7faI6t7FwW6riSJPkaojR/CqMTir5pgj7+0wL3vPqNHW6b0WFHpWkcJIvE6pAS+E0T0Q
         skkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KRC/aYII";
       spf=pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n15-20020a056512388f00b004db44f782adsor541486lft.54.2023.03.03.07.24.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 03 Mar 2023 07:24:27 -0800 (PST)
Received-SPF: pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KRC/aYII";
       spf=pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677857067;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+nq9aiHykai5Duy7gY8qa0DAFcNCmGsD2HIYvCEEajc=;
        b=KRC/aYIIihD3pys5vhrqxVFdDChWUVe2dipUDWJkMHVHUYfmLXDWcqkC+Bj4UI0Q6W
         W6YLwIV8ULvDaTQzXA/BIEExETPQtmSnc2FIgU7msKPBKqzIgwFNsxf1HaODahnnMnrO
         bgAE80FFVwuRmy+iOFl9CLEH0n4Z3gWG9+lugBz1n1d5dOrD6mTGBLEqs7oXKZafzI+T
         jOhrg0lHOMWZuhOy+YRUEwJWD0vMWkVuBlFdoEzQGIiau01wdVdMrPT8eU0f9qidxMLf
         0/hzGpv1Kt+oh/zflunXZV+oaFtLbFbVPjL+ynE9/rxC1DEIHsTeUCrMdmJyFphbNiUE
         K5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677857067;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+nq9aiHykai5Duy7gY8qa0DAFcNCmGsD2HIYvCEEajc=;
        b=lD2wThzUJ8+4HxV4m0rdHkK52W8hyXZHHHUq6VbGuN1WnnvjKckji2Hb3+inr2Yh3e
         eH+YSSy3qrVlbwr1qISRu3m2SOxwsIOW4t4370nFUC6nH6f7/kBgCmdFmsEUZ/iG/gvS
         9SvXH7OGzaRGREIO9zfGwDakWpwnNis2dywsuE9rbJ9pIc6aC+RvvOZSXS8oaqkJoCg+
         iXPHwwOXeeQSLnNRTxjDi5i+tZ7zkkgAYNh2aKs1n+YWdmmhA587tohZE0Y9KkCvpWyk
         8T1AaakedYfns7pwfVnyazMAkwkFzX5vLdjU/57BB+UsPkjD96vie8gA4advabRoAwE1
         fv3A==
X-Gm-Message-State: AO0yUKX0Ol2arJyTQzz6V2wJpUq4phk02FNuxK3PkT5PihSpkorfc4aN
	iduewmORwzJdziu4jSxbMHsKNdxgRAA44NRuOAJPlA==
X-Google-Smtp-Source: AK7set8MHetM6xqQkTAxa5K8cEe5C+tHzpDE+d44NZYjwi79cmuczO91CqN/141kABgXS8dtuiKYCA==
X-Received: by 2002:ac2:593b:0:b0:4a4:68b7:deab with SMTP id v27-20020ac2593b000000b004a468b7deabmr620232lfi.7.1677857067414;
        Fri, 03 Mar 2023 07:24:27 -0800 (PST)
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from [192.168.200.206] (83.11.36.13.ipv4.supernova.orange.pl. [83.11.36.13])
        by smtp.gmail.com with ESMTPSA id u17-20020ac25191000000b004db3aa3c542sm427616lfi.47.2023.03.03.07.24.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 07:24:27 -0800 (PST)
Message-ID: <5759b40d-2f61-ea0a-f6a5-368aa52441c0@linaro.org>
Date: Fri, 3 Mar 2023 16:24:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/3] tests/avocado: update AArch64 tests to Alpine 3.17.2
Content-Language: pl-PL, en-GB, en-HK
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
References: <20230302191146.1790560-1-marcin.juszkiewicz@linaro.org>
 <87mt4u9itl.fsf@linaro.org>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <87mt4u9itl.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: nFHsL2Dpr4WQ

W dniu 3.03.2023 o 12:24, Alex Bennée pisze:
> 
> Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> writes:
> 
> Next time please ensure you have a cover letter for a multi-patch series
> as the various bits of tooling get confused without one.
> 
>> To test Alpine boot on SBSA-Ref target we need Alpine Linux
>> 'standard' image as 'virt' one lacks kernel modules.
> 
> Is this kernel modules we will need for SBSA "hw" choices?

Yes. Virt image fails to boot on sbsa-ref:

   Booting `Linux virt'
-console: Mounting boot media failed.
console: initramfs emergency recovery shell launched. Type 'exit' to 
continue boot
console: sh: can't access tty; job control turned off
