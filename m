Received: by 10.25.159.19 with SMTP id i19csp2599401lfe;
        Tue, 19 Jan 2016 08:40:26 -0800 (PST)
X-Received: by 10.202.55.86 with SMTP id e83mr22901027oia.46.1453221626406;
        Tue, 19 Jan 2016 08:40:26 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-ob0-x244.google.com (mail-ob0-x244.google.com. [2607:f8b0:4003:c01::244])
        by mx.google.com with ESMTPS id h6si1085677obr.97.2016.01.19.08.40.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jan 2016 08:40:26 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c01::244 as permitted sender) client-ip=2607:f8b0:4003:c01::244;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c01::244 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-ob0-x244.google.com with SMTP id x5so10715735obg.1;
        Tue, 19 Jan 2016 08:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=/kc1Jj6pdmNZp7sXhpQVCAvFYqziZxD41Uuc8EkosqU=;
        b=aJ8Wi6tF1Agh3Y6U0vdKP+yDluSr02JQha7mLa/7uPpecC8kgwmn0QRDAQR7sRcOp1
         SMbC34PkbGxLkdMbP5OlN5kguKQ2iHmksKgQL4ZNGh4dMM9C8y66CPx4O4RxLl6GUGUY
         Nc3i92XNgdbh4xAJmRW/fyyXA3oFuH9LHrVZftfnLOp8IAqoAXacmqqMAKK/SIAkoH/7
         yLexxKDF2/njuuFG2LkmlS9P6i7AD1372d5B2nE7yDJnG3F8cQwDHCryNNj0HDMwv6h3
         i2GFi2miYUl4NMbeLPG/13g6apBqFTa+PGcByNU4bVCypBI4Nm8K7ZnMey6VzFkIvThG
         ZvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-type:content-disposition:in-reply-to
         :user-agent;
        bh=/kc1Jj6pdmNZp7sXhpQVCAvFYqziZxD41Uuc8EkosqU=;
        b=IvEw54vDpCK0xlDYsL+QxkTf7HSN1nm8dY08DS52d+ZwMFZ2c68h2dGDoh0mkEjJDR
         THXzIxebPwYZKw72zcCUIuQellASvKCpQgUBYBYlq26ZuRWwdzedTHWRn5+vwgFADFoF
         KgcvNGUjzpHdl8Yud1AwY2vEzN4W1gpEZenCse57R8Vbp7RaMLgOTQN2sblsDq+QaQLY
         D6UFuLvsR9gbg5Iot9BGATw/5XUDxUTZUqO/FkU7X7nbL25Qk2HbmSUtbZxmAuglhYJQ
         njApFuMbkMepzSxtrfTxrqoNcVkwJFwGk4nEDjCoBpx1HM/1HWXw3S3SzFklIR5aV6c5
         IFzQ==
X-Gm-Message-State: ALoCoQnwwa3+cuZupSFlMQshnutVrOdmQpc1f/6vxenhprJjKFNpkUgOQBdRKdxcPFNfkFaKedWc/nuBrf7UoCLAxJX4ArcIcA==
X-Received: by 10.60.15.197 with SMTP id z5mr24113198oec.57.1453221626100;
        Tue, 19 Jan 2016 08:40:26 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id l3sm15589054oeq.0.2016.01.19.08.40.19
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jan 2016 08:40:24 -0800 (PST)
Date: Tue, 19 Jan 2016 17:40:16 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, patches@linaro.org, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 5/8] target-arm: Fix wrong AArch64 entry offset for
 EL2/EL3 target
Message-ID: <20160119164016.GO29396@toto>
References: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
 <1452796451-2946-6-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1452796451-2946-6-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: vy6CeUjRlJUy

On Thu, Jan 14, 2016 at 06:34:08PM +0000, Peter Maydell wrote:
> The entry offset when taking an exception to AArch64 from a lower
> exception level may be 0x400 or 0x600. 0x400 is used if the
> implemented exception level immediately lower than the target level
> is using AArch64, and 0x600 if it is using AArch32. We were
> incorrectly implementing this as checking the exception level
> that the exception was taken from. (The two can be different if
> for example we take an exception from EL0 to AArch64 EL3; we should
> in this case be checking EL2 if EL2 is implemented, and EL1 if
> EL2 is not implemented.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> ---
>  target-arm/helper.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index d37c82c..196c111 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -5866,7 +5866,26 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
>      unsigned int new_mode = aarch64_pstate_mode(new_el, true);
>  
>      if (arm_current_el(env) < new_el) {
> -        if (env->aarch64) {
> +        /* Entry vector offset depends on whether the implemented EL
> +         * immediately lower than the target level is using AArch32 or AArch64
> +         */
> +        bool is_aa64;
> +
> +        switch (new_el) {
> +        case 3:
> +            is_aa64 = (env->cp15.scr_el3 & SCR_RW) != 0;
> +            break;
> +        case 2:
> +            is_aa64 = (env->cp15.hcr_el2 & HCR_RW) != 0;
> +            break;
> +        case 1:
> +            is_aa64 = is_a64(env);
> +            break;
> +        default:
> +            g_assert_not_reached();
> +        }
> +
> +        if (is_aa64) {
>              addr += 0x400;
>          } else {
>              addr += 0x600;
> -- 
> 1.9.1
> 
