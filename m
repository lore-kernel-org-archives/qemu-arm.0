Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4758337ejb;
        Fri, 30 Dec 2022 00:14:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuDXrP6acoG4oqC2XmsdaFwU2yVpBk+ce1n4ckOW8JP4dybblMrLku1KWpBjsqqalMyuN/D
X-Received: by 2002:a05:622a:30d:b0:3a7:ed2f:adfd with SMTP id q13-20020a05622a030d00b003a7ed2fadfdmr58065317qtw.8.1672388052320;
        Fri, 30 Dec 2022 00:14:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672388052; cv=none;
        d=google.com; s=arc-20160816;
        b=WWJHk8C8ppXIJCevn5ZgEX0qoJ6hgjqLQUANpgprY1gUfJjXHm26Yo6yF0LYydN8GF
         3ibb+Sa8Ac6NoxweK3MlAIdiZXcMouR2kym6R0U1dDsD5cey9b+Mj2HFFkQS9aO+1Wu6
         VaNKsGTPUXy2rW7mqi584CEjJ9lq0cpgzUPjXTLoH/7KWDeE0XhWGtTrhE1pwg3k3eaL
         MMzWDtqnfjyIx9BT1s9XFt3K8d8BJcr4rOpDHwdJ/5a0+Mozd4ozaLqwC0wnRp+eCw+z
         PLDNyw9lB3lNBjkf4K4/e8pvJc/9orXS9yTGwoMdO3qQ0UeqX7zMV9n2bEn2aTv5U62J
         h78w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=VqIpR35eFpA4JQpC/0diDoIimutJFFO0AEkeUu0rUaM=;
        b=QtuM2TtAcRfYO3QCKiZvq2eixawf9KAnTxUO47SZ7BGIanuImGQ12BdBz+yc352xhg
         g4+MWGY+qMjR089Ah11Te25NYf3qQS5DhXwhwO5I0SfrDCyGvfz48oXwrxYhEOu+3jE6
         OOd2fHB03/gMb2/SkykrWfnWuht2fmdlh0TREs7F3PRNGXrakmdISmqG2FregUb3nJrD
         APmKLDzYr54IIcM+mcytRgDqi87jQF5/NrJ6hM0Fp2BC6wj1PtnP+sippnhaN2ivb68J
         Q2dVbLL1k6qxgh09SFP1JUYbn9Yr/EH8yvG9R/6HDVH+N2Qwc/vyMwHM9TlcvqOzd9h+
         Iw4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oVBdbEa8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e16-20020ac86710000000b003a496373dacsi9321162qtp.531.2022.12.30.00.14.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Dec 2022 00:14:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oVBdbEa8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pBAWI-0005NL-Cp; Fri, 30 Dec 2022 03:13:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBAWG-0005Mz-K5
 for qemu-arm@nongnu.org; Fri, 30 Dec 2022 03:13:36 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBAWE-00061V-Kt
 for qemu-arm@nongnu.org; Fri, 30 Dec 2022 03:13:36 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so12514457wms.0
 for <qemu-arm@nongnu.org>; Fri, 30 Dec 2022 00:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VqIpR35eFpA4JQpC/0diDoIimutJFFO0AEkeUu0rUaM=;
 b=oVBdbEa8aaIaB3KJAwAiyqaJ/wOk3hKNOq8JPwvjq6xe+Gj63Ijef4zy07AdL9usOI
 OufsQKtRIKAoRSaU/wmAsGAbBvQhad+GLsa1rmIivVoIdkQ3Wp5kriOt0IVEHl5TmNNF
 0vhU+cYwr0cM82ZamYrhyAqh1g1GDz40qDqY4WYEvkpgPD3KbV4p9r3PIKlhCnpyPixC
 GqpQcDsBkS/Gwp7zFIzJcFWCaCkRR5dO/EKr5mRgi528vbOhfKc7jbvC2RcaLPFaT9s2
 PT60B3EnW9E45VuMGrQw0fJgTUL4NuLwMXJ3z+BX4SiEXb3UqZt0yszro2ndKZEbtSZU
 kMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VqIpR35eFpA4JQpC/0diDoIimutJFFO0AEkeUu0rUaM=;
 b=09Iw+Fhz9+UtuSeD4+WU/8Ger4xjzk02E5vEbUOpwTrHaO/yAeYm/2QMGeaHRyYXnf
 U/ftDFRuwwWyhi7Vb2c+2evUbtYVKWHJJUddpNz9vLZ3hfuQSALqWjIH7jzMNdyjMCXT
 4PZUpFIgV6sADG1nnwdfzGY0gfIMxq1UGnk0G2mfUsUp4ytwlhtIFAY1VZsNyhM7FUQB
 cXuGoX9kmPLRYNE/FIHho0iLVfViFI+s6WrG7keBe1COf3Mw9MWdesQDr9JM1GSz2jB0
 Y/BDzaZIX/mWx9SCFkzIlDMcdJfOaHa3DacwbxfP8xWUPKZK3NFbHHxNWg43Awx/kI0d
 SKCA==
