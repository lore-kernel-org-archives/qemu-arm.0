Received: by 10.25.77.65 with SMTP id a62csp510515lfb;
        Fri, 10 Feb 2017 06:31:28 -0800 (PST)
X-Received: by 10.200.44.74 with SMTP id e10mr8820774qta.145.1486737088626;
        Fri, 10 Feb 2017 06:31:28 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com. [2607:f8b0:400d:c0d::244])
        by mx.google.com with ESMTPS id h67si1364209qkh.135.2017.02.10.06.31.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Feb 2017 06:31:28 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::244 as permitted sender) client-ip=2607:f8b0:400d:c0d::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::244 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-qt0-x244.google.com with SMTP id s58so4734375qtc.2;
        Fri, 10 Feb 2017 06:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=ZDFPOzQRG8En2NIifahwRqXmLljAFHqY9NUFydkOW8s=;
        b=CRgbQPf2ngDLn7v6zE/RnGToNsz3TXm/Adr64i2y7YfnCApizi47QioTzNhTh2nWLG
         jf9BDmj/lGAe2qHsZfM3M7HcBtBB0DFGvP572GVzLDnYAYfDHF5ZWRXtH32mZF6TVyQY
         epEAflG9g9/G06GROCdOoUnriw1Hz6uCsyuPwmSQi6Wlu+GoNWVHeKj4MoyxH5jrwU8O
         pMtxtWzGRfNAyeF80ri/2Jj4VqDObKBjOA+NSMkgHarZ6sE4d88WhicLEE8xgMz6jxOM
         o7mqQ+fSVeBiYmlQnlONaIzR/b435g8TZjRl0ioVvOc7EmA1neTbJk2rh3RjkVjPaHSY
         nItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=ZDFPOzQRG8En2NIifahwRqXmLljAFHqY9NUFydkOW8s=;
        b=CEec8UGLHQjM8spHRnbDzzcMN3lwiA17gOkja1Ksw9rMb3aCcBfHpkJ+2lN1j1M5nV
         Bre26Wvlo/PNugpUvjMLio0H7pKZle2Wa++dFNPBwNC3vUQ4phgDELdNr1crAK5yzA87
         YLtl3TmQE2+nkva741cagyfvRiadKnp/79CmtT9c5zFO/TzPRFb/19iSzkPy2io3t8+d
         uEPSDf3gDP0b/v2aMvwvtu8BGZwZO1q1ktsuVTXc2a6TjRDePM0zXmviATbw97Xhuhpg
         fbI3wuYyeyOt5oz+DerXl6Ds6EzwyUAJR+TuQHtI6qplxwGsf03SF5/6m4YfUz+pMQS0
         1gBA==
X-Gm-Message-State: AMke39n6rDouaGL9XiHHLTTJ5o9j8De2A+yedNIdJHEcblPk5WaUz+qk2K/7k88AWnhHBA==
X-Received: by 10.237.33.188 with SMTP id l57mr7872543qtc.49.1486737088213;
        Fri, 10 Feb 2017 06:31:28 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.10] ([138.117.48.226])
        by smtp.gmail.com with ESMTPSA id w44sm1723225qta.4.2017.02.10.06.31.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Feb 2017 06:31:27 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [Qemu-devel] [PATCH 9/9] armv7m: VECTCLRACTIVE and VECTRESET are
 UNPREDICTABLE
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <1486065742-28639-1-git-send-email-peter.maydell@linaro.org>
 <1486065742-28639-10-git-send-email-peter.maydell@linaro.org>
Cc: Liviu Ionescu <ilg@livius.net>, Michael Davidsaver
 <mdavidsaver@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, patches@linaro.org
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7a95b49b-83af-019d-b480-f26d69f0fe7d@amsat.org>
Date: Fri, 10 Feb 2017 11:31:24 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1486065742-28639-10-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 9YfXvcUuvbWO

On 02/02/2017 05:02 PM, Peter Maydell wrote:
> From: Michael Davidsaver <mdavidsaver@gmail.com>
>
> The VECTCLRACTIVE and VECTRESET bits in the AIRCR are both
> documented as UNPREDICTABLE if you write a 1 to them when
> the processor is not halted in Debug state (ie stopped
> and under the control of an external JTAG debugger).
> Since we don't implement Debug state or emulated JTAG
> these bits are always UNPREDICTABLE for us. Instead of
> logging them as unimplemented we can simply log writes
> as guest errors and ignore them.
>
> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
> [PMM: change extracted from another patch; commit message
>  constructed from scratch]
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/intc/armv7m_nvic.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 7b61fe6..18c0e60 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -698,10 +698,14 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
>                  qemu_irq_pulse(s->sysresetreq);
>              }
>              if (value & 2) {
> -                qemu_log_mask(LOG_UNIMP, "VECTCLRACTIVE unimplemented\n");
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                              "Setting VECTCLRACTIVE when not in DEBUG mode "
> +                              "is UNPREDICTABLE\n");
>              }
>              if (value & 1) {
> -                qemu_log_mask(LOG_UNIMP, "AIRCR system reset unimplemented\n");
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                              "Setting VECTRESET when not in DEBUG mode "
> +                              "is UNPREDICTABLE\n");
>              }
>              s->prigroup = extract32(value, 8, 3);
>              nvic_irq_update(s);
>
