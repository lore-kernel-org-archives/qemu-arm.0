Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2179330ejb;
        Wed, 21 Feb 2024 13:31:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXHoNvSwb1OSql5ocEGNBRVh15R+qXgmnqJ7QN1fNLpTZopnI4ZSMk1jUiw0XdS5OJfX+2mPiYan23P5fcEAeCB03qGS8rz
X-Google-Smtp-Source: AGHT+IFDvRZqpX/hhjzovOL9KcxpnPFgQoSsBs5CV/UtP+TFlPwAMRt8NvIFJrsCgZZ0D5FGnyjO
X-Received: by 2002:a05:622a:2c9:b0:42e:228b:5f6f with SMTP id a9-20020a05622a02c900b0042e228b5f6fmr9651297qtx.39.1708551097258;
        Wed, 21 Feb 2024 13:31:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708551097; cv=none;
        d=google.com; s=arc-20160816;
        b=DB3OcDniR6pxJwGC8tYD+Gy3t+/02OzrxowGI82jHJ0ZUnF2eAfo4U3PVqQFyxpf6N
         7gkOFf6OOZj4a61u1D2p8s1RnzbjL4G/eTfMxfuX6syl4FcOOjmrAcw4J/LRn/la9Zsx
         i64tPFKVCOasqBoAQFRHcfUt56yNt8XhloarHu1NEizEmxx6U4szOJtHsi1fsh9dJRDj
         /8xQPaGGzA/7l1fGZKEq8xtKC/xSZOg7q4B3MjA83ZODwbOaJ2cpc1dzAU+pRSXbV2Vr
         0OPLasW8WHVzNLhbjN6u3+swR961SA9pi5HTvdCht/lsWHUe1F9vaF/wZvGKFQge00Sn
         QOTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:to:from:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=C8rTpqcFY6RIbKXI6WMmNyepei8T7VjsWXfq+i09mnA=;
        fh=NqWUj5CB0Y3LymVd8uuC6hWeMkwLHnNS/TXkaX7xKQ0=;
        b=Q+2FihMcRz6GPYclHFls2pYDhi7G90D9Gjc5qrE/R60y1aZDvWguf6tENI6Gs8RhUa
         3leWaUZRLxkjeeyiY47PRt7W7OBPdou8UeJT4PS4Fgau9ZM1nkwI8GrUoxSGUa+5vs6S
         sI5nwTGt5FJg8XFZguJzlylW9G1yUMC7jLE2OJvQmDuHWGWPPY/5dPAHKudQWCDich/N
         xwIua9nsBCE3WCfpc6UnuHgrO/nP0UeVeREXIfDj0jnqVY9T0KJfUgr4zx+HQSpnNt6W
         eT53O1PEeJNGdYy+s3ryP2x04v02oGpPMVzCSkJvSvK5n/YwJLZILxIDX/Qw1dow9jcN
         cecg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nh6PZyH/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x10-20020ac8538a000000b0042e46d1c86fsi381708qtp.410.2024.02.21.13.31.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 13:31:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nh6PZyH/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcu5l-0007yv-7r; Wed, 21 Feb 2024 16:25:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rcu5d-0007ZW-3e
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 16:25:19 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rcu5a-00031k-UI
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 16:25:16 -0500
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6da202aa138so702529b3a.2
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 13:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708550713; x=1709155513; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C8rTpqcFY6RIbKXI6WMmNyepei8T7VjsWXfq+i09mnA=;
 b=nh6PZyH/2U+g9vsU8GTYpLd3SNyW3tuRkgaO/F4A9ImjjLF9iB5XaDuIGpm+6cCC/n
 Wvh8KRFF5Mq+CLin8p5kBszFlSYY3gT3YMG4AYfrrqf/RFCjHAe6EKB3CXMFoSqM29hX
 c1jbK4HkF9319POQi4UlxReo0iUiHLiv8OTWDWMVMC971dxS1EuocFdwL1XsCdZcEBWP
 ryDbyYsoWH2s+uDUJA6CrsP5qsRuxyYP1QqZh/rDRnBV/iyyuE3TBUcqcwqh+oIaZkck
 GiSDQv5ponftpdRyH3dullkF45+vgKMPjtsvirykGVR7pwwIdk8waW16CeW4U7E0NxKt
 UCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708550713; x=1709155513;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C8rTpqcFY6RIbKXI6WMmNyepei8T7VjsWXfq+i09mnA=;
 b=nQvR9dZpC6SDK5CAEOlgdoA5uA5lrhdu315zc8DvPHIB+Ns/dAlQBdvVCedeHBeMJq
 bDBcrmR/41bqGD7sc9JkN2VozIQOBu0l9JptiXOO4keZ/AJRwZ/lkKHdFFm4IgQqhZt/
 u6vjp1rXrBGWFEyE2wCc6MGMUZOmkR/2bCJ3UoQ9Ai8S+OXlfz5ZgRs1qoGUovmZS3dE
 sbXIjmZxYSt/k6voiMShH+ObFXVZb2meRA5/kLwy3PdPXI+ZbwV8yU4JhDfF1KZbzNYv
 vEwMATabn37J7yZteECE5GrmTMwyCEDzLn6Tn/cSu99km3kgZqLOjLwpw6vHZZL2tnD2
 7zvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxuOBT9R/G00vILLb7rsXbcFPPLwFjYRA8il3IzcS1hlZK3eWlsmUhHitkxj5lYyRqGGA61w/WE5mHYLziXkq3O7zA
