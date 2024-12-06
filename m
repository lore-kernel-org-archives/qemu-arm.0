Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1046412njb;
        Fri, 6 Dec 2024 10:12:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVwEKcIvwoy6wPS5cN835EARsiwDhpJWhxmczQdbfODPTw8ymeyjKMAfmXtchqAJctn3LZvVkd4b9i7mQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGF6sai+f8grkXhtrtCHT9cYjAZ+lqgfEML8WJ4IcKp7l/nRr+EIcp3CTm5ohMqglsrrVB/
X-Received: by 2002:a05:620a:28c6:b0:7b1:49f7:90ba with SMTP id af79cd13be357-7b6bcac6062mr663533785a.8.1733508773270;
        Fri, 06 Dec 2024 10:12:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733508773; cv=none;
        d=google.com; s=arc-20240605;
        b=YGZL8dPYi/5pOnYryrPwu7duQi/3tmbjIqgTsCP4DQDYp8XapImgRjgGddfYJBbC2g
         ePArryvz5Ao+RaVo4hXjxDDtGYauFQP/edWdY+6i3LtwKOoeEqbrYVs9AGCPzky2l6ge
         vIRoMX5AZCSRyaHvQ2WHzCHtsSCkPMCeu0fjWsO4t4Ko3dRYyrZwY4pdhXBH31jcjCkD
         k6fSKvkXkA0uXh/3E+ropKEs1iTB+G242TGmCecRkb6XWVeIvUivoVjGS6jEaPwa38LE
         whmNWkKxCee3qVSi6T/F8e765Y6LCvRKXmylnlknwxoHhz2D9HxrFo+pKAyo965eAy11
         uTrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=k6E3qAVznoEijWOtVEbkazIWLn1pMfIIPzCq5oKqgnE=;
        fh=fDx56RpbcRhxw99v/mctPrlTWMLkN8BzashsB1yApaQ=;
        b=QOoamg+LFCk0Xhhqt+sFiMXWmSlvH1NswKW3+UVaT2zJkRbGIuvCV5lCeym+YiUhTP
         AQRBbupzB7bEGVfFSkjCpbvkpANQCBF2nGOfG1jiow8rn0k/Nk4yWrR/Zied380rTzca
         lNvKmnRoQ+3Rsdmsc6874HWZVRPx5Pse5wVJDhrwIXR2lrdMB6QMnYmsZB5g8Zx6toqx
         pfirPxTTOhV9c9tMXVVYno6wCuoOegjXdokTkLaqJJqGI68+o8vIhXEZziRSlyZCNISp
         XH8mofMf7vRkU8NtC6LYAXLT8qdLxBqvJ2VCJoUuHMd9PGlKJQ4OMOoVmow/yEFnWBg5
         0mRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LDn2SldM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5a5164esi474215085a.73.2024.12.06.10.12.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 10:12:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LDn2SldM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJcob-0000br-BU; Fri, 06 Dec 2024 13:12:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJcoW-0000ad-4R
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 13:12:28 -0500
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJcoT-0005HO-S9
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 13:12:27 -0500
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-29e5bf419ebso804015fac.1
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 10:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733508744; x=1734113544; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k6E3qAVznoEijWOtVEbkazIWLn1pMfIIPzCq5oKqgnE=;
 b=LDn2SldMQZ7VAle14DHmNymceOipgUaq1xrk0AWP2RNMz1bFekEo9854476DUfMJIa
 v2jhGF+6cbP3NUMI5TvozbcVQH/AkNGd3c8UPeCXLbMZ+lMznva7Ryy+v+68yix9udy6
 dm5Z6VzDZClSpcQ3XHeQI+BOHT8O0sWJzZ3uWwKDaWYCDB0GeBFailASr6dJAJVtKAoR
 oIvDxNIdJ4Xy3vsQRnKrUQbp7h15KlUbVXLL63ixbl8+SGiIRvlOdlLOFLBf0wYWfQU7
 w86RuTePRxUOFrw35+adHv39VYbdURroCFDVdderUIvP9x2cwTk7eaUADZECaslP+uPR
 lBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733508744; x=1734113544;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k6E3qAVznoEijWOtVEbkazIWLn1pMfIIPzCq5oKqgnE=;
 b=ThqCKjAeJMTADKRTcXbHM0nQIdsU8Gze8yw0jLgxkidtdhpROvEe6yw4sfmkqL7ctr
 B90rO3SBhUWUR3LGzMGvbCXnDATc8x1+Lj6StJGDvfyQpWwSvFHZCTBRbsMFtcS9eWq5
 Bd57v4d655rHAwhj6d9mCrUNuc5g6wZpjOt1mvYCm7L48Bj6wWA3WS35Lx8UMKi9IwJk
 U1oeEuNVU7fTNpbFkxJxw/lGdolySmnwF61Lr8XS/j1vli0BhT2AnVa1d2YGvw/CIZuf
 PM8Z5GnXSjKOE9Eh4x9EjtYn1l3dX/sSEVdpQMbE25gLEqVFK2gMt0y0KVpSVbGydg2B
 Pjvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA3IGB484gBGkBwzwPM/qV+YHauLQJRj0MMD74U7VC47xKnq1xs3cychJYrmjoqXodmHPVrfDCig==@nongnu.org
