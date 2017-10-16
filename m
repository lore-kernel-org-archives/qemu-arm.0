Received: by 10.223.197.9 with SMTP id q9csp4032083wrf;
        Mon, 16 Oct 2017 16:47:35 -0700 (PDT)
X-Received: by 10.84.128.229 with SMTP id a92mr8243861pla.278.1508197655829;
        Mon, 16 Oct 2017 16:47:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508197655; cv=none;
        d=google.com; s=arc-20160816;
        b=wNJs6+OAbFiaQIRUF5R/EHajgn2p50kcbbKvQ+Gxk2vW94aYZ6qSZVFQm0YrAsYreq
         CwMRl8CT1f16iPUQeOlKOyuM7cYyHFUOl7RPEja9LQwUKLNUNk2r4rxVH6B4ABVCzZhY
         E6WAQ73XWj3oT2xEi2Gm41uTDK3J7YbKcGNfqUbi0vw1DBNvrGj3Zg9JnFgz1Nf4EBwi
         O/H4k9c5MRgsiAJxSfawnHlUuv3cA3zDror89+TviGXpJBnAJSzCkQvJmgy5RWQdytcw
         7Z8NjQ92/AuY8qqe/f/2Ye/LYxDevSYqhGN6/BPbarRTCUIyk84krj3hRhaB9luMYZvv
         B6eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=rIeSNmfVIyVrsUvq8LWvKjZdm4ozWgLXG9S09PQB7wE=;
        b=PN4enJhzmT5iXVKO53uU4xE+mOv29NIHZNxEw8KSdCtDlCsYTYfBKjmubq+uS7wpel
         we0gyrOn6luggAG1s+qTbAoj3wvjwLeRNwarkZsK2s9YevTsjxv738FAAF1VDIb19oHP
         tCoJ8inNPENa0SRucmzp3+QRaOTZIRk0dgvvEzOtcp1FxKbr01nQOmbUznjr/Z3yx9F/
         FIQZu0j/wxpnrEGGuiACvQgsT3G+nyRYQCQBAcKhArSxJnH1C/fsoXZLAQKk5LqiV/fC
         ke+/8s2+AX+E8NuhENgnPyvb6kmYxIorgzCB/qcfCVvlMqMZOfhBfrjKqZtRu64LrgTW
         7JDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q/omvn6w;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r188sor1846425pgr.100.2017.10.16.16.47.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Oct 2017 16:47:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q/omvn6w;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rIeSNmfVIyVrsUvq8LWvKjZdm4ozWgLXG9S09PQB7wE=;
        b=Q/omvn6wdh6ae3byAK8H8i1JMAhGdq2c70oDjAaWbIGtNdnUQVbk54bQRKeMaw1yt/
         A/6qtfedIcbDXWtRCk+z7aIMVxACz9IN2HYmKxrSRoecqMATpdRzBlL/TvLUjp5OG1aO
         BmDNnWUmHCgeTAmaixNmfjSfR+4OuN5upkfys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rIeSNmfVIyVrsUvq8LWvKjZdm4ozWgLXG9S09PQB7wE=;
        b=cjY667iBQuKqqSE+4BpiJLcRzid7TZ+3duOXRjmCwObcwQpJS4naUhTlHpatxZtY0N
         KC6ArM3I6otRMtnqIvFG34K1lUVRx/EG6gDl2idXB5739Sb7CzIjOUY1xFQZjdEsXcbV
         GchwZmzic8yiKFiHVFaN54ZYH7FldkMw9w/Fz6YjZOuHs6vz4WnkwybwGNpMbmBFQ0UC
         akIQtQmPtqfj08gYTcg/R3S5vHKOzWsz3qyLPxTT/cM4FhJZuIacTfyPVyUICji1IV/r
         Nm3cnKNWCfbDBqTusiMDuYMXW4Ld0T2ky7LgTzg3v0LZgA5jFUPFm4HRumnjfQsdUknR
         Eahg==
X-Gm-Message-State: AMCzsaWzS9zpvLsn0bjwlP1ADCYDoRQw+SVppxz5oiUWxRdU1W+mtMHE
	Y/KI01PvskJ5tSWETM2wDiUvU2dNI6CW/Q==
X-Google-Smtp-Source: AOwi7QDwb9awOOte+gFPdOlgA+RvK8j7s2ar/tELGktxklOX0gmRKG1v6AKl/s0EaZe+ruNWRI4i4A==
X-Received: by 10.99.95.86 with SMTP id t83mr7388027pgb.34.1508197655283;
        Mon, 16 Oct 2017 16:47:35 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-126-104-76.tukw.qwest.net. [97.126.104.76])
        by smtp.gmail.com with ESMTPSA id j6sm17167479pfk.159.2017.10.16.16.47.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Oct 2017 16:47:34 -0700 (PDT)
Subject: Re: [RFC PATCH 19/30] Fix mask for AdvancedSIMD 2 reg misc
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20171013162438.32458-1-alex.bennee@linaro.org>
 <20171013162438.32458-20-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <54b36f17-4e9d-bb9e-6d2d-b1df1ef44480@linaro.org>
Date: Mon, 16 Oct 2017 16:47:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171013162438.32458-20-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: RUjboUyYxonD

On 10/13/2017 09:24 AM, Alex Bennée wrote:
> While the group encoding declares bit 28 a zero it is set for
> FCMGT (zero)

I see that's what the documentation says.  Have you validated this?  It really
seems like an isolated typo.  Even if that is right, it isn't (documented) to
be set for the other simd_two_reg_misc_fp16 instructions.  So that means the
rest of your decode is compromised.

This patch needs folding into previous, anyway.


r~
