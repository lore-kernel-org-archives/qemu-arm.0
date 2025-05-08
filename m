Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp320189njb;
        Thu, 8 May 2025 03:33:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUsnoz1HFLP9eowCo0wvz9ZNqLZ17E6p0qlQw2yH1O8IOOc6rB+1Ym11cISrfGN8aGPCl8X6ZYeB/fraw==@linaro.org
X-Google-Smtp-Source: AGHT+IHDVFbK5pIvGn6Mf2b0BzjxHq9jDneBNB/xeFrhtpSMh0DdiHkWuLKstV/B7utg13cQbA6j
X-Received: by 2002:a05:6214:19cc:b0:6e8:f8ef:d659 with SMTP id 6a1803df08f44-6f5429e56e9mr86379006d6.10.1746700393456;
        Thu, 08 May 2025 03:33:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746700393; cv=none;
        d=google.com; s=arc-20240605;
        b=da+XFSyK4AH9h3YadeXZFzcTn1yljWiWLxf7PgfTrOnSFnzipuJJZNDsKrCg5aJS0T
         EBLwWN8LbbgWly+BiU+yBfI+VHCRKHdzr6mTLuLN4TeXYOKThf+x4Mjvheuvt5av3CZZ
         CWsxwobpJCExbK6lky+EvOdwapy0azvpNf41pQxzsxXR0l/EemygVwARj2MKsgQNa6qv
         kY4aNwmufKPROw+0V/M96PmhU1DCY72x0MuHpm3S3oy2YhcxNKG6N/WgzQW6m/X1hbe/
         qpnhh/mLlYyvumGHXmIxqsjfPljzchdyJ0Roi81uLJTymhnQmvMqLKiAssLUtPw+GWvB
         Sk0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=I+Tibim8Q4APBLsB3Yy7KZpXtD4KpS6syUMFUyzU9U4=;
        fh=LeKi7OcaAvdZwjhFgeM3lrkmvND+OqLCqloeF9amzzs=;
        b=KjsZpkCoxfOVp0G0AG8IJ/5R/XuzokuXIUBwdcTbFvbYL2B3wDvOymVNSijUTbXuTP
         8g9Y8ftbvi38wH+afaFWaVbFJevR2/xbqvcTH9evXNpJiwQ7Kuuy45VyrAq8PcahSXdZ
         2arDebiPI7MCQ7KKWk2xfqy4BKlm+vLbxn8fjfzoW0NOq/a/vih3OH2E8QEqT7vhsWs6
         sH9EYeSmoS5Mi5D5s+SxPRSc8miJkHlB4HIMPX/IE+uJZWWpF87CN28GO/vZFfSMSrs8
         lkdpsWJwevfnjEMAZoT0nLtN+IDdss91cMHM4YVu80+aSIheIayP3EwcPMZkVOtsgL2o
         8TVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QSXKRX2X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f542627695si40202526d6.88.2025.05.08.03.33.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 03:33:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QSXKRX2X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uCyYm-0005k9-7t; Thu, 08 May 2025 06:33:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uCyYj-0005gs-Uj
 for qemu-devel@nongnu.org; Thu, 08 May 2025 06:32:58 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uCyYi-00063J-6c
 for qemu-devel@nongnu.org; Thu, 08 May 2025 06:32:57 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-22e45088d6eso11956465ad.0
 for <qemu-devel@nongnu.org>; Thu, 08 May 2025 03:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746700374; x=1747305174; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=I+Tibim8Q4APBLsB3Yy7KZpXtD4KpS6syUMFUyzU9U4=;
 b=QSXKRX2XjBGzqfyvHU+Gcf0Lb8RizJL99yOTMdV0m3HQMoAuOJZmfhaUEvt24R64Pb
 PtnjG7e6tPaPyYu3yd/+DvnwquscUX1UZy7Wb+gt5+X/ugp9galD/yx1MOyT+BHXv4q6
 ijfQQgfa0wQhS5Kk4AvPA3SinUkLdkpk6I6Vir49BqNVruSQiL3Rp2CdVfuufiGtvf3U
 LF7V+786hcP5sLyuUbTuJuKTWjPPMLx/k7xO9ab/xLWLB2l49NmGMgrMY4QwJnVSLqCk
 IJvMSPVdVD1qDSVCVI3Xm7o9IR8flfRy/zvassC+sWG3Ai1xer1GTbNQl8e5RKPQJ1pb
 HhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746700374; x=1747305174;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I+Tibim8Q4APBLsB3Yy7KZpXtD4KpS6syUMFUyzU9U4=;
 b=pe/MLNyO3ez6gzB/unAtsXX3030WJPGKtvJ4B8EyuG0vtWarc3HbMI8K9pnvFR3wPE
 KInK0uZMVgueTx7HqrjwiO/N6HusUZLYQPp5qb/eEqYkU/vHEgdNTnMk+3INPmmijFA2
 qlL092G6xGz09PWbg41NjQCSA0c++rygGuVu+62jTCltFj1CSFzZyot47iPV32s0kp4t
 DtaIyI+UmGsRMA08zdL6z9p9nocSNCaHaThSveOOhe+qX8lWHS4b0DN7LRV8Z6hDiY+G
 +wVK+Fauwn+/O1fzx4B6JOU5ztFc/6DcI+dwkxD+E1yKMqOCQNoiSMomQDYuZXl7zgfh
 64uA==
