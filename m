Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp227983njl;
        Tue, 8 Oct 2024 07:22:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVjRBdGkslLRPqazlAzibVWlzMlW9DJVr4DX1AhuZKApz2wfb3BmtsmhSJf5lmlI6CvZMbgs5bzT9dNOA==@linaro.org
X-Received: by 2002:a05:600c:3b02:b0:42c:bc22:e074 with SMTP id 5b1f17b1804b1-42f85aeef9emr126772355e9.29.1728397354842;
        Tue, 08 Oct 2024 07:22:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728397354; cv=none;
        d=google.com; s=arc-20240605;
        b=Ce+rX3XPfZfvg5Q76X1cARJ2QvhxP8IxxfLY8Z9Mbrc+nYwqJWp7DeQLuYgtnSDRwG
         IG0MpV2cQkw1yVs3/Zc5ry4kblTUKgi2oKHiYpkeEUa/OiGyASMsR23IuLw54MTTwnm/
         9BM8ugn1dbB6p7Zqu2IW4zfALnAMTuaOxKvI8249wTHzGO6o26vCNQGZWg2A3L+F/CVV
         envwD6fa7Qo8uIHZOJnSD7gINk4AHLVwgxdIo9xIIJlOUqOd5nOMZzhUSnLEBlfy/LIt
         sGHWle56lxrVC2tHLXmVdC7628BiAIcgUdHDhzlhnj2qskozgyTGg8AMnG3YeXtrQ9jH
         AFoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mIOwIE4dnIoolyLpGLimDS0AFNW4u/gKwOEM/yPvXxA=;
        fh=zK9w4DoCRHLHmFoGNcUZa5XaxPDWxOd+KBZFa2+1xbc=;
        b=W4MEXL7m/YdebSemdYbuNP3oKXY2ja/UrJyDyMFnd2jtKG3KDIdw+sUJaupCoorF1U
         u8I/MWS8AQN0GQr16Nw+jMpCH1vOs7jgfy9hbLlMvm3rmu014DnwagGgLXB4GrVZO8/i
         9WMZ8hIbkuFBEwW/QotdM3GENBNaM6D1xhPPSpQ3SDkidqlqWHDQud/VYra6f6bpqy7x
         MfuYTLdcWjJ8kUEOYreUgbzWclth1CyhHhGBCauKiAZz0gZvHWiYPGabmce3UjnQthCt
         vuFn95ezGK1RicOqcA95lFVu56lWpMrLQVbxjUt6utPmUGslryZIDPHqYxSRmruDPiqn
         ZCKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A1YQB4tc;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-37d2de121cesor162224f8f.10.2024.10.08.07.22.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 07:22:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A1YQB4tc;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728397354; x=1729002154; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mIOwIE4dnIoolyLpGLimDS0AFNW4u/gKwOEM/yPvXxA=;
        b=A1YQB4tcYZObtuxHYUeIN0htaATACIJe3FDGBc89xuGcL6WqASpH8PRC73vNqO0elr
         8/3Ok8oH36aS6Jdt+k3Q9E0nb0NrMDXY0IOa4hyLc6ddqnre90rLTsJSzpc+pHoaCnuP
         HYdEYj/SZswaLEqKzjzCZTVe/WFelPcu+ivYrA5bzObcF9DxiujLM9EAsDud6Zjv4iFr
         lwE6mMgm8XxPnc4j0NrI5oswcQoO27L4jFUiLuEncVhE7n1yaeVtfxhnESbp3WiHwDRG
         E/P0CXRpggo9+Vd30D2dV7mwQ53ANqmtHzd1ACFtW1rEd8q6AyRFt8d+Bs1RZmZ8fks+
         ZTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728397354; x=1729002154;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mIOwIE4dnIoolyLpGLimDS0AFNW4u/gKwOEM/yPvXxA=;
        b=a6M0NPDEGZy0+b1++6XRHjNL8kascdFHYkMz0D6149Sh5RrOElxDhD4b9/PaIbfCBD
         nAByI40xpaui7YwVLmMfFNhM/a64UC0+787x1MGS/LL5kJEHbnqVLyiOCKQdH9LRSBeD
         fMToCn+DDAmaT8n+tFkuFyHhx2o8K7B5ET/DP/XOj3f19nr4Awq5nIL6ABkKO+ncqNzo
         PvcvUIKHv1tafJCS/06Q4GzJpB4vARewLRYII8tAdPyYmEp1W9nGxEroTqWJOsJzYBC5
         bE5h+eZPmCKPba/bW5oflq4APpSQTJ3xqHDnxli68WfxD5wau33iEIz99d0MhMKbzL45
         288Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3jIGVtW+fiYV775UXeBygAgg6MfEnxZV5vZf5M5tZGJe4CzWIYhwBM4c7ZcmEmabu4UkK3uCkL2qFOg==@linaro.org
X-Gm-Message-State: AOJu0YynQ4HGOG/iLN3I8+i0Y1vkstltKT/vYLf9mZPRfeO1UKwmAD72
	nSOV316ira5V1ihDeEtfDt2TYViOHfFVtwTg2NfPLS7orpTQNm07cnwZ80Iby6t9+gBI3LXotH2
	TUXyRGbjT1Byq22d26FZF/mMEt9Uvcy3t8kVENyem
X-Google-Smtp-Source: AGHT+IG4DScf133UOLJi0v/dH7Dlw/hjpi7mdUSEXGkfcorU2vYoBNYxL3zcPhTqtqhDp7hvPo1uf/cjZhw/yLcgu+8=
X-Received: by 2002:a5d:49c9:0:b0:37d:3759:bb8 with SMTP id
 ffacd0b85a97d-37d37591daamr704491f8f.53.1728397354228; Tue, 08 Oct 2024
 07:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org> <20241005200600.493604-21-richard.henderson@linaro.org>
In-Reply-To: <20241005200600.493604-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 15:22:23 +0100
Message-ID: <CAFEAcA-vpg_Bun4r5=e7mghzWmh=rP+AHup9drQqzqjz4ON40A@mail.gmail.com>
Subject: Re: [PATCH v2 20/21] target/arm: Add arm_cpu_tlb_fill_align
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: Udca1pPsJPir

On Sat, 5 Oct 2024 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Fill in the tlb_fill_align hook.  So far this is the same
> as tlb_fill_align_first, except that we can pass memop to
> get_phys_addr as well.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