X-Gm-Message-State: AOJu0Yw3ufbnJ8+Ca9JpbiONQ7bGwJM+5VwW+8bLlVbKAJjPOVfEPH7/
 9cUGihFkXV8VxWROEvpD88jq/SFOmKfGMbaNTHi9915CI0OvWf0nHrZUc5kSOgE=
X-Gm-Gg: ASbGncsY1D0GmqbA6dyABlN8ylsxA0aZ7cY0y/TKgataidcCxjs1HFyG6PVqx1LAaDY
 e5beSPvBYLn70DsByKYJIsQyuGW4C9xcMcWbMXPFtbBeVxlWE6tMEXAjDqObRgqQMWTOie2b6/h
 /fWSY8Rs9+tG7IF1o63JnaMQ65z3ARjWYRcGpjXZAx6BvX9z311lCMz7TGSlypxcjrl2jkRQh1J
 00GWhoZqvP4DB9kWUm8uBtrlgXEePw2BV3rjmlFGx+qPlWkc7jkB+yV5Qi7urnGwCWqCEQO1rql
 xqDSmn/F8MYrofwqV7kpV/M0bF53
X-Received: by 2002:a05:6870:7e16:b0:29e:76d1:db3b with SMTP id
 586e51a60fabf-29f731b3772mr2283492fac.5.1733508742792; 
 Fri, 06 Dec 2024 10:12:22 -0800 (PST)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-29f787f90d7sm452912fac.31.2024.12.06.10.12.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2024 10:12:22 -0800 (PST)
Message-ID: <9afbb53a-ab5a-44c4-b486-b947b7c3429e@linaro.org>
Date: Fri, 6 Dec 2024 12:12:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 55/67] target/arm: Convert FCVT* (vector, integer) scalar
 to decodetree
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-56-richard.henderson@linaro.org>
 <CAFEAcA8GO=NjWpoOM7mG5j-+4JXfx5qEK1_YwQHNmuFt3yH=Ag@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8GO=NjWpoOM7mG5j-+4JXfx5qEK1_YwQHNmuFt3yH=Ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: 2vTZ3EyqkdG/

On 12/6/24 10:23, Peter Maydell wrote:
> On Sun, 1 Dec 2024 at 15:21, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Arm silliness with naming, the scalar insns described
>> as part of the vector instructions, as separate from
>> the "regular" scalar insns which output to general registers.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/tcg/translate-a64.c | 135 ++++++++++++++-------------------
>>   target/arm/tcg/a64.decode      |  30 ++++++++
>>   2 files changed, 87 insertions(+), 78 deletions(-)
>>
>> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
>> index 98a42feb7d..ad245f2c26 100644
>> --- a/target/arm/tcg/translate-a64.c
>> +++ b/target/arm/tcg/translate-a64.c
>> @@ -8678,6 +8678,16 @@ static void do_fcvt_scalar(DisasContext *s, MemOp out, MemOp esz,
>>                                    tcg_shift, tcg_fpstatus);
>>               tcg_gen_extu_i32_i64(tcg_out, tcg_single);
>>               break;
>> +        case MO_16 | MO_SIGN:
>> +            gen_helper_vfp_toshh(tcg_single, tcg_single,
>> +                                 tcg_shift, tcg_fpstatus);
>> +            tcg_gen_extu_i32_i64(tcg_out, tcg_single);
>> +            break;
>> +        case MO_16:
>> +            gen_helper_vfp_touhh(tcg_single, tcg_single,
>> +                                 tcg_shift, tcg_fpstatus);
>> +            tcg_gen_extu_i32_i64(tcg_out, tcg_single);
>> +            break;
> 
> This hunk adds calls to the toshh and touhh helpers,
> but as far as I can see it doesn't remove any calls to
> those helpers that were in the old decode functions or
> any calls to the handle_simd_shift_fpint_conv() function
> which was the only one that did call them. Should this
> be in a different patch?

Removing those happens in patch 61, with FCVTZ* (vector, fixed-point).
Here we're only converting the scalar path.

> (Conversely, we remove calls to gen_helper_advsimd_f16tosinth
> and gen_helper_advsimd_f16touinth but don't have those here.)

With the conversion I'm sharing more code.  So we (eventially) remove advsimd_f16to*inth 
entirely and use only vfp_to*hh.  They both call the same float16_to_*int16_scalbn 
function in the end.


r~
