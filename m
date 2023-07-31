Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2193231ejb;
        Mon, 31 Jul 2023 07:00:28 -0700 (PDT)
X-Received: by 2002:a17:902:eccc:b0:1b8:1335:b775 with SMTP id a12-20020a170902eccc00b001b81335b775mr13043928plh.0.1690812028712;
        Mon, 31 Jul 2023 07:00:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690812028; cv=none;
        d=google.com; s=arc-20160816;
        b=HvtfhnZdUtgHEDh2bgRSz8IKFyhoCpM1H88jPu0l+AGimrQJV/UhAt+aTdg5HY+Wwa
         sp+6bz4RIIEtBaom1Ti7cPBrPpuxoRqqNJ8t1i2n66F1Sxu1v1wrelplUW01nFfRHVK1
         9lA3Yeq5QqLH+Q2oxEVIel+flVEoJ/j95mryfcTgJ6KBpJdwZ6euS/DRdFr3qplHr9BF
         cj3TzcntxLwNenxhNAIAe/3ewcK1gTbw8wKErViKcia1urx33Xz8mb9RKIJugcU1acPU
         rVbCclaGKJjQHdqJUEb1ofgeVBDhM1XvtaVT/SHi4PoC1/fzHG++N9PS1B+CCYn76Bg8
         wJ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=dFI5/dDGgtKfts1m9Qur3+hIlx9/w17jNCSRDR4ep4A=;
        fh=Vyq5/6xHMnUXaCcwNIruSPKpraLOPjqJ2O/oHLYr/lI=;
        b=SxbjCNiJSLqWLNYPE3y4M/rZW6IffROCBUc3a/PtYGeFbQjz55H1v1zsqODq9MfE2S
         LkIy0/z+8HtSOi6/6sY8Rhseno0snPoiACpvaN5jsSnpzAPBWpYjx4IqilpN4qErYNzU
         shFRt43BGNM4kc+bbvBueot2W65/JnyMG2GZw2DfNPLTTmdP/VWQsEG3Z4HmRe14hea+
         tZFGjDchNYHTHF1YIJm2+JfK+4YrU2IX5YHGDsdb8+atvb5fj6CZKHsvUhydBIra4Itz
         v1JLaBAPPTMmyrWCKcbJo92/CkPnFUzizViWdhQObxdmLRqGeKoCrIPG2/5QdElrqtN5
         SU0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=3EPqxcNQ;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m3-20020a170902c44300b001bbe7f6887esor807669plm.7.2023.07.31.07.00.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Jul 2023 07:00:28 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=3EPqxcNQ;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690812028; x=1691416828;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dFI5/dDGgtKfts1m9Qur3+hIlx9/w17jNCSRDR4ep4A=;
        b=3EPqxcNQLkbIAN43BnvhYZVYFN8u1avdTBAov9OH4wtbeM2Z/NKEQdQOXqOQqaSA7W
         wzU0t/EQvRuU+GjQjJd+AkPA1CQK5Yi1ZInbVUkjrnoYJxEmBDhASTvZUwboLnpe2ad9
         evmGSq52GlcBtKeCA43f8XyfLcLGT8KVBN6A5jEhptsqms8uAcya+MkMvYG3aos3C/en
         DtnP7HixhflynPBJNKOchyxMUeOHGLUfZMUN2EYFlBuV4ftryIydIWL7lVchim3/cobK
         aNpaUWV3K5bOBUhPol7UOvmxMf7DKUfW07qLqq8sVTi4DBIWC1nu3XNbeaAjdd1+hqW/
         GkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690812028; x=1691416828;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dFI5/dDGgtKfts1m9Qur3+hIlx9/w17jNCSRDR4ep4A=;
        b=FSLlL4AuBJFy/7XiPGMtxVOSFQuINlx9HXji84awNlCv/akdFVke2EU7e8wauTmIFJ
         AllCpLNeCCsYN9iM/t45T3yFjmILAgpbzl+fml4Xlb25un+phD67gFIbErBQ0cNk3NX3
         vXcE7T7ZcmVqeJI/IZKuw3cCpa3ckBBzIB5W46dF/gRZHLSiNvbnpf7grWlUgTix+Rwe
         XkHH5C/jsSCMXOgZW61kHabxcqMC0mUKJqdnJImb1uH+AKSt1UYkmhz3irySj3xOAC16
         TuhsTlAGYdrb3som4t2I5sbN1G3pTlHJzaLriRYKue+umTT+GciY0B7ahRtttHBpfoM6
         NCSg==
X-Gm-Message-State: ABy/qLb4FMyAfD7XCI9QelcappjsLIMSeZ61N9lnQ5Ls1CSJIqz+tUXY
	7l7hu2wkoWI4jNrSOoyGew5j8Q==
