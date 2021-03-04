Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6520122lfg;
        Thu, 4 Mar 2021 11:34:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzky3iSIcCfkgZuhYBIjcPRb7udYCYTcmiTeR+0COp/REsW+6NBl6O0/OFAqQvbVj/nmoA0
X-Received: by 2002:a05:6602:2110:: with SMTP id x16mr5101039iox.16.1614886495846;
        Thu, 04 Mar 2021 11:34:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614886495; cv=none;
        d=google.com; s=arc-20160816;
        b=IxLrmX5yLH+qHnMIOtg/HPqL0APkS8yFR22K6DVGYzTsfoe3G/mp1mUfFftkL/P0cM
         lmmxEESAYqm3yqWmmHuDB+z6GGshZM8vzMySAD8MFEr4XY1PB0xlzSTN3YA12TrUKywP
         ji3w49Ekd8oDFmxyQqrdVvXfhFPdvVWP4g+47ogXshObEipJvOLmjcrgG2RG+AUcC4pS
         cinw7xVA4dCWB48w1sV9Z+KXW5Ks83QPIoT/pt5+YzsYNWwHALi8csImkalVx2KcagAM
         e41XywAPsG+EsDislfsgrn8j9ZIPNHH8EYXMJATSWo3E61pKOhw/5GXRLp0wUaFEpR9y
         bO6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=mhiIeoDCIjNu5cHdu32vkf1b234ZOSh9+pH/oK5fT0Y=;
        b=0SwWs8UT/c47kZ6PQtEXub6cbUG2aZiw1iER652lgKc1OMuCL/F2qmoEs+Dm2vYOvo
         s+B0XW5qq48HZC2KeXSm9F3tTLNiEkGcv8K8gfyvkuf2ExKA/WW+9s/4Pt3otVyqko7z
         nOnKo2U5RVYRZQ3xfqfUhJRxECGkaklo+HwmJ1M6a+hD+i0AUKs9s3X/mQpbIJjH0HoT
         78X3cG3pO7GxzmnEceJFTQJEnvUmvXzUfQdVkZ0Tk7J5cTZg1egKQMCeIUPsz6loW3or
         J29J3WJceSgi17AbpdipWuto5pLxgJc/CFZfett3cfKQhtGTpv4Ly/TV0UZLzzRhb7Qr
         DxiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nZF85RrB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l17si129335ios.104.2021.03.04.11.34.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 11:34:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nZF85RrB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHtkN-0006a7-5p
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 14:34:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHtkB-0006ZJ-Sn
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 14:34:43 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:42792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHtk9-0004V5-5P
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 14:34:43 -0500
Received: by mail-pf1-x432.google.com with SMTP id w18so19677885pfu.9
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 11:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=mhiIeoDCIjNu5cHdu32vkf1b234ZOSh9+pH/oK5fT0Y=;
 b=nZF85RrBSQgm20Mn5rr3Q4YKtNoIlNZdeyBUG5CZREjqbi5RasTjNazV5mX5ZZA3Uj
 mbIq6gT23FsP64aW0fEXYiCHSS2LWwcFq2ObxxnTX5Mw217QwT3lU2f1PXqDlBq9v8Bs
 4lea7AdZGs35qng+wqthJM51S+DZxEtyOxpEXXEJwMII5cxN7SM6Gu4RGhzgEW/ACjE/
 j6v0ELZmKZU1cQZehy8Y4NW8ZCto7rr2qhHxqvUwEBbnO1scnTh6F6ppgrXH1nzIQs5o
 tZoKn60+m7/UBKdzqT27MAEDVJU3aRor8VnjjKe4xuSnDnN/qhfE/ai7Y1SoQaml2zgR
 LUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mhiIeoDCIjNu5cHdu32vkf1b234ZOSh9+pH/oK5fT0Y=;
 b=YUDAX4PYHvBSkZkNZpgQK6GGx6ONFt6VT2rC/hHYHBdznktJgfFrW6oD9truFyGEO4
 c180KkEBCOCYmgz6ixkKTHOlCZLFR1k1emsho3deRlzUllaXgvG8yGIXYfH7lPr5vabY
 D/dmj0P6swpjUizMbnQTBtHtyzVvaYXBz/AcZSt07KseWjBsr4nisD/BFMx2T9NV/ch5
 elqY39KW18032r+3tyxJoqli111gCaAqSEvfeEbwrBMytGiV7tZiydbc/7IPH+POy4XJ
 4e8NsRV0rNQ7a01//bI+r/fQwA2YDcPZnHD8peuNmtuhzIts3hf/rpl0/EAqHnOqAVwC
 IaLw==
X-Gm-Message-State: AOAM531VkDTE9Y+GRvOZPJL3Cw/TXwvfFHj9EtMx6vND6RhgURg9U7nI
 Rc4A24Xy04L/PKDilPwhjC1+vA==
X-Received: by 2002:a65:5ac9:: with SMTP id d9mr4903533pgt.74.1614886479548;
 Thu, 04 Mar 2021 11:34:39 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id k128sm178414pfd.137.2021.03.04.11.34.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 11:34:39 -0800 (PST)
Subject: Re: [PATCH 14/44] hw/misc/iotkit-sysctl: Handle CPU_WAIT, NMI_ENABLE
 for SSE-300
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <32cefbd3-6af0-da4b-b07d-9d8fe52e46ee@linaro.org>
Date: Thu, 4 Mar 2021 11:34:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sSlgTWgYDN6d

On 2/19/21 6:45 AM, Peter Maydell wrote:
> In the SSE-300 the CPU_WAIT and NMI_ENABLE registers have
> moved offsets, so they are now where the SSE-200's WICCTRL
> and EWCTRL were. The SSE-300 does not have WICCTLR or EWCTRL
> at all, and the old offsets are reserved:
> 
>   Offset    SSE-200      SSE-300
> -----------------------------------
>   0x118     CPUWAIT      reserved
>   0x118     NMI_ENABLE   reserved

     0x11c

>   0x120     WICCTRL      CPUWAIT
>   0x124     EWCTRL       NMI_ENABLE
> 
> Handle this reshuffle, and the fact that SSE-300 has only
> one CPU and so only one active bit in CPUWAIT.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

What an irritating and pointless change.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
