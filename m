Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1496359ejb;
        Tue, 19 Mar 2024 11:52:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXrY+1aF+jb/7Cy1cUuq2un98QUsq+Ktd87ac/L2OH21+jonYwMlzXwATJ9GYgNhaybhT9CSqcZzy4M15TxkTu6lTspsIWn
X-Google-Smtp-Source: AGHT+IFgkfUc7nO1RIpK3z5RHPnQhEwjVPRV8AnjsUoqpGYf3u4NyA1jsK16EY/axymK6JAbvqA/
X-Received: by 2002:a25:6b0d:0:b0:dc6:de64:f74 with SMTP id g13-20020a256b0d000000b00dc6de640f74mr2620238ybc.9.1710874323264;
        Tue, 19 Mar 2024 11:52:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710874323; cv=none;
        d=google.com; s=arc-20160816;
        b=W6VwX/r7Ns8q4Bm83qysphlPDnGbD6Uw4ALqiDmdrmdYngC1I+I+o0HiLMVc1o5ydq
         9Cwuri/BeiazgQ9+lnYELWfbE7uuGnbM3DmbbpakPfvA4Ic7s1KZtmZyqMD/+js6yqNv
         2IgvysqGZ9cFeV8XnOClwLtNa84+goyLzs9T9tH3qJ56Y/hOSl3UkXum+JNMNcqeCuZt
         VYdRfXJmB7Qfem8Q/OT96d0LQKYJ0SuJFUR0UtMUu3Jpy/iAeB37Ma9Juj4YI5CjD/kn
         Zy3UkXf8pkMcv4fzmYyOE8JL87dmUel1gHTVxfmNBsbspVNhpq/936tOT2LnmssZHxdx
         MSPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=6p7+/y+sGFcXDnS2Rurl1GYR0YUYkAkZTkGg5ALOT2k=;
        fh=Jq59N/vhw+ttXJ2IL9yfHLcsShmhUenye6cs8RDzcH8=;
        b=APLTsorC67dKnzfg3Zrqt8A+1ABOGpsGDkNhz+z5eYfHxvQF29KD0IqzUHwlTp9G1L
         myS38VjXwPnOR4PLTxSGZOB1HUXbdnFd+ubNIHiRnNiN8x3Ih5iXHcVSDSYGzAg/qkhp
         6+v7sXhY2byO1EHV0Dh5uLVCsPt3MvwuGudtk14uVeh4V95HCQEILnFXCo/XU77UVzcF
         u9e3VlWsQgvC8UTCf8pqwpV56mwz9d2xOcmc7qvLg+hpPDolB6y4aLgljBfQ5elS/y/3
         osKWe5a2QJ433B16rLy+pp+ShvzGPuMMCo7t6ZPttMzS8a4WIGwWRHTUJRxUCp7Zfdtw
         JrNw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=plp0uXNw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m7-20020a05622a054700b00430d8cded6dsi3587766qtx.114.2024.03.19.11.52.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 11:52:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=plp0uXNw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmeZ4-0004s0-0v; Tue, 19 Mar 2024 14:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rmeZ0-0004ok-TP
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 14:51:55 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rmeYy-0007uZ-Vv
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 14:51:54 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-29de4c33441so3844100a91.1
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 11:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710874311; x=1711479111; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6p7+/y+sGFcXDnS2Rurl1GYR0YUYkAkZTkGg5ALOT2k=;
 b=plp0uXNwj4LcVL7JOGQeqCiXtS22gCUNTrG8YXGt0VbGwskfI52n+wvB7eFtL0Xyrb
 xHTGXEoRJ5VGtyI6FtWPltaEa5Edlkvo+hpC4K/ojkGrLIH6hl22Jaz4cNUdh6OLqkD4
 pflRsUq0JW5cNxj5DVIdGG+uHdkq+9RiuO39x4qo/2ONEfEkvMhUhIMCtYqeRdbxxsje
 QADdYA6WFXLItq0S6IxbKSB24zjHQ7OR/PmNLxDXUS4tafOLRm/mrBvlsiTzwqiruxVA
 X5tYZmS21+p5OCepZ6xoK+nw9wy+UFILBSB5XeSgZ4xicP+STZNV8kkDVJcCLqQI/+n6
 xjuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710874311; x=1711479111;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6p7+/y+sGFcXDnS2Rurl1GYR0YUYkAkZTkGg5ALOT2k=;
 b=XPWnAaa+YMfUOXiXcoZ+n4yIM8nDrBdPlRHWdx0RG87S0qTlwbYKbEAReH+GlCGvpO
 v0CNxrBFjx7t/AIT4r6xHFeH/OJFlU2UhWhNjZ2ploJOZLz9+up3nKaW76lZkfhwAerR
 bFjHjm/NhMViMZWYI+PFqA76knVT0p31oVMuaSu6xgINrtVPGOsbwqIQ2Pcb4VgECbkZ
 TgcnqDL8hBPEnMf+TAMo/FFKj4IyCz03wy6BN2pDODNnv/oCcZr6CRkuWtWr3otkYdyR
 vYKIBOeuy44wWu1PiIXio1VsCv1UiCuwqlWIzUcpsn9IOuslvnHCNMxCrU6chal/9V/k
 y5RA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9rElYWq98VvX4isQwWmuWvSyw+LvHXmsk1vfS2xMonH/VOmTmlu2eFkgteyIocTPzgTHd3M8iUlXMmgr2zeSKm2O6