X-Gm-Message-State: AOJu0YxFOPZTgfmY7mpKvkgeklbyIqfjD5+wnZ+xdIK/G+bJOZkV0eGH
 raX5ItF5XcQA2MwymAZh5hzDDJfl0mCfXV2OOSaZeJvLWareXPvIxVyRUXskglw=
X-Received: by 2002:a05:6a21:2d06:b0:19e:67b0:9ac6 with SMTP id
 tw6-20020a056a212d0600b0019e67b09ac6mr28379760pzb.1.1708550713369; 
 Wed, 21 Feb 2024 13:25:13 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 y4-20020a056a00190400b006e1463c18f8sm9369983pfi.37.2024.02.21.13.25.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 13:25:12 -0800 (PST)
Message-ID: <a4c733be-450b-4d28-b869-fd80630f3ecb@linaro.org>
Date: Wed, 21 Feb 2024 11:25:09 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 07/22] target/arm: Add support for NMI event state
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
 <20240221130823.677762-8-ruanjinjie@huawei.com>
 <c02228ea-4f24-46f9-b6b3-34cba3059d69@linaro.org>
In-Reply-To: <c02228ea-4f24-46f9-b6b3-34cba3059d69@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
X-TUID: Ii9OhkeVw3O6

On 2/21/24 10:10, Richard Henderson wrote:
> On 2/21/24 03:08, Jinjie Ruan via wrote:
>> The NMI exception state include whether the interrupt with super priority
>> is IRQ or FIQ, so add a nmi_is_irq flag in CPUARMState to distinguish it.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>   target/arm/cpu.h    | 2 ++
>>   target/arm/helper.c | 9 +++++++++
>>   2 files changed, 11 insertions(+)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index 5257343bcb..051e589e19 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -603,6 +603,8 @@ typedef struct CPUArchState {
>>       /* State of our input IRQ/FIQ/VIRQ/VFIQ lines */
>>       uint32_t irq_line_state;
>> +    bool nmi_is_irq;
> 
> Why would you need to add this to CPUARMState?
> This has the appearance of requiring only a local variable.
> But it is hard to tell since you do not set it within this patch at all.

According to Arm GIC section 4.6.3 Interrupt superpriority, NMI is always IRQ, never FIQ, 
so this is never required.


r~

