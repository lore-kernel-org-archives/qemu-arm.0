Received: by 2002:a17:906:2317:b0:a3e:79c1:d636 with SMTP id l23csp144663eja;
        Thu, 22 Feb 2024 02:10:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVODl0yuQkL7RIQT5wVBW+6+lYP2e8Ngc9NpH+jyJUWvEcjZIxGwRt/Bs/l9bmpEKWOM4TtDGS2SRXWFT/UEvirvXOUiL7f
X-Google-Smtp-Source: AGHT+IFjlQK4QhBqoEhZdfGlQMfm2JycQZFSLidF676zXd4HzysiHGgFWYLTl+Qd2OabpbcSCKLE
X-Received: by 2002:a05:622a:2c2:b0:42e:1245:d5eb with SMTP id a2-20020a05622a02c200b0042e1245d5ebmr12652716qtx.46.1708596651735;
        Thu, 22 Feb 2024 02:10:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708596651; cv=none;
        d=google.com; s=arc-20160816;
        b=Wpi7HVHr3RcJr/nYt3dyK4JVqWC/NQcRExPxIT1+3dIDjrk4A5SFGgWoCFNOnR8258
         cmziu7qXOQ/BWVaRsSTEH+c4IwM7RGbojhSwVll9dRQYdbeJZ2ghFs2tyLgS+a2NDrEg
         JQFzmJrCLA+ckwZSLZioJ3373Hc7WmyJPAEH86e4EDVjeKsc/U2hjRpJwEO1pTSHu7WT
         YkrsbAdj/H8VnEXxa0mCgpeOcSmNCrErKBFW9vWlIcZwMnAyPHcTG/10+9vCWTPVZNxU
         BMK6oX/uvz+cJovpizoxamCQVSBHJxZUg0TvTWW1kHk+FSTzFVDj2Jzv0HNBFmsizsJS
         FJdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=MpRQRvPMdTz33T7Nn52zSwd0okxqNSiTPY20Y4YiyDw=;
        fh=9LTQT4EG35QNdMxHKJoANPJIR6LO4OxTaFkT79epfX4=;
        b=XMHwn+6lK1L3BrGbLt/XoOyxkpTVcqoMEwwkPhD0KZROD7nxAMgsxEN9Ib6/P6PRV9
         avNwWMvpD+M9I3SavUz5qZDDpRIfHTWzpct7v/TVboLbeMdS5/OK+UojJCD+yK/y02pY
         wbe6EdZrbWE0mqAslR8W1G2z54f1FbBNId/Gsn5q9Mr//y3ebhL3ZrzBGtPDULO5QLr+
         GCk3P4SY7nEv+OqDuJRd9Ok7HAxRn5+DsRuhoAgSVu7L8t8a/m/vyQsuiwWXK5li+1Yv
         Ov8zeloWkmhHJT02rCuihJiaP/F+S2usu5GhxoqYogTmXDTDzgyVxpENHwrJDVKKxdC0
         h1ww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cc2cq064;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f14-20020ac8464e000000b0042c5d1612a1si11828698qto.152.2024.02.22.02.10.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 02:10:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cc2cq064;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rd629-00070v-0r; Thu, 22 Feb 2024 05:10:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rd628-00070i-4q
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 05:10:28 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rd61p-0001I7-7c
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 05:10:26 -0500
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-512be6fda52so4761232e87.0
 for <qemu-arm@nongnu.org>; Thu, 22 Feb 2024 02:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708596607; x=1709201407; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MpRQRvPMdTz33T7Nn52zSwd0okxqNSiTPY20Y4YiyDw=;
 b=Cc2cq064id9+h/nB1gAeieR/2SUI+/Lj3v1jg9DtFiCIte5iNFgkNhnTSnPWP4b5vo
 5f/Y2B435FTLUCj2qYmjgcrmWMo2OTwxvJlK2NbN4ocRwaBUjZ4wm3hRDEJB7FTaff6z
 AzLu9eZAxF/6M1Aa8l9GZZ0lY1Z1p+3Awqk2Mz8e6B2j+DXNyBZr913ioVgMSXNtTxIL
 VfOQWzP5Y3NbX3YzmYBLdr9hcbz8twV0kL3K0w9Vfilf8RpnWNod7LeoDUIlDfVs7lG8
 zRnZURHMboC5tNfdyRwmVuZuK5Fa1k/TNeIdH/U82YY/TGxvStWHSK7hVE7LPFWJDreB
 KdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708596607; x=1709201407;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MpRQRvPMdTz33T7Nn52zSwd0okxqNSiTPY20Y4YiyDw=;
 b=OApcAZtiYLiAZEa3jvLfbtHA+ky/ra1Q3UBwAeIfbe/c30EcJvxtR5h2vDGNS7iu6a
 oGPmD/YUgPkYXykWPm/WxCydVdYlTxWEzIjO2kPi3SNdrg3dbI4qmdHCl8xLi4w3ZUzc
 JCYVdRoswpCwrx7suw/OyDRRikjWeXsjcgA/RavbTIHQ7muvbsBWN2qHfx9MJvZmizXg
 8ioHKK1S7zd3OLQrQQtG9wuXgoL4L7ePVlvUysde9cDRzWWn1ffA7tin9sf8XcLTs7Kl
 XtpCpb5J/hFguA8HFi7vPWGV9yFy5NZmDfXxR/WLnrA5KNsyOiBP4eTvyBJeKuQRqbS8
 68Rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkFUoUK3qGFXDOqew8zMcqtvpdj2aWhwdOECjb8XhZCtk1OxUfaD7xNkvXlvVAr/dFShufU3klBjHy0DRZ8hcGsNM1
