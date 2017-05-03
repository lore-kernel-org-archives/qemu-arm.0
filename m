Received: by 10.25.0.198 with SMTP id 189csp291825lfa;
        Wed, 3 May 2017 14:31:04 -0700 (PDT)
X-Received: by 10.36.46.193 with SMTP id i184mr3339073ita.51.1493847064647;
        Wed, 03 May 2017 14:31:04 -0700 (PDT)
Return-Path: <alistair23@gmail.com>
Received: from mail-io0-x244.google.com (mail-io0-x244.google.com. [2607:f8b0:4001:c06::244])
        by mx.google.com with ESMTPS id f42si21209842ioj.37.2017.05.03.14.31.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 May 2017 14:31:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 2607:f8b0:4001:c06::244 as permitted sender) client-ip=2607:f8b0:4001:c06::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of alistair23@gmail.com designates 2607:f8b0:4001:c06::244 as permitted sender) smtp.mailfrom=alistair23@gmail.com
Received: by mail-io0-x244.google.com with SMTP id v34so5252054iov.2;
        Wed, 03 May 2017 14:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=HQSgJpGePdde+d6I8TU0eLBz6Uvfg9Ih5O7M2oN65J4=;
        b=ZQs7SVqI0sPCWrBhvD61aTza8I0BhdRNrygRBP70wHOwohlCwtNNObjqPIorrqmUjz
         3Y8gd45kEcXF9zSrdGKOGUwBAD+whukVw7h1HZR1/ArhUzMSn7CnoqLzAMsjH9VeVULj
         dEdul3VTeiyfFl/8nlDC7Da2lE/sDORgNzD1cOygInHxQSVGs3878WHQBrgEp+R3mQlA
         0hHkQgueJJQSV0d2qYtvU+abhVBwBRLEszeRBwpd1KNLSofPrPoLDG7TDpJ8vwa+RGLd
         Tnvji9t3YmFlmRB8yIkTNOoOo0SkCXCcLdHgb9q1CdwT7oNVIpZsvgHT+46hYmefWVzT
         UVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=HQSgJpGePdde+d6I8TU0eLBz6Uvfg9Ih5O7M2oN65J4=;
        b=RBYhXFepdzvIz42zW/7Dt6QjL2nE9QZwiF0wGW9jrJi7vtI8Zv6ew6y2qo3zbg9DSj
         gaISsfY9E5g0HpDlQggppmWUiSr4ZF75WowYv03KHFhEtGW/vtemqcuBGPIl5i59Pj0b
         wH3GqOobuwmI3wQG1yptmv6XQuOMOwwFxyZVHzljKrhbkqPKEjPi5zT09teCRiNlEp/d
         RNRDgw12+SvRpFgAzBT9MuqVprhIqAdsHmAtBXTDCTrl1cBcEOyZFG6sCmcoup2Dk+26
         JvX+9xzCCvdWKDjwGnYJAZhDQDDJl17HuzVoWGELbwgTAwJ+mu+IGcOW2xT8QbQ66Jvy
         TMSg==
X-Gm-Message-State: AN3rC/4lXWgmJ5pOEyfBDNjgbKXRcONl43GE1ULLbHshHntM18nRM2M/
	wZ7IcqZCUGgUTmyYGbH5sPYs+buH/A==
X-Received: by 10.202.77.141 with SMTP id a135mr13676941oib.46.1493847064074;
 Wed, 03 May 2017 14:31:04 -0700 (PDT)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.182.72.162 with HTTP; Wed, 3 May 2017 14:30:33 -0700 (PDT)
In-Reply-To: <1493122030-32191-7-git-send-email-peter.maydell@linaro.org>
References: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org> <1493122030-32191-7-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 3 May 2017 14:30:33 -0700
X-Google-Sender-Auth: YHhlpOwKjktELoAnfeqEh911fHw
Message-ID: <CAKmqyKNfzT3P_=CuNhCfXG-_LnJnaZGri+sWqpLk3RAgr_OJqA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 06/13] arm: Don't let no-MPU PMSA cores write
 to SCTLR.M
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Alistair Francis <alistair.francis@xilinx.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Patch Tracking <patches@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-TUID: AP8jO3BANRvr

On Tue, Apr 25, 2017 at 5:07 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> If the CPU is a PMSA config with no MPU implemented, then the
> SCTLR.M bit should be RAZ/WI, so that the guest can never
> turn on the non-existent MPU.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

> ---
>  target/arm/helper.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 404bfdb..f0f25c8 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -3258,6 +3258,11 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>          return;
>      }
>
> +    if (arm_feature(env, ARM_FEATURE_PMSA) && !cpu->has_mpu) {
> +        /* M bit is RAZ/WI for PMSA with no MPU implemented */
> +        value &= ~SCTLR_M;
> +    }
> +
>      raw_write(env, ri, value);
>      /* ??? Lots of these bits are not implemented.  */
>      /* This may enable/disable the MMU, so do a TLB flush.  */
> --
> 2.7.4
>
>