X-Gm-Message-State: AFqh2kr5fsEMwNfgmuoq0FLO2Qlx0qNdYk+j4dGoKXWz3RVWJwMymJU0
 RQuRtdOHrpe8P/4L8H/QeK2uHA==
X-Received: by 2002:a05:600c:3d1b:b0:3d0:6a57:66a5 with SMTP id
 bh27-20020a05600c3d1b00b003d06a5766a5mr21537295wmb.0.1672388012973; 
 Fri, 30 Dec 2022 00:13:32 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c358d00b003d1f2c3e571sm35556168wmq.33.2022.12.30.00.13.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Dec 2022 00:13:31 -0800 (PST)
Message-ID: <9de13ab3-beb6-a86e-5eb3-b4606b0f5b9b@linaro.org>
Date: Fri, 30 Dec 2022 09:13:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 6/9] hw/arm/aspeed_ast10x0: Map HACE peripheral
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
Cc: qemu-devel@nongnu.org, Steven Lee <steven_lee@aspeedtech.com>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Peter Delevoryas <pdel@fb.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>
References: <20221229152325.32041-1-philmd@linaro.org>
 <20221229152325.32041-7-philmd@linaro.org>
 <Y63+CpM1zG9lNEPX@pdel-mbp.dhcp.thefacebook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y63+CpM1zG9lNEPX@pdel-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: YNdtf6AQh9BJ

