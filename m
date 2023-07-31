Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2184251ejb;
        Mon, 31 Jul 2023 06:44:51 -0700 (PDT)
X-Received: by 2002:a1c:f70c:0:b0:3fc:80a:cf63 with SMTP id v12-20020a1cf70c000000b003fc080acf63mr8607481wmh.38.1690811091232;
        Mon, 31 Jul 2023 06:44:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690811091; cv=none;
        d=google.com; s=arc-20160816;
        b=Z5jWqTCcI+haGYPWYz2RvCuNGZ8lmgSCqaX89ooNMm3qIEN9Jwhnq82drOY/MbdPQJ
         klQgmxSbYc8NCVxGwf3XlX58ie+pT7Jvugeo5jSe2PLvBvjKF4wvgstNHlxoaYChTSze
         +3T1BthcjmBb4t7651nBqaR8ugw3rJ+N6HIQosmoPN8s9skD6BVCX5+Nf2SCrrnJwIGf
         V7AbErAkAXG3LA4qUEdGB98mqgF4sKX8Nvd5333+gBBTJiOfSbzO7EeNAfF3HqzKZm7l
         jJHvpuB9H+vxpImYexmDyz12tuusHG8B3N9q84NT49EY5L4JukcFW9NZEJ28ChXLvAjm
         WeUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=5EwGHoMLAhNqYUVT0oA6NfF6LfmubritLODr0v0MJtQ=;
        fh=99M8M+8TD8TDQI1qe/4NtoIvOpLCBIu4dx5efhOEhl4=;
        b=oNtMPkJDNxFU7lYBmUL3UFRL5qA1PdQ2niG/Hu5Y5T5h67U9JN/QYysP7uj+ATaWFs
         iqBVnxFWhBNiIIUlHH3AkX+aHRX7MpnFCHuZ3odo6vlxjALcgHOzlKGSe9UR7z+F9Vd8
         nT1/A9Tkqb7bXTaYtDozcPp4IQvGSAZbpkuBKvfCLWcTgnebjkxUyIpulGxfc2r0Laqi
         eo2VWYzCa5yzqszARpcyennaAlvPk8m1Uhb95RhGk8Fd4ph0+fGDJW+ugHquIkljp1kI
         t+zrPnH6pXefZLGshBmrF6vcSH8SzLfQtdL2SxfaLwIbLzP2ox3KtNF8gsB7xdeL4bO0
         jFQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i+8ADQ5G;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 12-20020a05600c22cc00b003fe1cb096d7sor1335692wmg.0.2023.07.31.06.44.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Jul 2023 06:44:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i+8ADQ5G;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690811091; x=1691415891;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5EwGHoMLAhNqYUVT0oA6NfF6LfmubritLODr0v0MJtQ=;
        b=i+8ADQ5GQHcDMQj22X/FA0iDyqcUk+Dcf3/pTyWw8snGgzC213RXMBdWQ+Gvc+oscJ
         LZ2p2MneWsTlNGNS3fsCLYc6R4lBAGAAZ+fIQ5uPjjzDpVUItZ4qIvErlUk9VZ6MKCLt
         Pwi6fYLZoaEexBTXNqgA4Jnjs72ce7MUvbBrjjCEIdgOC9/Nw9q0JDHsr5CPj5bDns20
         lnWdKLAI9VdvUZms3fg0QshFfanfjFkaGffyNaNammNkVlc8XLhMMFNPO3n3wnVEZYq0
         qPvD4nICE7BazifeTsH5XFl2n3d/61WH9Ok/bq+y4XYj5NsTsvh2sX5bvUEKK8zt+WcH
         uIGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690811091; x=1691415891;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5EwGHoMLAhNqYUVT0oA6NfF6LfmubritLODr0v0MJtQ=;
        b=PqVg+Fc7+VjPaxPSUvnD+okmYgRg1Y8wfxkeRGAfzNxc/dOdmAQTTVkjaBx9izM5ul
         lTsVl+jjgu43+TjEhmwGEgGbP/6+HRoBEQgZpCD+evmLot2dc4Of3gshNi3nReKx+5W0
         LudEGIMiekbp2WaM3BFe+khW1XfOD44XK1p2kVEtsmUVjM37tcD0Ly/8DbfBUjwGthNa
         4ucetdDzgD8wsGuRI5dTnNz4EoFW69iVybuETW5QMC/8XTxzKpIsfsHhTuBN9zVLGqBx
         bVCDjHBdhk3y8w7tyTnF/lqXBcBDTZ7w1Fakevns8VCCB1qdrQI3NgGL5beyDAHFcesJ
         eMhg==
X-Gm-Message-State: ABy/qLaY3dHkqG5yPtHvXkCVtwCjv40fIFWnb1HvZKaLPz0kmm3b0MBY
	IuFREEksHN4xhALRyykDUmgLwWI9
