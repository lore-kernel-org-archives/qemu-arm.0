Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp836767wrs;
        Fri, 23 Aug 2019 10:15:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzItDNEbKpcTXMcp7MXN3iLFRp7/xE7IDD66HDXTduVqp51jtnRnp5eN4bh5y+82m+SemYK
X-Received: by 2002:aa7:da4c:: with SMTP id w12mr5627607eds.199.1566580551798;
        Fri, 23 Aug 2019 10:15:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566580551; cv=none;
        d=google.com; s=arc-20160816;
        b=wO6IYoYNzxvM4uivRDJWR0LaZ86xNdKHKCnnZI5FCY6+1nQtjWSWTlKL1+om2ZEBFP
         NNAEfzqQ8Vuxu8tmFpQ54srS94kKLETIRKlIh+OjXcLzYlhaE072+T0UV7+btmh13id8
         fPWOnx3snnlDakYs19Wk4QZCIpUOF9YooAqNhZMrOCPtm6B1m+2QVwyl9SObQAdFWooF
         +dOK8v1v2bPzJzAjLE9Kivg9R1R/b9nOMyT/zERUCIcNurogS9n/huc4qKiqs6bPEydc
         NhbpXtqzjNCjmlnrp6WsfrRrasElFDW8RVoeT6OO0BuWsmWUZUy2q/2eC+4ia90sJfqC
         Jirw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=x2fzjTMcwWvStholZAH/1CBqkcdUgXqzPVFgSSANG00=;
        b=PiZIrA8xGJWBn27gtsKhk+5XmnJOfhRqn9YjmZxW88rGD5lYTevJ6yZNZXGVmbRvg2
         xv9wbCwe5RE4pUZX2YsN7hecfnGC0xgfqYxtY8ZTJoIl30uil6mMH06V2zNEiA9odZA/
         c3SHJFayjb7+NSmRSksn66pYJSz4aGQFMMgONJ5nW+uymzmvK1F5gyDkoJA1or/ntmoK
         X7WE9Bgqtzt1LfGgV2NAiJnDobiY6Kr7lxRR2ulQl1s7LutJVVnGfngtslg/F+Uzaq16
         K9VQ5Xckz2kYz3VqgbTu4GD1cL4mpbfHkNQEFvGuaWc/ry5mZYL96FWCQH+YAj7J+DmQ
         655Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oXznldTr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o46si2261385edc.65.2019.08.23.10.15.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 10:15:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oXznldTr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1DAE-0004sz-Qw
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 13:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56555)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i1D9o-0004al-0I
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:15:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i1D9m-00088g-W9
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:15:23 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:41966)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i1D9m-00088P-RA
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:15:22 -0400
Received: by mail-pf1-x444.google.com with SMTP id 196so6847259pfz.8
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 10:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x2fzjTMcwWvStholZAH/1CBqkcdUgXqzPVFgSSANG00=;
 b=oXznldTrp3my+RD7FO7PUvPlkpXOZ/31q+qlaIETLSAc3XlWkf04gf6d18NnTQMo/d
 u7lVi/Pi7v23AdLOiVVEskVIsh7KVuQrPTXaMuzfRL4qbvl4KnChjD7aJfrFFbjqtEZS
 Le25ettyHQiDTSbio+cFo0NvmoAsD0C6c9pYu36Zd+6DXdrR3+ZibJmUv9CDM1ZX/v+p
 r+JCmJsq4QsFUgrfaPl5c8BVgl/4PBMj7Vw3GJpeXTyqBsitfAv/tjthoC/5GY3H8bWG
 IPrbEHO2yolrYqXOeZFDtR6M6CaSLuBHPUkcB73n0s1KG3L+O1NFmifAl3ojYgO3xelK
 f3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x2fzjTMcwWvStholZAH/1CBqkcdUgXqzPVFgSSANG00=;
 b=Yb6F7Yql2FO4dj2enobsxLavVEzZx4LrFgh6KvSCS9iGkl5FY3nRToJAIm3Z8EnWuU
 Y3vx44k21wSFLwySwnO0fsIgxSCXd6iW9C52kqGR/T8KxDHMK0b4RhCyDaMcIYhZ7YOi
 xKuidoS5RBiVTbOllWq0wTMi90Xv40bV9oBqbCsONiSjFHnreL95vDOZYDljiTyXY3Wf
 sHwLQBk7zjMqdIKxp1mLOdRJ3awNLhKCvEeLQv6orcje30OmrgEH7gTmiWaQDlBl+9WS
 fUyPRqda5EOBFKOLU+pE6DKCAYL0d7Mecd8XBsLEe/pYQSqoBShmbmR0L7SbYW6/QwRt
 bhFQ==
