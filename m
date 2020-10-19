Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3989650lfa;
        Mon, 19 Oct 2020 08:55:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwr7pm1hzi03Xzdtg0Xw83YyRpk4vp/HveT4ByofcDyVKO46qL9uJMfedzkVtTgpGFrtBqJ
X-Received: by 2002:a25:a48a:: with SMTP id g10mr424919ybi.197.1603122918216;
        Mon, 19 Oct 2020 08:55:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603122918; cv=none;
        d=google.com; s=arc-20160816;
        b=y2jrTPsn9Pvk9cXRnWWLn+gCvusXTeZN2Mape3HujGhunROHu1SSrp+F1Bje1DJORI
         RxAeAUtPG8nQgVd300Pfxw3WLWvCdN70Hav+fmkzz5rYs/uQ0fPGdN8XGZ3GfyFrngc2
         aw/mpPZIUrU+4/QK/FdCvesKBFutbcfYG25I0PukN8rZBY+M35W9OChIlJh1wCLKc7L0
         HJitUMCIL5uRAiHTyXqRkfnsAFFaadxcnBoelFZ3tpWI/yPHXd1xvJV4hUMuN9u23XnE
         PERg48BF3Y2wuWALWqgWATVFQVx98axOd1DSPulQxxgb3s4HmBIQmqYQTlOpVqYtCiz4
         3QVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=lJ4xtVCRiw2qdinUse8epQ76+qsFABjhcRk9aIzMPMc=;
        b=tmjY43tSaEnxyWeyUbDj5XxjoXMjBNWnxVgxLdQAj8X6kuVVaXzgpc+it2vsSvoH4b
         rlw4fcFd6elb/T1IhIIc7fET6qe2Xt1tZK/GcY4lbKeAxyjIWoGTwOVyZi9u2qLVs43W
         TsAw4pGK2orKYg+b8yL6LhGNAcwlAyD/jVJSf86nXJ3Ik9PxeCGf4N/duO4F2XLBhpu+
         rOOtVEpThQOH+HMhwLCxrp9hnrbEBx5JWNAgmMDNcnYz1z4nlPETAZvS9FG4yHt7yEgn
         z3UPYpp32XozL28N1MKTXTtRn1iaqlVW06ak172XznH/wsz4tp/+a/3Ua9ch5I2xZ5XI
         LWVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Z/QV+wuX";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 13si297451ybl.294.2020.10.19.08.55.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Oct 2020 08:55:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Z/QV+wuX";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:54656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUXVF-0003gc-Jj
	for alex.bennee@linaro.org; Mon, 19 Oct 2020 11:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kUXV6-0003f7-SL; Mon, 19 Oct 2020 11:55:08 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:37934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kUXV5-0008Nh-4w; Mon, 19 Oct 2020 11:55:08 -0400
Received: by mail-wm1-x343.google.com with SMTP id b127so16382wmb.3;
 Mon, 19 Oct 2020 08:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lJ4xtVCRiw2qdinUse8epQ76+qsFABjhcRk9aIzMPMc=;
 b=Z/QV+wuXClKRf/DrKrTNlmlTkSWVbcEmUZvGXDAoCALjMg/VfvGWasUBICNn5b8UiK
 9U4oLg+vLsNyF87/R/DZz86NQ1wsa+nUzeLdcvVcUzADsqxFiWWJUoeRe+CTIO3jsjES
 wXDNnm8VoCYH+mjrQKW+0TsMF7DoqQVXOcthN1I92llyye4QEIgPrZYbl8FmgFALAqE9
 TStKHEdDtR8+D0mYuHiVCuKifpvA4wr++FdLY8LRcOYeXI/ZV++mPiXDgR0Syt+pZq6q
 Vd/3YmouMZZ7PqgBvvBUd9RIJkcV5SZyABmpkuD6W7s2jgTKW+Vn3qbZ3SnmXRu91zZN
 36LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lJ4xtVCRiw2qdinUse8epQ76+qsFABjhcRk9aIzMPMc=;
 b=cXmAb6RrjOSWTRaYFP+CNcXyD4534EWir8kx5R9L3f2FIt8xkgI/PbFlW7J0mTH9zF
 /QBMuWHVCwkiO4DedKLF6Ei6RX2CUddbSdSlnIRuPZepS0JmWm5R8IHyu0/J87GZZdWV
 8XpHce/bs6NoUbt/iTc5KrnUfpfxYrguAY2ZC9B1JMEW4gkbKUWfqKkVULJkY0X67uWi
 DFajSNz7ycyvKFDwKx+Y2RkF9F8avHvtUxUdg5wl+G78HIqAH8NU87T+9Zh5QyWLPOx4
 n8dQ7J54vQeHYwkQ04fpIUKsyi6TZAFKdaqfhvtcEGo5ItOx4f2zLvnt1IWMTmsWP4gV
 tf5w==
