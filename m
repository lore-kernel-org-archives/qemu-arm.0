Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp365931lft;
        Mon, 20 Jun 2022 04:22:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tuz0mGZl0xQUtJGQNBO8HozvPg/yxLxVx2otIlVgqV9tX5+lH88FfP4S9FV3xhIChJXpWh
X-Received: by 2002:a05:620a:4505:b0:6a7:11bb:746b with SMTP id t5-20020a05620a450500b006a711bb746bmr15513291qkp.309.1655724172250;
        Mon, 20 Jun 2022 04:22:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655724172; cv=none;
        d=google.com; s=arc-20160816;
        b=jhetf0xBV25bUWPxLJ8AcWEW4BNQEsq+3PH/0KMFZHAYL7yWheX1O97+VuNbk2gnlt
         YrwjyXOBu2iZLhvky7Bsfhvb0LVys98jrPoeHzHhYB8EW96/v5Uh6mGIdMCP6TvFfSTo
         aguya0gewVu3D8kLCxtPkhhSu70o+br42wjeG2zHe+7gD4I+LJTy20zyyB79GZWQFg/w
         +xW1sMFlIFml7NGaRYudRF++wmh67XYiv6+lWw4eBbKUokLfme3aVKIiNvkfIEip4DLh
         t3A+qG/TaXTM/4on239TKaNqt4nYN1N2re54CcyIqHfzsw0M5UwOSCIdNMor6466tBn6
         U56Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=ktQyS9qe1Zi57yRP9diYDunebGgZrbzRWtPn8/Ak/bY=;
        b=NCn3gkioU/yw/Zbj/UALJvJIJkFTCnSUpp94ltkMaT54vkZAjNP+2kEaXy/x8Wu2it
         X6U7XJ02iEMDKDnkqnKXWiWfV4gKzs9FZDmH3QQaT2Fhm05EOCrPHTKrfHo930rG8BR2
         V0UaOjQzzEBf/O3Ze6Ej9BeEiRINV9S4n0m3eHyz5FhJNZEjaNXrqtZbkp3KwQXnWJf0
         ybTmfcWvO+i/YjlD6iRXcWLPLbm21GJ1RVzZkwbGnCSDkLafIq+pYPdyxszQX8wMQgZ0
         gOPoeESVOGfzNOcWdM86Xr8Y9ejjbXk2KIMTA+uMhEMF0ucFIyDFPohGoQUpeepb4667
         aqEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=nQG93lV3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2-20020ac85c42000000b00304c1bfab51si9030933qtj.0.2022.06.20.04.22.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 04:22:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=nQG93lV3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3FUZ-00004z-P1
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 07:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1o3FUH-0008TI-Fz; Mon, 20 Jun 2022 07:22:35 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:36385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1o3FUE-0003vm-32; Mon, 20 Jun 2022 07:22:32 -0400
Received: by mail-lj1-x232.google.com with SMTP id s14so4799442ljs.3;
 Mon, 20 Jun 2022 04:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ktQyS9qe1Zi57yRP9diYDunebGgZrbzRWtPn8/Ak/bY=;
 b=nQG93lV3NGGx/S8Y92oAEtLLIs2ck740MJd8P7uzVenJ2WvsoXanydwypswlrZ6B5l
 7/rxS52ZZoxM4vZfyeSZ2/9BNmX1zW4YuGsoQDWSugDfi5xhuhwPGvLY1YCFPSHLm60j
 /80A+n3BWtrCLW2HjjonvBPS3B+dMRCbd8WXjX6w1HtZgYwfjjV7rm/Vg2ALUDQgSK6s
 xlgIFqLh8WO6I1DZqf5Xyt4/CpJ+XUHpwu1rLGqMWuEJwjjqoMkcv9FVtvhVjgZWZj4x
 7bOKglHIsGrPqFwaiPK+SLOf5LnRH7qWYIyMm1VjfLKQ+odgyl6tGQrk8uoPuQHk4lR9
 ChJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ktQyS9qe1Zi57yRP9diYDunebGgZrbzRWtPn8/Ak/bY=;
 b=VXEdeE4my6OWr7UfGeWHjWrKp+INBXfHlXIQPudzuDnNRWCAU7GTW9ue5mbrSDeuaf
 o8+S9TtlrHc1Q7gEzLVCS7cLuLuPdsgpBMkUsptEeaPFmlFKyJPBKYnkKkUA+mi00XnM
 HDoWIONHcIcgpmHr+lyy0vt1flVMocZksPpiAURHSA7QwqgaNFIt0GZWnG2eDe5Cap82
 Baagv6CvV8K2Q/wSpcoceNWQYLx1QWbFZr3OQyKvfai8RB9WufEp6nxF9XhvsRtNPWys
 te243vYzh0rqQJd2AklLabOZmbG7RFo9o5wmPRu3NSyGeU6aqn9wH7xgt545RIL/cfcD
 Vtxw==