X-Gm-Message-State: APjAAAW3s7fy5oiCwRveoDz0X0icU85+w5AZbV1kAxVPYZ1hW0TgWA82
 QkrvFqsa9uaC4eOnAAz5qBjdOLSbkHY=
X-Received: by 2002:a62:5250:: with SMTP id g77mr6567147pfb.158.1566580521651; 
 Fri, 23 Aug 2019 10:15:21 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id z4sm3030898pfg.166.2019.08.23.10.15.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Aug 2019 10:15:21 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-26-richard.henderson@linaro.org>
 <CAFEAcA-gsP30Be2wZi-UeUUjond05A3HuFKN3znz60WmPPnCxA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <22cecc22-2de8-7130-0bde-6391a31c1076@linaro.org>
Date: Fri, 23 Aug 2019 10:15:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-gsP30Be2wZi-UeUUjond05A3HuFKN3znz60WmPPnCxA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-arm] [PATCH v2 25/68] target/arm: Convert Signed multiply,
 signed and unsigned divide
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pPdknipaD148

On 8/23/19 10:00 AM, Peter Maydell wrote:
> On Mon, 19 Aug 2019 at 22:38, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/translate.c | 463 ++++++++++++++++++-----------------------
>>  target/arm/a32.decode  |  22 ++
>>  target/arm/t32.decode  |  18 ++
>>  3 files changed, 247 insertions(+), 256 deletions(-)
>>
> 
>> +static bool op_smmla(DisasContext *s, arg_rrrr *a, bool round, bool sub)
>> +{
>> +    TCGv_i32 t1, t2;
>> +
>> +    if (s->thumb
>> +        ? !arm_dc_feature(s, ARM_FEATURE_THUMB_DSP)
>> +        : !ENABLE_ARCH_6) {
>> +        return false;
>> +    }
>> +
>> +    t1 = load_reg(s, a->rn);
>> +    t2 = load_reg(s, a->rm);
>> +    tcg_gen_muls2_i32(t2, t1, t1, t2);
>> +
>> +    if (a->ra != 15) {
>> +        TCGv_i32 t3 = load_reg(s, a->ra);
>> +        if (sub) {
>> +            tcg_gen_sub_i32(t1, t1, t3);
>> +        } else {
>> +            tcg_gen_add_i32(t1, t1, t3);
>> +        }
>> +        tcg_temp_free_i32(t3);
>> +    }
>> +    if (round) {
>> +        tcg_gen_shri_i32(t2, t2, 31);
>> +        tcg_gen_add_i32(t1, t1, t2);
> 
> Can we keep the comment the old decoder had for this case?
> 
> 
>> +    }
>> +    tcg_temp_free_i32(t2);
>> +    store_reg(s, a->rd, t1);
>> +    return true;
>> +}
>> +
> 
> This one:
> 
>> -                if (insn & (1 << 4)) {
>> -                    /*
>> -                     * Adding 0x80000000 to the 64-bit quantity
>> -                     * means that we have carry in to the high
>> -                     * word when the low word has the high bit set.
>> -                     */
>> -                    tcg_gen_shri_i32(tmp2, tmp2, 31);
>> -                    tcg_gen_add_i32(tmp, tmp, tmp2);

Oops, rebase fail.

>> -                }
> 
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM
> 

