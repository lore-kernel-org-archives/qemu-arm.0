Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp285578ejb;
        Thu, 16 Feb 2023 00:47:43 -0800 (PST)
X-Google-Smtp-Source: AK7set9dMthE6wbZwwFTGiBCN+qwyr7+A9/pXQSxbE0wOUeKSI4Z0dAYDHEjSEx7MT0VlQThzSFP
X-Received: by 2002:a05:622a:100b:b0:3bc:e4d6:16c8 with SMTP id d11-20020a05622a100b00b003bce4d616c8mr8244961qte.13.1676537262992;
        Thu, 16 Feb 2023 00:47:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676537262; cv=none;
        d=google.com; s=arc-20160816;
        b=Yy4BoubjKWh4LZo+woTDAEi9fVUfuU4iDQMMW9scVklnibIT4kb33agBdgLINWGxyQ
         3f7SMCkEj72OuI2N7xSQCAirYrKPdUIWfW/4whq4H1yl/4aOLRtQRYebUERW0AZlJz+5
         TvI2+jc57AhGQd6EtPDly9rZYA+vTg6QtUlwdLijUkHTxEPNfKpbyQm5HDYMjw97xUHp
         iZzhwRT5WaJ5ci1XqvXEWoKNfQk1XehnyG03+d69BQ/PD7ruz6/SYZiAtxYNPXP8cmjF
         PzgiFcIOj4XaygAnEqkGq5Ezi8LfOrRqbKIwwuPV4rLbFtQTAx7Glfk1sBi8mPzK+K3F
         MHzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=L53jxAlOJ60aToYJSLmC+njUIySw2Uc0DI2JzNp7hec=;
        b=Rq2NIDs/05zc9ThlC6kD7BCZBcmj65Sb7Df57dT9BF0e4BPO7Ev7tXYLOMwSP9cOea
         Q3QdK2klH+SUzFXfmESie8D1Fj3awqg4CnIl6vVH1PxXe7ShK0HkZUjck1vbN3aNNwJI
         /JCcdkBILOPmUYdTqXX9l7ObYJWlflnVFgfk8o0WDtwm1c3KGG/10JkbojvWAS3oY5OC
         EHveOUuZtN6mDDuwBHrnrDPm7J+U2/wHESEL8wKzrm+Cr6WwqR4IxMHXT9PJ/Oc+36eg
         UTATYx8Eixty+IXH6idzwtuBYtLs26HpdV5Hb2htM4Z1NXV3CO3KaPX80g38nMgFbmFx
         RxAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lBDwofmr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w13-20020a05620a444d00b0071f5483e964si1213404qkp.348.2023.02.16.00.47.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 00:47:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lBDwofmr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSZvL-0001jH-GX; Thu, 16 Feb 2023 03:47:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSZvA-0001fr-5k
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 03:47:17 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSZv7-0005OI-2y
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 03:47:15 -0500
Received: by mail-wr1-x432.google.com with SMTP id r2so1070401wrv.7
 for <qemu-arm@nongnu.org>; Thu, 16 Feb 2023 00:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L53jxAlOJ60aToYJSLmC+njUIySw2Uc0DI2JzNp7hec=;
 b=lBDwofmrw2l7/5id7o4uQ8HtBRU+R+zMyb9S+legSkjJ/kQ3KrWjKS+MKOAkAPXjp1
 Z60WISygu5AEJNSTx2p68JVaF/dgAcJWnMTC+4AP95+t36jR17aIT8qKqbF5inPOsYPg
 PquIBUsff0T/15GWHe3CvXskYpPPE1ZOMmX4EfG3ROCosug5PW2d3gdCpfag7JPaREMH
 GwV7oDtHxOqryk76sC8E4LSK1WC3o1k6Pl1OUNOhjAcdAve2AtNkgT3e93jOaJUkVIgv
 bacP8LrgAMABm8BpekUCCU28NkWwyVbSiXDTgikmQ1SkdCYXJGSlOERIWhOqP5LhAg8t
 GZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L53jxAlOJ60aToYJSLmC+njUIySw2Uc0DI2JzNp7hec=;
 b=gLJwPO9CPikmusifYCN3NHmr24+rqPXk9ARl++KW7VdPH14izCSJ0eCgVGJLKKgmdP
 lpKYWfmXSgTPAttO10Rk/HQ2jLrR/zGV63D+orWtmF8qx4WjezR/m6xx5mIpqnTC05Kw
 BVi23z+ZQz8NBgssl8zI7MecgakP5sveXtidVnDG27TKK0+fLBzLAhw9eWlGBNvy/qZy
 kQL7a6ZD0GiW7bLL7yZfOEZHf0P3Vp55Iwoe8EJzJczu5/cid+p+ezWTorK1aqZNbypa
 FM0Lfb+mRLgjql+flum+mMQcQcQcrg+/z46eL254qtGUMIwneBHk7FMaMBAgOGDFUR2g
 o9vg==
