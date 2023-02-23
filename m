Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp938843ejc;
        Thu, 23 Feb 2023 09:27:31 -0800 (PST)
X-Google-Smtp-Source: AK7set/JXrts6VVCxgPgR0RnLj8BdbEo2Oh5fuwWuxB5sKQZ76PGmBd8Mzw6iKecUAmgOw6uIQzr
X-Received: by 2002:ac8:7f0e:0:b0:3b6:3508:2a3e with SMTP id f14-20020ac87f0e000000b003b635082a3emr21381575qtk.4.1677173250938;
        Thu, 23 Feb 2023 09:27:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677173250; cv=none;
        d=google.com; s=arc-20160816;
        b=xnD+QPX0udVOho4buMFqJCtV1V2p1vVGXkYEYeO6xZSrKv5eBddqc/m1jS9Loe7i/u
         dxcfiHr3sjuALT1LNxsrdxS1AMUi8RNNTM3c04w6r6fIR0bLepK5wJj6a8RVgSb/0QzJ
         guSgV0FLey3FYrQdE+XsBjAxJMoL+yELvYTDQVIYVia9f+9dKTZvfzWOLDhPabFd9xbW
         TKVwtgKfw5sJhVDIQcPv/99NgdwwRhDt/aoMlLp+hzhXjeRZOX+mAimT4qA0w9JIAkuG
         6Sp25O7uxVbkleCDXWEqieXFG87x/7BkUMpPEZSPcYHkMRJG9nA3OlTgsCZ4stXWq5lf
         qciQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=VyASiPaET0zIPAdQqxkCI7+3F5Exh4WbIhnAE3msLYM=;
        b=l4VzG2SXRiPjwdKBIMkqrvI+4l4tHRRAPhGFfYl5YrH/Yk8pSzNn2JlcnoFtl+Esct
         m95gGfj56GKYB8CiP67fxGub0hR3pD63HbR8YTG+zoHuGMMlNJ8AjxrwBl1jSKwenlAc
         Qh+XDA2B8ZbuNT0zW998YwOCXdh5QExFEntJShObDBvZcXj43+zhpdjlY0Qmvnikldcl
         SiM3SJYOLySOa4Yr5KymSPRqKncg1GowrtgGVbRKv+QyahDLr6uLwkJAWvfZDhYd7yKI
         wE69ZWNbo2nM5L72H2d6aGFjEVmEeg562a00Oz08nfEPa/awxe7o93sggsrzjqlI45Pc
         A/ZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AidAtHbk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2-20020a05622a15c200b003ba0207ca7fsi7060151qty.709.2023.02.23.09.27.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 09:27:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AidAtHbk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVFN8-0001K7-QL; Thu, 23 Feb 2023 12:27:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVFN7-0001JO-Uk
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 12:27:09 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVFN5-0000IU-3W
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 12:27:09 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 z20-20020a17090a8b9400b002372d7f823eso9877467pjn.4
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 09:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VyASiPaET0zIPAdQqxkCI7+3F5Exh4WbIhnAE3msLYM=;
 b=AidAtHbknL+WmwqtNu9xFMotMn67GxeG5gBr1YPI6WJzi6l095BO9xTrJF+LE5oUrU
 WXEdX1byRnztFvqS1+EndnB283SsnJWZpfXy9jkmEcwq74ROKLHHuDDMnx3ONxyCPruY
 wN1mDAinL9zq/AmuWCnyPV8IgMDQoJL+lON39+mWGSEoCT0RqlyEm2f6jwWZSbWfYRQo
 wrRjEZSrJnEmN+LuQu++gitP17RAVO6pBIZPquYXQt5LNHYS+iCsjjSAXzshQEoAjwfK
 SrnGijoo/oZUOqj6CFPulo2Jl56y5ckdO7NBBzBVJ+5/ZVny7St1KGHid8EItIdI9wt1
 lzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VyASiPaET0zIPAdQqxkCI7+3F5Exh4WbIhnAE3msLYM=;
 b=cxY5ezyaMom106VCD6oeFQH8Zn5zIFbjxhB1Sp3r5jGMHqCv6O4q/lyHRiKeKcz/A/
 lSR3cJSQrdexNDNc1BK4fmgsqwt1WGUpkebIdNy2ZihtQjZXwszwBGtSWw3t5IKr3BxK
 HektswmRz/oYax4rxnCMSoIVeQYxymJnMiR8fMOP2hC7Vnq1EFst6RMi9ew5lrhXNFXW
 2nICKH8nazYmRK3GLIJILptZH18MOp0BgQ9brIVtdeycCC1QUz+VB9FLGoNX3XH2HLWO
 578Ns5k/amt26vW2bHfzA1LTV9TSeg+nIssNLopTqpjYpd63KSnJXo5B/gv9x0Xm8Xoq
 t4nA==
X-Gm-Message-State: AO0yUKX8KcZLfrAZQ9+mK1R1x2m+DKk7JnoUg7jiKXh04UE1xpiiDywk
 AeZj0Epgh81g3IqXRZeXkqfpoQ==
X-Received: by 2002:a17:90a:1c5:b0:237:39b1:7b7 with SMTP id
 5-20020a17090a01c500b0023739b107b7mr7910873pjd.11.1677173225391; 
 Thu, 23 Feb 2023 09:27:05 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 f35-20020a17090a702600b002311c4596f6sm5237237pjk.54.2023.02.23.09.27.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 09:27:04 -0800 (PST)
Message-ID: <cf144649-270e-8cd6-3433-196953e9e695@linaro.org>
Date: Thu, 23 Feb 2023 07:27:02 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 16/19] target/arm: Relax ordered/atomic alignment
 checks for LSE2
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-17-richard.henderson@linaro.org>
 <CAFEAcA_6_Om4hGBB5=pFVRzOiE-PndYU9TAFGRj1s7=s9-C0qQ@mail.gmail.com>
 <835a509d-caa4-9cf7-88f5-d7f3705dd646@linaro.org>
 <CAFEAcA-nAdnugbDPgwAknALzSzjN5nhrvVYjuBKuShEqJrZxKw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-nAdnugbDPgwAknALzSzjN5nhrvVYjuBKuShEqJrZxKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
X-TUID: yPZujCtGYKSK

On 2/23/23 07:22, Peter Maydell wrote:
> On Thu, 23 Feb 2023 at 17:16, Richard Henderson
>> xzr uses tcg_constant_i64(), which has no lifetime issues.
> 
> Hmm? cpu_reg() calls new_tmp_a64_zero() calls new_tmp_a64()
> calls tcg_temp_new_i64(). What am I missing ?

Whoops, bad memory vs other target/foo/ -- aarch64 doesn't have separate 
get-register-for-source and get-register-for-destination accessors.


r~
