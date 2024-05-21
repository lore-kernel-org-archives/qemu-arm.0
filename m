Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp114169ejb;
        Tue, 21 May 2024 12:58:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXZXA+yz4t8HHte4tm4wSIRUqe2D0VIN2RTv5XN25sBOlGZXz2wSkPatMaa/zAz0dp56m0X3BSudYsC6u6AJr16sIkN1B2c
X-Google-Smtp-Source: AGHT+IGLkcybRTw+x3PDXNlf7omdImdE616++ZHhOm5yAVADj4SZ7xb92hkT9rtdTDKstOUhRR6U
X-Received: by 2002:a05:6830:1047:b0:6f0:4201:9738 with SMTP id 46e09a7af769-6f667260536mr56104a34.15.1716321483006;
        Tue, 21 May 2024 12:58:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716321482; cv=none;
        d=google.com; s=arc-20160816;
        b=vmaxWlj5WadR8dZDIVjIAm/+sziQMZDsSPGR+d+RU4sY868nSJ12uqWBh9xELFkwd8
         k2fuJs7gsbABBtAAHUfm0PBeB+PI3HVPAq4R2PvQXzEiuJLwqijdE6nYkLJLb0KlSWkw
         qZ8cUH61mYDMv4h2AdJoO0m1e0Ulmf9zHaljxjbnJ0U+9+7x3AmLoG0pYLuOQ9NR1vYw
         B02xt9VTE5ycqfhyc1QLF9yM6cnAAEzBm1O02nwM/sxQ02SVkr2ZcNKFRT9Eq1NadoNi
         odkZim0te0vQz+PoqbIq2c0qTi8W+yuOlfY+fjqzYf8drY4aKLuIKMToSwdZ22pCc23l
         atiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=kmBC9KKSA3tmvbAayk6U7TdpZdm89WhLH4BbGjvFBCc=;
        fh=fDS1GfTZhJebN7oEANbrrem8V0Oxh5bJZwMwvu3FDRA=;
        b=uLETgB87t+HUTRN1goeoX8pb6e2wDUeb+ACxnPACf0P/jZajVRpRohDmpaoVun0o72
         AjZiBqmkgs0p6I0uMRsk4cAhbyS4lSqg57YME8tpedE/AtbGExQi/vZYHdyREayIrfRy
         7vs3SfM36QVOQ+pom8Vdf28D29T+TnAjdPc0KuAYcxFExQP6di5VA7zY0qKOYGXrhZqT
         o+aaJZsBwdCJf0DUITUnb94RfSzX2Ys2kuQ7Anf4jSDtpxDhkwKCqeizStJ3Yg+7E7bV
         NI5GvUrMSSRHxR1gPY1FLygTHOtuKUO/DwJC86joYDY8GGMchPLgAwT7suQ5qNZhHDKY
         EYPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vd7TBTFD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794717c5862si875876385a.693.2024.05.21.12.58.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 May 2024 12:58:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vd7TBTFD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s9VcL-0001vu-HS; Tue, 21 May 2024 15:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s9VcK-0001vO-2t
 for qemu-arm@nongnu.org; Tue, 21 May 2024 15:57:48 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s9Vc7-0003Rt-I6
 for qemu-arm@nongnu.org; Tue, 21 May 2024 15:57:47 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1ec69e3dbcfso4510245ad.0
 for <qemu-arm@nongnu.org>; Tue, 21 May 2024 12:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716321450; x=1716926250; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kmBC9KKSA3tmvbAayk6U7TdpZdm89WhLH4BbGjvFBCc=;
 b=Vd7TBTFDJCcc7R7PCw8tYnXyma6p4S76kDDKl4ey8/BcGuk0juBL3m+b05VkbqgCrQ
 zl2UFPdujxps2CS8Q4W9IbyHpQH15lD1AZIkClWeHZ2+1CFqGZmJrJU3EdEirjuYJWgU
 cfERZyuuQ7vLe1+O7RqDGvZmGsilO1xI+4TFeAx7/vttjqR1xV7kiOsP8LFmjn+fj0qu
 yZS6sYfw6FnFLgsYkEXshUBiZ66AwS/EWDhGHk2SB3mVIOLQ4mH0CS7xRPZ2j5RE8ZYv
 LDeTOsQgKLfmm7rwPuKHflbpaDCkMnJUJnyfGbYECJMyzJjtN/zjPgGS+oqam3/EbHSd
 SzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716321450; x=1716926250;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kmBC9KKSA3tmvbAayk6U7TdpZdm89WhLH4BbGjvFBCc=;
 b=Kdlh+2UGccGUljIpnyc1yY5wQSt8tBe9evfAP9xFB9aZB9kfK4qfZKtmDV89+zBQSF
 X17v1N81nV9EB2sah9QBBt2qjanLSE99SSTdCtHJw5AdHJcfAIKDIwo5HvtKP/vwQSHc
 OGtO2xUo6YtGTgweU7JhkDk+FwkbTbtfDV6FmtaVq2aG4UXHiCaG0JFBjZZjLKfyfQF1
 I7K8V9rcOUjUlpeEIUMawkuGRjLXu4jowuKPCDpqbOvBgc2HH14SQFPc7XI9rX+o2ivV
 /keUMTyhZTV3Hr7YvEJ6QJ4AoZg+XzP5me0D4Nb0EYYZE7tcM1+gije8S293HoMtKM/4
 g/ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqhxO3WgvrlsU98MNpaetT6HiTf0RIcWfLoFeroJ77C2MJJ6r3pTLHsLOPrDx7/tpMB6IDiYWZsHufiWNo8tLk/mPG
