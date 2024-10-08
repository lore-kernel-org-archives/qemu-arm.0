Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp230923njl;
        Tue, 8 Oct 2024 07:26:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX2hgUGcOtFDNt2IERaPKzm0AbokTv41USlf5NOSZqzrtbq8oJaWAqx+G/Rz6tTvtzDxHFoC77OKB8aNw==@linaro.org
X-Received: by 2002:a05:6512:31ce:b0:539:9fbb:4329 with SMTP id 2adb3069b0e04-539ab8628c6mr8352964e87.1.1728397614155;
        Tue, 08 Oct 2024 07:26:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728397614; cv=none;
        d=google.com; s=arc-20240605;
        b=FcvHN64mxatk6FZkDVXISJD5LMxJkoxuc6y4pcAl+CCyH9h8gOWszSpK9KOmP3OcRK
         NpN0T0aStdoQXnoY4ouhmB4QvqIzjeiIS+Lpr6uPV1AyQmfw49H3GfMiXtxHSjyHWTSi
         tsVvX3Hs/lGRZMe2hcGseQQQCFxTJmDpQ2hBkKXkcCt8VAU5RqM+m+Xey8yyyULzabby
         s+5tmWthVWnXJUohMlRZambn2t7DNRxzzulyaYRWtcTZymQQ8IpxsEGSYJJguO6EFFqk
         eGgKHUQWlnZJ2nvl1H9lrW2/QwqnECO7X9v8WhTbrDIqz18S6aVpudHkLyxZN5JS1Cqt
         EqDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RQozRerSiRfKC4vBeczSbk4ogjlVq89iod84xYTjpH8=;
        fh=l7bCIrYEztcsU50c8a79K+20EiK5c7AhxWH9Mk1hSBY=;
        b=dmcFfbsMxBfyRU6lro7vG7eSEnsG4YY4Y2jYC/IXoCcTqlDAq2FThwCrMSYKloabWV
         6jk6b02yXSbnuwYmJN8942MJ/qgPSZNC5XnZ1hOGCh2RCIMiEn/m0RxWkJVFGu3EOy/N
         YptqwHx042ISO7xGLhUsbHF59tz2AP5mqIkI6GU4CIffOtUpTTkMg43c+mR8J96QRE2/
         Q+Gh4fetpaHXngFYa4VnRieNmsx9ISNodHo/oDRRM79KAQmCNDGvzbNz4KhOaJldZOQs
         /HdP9mO28kAnU06q1kh3bx3Ksg10zvT0W3SViNes/cWbI/Gfq2aG8IU/8VO0WfWgbxHF
         KJHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BkCGYkd9;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-539afec2f50sor1628765e87.2.2024.10.08.07.26.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 07:26:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BkCGYkd9;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728397613; x=1729002413; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RQozRerSiRfKC4vBeczSbk4ogjlVq89iod84xYTjpH8=;
        b=BkCGYkd9skxTIvW4jmWPxkTCMC1gd0du3pKPG0vrINGAMGHwvrs0dPI3WshhwMXS6+
         iNKbHb+Ts/rY1tkNURqNuPym+k9X91J033dA8H583Jk7dPmEpMlMKYjlpSwXX61+fcFD
         ufE092qzstoFwDWs8yZFj7UlS+Gg6+2Yi1WUJF8lFYkzpZ3QJVGvsPRQSlGe7HZrkD/I
         rWv/+SvWcInk5rT/a+IBa7SaTgWGZSwBfy4NIXJrAAFAZYVk+XF69QYKlwEQ7Y3Zeybx
         kJRtK3EI5g7HmMnzdYO98IefRl/CN6x47kkwC1EVpRd85QE/bcbdlU7vv+bNaH/ajHjB
         5Nng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728397613; x=1729002413;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RQozRerSiRfKC4vBeczSbk4ogjlVq89iod84xYTjpH8=;
        b=prb94/H/FvWiOEKMUCY/0Tr5gvqKPFZCs1gdfs04D2siwkh7KsATcbBSYuPWHZ+KLv
         sidAdc1FoLXExW7vKvPoiDzaCfmzUFW7gK356NQhdc1LHZ/LxNPJHFbKx4XVLG1x8rer
         NZQtOqKS62XswsA7imrAueM9Unr1dzGOl6XTsUupLTyNPdb+yBA8i1K9ikk+1mCD+ZBA
         WlWYYaDU4pCy17yvp6FFKR3Fxv6Yb4gDICYkytkw0Su89eLx6axZieZ9YS3y/EouXPCt
         WYunzLrImMwQ+SnV4aiTB8wIwf1jptTq2SsEiear2sMx5ZBJ0JFmI3iwBzxMTWFtF2bK
         n2EQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCZPsch8se/hnYRpVbFWU7yoydN5hDjGnp7yLEYfDoopeP0i0F7jVw8KmcfZLMdQe9hbW78eQqmXeTug==@linaro.org
X-Gm-Message-State: AOJu0YzCUVV19tApzp4BjvxEZ+IZVD+nxoUc2x51/HT3an7WGw9rwHXU
	pRJCridNnFmaCivH68WHf4mSaT4Ik52PGWmNqAmHWIwlJGjgn47eYeyW2saSOWgsqs7k8K4G26H
	dpiwkwxkyRDjyHXSsIJadGLZzI4ofaLp2LuN7xx5b
X-Google-Smtp-Source: AGHT+IEK40RZGPZt5Ym42R8l1+Af5CABSgiP3N8qQETkX12gAxA9awW14sA1GNRaKGIg0p+kd3F0YmluVLQN8uT/C+o=
X-Received: by 2002:a2e:be90:0:b0:2f7:9d20:3882 with SMTP id
 38308e7fff4ca-2faf3c63ec9mr87028611fa.22.1728397613383; Tue, 08 Oct 2024
 07:26:53 -0700 (PDT)
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org> <20241005200600.493604-16-richard.henderson@linaro.org>
In-Reply-To: <20241005200600.493604-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 15:26:42 +0100
Message-ID: <CAFEAcA-d3MHj=_Ma6MHLGLT-nW0iKA9fV7C7gmK9pnG-9NXZcA@mail.gmail.com>
Subject: Re: [PATCH v2 15/21] target/arm: Pass MemOp to get_phys_addr_gpc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: EIDxl040W5Lx

On Sat, 5 Oct 2024 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Zero is the safe do-nothing value for callers to use.
> Pass the value through from get_phys_addr.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
