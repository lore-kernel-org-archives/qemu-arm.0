Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3871591lfb;
        Mon, 16 Nov 2020 09:02:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypjwQBsRZZHwwFARWjmckNa5xZUsQTzN3gRoSjI8Zb8J6+RM8SFBZ/GwVn57x0Z1zN6gMq
X-Received: by 2002:a25:ef4c:: with SMTP id w12mr19333762ybm.514.1605546175903;
        Mon, 16 Nov 2020 09:02:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605546175; cv=none;
        d=google.com; s=arc-20160816;
        b=UasM67BZ3kUnWsMMbdy/mZwW7FQg7CfjICAPl4cglbMEPRe/stcB1aBlAOKD2rZVAE
         CbST9KFKxrmraOdrd2cY1spFgatV0fG9m4rYR6GnJgBLlb1/snn/RyoupNoIJkDVhMsT
         j/s72D+1inQolPXh/qtsQn8ynBp97DpdsAARGS6/ULi7TxtD620HmXCcZR5pRrM3GQwS
         kesC3QbEEvSma/Z/3RCLb0vtTyvymAvcd2Y6+hVv1f94F2IrUCGRggF3yYHAZ+NK9tX4
         ucf7eaWZdHizzRv4zrO0wxNoG3TcF4u7bEzZ20ZIj0LY0vOUgo1GcaMouDCITB5PRaUn
         yGCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=vZcx1gf4ngMbUNOcJKN5FtbK9yLb5jnJEMw2iY+Kl4Q=;
        b=O0ciwvIkUT0/GFog6q8HOnsTFlkNXKJaNLs6sYUW9EZkbtORGM8wi6bbPZFsE9kF34
         RLaMhBJ8c85gQWaigSffyTWFwgn63n0/AZ4EydLfsAx0aDtxbbgSURZKo0C4QqqGfSjg
         7FiIf6ulJtOBUYTer4SY43qqVIuX5uT7YAIzt/a5quTgyEOZj4vzpGKweyjcUxWAUqCc
         +qu+vCrDbO49Xj50yuKc0sYL4JbfTyjSZRK8B5avwTtG2dj6RaKxRgi+wP1j6ncsCdc/
         1Cz0ViCfZLeRNwmRwTAjYkaprE64noxovH7uZYoEPg1/zcegnXPUN8K2KoJqDAcDtoqg
         bXVg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f187si18235654yba.497.2020.11.16.09.02.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 09:02:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kehu3-0001x2-5R
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 12:02:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kehs9-0000q8-FA
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 12:00:57 -0500
Received: from 5.mo52.mail-out.ovh.net ([188.165.45.220]:58204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kehrv-0000fY-TG
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 12:00:57 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.250])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 8CD21203B17;
 Mon, 16 Nov 2020 18:00:32 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 16 Nov
 2020 18:00:31 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005eddb01d5-9fa6-466c-92ed-dcf5f6cbe392,
 4C8231DAC7BA0B5668AD0293EB9EBEB96F7691F2) smtp.auth=clg@kaod.org
Subject: Re: [PATCH 2/2] tmp105: Correct handling of temperature limit checks
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20201110150023.25533-1-peter.maydell@linaro.org>
 <20201110150023.25533-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <24d24e3a-b594-c45e-309e-a1bb51586d6b@kaod.org>
Date: Mon, 16 Nov 2020 18:00:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201110150023.25533-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 03c924b4-b0fe-4117-bbe9-c6a6e348c6b1
X-Ovh-Tracer-Id: 12695647353376836573
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudefuddgleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeduvdetleefffevieejtedvjeejjeevhfegvddtleejffefvdfftdduteetleevnecuffhomhgrihhnpehtihdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhg
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo52.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 12:00:33
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: Z+X0IOW6/8JP

