Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8202668ejb;
        Wed, 4 Jan 2023 10:36:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtStTW+q6b3EzOW6TS0T/koH8l7bnGOzbvsYvdH6tJ3gA2m/B/vi3bxitDTeSF9Wz+AOnml
X-Received: by 2002:a05:6102:3ca5:b0:3b3:57dc:9cb1 with SMTP id c37-20020a0561023ca500b003b357dc9cb1mr23795934vsv.4.1672857374776;
        Wed, 04 Jan 2023 10:36:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672857374; cv=none;
        d=google.com; s=arc-20160816;
        b=Elb+et98dvz6MUfVXBT2q/LbiU79YO/5Hh8bTuEVCmNOJ390vZmlAfWGCeDXifnKSz
         OEn1FCmj0/l1QCdLJQnA2nAgdw2LgFO5GxqVv+xAwgVf6lQrSjghq+gNUFP5lPBnK9jA
         fveV0ZPiDMxR6vIUsMxOtXMg3DIsVQ3oJYUQDNAwneoL7ZdmbuALnuVVtPQ9mjDzBfAa
         oWaN+dDFG/7D4jpaJg3Rxhl8dx0J870p87gUjbajTxmgpkOlEV1qfw78SaWG3hb2tr+B
         VA6Bh34Tw2+/QZYrzNGbW/IbZ30mpWtrBilLpMtPz/CfGXk5g1tHn1vVKzhH4AurMmVS
         GtPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/F0QL/NslfGs2iRFvF0ppWsEHa2erkG5cwyYY1DWahQ=;
        b=ytwNYxGzFcERR9JeH6PmLCqkdKIXZ0db896u8J2dVYxPtzBMOmGzDs90AcuFLs5LN+
         7A48XlomuWvWqL6AfzJCuh+20svqeT0yMZzeFpWN3gWIFJkrHwX63VYTI+sYhiu1LEQW
         UzuPfiDU4L52KUi7hDZIzq/e91ja7hUlbeV03PNgiuntBaM6rnkKXFpDwRgbTRpG4jQ0
         wWMGuWng8aP8dN0wPnSNnXUMuhPVtl1e7LmLH9H4aeKBwb94JynKoTz5SF7AS4sGE+Xj
         3V8a7fbczRCzsdoqzHjQOMNAUJccv5Q+AuTlwYSukxWpITZP18AxMcZqSuVcELaLR3CX
         pBhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fwv8Rtu7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o9-20020a05620a110900b006ff1c35c093si17068097qkk.302.2023.01.04.10.36.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Jan 2023 10:36:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fwv8Rtu7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pD8c7-0007ZS-Lz; Wed, 04 Jan 2023 13:35:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD8c5-0007Yt-Ro
 for qemu-arm@nongnu.org; Wed, 04 Jan 2023 13:35:45 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD8c4-0002M7-5c
 for qemu-arm@nongnu.org; Wed, 04 Jan 2023 13:35:45 -0500
Received: by mail-ej1-x634.google.com with SMTP id qk9so84556980ejc.3
 for <qemu-arm@nongnu.org>; Wed, 04 Jan 2023 10:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/F0QL/NslfGs2iRFvF0ppWsEHa2erkG5cwyYY1DWahQ=;
 b=Fwv8Rtu7L1/Hor0EZx9xDaL5Nl+YlGVbiVfyKk8FJLyYSH5J4k2IbzA5DkH23amnP8
 wgshlJ0FLrewZybSGESv2amisgY+a/Owq0THemJafqx5wVYEMnv8EoWlrSJWiHA2xWqC
 eLlFZ9GLFyvRTHYbtmg7s29nNOJNpXcXa242fKu+v4+2cK0+t7NPOXMUZufDybOx//5W
 hQlvhBDglAoGlAbbuCpM40rdObdtca8Keb44/QzV99EzdNrInRGFkfZmwW27WYZHlIR2
 KvjmA7S2qCwEWu8sZMAUdJmmE2R/jthAl8jNdVSS4An+IZs9A30f/GOLZ54OK6C/tbFm
 6OiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/F0QL/NslfGs2iRFvF0ppWsEHa2erkG5cwyYY1DWahQ=;
 b=Ed3+7t4fBmsyTYgiIPbDvU6oeLuXQg99u71GK4cIsIM2neg4Dj6Ql8Ps4ycQNLB6Yb
 dG2lEnFoF+l9ewM8OrdZgBXEEEkIYvv5+GQ/fNvLuvVnoBxX+f1gpp5BCzepZK6XP3E4
 Ho1jPvRu8FqMcmt2bBMZbxK7jXTdM2r7t4vjiADuqFQBTAqeOwazYM8FkzA/y2SL3QfS
 9Kd8hiYcUkZSUipvQUMX1ftaCXy4yRUTMeX/U8R/tFhEKDOhYOZGvuRnZrs30tXltkZn
 BsKygtQ6fw+wa87zgfUbkCUcMe83dk3XxGZcraxOKYB2iSxp0O8U/KlDzxMsTFi0dUf1
 tKLw==
