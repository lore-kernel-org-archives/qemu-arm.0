Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp273909njc;
        Thu, 18 Jul 2024 23:25:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUhxD3YCN80Gp2dhlQUjKwHizsnE2Y3bBqA3RfXtyxjaqfszrMa1UVepvK9XX0k79n8eFTTwmm4ZF9QlvHCAPtcz2xYaH4S
X-Google-Smtp-Source: AGHT+IGsNs5u7aOqbz9G6DRtn2hNhoJtlyOILMXQD24n2f7IiP3RFhiEwCfTUCX3B4VNkOz88geS
X-Received: by 2002:ac8:5d8b:0:b0:446:5931:ac55 with SMTP id d75a77b69052e-44f96a165a2mr32046471cf.3.1721370299992;
        Thu, 18 Jul 2024 23:24:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721370299; cv=none;
        d=google.com; s=arc-20160816;
        b=klkYyeNr6tJeF1qa2LQX5i/SRJDJSC3yirqWZtPqg6/MnB6rlQjZundhlccYk5XcCV
         IN+LqZNh++F2riB1MYueCEEAtjkSmmaDe8+OiV4iNXNdkUnHYCKssiLzdMjSP5oR1o3p
         +Apc7//8DMxeZuNm+hG2KEt57nfur1X6tHia65tLdBHo6RWhtXrkGcd2M5u29a39bkg8
         1PGqjXBcQQE5If6v+ZgNHVtsIJfcsVtgoODIrHdjzMLrqSfsgCt7oAzdwbRVMT58vVdb
         5fus0IwBTyFViGUf2QZuFJTN/ZtCTYuz/qyCDTCGowVdL6Y6mFv/yrAWP991MH2rr6ff
         4t5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id;
        bh=wcw3S3gKr2vTEd19OMnbiWb6L903/aDfOU+9HlF3mG4=;
        fh=vpv4dibz543bPaX9Fq9ZvnJ9J5iREE2VOWA/tGZmS3U=;
        b=AyA/N3Ff10U3L0SfXBacCKkQjVc69EVM/2rdpA4FizjE6jSueZrUX/EsDQLxLN2NCc
         h7z96OuND0uzPw1pb17ymuSqpp2hxkHKbRFt5byun8jRpqd+NaTqHV9lNljpIbVPf2KP
         Ot7vkHlr2Kaj2LrQvjbyF4ZeKQB1dEX1tNcmvnEIu7u5hgVr/Pp/kzESoiEUmcbZE6Xv
         lyUIGGuAbXPg/hLk+84L7GdMuOYXW9EzODlxTrDdn73VQfWWEOtadlGs2//jB2zC43j6
         CIexoNpMBf8dbLa9rlKBfqZrSVkqhuRvX2zytNryYxcEmJ+PlyNNb0FgAw/Azgs4cmiE
         qndA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9ccfc041si9576221cf.128.2024.07.18.23.24.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jul 2024 23:24:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sUh2u-0002F9-FC; Fri, 19 Jul 2024 02:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=vGMz=OT=kaod.org=clg@ozlabs.org>)
 id 1sUh2t-0002Al-Du; Fri, 19 Jul 2024 02:24:47 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=vGMz=OT=kaod.org=clg@ozlabs.org>)
 id 1sUh2r-0002Ig-Mm; Fri, 19 Jul 2024 02:24:47 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4WQKQc72XKz4x04;
 Fri, 19 Jul 2024 16:24:40 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WQKQY0DVGz4w2K;
 Fri, 19 Jul 2024 16:24:36 +1000 (AEST)
Message-ID: <128fad78-75a0-405d-9d5c-350064167573@kaod.org>
Date: Fri, 19 Jul 2024 08:24:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/15] support ADC and I2C for AST2700
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240718064925.1846074-1-jamin_lin@aspeedtech.com>
 <df6ee32d-f404-4f24-9dae-e755e5566d5f@kaod.org>
Content-Language: en-US, fr
In-Reply-To: <df6ee32d-f404-4f24-9dae-e755e5566d5f@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=vGMz=OT=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: wrLwfhaCQJbh

On 7/18/24 18:18, Cédric Le Goater wrote:
> On 7/18/24 08:49, Jamin Lin wrote:
>> v1:
>> 1. support ADC for AST2700
>> 2. support I2C for AST2700
>>
>> Jamin Lin (15):
>>    aspeed/adc: Add AST2700 support
>>    aspeed/soc: support ADC for AST2700
>>    hw/i2c/aspeed: support to set the different memory size
>>    hw/i2c/aspeed: support discontinuous register memory region of I2C bus
>>    hw/i2c/aspeed: rename the I2C class pool attribute to share_pool
>>    hw/i2c/aspeed: introduce a new bus pool buffer attribute in
>>      AspeedI2Cbus
>>    hw/i2c/aspeed: support discontinuous poll buffer memory region of I2C
>>      bus
>>    hw/i2c/aspeed: introduce a new dma_dram_offset attribute in
>>      AspeedI2Cbus
>>    hw/i2c/aspeed: Add AST2700 support
>>    hw/i2c/aspeed: support Tx/Rx buffer 64 bits address
>>    hw/i2c/aspeed: support high part dram offset for DMA 64 bits
>>    aspeed/soc: introduce a new API to get the INTC orgate information
>>    aspeed/soc: support I2C for AST2700
>>    aspeed: fix coding style
>>    aspeed: add tmp105 in i2c bus 0 for AST2700
>>
>>   hw/adc/aspeed_adc.c         |  16 ++
>>   hw/arm/aspeed.c             |  31 +++-
>>   hw/arm/aspeed_ast27x0.c     |  65 +++++++
>>   hw/i2c/aspeed_i2c.c         | 340 ++++++++++++++++++++++++++++++------
>>   include/hw/adc/aspeed_adc.h |   1 +
>>   include/hw/i2c/aspeed_i2c.h |  34 ++--
>>   6 files changed, 418 insertions(+), 69 deletions(-)
>>
> 
> 
> 
> Applied 1-2 to aspeed-next.


Applied 3,5,6,14 to aspeed-next.

Thanks,

C.


