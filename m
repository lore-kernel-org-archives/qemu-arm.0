Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp382838ejb;
        Wed, 15 Feb 2023 02:45:50 -0800 (PST)
X-Google-Smtp-Source: AK7set+Laa6nnMGeZ5tnMnZSaMuOpALsj4/7ashl21JW3cEwzAtDlMOfr2nXlfrpZqNy8D+pcwNj
X-Received: by 2002:a05:622a:1a25:b0:3ba:1360:ec0a with SMTP id f37-20020a05622a1a2500b003ba1360ec0amr2320356qtb.41.1676457950271;
        Wed, 15 Feb 2023 02:45:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676457950; cv=none;
        d=google.com; s=arc-20160816;
        b=D/cK2uIFbnYRNHI8e57Hph//0weapn63cdUmUqxXniRZLs41DrK8dXSIum/Cof4ECe
         +qc7RW2QFQLAABtZBQBEg/u6JR6fc0BvzcNVng4kjQxVibbiqTHabU0cA7cbCqwjKxqb
         Gz796kuFIHHV0pAk2cQs+NN2U7acV6LmDMt0KkORNj1FMpFZ646VS9+QtsAN3QFYx3Zy
         6xi/z8SyPNK828KaCCHWHvXSrLSVfQLam99KKkD7iw3DkcfhssdR/h90J8MTT9p0LoML
         kElrkka3J3W+a8YHR0dCt5Fvy0uJk3QGyYpKfq5zR44+UWfSH7bbqmSo+yFCozTm4ZGK
         IE6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=uPHkV2SzBZJK7310CGyKTdxCfpXXoNlLMItSVMs6Q6g=;
        b=rSCr/j5t9xgdjCaYWb1KpFvpnKnL8vR9nw4wREx3DkKREOXlD7mzWZjZqffM+3t16/
         kKO27CQsPYGwSOy9SCO7eKZ14KjtxMBwadtl8E8dLG8Lyf7Ki6+oMtswoNcc7nX9n+9F
         m+RbZCVdkIbSR5ENVthl1XKYf8XHt94Ye7YbE/8kvE7QX8QGk4WGhnYywJeSYNjrx2xJ
         kTC86xP+T/2z25t//zsXx7urVjHnTck4C/D9YEcEch7eqokrpmsLnhrei/il48a/2jP5
         V424LvYJhLm68ukWwIjC2QQ66gf0DZ59ZNscXD0rf5KeKkPdE0gEab7bsvUI46RbbI19
         pSXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NzhIBsVB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o9-20020a05622a008900b003b84d549ca0si14559781qtw.679.2023.02.15.02.45.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Feb 2023 02:45:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NzhIBsVB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSFI8-0000Ih-Sp; Wed, 15 Feb 2023 05:45:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFHq-00009y-1B
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 05:45:21 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFHm-0001yC-GW
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 05:45:17 -0500
Received: by mail-wr1-x42f.google.com with SMTP id l2so2015113wry.0
 for <qemu-arm@nongnu.org>; Wed, 15 Feb 2023 02:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uPHkV2SzBZJK7310CGyKTdxCfpXXoNlLMItSVMs6Q6g=;
 b=NzhIBsVBUPyglM+P8SGOiiLbTx9c5O9mMK+YRP54TjeS8Heud0a1Lw8+J/M4BYKr4F
 V4qfstehfIQlbp6Czo2K3+9ZctlVAIu4M5SkyTbWamjcS+qh4KbTwk0YR7K+ZW275GUk
 ybCDXrxURPe5pa4LnNYB+h0XSCQV/YB/lGgY9c3/OOniiHpJFfFYhx8wGVAYXnqi1oge
 ME1J2mOK9Cw5ajbVtNuyQIDVLzFnJgUTeFgVeig6XKtWyXqDWgXlennQpZXcTgQNUE2F
 s+Csbh2kWNQ14BHPGVa5smz0u+aB5wG47zeEG9SCiNPX+nxX9mBtJF/oNxScJDS1iDGi
 zEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uPHkV2SzBZJK7310CGyKTdxCfpXXoNlLMItSVMs6Q6g=;
 b=GiQ1INbSu+i7esf+XFS+1BEYiA2hyAmPWig0E1u+8p9Zlv2Ei3vTLD5BVMx/jd3xYZ
 HA/Gjg7+rCpv7ovw+DBPKoxTiaXVr3TG91KQei7O8am+16aIdix7YXwKga7BsGkgYRzi
 kf8lb1JGYDJK/jm8KxJ/IDGVoMKdqE59jUNlAyAeG1MYPyiw28j++4SE4EPq/uPdfbGO
 VuhmQbJhJJYxIgUx5NqkeN04IIzCJWQVgHaU1KJA5PJxQQWiY01/EUGtmCvQXCGG/0+Q
 wcawS98Rili4Q3hFm/qUULCA+e1DlLw65oma3ZXGXh+RHkDO/Bf/fcr7QD70E+5O8P2i
 wC+g==
