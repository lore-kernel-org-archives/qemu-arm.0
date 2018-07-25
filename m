Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp465602wru;
        Wed, 25 Jul 2018 02:00:55 -0700 (PDT)
X-Received: by 2002:aca:4784:: with SMTP id u126-v6mr2539668oia.229.1532509254989;
        Wed, 25 Jul 2018 02:00:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532509254; cv=none;
        d=google.com; s=arc-20160816;
        b=s6+AsMvZPRSMVQtgLiAXTN/fVOqQyChbPtZDpBQKlg2jDYuitxdFtYnSCfocgx5hOR
         QwoOxTPTINo6Nj8XlxuaSk2uOAmVTTUZiZtm+8k5r6kTv45Z9OiRBL8NdlRFfGB1q2V1
         sep0uVD0RlSSQ7jqAi/DXBgzM/KMg5f2JLCYmjmaeZKLUFgFoSrceD6nNAGO8w8M1cOT
         sna79P2ik/ioVN0S3ZtccWEhkzuNApTZJEUjlkLVkYTAthJuotfLk2Qm9QhB9NNyqzKx
         I61WtEwmRIoeQ8HkQV3bQZlelB1wvTVsZReDHawib24oii8rIJWzVPyqmx6Z54dYawxT
         N6/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=BM9dehO1lwtLoEpeQOI9VJKwESMKbfflnCKGZtTZsjs=;
        b=X2fUvjsthmerEH5ihuitIohvMelgZb48b8rVf0p/DULlLsVVZkQqByTta2ON24Kgrk
         lw9oh0iDQ0LoWYYQPFn1irATmq440s1gpMdzO0HzxGC6h72enLDfrP9+G7n9WY3X+298
         +TOiBjYvMkOUVznbu587GChpWYIdOnhdchGecZXw7D8EzitFo7kkTj+M5xZKt5Rw0yjM
         BTGJQ7xFe9MJqySc1AOjQ3vl4353SzJ1/QkpV1kGp4FsdeGX6zyO3rg+y2emk3vzJsAv
         f/hX1vfSg92A4IkrGRKBBsW4UXETYe2zhkXNlpDByoMQ9v2+dt0X7A6EvcENw41N53Le
         2T8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JKVbif0A;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t70-v6sor7317319oit.201.2018.07.25.02.00.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Jul 2018 02:00:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JKVbif0A;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=BM9dehO1lwtLoEpeQOI9VJKwESMKbfflnCKGZtTZsjs=;
        b=JKVbif0AvfBQU8tyy7d4k2Cu5J4VdUcljJIpgvzkFoxVxwJYANNlOtwk1FqdoofBK8
         7TTUXIALA1QGBoXanwka82tzhEUcilVw+1nHocPmIdMJm7jx8ao0J/B4NH7s5yPtH9U3
         Jxdk8rXLu38bGp8tO5xgJ/Gu42Y5n9iV4ZeEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=BM9dehO1lwtLoEpeQOI9VJKwESMKbfflnCKGZtTZsjs=;
        b=GacO7TlcgBibopSaOvOzc9vcAQkr7pR/tg/YUa7buXLb7Qf/cURtFzNaMALiT7RfIA
         eyeJdK8k1MvZgb6nVLalr9XpGlv/QYP+JCtSXZknMVsj3KgaeD5dAIfl7ckQqSCvEVCE
         otiOUP7jyXczeNldkJKbew1K4reYFUseI6OgpuQ4SlKIbKt3qNJ8wlT7qb/cjWZjRtsA
         2WOgycFhtUNrHXF1J96RTwxbi3W3GLFg8TKD00aDTQQDj6Nk2yL0qXiVduN0xN0j8h+C
         ZU3kvDC6IddkmzAm0UzSlcjwhJfYfymIRbEL4ppZicuQ7O+h4+nW2KcnaxWnoCFC72hS
         YwWA==
X-Gm-Message-State: AOUpUlHXXpYNYK4OvG4hm1+e1RTMAlZeFeeHXLZfyL8shs9X8+TNMxZ8
	zn+unMDd+lrBVGn3x+oTVa/USOetZK70sFZVd1rDPLU2Lng=
X-Google-Smtp-Source: AAOMgpc3T+eD9RVMh5u6DHbKkTFPJNm08oROtB11kuovjpLYI9hNGzUqQA+/yLjs3qnXxALbCLI6EW+MGJrY4k1Z+Oc=
X-Received: by 2002:aca:5f0a:: with SMTP id t10-v6mr2287887oib.337.1532509254646;
 Wed, 25 Jul 2018 02:00:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 02:00:34
 -0700 (PDT)
In-Reply-To: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 25 Jul 2018 10:00:34 +0100
Message-ID: <CAFEAcA-WVfswDpDGoDCTqv-ZRege8kJ5hPjcy43DkODRKZfGZg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/arm: check fw_cfg return value before using it
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	radoslaw.biernacki@linaro.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>, 
	Leif Lindholm <leif.lindholm@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: HIG3Vb3m+16y

On 25 July 2018 at 06:30, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> The fw_cfg value returned from fw_cfg_find() may be NULL, so check it
> before using.
>
> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>

Hi -- this patch series seems to be missing its cover letter.
Please could you include a cover letter for any patchset
with more than one patch -- some of our automated patch
email handling tools rely on it.

thanks
-- PMM