X-Gm-Message-State: AOJu0YzZqINhd8yAeFNYqZ5h99OPintcyNlj0DBpEHS0HspB5f3pq9ZA
 vOfA5CF4R8savkgEZPqJSR6qAlVqLoJalhcJivqC+FIYQShMgw+MhOLep2ykXMWMdGV6Uk6JC+1
 +CgXVaQ==
X-Gm-Gg: ASbGncuW/KQtU+RvUt1Myrp0b7X/qf8JEhnPtHRvze0NOC16vLZpfO/yqEvONGb36df
 SPWRp9RmVI6a3oYjavVCrVkcfe+xwoD1gNdb5AMBuntSJ28KkWZmESWRu5FrP6pJ+zfYf+8gF8s
 9OSfeqhUK4s6pJN4LRuii4XW7EKBKYZVeGE3xFTgJefjWrRKkyQxsAgJN/I//yRw/HhBGE/Nk1u
 UA/HGQoZD3ekSSpSQgMxW01qpmUL9VugrscBVFFOE1zaG3fRMdFDdncN7vmLRaoLpZTMgsC6fvc
 ecDsPgzGPVATF7kzecvvkbAfxh7+LQ62EFbC4r1CYQS8e3POdrWX3kRquyXqLvdwezh0uiSh+7k
 IGvXHkUOwNcagpUFs6xU=
X-Received: by 2002:a17:903:40ce:b0:223:6180:1bea with SMTP id
 d9443c01a7336-22e5ecccb3emr84448785ad.37.1746700374046; 
 Thu, 08 May 2025 03:32:54 -0700 (PDT)
Received: from [192.168.69.244] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e1522947fsm109633945ad.170.2025.05.08.03.32.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 May 2025 03:32:53 -0700 (PDT)
Message-ID: <b0737130-fc97-40e0-8488-3daaca23552d@linaro.org>
Date: Thu, 8 May 2025 12:32:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/i2c/imx_i2c: Always set interrupt status bit if
 interrupt condition occurs
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: corey@minyard.net, Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250507124040.425773-1-shentey@gmail.com>
 <aBtavpDt1yfoavj7@mail.minyard.net>
 <8a5893be-7217-4c58-838c-01370db5d6bf@linaro.org>
Content-Language: en-US
In-Reply-To: <8a5893be-7217-4c58-838c-01370db5d6bf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UbTfoF5InNS6

On 8/5/25 09:14, Philippe Mathieu-Daudé wrote:
> On 7/5/25 15:06, Corey Minyard wrote:
>> On Wed, May 07, 2025 at 02:40:40PM +0200, Bernhard Beschow wrote:
>>> According to the i.MX 8M Plus reference manual, the status flag 
>>> I2C_I2SR[IIF]
>>> continues to be set when an interrupt condition occurs even when I2C 
>>> interrupts
>>> are disabled (I2C_I2CR[IIEN] is clear). However, the device model 
>>> only sets the
>>> flag when I2C interrupts are enabled which causes U-Boot to loop 
>>> forever. Fix
>>> the device model by always setting the flag and let I2C_I2CR[IIEN] 
>>> guard I2C
>>> interrupts only.
>>>
>>> Also remove the comment in the code since it merely stated the 
>>> obvious and would
>>> be outdated now.
>>
>> This looks good to me.  I can give you an:
>>
>> Acked-by: Corey Minyard <cminyard@mvista.com>
>>
>> or I can take it into my tree.
> 
> I have to respin my hw-misc PR so I'll squeeze this.
> 
> Thanks!
> 
> Phil.

FWIW I noticed the patch subject is truncated to my default git-view
because it is over 72 chars. Since there is no enforcement on patch
subject / description lines length in checkpatch.pl I suppose nobody
really cares about that so I'll merge as is.
