Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4170842njb;
        Wed, 11 Dec 2024 08:08:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWjBnA6Dzy9gXkYhShmEbo2DoPyClzd2rXkhmY0DT+y4SeZqHnd1kirBYso2pgVtgkgRyZRPwOB0WS9+w==@linaro.org
X-Google-Smtp-Source: AGHT+IEFvSNLXOejsDhctAyWpif2UBBRMH2v4CRoo5+aYTewbGxo3vPMCRU+rVXQ4+325S/wuqj8
X-Received: by 2002:a05:620a:a006:b0:7b6:edd0:d757 with SMTP id af79cd13be357-7b6edd0d985mr217122585a.60.1733933308368;
        Wed, 11 Dec 2024 08:08:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733933308; cv=none;
        d=google.com; s=arc-20240605;
        b=NwpoDEXNZca5RZbUxIPW+fYI6aYEI094iZxqiHOO72OUHswR6k2rIDzT57NfHaDHcf
         yxhW5GBx6LUeT/Wi9p/bFB2dY3nWzP1kdJW03fhrgpPfjQ99AWBxms1vYWa9HRIiznKu
         IytDgH4kXZaKqBMoVJxcFZ9crrUTHE4VBW8MzBI+0KzukXqyiWf9OrFvtoSzeALsIO21
         I+8NoGocM8nb2oAFQw2xUWEEpQTOATD3tkGQrRpZ6JfqEg7kPPU95G/w/ICxSXM24f+j
         yEleNBWvwvV3JjeFd+1xcnzlproDumIcPuxmiIIki/EV8ldQKaZOPra91b86i09QcyHm
         frSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=lRqje1xMFeGF7r0mhyZ6Ulp/V9B4AQtSo5FO4+ulxWA=;
        fh=Mp6AjCTDVJ2KoViraAKhOn34AKmSytZJy669U22OagA=;
        b=CUYXJouqtFR+HWe7TxFBdEMy67TF14sQo+nj+6I9+z/s4ZYpWUt+NFNPK7IXA0+y5B
         cr5QbG3f5AdRzY+lCPqz5jiFJBreLCRWt28Zn5L9m5gJKb6rb/0B7hziue/+1TtwxQci
         OL4bXrDR7ygkc0BVBfU+COJK9oJYPXi4eOdmY6FMFi5y3OHeLkvEi0rHhdbI+Hh2V14s
         6zDe+pF2i8QTvXDXpMiliO6d5Jku4ZW9A1thnjg1BmQaBGcOdZfG9vVLgMCPpZ3k4xVs
         O7umF7R3Wt7En1XZ8i9Qs7482lEZjdcGEuuVUAzPeFslqGNGdiQE0GR5YZ7yMu0/5+Jc
         Tbkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kl1cfWLE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6d22e103esi983921485a.603.2024.12.11.08.08.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:08:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kl1cfWLE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPGB-0002wn-Eq; Wed, 11 Dec 2024 11:08:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPG7-0002tz-Kb
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:08:21 -0500
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPG4-0005c4-0r
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:08:18 -0500
Received: by mail-qt1-x832.google.com with SMTP id
 d75a77b69052e-4675fc06969so44286781cf.3
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733933295; x=1734538095; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lRqje1xMFeGF7r0mhyZ6Ulp/V9B4AQtSo5FO4+ulxWA=;
 b=Kl1cfWLEyEx98FowhjFHfGNB9VNbxjRnAtDoygMmNAWTIS3DzsoxqZOY9YK+dzbHZG
 8jfc1pO1F3DR3YMzYtksIqZAaYrzyTn0p48c5FWzA7JcVXRp0ozpCRiJS++X3QW+/TA/
 NUghMSSRcsWWJNCFJ2Xmvbq/Oom2KQShoAb9gpQQEuruL4hd5lNk5T1Nh13I6Q57TsL3
 gkPT6Q82xlmGlzcEB8WYXE0sGQshuQ5idczO0zQ4I3rS95mWn4qIWCFSoe1a9Z1reoKU
 WhDAHomq2rm46Xxsb7wV2e4An7A/yaLnWzn1KdQJ/or+FT/1y2EgpFVB6rQ3KmNXNntk
 TUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733933295; x=1734538095;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lRqje1xMFeGF7r0mhyZ6Ulp/V9B4AQtSo5FO4+ulxWA=;
 b=oNcuT79+Hg8CnwDAEw/OQS9NYbCNUvdDgHbOpzj2evr16ZwKW4hr+49MglQsO3ABPY
 kuNApWVWjBRUyBg6K4pr2fYrfPiJF1XIlzlLko8UaXiKGV7zeE/puy5ZhlEyBIiSY6a4
 XJlFrPDk+oyoIux/5jzR8/oUytr7qajFiJVQpvDgstlysOmgkWd2yiW4l2yApwya7V4H
 VNfUQuDREhM7nlQd23OXo9Xe00+dlRSg+NJF6iPJpSj8AVtBUVO/qrhvwr0RWDGMIeg7
 Fd644Wpjt83d64WpcTyPUKVoYg/SZRELKX5i+xRmujrhRjoNtu4YW9jz+K/Ovf80znBO
 f+PA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtnIvu+hyz6a6sRiyrBo+RhXewEPWVjCB43UaptRr8TcpvqR245opogxlpifwmkmHRBxc1ZbVoVw==@nongnu.org