X-Gm-Message-State: AOJu0YwvI0aCfDKWcBrLrXkicszMiRIF3VWDzxKf5+6BotzzDrnnF/U8
 t1I0yT+tHK1mBsvbTgyvxvfYallv5NCR5BBnQOi37k5lsJwtFPIWojIt7hc589c=
X-Received: by 2002:a17:90a:8b17:b0:29c:776f:8911 with SMTP id
 y23-20020a17090a8b1700b0029c776f8911mr47097pjn.21.1710874311097; 
 Tue, 19 Mar 2024 11:51:51 -0700 (PDT)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 w13-20020a17090ad60d00b0029baef194f7sm9953012pju.38.2024.03.19.11.51.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 11:51:50 -0700 (PDT)
Message-ID: <cb5d981a-6db4-479c-9eaa-bca49c40bc72@linaro.org>
Date: Tue, 19 Mar 2024 08:51:46 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v8 06/23] target/arm: Add support for Non-maskable
 Interrupt
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240318093546.2786144-1-ruanjinjie@huawei.com>
 <20240318093546.2786144-7-ruanjinjie@huawei.com>
 <CAFEAcA_xSHAJnn0_O9=zGo9u8omzhuB_WvuMo9gf7wKt8OVDmw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_xSHAJnn0_O9=zGo9u8omzhuB_WvuMo9gf7wKt8OVDmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: aMH/yRLt/ihQ

On 3/19/24 07:28, Peter Maydell wrote:
>>       switch (excp_idx) {
>> +    case EXCP_NMI:
>> +        pstate_unmasked = !allIntMask;
>> +        break;
>> +
>> +    case EXCP_VNMI:
>> +        if ((!(hcr_el2 & HCR_IMO) && !(hcr_el2 & HCR_FMO)) ||
>> +             (hcr_el2 & HCR_TGE)) {
>> +            /* VNMIs(VIRQs or VFIQs) are only taken when hypervized.  */
>> +            return false;
>> +        }
> 
> VINMI and VFNMI aren't the same thing: do we definitely want to
> merge them into one EXCP_VNMI ?

We do not, which is why VFNMI is going through EXCP_VFIQ.  A previous version did, and I 
see the comment did not change to match the new implementation.

> The use of the _eff() versions of the functions here is
> correct but it introduces a new case where we need to
> reevaluate the status of the VNMI etc interrupt status:
> when we change from Secure to NonSecure or when we change
> SCR_EL3.EEL2 or SCR_EL3.HXEN. We either need to make sure
> we reevaluate when we drop from EL3 to EL2 (which would be
> OK since VINMI and VFNMI can't be taken at EL3 and none of
> these bits can change except at EL3) or else make the calls
> to reevaluate them when we write to SCR_EL3. At least, I don't
> think we currently reevaluate these bits on an EL change.

We re-evaluate these bits on EL change via gicv3_cpuif_el_change_hook.


r~
