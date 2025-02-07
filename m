Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp350256njb;
        Fri, 7 Feb 2025 09:22:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVQj/loPwXGlezJ6LT2IZEXY/yZ5N03Wcn+95JMLtrE4hedtVH4TQXjIeSAW6/raG82mcXyY5QExHBudg==@linaro.org
X-Received: by 2002:a17:902:ecc8:b0:21f:507b:9ad7 with SMTP id d9443c01a7336-21f507b9d6cmr54199685ad.25.1738948940218;
        Fri, 07 Feb 2025 09:22:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738948940; cv=none;
        d=google.com; s=arc-20240605;
        b=YuFPD+14VmlLDXb9hpjkjaDbnURhiIt1D7cGtJYapW8efnG/CRu2cD5rR/k4KkD0t4
         rxphJ7ogLWmzy+6ePWXYw7GSmsYd2px7ilRrXmV5cbdghEE/kwKTFVGlNvAQs2YjFrfl
         zKcBcGwniAniHOK/JC/kx2Rl7Drm3kZ8IUTa7/G7o4sg9W2dmrmi1QKnk40XIfRepIK3
         U/NFTrouAi9Zn6QzMYy2vbk49B1cMImEM2LoiQX9fdtl9q7QWk3dkX15oUVWgZwq1P7n
         HTcxnY/4RDsbv0COd5abPyWzPRPvfdmfRB8aHALHFAGHefaSLmXT8OGnIyrqTCYivnlY
         NhQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=PuI9ezYBAeHIwgM6VLS6Ioe0cLgcltuopXziKm5PBHw=;
        fh=bwj8RfSpVNUuh468cBLro+SkTnnRUwionOQDT2MfopA=;
        b=Z4A6jkJ6GeqPXgA7MzVjln1dSsUs4bALdHcadxzzwOdfgczYdvQFYEDEPp/SgGmZIr
         BdpHfpMbq5RyUwAwwH2CGlEGi/kFnPA1Owyocxd7Smj6x8b1Pc+PbF+fD6B9m1gedMfH
         eQHG6U8SoE4WqcWT08CIZbhhbjDaIKZAO+8iwOK5AEhouTpNcG3Zh2wngkWmu54ydEmv
         qm/Zwx0CK/IYGcaM1mFnPzZwNvZZv3Ci9i9l3DOq9llnALC/rSJJcNWLGvs7vqEFQWkr
         l3VeSV1KB1NGLiivlksKWsc0JjX7MrF3CoPCe2jA9ZMJvmPJPvK+8isy21rTQVNFdcCo
         KxVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cHVmiZza;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-21f42a86b44sor14189095ad.7.2025.02.07.09.22.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 07 Feb 2025 09:22:20 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cHVmiZza;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738948940; x=1739553740; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PuI9ezYBAeHIwgM6VLS6Ioe0cLgcltuopXziKm5PBHw=;
        b=cHVmiZza8nuZBlQahpWh49Z0V26yB+zlgnO5KedeVoeKnK69H6g4Iqj54nhvL9Qbzb
         y4xDSxF1jUvo4VHKCz4M4Ye2e6BX7aUF4mfGEJORXq0iWBVrWvS3zthnvU4Dw/gpFoVg
         FRQf7PoIZ7LbLusp+LWxoWGU9rh0GfCMTGn5SLGkX0vsHGLmYUg8TRtaCw29iU+2eBIn
         iPdi4//h8i4J456HaMAa9CZGeUEdju6mKq3g2WhIFkQ4hKBSGkSe16g98cIYgy+jK/ix
         11838bXrO9KZogAd66xLQJ6QY05+qEmNp1v0LomP1ff1gMpUWR/ofe4MmWVdkmxJuQsn
         VZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738948940; x=1739553740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PuI9ezYBAeHIwgM6VLS6Ioe0cLgcltuopXziKm5PBHw=;
        b=ZBrgB6IaJrENlvDdREYLz/BlCzjAah9aRkMd1yE9dlAi6wI1R5wzawJ67lB/6vaRWo
         +BPM5O9w5kpj/eNJLu39GArMtHlvtJaa1K/ReAQPSQ79sZdpyQtzWprrvKNvvYEfVhxY
         YD8A+dNBGf6DG8d/oRxSTlJUP2ui9ytJczk1CWthDfey3Tetlx6MXeWQ9Zc9QOyBJGTI
         qJEkfk0Xll2Etis4Wtnxj3qaB37zd/gacOHoahT9Zh1cLIScDpGCYr8cMzEvg8aJbYh8
         tzJB0hLqjNPYQwbimihFE/XZUKnZmdZk3EtT3Pu5qB8rFs35yn4HASkF4OIOwT0qimNj
         OiJA==