On 11/10/20 4:00 PM, Peter Maydell wrote:
> The TMP105 datasheet says that in Interrupt Mode (when TM==1) the device
> signals an alert when the temperature equals or exceeds the T_high value and
> then remains high until a device register is read or the device responds to
> the SMBUS Alert Response address, or the device is put into Shutdown Mode.
> Thereafter the Alert pin will only be re-signalled when temperature falls
> below T_low; alert can then be cleared in the same set of ways, and the
> device returns to its initial "alert when temperature goes above T_high"
> mode. (If this textual description is confusing, see figure 3 in the
> TI datasheet at https://www.ti.com/lit/gpn/tmp105 .)
> 
> We were misimplementing this as a simple "always alert if temperature is
> above T_high or below T_low" condition, which gives a spurious alert on
> startup if using the "T_high = 80 degrees C, T_low = 75 degrees C" reset
> limit values.
> 
> Implement the correct (hysteresis) behaviour by tracking whether we
> are currently looking for the temperature to rise over T_high or
> for it to fall below T_low. Our implementation of the comparator
> mode (TM==0) wasn't wrong, but rephrase it to match the way that
> interrupt mode is now handled for clarity.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

LGTM,

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>  hw/misc/tmp105.c | 70 +++++++++++++++++++++++++++++++++++++++++-------
>  hw/misc/tmp105.h |  7 +++++
>  2 files changed, 68 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/misc/tmp105.c b/hw/misc/tmp105.c
> index 0a4aad4854..d299d9b21b 100644
> --- a/hw/misc/tmp105.c
> +++ b/hw/misc/tmp105.c
> @@ -41,16 +41,40 @@ static void tmp105_alarm_update(TMP105State *s)
>              return;
>      }
>  
> -    if ((s->config >> 1) & 1) {					/* TM */
> -        if (s->temperature >= s->limit[1])
> -            s->alarm = 1;
> -        else if (s->temperature < s->limit[0])
> -            s->alarm = 1;
> +    if (s->config >> 1 & 1) {
> +        /*
> +         * TM == 1 : Interrupt mode. We signal Alert when the
> +         * temperature rises above T_high, and expect the guest to clear
> +         * it (eg by reading a device register).
> +         */
> +        if (s->detect_falling) {
> +            if (s->temperature < s->limit[0]) {
> +                s->alarm = 1;
> +                s->detect_falling = false;
> +            }
> +        } else {
> +            if (s->temperature >= s->limit[1]) {
> +                s->alarm = 1;
> +                s->detect_falling = true;
> +            }
> +        }
>      } else {
> -        if (s->temperature >= s->limit[1])
> -            s->alarm = 1;
> -        else if (s->temperature < s->limit[0])
> -            s->alarm = 0;
> +        /*
> +         * TM == 0 : Comparator mode. We signal Alert when the temperature
> +         * rises above T_high, and stop signalling it when the temperature
> +         * falls below T_low.
> +         */
> +        if (s->detect_falling) {
> +            if (s->temperature < s->limit[0]) {
> +                s->alarm = 0;
> +                s->detect_falling = false;
> +            }
> +        } else {
> +            if (s->temperature >= s->limit[1]) {
> +                s->alarm = 1;
> +                s->detect_falling = true;
> +            }
> +        }
>      }
>  
>      tmp105_interrupt_update(s);
> @@ -197,6 +221,29 @@ static int tmp105_post_load(void *opaque, int version_id)
>      return 0;
>  }
>  
> +static bool detect_falling_needed(void *opaque)
> +{
> +    TMP105State *s = opaque;
> +
> +    /*
> +     * We only need to migrate the detect_falling bool if it's set;
> +     * for migration from older machines we assume that it is false
> +     * (ie temperature is not out of range).
> +     */
> +    return s->detect_falling;
> +}
> +
> +static const VMStateDescription vmstate_tmp105_detect_falling = {
> +    .name = "TMP105/detect-falling",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = detect_falling_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_BOOL(detect_falling, TMP105State),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static const VMStateDescription vmstate_tmp105 = {
>      .name = "TMP105",
>      .version_id = 0,
> @@ -212,6 +259,10 @@ static const VMStateDescription vmstate_tmp105 = {
>          VMSTATE_UINT8(alarm, TMP105State),
>          VMSTATE_I2C_SLAVE(i2c, TMP105State),
>          VMSTATE_END_OF_LIST()
> +    },
> +    .subsections = (const VMStateDescription*[]) {
> +        &vmstate_tmp105_detect_falling,
> +        NULL
>      }
>  };
>  
> @@ -224,6 +275,7 @@ static void tmp105_reset(I2CSlave *i2c)
>      s->config = 0;
>      s->faults = tmp105_faultq[(s->config >> 3) & 3];
>      s->alarm = 0;
> +    s->detect_falling = false;
>  
>      s->limit[0] = 0x4b00; /* T_LOW, 75 degrees C */
>      s->limit[1] = 0x5000; /* T_HIGH, 80 degrees C */
> diff --git a/hw/misc/tmp105.h b/hw/misc/tmp105.h
> index e5198fce80..7c97071ad7 100644
> --- a/hw/misc/tmp105.h
> +++ b/hw/misc/tmp105.h
> @@ -43,6 +43,13 @@ struct TMP105State {
>      int16_t limit[2];
>      int faults;
>      uint8_t alarm;
> +    /*
> +     * The TMP105 initially looks for a temperature rising above T_high;
> +     * once this is detected, the condition it looks for next is the
> +     * temperature falling below T_low. This flag is false when initially
> +     * looking for T_high, true when looking for T_low.
> +     */
> +    bool detect_falling;
>  };
>  
>  #endif
> 

