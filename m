Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3777525njk;
        Tue, 3 Dec 2024 07:29:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW3HFudAyQifw8wRdwkI13h4QJQzdUC6aGwSlPz40+vpljbFd/gOeudXr5z17UvUgyASgmYZJOb8UgT9g==@linaro.org
X-Google-Smtp-Source: AGHT+IG1zHtgvrZcfxokDaQoUKapCMBqpjSifDFozwLif0utGcDflRTtVurn0tcqfI9O5+jXbnht
X-Received: by 2002:a05:622a:48f:b0:466:b122:5138 with SMTP id d75a77b69052e-4670c098db8mr40806021cf.17.1733239744678;
        Tue, 03 Dec 2024 07:29:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733239744; cv=none;
        d=google.com; s=arc-20240605;
        b=QXM2NSUOck9llHejUfPXaQENZDPhGTz91axmVde8H4YnXEWLxOT70LQFdQoIfnfYTq
         imvTxb2LMEwvFHPfQC54WXQOfk/Ngj7oFEaeMOlGWmjUjCHLLCRvTRMzEH1aM0rfbMVX
         JEqN5lsqiyE5wq5pVaw1RF1KS5kGK7Dz0/QxgPjFGucQYzTnugfCmv9NKVPbuU9TerFT
         tfVwGq4pq+QbQa39DHlaMe48i93d2yiHPaSOJ/PWpw+Y4Pmi6TlTgrxgpEg7T0TVlbur
         k0bgS5fldRNl4aaYbzG3GrcJDKLFmpmm2dujm+12duOcj9ueDNAo80tlutuRnvfNb9oN
         rieg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ddVbX959t4yeE1SQjP6kfnD8JqKG7wqHgvg1qP3In/8=;
        fh=PQbMimhpwOvocp2zobOOK8kQ9Eybn74eilicF9B+AD8=;
        b=JV1sHfJiHul8kFdh8rYtuu8+a1js9iLtkWweQVgtCa9YHlOYCnTkL/jHGU0GPudVlC
         BVsX4Nd8t5W2WozAM1p9u7tXC5EDFkVPkWjqkXgvNGNHqpSR1ySiCoPv9SDlPwS9XmUC
         4bkiUvHcUbpwtu2EZdHrgUkW7J/I2WQ7UF0svx9lwANcZefnl8eNOtfRhRt4IEmayHJB
         pGaRKI2T8LAzF+mDnccgDTmUCoUU0Dj1RbQ5M/0DamS6k2maltYA6RejFE+eOjDOlfTh
         Y2X2PUkw+adWECChQagyFY2J+/H5Tz+26GyFSlB9TQWQtcN5MWRDUE8N707VEV425i+n
         WnGQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mF9A1GJj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c445db44si140448731cf.643.2024.12.03.07.29.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2024 07:29:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mF9A1GJj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIUpZ-0001Mw-1i; Tue, 03 Dec 2024 10:28:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tIUpX-0001Me-EM
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 10:28:51 -0500
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tIUpV-00085p-NW
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 10:28:51 -0500
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-29e6399b009so1400858fac.1
 for <qemu-arm@nongnu.org>; Tue, 03 Dec 2024 07:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733239728; x=1733844528; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ddVbX959t4yeE1SQjP6kfnD8JqKG7wqHgvg1qP3In/8=;
 b=mF9A1GJjKhLaeWwfABF97k/3wNlJwDItEHed0COEPcPaCFucENRGRMtMvA511iSKSk
 rZlY3xJb/CFgAcYdTRytqWarFy+lxXlK9C52FvWCYe6yDP2AlvsM867fnAsxuJW+48fi
 lK0MNlnpVm+P1YpQl+BIQjwtzk+SBvTUHNMjD/oLLKQXLJJ7cyHWedaxLGeiO9rBSw2N
 5f/nPRxK+zEKWX4p9I7Oxw5gEPw+Px+rhUdYLiYv65DcZwLImQJZVV4dHAml87B2f3zB
 zjx6qXsLKRI48Ki44QPsFw0b/f4/20jARiBlO3Kjohef8XVHuxcaJlXsjsN1Ox4UErvt
 3Wvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733239728; x=1733844528;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ddVbX959t4yeE1SQjP6kfnD8JqKG7wqHgvg1qP3In/8=;
 b=pO5KoL4zeWaEjON0B2pGqXbx1KnzFOGIcTpkBvIA7MTQWO06+Wmzy9wEYkkrf4FKt5
 S72bOnfEqXyZuy25YNI3sU1XAfbHuzmc0uAKAYeewDYr/3ValN3vz6M3PYe0ufnXsH17
 46itIs9QVNcCEdYD+bQ/xZiJg0vqNf9VtBc9sbu9noJQcAsLIszFoszm3sVbOZcXgjeJ
 1Z4aS51/S+PR43jzCa9CQWiDtKS3NjGBBxypdvaKZjEWme54ndFnRfy2lwax+4VCOE/Y
 jbB4ZqNsg611Zz85KKDWw6Lpx8fSWI76uI0J08/nMtiqdMI9RujNgYJefqV8x1iFn7y2
 KWPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv/j1Rl2jXp3WCayAPlIY/Ft3kOvnjVgORICvOqn42MR8TJXmk1mzuptSbJnkZ19X/DXhSwwoQhA==@nongnu.org
