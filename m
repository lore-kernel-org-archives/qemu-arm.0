Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2396202ejm;
        Sun, 23 Apr 2023 12:04:16 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZLXJMr/MnXLzBZ1jXavi4AxwusF1UhfAwR4z1dr/xiJY0ZLdHKfOs0iTs2T3gc8k8zVBaG
X-Received: by 2002:ac8:7f54:0:b0:3ef:40cc:1db2 with SMTP id g20-20020ac87f54000000b003ef40cc1db2mr15947218qtk.24.1682276656527;
        Sun, 23 Apr 2023 12:04:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682276656; cv=none;
        d=google.com; s=arc-20160816;
        b=shcu76ewTCdEV7EhjN0UEGpk8+h5CqXG/wBqiT+WnTsdUT8aL/Ha0tshRaxV1NHNeP
         DDP4KspTj0mz6NFoCbe4c2yReMY6YK7FZbkz8kbcVqYZrft/ZK2mGr08oDQ79tDhD/NB
         +ZtWG7EGT1J1PShxn7J9BKprLfxRZsQrLc2J2AzBP97UE4lDPHlyGgwdKKu7aCv14sG5
         Ow3znrKYzJQ8Lq7rxI2m+rsaEK5Ld6zCustm3INnje4bYG2eAi+KVT/oGlCZIl5iZUX5
         IiSHX6bl6qLYr70w0re82o4TTUve2SqWtOlFEOyJvLiA6AlXPK7H/9CifS7C6tVZ5E7p
         JNJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=9uvrma150yzljMYYaGgTLVWzkYKkZURHEB81TVBTbbc=;
        b=EhqKlIUwEIZLESKz6cJPNDF/4KNDCRVzzGTpmMqIuVMcYzobPg5qnjQey7ybpOSO+f
         7HzF0USpb9C1X7uJUgZ9b6wbdq8XXagKkNmotCKdtc4lxJurMK8lhaVUp8rpVE1AqXFZ
         MijjwDGGNs5iSVBu6Ct5KmNnTNb6HwtudWGw7prLpw6ybCVnQG9RFexcOt/s65xJlh30
         lZqtPKNm4q2ZqEA+a0Cm6Vzg8nqA7gemFKsITu2pto5X5uobbymktsKufCb6ziMx3Uzd
         Zvnn0WWWRft0OBewHrsi6y+frFU9ihNvUxaRPOlwNB/yOKEAWRx9FDK7zaDBoIRupWx7
         I34A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QbIRKXxK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c23-20020a05620a0cf700b0074e32f0b37esi4793690qkj.301.2023.04.23.12.04.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 12:04:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QbIRKXxK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqexD-0000IA-P7; Sun, 23 Apr 2023 15:00:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqex5-00009p-5N
 for qemu-arm@nongnu.org; Sun, 23 Apr 2023 15:00:47 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqex3-0004Oe-Le
 for qemu-arm@nongnu.org; Sun, 23 Apr 2023 15:00:46 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2efbaad9d76so3346593f8f.0
 for <qemu-arm@nongnu.org>; Sun, 23 Apr 2023 12:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682276444; x=1684868444;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9uvrma150yzljMYYaGgTLVWzkYKkZURHEB81TVBTbbc=;
 b=QbIRKXxKh6n4KqK1sg6q3tHLA8kBcokFv8c+zqGbWmGR4CJUA7wKfZs3BTF6Zet3L3
 RVThO00j+CWGCOvKTtHcIoyAKiXWwp5X6hgzQioCpgcobMBdCt9OBIsmkOZNUwLNIkfn
 WuMfbXmpwMmDyrcUEyY2Hdy8p/41WA/66QmOOB9CpZg1E4sDeJpVqY6izugztuow/e7D
 C31OuLDRSm2JTvNv7T0YmP53iMuZjq4zhA5ZjfDtqtzTkaUmF3eKqqu0eITcCVBmY5K4
 ygiKKFHUatjSqhBdEykxR+DCrfI3wpKtgblu3+IMctn8hANkGlUAU2XPmQuYxfPUXLV9
 e14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682276444; x=1684868444;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9uvrma150yzljMYYaGgTLVWzkYKkZURHEB81TVBTbbc=;
 b=gIyDp5oWeJNZHzjjk0kgPCR02mu29zkRDimIGyLE3n4oX4C9O+AuYP7CFrnNf9uACE
 DiTrmriGOKSMshosyzHmmFpDxQOfXsan3vMptkHXfTIwBG16fHOuxgECQ25UY9cBOJw1
 HpuUO5dlqO0MjNjW/rCEJWJNu4o6uXkOVfXZOEIVdnUv0eMsz+uYz9y1X2AEpr7+hNTh
 eavzJPhzb/2v/udpLQT4xRnyjeZjUtLcZVk2zhqDypGjDuSO9yJPsd4ymEsJ7WaPuwLD
 BU7qMYT1tDDcXxqA+bl7T6ylN7IGMdctzZLvPllkLiujuIDundhieH+YW8OGYStMVVmX
 a9JQ==
X-Gm-Message-State: AAQBX9dpyZdsOp5ZP7k/BnnAy9x5yRkucw8U/m9E66DoimYvmAoIO0HM
 ptc61YXtvEwmt1fANNkN4cVs7A==
X-Received: by 2002:adf:dc89:0:b0:2c9:e585:84b0 with SMTP id
 r9-20020adfdc89000000b002c9e58584b0mr7658645wrj.1.1682276444739; 
 Sun, 23 Apr 2023 12:00:44 -0700 (PDT)
Received: from [192.168.109.175] (119.red-88-28-13.dynamicip.rima-tde.net.
 [88.28.13.119]) by smtp.gmail.com with ESMTPSA id
 k6-20020a5d5246000000b002fe87e0706bsm9144310wrc.97.2023.04.23.12.00.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 12:00:44 -0700 (PDT)
Message-ID: <6f54a97a-306d-f375-1fc2-8faaf848ecd0@linaro.org>
Date: Sun, 23 Apr 2023 20:55:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 33/54] tcg: Introduce arg_slot_stk_ofs
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-34-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-34-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: DSzP5DwlFLyz

On 11/4/23 03:04, Richard Henderson wrote:
> Unify all computation of argument stack offset in one function.
> This requires that we adjust ref_slot to be in the same units,
> by adding max_reg_slots during init_call_layout.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c | 29 +++++++++++++++++------------
>   1 file changed, 17 insertions(+), 12 deletions(-)


> +static inline int arg_slot_stk_ofs(unsigned arg_slot)
> +{
> +    unsigned max = TCG_STATIC_CALL_ARGS_SIZE / sizeof(tcg_target_long);

static const?

Regardless,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +    unsigned stk_slot = arg_slot - ARRAY_SIZE(tcg_target_call_iarg_regs);
> +
> +    tcg_debug_assert(stk_slot < max);
> +    return TCG_TARGET_CALL_STACK_OFFSET + stk_slot * sizeof(tcg_target_long);
> +}
