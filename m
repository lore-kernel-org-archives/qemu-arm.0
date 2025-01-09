Received: by 2002:a05:7022:43a6:b0:92:a90b:6588 with SMTP id bo38csp1339324dlb;
        Thu, 9 Jan 2025 03:40:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWls4MT0hzuxp/mp+DIGIKd1PKj9OVN/ZZvIWLMgNdZ9fD7eB3pptSSjPG/XAohHjgT0spALswsY/HPXw==@linaro.org
X-Google-Smtp-Source: AGHT+IG8yowP0G+gnEGclVOYKek5jrRlzblmwAwOyK7kHKyxf7gkR4BaC/QIKzVq38JfsSfZfcpl
X-Received: by 2002:a05:620a:2908:b0:7b6:cb81:95a with SMTP id af79cd13be357-7bcd975c713mr942047785a.26.1736422837303;
        Thu, 09 Jan 2025 03:40:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736422837; cv=none;
        d=google.com; s=arc-20240605;
        b=GG5fMAHCpKHIkBJgubsOOoehI2Of/5b7IPmOdqjUk2LFXV4dovxKSvknyge5Ej2XM+
         EBCnFpx9Svz07DUoOgN+uavUWdo8n6JLfVSGs/Q4zxtFcFOa6lxPCRG1dYaG5pMMdm5C
         A+4xNiAB1ighWBODNCM+7pGZwZDcdXyP7AoxRZsoUDr5kIpDD28OwgqJaMqWxXJr+Y+t
         astubOObSaBgK3RMNVvQH0L42iC56hRmZtEx7Cnr+jHnVNdUQFNtzjYjfJHxNcIx6SQ7
         Ml4IhD2Y2QHf/0I8bHkOgSkVJAmruONrC7FtJnkzTS4FMn0QtBQ+60540IASz9QU7RoF
         zz+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/GpW8pi5DDmdwrBTd4YRCzdbdOjWSGX1R38gOGZ1JAs=;
        fh=I3Wm7j4vsVzfIOEX97uiOZFAhvVEztmzy+YWNtFd4Gk=;
        b=ilkYRNW25IHBjGci50AFQtrNK7GTjadUMYu5LlSIZS6Pb2uRXKZb47ushCmZtvM0eI
         qSqMEFfP4D6b8t7ebVAXGAszF9XAoQ+N54Mw8EgdNghmsf/QFSufGayBBuCFHiZWvxju
         96QuXuYdpHg31YkgqQ++d/jxoOfU9x2f7JH/EK+GgSacEVeC9H/XNlj4xk7rW6ZhSB6q
         ccw9wbEEmf9UWFXbBaU3XjRm9CVEXAXQMiJTJYGqYsn8jlm3wx1gT/RHS0dRNmnCqaK0
         Ej49z8XTQ+EVWJUmWoj7Rdk9yWP0Ni4YRQEUpTvQ53Gnc+a2R5JcQii7wwDYeqJF3Whg
         IGqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="m+vzVU1/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7bce34fddd2si134948785a.469.2025.01.09.03.40.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jan 2025 03:40:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="m+vzVU1/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tVqth-0003zC-Ai; Thu, 09 Jan 2025 06:40:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tVqtd-0003yA-Oq
 for qemu-arm@nongnu.org; Thu, 09 Jan 2025 06:40:19 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tVqtZ-00007l-OG
 for qemu-arm@nongnu.org; Thu, 09 Jan 2025 06:40:16 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4361dc6322fso6109125e9.3
 for <qemu-arm@nongnu.org>; Thu, 09 Jan 2025 03:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736422812; x=1737027612; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/GpW8pi5DDmdwrBTd4YRCzdbdOjWSGX1R38gOGZ1JAs=;
 b=m+vzVU1/7h1grTW27k82BMwxV+Gq1dR4bMu5rhEftETLpkjJyFggjbf3J9e8rLLlaN
 GiqfVFPr5CQsfZCUbA9LvtMFsllna8zmpX4o6kuEwbecr/h13usfOHI6msF2HMtxvJ8w
 mvo9/CraMRLXNX89LNR5yc64bgm36y78RQZ2r7pO4dbKr59xXS3QXeqTxCDlwAKI/SjL
 gWiqFpBfRULr4Lm528vYsdw298DuHkAAvTOEfO5SdBpN7qwF8qLv3+XGonO6njtmZXyG
 w8Ak7+rTQKThL1CckDpwBNupRSMS2zMQTPTBQIcuoXSxmHSgcnaQ5CXUxSbrzkotvfKw
 xmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736422812; x=1737027612;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/GpW8pi5DDmdwrBTd4YRCzdbdOjWSGX1R38gOGZ1JAs=;
 b=ayGsFQUBUpD3eGW/qI6auPKycjR3eOVIJylSGkQqN0Ele1emXKXfOWac0ALJuVMuUA
 hCiFLIz3UksRHVhjCld30MO2nHaC2H54N+Pa9m5G/RoeBlGuHlW3dKNTWQOUk/JE//Eo
 d/6Ld+RW9Mp0WCIvX5dg1IzEEQkaimR5w/WunFaFIKjLUA59j2CpNhh6BmEIjkyq4/r/
 GX+I0avalKwQM0VtbnlnqcGEWea9mWYOIQhuP+UR9RICzTvfXLuC9Na3Zc0AwOS6B12D
 rpDTKnQbVq7r9zljsn6HlZz/Cb8hpnDnmPP5D3S8To0PV9DXLCKOz9QIyAqi5mpFKRJu
 WoXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTpNbUpVQTGgQ4FmkxVuJOS2i5oL1vRxHvoBvf5NMYZeYY9wqTuNnuiWy1UqV07XssIqjQh444Xw==@nongnu.org
