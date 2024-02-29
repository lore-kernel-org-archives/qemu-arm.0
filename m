Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp722142eja;
        Thu, 29 Feb 2024 15:33:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVdRk2aXaHXrOvRTZYYzpiCBIYJZxQTs57MI0UtLvsWnaPSkweNb3Fi0Eiaxu0IRzd1ZzgZT9U/tdEHfKfbNdxg5oXjXgQo
X-Google-Smtp-Source: AGHT+IHK00nq3oh9cH5XmrSsVGRvaNNEUe+ubtOAtbmTXVaH42OeEufQ9xcvC0ZW37X37j0md+q6
X-Received: by 2002:a05:6214:5ec6:b0:690:488c:79af with SMTP id mn6-20020a0562145ec600b00690488c79afmr71059qvb.32.1709249589299;
        Thu, 29 Feb 2024 15:33:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709249589; cv=none;
        d=google.com; s=arc-20160816;
        b=VnWpm98WjqLVrc931ZLnM3g6ScR5FdVidqYr4599LCMr+ibqp5DlVudA3LeBNV2hEA
         f9sxiye4K8tWS4M3xf/jjkq5spPhbKxuHDZ+c1D/N3OAuXLduaP01IuRVhlxWzDax15F
         Hy3QX/APIVMAZMrls6y6+tkU68mo38+U/DP7iEuZ83+dpNGmlzrwYUggDLlvvhN5AII+
         IxBqV9bxo3Y1fVC5C5/mdufogAIJwnE+X6EZhn82F8+Cf3va7aWShYmMfO61ixuZ2dJl
         wBD9NuAys5OWAZ5HwF4DmGtL1R7dEA9+62O8AFz7/7yLZO5k6jqKtUmDEHSlCs0hyAUR
         DpuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=XC3ZUqZdD8nYmcGUxZY7dPczGSWPL9ciFcyvzCDVRT8=;
        fh=nGdBdENVhkCf1nDpcL4dczY7h1lQWoXaDVGB+lswyr8=;
        b=NCbvXZpeG2q4j3LYzWrYqbRs0g7Z6RYQBWbRmePwPNFaT+InguJHgxeHzuaY3I+b3y
         68FZIRKxs21+sN93tlw1VCkzLiNZaB73woqPLOf3toDfogfG07GLVzpYA66UBYgjTW4k
         5Ma04pT31RBZwVR/sFRUth0NSWp52yZuohptdYrtYoECeTQWN1vvXwUnxawSi/hBhrBR
         C59wUKU86lNSjt/jUMUc/jwp0KNDXAZge693v/ibj1y9/nZjQiQ40RLYV/Z4zgMWqTMt
         85JeTnWVORBLflw/xM1lp3sxt5pRlpvVdnHQCSrogT+3U/25BB3S0Hfe4adh+Ej4QDlY
         AEJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v0IiDAig;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9-20020ad45be9000000b0068f94ee3422si2319883qvc.467.2024.02.29.15.33.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Feb 2024 15:33:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v0IiDAig;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfptO-0008TS-Iz; Thu, 29 Feb 2024 18:32:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rfptH-0008Ry-3Z
 for qemu-arm@nongnu.org; Thu, 29 Feb 2024 18:32:43 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rfpt5-00040M-7Z
 for qemu-arm@nongnu.org; Thu, 29 Feb 2024 18:32:38 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1dc1e7c0e29so1663445ad.1
 for <qemu-arm@nongnu.org>; Thu, 29 Feb 2024 15:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709249544; x=1709854344; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XC3ZUqZdD8nYmcGUxZY7dPczGSWPL9ciFcyvzCDVRT8=;
 b=v0IiDAigJODEEBwrEOVPIDQR3ThGdY5jpB4SbNGB8rxz+AhwLZ1U364T+Ch85y+P/w
 t3vU24b9SA7i9mdt3VSlzR8XABXaJVRXPph3GMKbf6gsUuDTR1I16NMa2duy69t7X5Ys
 OIQCQ1Anbm+MOmJ5QzDnwv9DOdDqimyQ9BWDIzMhaHGkswBVFr34shLFYa2yObLOrSdG
 l9vhz2t/9xEK/br9xOjAXTuwPa8x5rfLUb+2GysQKLdO/BL2HJxJF0eHu1ttmHwxhGiX
 sr8S5vW9rvoUqFeLKtzA33b/q4Ez7ksQ1q+IBB204KGXRYWzV5TuyznA114H0rFFefqE
 x0Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709249544; x=1709854344;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XC3ZUqZdD8nYmcGUxZY7dPczGSWPL9ciFcyvzCDVRT8=;
 b=YKPCFaBRiTBQogTumYH1LmvMRsIeK1B1iJORVqHNlQju/d4Mk56D0NZ69NTVn/bUjr
 VHfty8DSksjcVWruPT3uCFVh09oZ1Uyt9q8S30CrMVLq4PRqalj6R0BdN1zplg3nLgbK
 hsubIJQTPoJk5TKf+dHDLpFPyQqJjEmMkdgD16NLXJcwZXx4w6HqOWMMkXW1Vrczl2yZ
 13qxSSlYHwtKSA3NR4tABod1Q9FvFEA2e6t3y4QNGZozHovUtTbFc64T4f37V9Ym7ERm
 bgkoP9XjdHrbIkvNRIQdpx1WND1ab9R1HLesRch4pvVXBxx9DWSkNW0JNnB7V5D4j1BV
 /cUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyw5k9z3uG5CV2tzenPzIXHC7X26Zpv7IKvjB3okaaUUuuMUIfG1h/I1mRbcCmY2O5eRzLGf25BX1uc7iEHUZCbT71
X-Gm-Message-State: AOJu0YwbXynYzt1Xxn4uAWNoCh+CpBgVVl6+dHc3BMKpeSVQcRCULBdd
 /7IhjkE1bREsFEOoCtW2XRQ0oUI5V+LPyJ+8reZerwMNI04zPXD8Cm8/Aoc69skpD4R3XIMpq9t
 k
X-Received: by 2002:a17:902:da8f:b0:1dc:d515:79cb with SMTP id
 j15-20020a170902da8f00b001dcd51579cbmr43286plx.3.1709249544634; 
 Thu, 29 Feb 2024 15:32:24 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 g5-20020a170902c38500b001dc78455383sm2071495plg.223.2024.02.29.15.32.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 15:32:24 -0800 (PST)
Message-ID: <eb98644a-aff0-4188-924f-6ca64e99b2a4@linaro.org>
Date: Thu, 29 Feb 2024 13:32:20 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 17/22] hw/intc/arm_gicv3: Add NMI handling CPU
 interface registers
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240229131039.1868904-1-ruanjinjie@huawei.com>
 <20240229131039.1868904-18-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240229131039.1868904-18-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
X-TUID: 9JbZOIendjAS

On 2/29/24 03:10, Jinjie Ruan via wrote:
> +static uint64_t icv_nmiar1_read(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    /* todo */
> +    uint64_t intid = INTID_SPURIOUS;
> +    return intid;
> +}

You're going to need to fill this in.

It's like icv_iar_read() but only affects irqs with superpriority.


r~
