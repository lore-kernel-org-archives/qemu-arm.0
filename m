Received: by 10.25.159.19 with SMTP id i19csp2606269lfe;
        Tue, 19 Jan 2016 08:53:37 -0800 (PST)
X-Received: by 10.202.213.78 with SMTP id m75mr24005450oig.56.1453222417171;
        Tue, 19 Jan 2016 08:53:37 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com. [2607:f8b0:4003:c06::244])
        by mx.google.com with ESMTPS id w13si896243oep.70.2016.01.19.08.53.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jan 2016 08:53:37 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c06::244 as permitted sender) client-ip=2607:f8b0:4003:c06::244;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c06::244 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-oi0-x244.google.com with SMTP id e195so28036196oig.2;
        Tue, 19 Jan 2016 08:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=MJy+bwFmEH1XsWCJpIdOeVGb7CY7Fb3vof1TdAeS1zc=;
        b=roGb+5L3RFp05wOgG13CQK92/w6Ic5UjtuYmCHgHHUgaO2NYKQiqAYLvYaCvsSOFHp
         fJ1fpPJ5heU7cHezrFjosbzeQHJ7+qygyKagpglsWlyY5WLdrwzGLg7Be/2Havh0jqYX
         1YBgMDz8tc67cqX4AEZiRfLQls2oo1QNPppAWe/zvmqrmodpLhlB6pfOWUQF0HZGUWMz
         WBOCochgXSd2pNcmxQWAE8BhNVEWdRATrOoDosKj1AyI2akUHTW+RKcQoRqh3pmoQu3l
         k7WBWXpkJD89H9iNGEaKlwFQYJF/9bl6jTL1ob+6gnmMVMwlvs9KUH5695yFGEKun98J
         AS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-type:content-disposition:in-reply-to
         :user-agent;
        bh=MJy+bwFmEH1XsWCJpIdOeVGb7CY7Fb3vof1TdAeS1zc=;
        b=dzwmOHqKzH9q3mAcTTZDR54pmimRZBNx3uSB3ucMVxBOUp1y7NPLV7mwmJaH82JNPy
         njUIBEoEcdsZBQdz3XhSARa9Zc2kNhIYu0GKDa+9p03V2UH77jej0KpsfN/yipiShP94
         ZFljJfJpWuQb7l4u4HqYbXTi2E9841hiuuElmdITFxh0RD1mgaKeLOTnTsSBIuZTaBNl
         zqEAU/BbmHk2YVxq8NPKcmpL97lPbbhJtqr6+DP8SCXwGJF55TqnHOID3fmWQ4Bu/Io1
         3iFPPkQdJl8Gb74fSp2VUT4UKYeg+8PwEaJhxFpOpSoOXzGrykwHhLYbYVG2x5dRiE+p
         Rwog==
X-Gm-Message-State: ALoCoQmHAn81lq7n5NiHupkV7Zg9YBQshx5hqV97In6vOXS65XKZ5Ady8ape4OBfZ115rlbLRT0h42jmWPYqj0ms+gmRerg/JA==
X-Received: by 10.202.69.138 with SMTP id s132mr23086714oia.135.1453222416708;
        Tue, 19 Jan 2016 08:53:36 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id wh4sm15696814obc.10.2016.01.19.08.53.34
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jan 2016 08:53:35 -0800 (PST)
Date: Tue, 19 Jan 2016 17:53:31 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, patches@linaro.org, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 7/8] target-arm: Implement remaining illegal return event
 checks
Message-ID: <20160119165331.GQ29396@toto>
References: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
 <1452796451-2946-8-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1452796451-2946-8-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: +faFHkw8SLbR

On Thu, Jan 14, 2016 at 06:34:10PM +0000, Peter Maydell wrote:
> We already implement almost all the checks for the illegal
> return events from AArch64 state described in the ARM ARM section
> D1.11.2. Add the two missing ones:
>  * return to EL2 when EL3 is implemented and SCR_EL3.NS is 0
>  * return to Non-secure EL1 when EL2 is implemented and HCR_EL2.TGE is 1
> 
> (We don't implement external debug, so the case of "debug state exit
> from EL0 using AArch64 state to EL0 using AArch32 state" doesn't apply
> for QEMU.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/op_helper.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> index 38d46d8..5789ccb 100644
> --- a/target-arm/op_helper.c
> +++ b/target-arm/op_helper.c
> @@ -718,6 +718,17 @@ void HELPER(exception_return)(CPUARMState *env)
>          goto illegal_return;
>      }
>  
> +    if (new_el == 2 && arm_is_secure_below_el3(env)) {
> +        /* Return to the non-existent secure-EL2 */
> +        goto illegal_return;
> +    }
> +
> +    if (new_el == 1 &&
> +        arm_feature(env, ARM_FEATURE_EL2) && (env->cp15.hcr_el2 & HCR_TGE)

I'm not sure you need to check for EL2 as hcr_el2.tge cannot be reached/set otherwise.

Anyway:
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> +        && !arm_is_secure_below_el3(env)) {
> +        goto illegal_return;
> +    }
> +
>      if (!return_to_aa64) {
>          env->aarch64 = 0;
>          env->uncached_cpsr = spsr & CPSR_M;
> -- 
> 1.9.1
> 
