Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp207167lfb;
        Tue, 1 Dec 2020 06:28:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbwJyF2gwcpXuRW2wJbEwS9HRPtEzB+khRp3zptGkVxkKgOQTbBnaqtrzvvPvGh9t1m9Cm
X-Received: by 2002:a25:c2:: with SMTP id 185mr3978969yba.315.1606832936997;
        Tue, 01 Dec 2020 06:28:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606832936; cv=none;
        d=google.com; s=arc-20160816;
        b=OTjATDKrhgZ7cHLfglMo9LnCUbhM+BWIR/0FaV/XV2dclBi5W/kdtkkX21+FMlQLbf
         ivD7QhTRpAb9Pp/fQI25qk1fGVdAb00P02IrS6F0w4caWiKXO20B5rVLh1fvzVf1/EuA
         WYqko08XjhYojQ7DQLXKIJRLvhgA9Ll4poLHiPHLo+edYKIfXiE7bBXjSF2qGm5t7BNl
         FzH+cpB5oqiwLQcnxIJLM6XAK/kXPMtON3AK9dcegTXOy2JutKm2FvFOOYqa/3kMoS52
         OpMS1QxmNcZsil4Pejf3bKIrUBT2xRTaoPZdnZA25N/KmbGR5QhxgJfwtD2ZsfJ0opef
         FRcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=P59Kz+sWZm3rrMVCm32uNTfSuUsgx2YktNh0BZnYIiE=;
        b=uBI007YVABUvXYnt3YFxlcMKkzdcopCsADKuh4myjTFWeYeqHYf9Pp1lIvuKvBM6KC
         5npMn4GRuiKuE+EvhukBl5PfRTnba/2d7oGMjbMzcattGeZcFt3cI/vlhujhGvXnSLBQ
         X7O8/fZEUSbvsaCXJFxQqCtv7a91LKtMrD4ccGFKpOTeKxWruiaX7jn+hNKYvYn2Oeye
         iE5NXjJqoAB1Ud32DwLDMrTWACLgDddOg3yU5Mq//SVmvxdn9yuPTG9DDzuIJhyv7I3S
         WaJS2X8qDvShQ6P8Oty80X8+w6Ay8TYECQhLVOkHB8TYWnVf6TivZkvEv+SRefPoffts
         AySw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OiVpzzAP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x30si2106776ybd.305.2020.12.01.06.28.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 06:28:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OiVpzzAP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kk6eG-00082p-Ca
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 09:28:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk6dc-0007k2-98
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 09:28:16 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:35334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk6da-0002Ko-7a
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 09:28:16 -0500
Received: by mail-oi1-x244.google.com with SMTP id t9so782710oic.2
 for <qemu-arm@nongnu.org>; Tue, 01 Dec 2020 06:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=P59Kz+sWZm3rrMVCm32uNTfSuUsgx2YktNh0BZnYIiE=;
 b=OiVpzzAPx4pN0oIFEPeNYsgIt8V+uYpnnsR05+RTgPia9aEhyxY5Zq/irm3ECzVmNb
 /kl3X9h2VBL2KZQ5hjsqok7xlM2eMOFrkZ/KD/wGjs4t4IOqaPuSSKbJzUVPKlg8x5Et
 Qd+9rDlcVOMOZdAW6IMpCRklzh4UmtXEVlEqjf3Kz5j9Gh+wtyIwmELKWmdpBc6fWH/p
 7q4Qez2oVMN+agItiojep9dmbEZbEhhSGFbnVjVYdFk/3yOb/kJzoj9zUwhLgWjWczoU
 IG5CYBNxsXoyWiwdi/2lT7sBkXD7NyEqQmGBEMvVL4yiDe/QtnLrjhi7efo9lKOFEYw3
 mR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P59Kz+sWZm3rrMVCm32uNTfSuUsgx2YktNh0BZnYIiE=;
 b=U5TpcMEVQjmmbVkhzNJH7P7H5kQKGM6pJ+Oh8C14cC/EgByEEwmMX6QopUnp/gRZoT
 kaRlkKLH1tq20k7fgLREj2Ws7S8PTyeqADRWlbyCCKu3Txh6Hi+pIcHe/tOd/Tlb1OmI
 gMxC7RQYifBMcMh5aKhfHBAUyXTnJVFsIQM4P06nHb79IcExBkJnHjIGBCvTFRkc8sou
 Hx4GJkStoMM1gZ76FFXKmpnAqj5ak81S/ZEgBvmN/SiaLjNfurYROukpscelpjUO7Bf5
 yGKWSo5gP1EyTb9NYmBG0r06LWeZTE44xrZN7fnF3QkzB1/o/MbmsRXZK5yVOrbgIj22
 Fhfw==
X-Gm-Message-State: AOAM533eT27iF4cL0OMvoaXMakiisFibaMWTmEetnzyWQpV4OMRRGdXg
 F2tthTTxte1I8bQyvDTjLTqvIw==
X-Received: by 2002:aca:dec2:: with SMTP id v185mr1859061oig.6.1606832892768; 
 Tue, 01 Dec 2020 06:28:12 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id j126sm424998oib.13.2020.12.01.06.28.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 06:28:12 -0800 (PST)
Subject: Re: [PATCH v2 15/28] hw/intc/armv7m_nvic: Update FPDSCR masking for
 v8.1M
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-16-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <52768558-ed95-8c00-47f3-6800e3e3e705@linaro.org>
Date: Tue, 1 Dec 2020 08:28:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x244.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: hypm/Ld6mEM5

On 11/19/20 3:56 PM, Peter Maydell wrote:
> The FPDSCR register has a similar layout to the FPSCR.  In v8.1M it
> gains new fields FZ16 (if half-precision floating point is supported)
> and LTPSIZE (always reads as 4).  Update the reset value and the code
> that handles writes to this register accordingly.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h      | 5 +++++
>  hw/intc/armv7m_nvic.c | 9 ++++++++-
>  target/arm/cpu.c      | 3 +++
>  3 files changed, 16 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

