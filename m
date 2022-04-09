Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp640052lfq;
        Sat, 9 Apr 2022 13:11:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSx/2DypqDm/OeaLlz1RFBfyHGFDUdlTZfFU7jsS+X4KYwnn7ZWUcYdD2OYTl0kWw85qXa
X-Received: by 2002:a05:620a:2941:b0:67d:243d:3b7d with SMTP id n1-20020a05620a294100b0067d243d3b7dmr17286570qkp.46.1649535103967;
        Sat, 09 Apr 2022 13:11:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649535103; cv=none;
        d=google.com; s=arc-20160816;
        b=Ps4+36plwjYGBnMjhhJx5/808qOYsFKwIWV+yZFaxELL5KXYcQ8I0hY5FDtbD5ipSe
         5+g2rIFVqvdYFDcC9jcZprReSWIZHKiukSE4xXL9DQ08PHP9Kud1bZL/Egh7uk4M+nkU
         ZJf2RL3dB245OZrqDU/z9CRtrgRDkM6nAF7uE31Mff6E18DQPBcQDXnvxeHwBZbEFdR6
         5nKHiUuqRbTXyHBVIIJBagSq3mjsorvtquBzi0tibEzbbMNXEKX9DHHkPe5GCaRtz7RN
         nXE9XVYB2G72D1d0dLmu05cOak8Uuy43S6lMDLN1UtgqfbkR4rf2kVRbQHlYfhk2bZLk
         4xAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=5gwhRLe75XhGO0u1FeswjatRtMSm7CsBZnIlbEPN5Ws=;
        b=bqRRCrw/Tl7nMiMOsIMh/SqGismG5dFyK4+U57nXWwVpxnCi7lbAwZBDi4krTp5lIZ
         qXAV7gKa0GORTUUzTNt8Ya9qGBQ/R5UhJ4yLhOhbRJv+CD0cWa3g7ZBt6sDrFDxnccO6
         OP4/igQO9T55RfFfPSeLAhL83a+nC9Qq1OwvI04kYMMERryVMNuws6imPCDEIpbqiIcl
         /tBSTeOcVqpmZTFWx18lsq+1jeC7QqTyOjY/JjpR8O/HfXHR6wSxcF6sJ5ngwtQFxzst
         w9KAYFohjEnxTL+22dY4gfujF8zCHPVLjs3VKKVLxTwFsBQYOiRjn+mVVwAnNsSNBr1K
         EHyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oNXrYDvN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e19-20020ac84e53000000b002e1fbf3bf02si3064365qtw.243.2022.04.09.13.11.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Apr 2022 13:11:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oNXrYDvN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndHQt-0001ZE-GQ
	for alex.bennee@linaro.org; Sat, 09 Apr 2022 16:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHPc-0007lT-PK
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 16:10:25 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:37464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHPa-0007hn-Iu
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 16:10:24 -0400
Received: by mail-pl1-x62c.google.com with SMTP id n9so10768232plc.4
 for <qemu-arm@nongnu.org>; Sat, 09 Apr 2022 13:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5gwhRLe75XhGO0u1FeswjatRtMSm7CsBZnIlbEPN5Ws=;
 b=oNXrYDvN+1pm8k9zem/Whl8ieYXKVzLsu82NcskVtX4D1rZno0vSJSTJvo4H/ZlHnE
 d9zIsxOnVJqROQZwltBdO/cDItXBAaTAGlVLBrRdESQKwMFf37XFfQFQqAe7B/MliuwX
 p/ElIFK+0XK+ab00QoUesbamitpup31Ta33jF9W7KFwDwzYPtsLr8pEl5fLiH/Tb3Heh
 cSq0XRc/h+5Cj6FVkbBXKN4V9+h3OH1lvL59VDAjpz74EFmciIyqoYXqW+YH/BHjXaTe
 z60hZoq9iSK9F4Uc5q3klEANLnAOId0uVWG20XG+UPTid8692IUTtMsn+PcdpPbtV6Te
 caJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5gwhRLe75XhGO0u1FeswjatRtMSm7CsBZnIlbEPN5Ws=;
 b=KHrNO3ZL3HTEcPD9ZPd1dLzDrdn5J+XTrGTmIuJgfCkc8rl2Xq+ioZMTg7jRmomSRJ
 j71He2Ra8ZSNrv+CSAkTa6fLpT1D8PYQo+MzSqHftERj52Fc+ZZsL8zcz/uOXg4+vfCB
 SmQN7EUFVakFfXii/fIxG/ZxLv24PnjZFc8MaieyAJQxbMX8JZzSswiERamBcNobum6r
 EejwzR0cMfyuZd5qFn38JwL2m5bAxLBDS9TfWJBYU5Zof/LYBukl37PO/u79pm/Al6od
 xrY3VQCpHQxq3HzjMo6NWS2nCwOgWca1Ko/YqxfjBI9zyDC2fPAQBaujBgtev/wYQbLe
 QDyA==
