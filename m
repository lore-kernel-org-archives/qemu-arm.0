Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2978025lfm;
        Mon, 22 Jun 2020 01:37:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKFA7WcMcNqYHkHeWNV5Zj754D4s1ADDCLWNB/ocZ160avdQBpmfu6+YRZFAJi0SKTyxCC
X-Received: by 2002:a25:ba88:: with SMTP id s8mr26700667ybg.187.1592815075432;
        Mon, 22 Jun 2020 01:37:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592815075; cv=none;
        d=google.com; s=arc-20160816;
        b=NEIs+8B5xw/e+83+zwUT8I+Ybk+OOUHPTonJOl/cglCV7II83+9P9q54OR4u3TENYm
         ZCckv2pfpq2CO9oHalfM9C0g6qKUIYqzqzdi8sZVzgIfmrDzj1v6Xe+IKMnAEkG9O/po
         uwYUDH7P+Ip+4HDroIf2afBsOtoM0YlbkDE+eu7H5yj2X8WIpI6zpOKCOcdpZzSmoY4g
         loeqA2uD7Sr8D6Ki2oqv/g0tVGEayx1PNNBzQ5bFWHKnNL/fGHUKicWeOkro4g9BzdNl
         01Q3/lX6SsH6L5Hwvf5JUlDba6PwrC+rf+dE/YdQaS+ZdLM39AYR56dzaHyY0ycE/dFx
         WlNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=HqPLRcvm+n/38+Y+FSi/EkoZ0IfGdv4LsKsyqNHMlFU=;
        b=EDKb8RPREqjNqNGZ1PiyiVsFlXSHJoCgT4+bjk3N3Ec7t3Dx+1jo7DNVoTmiJ6+hmB
         4QTHkD4zaNxVbS2GANBUsq2ectLApSxz6WGeSzNE4iiWGSRMeUVjIYijqAzhZ0PBWTYv
         EZ98zlcDj28MxH2u+8ffbc5NE761OFqcr7kBF0UgvtXx8nYgOSwXn3Vwt6Y7BCUWHvqg
         PDOyl8ITD9wg+MW/tUjuJoN2qgS4qME9rgbhqkk8OkMyEUIxiyGbCVIzFcv4FJKurF8m
         zZ1gbzHw0kxPJDK57ThFOZ9Lf5u84XW+fvFb0wALlg/fGqYEztySV68nJBxnu/OIIP0H
         gLEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LiHCyBKv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j126si12399374ybb.172.2020.06.22.01.37.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jun 2020 01:37:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LiHCyBKv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:52694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnHxi-0003mu-R2
	for alex.bennee@linaro.org; Mon, 22 Jun 2020 04:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jnHxW-0003me-UB; Mon, 22 Jun 2020 04:37:42 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:37095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jnHxV-0001bw-CJ; Mon, 22 Jun 2020 04:37:42 -0400
Received: by mail-wr1-x442.google.com with SMTP id a6so13775060wrm.4;
 Mon, 22 Jun 2020 01:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HqPLRcvm+n/38+Y+FSi/EkoZ0IfGdv4LsKsyqNHMlFU=;
 b=LiHCyBKv6ak7qivAtx8VyaboILedUSw/UaQuxspbkp/VxpQ3x4YnAfsw7JWNcYju/H
 anykXyQ3/X7HPcdMT4lSSbIHbAKpoVIi1Eilm+rZNUpyvnWrszKilZDWZ81g/vAVNlP/
 F+FEROYnFgkq8F40zoBdrEiAvn/2NDyJTXVcH/y+vX5TCFAN+TNT3WYH1LqU2TlG4glw
 G38IVy0+EUPmQQlOzam8SUesgvZvk9vB1Htm6KJK9qbF43ftn6RCld2EgafObjrFTogg
 5DTdyMlpJ9L9Q6rSgS0iWtwDBFc0ye3vYPRNXTtfiDg76SxXRiz7jNB/sFMx9+tMnZ8P
 mfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HqPLRcvm+n/38+Y+FSi/EkoZ0IfGdv4LsKsyqNHMlFU=;
 b=a6Y3zYwoLdBktCddWs4BSVW4F14gkq8gBb21EZMS18B7twwLQiXxN77pKsRkYxyUqb
 6er4XpDE+Gj6GGEXmIkUUWAREjkEfEKkV5TT7a5XG2CvsPKqZ4c7h3iOvyT89r1Olw4X
 yjpaHGhNR3hOuuy+6eMrKHZdlvQUfaY0vr++41aRxCQF/3B92juj6Orq97FEhEc/SjD8
 AdVVGc3FodakLfgDYD1gCkuNGuyhHhkbCiYbh7dMkJPseXnnIzwhimUchdjRQnPrqL/W
 B3mawO9SYzRoJYSNHWLBUKOQOeHMMk64pKpoSDdOWcAdHc+FofRnJBAJJ9XwG3M4ufak
 j7Jg==
