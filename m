Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2847859ejt;
        Mon, 19 Jun 2023 07:45:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6KzarHqF/cOG0IF1bsK6v+QZDRj9K5MO1vcxxY6OV1G0Q8BOPZoXLX/67V5/996hfQNr/4
X-Received: by 2002:ac8:4e88:0:b0:3f3:a0c0:cd6f with SMTP id 8-20020ac84e88000000b003f3a0c0cd6fmr14133941qtp.9.1687185915239;
        Mon, 19 Jun 2023 07:45:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687185915; cv=none;
        d=google.com; s=arc-20160816;
        b=TpG4Vl6KL8vnbgOzXThPMAyZKe7m0iVEnHXn5V/gdP/XC5Lpnj2q78Ql1qCC9sADDx
         z1LeJquEbdInlFOEQAx51KUB9ekGwd3PMDqaqQaAxVfM1TErcLsWru6cjfpDng8pWBgd
         c0gE+ZPo/8/OuBh8CfXXeLuzvElFJOPz2QzKmOGzPVwZ4wIgtNEaKuKtMg4ui9JkoIbe
         Dvj+P5f0ayraHksQUcWzud35w6OpDmF1uFMZ5b6GDOG8Wwy8fdsJ0vJbZpB1qPmRcKPd
         1eP1yWjX1Gy6zW6ArQCdLDZ91oH6Y//cvLQMvdL+zVNXkZyh5/YYTtsZCcpPnzUmzvxG
         lQ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=OGdtDTFYiQTDBFYfZ4oBFyIXPm72bZOjt2mRUQqE67k=;
        b=PvdGWwyeDGg6zJmcT65pCGLPdZsrcVc6/82HOS4dipI4j+TiRR4thRaAXuLI7Z6/tc
         ICZ+/RKG2MesKQy8bZmnUrOMRmt27kI2/oCq3lnKDSKJMgLupPaZbCE8U/k1OcWzx7pW
         H4bdVchgPsjLRogaW+3Pf5c4MgNcCUHlcjEDvvKMRImLuot6Ht/msgG2uwbJ1ehAuIaC
         qCwKy47Wv+JM1oi/GCc74P/ls4GYZQW+lDY6/bDQfTbe549Hczhy35B2pIwqVa3F3oDV
         Fx9dmvINSZBm7r1sSowKf9z8aQ3oxxxlrOBLH9j1vrtcaaLs57R/7Mp32ug0Nq2/AaLX
         ndUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p44dEAVp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r18-20020ac85c92000000b003f6baac3610si13794520qta.377.2023.06.19.07.45.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 07:45:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p44dEAVp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qBG7b-0001OI-Lt; Mon, 19 Jun 2023 10:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBG7a-0001O1-Cl
 for qemu-devel@nongnu.org; Mon, 19 Jun 2023 10:44:46 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBG7Y-00079y-LT
 for qemu-devel@nongnu.org; Mon, 19 Jun 2023 10:44:46 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f87592ecaeso803588e87.0
 for <qemu-devel@nongnu.org>; Mon, 19 Jun 2023 07:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687185881; x=1689777881;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OGdtDTFYiQTDBFYfZ4oBFyIXPm72bZOjt2mRUQqE67k=;
 b=p44dEAVpdmMaSE0FUIU8AqOaEN3P6W27jonTLs8KZVTgtdnXFgDlZkRV1B0rdujwxM
 j679mlYtKoy3VPb6Qz/GQMhJWpEuq8U3qy7bBUiys9INPbfjNTFCy2RRqQ7Jm5twdsYT
 EOGQz1jHBtUgLJNC2rwb8LZ5DHDguSuOCKj7mgwnM1znPALQH/pCKQuYTNRXY/yROHj/
 SiztD3d2UbaZD3XcIS4zO0RRQLoCT69Tl3EaNhcc0g72yyKRKdk3uNDOcTxZt2u9TXi9
 dIY4uyDAJ9XHqZpwTZQiCGsrqVHpSO2Te2TcI2y5UDKahSnBaQ3ZzFHblmyjqeG/kjNX
 uWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687185881; x=1689777881;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OGdtDTFYiQTDBFYfZ4oBFyIXPm72bZOjt2mRUQqE67k=;
 b=BS07tDGAMyEwiAn7qGnY3RKh+9CmvlgGOxz28L2CLA5J3E3zpIxBXBu0LGbmDD+Peg
 VYcQndZw30UOw0qFXEiia3gUHW3oHBzVj8hdzRhs3zcMPP75u6NRmgrFn0YPpVuSORIP
 BqI/WxFgV3MIA7+dTogHGIqx54sOxjYDkTXV9xII0zcAHONPRBQswx4dpNfD4AiWkfG4
 c5bkMzQCth/16hXXAsyeB8/FRLvT0VEfLDDyu39QDzE5CmhSytvvhr2tf13ZNAetbHPn
 dKh21jtl8Ce6XAdnohPtYJz2wcHOGtZIX4+5CJKjUDArUD3ijSQ13tFK9mHB73plrMY4
 j3BA==