X-Gm-Message-State: AOJu0YzGE+SZCvyQp8tA929g+cC/gmuSq1VjWL3+71VqKBJMvoaXD56k
 9ztRyladUA1/TJiSqv52FRcUazzdDZFwSBCOtuEt28bUGTRCsQcDfmZ35L0afj4=
X-Received: by 2002:a17:902:ec8e:b0:1f3:1241:d4d2 with SMTP id
 d9443c01a7336-1f31241d7f2mr22981405ad.61.1716321449717; 
 Tue, 21 May 2024 12:57:29 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0bad5f30sm225744585ad.64.2024.05.21.12.57.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 May 2024 12:57:29 -0700 (PDT)
Message-ID: <9fd510eb-979d-4497-9de8-181263c4fe75@linaro.org>
Date: Tue, 21 May 2024 12:57:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 32/57] target/arm: Inline scalar SUQADD and USQADD
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-33-richard.henderson@linaro.org>
 <CAFEAcA-e6+z+07SvdqSf2AqPG=JvH4Zk2Fx_=zTtRZaFDOT-zg@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-e6+z+07SvdqSf2AqPG=JvH4Zk2Fx_=zTtRZaFDOT-zg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: 9k+5iZc+qXlh

On 5/21/24 09:46, Peter Maydell wrote:
> On Mon, 6 May 2024 at 02:08, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This eliminates the last uses of these neon helpers.
>> Incorporate the MO_64 expanders as an option to the vector expander.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
>> +/*
>> + * Set @res to the correctly saturated result.
>> + * Set @qc non-zero if saturation occured.
>> + */
>> +void gen_suqadd_bhs(TCGv_i64 res, TCGv_i64 qc,
>> +                    TCGv_i64 a, TCGv_i64 b, MemOp esz)
>> +{
>> +    TCGv_i64 max = tcg_constant_i64((1ull << ((8 << esz) - 1)) - 1);
>> +    TCGv_i64 t = tcg_temp_new_i64();
>> +
>> +    tcg_gen_add_i64(t, a, b);
>> +    tcg_gen_smin_i64(res, t, max);
>> +    tcg_gen_xor_i64(t, t, res);
>> +    tcg_gen_or_i64(qc, qc, t);
>> +}
> 
> Can you explain how this one should work? SUQADD is
> "a is an signed value, b is an unsigned value, add them and
> do a signed saturation of the result". If we take, say,
> 16 bit elements a = 0xc000 and b = 0x5000, then a is negative
> (-16384) and b positive (20480), so the result we want is
> 0x1000 (4096) and no QC bit set.

This uses a 64-bit intermediate -- there is no intermediate truncation.

Because both a and b are properly sign/zero-extended on input, the only saturation case is 
result > max, thus smin produces the correct result.  The xor will produce a non-zero 
value if and only if the smin result != t.


r~

