Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1545547wrg;
        Sat, 8 Jun 2019 12:33:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzidyUlsDUET8cHLA34Q1/UhC8IzlViPUHI/1w5DzE/NpOF3Oja7DfQcGdOy6vUG11OE/2q
X-Received: by 2002:ac8:2dae:: with SMTP id p43mr33956704qta.304.1560022399519;
        Sat, 08 Jun 2019 12:33:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560022399; cv=none;
        d=google.com; s=arc-20160816;
        b=bh4pwHDS3XSOexnpP+3de9HP862a+lLQ9CLXxdKFHl0z5dB3nFP9X/ctsUJiJeoISP
         HttvoM+7TuIkG7GUG1vKkZZcvpgktpBWvhtBxnaQunFVN352fq09HBTr5JOAz+kAp++h
         Q1+5ONN8hLllywekMq5rM9mhoqaiiX2O5VidjhELVdhxF+f4kYYeDh+26pbvM2B8s86D
         5A8uIVneTibNzQlpHyhswjaG3Cgz/wWgtgLjKobNksXsvX5i1k2hOU9M96Yp19Hm0+Rz
         Cy1IaBU+abynSI9fI9Ly5lvCsOqj6VYvbYZ0j3+YP5Yjt6SHsXTrClL+xEnl3YLLrCZI
         kjXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=qOIV2hNRtghskSFtsJFnFzTh8BbWC87JcqU6YAc03N8=;
        b=Mhao0rKuj2kkELpbmJTxOdomGZcgYDebF7Vr8ekQV172oZyiX1sRjJ2LjDpCIUKcSD
         e9P01jkiUnGcYh7t2iD1YSpYKwKrvFJudcUHbvtoPWW+ATEENqj7BmjXvTDwU3oElqyG
         ddeaKfFhGSC0irxat9/lzNfRNtTPWiBGTofCzRvEPEez20jeJ5iPtTwXezPz8pMOpte+
         h8ZOwvbtaVpmfPjrJ6yyXpRxOzHMdm06ADSdBZJSwG3fEP5TUP0+0sBbwk+ZFJ5a6611
         cHqs7+h816ZYILYZwOjLgY2WFY/BdvEG/TnitVvPi8RWb4jW1y2cXK0FOG7TiWHOVCi2
         WriQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g+SRTcfa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j22si894517qta.375.2019.06.08.12.33.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jun 2019 12:33:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g+SRTcfa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60066 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZh5b-0002Hs-1K
	for alex.bennee@linaro.org; Sat, 08 Jun 2019 15:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37682)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh1V-0007AZ-MR
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 15:29:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh1T-0007I5-Jn
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 15:29:05 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:43248)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZh1R-0007G3-Mo
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 15:29:03 -0400
Received: by mail-ot1-x344.google.com with SMTP id i8so4898037oth.10
 for <qemu-arm@nongnu.org>; Sat, 08 Jun 2019 12:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qOIV2hNRtghskSFtsJFnFzTh8BbWC87JcqU6YAc03N8=;
 b=g+SRTcfaagymtpwihCCAYls6TPsL1j2icTaFaiS4gaDX6Rhfv5VTIoSq2dAeT2GDUs
 NerBLIwHZy3HiBo2OJ+O3h5VuFgS1Or6/j+i06Tt5Js1O4QpZAqgM+WlHh1/pDrlWn1P
 a2KRpfRIWNgWksP2ms7wQVbkSw3waWIfOKZ/KDzshv5FIBh63oi/GclGcLt79aYcBjKb
 cYDXw6A008i6GN1QCqf6CgaV4MO6rrQMNmlxA1hL3o0rvHqEDIWrvKA3AZa7RlPfaMu2
 uUiegzKs63FcaTLm8+/23VDOCjCRpOIK5gxCpwKjwM00BhxM/6ccARiK0SgfA/FAUPVY
 QPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qOIV2hNRtghskSFtsJFnFzTh8BbWC87JcqU6YAc03N8=;
 b=DTbEkiXXL/+/O5aDEd43Z4kDPGYEgB6LKUyzzn7qHgeT8potg7Dzb8+EJZSibEdDrO
 bvJbYMynoyIZdxA12/MM2kVS9hbgQ6N4ukTGnzLMyG2QcvaLrWkdH5i9SAxDCj8V4moP
 X2ogw2L4vSrAT4QtkR6i7ke3KobzDztd5/rBp3LjJGzjus3iQQnJlB7/AREoynZT9yoV
 tjPJf4E+3PpvQQMUwu2K1IyF9x3zc/rOPEckzmYwf7ipBJ0WWBgIeMijnmcBZjhv53cQ
 9BtOaErZdZ4TsmaMV3VybNrn11R7OINGn0XELMgf4uRnDi724RQmueLRL0WMtHIu1xMi
 1hLA==
X-Gm-Message-State: APjAAAUq1YqJOvg5P+L2jDoON0kQ2TjHX8PBHq36bo9xVNiAwZmtpwdJ
 s5fe3ZaI7UE+3j4prLOp4A0DgQ==
X-Received: by 2002:a9d:174:: with SMTP id 107mr12041966otu.322.1560022140796; 
 Sat, 08 Jun 2019 12:29:00 -0700 (PDT)
Received: from [10.219.49.199] ([187.217.230.84])
 by smtp.gmail.com with ESMTPSA id g10sm2151286otg.81.2019.06.08.12.28.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 12:29:00 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-29-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <da80c3ea-5a33-e7e0-209e-89a8413c8f06@linaro.org>
Date: Sat, 8 Jun 2019 13:55:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-29-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH 28/42] target/arm: Convert VMOV (imm) to
 decodetree
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3Dza5FbmbqV7

On 6/6/19 12:45 PM, Peter Maydell wrote:
> +    n = (a->imm4h << 28) & 0x80000000;
> +    i = ((a->imm4h << 4) & 0x70) | a->imm4l;
> +    if (i & 0x40) {
> +        i |= 0x780;
> +    } else {
> +        i |= 0x800;
> +    }
> +    n |= i << 19;

Can we reuse vfp_expand_imm here?  Given that you don't have pure code motion
from the old code (due to field extraction) it doesn't feel wrong to go ahead
and fix this wart now.


> +VMOV_imm_sp  ---- 1110 1.11 imm4h:4 .... 1010 0000 imm4l:4 \
> +             vd=%vd_sp

We should concatenate imm4h and imm4l here, so that trans_VMOV_imm_* only needs
to do "n = vfp_expand_imm(MO_32, a->imm);".

(We can't use !function to expand the whole float constant because the
decodetree fields are "int", and we'd need to store a "uint64_t" for dp.  C.f.
the SVE trans_FDUP.)


r~