X-Google-Smtp-Source: APBJJlFvL8s6ELhm4xoUw4u+DrnTuGXUQIjU2FysvwOYLzpco137/GPcI1hDqnIqDVUiZC9M1PCW4A==
X-Received: by 2002:a17:903:1ce:b0:1b8:88c5:2d2f with SMTP id e14-20020a17090301ce00b001b888c52d2fmr11462865plh.64.1690812028070;
        Mon, 31 Jul 2023 07:00:28 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [10.4.77.242] ([118.103.63.133])
        by smtp.gmail.com with ESMTPSA id c6-20020a170902c1c600b001acae9734c0sm8638603plc.266.2023.07.31.07.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 07:00:27 -0700 (PDT)
Message-ID: <e11c2c4b-fcf8-cd24-2735-0ea107b289d3@daynix.com>
Date: Mon, 31 Jul 2023 23:00:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/24] target/arm: Use GDBFeature for dynamic XML
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
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
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
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
 <6c92b326-d386-2dd4-c9a0-cbf9e7583243@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <6c92b326-d386-2dd4-c9a0-cbf9e7583243@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: vZCSMc44Aec7

On 2023/07/31 22:44, Philippe Mathieu-Daudé wrote:
> On 31/7/23 10:43, Akihiko Odaki wrote:
>> In preparation for a change to use GDBFeature as a parameter of
>> gdb_register_coprocessor(), convert the internal representation of
>> dynamic feature from plain XML to GDBFeature.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   target/arm/cpu.h       | 20 +++++------
>>   target/arm/internals.h |  2 +-
>>   target/arm/gdbstub.c   | 80 +++++++++++++++++++++++-------------------
>>   target/arm/gdbstub64.c | 11 +++---
>>   4 files changed, 60 insertions(+), 53 deletions(-)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index 88e5accda6..d6c2378d05 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -136,23 +136,21 @@ enum {
>>    */
>>   /**
>> - * DynamicGDBXMLInfo:
>> - * @desc: Contains the XML descriptions.
>> - * @num: Number of the registers in this XML seen by GDB.
>> + * DynamicGDBFeatureInfo:
>> + * @desc: Contains the feature descriptions.
>>    * @data: A union with data specific to the set of registers
>>    *    @cpregs_keys: Array that contains the corresponding Key of
>>    *                  a given cpreg with the same order of the cpreg
>>    *                  in the XML description.
>>    */
>> -typedef struct DynamicGDBXMLInfo {
>> -    char *desc;
>> -    int num;
>> +typedef struct DynamicGDBFeatureInfo {
>> +    GDBFeature desc;
>>       union {
>>           struct {
>>               uint32_t *keys;
>>           } cpregs;
>>       } data;
>> -} DynamicGDBXMLInfo;
>> +} DynamicGDBFeatureInfo;
>>   /* CPU state for each instance of a generic timer (in cp15 c14) */
>>   typedef struct ARMGenericTimer {
>> @@ -881,10 +879,10 @@ struct ArchCPU {
>>       uint64_t *cpreg_vmstate_values;
>>       int32_t cpreg_vmstate_array_len;
>> -    DynamicGDBXMLInfo dyn_sysreg_xml;
>> -    DynamicGDBXMLInfo dyn_svereg_xml;
>> -    DynamicGDBXMLInfo dyn_m_systemreg_xml;
>> -    DynamicGDBXMLInfo dyn_m_secextreg_xml;
>> +    DynamicGDBFeatureInfo dyn_sysreg_feature;
>> +    DynamicGDBFeatureInfo dyn_svereg_feature;
>> +    DynamicGDBFeatureInfo dyn_m_systemreg_feature;
>> +    DynamicGDBFeatureInfo dyn_m_secextreg_feature;
> 
> Since now DynamicGDBFeatureInfo.desc contains xmlname, we can replace
> all these by a generic 'DynamicGDBFeatureInfo *dyn_features' and have
> arm_gdb_get_dynamic_xml() looking up the xmlname.

In patch 12, cpu-specific gdb_get_dynamic_xml() function is removed, and 
gdbstub instead looks up an internal list it holds.

> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
>> @@ -489,14 +497,14 @@ const char *arm_gdb_get_dynamic_xml(CPUState 
>> *cs, const char *xmlname)
>>       ARMCPU *cpu = ARM_CPU(cs);
>>       if (strcmp(xmlname, "system-registers.xml") == 0) {
>> -        return cpu->dyn_sysreg_xml.desc;
>> +        return cpu->dyn_sysreg_feature.desc.xml;
>>       } else if (strcmp(xmlname, "sve-registers.xml") == 0) {
>> -        return cpu->dyn_svereg_xml.desc;
>> +        return cpu->dyn_svereg_feature.desc.xml;
>>       } else if (strcmp(xmlname, "arm-m-system.xml") == 0) {
>> -        return cpu->dyn_m_systemreg_xml.desc;
>> +        return cpu->dyn_m_systemreg_feature.desc.xml;
>>   #ifndef CONFIG_USER_ONLY
>>       } else if (strcmp(xmlname, "arm-m-secext.xml") == 0) {
>> -        return cpu->dyn_m_secextreg_xml.desc;
>> +        return cpu->dyn_m_secextreg_feature.desc.xml;
>>   #endif
>>       }
>>       return NULL;
> 
