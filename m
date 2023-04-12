Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp264944ejc;
        Wed, 12 Apr 2023 04:53:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350ac0L5Lz5KGFI7Hw08YDrFcLgDreDpKmqLeKN62cAeQJkQYMLJBb78mcKGCgjPkEhfTjm79
X-Received: by 2002:a05:622a:490:b0:3dd:137e:e3af with SMTP id p16-20020a05622a049000b003dd137ee3afmr3036423qtx.35.1681300379907;
        Wed, 12 Apr 2023 04:52:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681300379; cv=none;
        d=google.com; s=arc-20160816;
        b=druCsDqwhI4EqveB+nY/LGaEUNWcxMt/su7H+z1SzzZpziRP0ChU7X2/RiUswkVTMI
         7Jzx3kgqkIlaLiErpi2A+xJXtWZhf20/8Cj6/063CSvqzaNelhMTS6744wzNV9xbqhu0
         fJCWtsKvJiggeBYAqX1HGMtooPBmHnOGkbtlbMx7ZgO9LYQ81unLBCm1f5pUwZALApk4
         fJu2CGydIXzunsVx1t+NE4azPFA2DGFH76Dpv5DPS1WSuotYa5P5aPVjSqdsWqX1jSb+
         atRKtGQMWcIOQ/rNtGoYZ9eEgjRFE+xgibecf6pBFMXYwcfinmK4rdOtuhzHOjXWBiR1
         6o6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=p+t5roRD0VBzwL69wpicdvZbXw5UhpMxUImy4QhiLOs=;
        b=p+gfTptNlDLka96JCubfTDAG3Xcsk0x9YOl8MF5MTJF9ijh7xbdS59LMnSVjmMjXuR
         cRYS542rh9EiDkBXsmcm7XnnsRokAtKUmlEwPSWY1xagBrNKCBnK2l3uAmvMP/U84A/H
         3MGgs9Gid8h0wYhrtpX50AiWM4xri5qaJ/jIKmqi18YvGf/dGuxgaaXA62dJAahPGUfe
         7T281owkjCu+OqbkpH/OsFcUZCsoiyqnvXTr6UymCKVBA5foOBn04L5tZNzjWGmnrYas
         8L6eFc8WXTPMAIBLY8Nno/CaUVHrIK7kdr00IltwsrErjz+zqo5bzYxwPNf3tC+MkQtL
         Sf2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ctz61KFx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k17-20020ac85fd1000000b003e389c10fd6si10568048qta.742.2023.04.12.04.52.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Apr 2023 04:52:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ctz61KFx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pmZ1q-0001UI-2Z; Wed, 12 Apr 2023 07:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmZ0u-0008Nw-3w
 for qemu-arm@nongnu.org; Wed, 12 Apr 2023 07:51:49 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmZ0k-0004Cj-N9
 for qemu-arm@nongnu.org; Wed, 12 Apr 2023 07:51:44 -0400
Received: by mail-wr1-x433.google.com with SMTP id l18so10536618wrb.9
 for <qemu-arm@nongnu.org>; Wed, 12 Apr 2023 04:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681300292; x=1683892292;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p+t5roRD0VBzwL69wpicdvZbXw5UhpMxUImy4QhiLOs=;
 b=ctz61KFxeVBZuS31M8KbhSUpbJoUbb8XkkBwhoOOFEssoZv8Z3g01W1Q36KLWBerIm
 ltII9yAhmcxBQSfedTbIkFag25vKodWAk/z8+4OO7peJg+Pz2Drhis6yG5+M3ElMFTYI
 r0oimXNWJp/C9Z6lTfrCJaQXmPokZWGFcM4MPjMtvbBodrSh+I4Oem5iXMxN+8QlfW01
 xl0vpD8/Aubi+uAPp4m4Zw8xAwRTBzw9zSpCCOvi6RJdSXEQLxVaIDPqZykW3a+AR1V5
 +TUMikZTWAZgvxtm8fE8k0nm0GoXDQkcib0vvZwAgSuAtJ0oyO9ZIU3IE+AwBnKBRdNo
 e7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681300292; x=1683892292;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p+t5roRD0VBzwL69wpicdvZbXw5UhpMxUImy4QhiLOs=;
 b=lZWIwHCejuskys/QfQkStabvaXcVgxknJPfGJRXpuBI4Fd4UWiL1EQ0BlrraCt8Fof
 MOL8nM4f3yvi9mL9vE8t7RNORiBveeEVaavzxOpBjirvaoXCHA4LVuZaXfIKXq/8Lfrx
 LAsNAD6ulCvhW601FrRkcPuKMgtABTVtz8NA4OekTj6VsUS2Jiwgj8VI+QBtX7LdQ3SK
 7f6oUZ+w19nW/AlgYH+vdfQShxwf2uLM7HHEEHj3ZSRb/K3igVn5M/0MHILV8baMgsEy
 TS2FwhbUrFRyvJcr0JKEUFg9RkyWnoLO/73liov5pAl+T8z1D1xnV8acGNirNjOLZRWR
 VNuQ==
X-Gm-Message-State: AAQBX9eTY4bSaLLhnvInz1z9X8H4BluVQcxTSCjMZU/RE+Hyp1Z7DJK1
 PldqEqPbzRqvEuF+p/SiueGKXw==
X-Received: by 2002:adf:f909:0:b0:2d2:f3e3:115d with SMTP id
 b9-20020adff909000000b002d2f3e3115dmr12415838wrr.59.1681300292155; 
 Wed, 12 Apr 2023 04:51:32 -0700 (PDT)
Received: from [10.0.2.69] (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 w11-20020a5d680b000000b002da75c5e143sm17024018wru.29.2023.04.12.04.51.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 04:51:31 -0700 (PDT)
Message-ID: <27494b72-1fe4-6fcb-3f2d-ebf94b53dc22@linaro.org>
Date: Wed, 12 Apr 2023 13:51:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 20/42] tcg/i386: Use TCGType not bool is_64 in
 tcg_out_qemu_{ld, st}
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
 <20230408024314.3357414-22-richard.henderson@linaro.org>
 <24065205-6919-378f-8e97-4754befd49f4@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <24065205-6919-378f-8e97-4754befd49f4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.083,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: 54t7D0LtwyGj

On 4/11/23 14:12, Philippe Mathieu-Daudé wrote:
> On 8/4/23 04:42, Richard Henderson wrote:
>> There are several places where we already convert back from
>> bool to type.  Clean things up by using type throughout.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/i386/tcg-target.c.inc | 35 +++++++++++++++++------------------
>>   1 file changed, 17 insertions(+), 18 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 

Thanks, though there is now a v2 patch set which does not contain this patch, or some 
others you have reviewed in the last days.


r~