X-Gm-Message-State: AOJu0YwQARaCHuDMjdSiq5ojVKy40j6rr9RJIMevF9CXGk0Nq55P8kyn
 JhSeADdZ6FHfgNTOyvrsEK+PYbFjwRUC/emi1HZqxXqxyZq2VtAm1LeztE8E+kw=
X-Gm-Gg: ASbGncs41CdbJ/uY/DgZKNfszt/8ar4wZgJz42bPYXi7Bb1GPBupxO9Xm0obwbqSGA6
 UIHngQh/64TKz81Oawbp8+nUaqugJxtosGdSYXTqzMvaKEGOyhFw/TkuRCGM0bTWc5ud1rr91Tp
 Odj/JxNvQMr28eCDTuLjVstPmdZru3g7pf3SJVflzTQXqEpOQPFn0Ls6UTwcFCCP9uhJ/TsqCC+
 YU5d4hQVMvc/vDZ3NUQ0lrCEn94fVHgTgefmlVBHzWWI5I+f44er2nwVHNoKup8X3760nZm/QsJ
 5gsRkUBDhEUyak5VUh11vzdT
X-Received: by 2002:a05:600c:35c1:b0:434:a468:4a57 with SMTP id
 5b1f17b1804b1-436e26efb22mr51308445e9.26.1736422811716; 
 Thu, 09 Jan 2025 03:40:11 -0800 (PST)
Received: from [192.168.69.102] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b8299sm1583646f8f.74.2025.01.09.03.40.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 03:40:11 -0800 (PST)
Message-ID: <342ca371-3e14-4108-9c45-e15cda51b9ca@linaro.org>
Date: Thu, 9 Jan 2025 12:40:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/14] hw/sd/sd: Allow for inverting polarities of
 presence and write-protect GPIOs
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Fabiano Rosas <farosas@suse.de>,
 Guenter Roeck <linux@roeck-us.net>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20250108092538.11474-1-shentey@gmail.com>
 <20250108092538.11474-9-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250108092538.11474-9-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: KwaYdGDuWayv

Hi Bernhard,

On 8/1/25 10:25, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/sd/sd.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)


> @@ -876,8 +878,8 @@ static void sd_reset(DeviceState *dev)
>       sd->cmd_line = true;
>       sd->multi_blk_cnt = 0;
>   
> -    qemu_set_irq(sd->readonly_cb, sd_get_readonly(sd));
> -    qemu_set_irq(sd->inserted_cb, sd_get_inserted(sd));
> +    qemu_set_irq(sd->readonly_cb, sd_get_readonly(sd) ^ sd->readonly_active_low);

Please embed in sd_get_readonly(),

> +    qemu_set_irq(sd->inserted_cb, sd_get_inserted(sd) ^ sd->inserted_active_low);

and sd_get_inserted().

>   }
>   
>   static void sd_cardchange(void *opaque, bool load, Error **errp)
> @@ -896,9 +898,9 @@ static void sd_cardchange(void *opaque, bool load, Error **errp)
>       }
>   
>       if (sd->me_no_qdev_me_kill_mammoth_with_rocks) {
> -        qemu_set_irq(sd->inserted_cb, inserted);
> +        qemu_set_irq(sd->inserted_cb, inserted ^ sd->inserted_active_low);

Use sd_get_inserted(),

>           if (inserted) {
> -            qemu_set_irq(sd->readonly_cb, readonly);
> +            qemu_set_irq(sd->readonly_cb, readonly ^ sd->readonly_active_low);

and sd_get_readonly() here.

>           }
>       } else {
>           sdbus = SD_BUS(qdev_get_parent_bus(dev));
> @@ -2797,6 +2799,8 @@ static void emmc_realize(DeviceState *dev, Error **errp)
>   
>   static const Property sdmmc_common_properties[] = {
>       DEFINE_PROP_DRIVE("drive", SDState, blk),
> +    DEFINE_PROP_BOOL("cd-active-low", SDState, inserted_active_low, false),
> +    DEFINE_PROP_BOOL("wp-active-low", SDState, readonly_active_low, false),
>   };
With the requested changes:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