X-Gm-Message-State: AFqh2kpCv2tl9iqfKTSCd4mNavvlOTyO0n3IRePQY9dSi3S0OkMhb/uP
 t8e47A8N1NdMErs6+0IK19W+JQ==
X-Received: by 2002:a17:906:279a:b0:7c1:10b4:4742 with SMTP id
 j26-20020a170906279a00b007c110b44742mr40436848ejc.55.1672857342523; 
 Wed, 04 Jan 2023 10:35:42 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 la26-20020a170907781a00b0084767d40f0dsm15300242ejc.115.2023.01.04.10.35.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 10:35:42 -0800 (PST)
Message-ID: <77888431-5d4c-d65a-8835-a19a833a243d@linaro.org>
Date: Wed, 4 Jan 2023 19:35:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: ARM: ptw.c:S1_ptw_translate
Content-Language: en-US
To: Sid Manning <sidneym@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Mark Burton <mburton@qti.qualcomm.com>, qemu-arm <qemu-arm@nongnu.org>
References: <BYAPR02MB550905E891B95879D05846B9BEF59@BYAPR02MB5509.namprd02.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <BYAPR02MB550905E891B95879D05846B9BEF59@BYAPR02MB5509.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: IQuPO0DkJiaJ

Cc'ing Richard & qemu-arm list.

On 4/1/23 17:55, Sid Manning wrote:
> ptw.c:S1_ptw_translate
> 
> After migrating to v7.2.0, an issue was found where we were not getting 
> the correct virtual address from a load insn.  Reading the address used 
> in the load insn from the debugger resulted in the execution of the insn 
> getting the correct value but simply stepping over the insn did not.
> 
> This is the instruction:
> 
> ldr           x0, [x1, #24]
> 
> The debug path varies based on the regime and if regime is NOT stage two 
> out_phys is set to addr if the regime is stage 2 then out_phys is set to 
> s2.f.phys_addr.  In the non-debug path out_phys is always set to 
> full->phys_addr.
> 
> I got around this by only using full->phys_addr if regime_is_stage2 was 
> true:
> 
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> 
> index 3745ac9723..87bc6754a6 100644
> 
> --- a/target/arm/ptw.c
> 
> +++ b/target/arm/ptw.c
> 
> @@ -266,7 +266,12 @@ static bool S1_ptw_translate(CPUARMState *env, 
> S1Translate *ptw,
> 
>           if (unlikely(flags & TLB_INVALID_MASK)) {
> 
>               goto fail;
> 
>           }
> 
> -        ptw->out_phys = full->phys_addr;
> 
> +
> 
> +        if (regime_is_stage2(s2_mmu_idx)) {
> 
> +            ptw->out_phys = full->phys_addr;
> 
> +        } else {
> 
> +            ptw->out_phys = addr;
> 
> +        }
> 
>           ptw->out_rw = full->prot & PAGE_WRITE;
> 
>           pte_attrs = full->pte_attrs;
> 
>           pte_secure = full->attrs.secure;
> 
> This change got me the answer I wanted but I’m not familiar enough with 
> the code to know if this is correct or not.
> 

