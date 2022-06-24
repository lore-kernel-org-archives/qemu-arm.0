Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp500220lft;
        Fri, 24 Jun 2022 10:44:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uIPKWmBXbdHJ3IAQFipRXXX88IE99OIpjkLPc1G4J/hdPbgXQoa3wi49CWiqeC8mJsPrWu
X-Received: by 2002:a0c:e3cd:0:b0:470:5aec:e158 with SMTP id e13-20020a0ce3cd000000b004705aece158mr15822410qvl.42.1656092665993;
        Fri, 24 Jun 2022 10:44:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656092665; cv=none;
        d=google.com; s=arc-20160816;
        b=uSu5xGNo3RozaazC5b1B332lmomdxGF9+dXUWqBafqSBi7hAsWIqM7dOOuuOLNFL8E
         xtOskzOomRPQGMqfkjlAamjj0MlS5urZdBCDvIqf8QZ4otrxx5KBJE7hf8RqNem1vixl
         deXN+DSdcdCTx8/G1CdmYjqNXvq0YBzHFYgBSziNLNywVxpTI7OmaA5wUQ/awt1U1S4a
         TTD3qzlsHNg4QaLb7vyhx/IPiL0/2c5ZEjA1xDtGQd8b8KfGo70QB/iTkqoms+3hhnIT
         Z4RrdRHywD2N9cdRM+76evV7dUFIYk2DrEdmIzjD46e3Ohl5prZjrrj40736cfh0AUwK
         ceBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=sjjPdoko8sxpn3p9mtA9otESRm2IoKbyb1xR6mhm0b4=;
        b=ZD0IQjuEckRmKpN6GLhzm7tJKHlxc5EhiD20wms2zHWlCj94/ahmvg1RdIKiOWVoRG
         LKnJlKakWymPem/pwh4N92kTWyOIvUunhkrEdPbbnm+clrl7qugtAYenA+AlLW6HyBHF
         87xqjHuBDQKqshCt1PAHZ1WlZ4+Q83j3+uJRXSTHipaay1mBOMyjaJztyOWWvXzNgdNt
         iho3q9iea67jPM0E0A49rJsVIo3gjFYy+8dvtgoIyd4nN7nqWvySsTGM7I8CLt3Oe7X7
         w4/BzfgFfHBaAjE7lUduzetCvzBb50RdIu2hdpkTBWR2ri5olUBOYaL3t814Txj4ju3z
         mGoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nfth8KxA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q17-20020a05622a04d100b002ff475984f0si1955569qtx.485.2022.06.24.10.44.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 10:44:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nfth8KxA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4nM1-0004A5-4p
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 13:44:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4nKY-0003Bz-DW
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 13:42:54 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:33463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4nKW-0003XJ-ML
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 13:42:54 -0400
Received: by mail-pl1-x633.google.com with SMTP id n10so2750965plp.0
 for <qemu-arm@nongnu.org>; Fri, 24 Jun 2022 10:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sjjPdoko8sxpn3p9mtA9otESRm2IoKbyb1xR6mhm0b4=;
 b=Nfth8KxAbfbEDIAgcSDVA2zE/+fXWeNA5C7tCucmpqVT6TJKZzoaiWZ17hRFfXh9cO
 DMUFxpaSRkaTtyCQ/TT6VusSaMdLeKpKrZkus0HIk0TxnGFaCAx50Cv0cjTMvozILBCx
 z+eiDCFRntfG/MXIlnwJZfTlKGRP7BmLAMKl22tIJjk8+Ap9SD7dC4vElh86yMh0daNr
 5XFxenEZ5pNrZgpY6FbpyWD94qlHk+taeCHPm1Rlua4K588+0jEnUT3ujnkG2iSQoXBu
 YwSXFuhLOUAXFukJ9P7y1h+VL37yrGwMtkzmZyjW+KX/ZQMf1ixUxvuFX2cZJYl8nkX1
 2Evg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sjjPdoko8sxpn3p9mtA9otESRm2IoKbyb1xR6mhm0b4=;
 b=Mm+FEyyi6ba4X51EQL/ifuPfAo4jEBAwXWHjH7Iw1/Akr/mDLlf9bXfj6g4ppMovR0
 0YpAycahL7pDkvM5N6zZ7BXyjVhk8FK93nuPNfo6amyQpOwIGaPKhqEmk1RSrEl7Ru2D
 wXepNFagiFjYtd9MQ5rutAa8snn9o/NNmADo9jjAMs8i4niOhr4yHO6dxPSnWFOJnnHF
 aulu5Rb9/UCBzxJZwCbrHCtVFmw0F1tPqutJ0zV80r/UuXQqvUthFHT5r13xR/ZKUxM5
 rXExK3QdpN3rxGBLV/+9+Mm30bsAi/8pws+lCcubCOa+e52Sc+IifK+4VU2nQEPHGHRe
 EXLg==
X-Gm-Message-State: AJIora+suksRbvLmj8vKOpnEE9tnjaFPLm6MltUDJnVH/L59q+6Yf0h4
 /26UrjKh/gPSaC6dyqpfQrBG7g==
X-Received: by 2002:a17:902:7c09:b0:16a:370a:e960 with SMTP id
 x9-20020a1709027c0900b0016a370ae960mr213103pll.92.1656092571083; 
 Fri, 24 Jun 2022 10:42:51 -0700 (PDT)
Received: from ?IPV6:2602:ae:1543:f001:b25a:9949:8352:ec5d?
 ([2602:ae:1543:f001:b25a:9949:8352:ec5d])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a170902c64100b0016392bd5060sm2084151pls.142.2022.06.24.10.42.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 10:42:50 -0700 (PDT)
Message-ID: <758aba2d-bf7c-8356-aaa4-5104cde8c54c@linaro.org>
Date: Fri, 24 Jun 2022 10:42:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/2] target/arm: Check V7VE as well as LPAE in arm_pamax
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220619001541.131672-1-richard.henderson@linaro.org>
 <20220619001541.131672-3-richard.henderson@linaro.org>
 <CAFEAcA-zUJV2FdFWM2UdS1BDrh_3Tw1p+vHkMoEn7g1G5kArMg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-zUJV2FdFWM2UdS1BDrh_3Tw1p+vHkMoEn7g1G5kArMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2XkNevPBTVm8

On 6/24/22 09:27, Peter Maydell wrote:
>> +    /*
>> +     * In machvirt_init, we call arm_pamax on a cpu that is not fully
>> +     * initialized, so we can't rely on the propagation done in realize.
>> +     */
>> +    if (arm_feature(&cpu->env, ARM_FEATURE_LPAE) ||
>> +        arm_feature(&cpu->env, ARM_FEATURE_V7VE)) {
>>           /* v7 with LPAE */
>>           return 40;
> 
> I guess this is expedient, so on that basis
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> but as I mentioned in the gitlab issue it's kind of bogus
> that the virt board is doing stuff to a non-realized CPU object.

My first look suggested that the virt board wasn't even setting all of the cpu properties 
properly, so realization might not help.  I meant to go back again and soend more time, 
but that hasn't happened yet.


r~