X-Forwarded-Encrypted: i=1; AJvYcCWmm3OMK+3b/dx78HUIK0PydEi/iND09LJ0IWI+4L64RaWXUC1F2wERg84qXSQVS16pgf3XLGg0k4Q4Uw==@linaro.org
X-Gm-Message-State: AOJu0YxuOP6rKrjeCIgFDazUugCBXE2pJOS+9lYOrkjwkt6y7CdLPfMn
	y16FuhcrMgCRiDt2oSm6OHNGn0+YSkdcVGgGiyR56uKfit7/6kqaJDmfqGV/dFm6nw==
X-Gm-Gg: ASbGncuGksBHEQWgZCbd4/zIZF9Ows7fhhMZlEYO1C4PrmlVepJK8GBwdBcViLbe8NP
	MJkRl449cEAkm8D1djxFSCaBe2q3Xv4jlo+LszkG194vDhs15tbJyGiyROwm6IRcm8ttmUMcbjJ
	SM/cUBPdDSmtyB3mv1HbuitMkVPU1y3ou9S37rv6B2PwGfUrls5yW+DVgDArl9XDZ+OTO8VlIne
	ytdYUJ+z1c6BVgVv5rua/CsKR+DTQWrnrpvJW735yvgAQfQlLcGmKmlG58+5Vhqqz14aqrWv7HU
	2Lvb8QGm596fC3wsjSeYMCxQ1UjmU4KqQ7Vef+zHwfbyUHoobTgq+gc=
X-Google-Smtp-Source: AGHT+IFH65CDDp7tP5xkPhrzS7K+EByWPF9bO0ure/lihhPD5d4Cw3JSMGTG2j77BjsC2FVvWZ9cCg==
X-Received: by 2002:a17:903:2311:b0:215:acb3:3786 with SMTP id d9443c01a7336-21f4e6e649dmr71243065ad.19.1738948939645;
        Fri, 07 Feb 2025 09:22:19 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-39-66.tukw.qwest.net. [71.212.39.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683dc55sm33238375ad.125.2025.02.07.09.22.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 09:22:19 -0800 (PST)
Message-ID: <5ee77b8c-e6a4-421b-b729-a6535fdf1e6d@linaro.org>
Date: Fri, 7 Feb 2025 09:22:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm/helper: Fix timer interrupt masking when
 HCR_EL2.E2H == 0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Florian Lugou <florian.lugou@provenrun.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20240615185423.49474-1-florian.lugou@provenrun.com>
 <CAFEAcA_+WrzM4fXQMUxMi3L5yiUWMrUGTSZH=NDdYDKUCP+8NQ@mail.gmail.com>
 <20240620135627.qxcrkdx5v7wdurx4@flugou-latitude5401>
 <CAFEAcA-ngrrEUDD7eA_sOLGF+_wRCuQVxTwuCA4pXjRcuJucmA@mail.gmail.com>
 <20240621140725.f4hsasmhrhh4joxm@flugou-latitude5401>
 <CAFEAcA9c9hbpsdyc7+=QEOZGrNY2m-urk6VrWdwCdfk9ipkwpw@mail.gmail.com>
 <20240820113024.53tmzejw2omm6bbx@flugou-latitude5401>
 <CAFEAcA9X0w5QW2qnnhF2k72ZrS8SALWiXV7uNr1e=jQnZvrQ7Q@mail.gmail.com>
 <CAFEAcA-MrouAPdwpsyojMC-bx4aFtuL=tYZD=2pBS1vP5iicaw@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-MrouAPdwpsyojMC-bx4aFtuL=tYZD=2pBS1vP5iicaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: g+9XYAFs7aiV

On 2/7/25 07:45, Peter Maydell wrote:
> This is where things go wrong -- icount_start_warp_timer()
> notices that all CPU threads are currently idle, and
> decides it needs to warp the timer forwards to the
> next deadline, which is at the end of time -- INT64_MAX.
> 
> But once timer_mod_ns() returns, the generic timer code
> is going to raise an interrupt (this goes through the GIC
> code and comes back into the CPU which calls cpu_interrupt()),
> so we don't want to warp the timer at all. The clock should
> stay exactly at the value it has and the CPU is going to
> have more work to do.
> 
> How is this supposed to work? Shouldn't we only be doing
> the "start moving the icount forward to the next deadline"
> once we've completed all the "run timers and AIO stuff" that
> icount_handle_deadline() triggers, not randomly in the middle
> of that when this timer callback or some other one might do
> something to trigger an interrupt?

I don't understand timer warping at all.  And you're right, it doesn't seem like this 
should happen outside of a specific point in the main loop.

> ... But I don't think there's any reason why
> timer callbacks should be obliged to reprogram their timers
> last, and in any case you can imagine scenarios where there
> are multiple timer callbacks for different timers and it's
> only the second timer that raises an interrupt...

Agreed.


r~
