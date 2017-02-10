Received: by 10.25.77.65 with SMTP id a62csp508877lfb;
        Fri, 10 Feb 2017 06:28:00 -0800 (PST)
X-Received: by 10.200.46.241 with SMTP id i46mr8789695qta.17.1486736880265;
        Fri, 10 Feb 2017 06:28:00 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com. [2607:f8b0:400d:c0d::241])
        by mx.google.com with ESMTPS id o16si1343188qto.270.2017.02.10.06.27.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Feb 2017 06:28:00 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) client-ip=2607:f8b0:400d:c0d::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-qt0-x241.google.com with SMTP id w20so4690994qtb.1;
        Fri, 10 Feb 2017 06:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=YNAOh07Dsl7cxggxamZL1kWs1c5KbcDyF7JYk9knowk=;
        b=u7bECewqde7pKQP+whCjHfRUtsWEqBemux5hpopt6nPvX6d6q9t7gjbZtLH+qmEfpW
         nw4URPhld7u1CmsfTuOzbSoCS8HKX2vCIhKa0XxnZvmIvT2ZkCdvk4knD15bkELCM5l1
         MhAgSfZwoc99teHecQhvQomolhooke2bE7k+AOttyZ+JsPdCMMRo6FxbxO5YTTnXxS8U
         c1/CDbj1dgN8PXPFr06U/ddS+uC+1TIu+Pk2xnn3qi84NUsvMhKVxYETOHcHrAO6t6BI
         cV/UT2sK7aOwghdL+8Btjn7/1Qd628CAXAkGbu0eqtskOzhzfx3SMXB5CBl9O3Xx/ToS
         wUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=YNAOh07Dsl7cxggxamZL1kWs1c5KbcDyF7JYk9knowk=;
        b=NVEA3ac1/86f7XTDjIhv7RYr+65pbnqmum1LMLWNV406pm/ph5GvRBhp1dFrT7vGKt
         BNfhOHVUO/2yQHBxvTrtHTU/yyPPY4bZ4GY3ircpSVs3kWay9fj5/vdU4+E9N+txuKeB
         FlbN+JIjqv49x8Mljq8dTgHwB0JV6oBzytSQfxttmL1PNq9YZfruuPH7MMvdtoZNK6E5
         TikQNpYdbgq8TdPZ25+k3XzMGJJcSGFzcMSmPgIQFmdd+itElnrcPnnnHMwvgRiqwCeL
         U558HdP1MzX4/FxVkF2m+tIUqohcPWsisBJIDQkDgEDF+OVKmIbIUa0PDogXX/Qn6jsT
         vV1g==
X-Gm-Message-State: AMke39lSyglE0kBPsIn+TyuQGo6iugQjQaAoUOOzgqRWa7s25Z4sz3QHBFKPFoVaAWN/hQ==
X-Received: by 10.237.44.103 with SMTP id f94mr9153609qtd.292.1486736879555;
        Fri, 10 Feb 2017 06:27:59 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.10] ([138.117.48.226])
        by smtp.gmail.com with ESMTPSA id h124sm1667017qke.40.2017.02.10.06.27.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Feb 2017 06:27:59 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [Qemu-devel] [PATCH 2/9] armv7m: Implement reading and writing of
 PRIGROUP
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <1486065742-28639-1-git-send-email-peter.maydell@linaro.org>
 <1486065742-28639-3-git-send-email-peter.maydell@linaro.org>
Cc: Liviu Ionescu <ilg@livius.net>, Michael Davidsaver
 <mdavidsaver@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, patches@linaro.org
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fbe34e44-5a42-e615-04f8-885d4d512e1b@amsat.org>
Date: Fri, 10 Feb 2017 11:27:56 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1486065742-28639-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 5CueIoeQGLSY

On 02/02/2017 05:02 PM, Peter Maydell wrote:
> Add a state field for the v7M PRIGROUP register and implent
> reading and writing it. The current NVIC doesn't honour
> the values written, but the new version will.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/intc/armv7m_nvic.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 09975f3..ce22001 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -24,6 +24,9 @@
>  typedef struct NVICState {
>      GICState gic;
>      ARMCPU *cpu;
> +
> +    uint32_t prigroup;
> +
>      struct {
>          uint32_t control;
>          uint32_t reload;
> @@ -223,7 +226,7 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset)
>      case 0xd08: /* Vector Table Offset.  */
>          return cpu->env.v7m.vecbase;
>      case 0xd0c: /* Application Interrupt/Reset Control.  */
> -        return 0xfa050000;
> +        return 0xfa050000 | (s->prigroup << 8);
>      case 0xd10: /* System Control.  */
>          /* TODO: Implement SLEEPONEXIT.  */
>          return 0;
> @@ -362,9 +365,7 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
>              if (value & 1) {
>                  qemu_log_mask(LOG_UNIMP, "AIRCR system reset unimplemented\n");
>              }
> -            if (value & 0x700) {
> -                qemu_log_mask(LOG_UNIMP, "PRIGROUP unimplemented\n");
> -            }
> +            s->prigroup = extract32(value, 8, 3);
>          }
>          break;
>      case 0xd10: /* System Control.  */
> @@ -483,13 +484,14 @@ static const MemoryRegionOps nvic_sysreg_ops = {
>
>  static const VMStateDescription vmstate_nvic = {
>      .name = "armv7m_nvic",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> +    .version_id = 2,
> +    .minimum_version_id = 2,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(systick.control, NVICState),
>          VMSTATE_UINT32(systick.reload, NVICState),
>          VMSTATE_INT64(systick.tick, NVICState),
>          VMSTATE_TIMER_PTR(systick.timer, NVICState),
> +        VMSTATE_UINT32(prigroup, NVICState),
>          VMSTATE_END_OF_LIST()
>      }
>  };
>
