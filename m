Received: by 10.25.159.19 with SMTP id i19csp504019lfe;
        Fri, 15 Jan 2016 06:38:46 -0800 (PST)
X-Received: by 10.28.6.213 with SMTP id 204mr3724889wmg.47.1452868726273;
        Fri, 15 Jan 2016 06:38:46 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-wm0-x244.google.com (mail-wm0-x244.google.com. [2a00:1450:400c:c09::244])
        by mx.google.com with ESMTPS id p1si17777208wjx.81.2016.01.15.06.38.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Jan 2016 06:38:46 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:400c:c09::244 as permitted sender) client-ip=2a00:1450:400c:c09::244;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:400c:c09::244 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-wm0-x244.google.com with SMTP id l65so3161337wmf.3;
        Fri, 15 Jan 2016 06:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=v+5VhSK/C9Jsx9DaDR3+lwVo88OYhgZAg1Hl++6nqKo=;
        b=NheUcP4n/KgE0VgKqrdamyvFeqaaKraagnZGZm7/ue7WAWfy/mf68L8Xl066YswPYB
         XAw9pgk8gfRfpp+EttKVvfTzW8JSWJdZgtnxc+wBzcMzsigNJKW6lGxi2APzH8WcOdjp
         QWHHFUlHM8aSCvN40B8sLd9ZM/++opbfwV9ElzXcSZHPbn8I/oKr92r/IFs0fSpAxoqW
         KJnHCIog2OX5IEjYVm3MOQoxqgCFeD8QknrQ4teSF2jmS/JorBmcCSUlR1VsWL4lvxeD
         KU4Q/aJEhZaSm2m8fnJKbAMVIxaRWgFF0T60/STJ9ljEZTv2LkWL1o/96rMu8t/WCHwA
         cMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-type:content-disposition:in-reply-to
         :user-agent;
        bh=v+5VhSK/C9Jsx9DaDR3+lwVo88OYhgZAg1Hl++6nqKo=;
        b=Oc8oC+c12oca5Awpaj7lq8hXSaXSzKyYns5ygVoh//xle3acSUa7chBbjTQ6Jq078u
         fkgz8KxGp2PMbbxfWOecO1dc1hqsnBLQJl80T90kvjVj/NazkBlkmVh4MxkoyC4ERS3F
         B6BH8gjIgw47/MdS4rOZrfLmxCfwu1XCjR44bHS/vvpj6xo6ebQvtZYIP7jggwidcMCb
         9yS2x7RlG/r5nhxOKCpHSqztLanaTYcZzSvjsuYuYCCGd3GaE96wqlocYrFe6NmT/wn5
         qX83cizAk/OZO2Q07wswelaNoMlEV8/Iwjnr5PmPr9DwuztB71HuS+W6+0XzKC2sKYid
         spXg==
X-Gm-Message-State: ALoCoQnwot0YI04wfgI/twN60FHps0CXUBbEQ4JUif2VzU1NX0hYAjO7UJLLgny9I8cUGhUNoLrBLlqN1/rTcaxckS7CVV1Bjg==
X-Received: by 10.194.82.199 with SMTP id k7mr11870579wjy.65.1452868726024;
        Fri, 15 Jan 2016 06:38:46 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id j3sm2818365wmj.19.2016.01.15.06.38.44
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 06:38:45 -0800 (PST)
Date: Fri, 15 Jan 2016 15:38:36 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, patches@linaro.org, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 1/8] target-arm: Properly support EL2 and EL3 in
 arm_el_is_aa64()
Message-ID: <20160115143836.GI29396@toto>
References: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
 <1452796451-2946-2-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1452796451-2946-2-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: 1pbJl0EmtNg6

On Thu, Jan 14, 2016 at 06:34:04PM +0000, Peter Maydell wrote:
> Support EL2 and EL3 in arm_el_is_aa64() by implementing the
> logic for checking the SCR_EL3 and HCR_EL2 register-width bits
> as appropriate to determine the register width of lower exception
> levels.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Hi Peter,

On the ZynqMP we've got the Cortex-A53 EL3 RW configurable at reset
time. At some later point we'll likely have to implement that
runtime option...

Anyway:
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target-arm/cpu.h | 33 ++++++++++++++++++++++++---------
>  1 file changed, 24 insertions(+), 9 deletions(-)
> 
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index 5f81342..b8b3364 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -969,18 +969,33 @@ static inline bool arm_is_secure(CPUARMState *env)
>  /* Return true if the specified exception level is running in AArch64 state. */
>  static inline bool arm_el_is_aa64(CPUARMState *env, int el)
>  {
> -    /* We don't currently support EL2, and this isn't valid for EL0
> -     * (if we're in EL0, is_a64() is what you want, and if we're not in EL0
> -     * then the state of EL0 isn't well defined.)
> +    /* This isn't valid for EL0 (if we're in EL0, is_a64() is what you want,
> +     * and if we're not in EL0 then the state of EL0 isn't well defined.)
>       */
> -    assert(el == 1 || el == 3);
> +    assert(el >= 1 && el <= 3);
> +    bool aa64 = arm_feature(env, ARM_FEATURE_AARCH64);
>  
> -    /* AArch64-capable CPUs always run with EL1 in AArch64 mode. This
> -     * is a QEMU-imposed simplification which we may wish to change later.
> -     * If we in future support EL2 and/or EL3, then the state of lower
> -     * exception levels is controlled by the HCR.RW and SCR.RW bits.
> +    /* The highest exception level is always at the maximum supported
> +     * register width, and then lower levels have a register width controlled
> +     * by bits in the SCR or HCR registers.
>       */
> -    return arm_feature(env, ARM_FEATURE_AARCH64);
> +    if (el == 3) {
> +        return aa64;
> +    }
> +
> +    if (arm_feature(env, ARM_FEATURE_EL3)) {
> +        aa64 = aa64 && (env->cp15.scr_el3 & SCR_RW);
> +    }
> +
> +    if (el == 2) {
> +        return aa64;
> +    }
> +
> +    if (arm_feature(env, ARM_FEATURE_EL2) && !arm_is_secure_below_el3(env)) {
> +        aa64 = aa64 && (env->cp15.hcr_el2 & HCR_RW);
> +    }
> +
> +    return aa64;
>  }
>  
>  /* Function for determing whether guest cp register reads and writes should
> -- 
> 1.9.1
> 