X-Gm-Message-State: AC+VfDyvEIakaURlfAA/z6fKkTAL8CgOqXHdgNJ0Ojk3I9mk4U4+J+Hb
 4tN57/wkzlKUblKL35zs7EzMdg==
X-Received: by 2002:a05:6512:1319:b0:4f8:6625:f2ca with SMTP id
 x25-20020a056512131900b004f86625f2camr2902268lfu.61.1687185881121; 
 Mon, 19 Jun 2023 07:44:41 -0700 (PDT)
Received: from [192.168.69.129] (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 c6-20020a7bc846000000b003f8fb02c413sm9538346wml.8.2023.06.19.07.44.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 07:44:40 -0700 (PDT)
Message-ID: <b46c3dc4-5017-97a3-3935-f8e1c6a7e72d@linaro.org>
Date: Mon, 19 Jun 2023 16:44:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 02/38] util: Add cpuinfo-ppc.c
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-3-richard.henderson@linaro.org>
 <ed63d01a-4903-a233-ac80-6e8d10411a02@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ed63d01a-4903-a233-ac80-6e8d10411a02@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AT0LTCiNhaUS

On 6/19/23 12:37, Philippe Mathieu-Daudé wrote:
> On 9/6/23 04:23, Richard Henderson wrote:
>> Move the code from tcg/.  Fix a bug in that PPC_FEATURE2_ARCH_3_10
>> is actually spelled PPC_FEATURE2_ARCH_3_1.
> 
> This is rather confusing.
> 
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   host/include/ppc/host/cpuinfo.h   | 29 ++++++++++++++++
>>   host/include/ppc64/host/cpuinfo.h |  1 +
>>   tcg/ppc/tcg-target.h              | 16 ++++-----
>>   util/cpuinfo-ppc.c                | 57 +++++++++++++++++++++++++++++++
>>   tcg/ppc/tcg-target.c.inc          | 44 +-----------------------
>>   util/meson.build                  |  2 ++
>>   6 files changed, 98 insertions(+), 51 deletions(-)
>>   create mode 100644 host/include/ppc/host/cpuinfo.h
>>   create mode 100644 host/include/ppc64/host/cpuinfo.h
>>   create mode 100644 util/cpuinfo-ppc.c
>>
>> diff --git a/host/include/ppc/host/cpuinfo.h b/host/include/ppc/host/cpuinfo.h
>> new file mode 100644
>> index 0000000000..7ec252ef52
>> --- /dev/null
>> +++ b/host/include/ppc/host/cpuinfo.h
>> @@ -0,0 +1,29 @@
>> +/*
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + * Host specific cpu indentification for ppc.
>> + */
>> +
>> +#ifndef HOST_CPUINFO_H
>> +#define HOST_CPUINFO_H
>> +
>> +/* Digested version of <cpuid.h> */
>> +
>> +#define CPUINFO_ALWAYS          (1u << 0)  /* so cpuinfo is nonzero */
>> +#define CPUINFO_V2_06           (1u << 1)
>> +#define CPUINFO_V2_07           (1u << 2)
>> +#define CPUINFO_V3_00           (1u << 3)
>> +#define CPUINFO_V3_10           (1u << 4)
> 
> Could we define as CPUINFO_V3_1 ...
> 
>> +#define CPUINFO_ISEL            (1u << 5)
>> +#define CPUINFO_ALTIVEC         (1u << 6)
>> +#define CPUINFO_VSX             (1u << 7)
> 
> 
>> -#define have_isa_2_06  (have_isa >= tcg_isa_2_06)
>> -#define have_isa_2_07  (have_isa >= tcg_isa_2_07)
>> -#define have_isa_3_00  (have_isa >= tcg_isa_3_00)
>> -#define have_isa_3_10  (have_isa >= tcg_isa_3_10)
>> +#define have_isa_2_06  (cpuinfo & CPUINFO_V2_06)
>> +#define have_isa_2_07  (cpuinfo & CPUINFO_V2_07)
>> +#define have_isa_3_00  (cpuinfo & CPUINFO_V3_00)
>> +#define have_isa_3_10  (cpuinfo & CPUINFO_V3_10)
> 
> ... and have_isa_3_1 instead?

I suppose we could, but they all line up this way.  :-)

r~

> 
> Otherwise,
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 