X-Google-Smtp-Source: APBJJlFvU/UKA6OnFuC+hta+gt8YF5CUA5lRNK9tWn2/Gg55fXyDkOO1nqE80rh6qABbSklGYurOxA==
X-Received: by 2002:a05:600c:2296:b0:3fe:ad3:b066 with SMTP id 22-20020a05600c229600b003fe0ad3b066mr8228885wmf.41.1690811090841;
        Mon, 31 Jul 2023 06:44:50 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.187.198.42])
        by smtp.gmail.com with ESMTPSA id z8-20020adfec88000000b0031773a8e5c4sm13147248wrn.37.2023.07.31.06.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 06:44:50 -0700 (PDT)
Message-ID: <6c92b326-d386-2dd4-c9a0-cbf9e7583243@linaro.org>
Date: Mon, 31 Jul 2023 15:44:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 07/24] target/arm: Use GDBFeature for dynamic XML
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Rolnik
 <mrolnik@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-8-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230731084354.115015-8-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: kpQCJDNLlwtz

On 31/7/23 10:43, Akihiko Odaki wrote:
> In preparation for a change to use GDBFeature as a parameter of
> gdb_register_coprocessor(), convert the internal representation of
> dynamic feature from plain XML to GDBFeature.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   target/arm/cpu.h       | 20 +++++------
>   target/arm/internals.h |  2 +-
>   target/arm/gdbstub.c   | 80 +++++++++++++++++++++++-------------------
>   target/arm/gdbstub64.c | 11 +++---
>   4 files changed, 60 insertions(+), 53 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 88e5accda6..d6c2378d05 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -136,23 +136,21 @@ enum {
>    */
>   
>   /**
> - * DynamicGDBXMLInfo:
> - * @desc: Contains the XML descriptions.
> - * @num: Number of the registers in this XML seen by GDB.
> + * DynamicGDBFeatureInfo:
> + * @desc: Contains the feature descriptions.
>    * @data: A union with data specific to the set of registers
>    *    @cpregs_keys: Array that contains the corresponding Key of
>    *                  a given cpreg with the same order of the cpreg
>    *                  in the XML description.
>    */
> -typedef struct DynamicGDBXMLInfo {
> -    char *desc;
> -    int num;
> +typedef struct DynamicGDBFeatureInfo {
> +    GDBFeature desc;
>       union {
>           struct {
>               uint32_t *keys;
>           } cpregs;
>       } data;
> -} DynamicGDBXMLInfo;
> +} DynamicGDBFeatureInfo;
>   
>   /* CPU state for each instance of a generic timer (in cp15 c14) */
>   typedef struct ARMGenericTimer {
> @@ -881,10 +879,10 @@ struct ArchCPU {
>       uint64_t *cpreg_vmstate_values;
>       int32_t cpreg_vmstate_array_len;
>   
> -    DynamicGDBXMLInfo dyn_sysreg_xml;
> -    DynamicGDBXMLInfo dyn_svereg_xml;
> -    DynamicGDBXMLInfo dyn_m_systemreg_xml;
> -    DynamicGDBXMLInfo dyn_m_secextreg_xml;
> +    DynamicGDBFeatureInfo dyn_sysreg_feature;
> +    DynamicGDBFeatureInfo dyn_svereg_feature;
> +    DynamicGDBFeatureInfo dyn_m_systemreg_feature;
> +    DynamicGDBFeatureInfo dyn_m_secextreg_feature;

Since now DynamicGDBFeatureInfo.desc contains xmlname, we can replace
all these by a generic 'DynamicGDBFeatureInfo *dyn_features' and have
arm_gdb_get_dynamic_xml() looking up the xmlname.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> @@ -489,14 +497,14 @@ const char *arm_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
>       ARMCPU *cpu = ARM_CPU(cs);
>   
>       if (strcmp(xmlname, "system-registers.xml") == 0) {
> -        return cpu->dyn_sysreg_xml.desc;
> +        return cpu->dyn_sysreg_feature.desc.xml;
>       } else if (strcmp(xmlname, "sve-registers.xml") == 0) {
> -        return cpu->dyn_svereg_xml.desc;
> +        return cpu->dyn_svereg_feature.desc.xml;
>       } else if (strcmp(xmlname, "arm-m-system.xml") == 0) {
> -        return cpu->dyn_m_systemreg_xml.desc;
> +        return cpu->dyn_m_systemreg_feature.desc.xml;
>   #ifndef CONFIG_USER_ONLY
>       } else if (strcmp(xmlname, "arm-m-secext.xml") == 0) {
> -        return cpu->dyn_m_secextreg_xml.desc;
> +        return cpu->dyn_m_secextreg_feature.desc.xml;
>   #endif
>       }
>       return NULL;
