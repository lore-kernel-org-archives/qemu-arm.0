Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp36585njj;
        Mon, 28 Oct 2024 23:10:33 -0700 (PDT)
X-Received: by 2002:a05:6512:1392:b0:536:553f:3ef9 with SMTP id 2adb3069b0e04-53b348d71f8mr4673468e87.27.1730182233424;
        Mon, 28 Oct 2024 23:10:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730182233; cv=none;
        d=google.com; s=arc-20240605;
        b=Pk1TU7VjT9XT0H2DbXOK2RMTSisAr3YkUWvXAbiL7wNnQJCCtOmnWAvIxM2oI1GmcE
         JSC2B8omi4das5Mp36c1rjeY7mBnJYi1+xxP0tAcdX2DxubKWalby5Cp4RDowXU7EDgI
         cOJjmFGHtsCwF9Irz3t2wg4gIc7FIHIs2WlCnlvlpr4H1wM1Vyvg5GpOBDLdTSce4dkR
         R37wL2ionDRncAtCwSa5ASsDGBfmV83JOO+dtnx4L3xpaxzc0r8nKKmVfP1lbGvYEffz
         yPKLnR9xlWFfHuO0Kt4vDj77EPPVbcX9rSbXKfmW1BWxRG6xXUIzo2oa+E2IOS1bzoMX
         cPgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Bf5ZJ3Rp+VOlHHfOfTZRYW4Yd6YXxuqv3Ec4k+/mD8E=;
        fh=cV0x2MJ9gtIrfnrUMYB6k0QkF3vl+EU6F4WwtejqRuE=;
        b=KHvEPW2MDixOWOpB9jtOvIWpL0cnDhKcGEZ7mMv01zcC1WrukfXOiZ82GD03ZKpGES
         FZ2i7UnWDfAhB4VAt/CKRMIXWHEeziGVcd9w3glaWuB5mMkmn3dNeZtxdlmlaEVVr5I3
         9H0gWyC3QpMeJ80UtlmNH5tBg4GZItBTUcRQ1ShovdrTbtcNpx+ppT9OFe4t1HbmyXfA
         8hHVBU6WfLmAa1CJ6tle+r0xH4NV/hpX6ZNjGCJJaD2DB1/v6qS5OCB8ZpB5sScJAqBp
         oF6i8C43YZI4MxuTvUbCGTZZl6DhCBl3mY8Lt55lCmG7yG8E8qekGAIjs9d9nky3aVZ5
         SaMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zMgLmYk+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4319398c08dsor35125485e9.10.2024.10.28.23.10.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Oct 2024 23:10:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zMgLmYk+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730182233; x=1730787033; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bf5ZJ3Rp+VOlHHfOfTZRYW4Yd6YXxuqv3Ec4k+/mD8E=;
        b=zMgLmYk+iWmBLwFaaNWl0RWezfeY8eHJe+wZhdWkFH6htebO/JUJrmC1Mfq+BHkkMs
         4q9XXkaI+/+XyJKVIa9pENkdP+UST/C1mLwjygP3t8/+wqeL/sjzSj49gRM5FEca28KM
         ZInILeFQZyr5o1yUjnyD64Iuv7PNWCGAmWljpf+yDIdC+ZNPwcS3F7qtpSRREW7llz5g
         SbU7UlR8N6ohTYFac9Z2Cd1/bhXFmBkiCY47JhwFEYPdVl+goGtmcdygiFWWf0HjbhxI
         F2WRk8L5sGzHHOHpjenhJxK2pdk7FIInxj9MV2u6ay/88RLRX6t0qJvoQM9nd8ODyF1W
         S2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730182233; x=1730787033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bf5ZJ3Rp+VOlHHfOfTZRYW4Yd6YXxuqv3Ec4k+/mD8E=;
        b=nHP0z/jteVJoqi8zpzFj5l9GoFwg2frpMsrzTA4AoeV9aCLwgk/h0cbyvJ/oYu2n05
         izUEbpvBGSkPEMIxTJ7ka8PWscysVZ+5p3BhzPAUcRynslG+SIfv/eTPH8RGpinUuvb8
         uTsIzL5fkzkB3hvIBBo1MdKXny1q/65d2KetCBd2xWtb6GAIXuNGdH3NMxka7oQfre0Y
         st/Md0XvsCa2cy6n8aFsHMz7jC4Lhy5yIlH1vMRcB9cYJ1aYOO6oCvaH668njm17MzAo
         /Q3q0R3G4vW+YR/WQi9V+m2ku30a2DcdOHphyaMwZCD/tbs0JX5dKtLkHFVpoBF3XXdC
         s4hg==
X-Gm-Message-State: AOJu0Yx3QcmDXVk+6htBMa4cB0bpDOZpOqxs53bRYa+iyffmTgfAjOFQ
	6zJfdTNN4Hp91Ma04mwRtT776NFqrYV8W+lID5jS37kpufOzMkdiUE9Kz+lFFA3gIg==
X-Google-Smtp-Source: AGHT+IE6EMsJxEdWnnfT7Idx5LZBPzeC4kC3+wlPdecDqtFP2Y8d3f6Y5zcXCquHa5T+I9f0jiPsiA==
X-Received: by 2002:a5d:43c7:0:b0:377:683f:617c with SMTP id ffacd0b85a97d-38061158bffmr8279413f8f.23.1730182232865;
        Mon, 28 Oct 2024 23:10:32 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.21.227] ([90.197.151.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b70bc1sm11560253f8f.70.2024.10.28.23.10.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 23:10:32 -0700 (PDT)
Message-ID: <5b757e15-a92b-424f-96fe-c90900839592@linaro.org>
Date: Mon, 28 Oct 2024 12:13:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/21] target/loongarch: Explicitly set 2-NaN propagation
 rule
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
 <20241025141254.2141506-6-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241025141254.2141506-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 2oKi2ZlBI7q7

On 10/25/24 15:12, Peter Maydell wrote:
> Set the 2-NaN propagation rule explicitly in the float_status word we
> use.
> 
> (There are a couple of places in fpu_helper.c where we create a
> dummy float_status word with "float_status *s = { };", but these
> are only used for calling float*_is_quiet_nan() so it doesn't
> matter that we don't set a 2-NaN propagation rule there.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/loongarch/tcg/fpu_helper.c | 1 +
>   fpu/softfloat-specialize.c.inc    | 6 +++---
>   2 files changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
