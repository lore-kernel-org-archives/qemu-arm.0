Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8330231ejb;
        Wed, 4 Jan 2023 14:52:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXueRkqsLuGAw0U/ClUpNRQYKvN5R87e2vHEBtWD4DFt8QM8N0T39b0BNtawVLujNj4Z4jjW
X-Received: by 2002:a05:6214:154a:b0:4c6:5753:cf88 with SMTP id t10-20020a056214154a00b004c65753cf88mr69674985qvw.7.1672872734219;
        Wed, 04 Jan 2023 14:52:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672872734; cv=none;
        d=google.com; s=arc-20160816;
        b=u8RQZhRHFNUvEfunhvPB31tQPdjL2qD4tGAr1Wg2euUkwOwi9pS7fEhrPrG1YTGOxd
         GYn2O3RmvZBmdQfBhGcY+9jQ0z5BiveNNziZz5O1beTIppueGbRsf4nT0ZZ+sXS6WlI/
         z+RlgPKf/+cPeGLWZicYJs5yniPAthz5gxWmnersUr6WCX16nTPNc57cugbT5CDQl8Ba
         SpunStXmUsGJCOdmJ1U/CMti5P87ZvsC6v3V3KsNfb4eLTmWStMWfFtm/UKhow1s+7/g
         j1W01Tf6S/nXzMPHBRKro6m8akKd7BgTktQ7cdvstj/6YWXgWC55HW434jvbukE3oOta
         1HOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=YLCdzstc6Zlv2b8ffgqTCfh63gR16uK1if4Ir20SGyw=;
        b=072BqO/iDTfOMdxT0cLueeIegKvh5bZ99IH4gRcdaDJAWwEEZI/QYA8bLEpS1oGhew
         v5ECKMJOT5AxrnCwrBDS1vWE0nJu/Dm77Gs/3TzqnqL9FmrQB7VncTu/+3yzq2wPpk7Y
         kcfG1lVvsiB5930CP4Wn5nmgQPqqyVjVNNW8NdQZLQZ9Yo6lo8OsDZpTGsj/2pJOixvP
         tOjSGOTCpZoL4QHGjWIYqSr8e74Gn79/MeAjvOMCcX7HowddnN3Zs5UpF9Z3qWmr0nxm
         GuwPwAaom62a7y3DWFF9X3Wx5//JDLHfNqWByLxVUKO/B3KliFmgCy1qNZqmyW0MtmUd
         gz4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oLRRiJkE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u17-20020a05620a431100b006eec658c493si15502440qko.423.2023.01.04.14.52.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Jan 2023 14:52:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oLRRiJkE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDCLx-00026e-TW; Wed, 04 Jan 2023 17:35:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDCLr-00025X-6H
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:35:17 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDCLo-00056s-RG
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:35:14 -0500
Received: by mail-ej1-x631.google.com with SMTP id tz12so86121537ejc.9
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 14:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YLCdzstc6Zlv2b8ffgqTCfh63gR16uK1if4Ir20SGyw=;
 b=oLRRiJkEMDZMLdoSSGmyl774jkUdHj7KXA4FKmO1Qpy018zranziroO62gTaOTqIYR
 HifPB/dmTa53V1Jw9oU5rA8Q9DzHHSELJ8LaV5mtk3A4ZHubRU8rivE9wwX8SXQsRbiC
 iEKquh5xpKI77TW/c5wBBrMd6fU9AW6AYGIbPeOlmnNkL9Su7O9/tMt3lrqEjpDTzC+O
 6/c7Xv2y5CRCLEsn7zpffACUla9aPjKZNG997as9XJCLlciHTIV7P9QOHq4rZbnm9135
 OBb+rrQ0Szxz6n+CZq0pfkTJEhEA/EXA9yL67ikQpePrIk+8Pks8Nau1is+OKOduGfkm
 YwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YLCdzstc6Zlv2b8ffgqTCfh63gR16uK1if4Ir20SGyw=;
 b=dwkx85CXqvhq3QxaPoQYW9FV4+YOKe6m5aXE9Ck3so/9eEGFhrP1QmovMExwAWHKu2
 RLidVy6oFh6nKxIzT0qIMYPz1LUmRgX3u8RoVt6I0NV+cpOiidM6/w/53t6Rd6hjg0qp
 qn6ak97uZPqCT1w5ecmoRyRKEu7T7qDrfPa39O2HSFKKuc93u+iPUbQPdc8b2AW/N6M5
 Dx/fnh9s8jlEATr1pO2inJRC7dihvpCZkP7dqMVM4AecV5pHIYpdTawLR0bsScfLaxXZ
 gqZCOxtRNqZD6WuAkbUszt3cp5EtmFxKLqpt2rkJcB8Rjz1uyYMSN2LxiR9eEojytjUV
 HI1w==
