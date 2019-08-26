Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4521609wrs;
        Mon, 26 Aug 2019 16:47:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxkaUOtxEXeEKug4sPCN9vpGZEWGFP9GPMP/C+HRW9CFA0d0Zl05cmrR4Pq0Hvcx9Eu5kvV
X-Received: by 2002:ac8:296c:: with SMTP id z41mr20303812qtz.307.1566863255566;
        Mon, 26 Aug 2019 16:47:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566863255; cv=none;
        d=google.com; s=arc-20160816;
        b=lqhH1RTgxW6zWPUteJS5Xixb5+TF2X/si84ucPl7aXffMfpBodWsL6Ac5lvL4RL+Cm
         hSEWqO6Me49bz9CfjYrG1UgC6B70QZ8YyIMoGGZwhfcZx6yFGdvVTupMDWgzv1rJIv7+
         gEsQJ/f69QyL62IBMP1Tj21ACgdLvmEh5lkHITNxj5HE/iv0cYbiYPOXZHidiFSOBXI+
         RENmJZgaU0AHtdrnW3UdfxSD/6N7HSL2oAQA7ID307qUxdAj6OM3gNQcOvoFPV4+JcT6
         Sfp6W5V2/vgWh95isJKMrYOOXFbdQ3nysOIEJ6hDPvNt7n7a0GkBs5gHIYpRdfzotpSB
         r9/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=t5dXr+5eWDk+oOUl/xpSyEk5zCVFGBpHOuDbiv61zLs=;
        b=vI8JH20jjuQpqIkjmfwuA6S0lqm82wrB9uFurja8J4aILhIGu8qnHkU2FYr2jhXLZC
         IYwyh6FqcpPczLQkInBAZU3uSoCpxIgICPi2akXJgVFwc82A86XWpLkTR7TY6Fj2E1sR
         DjkTqvi5J9l6CR3jDr/tIXyoHycLb/pN7xQdi+KO3QkQSWig/tGiH90fCQFu8txOnLGn
         ce13FE6i1aTFfFiafHHz/Ggic1+Kd2uGjOLZi+65jJ6/3YsjqgDqMQ+u7y2dxPEPXBQ0
         ajTENbjL/WVgeG4xK3aRWIMYzA3R8KQK2m9++7qyumm2H007jOiuS0AF8W9EaDU4PyLd
         0bbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IWGGDmTN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m9si9459648qtf.19.2019.08.26.16.47.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2019 16:47:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IWGGDmTN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2Ohy-0003V8-W5
	for alex.bennee@linaro.org; Mon, 26 Aug 2019 19:47:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59617)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i2Ohk-0003Uj-NW
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 19:47:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i2Ohj-0004dC-FQ
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 19:47:20 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:33966)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i2Ohj-0004bv-7F
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 19:47:19 -0400
Received: by mail-pf1-x444.google.com with SMTP id b24so12864236pfp.1
 for <qemu-arm@nongnu.org>; Mon, 26 Aug 2019 16:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=t5dXr+5eWDk+oOUl/xpSyEk5zCVFGBpHOuDbiv61zLs=;
 b=IWGGDmTNVqZncR+pmdt74BM6clveQUSfDZDBgzCmgBq79Z8bOVA1pzUAfit0tJc0yn
 gSQdUdF5H1moHJ5cEButowrYJtNcU869ubk7n3kATtDsOStfJhOJSI22D2Wz5wzNyH5b
 A9H7VnQGfcPofTr6sDnyjK8hr0kc3F1d0IGe5Ve8/jMQJF6Eseeing9cs9+eZWZwGbUW
 HGWDorEdSZDegrCGR9ZtiVWt3dLuuwhpTzr2plFSY/LoIaQzyUzXG5nWLlwjK5iPU747
 o2+YcUJPeXRHRMZ/K/FcnDR89TLLBLl8DHg0weJxuvnnaYfJpsCX1WMI6nSmY3W5c/EI
 xlgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t5dXr+5eWDk+oOUl/xpSyEk5zCVFGBpHOuDbiv61zLs=;
 b=nza/GWebvs8atHrbEgitn8LntNzlkfPo6OyrKQheUHTaMdZ2SN0Ntpa8dtYZfF+WOr
 0cMXU7jfEID/MZK9zSrGXSci0Di22HGtSq9NqsnW/kIiu3KG0ypEmGWJk4iNsYRpgTdN
 o2V06POV8TgSK5+0Sav6Mi3gOUzq+dOZMIOM9gDiMDD6Q0+m7hF6gJngNz+ob2oPy8l5
 RPHFAdfhVn+Dh166xa4ru4jXVZE2LbJuZDkzYgwsD+38NsKR65U4ej4j2fuyyiFffu7C
 FfqLxJaL6jay2tlMm6xnX8FWJnSwb+jTEf7T8GHTPBcisoDKrxjI/hVd1SUk3WPcS6J3
 /hYA==
X-Gm-Message-State: APjAAAXGUsbwTD/t2pKtwojnSKk1yn4uiSlEz9Ax/JVxoO7+re3tjv2l
 2FmDtIrkL6VVggy8qVLzumHmK2DqDmI=
X-Received: by 2002:a62:8343:: with SMTP id h64mr22102853pfe.170.1566863237475; 
 Mon, 26 Aug 2019 16:47:17 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id t6sm10940776pgu.23.2019.08.26.16.47.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Aug 2019 16:47:16 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-63-richard.henderson@linaro.org>
 <CAFEAcA-iBjMbeqC92A69Xn_Y0qnOu93+VhQwqw+hOeBYRXrBjw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <155ee312-cb2e-3fba-6277-c00d35c5ea94@linaro.org>
Date: Mon, 26 Aug 2019 16:47:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-iBjMbeqC92A69Xn_Y0qnOu93+VhQwqw+hOeBYRXrBjw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-arm] [PATCH v2 62/68] target/arm: Convert T16,
 Miscellaneous 16-bit instructions
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
X-TUID: g4jti3vZjoEy

On 8/26/19 1:38 PM, Peter Maydell wrote:
>> +  IT            1011 1111 ... imm:5             &ci cond=%it_cond
> 
> This is correct (same behaviour as the old decoder, but
> it looks a bit odd here because it's not the same as
> the fields defined by the architecture (in particular the
> 'cond' field is not the same set of bits as the 'firstcond'
> field). We could maybe comment it:
> 
>   # Bits 7:0 in IT are architecturally simply the
>   # new PSTATE.IT bits (despite the instruction description
>   # splitting them into 'firstcond' and 'mask' fields).
>   # In QEMU during translation we track the IT bits using
>   # the DisasContext fields condexec_cond and condexec_mask,
>   # so here we massage the bits from the insn into the form
>   # that that optimization requires.
> 
> (Or equivalently we could just pass a single 8 bit immediate
> to the trans_IT function and split it out there, I dunno.)

I think I'll just go with this latter and do everything in trans_IT.

>> +%imm6_9_3       9:1 3:5 !function=times_2
> 
> Would it be worth adding support to the decodetree script
> for letting you specify fixed bits in this kind of field-decode,
> so we could write '9:1 3:5 0' rather than having to specify
> a multiply-by-2 function to put the 0 bit in ? Or is it
> not likely to be common enough to be worth bothering with?
> (Not something for this series, anyway.)

I hadn't thought about that.

Adding 1, 2, or -1 also appears, but that's 3 of the 60 instances currently in
the tree whereas shifts make up 33 of 60.


r~
