Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp905995lfy;
        Wed, 5 Aug 2020 12:17:09 -0700 (PDT)
X-Received: by 2002:a4a:83d5:: with SMTP id r21mr4304331oog.19.1596655029505;
        Wed, 05 Aug 2020 12:17:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596655029; cv=none;
        d=google.com; s=arc-20160816;
        b=qwC6LjEIkLlNYgvNsMqfwkpjvTVT1JTVUKCLB2ysbFrfXgNg/Ka6UIJjKgyP5h9W0D
         KAj0ZMxvs0gnuKqYD7/dmjhkTYAGYClMcKuuTTSX5Ju4PgQA7Wj3utyu75slmPtUvqra
         v67pYtcweoopSgUdnuDr8XzB8lLsJFI8Lgr59N1PFK9dZTwj0u3bL4oZbsxuiZ6LFoQk
         L88iouWOf8OZCDXEDrsDSb8gOE1MbdZNPpRf2LHlvxjFqA1Gk1bVILG+bX30RVo7qH8B
         WMAGXO9mb7b54ZNA660Y2bXveEWhLNbjU44g0DasFiQODMLPLc0ZuA3Oks04uvWK909G
         2IWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8yfgoATuxZMwPlAf0RNN7saocTmnNYrbYTVrbc87Zr4=;
        b=QVAROZBrE0E0ly6LFZEBnJmkb9WvLcUycEcEP+GL63T+WLIPSo5r79+83f/+Od7uii
         JB/444XVKAOGZL+LlgQkn3rswhzaFbOh6evhenWCKD9OTj724567FhRJnsrYrU8CnpjG
         skj343punTZdBhVA3z+iwQBlbne7+QzlOxhlRj+j3t1xqhoyMA36g68oZqmGu8wmeAMi
         vRSUE0d7sHvNQ/aFg571oklF4D4vjcZPjpxJMhTs7t4o/e6xLOQ32mu2YH5EJsvzTbjd
         XlPy9m2fKkixPcGA/KG9oXE/wL9QLXOUmvsK9O5ClQBc0pxwSOUKspS3Zvk8hQWseGJ1
         OH/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nI8k1bnw;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g10sor3479979ooe.12.2020.08.05.12.17.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Aug 2020 12:17:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nI8k1bnw;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8yfgoATuxZMwPlAf0RNN7saocTmnNYrbYTVrbc87Zr4=;
        b=nI8k1bnwX/t7qzR8UTyk/YBNG/CHxiB2euA4jxhkw595xqchVhpoEPo25JcLe2BX19
         oVWtPTC43iAlm2Kiu7TB0ztKYmVUP/kFSf5tnUqv0J3Q4lA+0oJQUaOneAm0YcPF7+6l
         onYQFHRf4Of4AKbUCAqMnlB/5nhPnmTOsiEmur3Df75eeUOfdwplOn8Z2JgLfrZs/68z
         NzshZjgGLZZRU/EA8qV1v0Wx/9R/aWe8CuTYjq7MSlNkngLuTgnxV3ujE9F5zYbb/bfX
         BvjVUL7MOPLAuZwQ7gtV5+QWEq4b0TYCiI9pfemorO0VDf8TnQaTKqXLzNtD1u1wFvEs
         DOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8yfgoATuxZMwPlAf0RNN7saocTmnNYrbYTVrbc87Zr4=;
        b=lCnaZMp4f7kzp11zTeI5hr9Y3lj2tjRQW7aS7Tm7mFHQvW7YwDApOXg5KA69pXgQW6
         b/O6e41Ljd4Pxj2/TJvmRT5Ovjr7Zdw71GGQukc5roHCksLUNVfZkq6Q6pKCxGFcfpdX
         Z2T1IqSq1cgKgS1C6Z1wqYGpk6AMSFPbQoWlHVKRKKUIe0jZp531E8D7yTKPrdQewmJf
         MO4E5siqpdPOht+cCNr7yduZIWaENovplQl6+gU7Ht2MlqaVn+ak58gcSRoUElu+FZqZ
         kWleU+SqwnE3brjfgNMsJOP41jEUq70c3PaeggwEr0k4Id5WSF72pg7j63AmQegsuGJk
         w+zA==
X-Gm-Message-State: AOAM530fk3cRHGnW6Z9FuwaHaLUzxuInn3bCuvvEXZvfgDk+QeAOkw9b
	eXQBpn9vBHfCpag0zv7E/DtQOnPX8VK1aCCB/xQIOTjCK3tYeTZs
X-Google-Smtp-Source: ABdhPJzEcrZOckd/yjLK/krpvvhnjfofcDM2u3g613LDcd/00SIWayI6ABZVTRjZF2Rs/kRkR9Fly136LL6o5+1/K+s=
X-Received: by 2002:a4a:4c44:: with SMTP id a65mr4315067oob.20.1596655028606;
 Wed, 05 Aug 2020 12:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_6zbOfdVi+Tp18seaEy4don1GurVya+E+QXRGrZ_WVLg@mail.gmail.com>
 <2c5ed9d8-6d79-1b53-5588-8fb9efebf0fa@linaro.org> <87tuxhkpo2.fsf@linaro.org>
 <CAFEAcA8+acTg6KoBDW5-7FvnrW=vDMXohWfTAXtTFv6BDqyuRQ@mail.gmail.com> <a1e53e0c-fbab-a789-5f07-cfae99b6042a@linaro.org>
In-Reply-To: <a1e53e0c-fbab-a789-5f07-cfae99b6042a@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 5 Aug 2020 20:16:57 +0100
Message-ID: <CAFEAcA9v3QysnfUjbUwTYcVAxkRRwaLWSFOq_negxWR72m3E0A@mail.gmail.com>
Subject: Re: v8.1M cpu emulation and target-arm feature-identification strategy
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 2h6acU9qZecU

On Wed, 5 Aug 2020 at 18:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Older ones like XSCALE are obvious

Looking at the XScale manual we could actually implement
ARM_FEATURE_XSCALE as (cpu->midr & 0xffff0000 == 0x69050000)
[Vendor=intel, arch=ARMv5TE], and ARM_FEATURE_IWMMXT as
(cpu->midr & 0xffffe000 == 0x69054000) [Vendor=intel,
arch=ARMv5TE, Core Generation=2]... Doesn't really gain
us much, of course :-)

thanks
-- PMM
