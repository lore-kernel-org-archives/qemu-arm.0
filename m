Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp36714njj;
        Mon, 28 Oct 2024 23:10:57 -0700 (PDT)
X-Received: by 2002:a05:600c:4708:b0:426:6308:e2f0 with SMTP id 5b1f17b1804b1-4319ad024d7mr103948655e9.26.1730182257427;
        Mon, 28 Oct 2024 23:10:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730182257; cv=none;
        d=google.com; s=arc-20240605;
        b=huDGL5dTR4xcCTrur0qNJ/AmvNabdc6rVqM77ildjXjuBkGcon29yGAmDhB/j80th9
         FJ5vBer3Y6/R9WMWnq6glJw9eR7knBx8024ycxhAqkbOKk3UYVfCItS73ECw9R9O5nfB
         tn3x0n1dxP7cHxvCbiSRZwKPKGrVK4WLEfAH5c6lMWoKW06PgjKbdtzjZPiVSPU2w6/H
         hIy/ABg57KHhp+4f7Zr+7pggx+z7yhiV/UEa/8r1bWNuvh6jNcrEsgdgvNHAnbnbp3CD
         1pI+uTEne9glW/t6QKtm33kODU9uGJB/kWSdDyiUHSAJhXeVqgB1h0dIbxF/LZFSI/T7
         ytLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Vs7nasybbX7ls6pt1vDzRGbzY5szh6TT52y5XwKAnFk=;
        fh=cV0x2MJ9gtIrfnrUMYB6k0QkF3vl+EU6F4WwtejqRuE=;
        b=SgVMkrOFk2v7YT4UMoJC42Y8sKx+/dtNl1XE8RMmYTO9zpUOfDMSjCSoAC/8dQRLnp
         1rg46Qtqmr/pyZfo+mFQilgbi3hyNFgtQHLe3mxI4bqzGr2JZU509HsBIEsFABFkZI7n
         HDjNwIOWmRBLlqijrkbgq+R3HTmWhs1hB/r83YSbLREUPZ5oMBOPkW2r7mgOaGOOdGKz
         dZc8rje/MgNB7D52j1xQxuO9bQD3HtyDKPKAGMFc4nEu2Oj5kK6xue8q0jLCbFugqipw
         FOebwnFIF5eWtAqK8ubmPirScbE5jAjQBd+f054v7fcW83nUtUAtflPPaiLnxYD4dCkR
         mLYg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tZWh8Dgq;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4319390101csor36561105e9.6.2024.10.28.23.10.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Oct 2024 23:10:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tZWh8Dgq;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730182257; x=1730787057; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vs7nasybbX7ls6pt1vDzRGbzY5szh6TT52y5XwKAnFk=;
        b=tZWh8Dgqqeox29SJRSqK2maA0xxCxc668kgL1J3JLTEl9S77ZCxDv2HDk0QOoec2r5
         SWdwgTinM/pXaOL5K4x4qZfg2QC/vFrTHi8TQcsAaIAfpFOF8sDG/dbEGPsuyw4dyCCF
         y3YhXIhGhz/w0numFQp3BEtStlV92uBA/Rm0OpufYox5415BNorqE8zABCM4qDanBvn4
         QAEJKK2chbCeMV0rhPuYw7ovAqAb6iFDf6p4IG8hJjtzt0XgrFgS4kR56GlEJQt+7pHP
         /1uzYUr/lvhmjzd7zBUCaqGG/zyKczagna/tXQMHKqa7aKGl3tRP/maNlvcienEGE169
         X0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730182257; x=1730787057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vs7nasybbX7ls6pt1vDzRGbzY5szh6TT52y5XwKAnFk=;
        b=EBJrkkUsTa2/NvqAHVqce2L9EgvztNT8yTSiZFJqJasrvUT83UDz87OG2rFGQSR8b4
         qzrQ9IMVLGvXWCbRz32vrJkvudgs/icEO5f8R5gI+b055h4cce5kZ95A5MN6NrP8kE4H
         PbGvcmhB53iQIFDLFA86Z9qXn/uDtR/AEMWqEEt+MH4KSIZnKZuOs5xUYpnDolJiGg8l
         mV4yRB84JvHErfR4rPKtG82Rt3+vspW0TbhAL1CYtyI2Yzve12LcXnbzrNSpp9yl0XtR
         xe/+JHmSd2MV7OYhe2gyqenIMRZ7VbjsjcUwMIkfwI2Xwjb74ANGqOq1qD2FSUvLHP6X
         vXmQ==
X-Gm-Message-State: AOJu0YwKbIGlXOEqGy/IIZbCGzguxv4mXTeenCzqqBP/qAkmFipFoIMb
	mlRLjqtt1plot2VcvUndE7Pilo6vIdIkAkZ4OIHWLfUqO1os4qYfEVa6x/0F8m7Wpb0foX5BI9N
	o3f2efg==
X-Google-Smtp-Source: AGHT+IF//bT0LVXj2kSSkPbfeR4r1Hvob0c7rviyW7x51yDzFgNZrfk2lCsSnPc3y2bKfJaP94qSBA==
X-Received: by 2002:a05:600c:458f:b0:42b:a7c7:5667 with SMTP id 5b1f17b1804b1-4319ad02659mr89169725e9.25.1730182256877;
        Mon, 28 Oct 2024 23:10:56 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.21.227] ([90.197.151.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431b45aa058sm12150405e9.1.2024.10.28.23.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 23:10:56 -0700 (PDT)
Message-ID: <e38214df-2ef9-4bc7-8f23-a29c0b01913f@linaro.org>
Date: Mon, 28 Oct 2024 12:21:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/21] target/xtensa: Factor out calls to
 set_use_first_nan()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Eduardo Habkost <eduardo@habkost.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
 <20241025141254.2141506-14-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241025141254.2141506-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: j4AdTeiz0W+E

On 10/25/24 15:12, Peter Maydell wrote:
> In xtensa we currently call set_use_first_nan() in a lot of
> places where we want to switch the NaN-propagation handling.
> We're about to change the softfloat API we use to do that,
> so start by factoring all the calls out into a single
> xtensa_use_first_nan() function.
> 
> The bulk of this change was done with
>   sed -i -e 's/set_use_first_nan(\([^,]*\),[^)]*)/xtensa_use_first_nan(env, \1)/'  target/xtensa/fpu_helper.c
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/xtensa/cpu.h        |  6 ++++++
>   target/xtensa/cpu.c        |  2 +-
>   target/xtensa/fpu_helper.c | 33 +++++++++++++++++++--------------
>   3 files changed, 26 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
