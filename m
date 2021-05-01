Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp916185lfg;
        Sat, 1 May 2021 02:45:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiAfmsIZFOD+SOFQINS84/HS5MmvBvZGgsTXiy6nwXfUx4uziIio5PCq/1OQ/ewZVpwzT2
X-Received: by 2002:a6b:b20b:: with SMTP id b11mr7153879iof.26.1619862354136;
        Sat, 01 May 2021 02:45:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619862354; cv=none;
        d=google.com; s=arc-20160816;
        b=AE+MDp89LhtPK2YJyewJh500ktCri4jEw3NVU/nMt08SDiNdeL/pCrWe9jQLuKcsON
         64vh0pJtJKoWumGAW0udAh4vicX4eeojVFKovNE4E4Ct1/z2LFhg26Hteq5QRSKCS4ez
         cPxXX95itoAS/b6L2tEUC0A9Vz9eqp7N9WvZlmnu2Us+ofeDenkRlWEKgabJrUllxx9F
         Sgq7SFRo1VeuwbLGvnYeQuvs4BUFvbBVGJg1KMUsKA9AUye8jP2+rtE62ZY7AWhTrCDl
         yzrlXYUefPPj2mikWG2xu8wURNRHStSIChLqgL6FCGUPfHHuUMM188x+sT2QNML2sUKF
         tqzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=HRqI8rPP4IoLWY/LUFpkTvk9B4mdwTWd9FTvS1rw8Oo=;
        b=WK6JXn1plfbIRK35QQFBo28zt8u/qWRp2rRiu7xC3Zk+IXJLboeLhO4EThrqmvbfez
         nErem2choqaf4WdFfPVyVv8uiwiUJ6afFA1yQW7XI4QEqnWY5a1cNQx2vPJcm06RCwrs
         LVoBZD6M5vM4px+twwpWu6xv9BOAwnu+aB3+/jS1FNfYTmD6+8Qyb8Fdvd959Z/ltSj/
         1DzWuehuOyS0ZQGpWZ8kRsMywb0scMuytY/5scsWRpxo0u/7GA+Sb5kx/0CJhNBp8KQR
         /cnh1DG009142ZVvpUxwYOT2xWdMER8ajYfKdlVL0r+1Y17r63WAHW7Mfads6Fokt8s2
         A27Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mPO7vsPQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11si5005970ilu.123.2021.05.01.02.45.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 May 2021 02:45:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mPO7vsPQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:56498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcmC9-0006Yz-Gu
	for alex.bennee@linaro.org; Sat, 01 May 2021 05:45:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lcmBq-0006Yj-94; Sat, 01 May 2021 05:45:34 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lcmBo-00068s-75; Sat, 01 May 2021 05:45:34 -0400
Received: by mail-wr1-x435.google.com with SMTP id a4so493950wrr.2;
 Sat, 01 May 2021 02:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HRqI8rPP4IoLWY/LUFpkTvk9B4mdwTWd9FTvS1rw8Oo=;
 b=mPO7vsPQIWN0qN0IbE7XdZPw1EbHlbLfqzCM0ftpPFWWHzv7IJFzGcfqE6QJ8FHLCy
 0K9ch5Ep0qXQhxx4BeoxGBCQfRNGwl3wwpnzx037uL09b7mY/Fttrmw4qsMl/AwjcjS9
 2MDnssDV4Mx1OpYmFMCvtHG4L2juoBdZ+6Ui/u8tx7wbBEsgPAmUqhEVRFoFlqrBx/r2
 pHUTFDq9HprimDzSFtMjjD73+IIV+Sceswg4oiboqeC3sqmip641ulH+pItVw+oZxJCc
 RIETyKZVB21e93lIrNyn7WxUdXzJaHnl2bKAJPhYIZIHsm8d41HyEwgpYC+omtKoDfai
 NmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HRqI8rPP4IoLWY/LUFpkTvk9B4mdwTWd9FTvS1rw8Oo=;
 b=Rdfkw5kN46OLah2Q1eOSxVbxfBzLtwt4H0BEso6UpQ2VbtbbnX+aUVu4dtvwmQiqov
 9bqwL2pS3dLNd5x/LlOZ84oYZsd54AiQEyAAohh56BRXirdt6KxYOPT4u0wi08bvsMxj
 OdMdZDoAe8OkIvUTjhUwKBhuS31rY0AYUnMi3ilRX6J+2wmPbftIxYLv+6mQtVwEEzir
 quZSomgvDy4H1AyCksOppneqOXjrTWwZTRyC8OciDn6SIg/bgdcvvn+/Nk/bl34BQzrX
 lWfaRTnRV8q50fjxkoTpDTcGJjDfPh8uIry9O6izPloYVSQywXqp5JxrS66D9OgEcSpq
 DLLg==
X-Gm-Message-State: AOAM5314M1Q5Y15rDdHYa9Us+cDID2AhlGaE4slFwvDwpp6U+9KMBh8V
 fiN3CXSAso2fD71HRph4xLfsLnqY1rV8FPUu
X-Received: by 2002:a5d:51d2:: with SMTP id n18mr12791955wrv.69.1619862329792; 
 Sat, 01 May 2021 02:45:29 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id v20sm5336007wmj.15.2021.05.01.02.45.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 May 2021 02:45:29 -0700 (PDT)
Subject: Re: [PATCH] hw/sd/omap_mmc: Use device_cold_reset() instead of
 device_legacy_reset()
To: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210430222348.8514-1-peter.maydell@linaro.org>
 <87o8dvknfo.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e487354c-bcb8-4ec8-daff-f630db80f84e@amsat.org>
Date: Sat, 1 May 2021 11:45:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87o8dvknfo.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Lq2SAr44/uiA

On 5/1/21 7:55 AM, Markus Armbruster wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
>> The omap_mmc_reset() function resets its SD card via
>> device_legacy_reset().  We know that the SD card does not have a qbus
>> of its own, so the new device_cold_reset() function (which resets
>> both the device and its child buses) is equivalent here to
>> device_legacy_reset() and we can just switch to the new API.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>> ---
>> cc'ing Markus who was interested in conversions away from
>> the legacy API. As warned, the conversion patch itself is
>> not very interesting as the difficulty is all in confirming
>> that the device being reset has no qbuses...
> 
> The commit messsage makes this helpful.  Thanks!

Looking in archives, Damien did convert devices in v3:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg634100.html

But it got lost after telling him cold/warn was not enough,
and better would be a multi-phase reset. Full thread:
https://www.mail-archive.com/qemu-block@nongnu.org/msg54084.html

> I wonder whether we should add a hint to device_legacy_reset()'s
> comment.

I'd rather convert and remove device_legacy_reset().

Regards,

Phil.