X-Gm-Message-State: AFqh2kqjgWEGdI6jZmwroA24CoXaxnCmLfhDOKpnUuLnirm1z0OMTxE4
 eQ4HaSe2+6vFo+OuC9yXOuVpKA==
X-Received: by 2002:a17:907:8c82:b0:7c0:f7b2:b19a with SMTP id
 td2-20020a1709078c8200b007c0f7b2b19amr45770602ejc.27.1672871710088; 
 Wed, 04 Jan 2023 14:35:10 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a17090632c800b007c0f2c4cdffsm15736530ejk.44.2023.01.04.14.35.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 14:35:09 -0800 (PST)
Message-ID: <081e95c1-d601-4ed5-678a-e6a828d6ea46@linaro.org>
Date: Wed, 4 Jan 2023 23:35:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/6] hw/arm/aspeed: Fix smpboot[] on big-endian hosts
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Tyrone Ting <kfting@nuvoton.com>
References: <20221222215549.86872-1-philmd@linaro.org>
 <20221222215549.86872-2-philmd@linaro.org>
 <CAFEAcA9KD8WwPTKVQQUfAZxaqA=ASweZtJ=sAV0Vd8TkpqDBOw@mail.gmail.com>
 <8fa1d7b7-babc-eca8-bbd9-4707ada2f49f@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <8fa1d7b7-babc-eca8-bbd9-4707ada2f49f@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: WJSuLT7MflXn

Hi Cédric,

On 4/1/23 09:43, Cédric Le Goater wrote:
> On 1/3/23 18:33, Peter Maydell wrote:

>> Can we use the write_bootloader() function, which handles the
>> endianness question correctly and is how other boards do the
>> "put a little lump of code into the guest" job ?
> 
> Yes. See below.
> 
> May be we could change write_bootloader a little to handle an empty
> fixupcontext.
> 
> Thanks,
> 
> C.
> 
>  From 671d43faa7e14b896855403feb0afd777350cb0a Mon Sep 17 00:00:00 2001
> From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
> Date: Wed, 4 Jan 2023 09:30:28 +0100
> Subject: [PATCH] hw/arm/boot: Export write_bootloader for Aspeed machines
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> AST2600 Aspeed machines have an home made boot loader for secondaries.
> Instead, use the internal ARM boot loader.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   include/hw/arm/boot.h | 24 ++++++++++++++++++++++++
>   hw/arm/aspeed.c       | 42 ++++++++++++++++++++++--------------------
>   hw/arm/boot.c         | 34 +++++++---------------------------
>   3 files changed, 53 insertions(+), 47 deletions(-)
[...]

I'm getting:

Applying: hw/arm/boot: Export write_bootloader for Aspeed machines
error: patch failed: include/hw/arm/boot.h:183
error: include/hw/arm/boot.h: patch does not apply
error: patch failed: hw/arm/aspeed.c:201
error: hw/arm/aspeed.c: patch does not apply
error: patch failed: hw/arm/boot.c:59
error: hw/arm/boot.c: patch does not apply
Patch failed at 0001 hw/arm/boot: Export write_bootloader for Aspeed 
machines
hint: Use 'git am --show-current-patch=diff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

What is your base commit? Can you post a normal patch?

Thanks,

Phil.