X-Gm-Message-State: AOAM532d1Sv/kgwWI7bSBLtjacVixZRj7mvTbsiEvl2U0ZhCLK+4C9af
 e3a/ohvBVTZ58+n2iTs1cII=
X-Received: by 2002:a1c:bd57:: with SMTP id n84mr68967wmf.126.1603122905178;
 Mon, 19 Oct 2020 08:55:05 -0700 (PDT)
Received: from [192.168.1.36] (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id q10sm533814wme.2.2020.10.19.08.55.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2020 08:55:04 -0700 (PDT)
Subject: Re: [PATCH] hw/misc/bcm2835_cprman: Make cprman_internals an included
 source file
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201019112628.1653550-1-f4bug@amsat.org>
 <CAFEAcA92ah6O3uTESb98GF2F98ASmiQy9UqyNMOOLZPZaX40zg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <225b70ef-62d5-73b0-d9b9-edf633a0e773@amsat.org>
Date: Mon, 19 Oct 2020 17:55:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA92ah6O3uTESb98GF2F98ASmiQy9UqyNMOOLZPZaX40zg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Luc Michel <luc@lmichel.fr>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0pNBA+ztmsav

On 10/19/20 5:53 PM, Peter Maydell wrote:
> On Mon, 19 Oct 2020 at 12:26, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> bcm2835_cprman_internals.h is only include by bcm2835_cprman.c
>> and contains various static array definitions. Make it an
>> included source file (using the .c.inc extension).
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> I'm sending this on top of:
>> [PATCH v3 00/15] raspi: add the bcm2835 cprman clock manager
>> to avoid a respin before soft freeze.
>>
>> This patch can be queued or squashed on top of patch #08/15:
>> "bcm2835_cprman: add a PLL channel skeleton implementation"
>>
>> Based-on: <20201010135759.437903-1-luc@lmichel.fr>
>> ---
>>   hw/misc/bcm2835_cprman.c                                        | 2 +-
>>   .../misc/bcm2835_cprman_internals.c.inc                         | 0
>>   2 files changed, 1 insertion(+), 1 deletion(-)
>>   rename include/hw/misc/bcm2835_cprman_internals.h => hw/misc/bcm2835_cprman_internals.c.inc (100%)
>>
>> diff --git a/hw/misc/bcm2835_cprman.c b/hw/misc/bcm2835_cprman.c
>> index 7e415a017c9..9d4c0ee6c73 100644
>> --- a/hw/misc/bcm2835_cprman.c
>> +++ b/hw/misc/bcm2835_cprman.c
>> @@ -48,7 +48,7 @@
>>   #include "migration/vmstate.h"
>>   #include "hw/qdev-properties.h"
>>   #include "hw/misc/bcm2835_cprman.h"
>> -#include "hw/misc/bcm2835_cprman_internals.h"
>> +#include "bcm2835_cprman_internals.c.inc"
>>   #include "trace.h"
> 
> I guess so, though usually we only use .c.inc files
> where we actually need to multiply-include them (eg
> with different #defines to control how they expand).
> I suppose there's softfloat-specialize.c.inc which
> only gets included once.
> 
> Applied to target-arm.next (not going to try to
> squash it as it would make applying the following
> patches in the series a bit awkward).

Indeed :)

> 
> I am going to move the #include line down so it's
> not in with all the includes for the .h files.

Ah yes good idea it is cleaner, thanks.

> 
> thanks
> -- PMM
> 