X-Gm-Message-State: AOAM530sJuECjyR8XZnIFxQNbXVFwaTRdThybdgfecRjI5yEp5ZWCTyJ
 YplIjWtrT8jV2PXx6kH8clJDaw==
X-Received: by 2002:a17:90a:380d:b0:1c9:d9bb:7602 with SMTP id
 w13-20020a17090a380d00b001c9d9bb7602mr27902722pjb.216.1649535014333; 
 Sat, 09 Apr 2022 13:10:14 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a17090a170e00b001cb7e69ee5csm402658pjd.54.2022.04.09.13.10.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 13:10:13 -0700 (PDT)
Message-ID: <5d7391a6-21d6-01b4-fee0-289c3891def7@linaro.org>
Date: Sat, 9 Apr 2022 13:10:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 29/41] hw/intc/arm_gicv3_redist: Recalculate hppvlpi on
 VPENDBASER writes
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-30-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-30-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oXyxX1wI/ViY

On 4/8/22 07:15, Peter Maydell wrote:
> +    if (oldvalid && newvalid) {
> +        /*
> +         * Changing other fields while VALID is 1 is UNPREDICTABLE;
> +         * we choose to log and ignore the write.
> +         */
> +        if (cs->gicr_vpendbaser ^ newval) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: Changing GICR_VPENDBASER when VALID=1 "
> +                          "is UNPREDICTABLE\n", __func__);
> +        }
> +        return;
> +    }

...

> @@ -493,10 +574,10 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
>           cs->gicr_vpropbaser = deposit64(cs->gicr_vpropbaser, 32, 32, value);
>           return MEMTX_OK;
>       case GICR_VPENDBASER:
> -        cs->gicr_vpendbaser = deposit64(cs->gicr_vpendbaser, 0, 32, value);
> +        gicr_write_vpendbaser(cs, deposit64(cs->gicr_vpendbaser, 0, 32, value));
>           return MEMTX_OK;
>       case GICR_VPENDBASER + 4:
> -        cs->gicr_vpendbaser = deposit64(cs->gicr_vpendbaser, 32, 32, value);
> +        gicr_write_vpendbaser(cs, deposit64(cs->gicr_vpendbaser, 32, 32, value));
>           return MEMTX_OK;
>       default:
>           return MEMTX_ERROR;
> @@ -557,7 +638,7 @@ static MemTxResult gicr_writell(GICv3CPUState *cs, hwaddr offset,
>           cs->gicr_vpropbaser = value;
>           return MEMTX_OK;
>       case GICR_VPENDBASER:
> -        cs->gicr_vpendbaser = value;
> +        gicr_write_vpendbaser(cs, value);
>           return MEMTX_OK;
>       default:
>           return MEMTX_ERROR;

It it really valid to write to vpendbaser with other than a 64-bit write?  I suppose it's 
possible to order the 32-bit writes to make sure the update to valid comes last...

Anyway, not really related to the real logic here,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
