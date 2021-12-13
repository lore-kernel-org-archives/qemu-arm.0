Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4084705lfk;
        Mon, 13 Dec 2021 05:01:22 -0800 (PST)
X-Received: by 2002:adf:8bd8:: with SMTP id w24mr31872663wra.540.1639400482734;
        Mon, 13 Dec 2021 05:01:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639400482; cv=none;
        d=google.com; s=arc-20160816;
        b=Q2aBT16WhHT7EZYwYin0PB4tSnkE+lHcI0KvNLsOuP0moJkTs7TWffF9JeDumHkxTB
         m8VD7cilIPhu5qAvujMUNNPU99eOxerUsZ07PeN/4yxdH0Ayov1tAnU+oxtbc/agzTJu
         Q/2//nKSaxs0Gee9SjRjiAhdYciFdnKXGBERVH5YVz+eU2O94kOTZ3ptMk+HZqk7I8n6
         eVefF9NEZ76iQHh6dfm14bt5v9AZre6aWCqGJsu429WJNnSRZ0R9uhAe7ZWVEyCcRWaA
         u+EiK8l5Kj8HRY2kjhVlDINCo+XG2jYR/sJ+Fz8BO77rYPs+N1lIii8Nl4VTufNjsRPj
         dshQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=Csu36sXR6qEuaYGpzFmdSiJPxadFaA86jlWo4F57irM=;
        b=rerYtqq+yddzHxM0TjqhAoC0QOlNVQon4FyDVuGN2YrMi8XGc83q/u2Wi524h70u/H
         dY3fAMHsvhFnd+TcASZH32rmbk6+oh7mSl5boc6HswCDcs45fYEqNNzT2NsyaOCVt/vR
         MqYh53QYi7DgWbXrwGcc9liNeH0ZfKCTQZo7mueA7CNsKtdAS8enX66LwvVOi7Uyo9C7
         fvT2W2LjzOFAiWdsEvlzJc3KpbgurHiWOBwDN5TtGqmE2pdsBKjFH96yQPoI28LJq3kq
         dOYntV3MUc2qdnkCbZJ/h2c4f2OUFx0yP6d92JiA4fmFQsl8gDTwwDUsof/FeIEMM++V
         p2fQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Avh2IGGr;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m8sor6485264wrw.36.2021.12.13.05.01.21
        (Google Transport Security);
        Mon, 13 Dec 2021 05:01:22 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Avh2IGGr;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Csu36sXR6qEuaYGpzFmdSiJPxadFaA86jlWo4F57irM=;
        b=Avh2IGGr3OCnt5TAhRsSzdpm9963mPebkTb5JbicZQpPtTwd45ygXevZkNcO8eTB8d
         9A5FCdY8DHO8cYwAu8Lue1kOjL1stUvBH4T9JcckdT1sZzNg+SDVzo68y6PGxzHAKub9
         qmThAjgHcrKTbkQNfaEqgIpnSkdQEAb+RxqRh0DKnQBU7M7jmPquT1Fj80OQTj4zDmXA
         0QbXWKNtpv+T/LpALHR0QrMTvDtK6RG3UrrkG18VRWmJA71V4+hCewzv1aPOJSIhOnmd
         h0uL8fLsvEljUMr3jgyIuo10sLIkgdALqmzsCt9BBjYUazJmdx/sQJR07ybfCGbXWfcS
         tlJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Csu36sXR6qEuaYGpzFmdSiJPxadFaA86jlWo4F57irM=;
        b=uYZHz7lJg2xxBDhP5Jcj601CYAPtvbc1uey2utFH7+xmEC1p/WzEjXS8P80rgBVwrY
         dZpkMJ0Lu1giqA+Hsv7r50+cNXYPj/vUVY6V3C3kE4E5KZxmfcGS4sTW9sZ1hdz+sW1d
         80u+cNzjfCRxyWajOpeCi4c+yZ/eWNdrxoMwqSCwZmGigvIH/w/Ev3F9a1xF3lTaqzmh
         aLS2vmF0c7BZ5wedjvtEvP8UQpUqKDBwrnsL74CBHakXN7gahXAAX7PJGvcQaJ0ltaI1
         ygC/vKTIC5pEuZQF7KNW4s7OBHde3VbXBeI2Pb94WJa+rCgYKUVPJ6TbIIluBIyC5zPE
         metg==
X-Gm-Message-State: AOAM5336VjJa6uC3y2SkB6csysYdZT7QCKJSGefoeRTsuWrqdRITXuE/
	UIVnW21A6K4lC7oYykBHWxG+A1OrAPzJ8A==
X-Google-Smtp-Source: ABdhPJx8Aqn9J5YD7gR58t0mzX8aIBXdwXLzkOhJlkiNLefsf4fsYaidVu/a4HUYgcdYnjjO7GatFQ==
X-Received: by 2002:a05:6000:1103:: with SMTP id z3mr16560296wrw.718.1639400481320;
        Mon, 13 Dec 2021 05:01:21 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net. [188.86.27.180])
        by smtp.gmail.com with ESMTPSA id l8sm7795226wmc.40.2021.12.13.05.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 05:01:20 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Message-ID: <4c37d323-35d6-c3ba-4ba6-41e67c1bf9cf@amsat.org>
Date: Mon, 13 Dec 2021 14:01:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 18/26] hw/intc/arm_gicv3_its: Fix handling of
 process_its_cmd() return value
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-19-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211211191135.1764649-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: D9186yQw1DVO

On 12/11/21 20:11, Peter Maydell wrote:
> process_its_cmd() returns a bool, like all the other process_ functions.
> However we were putting its return value into 'res', not 'result',
> which meant we would ignore it when deciding whether to continue
> or stall the command queue. Fix the typo.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