X-Gm-Message-State: AO0yUKVZNuSO/yyyXtkAH9aEN1evsz6Ml4fGhShIpfKy1TIQgV8g1smF
 k1SNHl/rF+Jh/1ji4kc0Oabf8g==
X-Received: by 2002:a05:6000:2ca:b0:2c5:4dbd:dfa3 with SMTP id
 o10-20020a05600002ca00b002c54dbddfa3mr1367019wry.21.1676537229594; 
 Thu, 16 Feb 2023 00:47:09 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e4-20020a5d5004000000b002c5706f7c6dsm885629wrt.94.2023.02.16.00.47.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 00:47:09 -0800 (PST)
Message-ID: <a3970b81-89e6-66c3-4a62-13bd610096b6@linaro.org>
Date: Thu, 16 Feb 2023 09:47:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 1/8] m25p80: Improve error when the backend file size does
 not match the device
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, qemu-block <qemu-block@nongnu.org>,
 Xiang Zheng <zhengxiang9@huawei.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20230214171830.681594-1-clg@kaod.org>
 <20230214171830.681594-2-clg@kaod.org>
 <Y+038bMA0BaPLUr8@pdel-mbp.dhcp.thefacebook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y+038bMA0BaPLUr8@pdel-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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
X-TUID: ADu2lfnPl8jL

On 15/2/23 20:52, Peter Delevoryas wrote:
> On Tue, Feb 14, 2023 at 06:18:23PM +0100, Cédric Le Goater wrote:
>> Currently, when a block backend is attached to a m25p80 device and the
>> associated file size does not match the flash model, QEMU complains
>> with the error message "failed to read the initial flash content".
>> This is confusing for the user.
>>
>> Use blk_check_size_and_read_all() instead of blk_pread() to improve
>> the reported error.

Could you reference commit 06f1521795?

>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Reviewed-by: Peter Delevoryas <peter@pjd.dev>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> Message-Id: <20221115151000.2080833-1-clg@kaod.org>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>
>>    breakage with commit a4b15a8b9e ("pflash: Only read non-zero parts
>>    of backend image") when using -snaphot.
> 
> 
> I guess it's not obvious to me, what broke?
> 
> 1. BlockBackend *blk = -drive file=blob.mtd,format=raw,if=mtd,snapshot=on
> 2. uint8_t *storage = malloc(...)
> 3. blk_check_size_and_read_all(blk, storage, size)
> 4. commit a4b15a8b9e
>      for sector in blk:
>          if any(b != 0 for b in sector):
>              memcpy(&storage[...], sector, sizeof(sector))
>          else:
>              # Skip memcpy of zeroes
> 
> But this is probably a regression for us because we actually expect the zeroes
> to be copied?

Yes... Commit a4b15a8b9e mostly considered cloud payload optimization.

Since EEPROMs are usually "small", this could be kludged as:

-- >8 --
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -1615,6 +1615,7 @@ static void m25p80_realize(SSIPeripheral *ss, 
Error **errp)
          trace_m25p80_binding(s);
          s->storage = blk_blockalign(s->blk, s->size);

+        memset(s->storage, ERASED_BYTE, s->size);
          if (blk_pread(s->blk, 0, s->size, s->storage, 0) < 0) {
              error_setg(errp, "failed to read the initial flash content");
              return;
---

On emulation, it is simpler to ask the user to provide a block image
with the same size of the emulated device. See commit 06f1521795
("pflash: Require backend size to match device, improve errors") for
more information.

>> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
>> index 802d2eb021..dc5ffbc4ff 100644
>> --- a/hw/block/m25p80.c
>> +++ b/hw/block/m25p80.c
>> @@ -24,6 +24,7 @@
>>   #include "qemu/osdep.h"
>>   #include "qemu/units.h"
>>   #include "sysemu/block-backend.h"
>> +#include "hw/block/block.h"
>>   #include "hw/qdev-properties.h"
>>   #include "hw/qdev-properties-system.h"
>>   #include "hw/ssi/ssi.h"
>> @@ -1615,8 +1616,7 @@ static void m25p80_realize(SSIPeripheral *ss, Error **errp)
>>           trace_m25p80_binding(s);
>>           s->storage = blk_blockalign(s->blk, s->size);
>>   
>> -        if (blk_pread(s->blk, 0, s->size, s->storage, 0) < 0) {
>> -            error_setg(errp, "failed to read the initial flash content");
>> +        if (!blk_check_size_and_read_all(s->blk, s->storage, s->size, errp)) {
>>               return;
>>           }
>>       } else {
>> -- 
>> 2.39.1
>>

