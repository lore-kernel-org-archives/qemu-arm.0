Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7571638lff;
        Wed, 15 Jan 2020 15:08:02 -0800 (PST)
X-Received: by 2002:a63:fc57:: with SMTP id r23mr34844649pgk.71.1579129681949;
        Wed, 15 Jan 2020 15:08:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579129681; cv=none;
        d=google.com; s=arc-20160816;
        b=NORicbF6ovaIT4VC5QkZKRYw+Bp1uFV/+pRSpDdaHXLBazKhC00e+RS8+QOAsHok3h
         ljthzBaX72j308fi4CqniCHMcaOK6RR49G0QRIXDJRZA4eqXOnTUwIZADMTfAmXyz3kd
         k8Wsg8c3rCs7EE/J1R1xyVRPk34n9Vx+edIzd93i9vZLPzJxPFu1KRaapthXuuuN/dUQ
         RSV8EhiTjH03HeCLm69s+MuIPtOLc6d3FFrjQ5pw4LuvnJsmsSaiYPndTCTlULSmddmA
         DtwrA8fSqqXKi1TNtEW/9/rIr2ROWLXu5BMcoXYOqDEULhOl4bC3QJaHaSzZiTIpgDlq
         lf0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=BQHJvRoCxkMjIFqwUcXROLAq68d80gqdA++H8mJBCr4=;
        b=tgMC0Z63OpgJqpgvr+FF6L7i17NZyWZRzxQTse19W7XUzm0ipe2GuYJ6qYgBs2WTZx
         C1xBjuhurtTRoK2CyYmAbaUHnpq1Sd0UGqHd12lqT40Eg5gNCxpQ7PjwAEwybTM9iSb8
         61n7CI7KSDWIz1oEAXrzjAC0gBjzFPJkvHnu2EwdhWKf3mMxvbnFenkHcLlgKMVZ7GH9
         tSintARFy9ylR485Oegq2jY4zQCftI2G6MmsNflBDT0ajMAVV0/o+vrYLEOyocI3YH5I
         74ItvoRh9GFFDvhEhBTLIc5LB3TzkHN8Kop2qKnmYFlx0qQ3RSzLOgug7TAj+znrSzEV
         bRyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hXL34IWL;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y64sor22197548pfy.33.2020.01.15.15.08.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 Jan 2020 15:08:01 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hXL34IWL;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BQHJvRoCxkMjIFqwUcXROLAq68d80gqdA++H8mJBCr4=;
        b=hXL34IWLMSBwFLd+Eu0glsfzsNbl3L2cvoX0mWx4yUOvxsY9ElD6ieUEmz3wU4CdaB
         HCS2TTMRzlcM+yHPGtDabBm3FdwQa1GreQ+4SvS8BItohyIf4Uw0Fi/fTaw82jZIwBf6
         cdvPgLc/cr0vBSQGK84L1gMHFRLnG+7vCB96Mt3ve9hUX9psL0aftxckEeOGL1+6PjQA
         +sr/A60nuOHpaR29U16kBPpHKaahef/vlob8msAm6iO3xu6K2h1HCzwi35xKio055935
         86fzL/o3FJhs/ge2RHuiuijv4iQNTUWgNGVdb8YCv7rK8R6wL6IxqIt66oNq2TfPIfid
         HzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BQHJvRoCxkMjIFqwUcXROLAq68d80gqdA++H8mJBCr4=;
        b=e5iDIwTzkUgHv9y7vSmutdbG4jmvP2Lt+EizcQysFpp2aI++NnuZDD3zl0Qf1HFenJ
         OpW9XtoDt/thTMJBHRtLta1LYtZ53xoTyE1ozB0mNVFbB1ntPfSKlo4xDChqF+IIVz27
         lpJWpe9Y44BvGg/khvHFSAtDC3FeLfkclVnxW5mmi4XPSa66s6BKH17JrhVTKNBt0duS
         xSUtd5qffk59+8Y52R1Qkhh2/EEf0Y94SljBT5tZxOnjXunutIKgpBrQbCntUkdPXL1e
         w/4olK8swXxwMM3qQqSdgW0wLLVvjvt71pScc/mW49XL0fK4Zw5Yox17M6Y4WA/PGv6f
         ovVw==
X-Gm-Message-State: APjAAAV+9Is1Mzn4xXe8szMNKSpk9LkomRe6G92V1DeG/K2z5iCunA5u
	31bPkhMlSrPuHdjtOjj++peZpSjd
X-Google-Smtp-Source: APXvYqwcd7V6ZrIjsmiYqjJb+0dsNFwOAxtRMVG8M9hu19uu8mbtJFH09zfchCJANwmhH4xWJWIN9Q==
X-Received: by 2002:a62:ac03:: with SMTP id v3mr33774883pfe.17.1579129681571;
        Wed, 15 Jan 2020 15:08:01 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.3.43] (rrcs-66-91-136-155.west.biz.rr.com. [66.91.136.155])
        by smtp.gmail.com with ESMTPSA id 136sm21322699pgg.74.2020.01.15.15.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2020 15:08:00 -0800 (PST)
Subject: Re: [PATCH v5 20/22] tests/tcg/aarch64: add test-sve-ioctl
 guest-debug test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20200114150953.27659-1-alex.bennee@linaro.org>
 <20200114150953.27659-21-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2731815f-9a72-390b-0a8e-73b77c4b62b6@linaro.org>
Date: Wed, 15 Jan 2020 13:07:57 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200114150953.27659-21-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 9dRx8GD4Xpsg

On 1/14/20 5:09 AM, Alex Bennée wrote:
> This test exercises the gdbstub while runing the sve-iotcl test. I
> haven't plubmed it into make system as we need a way of verifying if
> gdb has the right support for SVE.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v4
>   - interrogate ZCR_EL1 directly as no longer have vg

Note that ZCR_EL1 does not give you the correct answer if the hypervisor has
set ZCR_EL2 to something lower.  Also, ZCR_EL1 it itself not correct if the
hardware does not support all vector sizes.

See some of Andrew Jones' qemu command-line work.  Try -cpu max,sve512=on and
then use the ioctl to set vq to 3 (sve384).  The result will be an effective vq
of 2 (sve256).

We *really* need vg, as computed from sve_zcr_len_for_el().


r~