X-Gm-Message-State: AOJu0YxcAPrZoKBv4pl2wChsMXLzNHAswuk5oAJgy0y85JmzHFvinO1O
 BPYJBZ2T6lfxX8iK5X5pb1MHu2ULoT+weSw55IAISAHY8DzJIKcoAFE45SjEzjy58PNlMfJ2+Yr
 st2c=
X-Received: by 2002:a05:6512:398f:b0:512:dde1:2226 with SMTP id
 j15-20020a056512398f00b00512dde12226mr911157lfu.47.1708596607205; 
 Thu, 22 Feb 2024 02:10:07 -0800 (PST)
Received: from [192.168.247.175] (41.red-95-127-32.staticip.rima-tde.net.
 [95.127.32.41]) by smtp.gmail.com with ESMTPSA id
 f21-20020ac25335000000b00512d86c2c78sm375667lfh.88.2024.02.22.02.10.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 02:10:06 -0800 (PST)
Message-ID: <caa10a96-729a-4ee8-93f4-9bfd2b032e2b@linaro.org>
Date: Thu, 22 Feb 2024 11:10:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/21] hw/i386/pc: Do not use C99 mixed-declarations style
Content-Language: en-US
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20240216110313.17039-1-philmd@linaro.org>
 <20240216110313.17039-2-philmd@linaro.org> <ZdcP9A7n5w7RJqii@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <ZdcP9A7n5w7RJqii@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x131.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lFoLZx6P4UaR

On 22/2/24 10:12, Zhao Liu wrote:
> Hi Philippe,
> 
> On Fri, Feb 16, 2024 at 12:02:52PM +0100, Philippe Mathieu-Daudé wrote:
>> Date: Fri, 16 Feb 2024 12:02:52 +0100
>> From: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Subject: [PATCH 01/21] hw/i386/pc: Do not use C99 mixed-declarations style
>> X-Mailer: git-send-email 2.41.0
>>
>> QEMU's coding style generally forbids C99 mixed declarations.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/i386/pc.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index 196827531a..3c00a87317 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -1227,6 +1227,7 @@ void pc_basic_device_init(struct PCMachineState *pcms,
>>        */
>>       if (pcms->hpet_enabled) {
>>           qemu_irq rtc_irq;
>> +        uint8_t compat;
>>   
>>           hpet = qdev_try_new(TYPE_HPET);
>>           if (!hpet) {
>> @@ -1238,8 +1239,7 @@ void pc_basic_device_init(struct PCMachineState *pcms,
>>            * use IRQ16~23, IRQ8 and IRQ2.  If the user has already set
>>            * the property, use whatever mask they specified.
>>            */
>> -        uint8_t compat = object_property_get_uint(OBJECT(hpet),
>> -                HPET_INTCAP, NULL);
>> +        compat = object_property_get_uint(OBJECT(hpet), HPET_INTCAP, NULL);
>>           if (!compat) {
>>               qdev_prop_set_uint32(hpet, HPET_INTCAP, hpet_irqs);
>>           }
> 
> "compat" is only used here to check. So, what about getting rid of this
> variable?
> 
> if (!object_property_get_uint(OBJECT(hpet), HPET_INTCAP, NULL)) {
>      qdev_prop_set_uint32(hpet, HPET_INTCAP, hpet_irqs);
> }

Ah yeah, I didn't noticed, thanks!

