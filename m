Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2453071ejb;
        Mon, 20 Feb 2023 09:01:30 -0800 (PST)
X-Google-Smtp-Source: AK7set+WtBLBT71PxvPHcVUowD211pXl+L/XK6QQr3lyO7ZyACEh02cSxAOBElKmG7qzp9k6MF10
X-Received: by 2002:a05:622a:1307:b0:3b9:e683:23d with SMTP id v7-20020a05622a130700b003b9e683023dmr2854805qtk.38.1676912489846;
        Mon, 20 Feb 2023 09:01:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676912489; cv=none;
        d=google.com; s=arc-20160816;
        b=Rj1qe7TfOq4kiJcH1RuDP1WaqT8k9OgaOdeKDWLnf4KO4MwPX31vdpeLtOIQeazubC
         d/XQ69jS1O/iVQGnODolwD6fHdRLodzkmgbuL/MXbaqraiKg0py4pbwRfLnYMur84v1X
         2JDByxgNNe4cgm2FocZBj5/IIQum1Ev+gj/tUYe84GqI+YEAmatwA7kxVMYA8dzkwths
         e2FVVkXufHuZCdYk/GjrimL0xv2IMIvEN1aP/Bx9Vd1vhLs3GWTwMT3eEKnWkCH+Mu5X
         1rDZ+KNGWP4XrVC/e2Af1s+4iNzr0C8y4w7jHssNEUEvgtlkxh1HHmlcIb+2LaTUhdtr
         tlQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=uN7OVPkibDK1mno7CMzh5ooGSAkxsejZNcElFWZs7ow=;
        b=fjlQWuQRs/3s4cwMO2l4+krxrP2bWau8jibUTLTfUvBKprZwlN2Or4UuiQvawI6/2f
         ovd89jcQPSum1ihCqZhE1fojj3GjDHQ+Kx1RxZTZWIwbtwQ3Z/8BLN9SHQ4lFoYxk5XC
         bv3C2j/P1tLTsHtl/xzz8SWxBXZoWNe8eRis8QLEj3ym0hWYnA/ejsZBICm5D6zo1LOB
         IZfPmJaTHnFokMyu04SOkfK2gQ8BChkANwPjDVi3owJjbAl7KBu918xzGIt51do2uncR
         Ptqw3qGFm6xcselq91OLoMk0KdvAnuUmovO/+Ryh/fPhSq4yvLxIQApWxr97hSA6uOtp
         H7qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Iy76agpC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq39-20020a05620a46a700b007332e3cc867si10186410qkb.32.2023.02.20.09.01.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 09:01:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Iy76agpC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pU9XH-0000dO-9d; Mon, 20 Feb 2023 12:01:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pU9Wy-0000MB-Pm
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 12:00:57 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pU9Wv-0001Um-3v
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 12:00:46 -0500
Received: by mail-pj1-x1032.google.com with SMTP id o16so2046761pjp.3
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 09:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uN7OVPkibDK1mno7CMzh5ooGSAkxsejZNcElFWZs7ow=;
 b=Iy76agpCrjhGa/n0haDdtMOZh1uqSpEJ4jtc6o1ZZtJ/l18za1y7yoP4peieVy31XC
 B2Gm8lJ/FUmOk+pZa6WPLHO/qa9s02Z21G2wyDzr5jUIZCcoxBwHD+OKONm2D0b8soU+
 S+srTMWEd+rIUOG47l+uTmpryWPqzUvxVd1W6xdA+oiadFMnZZCvSEE3WP5sqv9W8dps
 gyAEZRRxmFYeK0gKqwZR9b12TAXhtjMmMty0+y5FTNORzKHxYyAeXJnz0qmbeNoQyqTB
 ApEmrObOF1zkZ1l9gCzxx9WYmvBAdTbd+/mK+qO6poeN7kqHaifP5pJ9L6IBSSNgg1zG
 QF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uN7OVPkibDK1mno7CMzh5ooGSAkxsejZNcElFWZs7ow=;
 b=HiPaGATb/3pUEAFEzkAhX5AAT1v7d4R9GWzJsqRCNCAQCneyxwP83vHJC9bJRMe9xY
 U/KnIc5BlXUdlFPHAgg/y6QcQT3mpnFMA3wc+oqxRkrzGrZs3xPR/gnbtQpatR9lhVKA
 3xEDuWQ1ohSX8rPjoVgNVuMm7NJdmyjlFmAmoIgqlsjTiOqOfkYUYpTiuhMfqxnFmz2y
 g+/J7BBJNd1y8QsD31R0OzyrKrt9OzvklxMtV7thldAT2E4j9GOsqTr7eIF1UHVSJoCT
 naQflQ7cTSscgVwBJ4u1GyFmM1CqrzQk1G9IbSPI1zSkkh8ftDFI7S2+72PpA/gJhwj5
 iOJQ==
X-Gm-Message-State: AO0yUKUi5dwPzoimEBSb35hJkApdWWpRK3e5Ni3wCPXL2yhEmX6ZqGM9
 BZ+nRh5o10XApI7heU66HgJW4V2v+MP/5wA7+3E=
X-Received: by 2002:a17:90b:3e86:b0:230:b53a:fa13 with SMTP id
 rj6-20020a17090b3e8600b00230b53afa13mr3526540pjb.44.1676912443513; 
 Mon, 20 Feb 2023 09:00:43 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 l12-20020a17090a384c00b002262dd8a39bsm1030341pjf.49.2023.02.20.09.00.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 09:00:42 -0800 (PST)
Message-ID: <c6d768e4-6f48-b68d-26f0-227d70bce82e@linaro.org>
Date: Mon, 20 Feb 2023 07:00:38 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 14/14] target/arm: Support reading m-profile system
 registers from gdb
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, David Reiss <dreiss@meta.com>
References: <20230214163048.903964-1-richard.henderson@linaro.org>
 <20230214163048.903964-15-richard.henderson@linaro.org>
 <CAFEAcA96L2V0dvnrygnr00PsKkAcko30h+RCKUMcAJGv0utH4A@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA96L2V0dvnrygnr00PsKkAcko30h+RCKUMcAJGv0utH4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: ZMGP02b2FHyP

On 2/20/23 06:02, Peter Maydell wrote:
>> +    /*
>> +     * NOTE: MSP, PSP, MSPLIM, PSPLIM technically don't exist if the
>> +     * secure extension is present (replaced by MSP_S, MSP_NS, et al).
>> +     * However, the MRS instruction is still allowed to read from MSP and PSP,
>> +     * and will return the value associated with the current security state.
> 
> What's "don't exist" based on here? Architecturally MSPLIM, PSPLIM etc
> are banked registers; MRS/MSR let you access the one for the current
> security state, and (if you are Secure) the one for the NS state.

Copied that wording from David.

>> +    g_string_printf(s, "<?xml version=\"1.0\"?>");
>> +    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
>> +    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.arm.m-system\">\n");
> 
> Half of these need to be in org.gnu.gdb.arm.secext.
> These aren't our own XML features we're making up (if they
> were then they would be in org.qemu.something), so we should
> follow the existing precedent about what registers go in them.

Now that you point it out (and I should have checked myself), we are kinda making them up. 
  The only registers within upstream gdb m-system and secext are MSP, PSP, MSP_NS, MSP_S, 
PSP_NS, PSP_S.  All the others are our own addition.

Should all the rest be in a third bit of xml?


r~