X-Gm-Message-State: AOAM532eeTR1+R+vNMw6+nz/sRR+apcN5hxYrjJSCm5sGB7JCJjeatt7
 tZHi21G2jL6oMqkn9PjJABo=
X-Received: by 2002:a5d:6a06:: with SMTP id m6mr2189385wru.321.1592815059511; 
 Mon, 22 Jun 2020 01:37:39 -0700 (PDT)
Received: from [192.168.1.39] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id e8sm14992213wrv.24.2020.06.22.01.37.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2020 01:37:38 -0700 (PDT)
Subject: Re: [PATCH v4 3/8] hw/misc/pca9552: Use the PCA9552_PIN_COUNT
 definition
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20200620225854.31160-1-f4bug@amsat.org>
 <20200620225854.31160-4-f4bug@amsat.org>
 <4628bf30-9b56-a470-afc2-f140690cc002@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f5ced6f5-f1fb-bbc2-8f64-d5d55fe8a7df@amsat.org>
Date: Mon, 22 Jun 2020 10:37:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <4628bf30-9b56-a470-afc2-f140690cc002@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Corey Minyard <cminyard@mvista.com>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZX6Sm9kMmyH9

On 6/22/20 8:25 AM, Cédric Le Goater wrote:
> On 6/21/20 12:58 AM, Philippe Mathieu-Daudé wrote:
>> The current code models the PCA9552, but there are comments
>> saying the code could be easily adapted for the rest of the
>> PCA955x family.
>> Since we assume we have at most 16 pins (for the PCA9552),
>> add a definition and check the instance doesn't use more than
>> this number. This makes the code a bit safer in case other
>> PCA955x devices are added.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> I would introduce a PCA9552Class and move nr_leds under the class.

A bit excessive (for now) for the hobbyist time I can dedicate
to this, but I'll try (also renaming nr_leds -> nr_pins).

> 
> C. 
> 
> 
>> ---
>>  hw/misc/pca9552.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
>> index cfefb8fce8..b97fc2893c 100644
>> --- a/hw/misc/pca9552.c
>> +++ b/hw/misc/pca9552.c
>> @@ -303,6 +303,17 @@ static void pca9552_initfn(Object *obj)
>>      }
>>  }
>>  
>> +static void pca9552_realize(DeviceState *dev, Error **errp)
>> +{
>> +    PCA9552State *s = PCA9552(dev);
>> +
>> +    if (s->nr_leds > PCA9552_PIN_COUNT) {
>> +        error_setg(errp, "%s invalid led count %u (max: %u)",
>> +                   __func__, s->nr_leds, PCA9552_PIN_COUNT);
>> +        return;
>> +    }
>> +}
>> +
>>  static void pca9552_class_init(ObjectClass *klass, void *data)
>>  {
>>      DeviceClass *dc = DEVICE_CLASS(klass);
>> @@ -311,6 +322,7 @@ static void pca9552_class_init(ObjectClass *klass, void *data)
>>      k->event = pca9552_event;
>>      k->recv = pca9552_recv;
>>      k->send = pca9552_send;
>> +    dc->realize = pca9552_realize;
>>      dc->reset = pca9552_reset;
>>      dc->vmsd = &pca9552_vmstate;
>>  }
>>
> 
> 
