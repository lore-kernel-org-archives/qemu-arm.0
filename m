Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp869866ejc;
        Thu, 23 Feb 2023 08:13:06 -0800 (PST)
X-Google-Smtp-Source: AK7set81PGVjDgDfagK3W67OGTK7a37hdTzMwQ8BGbERN4iUkMP1qe5LQG1rcEjO8YWHWIi/axNq
X-Received: by 2002:a5d:48c6:0:b0:2c5:4c7f:c91 with SMTP id p6-20020a5d48c6000000b002c54c7f0c91mr11154731wrs.66.1677168786534;
        Thu, 23 Feb 2023 08:13:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677168786; cv=none;
        d=google.com; s=arc-20160816;
        b=P24XbpH2ryucHybnXdvp9iqMpvG3skFAMQ87Zm9XYOg6RgFzh717qkMUqCIcyBEv68
         DzFy2jliEI4YwD6hKt1j7w99PQplkToBsgf9tg9ycAnOYvE+cwdQVqO6NedZgigz5Dw3
         SINIlySR6o3GKM8mrc/lEuaYg0g/k+UjMFXdSs4V3X5jqobE9plMQl3DJlRgusce1F54
         DbNZax4P3RuAxmlSp6O6UcGAM9xqKggAWTOssGEYC+TP8xvlK+JTV9X1mHvlfhWT5mYy
         MfaxFcb4PLkbbA0ovo9knvIttfK+R56GQQv+rrrA/FFADS1IGKIHvLipEIw4HkgYfJbx
         dxfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=5HSZCPVGjOTae7UAkHFgyz6AX7pEyOjj0X+ZRHMUqJ8=;
        b=q5kWs/VCuU/Fxo+xVn0dJpIZmsdIZXkDjOi122RL+AoNO9JUT36kYid5MTq1HeoX9z
         x8xF1f3IKkD3pxvO03ncbJzBsuC2adp/yjyBB3D7tb+OjBX+aPBVUReyK2yERgQZ8BJb
         KIziE3M1m2N1K3KyKyQ5j3SABINdPrjQP1ebjO8LHZbpmKAySkD85mCHKJaQgpdyGuRd
         roi/ZRXQk0NzjIuiFOY7Ko4Vk6jMYRo0QdEl2GAVWxiwHRO/e2Bry0sa7jsdtgYWeRLo
         uDqPeqACtq4pN3x62IcxOY0QXvppJDRzNzM3BpoYS893mwpqQGROTd76wmNWm7k5ZUSa
         N3NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wI4AtmCG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11-20020adfe90b000000b002c58190babasi11721720wrm.442.2023.02.23.08.13.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 08:13:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wI4AtmCG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVEDO-0004Ig-R4; Thu, 23 Feb 2023 11:13:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVEDO-0004IY-4e
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 11:13:02 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVEDM-00018b-4A
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 11:13:01 -0500
Received: by mail-pl1-x633.google.com with SMTP id ko13so14141215plb.13
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 08:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5HSZCPVGjOTae7UAkHFgyz6AX7pEyOjj0X+ZRHMUqJ8=;
 b=wI4AtmCGtE9Y4w0SzAOe93rjlZomI98tC7O4bjJIRIHLlMn4eNRJaRqHi2YqUpWuza
 UywHestLsG5mkh/D+nPcZnP/6nSHw1l7aBy++323iax0hDmJSZXFyAK2/eN2Q9BoTyqp
 6SI1V9yjA0hu6dKzxebA8WWPFmN8sE7HlrEzx769g68y9gNED96rUsUu0aVkYzHwYPUX
 GiWP0X/IrOhAjSbG7J3Q4+b7UpZ1/gVzrh7pTlQrdQD/29tyCRb8JGQbPPs9YIc2u/a3
 qfGico076UbptIdKo/qXGPK8QD3FkFuBlkrh79Z3jkESXLLjCQSxwG2L9FWDnJzbcfWO
 Ze0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5HSZCPVGjOTae7UAkHFgyz6AX7pEyOjj0X+ZRHMUqJ8=;
 b=woHJ09oTSOvMZkX/n5NueEFSXS5KxpYFvOhVhiBId/B3LmWCGEqERLwm9HhpxU7zKi
 PjJx0Knoea2NK0wdxU12jrWN1I0LVX5qpnWLCgnQbvvA2Sjc6nYDBesGBbCBu/7gc4Bp
 f7f2SlgEdZYXlnOUdy3jbM355dNDBXQV9GDfCDHoaK8rM5Sy/0CCqM1LCMMMwP2Y9syM
 56IPZ9Xx8iBpsdL/yufe7yLVHSMQ3gCMli9GEhiTOcGap4HhRLVhFxPXVNvzyuC2IRrc
 4CLXWl1Mumi4Hsik/0OLDBr0XHnjJ3190vUX9Mzc/1oZKmSujmplM9utpbgCWcm9tMQj
 7dKQ==
X-Gm-Message-State: AO0yUKVQT6PIQU0qwbg4WPLuxAYLEk6lF3nfzK+D13GFsg5aJaa3mPHN
 L2iUISpzFrCV2YSNiXz2wJmi7Jwxs0sbMaGm244=
X-Received: by 2002:a17:903:283:b0:19a:96f0:a8de with SMTP id
 j3-20020a170903028300b0019a96f0a8demr12255418plr.5.1677168778258; 
 Thu, 23 Feb 2023 08:12:58 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 ja17-20020a170902efd100b0019acd3151d0sm8675345plb.114.2023.02.23.08.12.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 08:12:57 -0800 (PST)
Message-ID: <8e759fa2-674f-184c-1ddc-35638a18bda5@linaro.org>
Date: Thu, 23 Feb 2023 06:12:53 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 01/19] target/arm: Make cpu_exclusive_high hold the
 high bits
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-2-richard.henderson@linaro.org>
 <CAFEAcA8LQPEAQ34otcgNeqOFbi1PVVs-d3M41ar2jycjJYQF1w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8LQPEAQ34otcgNeqOFbi1PVVs-d3M41ar2jycjJYQF1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: UoUUMBlrViMk

On 2/23/23 05:14, Peter Maydell wrote:
> On Thu, 16 Feb 2023 at 03:09, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We currently treat cpu_exclusive_high as containing the
>> second word of LDXP, even though that word is not "high"
>> in big-endian mode.  Swap things around so that it is.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/translate-a64.c | 54 ++++++++++++++++++++------------------
>>   1 file changed, 29 insertions(+), 25 deletions(-)
> 
> This code change looks OK as far as it goes, but the bad
> news is that we migrate the env.exclusive_val and
> env.exclusive_high values in the machine state. So a
> migration from a QEMU before this change to a QEMU with
> this change on a BE host will get confused...

Oof.  Ok, I didn't *really* need this, it just seemed to make sense.  I'll add some 
commentary about "high" only meaning "high" for little-endian...


r~

