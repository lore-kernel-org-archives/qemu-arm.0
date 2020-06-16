Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2492382lfm;
        Tue, 16 Jun 2020 03:36:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhhrfwDBGu88Rd10uCRNZxzpK1ptF10QIq6PyPzRhcR5lT+CI33LTwDXxBlvqY7MghzQVt
X-Received: by 2002:a05:6902:6cd:: with SMTP id m13mr3036348ybt.29.1592303811613;
        Tue, 16 Jun 2020 03:36:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592303811; cv=none;
        d=google.com; s=arc-20160816;
        b=rjCmnjIi4QpUJz6IFf1Utlm2kUKvevrnXNVi+pc+p0Vej2beATxHZWwR1xM20ZKCCK
         SsR13UwMqmcEKXyo5bR2mCpeCxMOcJAjOKnQOqlJ6Sq/LVVDAfHOtEBMYjmDTW+olJhl
         fgpYQ/dbK9wQ/5wRw35O3zVTMjCyXtuR/xhIQPi4zoIuZQ2W7L2urqf86poIcPiHIlW5
         jS8iSje7FQkXD4rSOD3F/WADpHP0TP93Gd9CW15+C6YCp6H59lnCzoZjRnpYg5tXoUDF
         nCTj6BlstGrDs5jelzyNnYtVojmQBS6g43rcNe+gw44LBfd9ja2hXAkDVQUrttTQp0s8
         F7yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=uAIOzgZ7nMPc6T7qV8EN7IVZnECcL0/YZD66xLZAHos=;
        b=NYBmw+GINfPQtG23zReTyKnMmaDUS3LdIdQeWewMZYwURWNVHUhOcm8TmquSp4+547
         O/vkQ+lf9ff0pd6zcjiSbq6uvu58RnnYGTsi18H4xVzMUHN12t/gtK8HGwJj6B2BRfv7
         dl8mmFAEVDn9D/lnZLrzMGzMrKPpLnPXVNZwuNmMPE/V6Xv/I5rRIgpMWhuTrWw5Oq2W
         norrNfccHtHAtTlJjJF+/4AtKolSeQjPUSjqgqU0/sEyDFyrKw3GyScPGxPR/kwCfzez
         CjzfB3ycCRK2fGgdV0hgjsFt+BxYyXqb7C7mMYk/Av28s4738oTpaU8Zqdccx1avSNxa
         bEnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=taChZWeh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18si16156204ybs.368.2020.06.16.03.36.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 03:36:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=taChZWeh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:44916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jl8xX-00055s-0Q
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 06:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jl8xD-0004kM-Qp; Tue, 16 Jun 2020 06:36:31 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:38612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jl8xC-0002Xa-C1; Tue, 16 Jun 2020 06:36:31 -0400
Received: by mail-wr1-x442.google.com with SMTP id e1so20244009wrt.5;
 Tue, 16 Jun 2020 03:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uAIOzgZ7nMPc6T7qV8EN7IVZnECcL0/YZD66xLZAHos=;
 b=taChZWehps6pmgOOZ6Mf7dINhGxKhXRzrQUkk+KTv5GNFtdmjlh5DbPn66fzunT1Ad
 rREVTHzp6zRCNRHiMrarD0xYE0TOu4jL7F45yOkXJcbbWudbPr49QsPu9Pxvu28exEbB
 68uEpkjie7Y2TaY4T2Wx7tubDkv3nLC1kzAVJKIL7IaE9THDf0EHVLq65W4e2zeFWpKW
 CH9qO7UaxT/RR3SFpdWChoQuvY+4Bme0F8oboAY+FL7JQOxt2lr5NcSpTq1P0skn4kMj
 AbgCL9+wOUgq3iUwNQ8qjqCm4/1uZDZeoKqkBj1gLQ+Nkgcid7ZTnhv/Q+Kc1jdUiJn1
 9ygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uAIOzgZ7nMPc6T7qV8EN7IVZnECcL0/YZD66xLZAHos=;
 b=Jbm9bXTLEpJKVb7vsaljhT02v+96bqI1nniW9ArDeB4JvoOsiqYlKBYc+QwOaLYPB4
 6bf/APHT1bn7535E+nZl982ErV3JTh/DmJ/7ocKtFba9g6csE6WN8HeS94hogeJhDjD+
 qU3kbN5Puoff/R4u9WcnUUPt2hXbGjSU0dbR7cGhOzopBv28KJfsp3/ROuv7WxFTinYM
 mgGbpoPufVO471czleS1EuIeemwo8faFgtZgtRgsTQWG3CmkW2+gaG1o/HMBRBfyWEiW
 koib6xPV63gpayaZfzRr5RtKG4E5waXUUkUXIi/gdHreZOHUS+XpJAr8cznMJmq5aYoF
 U5Ng==
X-Gm-Message-State: AOAM530JatXupFogiuHd4KzSZYZaq6nOcIePIFSLmsHeY1vW5ZENmVtn
 H7PB3m+vQ3iPkbtmgM0BJhRWgxdO
X-Received: by 2002:adf:e744:: with SMTP id c4mr2518164wrn.71.1592303788343;
 Tue, 16 Jun 2020 03:36:28 -0700 (PDT)
Received: from [192.168.1.41] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id w15sm3413074wmk.30.2020.06.16.03.36.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2020 03:36:27 -0700 (PDT)
Subject: Re: [PATCH 6/7] hw/arm/mps2: Map the FPGA I/O block
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200616063157.16389-1-f4bug@amsat.org>
 <20200616063157.16389-7-f4bug@amsat.org>
 <CAFEAcA8HKmMpgZMTuL6PSQNd2gy8h8HSvu6GwvTy8_h93teHjg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c680c735-0a1f-3f74-13f9-bf289da0d57d@amsat.org>
Date: Tue, 16 Jun 2020 12:36:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8HKmMpgZMTuL6PSQNd2gy8h8HSvu6GwvTy8_h93teHjg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Esteban Bosse <estebanbosse@gmail.com>,
 Joaquin de Andres <me@xcancerberox.com.ar>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zi5vFNnJwCDl

On 6/16/20 12:26 PM, Peter Maydell wrote:
> On Tue, 16 Jun 2020 at 07:32, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
> 
>> @@ -337,6 +339,11 @@ static void mps2_common_init(MachineState *machine)
>>
>>          sysbus_create_simple("versatile_i2c", i2cbase[i], NULL);
>>      }
>> +    sysbus_init_child_obj(OBJECT(mms), "fpgaio", &mms->fpgaio,
>> +                          sizeof(mms->fpgaio), TYPE_MPS2_FPGAIO);
>> +    object_property_set_bool(OBJECT(&mms->fpgaio), true, "realized",
>> +                             &error_fatal);
>> +    sysbus_mmio_map(SYS_BUS_DEVICE(&mms->fpgaio), 0, 0x40028000);
> 
> AN385 TRM isn't entirely clear but I suspect that you need to set
> the FPGAIO's prescale-clk property because the default of 20MHz
> isn't what the AN385 runs at. The FPGAIO model's default is written
> to match the AN505, which is 20MHz, but AN385 and AN511 are both
> 25MHz:
> https://developer.arm.com/tools-and-software/development-boards/fpga-prototyping-boards/mps2

Ah I only checked for the I/O register. I'll check the clocks.

> 
> thanks
> -- PMM
> 
