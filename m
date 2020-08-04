Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp862889lfy;
        Tue, 4 Aug 2020 13:38:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxn9Fr3pR4ggyVtVLyozyBrOItWltQxuOB8yZitCaS3eibCTa8Rvc9N/p5yH0XALTJupBs3
X-Received: by 2002:a25:3242:: with SMTP id y63mr33495599yby.356.1596573519590;
        Tue, 04 Aug 2020 13:38:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596573519; cv=none;
        d=google.com; s=arc-20160816;
        b=FYo0l8NVQGSH0aUhc9QQs9mFV/uz+mpDGaPFny+p/OLhOu10F0QizDZTU6dDmwGEs3
         bvct8ktPanStXxPXqwaeyhS+rw/C5webeNL20Hv0JSvMxDQ0TfXwlJcRxwXw/xBeKELy
         twUUcxBniojVG+jPikznHNyUhX1TGiC0573gxALWvT/XzmLdBARaXnSz9bVxmM6qhHPh
         NMDmabFwQ1jT0Rgrlgv5gNW6qeyrG063Jk8Lf5FyzyWtQDzeCiArt9FZGkSgF35l2Ze/
         Ije5HE72ByYhRWcOJ16++kvZcQ07jsynOctvo4Ic5b7mxJ6vU8tADRG5NMuE+oVZxDPH
         cuVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=9FAJakEgbKjpmXyutDshmIZF2utxHX29IOuXxNo/7Xk=;
        b=G06UrJVg4iGBSztEMe4+S6OKdtNzL6PZ+7h4GLB8yemwYQ29ipomKxleSJg2zg08GX
         KAKoBG5QhCgme8R1PjJOPNVRA0TxJF4eQCmsjMJQ+VQhMTnDGakQUdSI2ipbr6jdsfkb
         vj5kZCjDlh6BoVA1xqCOEmlcC8LAFz4QHX7pG76UPiXaBmJiT+ui2iVmTnJhjZWHqOtD
         BqzkDP74x1KWcoBYD7D/XuGmdSyY8abc+wt/xzbIcVT+VlwOaTInXMhqb1bN9TCTWF/j
         hYt6sNKFYmb4yT70J+mrJLGG2yj5d7DgiHrbsCQ/ObNu2s1c5x8S95DTcAAe4ZghDbSz
         W2XA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NA99CEQK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p138si77937ybc.270.2020.08.04.13.38.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Aug 2020 13:38:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NA99CEQK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k33hm-0007Ze-Vc
	for alex.bennee@linaro.org; Tue, 04 Aug 2020 16:38:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k33he-0007ZB-Mz
 for qemu-arm@nongnu.org; Tue, 04 Aug 2020 16:38:30 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:53532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k33hc-0006xF-UU
 for qemu-arm@nongnu.org; Tue, 04 Aug 2020 16:38:30 -0400
Received: by mail-pj1-x1042.google.com with SMTP id l60so3215646pjb.3
 for <qemu-arm@nongnu.org>; Tue, 04 Aug 2020 13:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=9FAJakEgbKjpmXyutDshmIZF2utxHX29IOuXxNo/7Xk=;
 b=NA99CEQKmM5BMsykOgt5jcf/klVDVBqRy3T8iewI49SMTJAlREPxnaZa3JYJRETDOt
 wu+kuk9squokYJhGKy6uE/S8OpdVhbE+MPosecGGcm+hj2leBiUVMO/nlW0eP9dknbQb
 0bvSSmxKTz4+vlRLBAiCfKUidXcioL6Q376pxwIJLe824Q4+SqfhKxQNRZ+aj7EZCarH
 nJqK1ZfUl0zaFFIatCSQcVzmcPmgNnHwoq5Gzn/I/zNyi2fCBURa4BFzQonhTNtSiPA7
 iHTfvUvpbTsxY0xMvJUt5Jc+Ifa8EokMMazQaBaOHnIwmWZixgaWXpGPmQjCAFtrmApn
 nznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9FAJakEgbKjpmXyutDshmIZF2utxHX29IOuXxNo/7Xk=;
 b=SrnJgperjTndXZiq5YrDBnz/PwI3LyIgo2Vuu3YFs/7suHsEv60Hbu3cFo01ZDjdln
 u4iEhd9GPpdCug79qZ8h/BcW36ZcKu+781bmPb2Cc1F8PBrrRaXBWQfwhIPMExtk2vrD
 mYwBZvWqok4JLrn/dP8zPTEj3PP5ZVwc+b2N0vO8fuqCQEdORwwh608HYXVUDkzyMHod
 S2oKDjQS0DklQ3M6p8WhOowwzmhAT7rIWaw04NdH5YPBOXQ21BsvEK3tBME8Wz1ywL2f
 dtlS65Ya9bJfv7fI2edEmo+XFHXXK8KVEIA1Wl6T5AJu8ocrpwU6o/6F5Z6anPVb78Zz
 cNtw==
X-Gm-Message-State: AOAM53312fTT9vRi+/JAvIuHg4iK9std2nEpBR/ExNXZ8W8Fzj/ujaY4
 HaPsx4FhHFIKO4Th8n83gU0H6w==
X-Received: by 2002:a17:90b:1116:: with SMTP id
 gi22mr6365860pjb.209.1596573507165; 
 Tue, 04 Aug 2020 13:38:27 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id b22sm7009474pfb.213.2020.08.04.13.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Aug 2020 13:38:26 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Fix Rt/Rt2 in ESR_ELx for copro traps from
 AArch32 to 64
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200803165409.15099-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6b9b926a-0a46-1660-9a85-bae29cd56cf9@linaro.org>
Date: Tue, 4 Aug 2020 13:38:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200803165409.15099-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: sAd6FZPBcKrN

On 8/3/20 9:54 AM, Peter Maydell wrote:
> +    case 14:
> +        switch (mode) {
> +        case ARM_CPU_MODE_USR:
> +        case ARM_CPU_MODE_SYS:
> +            return 14;
> +        case ARM_CPU_MODE_HYP:
> +            return 16;

Hyp uses LR_usr...

> +        case ARM_CPU_MODE_IRQ:
> +            return 18;
> +        case ARM_CPU_MODE_SVC:
> +            return 20;
> +        case ARM_CPU_MODE_ABT:
> +            return 22;
> +        case ARM_CPU_MODE_UND:
> +            return 24;

... making all of these off-by-2.

> +        case ARM_CPU_MODE_FIQ:
> +            return 30;
> +        default:
> +            g_assert_not_reached();
> +        }
> +    case 15:
> +        return 31;

I don't see that R15 is mapped at all.  Is this really reachable?

Otherwise it looks ok.


r~
