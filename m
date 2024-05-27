Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp3103803ejb;
        Mon, 27 May 2024 04:20:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVWlOxcM6HNH6tOaQix0gTXBlJOX7rTIjCYJxBelidXNpRzTmZqGZByxWruOQ4GJ52So3RnAmNM7/KfKWJExsX44d9Q8QRx
X-Google-Smtp-Source: AGHT+IFwViJJsraPRZyOpZXYf/gPCmZ7J9LAgdT6JQjofpBu1QF7byfOBgHMmKQxy3syfEp7yFdo
X-Received: by 2002:a05:6214:2b9a:b0:6ab:7067:6f6d with SMTP id 6a1803df08f44-6abcd0dc783mr95724096d6.56.1716808813091;
        Mon, 27 May 2024 04:20:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716808813; cv=none;
        d=google.com; s=arc-20160816;
        b=BMOhnygeUeHD2p9ARpqy2sLbza+KfArkzLY6sRk7YSSrJtLtW5W1GeG4VPqvc9yrjo
         PRbk4BvQaXuJ8stLhFWHNOMmW6wad+IDLObRD8nNqZSJW3d4R90F8P6biB1Tl3QW7Vj3
         9Uvtwc3jjIrr0CAcvKg11ZJdN6dgymOXTqGx1aJicYRuWiv8JJ1geVS90crNPD1Tajhf
         8huD3Nkf7uHeeSQgpqXovycCDFrsFtywLwQFSnAdiIT6+RzFjHNOr8PYkgIhryb5exaR
         wxw+s/0gqU7pgg/MApSxhE8OjllfJEG0C66eZYW/Kq3NjWRmg+Yg376jwHrETYcYwLLu
         M2TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=szkupYVBKbYv7xcCjorM97AbnR3gunaTs2vwWKTbnLw=;
        fh=GVpuD+f5VFhxVLzAQQCzEs7iUI2e/2dlSxojvjPsRcA=;
        b=G4iLM7uV5FH3bnu/VwjwIiY01bjABDGE/lH+d7f81Y5ftwa1jqdhAUiUgqPI+zYxzl
         SAhq4Ov8F3HPoLnDmRRdrLK/vwNeFHTfmWxcy7otIEcIv/gUpRT7Vv77E7MXPKfu5zGh
         NoEaM56x0HF8eM7pOwX+E74HCpLMQCTjTH974o12P5SSdUuSVgZDtGchEls4e4P4JgfA
         x/XU4xxzi9lay0nI/UjHLnT+pn5yvxN8UnUdoFSanzoHiTCCtaQ7MWsi+MI/F6kZGHZv
         JBXUJrnP39E4hLQEMgM3n+d65/w3jrFPEyPjVdpE/qB2FYKiFap5661CY+PzLo2SyK8I
         f8QA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac1625f56bsi80096656d6.375.2024.05.27.04.20.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2024 04:20:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBYNy-0006Cq-Rp; Mon, 27 May 2024 07:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=e5bn=M6=kaod.org=clg@ozlabs.org>)
 id 1sBYNx-0006Bs-Sz; Mon, 27 May 2024 07:19:25 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=e5bn=M6=kaod.org=clg@ozlabs.org>)
 id 1sBYNt-0006uU-Sv; Mon, 27 May 2024 07:19:25 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4VntSw62Whz4x1Q;
 Mon, 27 May 2024 21:19:12 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4VntSQ1Bc8z4wb0;
 Mon, 27 May 2024 21:18:45 +1000 (AEST)
Message-ID: <b01604af-5fa7-469f-98e9-c23b3a668a2e@kaod.org>
Date: Mon, 27 May 2024 13:18:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/16] aspeed/sdmc: Add AST2700 support
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240527080231.1576609-1-jamin_lin@aspeedtech.com>
 <20240527080231.1576609-6-jamin_lin@aspeedtech.com>
 <9476cfcc-5a7c-4b76-a684-1361463bd161@linaro.org>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <9476cfcc-5a7c-4b76-a684-1361463bd161@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=e5bn=M6=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JN7nVCaLYy1D

On 5/27/24 12:24, Philippe Mathieu-Daudé wrote:
> Hi Jamin,
> 
> On 27/5/24 10:02, Jamin Lin wrote:
>> The SDRAM memory controller(DRAMC) controls the access to external
>> DDR4 and DDR5 SDRAM and power up to DDR4 and DDR5 PHY.
>>
>> The DRAM memory controller of AST2700 is not backward compatible
>> to previous chips such AST2600, AST2500 and AST2400.
>>
>> Max memory is now 8GiB on the AST2700. Introduce new
>> aspeed_2700_sdmc and class with read/write operation and
>> reset handlers.
>>
>> Define DRAMC necessary protected registers and
>> unprotected registers for AST2700 and increase
>> the register set to 0x1000.
>>
>> Add unlocked property to change controller protected status.
>>
>> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
>> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
>> Reviewed-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   hw/misc/aspeed_sdmc.c         | 190 +++++++++++++++++++++++++++++++++-
>>   include/hw/misc/aspeed_sdmc.h |   5 +-
>>   2 files changed, 193 insertions(+), 2 deletions(-)
> 
> 
>> diff --git a/include/hw/misc/aspeed_sdmc.h b/include/hw/misc/aspeed_sdmc.h
>> index ec2d59a14f..61c979583a 100644
>> --- a/include/hw/misc/aspeed_sdmc.h
>> +++ b/include/hw/misc/aspeed_sdmc.h
>> @@ -17,6 +17,7 @@ OBJECT_DECLARE_TYPE(AspeedSDMCState, AspeedSDMCClass, ASPEED_SDMC)
>>   #define TYPE_ASPEED_2400_SDMC TYPE_ASPEED_SDMC "-ast2400"
>>   #define TYPE_ASPEED_2500_SDMC TYPE_ASPEED_SDMC "-ast2500"
>>   #define TYPE_ASPEED_2600_SDMC TYPE_ASPEED_SDMC "-ast2600"
>> +#define TYPE_ASPEED_2700_SDMC TYPE_ASPEED_SDMC "-ast2700"
>>   /*
>>    * SDMC has 174 documented registers. In addition the u-boot device tree
>> @@ -29,7 +30,7 @@ OBJECT_DECLARE_TYPE(AspeedSDMCState, AspeedSDMCClass, ASPEED_SDMC)
>>    * time, and the other is in the DDR-PHY IP which is used during DDR-PHY
>>    * training.
>>    */
>> -#define ASPEED_SDMC_NR_REGS (0x500 >> 2)
>> +#define ASPEED_SDMC_NR_REGS (0x1000 >> 2)
> 
> This change breaks the migration stream.

Do you mean migration compat ? We never cared much about that
for the Aspeed machines.

Thanks,

C.



> 
>>   struct AspeedSDMCState {
>>       /*< private >*/
>> @@ -41,6 +42,7 @@ struct AspeedSDMCState {
>>       uint32_t regs[ASPEED_SDMC_NR_REGS];
>>       uint64_t ram_size;
>>       uint64_t max_ram_size;
>> +    bool unlocked;
>>   };
> 

