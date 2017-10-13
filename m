Received: by 10.223.197.9 with SMTP id q9csp1127401wrf;
        Fri, 13 Oct 2017 13:51:52 -0700 (PDT)
X-Received: by 10.98.49.135 with SMTP id x129mr2371576pfx.315.1507927912769;
        Fri, 13 Oct 2017 13:51:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507927912; cv=none;
        d=google.com; s=arc-20160816;
        b=0r58zjvdVoQTvFEULwOy+QlDue0o2BsMP4i2PNk/kCn6Mj+rh5n2+yeu5ZWOMgg7/W
         c7hmbaNqnhk5CvwHHaz0fa0zPx0p2LeV8+5zbSi7EYDn13AsBJDeVWIADMEmc9wEazWu
         N8vGezwkXNeyM7Y4ZUMj/uI8xFvGPwVIr8VT61rHLhzjWLOxNORzj5Fc7dO7ojdb2Hqf
         wHfToKN6HXOVLCLEnlJXte5JvQQElQzWFR/yunUi7LPMgLBEyasa4QBGsxdv5BglpsU0
         GuuM8qW9DFMPRWW072HtInfl9qCMvoX22EclbClSHDnpE6w9PLmI3+yh/BmXALrmzO9K
         UwIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=Ck9VMrPwQpJC84No0S1KK/o0VPmD74FOGggsddcfEuY=;
        b=mUbayAnPoAeyZgO1nduxaHkXnguJK7MQDIXQ0BrSn8+0D+uOHdXuJI7svPQ4kter7I
         7eBz8C4SeJZ/6mzP5S+gm6yBPfQaKC2McggRggSRlaagd8EW/BamqJfwuRGeK1coOw4N
         IIf/kf94KtFpdtvyJ86vjIgdlcS4rRSe0Nw57pKb9SJqC2dSBTnfWZji0X40nYYA4Nu4
         vO+Njd/cmuZ7v+qs5fpQh6JFzzqzb0wHsS07mR6f8TQOyM3vXKb4fpeaTNfBGRAmJ3tB
         jH2we0fvblMdr4x1+y3+J8yYn1xZJSQq0bbCTQRw21RbIon+ckrOaXtO7zaFRZG1IuL1
         B0KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V78B5BIz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 99sor657094pla.107.2017.10.13.13.51.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Oct 2017 13:51:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V78B5BIz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ck9VMrPwQpJC84No0S1KK/o0VPmD74FOGggsddcfEuY=;
        b=V78B5BIzJ6vS7jxv6TNkLQfujILI/VPWgm/CFgAXqjonrA6x1mHx43VTCBQauRAdAX
         znp3oM7W8KWFPIq66XkKeg3aoB5OMrzolowVi+bT10rfzLgW0F0UahqFqTwRX228F7cM
         dLNEu5vhcj9w0Tf1X5Y1QPc3zmwyfCO3jK1No=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ck9VMrPwQpJC84No0S1KK/o0VPmD74FOGggsddcfEuY=;
        b=Z2b41YLOJGl/Q718dbgNtAaYbzWZ8asgPF+Kwudqb3Pk4R+x2RkTeQ0CrVq3pzr+qm
         71l+AkGVroC2kSsyzZjTs4Jh5NkvsrDRvrk1Q2/TZwdH/8DqAAiix3lvMXKSf0vLZj2K
         WeYEJwr+l3jSkt2j95eL1y66XwFvRsk1iE2lLirp9v10QRPdYLHukRLC9spJ4oHd8OpN
         0xS5CudOjeRy3DDDRddgUe2gEcUnZUTVgf6k7wknI25fQPz3RSojU6RieZvxMIv50NY7
         tMUn2y8seRhksCcoRJdE/N+8WcPm7tF754+WVfZlRkXxRgEQf0TbceZp903sitN8XqvF
         akPA==
X-Gm-Message-State: AMCzsaUEA6/TzTDg+ZFGlZP3Dcl0bmG7le4GLyWzZf1aqVbtBNynarNJ
	Q0bXy/t8XCD3bC8vrWz3oQF9c1ew
X-Google-Smtp-Source: AOwi7QBa4GJc1JDvBHK9gEIF2h8uiNDcUnWmkmGic4Ga32rkzam+G21SXQVoTt6L3lYOURi6I3qqsw==
X-Received: by 10.84.233.69 with SMTP id k5mr2460592plt.189.1507927912427;
        Fri, 13 Oct 2017 13:51:52 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net (97-126-104-76.tukw.qwest.net. [97.126.104.76])
        by smtp.gmail.com with ESMTPSA id k8sm3285697pgt.22.2017.10.13.13.51.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Oct 2017 13:51:51 -0700 (PDT)
Subject: Re: [RFC PATCH 07/30] fpu/softfloat: implement float16_abs helper
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20171013162438.32458-1-alex.bennee@linaro.org>
 <20171013162438.32458-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <60b51a65-a313-8a31-55d8-e30473ce31e5@linaro.org>
Date: Fri, 13 Oct 2017 13:51:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171013162438.32458-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: KRCGcji8HANh

On 10/13/2017 09:24 AM, Alex Bennée wrote:
> This will be required when expanding the MINMAX() macro for 16
> bit/half-precision operations.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/fpu/softfloat.h | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +    return make_float16(float16_val(a) & 0x7fff);
> +}
>  /*----------------------------------------------------------------------------

Watch the spacing.


r~
