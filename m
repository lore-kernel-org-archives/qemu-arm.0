Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1831237lfm;
        Mon, 15 Jun 2020 09:18:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVThk/j/BHjpc7F4AS2/eB2ifUXrxYOe5Gin4+ydFSGIlTavUcGSIC4AXLV+1w4Wjb0iFv
X-Received: by 2002:a9f:2788:: with SMTP id b8mr19558233uab.81.1592237929680;
        Mon, 15 Jun 2020 09:18:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592237929; cv=none;
        d=google.com; s=arc-20160816;
        b=GwWeh1U+8bjYjnuMgjfjO9bfNkKEGRcIhLhUf8AEFme3kvBP9IVatT58wRsM1cyWk0
         NDzcj9wk8qNFcqIVcQ+dDl9DKbsBcQrzy0WtRYv2WuiFdBf9xv3NoYQbNZDq4IpkXCna
         UZkFZ8n4FSrCo4UKbN20B4RrXnxW0dfZA/Ba70bpKhW7XRO7iL5rBT44OGIUFdjOlhUs
         XDuB7DrrdDlFTa20poppX3qwr1nvSQM1FHlCYH5mSheeCq4SFjVOK17Fz7Y2hfohZaDm
         /Pxp+tusFygcPL74+yFJvII1F1abLb+Zf6mm+YUtO/nVU+Bk834IesBUOD2McP59PjCd
         3Ekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=zC4goslGunDLLrNxY4ATSQMQcFz/lPFddQgtcjnZqng=;
        b=DIZnpEjOcDqSuNBW8nh54Cub9juR7NqemBn1bexNdjVTeUYNGBuxyEEcFUsJD2CoRC
         m77kYkA9UniIbWHmxbCc4JLKZR20nwuLROSAQ81yZMtRWyDet3dJb9vbsJ96ZljADKoK
         zvLi8elLqjzu8bzkiE/JrsNtZy0khvdyvG3ms6gnQZX7/N1h5WO54ta5OYmOarZLRQNm
         aLJV7rnOW2VrPY9uGX3pZjMNi5iuDJYd9e5+8bHEgzBJXvVhSukbP1ix5qJ50a5uWtSZ
         V5KRFIEg4s+I5Lc3XmkI/ZAmVOvNzs/NvwqxTAQHtDEoGAB01cR6W71X9DECiME/BQMR
         Xkog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CupwCTMO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r12si1578488vsq.11.2020.06.15.09.18.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jun 2020 09:18:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CupwCTMO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:46640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jkrou-0007bN-UB
	for alex.bennee@linaro.org; Mon, 15 Jun 2020 12:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jkroX-0007A1-RH; Mon, 15 Jun 2020 12:18:25 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:40071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jkroW-0004B7-0H; Mon, 15 Jun 2020 12:18:25 -0400
Received: by mail-ed1-x544.google.com with SMTP id p18so11956526eds.7;
 Mon, 15 Jun 2020 09:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zC4goslGunDLLrNxY4ATSQMQcFz/lPFddQgtcjnZqng=;
 b=CupwCTMOUfSPgQPbktUrbFB2lbOSeajPPY4L1qlAjtuHSD2rXpOfsFzT7Ck46gl832
 aREtpQYp7HItdSj+3fauiwZKhJZeT0oOQ/L25ObpuXYAzqwMxI/VPZd101Iz4szdmNN2
 v+cZ9FZJ9nJ3MyDgTh1hWik7BA/XCoBSJU6SS2YAbt4eYVIm51apwYmVwyTwhBbiQRim
 AUP/P8GpXXu5G/AVVsBwL+4g3duT7ht/tEzrAbDKeVrg3Rb8s4rSqzboZ1r2Uowj/t0O
 OlQRNLVRgGsGGdaPGEG1O6IxUblEOW8yzY/KFYoljMJPJnm7Q8CeracGw8+hREdlpFjq
 bI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zC4goslGunDLLrNxY4ATSQMQcFz/lPFddQgtcjnZqng=;
 b=Zz27/UENbbf5Sx8xew4JrZDEN+nXAhO9AGQRmHIq56iwjq5XHEA3+H3CXkuvkyqlBD
 izEmf97wcExdGOHoE2elUGkqjo35T3uiKkQFvGzAezr59fDZUk45iC43q8m4rooYPAKF
 42Rgo80B6hVy/Me+4hSdqaT0Id57L3uyklYVyoN83g7XlFKLmkWWGFFbBLAN/497od5s
 W7USbLsEwE0UG95G/t26bP7WOeRfr++qMOk3E3Uez7hYGKxFggvWFmZWICZ4ntpWMCnH
 N3x5Xxh1WrEVqiCwzfFXHRluID879BuWV3w1BS9JYVVrpkiqPLvYut7LotNuoQST79ze
 4iPQ==
