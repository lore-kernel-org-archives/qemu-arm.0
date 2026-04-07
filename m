Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (unknown [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909BE10F996B
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 18:37:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAXl5-0000C1-Eo; Wed, 08 Apr 2026 14:36:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAXl3-00009Q-90
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 14:36:09 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAEfs-0007l1-Pn
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 18:13:34 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2aaf43014d0so38797235ad.2
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 15:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775600010; x=1776204810; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UkGDpAXW4vSXzOoeCzuTUfHGOUGVWbJ5vqIqEfnG8HE=;
 b=rOIPaHy4p9VyNETrVyLyE3+ww2saIGjWiGs4FLsJSp3exmPuTWk69C0rJkbBMQx/wG
 vh5nzvnqm/WLHEVTT7z0+/pXI5jltgt5Ppo65p4frxM7bccIgF8zXCwHSML4EN4WdKEM
 wfTzMjNEiY5X1DbuiBnpb2piWAUZpTmrpRPvfHHRizQXEI/gL5S6T8x17gn0VbqUfEe+
 NetJmGOnIunvasAHtJiMYRCTs39Y3EFZhVvJr8yIW4KYQmpXx5SKCqp9ucRcyFM9rLjQ
 pg4gGZqKe/Y4ZwuK3xfCuuXEv1PnrVrRLztNbYL/r9GWwuQhlPQEOUJ7ryJELfYF2ziq
 qycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775600010; x=1776204810;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UkGDpAXW4vSXzOoeCzuTUfHGOUGVWbJ5vqIqEfnG8HE=;
 b=Orp/Awsjf5aL01EUZOZWBFgWzE2EiLPsz6O3MU/zIq+IRv6kxSIWoCdQq00aCqkjq3
 nRhe+SemDF+FVSH9rdTFlD0jBjfHExYVUDxBuAUq9MTwXfc9qzt+3Tu9WTOkP+tDRumN
 EB+PxrpVfKO1kcIv9NgjnC5fIFSqYZNjw69akyfG9MgrwaORIs2G4Au09Ihe1uAxgTMt
 XUQqsJTEcXTRkxkVmsEzdTQCWUF+eJQ0v02BvsIeoAdfH7c12tm0aSgp3HgsMz5Zf942
 RrFGK3Km0h09KeZhx5iZa7/jmLy9gYMEmnu5H63KQQSzAqCAbUSNj85L9+HLYpq3x6DZ
 885w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlhLJRlNywbiTiCDjWd1r2SaV6tpZip57WGCtJ+YIZp4eGXGnMdNZKLCykvkivV4LTo2Nbdrtt8Q==@nongnu.org
X-Gm-Message-State: AOJu0YxJCbF4ppl+ANvuGXyNsv6SHQj88cESA6yIV3VRxglHoCP0x3nC
 Gq2BPLvPOtplg+3Zk0WFkyrPIo2dK1Yuw8kF+LJOXAtWVBkXrC+0EPU/n1Ekgq2tO+Y=
X-Gm-Gg: AeBDietcSFVewNT1gxtNF89olaCAwjFJQtWFh75U6uy+ojx1VJCqxHi52fwWjCEcK/k
 JMkM77QMlP9YXjvfpyzjKoVnA+yJfuqMBQxaaSYMadhz/C8OLRMqGLPgPp+tfbfYIXSvCMEoOX1
 /y/NEMr+LGKEhAKlSvIzHPFO+ozZAguqxyOaSlYXuut8hQ7tMzvmk0FNTX8HEVgpoTQo/fFAP5v
 dhEoJtu/1sisVg2aSpESHirm0fQKi03MlU0NNnSlqRTT09/TgdcmhUF9/Mjne4zIxahE0pVIa0K
 dW3tNrj4LTFiiHw3cCLbRqyq1nENRA5MWBjy/1E5BviVqpS+MpjRP8NPmW9pt7OpfpI5pM5uqWZ
 CHtw5zJeBVb6PPqEpI17UnTcTg1d1MbnQfkHvoAHVF0q8TFxG9RONVqR1/vPLXCaEoSfLFigQLa
 7jslZXBInc4dXQsaNBBf1OrYiEG7W1Ld7qmSmt+NafpYECp2fZ/UJ3AzLBHqEonIvihYe3cZlql
 NqLPTrX
X-Received: by 2002:a17:902:c942:b0:2b2:4e5a:9471 with SMTP id
 d9443c01a7336-2b281896db4mr213341225ad.22.1775600010353; 
 Tue, 07 Apr 2026 15:13:30 -0700 (PDT)
Received: from [192.168.1.169] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b274979d72sm175414305ad.51.2026.04.07.15.13.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 15:13:29 -0700 (PDT)
Message-ID: <a1d61d0c-3434-4f09-98ca-cb95e780b172@linaro.org>
Date: Tue, 7 Apr 2026 15:13:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 11/21] target/arm/tcg/translate.c: remove MO_TE usage
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-stable@nongnu.org
References: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
 <20260407195922.196410-12-pierrick.bouvier@linaro.org>
 <75339585-19b3-4047-a186-06d21d05bf7b@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 xsDNBGK9dgwBDACYuRpR31LD+BnJ0M4b5YnPZKbj+gyu82IDN0MeMf2PGf1sux+1O2ryzmnA
 eOiRCUY9l7IbtPYPHN5YVx+7W3vo6v89I7mL940oYAW8loPZRSMbyCiUeSoiN4gWPXetoNBg
 CJmXbVYQgL5e6rsXoMlwFWuGrBY3Ig8YhEqpuYDkRXj2idO11CiDBT/b8A2aGixnpWV/s+AD
 gUyEVjHU6Z8UervvuNKlRUNE0rUfc502Sa8Azdyda8a7MAyrbA/OI0UnSL1m+pXXCxOxCvtU
 qOlipoCOycBjpLlzjj1xxRci+ssiZeOhxdejILf5LO1gXf6pP+ROdW4ySp9L3dAWnNDcnj6U
 2voYk7/RpRUTpecvkxnwiOoiIQ7BatjkssFy+0sZOYNbOmoqU/Gq+LeFqFYKDV8gNmAoxBvk
 L6EtXUNfTBjiMHyjA/HMMq27Ja3/Y73xlFpTVp7byQoTwF4p1uZOOXjFzqIyW25GvEekDRF8
 IpYd6/BomxHzvMZ2sQ/VXaMAEQEAAc0uUGllcnJpY2sgQm91dmllciA8cGllcnJpY2suYm91
 dmllckBsaW5hcm8ub3JnPsLBDgQTAQoAOBYhBGa5lOyhT38uWroIH3+QVA0KHNAPBQJivXYM
 AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEH+QVA0KHNAPX58L/1DYzrEO4TU9ZhJE
 tKcw/+mCZrzHxPNlQtENJ5NULAJWVaJ/8kRQ3Et5hQYhYDKK+3I+0Tl/tYuUeKNV74dFE7mv
 PmikCXBGN5hv5povhinZ9T14S2xkMgym2T3DbkeaYFSmu8Z89jm/AQVt3ZDRjV6vrVfvVW0L
 F6wPJSOLIvKjOc8/+NXrKLrV/YTEi2R1ovIPXcK7NP6tvzAEgh76kW34AHtroC7GFQKu/aAn
 HnL7XrvNvByjpa636jIM9ij43LpLXjIQk3bwHeoHebkmgzFef+lZafzD+oSNNLoYkuWfoL2l
 CR1mifjh7eybmVx7hfhj3GCmRu9o1x59nct06E3ri8/eY52l/XaWGGuKz1bbCd3xa6NxuzDM
 UZU+b0PxHyg9tvASaVWKZ5SsQ5Lf9Gw6WKEhnyTR8Msnh8kMkE7+QWNDmjr0xqB+k/xMlVLE
 uI9Pmq/RApQkW0Q96lTa1Z/UKPm69BMVnUvHv6u3n0tRCDOHTUKHXp/9h5CH3xawms7AzQRi
 vXYMAQwAwXUyTS/Vgq3M9F+9r6XGwbak6D7sJB3ZSG/ZQe5ByCnH9ZSIFqjMnxr4GZUzgBAj
 FWMSVlseSninYe7MoH15T4QXi0gMmKsU40ckXLG/EW/mXRlLd8NOTZj8lULPwg/lQNAnc7GN
 I4uZoaXmYSc4eI7+gUWTqAHmESHYFjilweyuxcvXhIKez7EXnwaakHMAOzNHIdcGGs8NFh44
 oPh93uIr65EUDNxf0fDjnvu92ujf0rUKGxXJx9BrcYJzr7FliQvprlHaRKjahuwLYfZK6Ma6
 TCU40GsDxbGjR5w/UeOgjpb4SVU99Nol/W9C2aZ7e//2f9APVuzY8USAGWnu3eBJcJB+o9ck
 y2bSJ5gmGT96r88RtH/E1460QxF0GGWZcDzZ6SEKkvGSCYueUMzAAqJz9JSirc76E/JoHXYI
 /FWKgFcC4HRQpZ5ThvyAoj9nTIPI4DwqoaFOdulyYAxcbNmcGAFAsl0jJYJ5Mcm2qfQwNiiW
 YnqdwQzVfhwaAcPVABEBAAHCwPYEGAEKACAWIQRmuZTsoU9/Llq6CB9/kFQNChzQDwUCYr12
 DAIbDAAKCRB/kFQNChzQD/XaC/9MnvmPi8keFJggOg28v+r42P7UQtQ9D3LJMgj3OTzBN2as
 v20Ju09/rj+gx3u7XofHBUj6BsOLVCWjIX52hcEEg+Bzo3uPZ3apYtIgqfjrn/fPB0bCVIbi
 0hAw6W7Ygt+T1Wuak/EV0KS/If309W4b/DiI+fkQpZhCiLUK7DrA97xA1OT1bJJYkC3y4seo
 0VHOnZTpnOyZ+8Ejs6gcMiEboFHEEt9P+3mrlVJL/cHpGRtg0ZKJ4QC8UmCE3arzv7KCAc+2
 dRDWiCoRovqXGE2PdAW8788qH5DEXnwfzDhnCQ9Eot0Eyi41d4PWI8TWZFi9KzGXJO82O9gW
 5SYuJaKzCAgNeAy3gUVUUPrUsul1oe2PeWMFUhWKrqko0/Qo4HkwTZY6S16drTMncoUahSAl
 X4Z3BbSPXPq0v1JJBYNBL9qmjULEX+NbtRd3v0OfB5L49sSAC2zIO8S9Cufiibqx3mxZTaJ1
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <75339585-19b3-4047-a186-06d21d05bf7b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 4/7/26 2:55 PM, Philippe Mathieu-Daudé wrote:
> On 7/4/26 21:59, Pierrick Bouvier wrote:
>> dc->be_data is already set just above in the same function:
>> ```
>>       dc->be_data = EX_TBFLAG_ANY(tb_flags, BE_DATA) ? MO_BE : MO_LE;
>> ```
>>
>> Cc: qemu-stable@nongnu.org
> 
> Why Cc stable? This is just removing pointless code, right?
> 
>> Fixes: a729a46b05a ("target/arm: Add wrapper macros for accessing tbflags")
> 
> This commit doesn't seem to be related.
> 
> Do you mean commit 79cabf1f473 ("target/arm: Recover 4 bits from
> TBFLAGs")?
> 
>       We had completely run out of TBFLAG bits.
>       Split A- and M-profile bits into two overlapping buckets.
>       This results in 4 free bits.
> 
>       We used to initialize all of the a32 and m32 fields in DisasContext
>       by assignment, in arm_tr_init_disas_context.  Now we only initialize
>       either the a32 or m32 by assignment, because the bits overlap in
>       tbflags.  So zero the entire structure in gen_intermediate_code.
> 
> Since BE_DATA is in the TBFLAG_ANY set, I don't get why it
> is set to MO_TE for M-profile.
> 
> At any rate this patch description deserves a better explanation IMHO.
> 
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    target/arm/tcg/translate.c | 1 -
>>    1 file changed, 1 deletion(-)
>>
>> diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
>> index 56ef1e0eb59..4546bbeeeff 100644
>> --- a/target/arm/tcg/translate.c
>> +++ b/target/arm/tcg/translate.c
>> @@ -6344,7 +6344,6 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>>    
>>        if (arm_feature(env, ARM_FEATURE_M)) {
>>            dc->vfp_enabled = 1;
>> -        dc->be_data = MO_TE;
>>            dc->v7m_handler_mode = EX_TBFLAG_M32(tb_flags, HANDLER);
>>            dc->v8m_secure = EX_TBFLAG_M32(tb_flags, SECURE);
>>            dc->v8m_stackcheck = EX_TBFLAG_M32(tb_flags, STACKCHECK);
> 

See:
https://lore.kernel.org/qemu-devel/5fc9d07c-cd22-45c0-bb5e-8bf93d20f112@linaro.org/

