Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp847304lfm;
        Wed, 22 Apr 2020 09:42:20 -0700 (PDT)
X-Google-Smtp-Source: APiQypKChIoBd7zH/+7hSaDGINd5PXFl+wFb/AnQ2v7JFoOe5kwyOvYXsgZy6lruXZ/Kxv8wxFtW
X-Received: by 2002:ac8:7309:: with SMTP id x9mr27942263qto.68.1587573740447;
        Wed, 22 Apr 2020 09:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587573740; cv=none;
        d=google.com; s=arc-20160816;
        b=A9Bl5CU4TGlvQeSN6ROFPRZxfksQVvI9RjRI6h/t1x3LYyrk0r4wLAakMzya7lnz7F
         wZYEg/YzPYzN3/mRx2CSSQYgUMf5MilWSU97EPUl/ySaNmZVlV4iMD0Q1nhNacQCBhFa
         93nh2vGPIalrjSlfF+Tz3PJt3OPelieajb1bRuPoLNq390iNAYdbwc0mlgC9LxbLE4HF
         WIc7mAKKqt7zHEtEGfZowsEYT8t39DoUth1s1TqAAp864JFG0VBDGo/q+rNaKNQAO9Ce
         mcheVZNkI64sbluM0sYIZUxaIt2n2u3RqY2OvOwEFe9Acegoa9mBelUfKPcP7QWYW4Gy
         Lt6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=4vUvFaUSrdPMIJvLsS9HqHtNdnLVoK8IeRuxUZ/s17E=;
        b=jezwYxbSBDGrbA8DHcp8GreVYceL/DIIiM2KiWa3dyV5+VdGjIXGkFlm0kCYVWTjZC
         BtGrSJ5zeV0QAUvsp6eaV8vwIHa/wNbeMtib1w+VNsVTQmOL/rooib4qNjQipQdD96tq
         TCzPc9VVSnKbVogtdMU2tqxRpD2EWxiZOmFec7iMC9DXKIjw23bTg8gOiC3uVKYNVAds
         yjs9fV+IH0QTvXs5zgQ6CbCLWsiW3jd5GKrtAZyvHhzXWkhF3TqHrMXjRuf7W1n5ab2W
         qIPkI5j/XVXbEXoAvizLceYtc4o9wWafjKWg1FZkHp0J1durMQi7PRQkFjJ1jhH9FYGZ
         VhsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Myb7vrRr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11si3406707qte.159.2020.04.22.09.42.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Apr 2020 09:42:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Myb7vrRr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRIS3-0002xK-Py
	for alex.bennee@linaro.org; Wed, 22 Apr 2020 12:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44634)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jRIRt-0002wK-L3
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 12:42:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jRIRt-0000nK-1e
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 12:42:09 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:37390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jRIRs-0000jA-ER
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 12:42:08 -0400
Received: by mail-pg1-x542.google.com with SMTP id r4so1372853pgg.4
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2020 09:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4vUvFaUSrdPMIJvLsS9HqHtNdnLVoK8IeRuxUZ/s17E=;
 b=Myb7vrRr3EsGGpi7aPF3R/bfKs57WvUR0XzdFgXxz3x20DpgFZSzH7PSLcDKLkgloZ
 EtCBfWAbT5CULytZ6XSPcoRYuIh1VYSzMi654Sy/GKVjzBySoh22+DxMaDRdlVH+DHUe
 rJMByBVpLTduZ3w/uaf2YN2IHgZ1HTCFQxLslbMHuLLz8D+lGZPitMNo/1Vwf83NxxxC
 CxXL/k+FEkioXparhcqny+CrdS5CfdXDjztoQfsThK7kSEj3RQNigzZfMxl+Zgh9LQ5I
 GDCllOQjNQh2djuqmeZUnoZGWduWB1f0YmjnYJ5bQAQJC5Reg2LMnd1JYvZODHlMIeJ5
 l/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4vUvFaUSrdPMIJvLsS9HqHtNdnLVoK8IeRuxUZ/s17E=;
 b=VGpwYwuUqQehFKfeLxiKqtsJx75nabeS7cO+N8xNIol7IN/3IzHe9/DcUP1pVjMyou
 d1lAF3vdp0ns4vMyZr31h152Wfs3eCccYN6EJr+bxipwCtiy7X/SaK8U5g4l6TlcV4Aa
 ArkYfqze6ufJG3LL+D79JbiKSrMRO7gYMnqBlu7/cANUlXPgSopIzDsOkHao9wHhpCFn
 XyBUk58mZvPhkdeWx/u5diOikKtvH80kECQT3G8MjQpbET0SzepJVpt3PaNe5dYxI4oL
 OEV6qwlcNR/NRu2No0P6JY+rs+wqeBUSOiv+MSkakdeTUj+tOkWBbtFTq9Mv6ua1uHmG
 bA0Q==
X-Gm-Message-State: AGi0PuYBaVGdyShcNbWyUwMC0ijEoVrEFhAFB2/h7Ba5IqcLcpHj825o
 ql1IeGwgBhEHpbH5rIUhodUNbw==
X-Received: by 2002:a63:1566:: with SMTP id 38mr28432171pgv.355.1587573726686; 
 Wed, 22 Apr 2020 09:42:06 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id z7sm5830149pff.47.2020.04.22.09.42.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2020 09:42:05 -0700 (PDT)
Subject: Re: [PATCH v2] target/arm: Implement SVE2 FMMLA
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200422141516.7977-1-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <399f890b-8265-2a82-f9de-ab1d7b95f6cc@linaro.org>
Date: Wed, 22 Apr 2020 09:42:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200422141516.7977-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::542
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
Cc: qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f4as7FRlRh2e

On 4/22/20 7:15 AM, Stephen Long wrote:
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> 
> I'm guessing endianness doesn't matter because we are writing to the
> corresponding 32-bit/64-bit in the destination register.
> ---
>  target/arm/cpu.h           | 10 +++++++++
>  target/arm/helper-sve.h    |  3 +++
>  target/arm/sve.decode      |  4 ++++
>  target/arm/sve_helper.c    | 44 ++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 29 +++++++++++++++++++++++++
>  5 files changed, 90 insertions(+)

Endianness does matter for 32-bit, as we are writing into a host-endian 64-bit
quantity.  I was being over-brief in my earlier reply.


> +        TYPE p0, p1, results[4];                                            \
> +                                                                            \
> +        /* i = 0, j = 0 */                                                  \
> +        p0 = MUL(n00, m00, status);                                         \
> +        p1 = MUL(n01, m01, status);                                         \
> +        results[0] = ADD(a[0], ADD(p0, p1, status), status);                \
> +                                                                            \
> +        /* i = 0, j = 1 */                                                  \
> +        p0 = MUL(n00, m10, status);                                         \
> +        p1 = MUL(n01, m11, status);                                         \
> +        results[1] = ADD(a[1], ADD(p0, p1, status), status);                \
> +                                                                            \
> +        /* i = 1, j = 0 */                                                  \
> +        p0 = MUL(n10, m00, status);                                         \
> +        p1 = MUL(n11, m01, status);                                         \
> +        results[2] = ADD(a[2], ADD(p0, p1, status), status);                \
> +                                                                            \
> +        /* i = 1, j = 1 */                                                  \
> +        p0 = MUL(n10, m10, status);                                         \
> +        p1 = MUL(n11, m11, status);                                         \
> +        results[3] = ADD(a[3], ADD(p0, p1, status), status);                \
> +                                                                            \
> +        memcpy(d, results, sizeof(TYPE) * 4);                               \

There's no need for the result array -- we have already read the inputs, so we
can write back the result straight away.


r~