X-Gm-Message-State: AOJu0YxtmxrEaMWmeKwrNg3Hsj+TBL17nj1+4RMyMHw5DEjG51E74EtF
 zhQndCo1PotQP76DQ6J+xj9b0f3tTPhKIEMyCgbqO5mSaQghLkN/RgkaJgn0m/U=
X-Gm-Gg: ASbGncuTpUf/cTa5LkktSFrSryu3xAxOrXUD04m7EzG0eimOpGIhEP+7mrfaePpMkux
 FiMBCClWI8mGeYchPKnDX8jPmDBYYZUD3OgQH9wSgZihlqUFBPG1YNbWRsT6TGx7oDzvjqF54X/
 NWMc0kKu2wTsHR44FdgjJ1NiIrmFKRn65RPmaylq+oo4M1zz82xK5QGFdoRUjQDJFLEVGGwL00L
 7MuS7uxI9vkbbetAXd0HYanYJk8JkYUtiLlEQoWSClM//xjANrq0qCInzOGjY7TrwRzLJo=
X-Received: by 2002:a05:622a:1186:b0:466:886f:377a with SMTP id
 d75a77b69052e-46789292fedmr70039531cf.3.1733933294851; 
 Wed, 11 Dec 2024 08:08:14 -0800 (PST)
Received: from [172.20.4.119] ([187.217.227.247])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4677b66db85sm17764271cf.86.2024.12.11.08.08.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 08:08:14 -0800 (PST)
Message-ID: <c208516b-d2a4-4b3f-920f-a4595aaa3e69@linaro.org>
Date: Wed, 11 Dec 2024 10:08:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/69] target/arm: Fix decode of fp16 vector fabs, fneg
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
 <20241210161733.1830573-24-richard.henderson@linaro.org>
 <CAFEAcA-9nUy0g0f0t7ais-Ygy1=2cDz2==-St8fU_tZ1GF8xtg@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-9nUy0g0f0t7ais-Ygy1=2cDz2==-St8fU_tZ1GF8xtg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x832.google.com
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
X-TUID: fknBUaNtqjtZ

On 12/11/24 09:44, Peter Maydell wrote:
> On Tue, 10 Dec 2024 at 16:19, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> These opcodes are only supported as vector operations,
>> not as advsimd scalar.  Set only_in_vector, and remove
>> the unreachable implementation of scalar fneg.
>>
>> Reported-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/tcg/translate-a64.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
>> index a99f3d0d13..f67360c4c5 100644
>> --- a/target/arm/tcg/translate-a64.c
>> +++ b/target/arm/tcg/translate-a64.c
>> @@ -10816,6 +10816,7 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
>>           break;
>>       case 0x2f: /* FABS */
>>       case 0x6f: /* FNEG */
>> +        only_in_vector = true;
>>           need_fpst = false;
>>           break;
>>       case 0x7d: /* FRSQRTE */
> 
> Also case 0x7f FRSQRT I think, which will currently fall into
> a g_assert_not_reached() for the scalar case.
0x7f FSQRT (vector), yes.  I'll fix this case too.


r~