X-Gm-Message-State: AOJu0YxGCoIs6D/FoPhfhBWXIh6T4YNSPQ6LKgkHTnheQy2HOnO0M91p
 w34GKwkj6miyXaYNp4HsPr20PX7YsedrivCpzPRz7EstXEHpg6Ca3k5PvCu/kX4=
X-Gm-Gg: ASbGncuDFDlwmdY+7KBb9RLlSwA5uSo8zeqkJZfk2hN746i9Ing3mSuPs4L4evCmq8c
 LxuPwZLQrCsQNKh2qMEredOALHh/DeDpc1qLz31yTs0nzOktGEoP9uH/0BLm4Snrs6I22sn83X7
 CtwE4r9y1RRwsMbkb0FVqfO3iZgHtmmyyPdXE7QRPCra/S3SBFVYNH1jTK3ye6AqmOxfMGIzKPq
 h2CJ7ILI4VLHrN1FIh0iRW8JYSNJlKMJCtOEfu5uJP0CoWI01mK7+TUK2dzeO8Lq6IsoI4kWNl2
 liy27pBh+HG7ZDWaKInJr9Hz2dNP
X-Received: by 2002:a05:6870:71c3:b0:29e:67e0:408b with SMTP id
 586e51a60fabf-29e8870d1efmr2536006fac.22.1733239728221; 
 Tue, 03 Dec 2024 07:28:48 -0800 (PST)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-29e2d2c4fd5sm2822924fac.30.2024.12.03.07.28.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 07:28:47 -0800 (PST)
Message-ID: <b0a41fbf-0ec6-47cc-805d-e762d99ddf82@linaro.org>
Date: Tue, 3 Dec 2024 09:28:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 28/67] target/arm: Convert BFCVT to decodetree
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-29-richard.henderson@linaro.org>
 <CAFEAcA9Aww0m_TPdbL53DPPnWqA=BU1TzjGLvQi-EokKyzkdfQ@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9Aww0m_TPdbL53DPPnWqA=BU1TzjGLvQi-EokKyzkdfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2c.google.com
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
X-TUID: J8/Lkvi12KOP

On 12/3/24 08:05, Peter Maydell wrote:
> On Sun, 1 Dec 2024 at 15:11, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/tcg/translate-a64.c | 24 ++++++------------------
>>   target/arm/tcg/a64.decode      |  3 +++
>>   2 files changed, 9 insertions(+), 18 deletions(-)
>>
>> @@ -8661,21 +8664,6 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
>>           break;
>>
>>       case 0x6:
>> -        switch (type) {
>> -        case 1: /* BFCVT */
> 
> Here we decode BFCVT when the 'ftype' field (bits [23:22]) is 0b01...
> 
>> -            if (!dc_isar_feature(aa64_bf16, s)) {
>> -                goto do_unallocated;
>> -            }
>> -            if (!fp_access_check(s)) {
>> -                return;
>> -            }
>> -            handle_fp_1src_single(s, opcode, rd, rn);
>> -            break;
>> -        default:
>> -            goto do_unallocated;
>> -        }
>> -        break;
>> -
>>       default:
>>       do_unallocated:
>>           unallocated_encoding(s);
>> diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
>> index fbfdf96eb3..476989c1b4 100644
>> --- a/target/arm/tcg/a64.decode
>> +++ b/target/arm/tcg/a64.decode
>> @@ -45,6 +45,7 @@
>>   &qrrrr_e        q rd rn rm ra esz
>>
>>   @rr_h           ........ ... ..... ...... rn:5 rd:5     &rr_e esz=1
>> +@rr_s           ........ ... ..... ...... rn:5 rd:5     &rr_e esz=2
>>   @rr_d           ........ ... ..... ...... rn:5 rd:5     &rr_e esz=3
>>   @rr_sd          ........ ... ..... ...... rn:5 rd:5     &rr_e esz=%esz_sd
>>   @rr_hsd         ........ ... ..... ...... rn:5 rd:5     &rr_e esz=%esz_hsd
>> @@ -1337,6 +1338,8 @@ FRINTA_s        00011110 .. 1 001100 10000 ..... .....      @rr_hsd
>>   FRINTX_s        00011110 .. 1 001110 10000 ..... .....      @rr_hsd
>>   FRINTI_s        00011110 .. 1 001111 10000 ..... .....      @rr_hsd
>>
>> +BFCVT_s         00011110 10 1 000110 10000 ..... .....      @rr_s
> 
> ...but this decode pattern has them as 0b10.
> 
> 
> --- a/target/arm/tcg/a64.decode
> +++ b/target/arm/tcg/a64.decode
> @@ -1338,7 +1338,7 @@ FRINTA_s        00011110 .. 1 001100 10000 .....
> .....      @rr_hsd
>   FRINTX_s        00011110 .. 1 001110 10000 ..... .....      @rr_hsd
>   FRINTI_s        00011110 .. 1 001111 10000 ..... .....      @rr_hsd
> 
> -BFCVT_s         00011110 10 1 000110 10000 ..... .....      @rr_s
> +BFCVT_s         00011110 01 1 000110 10000 ..... .....      @rr_s
> 
>   # Floating-point Immediate
> 
> should fix this.

Yep, thanks.  Fixed.


r~