On 29/12/22 21:52, Peter Delevoryas wrote:
> On Thu, Dec 29, 2022 at 04:23:22PM +0100, Philippe Mathieu-Daudé wrote:
>> Since I don't have access to the datasheet, the relevant
>> values were found in:
>> https://github.com/AspeedTech-BMC/zephyr/blob/v00.01.08/dts/arm/aspeed/ast10x0.dtsi
>>
>> Before on Zephyr:
>>
>>    uart:~$ crypto aes256_cbc_vault
>>    aes256_cbc vault key 1
>>    [00:00:06.699,000] <inf> hace_global: aspeed_crypto_session_setup
>>    [00:00:06.699,000] <inf> hace_global: data->cmd: 1c2098
>>    [00:00:06.699,000] <inf> hace_global: crypto_data_src: 93340
>>    [00:00:06.699,000] <inf> hace_global: crypto_data_dst: 93348
>>    [00:00:06.699,000] <inf> hace_global: crypto_ctx_base: 93300
>>    [00:00:06.699,000] <inf> hace_global: crypto_data_len: 80000040
>>    [00:00:06.699,000] <inf> hace_global: crypto_cmd_reg:  11c2098
>>    [00:00:09.743,000] <inf> hace_global: HACE_STS: 0
>>    [00:00:09.743,000] <err> hace_global: HACE poll timeout
>>    [00:00:09.743,000] <err> crypto: CBC mode ENCRYPT - Failed
>>    [00:00:09.743,000] <inf> hace_global: aspeed_crypto_session_free
>>    uart:~$
>>
>> After:
>>
>>    uart:~$ crypto aes256_cbc_vault
>>    aes256_cbc vault key 1
>>    Was waiting for:
>>    6b c1 be e2 2e 40 9f 96 e9 3d 7e 11 73 93 17 2a
>>    ae 2d 8a 57 1e 03 ac 9c 9e b7 6f ac 45 af 8e 51
>>    30 c8 1c 46 a3 5c e4 11 e5 fb c1 19 1a 0a 52 ef
>>    f6 9f 24 45 df 4f 9b 17 ad 2b 41 7b e6 6c 37 10
>>
>>     But got:
>>    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>
>>    [00:00:05.771,000] <inf> hace_global: aspeed_crypto_session_setup
>>    [00:00:05.772,000] <inf> hace_global: data->cmd: 1c2098
>>    [00:00:05.772,000] <inf> hace_global: crypto_data_src: 93340
>>    [00:00:05.772,000] <inf> hace_global: crypto_data_dst: 93348
>>    [00:00:05.772,000] <inf> hace_global: crypto_ctx_base: 93300
>>    [00:00:05.772,000] <inf> hace_global: crypto_data_len: 80000040
>>    [00:00:05.772,000] <inf> hace_global: crypto_cmd_reg:  11c2098
>>    [00:00:05.772,000] <inf> hace_global: HACE_STS: 1000
>>    [00:00:05.772,000] <inf> crypto: Output length (encryption): 80
>>    [00:00:05.772,000] <inf> hace_global: aspeed_crypto_session_free
>>    [00:00:05.772,000] <inf> hace_global: aspeed_crypto_session_setup
>>    [00:00:05.772,000] <inf> hace_global: data->cmd: 1c2018
>>    [00:00:05.772,000] <inf> hace_global: crypto_data_src: 93340
>>    [00:00:05.772,000] <inf> hace_global: crypto_data_dst: 93348
>>    [00:00:05.772,000] <inf> hace_global: crypto_ctx_base: 93300
>>    [00:00:05.772,000] <inf> hace_global: crypto_data_len: 80000040
>>    [00:00:05.772,000] <inf> hace_global: crypto_cmd_reg:  11c2018
>>    [00:00:05.772,000] <inf> hace_global: HACE_STS: 1000
>>    [00:00:05.772,000] <inf> crypto: Output length (decryption): 64
>>    [00:00:05.772,000] <err> crypto: CBC mode DECRYPT - Mismatch between plaintext and decrypted cipher text
>>    [00:00:05.774,000] <inf> hace_global: aspeed_crypto_session_free
>>    uart:~$
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Awesome!
> 
> Reviewed-by: Peter Delevoryas <peter@pjd.dev>
> 
>> ---
>> Should we rename HACE 'dram' as 'secram' / 'secure-ram'?
> 
> Sure, sounds good to me.
> 
>> ---
>>   hw/arm/aspeed_ast10x0.c | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
>> index 21a2e62345..02636705b6 100644
>> --- a/hw/arm/aspeed_ast10x0.c
>> +++ b/hw/arm/aspeed_ast10x0.c
>> @@ -29,6 +29,7 @@ static const hwaddr aspeed_soc_ast1030_memmap[] = {
>>       [ASPEED_DEV_SPI1]      = 0x7E630000,
>>       [ASPEED_DEV_SPI2]      = 0x7E640000,
>>       [ASPEED_DEV_UDC]       = 0x7E6A2000,
>> +    [ASPEED_DEV_HACE]      = 0x7E6D0000,
>>       [ASPEED_DEV_SCU]       = 0x7E6E2000,
>>       [ASPEED_DEV_JTAG0]     = 0x7E6E4000,
>>       [ASPEED_DEV_JTAG1]     = 0x7E6E4100,
>> @@ -166,6 +167,9 @@ static void aspeed_soc_ast1030_init(Object *obj)
>>       snprintf(typename, sizeof(typename), "aspeed.gpio-%s", socname);
>>       object_initialize_child(obj, "gpio", &s->gpio, typename);
>>   
>> +    snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
>> +    object_initialize_child(obj, "hace", &s->hace, typename);
>> +
>>       object_initialize_child(obj, "iomem", &s->iomem, TYPE_UNIMPLEMENTED_DEVICE);
>>       object_initialize_child(obj, "sbc-unimplemented", &s->sbc_unimplemented,
>>                               TYPE_UNIMPLEMENTED_DEVICE);
>> @@ -359,6 +363,17 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>>       }
>>       aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sbc), 0, sc->memmap[ASPEED_DEV_SBC]);
>>   
>> +    /* HACE */
>> +    object_property_set_link(OBJECT(&s->hace), "dram", OBJECT(&s->secsram),

We need to link the SRAM here, not the sec-SRAM.

Doing so the hash test works:

uart:~$ hash test
sha256_test
tv[0]:PASS
tv[1]:PASS
tv[2]:PASS
tv[3]:PASS
tv[4]:PASS
sha384_test
tv[0]:PASS
tv[1]:PASS
tv[2]:PASS
tv[3]:PASS
tv[4]:PASS
tv[5]:PASS
sha512_test
tv[0]:PASS
tv[1]:PASS
tv[2]:PASS
tv[3]:PASS
tv[4]:PASS
tv[5]:PASS
uart:~$

rsa / aes256_cbc tests still fail.