X-Gm-Message-State: AO0yUKVetdSzUu6P1/vkrrjE42nSokyqI0dDaE2K1lK4BsqA0UjjMHwO
 mm+biF11CH2bwjS16G2tyalUFw==
X-Received: by 2002:a5d:5256:0:b0:2c5:587e:75ba with SMTP id
 k22-20020a5d5256000000b002c5587e75bamr1035420wrc.55.1676457912615; 
 Wed, 15 Feb 2023 02:45:12 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q13-20020adff94d000000b002be099f78c0sm15034357wrr.69.2023.02.15.02.45.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 02:45:12 -0800 (PST)
Message-ID: <01ff80e9-c564-5566-5405-b2ca26dfbf09@linaro.org>
Date: Wed, 15 Feb 2023 11:45:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 0/8] aspeed: I2C fixes, -drive removal (first step)
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20230214171830.681594-1-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230214171830.681594-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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
X-TUID: Hu5SwFIGpwgM

On 14/2/23 18:18, Cédric Le Goater wrote:
> Hello,
> 
> This series starts with a first set of patches fixing I2C slave mode
> in the Aspeed I2C controller, a test device and its associated test in
> avocado.
> 
> Follow some cleanups which allow the use of block devices instead of
> drives. So that, instead of specifying :
> 
>    -drive file=./flash-ast2600-evb,format=raw,if=mtd
>    -drive file=./ast2600-evb.pnor,format=raw,if=mtd
>    ...
> 
> and guessing from the order which bus the device is attached to, we
> can use :
> 
>    -blockdev node-name=fmc0,driver=file,filename=./bmc.img
>    -device mx66u51235f,bus=ssi.0,drive=fmc0
>    -blockdev node-name=fmc1,driver=file,filename=./bmc-alt.img
>    -device mx66u51235f,bus=ssi.0,drive=fmc1
>    -blockdev node-name=pnor,driver=file,filename=./pnor
>    -device mx66l1g45g,bus=ssi.1,drive=pnor
>    ...
> 
> It is not perfect, the CS index still depends on the order

Quick thoughts here:

TYPE_SSI_PERIPHERAL devices have one input SSI_GPIO_CS.

TYPE_SSI_BUS could have a "cs-num" property (how many
CS line associated with this bus) and create an array of
#cs-num output SSI_GPIO_CS.

TYPE_SSI_PERIPHERAL could have a "cs" (index) property;
if set, upon ssi_peripheral_realize() when the device is
plugged on the bus, the GPIO line is wired.

So we could set the 'cs=' property from CLI:

   -blockdev node-name=fmc0,driver=file,filename=./bmc.img
   -device mx66u51235f,bus=ssi.0,cs=1,drive=fmc0
   -blockdev node-name=fmc1,driver=file,filename=./bmc-alt.img
   -device mx66u51235f,bus=ssi.0,cs=0,drive=fmc1

> but it is
> now possible to run a machine without -drive ...,if=mtd.
> 
> This lacks the final patch enabling the '-nodefaults' option by not
> creating the default devices if specified on the command line. It
> needs some more evaluation of the possible undesired effects.
> Thanks,
> 
> C.