X-Gm-Message-State: AJIora9+ie2ZrSkHKvP5amX5xWjzMdXcBP/WtEouggFgCBNTXOZqXwyo
 BLFHW2L0z6TRmU2/+9Jx8e0=
X-Received: by 2002:a2e:b708:0:b0:258:e01f:bce0 with SMTP id
 j8-20020a2eb708000000b00258e01fbce0mr11187462ljo.494.1655724146660; 
 Mon, 20 Jun 2022 04:22:26 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a2eb0c2000000b002555d6ca497sm1604724ljl.115.2022.06.20.04.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 04:22:25 -0700 (PDT)
Date: Mon, 20 Jun 2022 13:22:23 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Dan Zhang <dz4list@gmail.com>
Cc: qemu-devel@nongnu.org, clg@kaod.org, alistair@alistair23.me,
 andrew@aj.id.au, hreitz@redhat.com, irischenlj@fb.com,
 irischenlj@gmail.com, joel@jms.id.au, kwolf@redhat.com,
 lvivier@redhat.com, patrick@stwcx.xyz, pbonzini@redhat.com,
 pdel@fb.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, thuth@redhat.com
Subject: Re: [PATCH] hw:m25p80: Add STATE_STANDBY command state
Message-ID: <20220620112220.GA10802@fralle-msi>
References: <20220614200205.2945065-1-dz4list@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220614200205.2945065-1-dz4list@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x232.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YZgzPX9VjSSY

Hi Dan,

On [2022 Jun 14] Tue 13:02:05, Dan Zhang wrote:
> HW normally will switch it to stand by mode when receive incorrect
> command.
> i.e. Macronix MX66L1G45G data sheet section 8 DEVICE OPERATION described
> ```
> 2. When an incorrect command is written to this device, it enters
> standby mode and stays in standby mode until the next CS# falling edge.
> In standby mode, This device's SO pin should be High-Z.
> ```
> Add STATE_STANDBY CMDState and let the device ignore all input and keep
> SO as HIZ (output 1)
> 
> Signed-off-by: Dan Zhang <dz4list@gmail.com>
> ---
> A usage of this new state can be aborting in HPM checking 
> or unknown command code received.
> 
>  hw/block/m25p80.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index b6bd430a99..9f89773b11 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -423,6 +423,7 @@ typedef enum {
>      STATE_COLLECTING_DATA,
>      STATE_COLLECTING_VAR_LEN_DATA,
>      STATE_READING_DATA,
> +    STATE_STANDBY,

Should we enter the state also? (Otherwise we will be adding code that is
unused).

>  } CMDState;
>  
>  typedef enum {
> @@ -1472,6 +1473,9 @@ static uint32_t m25p80_transfer8(SSIPeripheral *ss, uint32_t tx)
>                            s->cur_addr, (uint8_t)tx);
>  
>      switch (s->state) {
> +    case STATE_STANDBY:
> +        r = 0xFFFFFFFF; /* StandBy state SO shall be HiZ */

0xFF should be enough here (since we are dealing with 8 bits, e.g.
m25p80_transfer8). More safe is probably to return 0 though and see this as if
a pulldown was connected to the line instead (this because r has been default
to 0 and was the most likely return value before in this situation). If you
would agree we can remove above line.

Thanks,
Best regards,
Francisco Iglesias

> +        break;
>  
>      case STATE_PAGE_PROGRAM:
>          trace_m25p80_page_program(s, s->cur_addr, (uint8_t)tx);
> -- 
> 2.34.3
> 
