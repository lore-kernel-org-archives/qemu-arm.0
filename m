Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp30870lfg;
        Sat, 23 Jul 2022 14:06:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ttBkWOXXLDZvBzVsezR6zzxN0z5L/1esMjc15N3iLsq8xow2H94u6yZmMJfdT1x0IxQDkh
X-Received: by 2002:ad4:4ee8:0:b0:473:fb95:1a3a with SMTP id dv8-20020ad44ee8000000b00473fb951a3amr4944254qvb.14.1658610392960;
        Sat, 23 Jul 2022 14:06:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658610392; cv=none;
        d=google.com; s=arc-20160816;
        b=U0wuHLD6iVk5M10hqSji+uSVkXFTRNlowTWohUs2BDhE869PVY21empNSXl/n3+WNV
         wTbvqi2ucZHCXC0z6z2WBmtJjYIhkh/qSFpFder3/WqU7pXkAGx5xWj+zpTJHqAsqA3I
         mK2ewJw/hK7neDB5OgKu1kJ271yjQmUh9nK+zysX+W6nG4a864+2+OMCW7NtfbOfAsNF
         k0EHSED6lwnm4xlaGdOjv/HcIivv+6cpfWziqsvJjw2NYlSj+AzhoNlGZlKZm/TNBGjA
         KAME4nT0hQ+jlKx5GBKd4p0u8+5Ucuex1M/WHja8ralxAiPgd0yR/JUuDIwNDQ3vLZbN
         Gwew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=rohbLmEm8UkhHy18i0eWiqAGC1aFs1Qo7877QmYz6G8=;
        b=eohhmAs9aRsgbcZBF+0UpxGEsa/TwAOQrfoYeclbQEcT6mjamT5GO3F0lmXBs5OWJg
         9oAkbvslDby9qajfuM4u8WAhTNoFlHukNqtt8BgCAlMMsrJ9V/wEF4QHdyvi0goRwTMQ
         zcUecA3KBiZ3hqtBnCZ7k1CQrm+qGNoGRRGs5U65fg2SPpbpbnJBHX7CrZn8yJM0T22k
         eWk4LyO7W4ZGeVOlNNOdo6AEQdZtC/a+ViD883jMrXBH4rJwb1njyiT+IeVqfWkhsuOS
         zQZNVw0FGHeL5Ld9fC7vvpP7WtyrLcy+0FLhxhh34piwv9B4B6HRn9revWHLIyIAG3BF
         GorQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=inZ5QzUS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 74-20020a37084d000000b006b5f9b7ac84si4556819qki.365.2022.07.23.14.06.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 Jul 2022 14:06:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=inZ5QzUS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oFMKW-0003MF-GZ
	for alex.bennee@linaro.org; Sat, 23 Jul 2022 17:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oFMIz-0001rg-73
 for qemu-devel@nongnu.org; Sat, 23 Jul 2022 17:04:57 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:36394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oFMIw-0001jv-J0
 for qemu-devel@nongnu.org; Sat, 23 Jul 2022 17:04:55 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 t3-20020a17090a3b4300b001f21eb7e8b0so10395520pjf.1
 for <qemu-devel@nongnu.org>; Sat, 23 Jul 2022 14:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=rohbLmEm8UkhHy18i0eWiqAGC1aFs1Qo7877QmYz6G8=;
 b=inZ5QzUSiu2VWz1WkqQP6Ym813leWRcVmZXGuQw9VH2eAf86iJ6hImA7sSzcyRaAxz
 9TMKWhf4zuypV+dV7kuxWFhvD6rf72v1f9IiP2sLy0Cwx8ynWdFDXEfkZkgtKjRoiK8a
 5QoWjnMMqWCL0smtycjBK4jUOXcNtwlnsQxg9ZIyMwRBiME7YfTL7jbIaWh+pFBuZb5H
 /2oAE83hNVPanetT86jXMPO22QIz0MN/OxMBnVG5OSvrpiBDG9wKI/X+zwDquCf/4BRf
 1z+LPD15+Dwnmky1QuBQrhCf4k/rHmPs+hAle8J3MdSVwaZkt478/jIfpYVPvuKx1ZiK
 aTIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rohbLmEm8UkhHy18i0eWiqAGC1aFs1Qo7877QmYz6G8=;
 b=i5T6k1ZRaFO/OEmaM1fQNPGtVQ7iv8fFeBfHGwQQBdy9yJ9kcnvC31PTI5G9ALGkmm
 WrJsDKOvSgaSSOjGJml3OUdWXjcT1BpQm0UgrK65KYPWLOrGetYDENQ/eucOGk8/HQvb
 4zmpuUIf3NN9cNVh8ncakUBuxLOJokZ7DHgJh65w+aId3ntvkCLvYhwWGBaP5z8aWla3
 3ba2w1/bq3dV39r579FC0VJcl14cBYZeekgAy7yh0aoBuJAC53Q3N2K/SJcdfufUA1D0
 7/4yFN78KC8FKytSkloJopBEtmLkV7PB+6i1ebWMXh3snftF9W/deBg95xDHA40ecxap
 eiCA==
X-Gm-Message-State: AJIora9UE9EOSW9t/IMi9HqScntYFt7hRdEPTeV2Uun8mRd7ZdnYpWOY
 0zn5OTk/Sm62TlrHuUpPqez41Q==
X-Received: by 2002:a17:903:249:b0:16b:9cf3:596e with SMTP id
 j9-20020a170903024900b0016b9cf3596emr5752412plh.60.1658610292921; 
 Sat, 23 Jul 2022 14:04:52 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:be5:d810:1e03:c4?
 ([2602:ae:1549:801:be5:d810:1e03:c4])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a17090a024200b001efff0a4ca4sm5756400pje.51.2022.07.23.14.04.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 14:04:52 -0700 (PDT)
Message-ID: <ebbc42d4-74b3-e8c8-864f-5f32ce90eab1@linaro.org>
Date: Sat, 23 Jul 2022 14:04:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/arm: Add MO_128 entry to pred_esz_masks[]
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220718100144.3248052-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220718100144.3248052-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iFgDsV8wSBKg

On 7/18/22 15:31, Peter Maydell wrote:
> In commit 7390e0e9ab8475, we added support for SME loads and stores.
> Unlike SVE loads and stores, these include handling of 128-bit
> elements.  The SME load/store functions call down into the existing
> sve_cont_ldst_elements() function, which uses the element size MO_*
> value as an index into the pred_esz_masks[] array.  Because this code
> path now has to handle MO_128, we need to add an extra element to the
> array.
> 
> This bug was spotted by Coverity because it meant we were reading off
> the end of the array.
> 
> Resolves: Coverity CID 1490539, 1490541, 1490543, 1490544, 1490545,
>   1490546, 1490548, 1490549, 1490550, 1490551, 1490555, 1490557,
>   1490558, 1490560, 1490561, 1490563
> Fixes: 7390e0e9ab8475 ("target/arm: Implement SME LD1, ST1")
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h           | 2 +-
>   target/arm/translate-sve.c | 5 +++--
>   2 files changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