X-Gm-Message-State: AOAM53065H7gZViyenEgczfEYBz3iWp37+IYv2kuRiNoj/jbICCEfU7V
 xvndXa4L6Hajn82hdo+sFyWIEf82
X-Received: by 2002:a50:a701:: with SMTP id h1mr23910970edc.170.1592237901453; 
 Mon, 15 Jun 2020 09:18:21 -0700 (PDT)
Received: from [192.168.1.38] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id g22sm8676688edj.63.2020.06.15.09.18.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2020 09:18:20 -0700 (PDT)
Subject: Re: [RFC PATCH v2 5/5] hw/arm/tosa: Use LED device for the Bluetooth
 led
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200612175440.9901-1-f4bug@amsat.org>
 <20200612175440.9901-6-f4bug@amsat.org>
 <CAFEAcA9tMd0VxEm_O1yre36kWp0U48SZj8tMna25h5M02X-_VQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d2f6adcc-a796-26bf-9463-5e9bbc143197@amsat.org>
Date: Mon, 15 Jun 2020 18:18:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9tMd0VxEm_O1yre36kWp0U48SZj8tMna25h5M02X-_VQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Eric Blake <eblake@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: clgryFRzHvzl

On 6/15/20 6:00 PM, Peter Maydell wrote:
> On Fri, 12 Jun 2020 at 18:54, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/arm/tosa.c  | 7 +++----
>>  hw/arm/Kconfig | 1 +
>>  2 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
>> index 5dee2d76c6..86d7e0283a 100644
>> --- a/hw/arm/tosa.c
>> +++ b/hw/arm/tosa.c
>> @@ -24,6 +24,7 @@
>>  #include "hw/irq.h"
>>  #include "hw/ssi/ssi.h"
>>  #include "hw/sysbus.h"
>> +#include "hw/misc/led.h"
>>  #include "exec/address-spaces.h"
>>
>>  #define TOSA_RAM    0x04000000
>> @@ -68,9 +69,6 @@ static void tosa_microdrive_attach(PXA2xxState *cpu)
>>  static void tosa_out_switch(void *opaque, int line, int level)
>>  {
>>      switch (line) {
>> -        case 0:
>> -            fprintf(stderr, "blue LED %s.\n", level ? "on" : "off");
>> -            break;
>>          case 1:
>>              fprintf(stderr, "green LED %s.\n", level ? "on" : "off");
>>              break;
> 
> Why convert the blue LED and not the green, amber or wlan LEDs ?

I don't have the schematics to verify the mapping is correct:

#define TOSA_GPIO_BT_LED		(TOSA_SCOOP_JC_GPIO_BASE + 0)
#define TOSA_GPIO_NOTE_LED		(TOSA_SCOOP_JC_GPIO_BASE + 1)
#define TOSA_GPIO_CHRG_ERR_LED		(TOSA_SCOOP_JC_GPIO_BASE + 2)
#define TOSA_GPIO_TC6393XB_L3V_ON	(TOSA_SCOOP_JC_GPIO_BASE + 5)
#define TOSA_GPIO_WLAN_LED		(TOSA_SCOOP_JC_GPIO_BASE + 7)

static void tosa_out_switch(void *opaque, int line, int level)
{
    switch (line) {
        case 0:
            fprintf(stderr, "blue LED %s.\n", level ? "on" : "off");
            break;
        case 1:
            fprintf(stderr, "green LED %s.\n", level ? "on" : "off");
            break;
        case 2:
            fprintf(stderr, "amber LED %s.\n", level ? "on" : "off");
            break;
        case 3:
            fprintf(stderr, "wlan LED %s.\n", level ? "on" : "off");
            break;
        default:
            fprintf(stderr, "Uhandled out event: %d = %d\n", line, level);
            break;
    }
}

    qdev_connect_gpio_out(scp1, TOSA_GPIO_BT_LED, outsignals[0]);
    qdev_connect_gpio_out(scp1, TOSA_GPIO_NOTE_LED, outsignals[1]);
    qdev_connect_gpio_out(scp1, TOSA_GPIO_CHRG_ERR_LED, outsignals[2]);
    qdev_connect_gpio_out(scp1, TOSA_GPIO_WLAN_LED, outsignals[3]);

I wanted a simple proof-of-concept I could test with a board,
to show how easy this API can be used.

Using the binaries from here:
https://www.omegamoon.com/blog/static.php?page=ZaurusAndroid

the blue LED never blinks, probably because we remove the
bluetooth stack. Or maybe I haven't figured the correct
command line options.

For the next RFC I plan to rework to have a single LED container
per board, to have a unique singleton object that generates QMP
events.

> 
> thanks
> -- PMM
> 
