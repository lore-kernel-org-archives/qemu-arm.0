Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp567227ejr;
        Tue, 10 Oct 2023 20:29:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5r0OvKJQuww1sreipcskIMyw/xrYA6JZMFflhvY7f5pjJYp8Z2fMipomS7PHkBmpSdfrO
X-Received: by 2002:ac8:5a8c:0:b0:417:97b3:6cc8 with SMTP id c12-20020ac85a8c000000b0041797b36cc8mr27965480qtc.41.1696994993318;
        Tue, 10 Oct 2023 20:29:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696994993; cv=none;
        d=google.com; s=arc-20160816;
        b=u/U7zWU28DKoO+Ems9CcZnmWGSXooEVx69fszgudKHZ31s30GgixodhtEeULE+6ChE
         8J0UxNf8O1/+BSij/ewlAeJwvjYC9/6ENMHvmk/xGnABNyRMwyFcWxNDdGBb/XTwpvEp
         BDxfOWlNV8on3BqSxFPoCchFjs0/DoDWP4lVjQsRNo4+ZtPBNwZRJlCkmGM9iNgrVrXy
         HckbD2Uf4JY+2oNUtv3+J32ENgS8K/CeqTpswBez/TaXd2xux+PG9do2MUCx/N31jdaP
         OBcENjKiiCKM7M2S9WGDp5odbAuC/GbO64IXqlk20kP7lv6NmbxCBWbhDE8R1RpwOrM/
         zXNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=HBzh6cmR9bP8NGfM5wIAN0/yrJ14+owrdwmAF1l8nfw=;
        fh=KjiU3tbxaoqKC0GlE6WPrxSlPtVLzRqnc6cCINtWsJI=;
        b=map8/8LsqDuWiZzE5OjhyPFnxncum5K3uFdW29smZaxmsiwtqVWX+b+RdrAk/OpEDj
         UExj87bOECTxszRS/vZLSQHp+ejJuvbZCHwOaJXB3259AhMRqeR2RPeoGqn7tY9E54NE
         q8aa3YIyXwxSDlqWhlyJGXKO/ubf0czrID+hTY2flh5NyJWpyuaLinVyFhdeHN4ZIgbt
         hMPJsOCijnZeeYcQH9WIGi9vuUSwUxzXuVVjziPXlLLSUtCVsNXBC0f7fAb6ixRlhAKP
         C0a/LP2XqIPRLXkHZ/rh08xfI7ONsfQ9Qq5SV0COCt44Ov048jIL4/1hS2LWCmAy8a1c
         IY+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JHqJ01LT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f19-20020ac859d3000000b00419600ceb15si8668223qtf.98.2023.10.10.20.29.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 20:29:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JHqJ01LT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qqPu9-0004oi-O3; Tue, 10 Oct 2023 23:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqPu7-0004la-I0
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 23:28:59 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqPu4-0006zI-D6
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 23:28:59 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9b1ebc80d0aso1075068266b.0
 for <qemu-arm@nongnu.org>; Tue, 10 Oct 2023 20:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696994934; x=1697599734; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HBzh6cmR9bP8NGfM5wIAN0/yrJ14+owrdwmAF1l8nfw=;
 b=JHqJ01LTYFGCtMUwAm4I5qq4cVUa9LbfjXUq9OqKYwdEjVgR4m4esAVqdkz+bhYnri
 R/lsTelk6oD27o7G+LzDWxKAe521IyCEMQW3mFKQfgPGW4De8o3PiHsyEgZ/4Smea8RS
 ekFTJ/XvmSjcQI2E4zHu1SSkQqZz5dD6UTuH8VKYnCjJbZYdhScYpgvpMECSLbow82oE
 LiCtdFy7uYp/VYeKRfpQNtBSY9CfqmjJMgBfNDyDmt5tPNkHfrfBFRxkXAAKdSwCcfhw
 Bz4YDXRvPqosJeqKSixcfIWn/ZsUlAq6nfJtXdrySvshtWv0/sJLxBoRzo9QsvxO3WdD
 7qZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696994934; x=1697599734;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HBzh6cmR9bP8NGfM5wIAN0/yrJ14+owrdwmAF1l8nfw=;
 b=jmRuH5vQeccVfls3yD83S3JIhufzvsUlUy4tgs7SUUosdTbUOCgPxjfY+PJVv49LfU
 5h+LCf5HhU2hS6zhhdVjXGuaMiMfHoZY4/Xr2SGIx+SCCQH7yIkw8fPqLRp4luzKBHyL
 X6rqfmPLmz0wi5CQHkQh53ShS6NKrkAdA9nXRxcNjAUXnjhwh1GRj54hOaOEWB0Aw8e4
 9DT8GKql9qoBhG/nQVrioyjmHLYbuym0IqKCbiTxoaS+y1tLz23VJrfWq+sV3zYUZ0J1
 a8NCgRlGK7trWaXMfkhoxQGcrvfNAsIUiAO0qBzH8s34US4xvzT4SCnZEHLklKFshbIo
 N/Lg==
X-Gm-Message-State: AOJu0YzIQOcHjSIlbhGdwz4Tuk5AvY+3bzerCYWqj7/vhZpBxapvkpBO
 TTXVpPTP9+GjxmSrS6aYjbRfdw==
X-Received: by 2002:a17:907:724b:b0:9b2:b9ff:dc35 with SMTP id
 ds11-20020a170907724b00b009b2b9ffdc35mr20067955ejc.70.1696994934156; 
 Tue, 10 Oct 2023 20:28:54 -0700 (PDT)
Received: from [192.168.69.115] (mdq11-h01-176-173-161-48.dsl.sta.abo.bbox.fr.
 [176.173.161.48]) by smtp.gmail.com with ESMTPSA id
 rn18-20020a170906d93200b0098ec690e6d7sm9218920ejb.73.2023.10.10.20.28.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 20:28:53 -0700 (PDT)
Message-ID: <676c81b6-ccaa-51a3-8d1a-65e71a7b2b92@linaro.org>
Date: Wed, 11 Oct 2023 05:28:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 3/4] hw/cpu: Introduce CPUClass::cpu_resolving_type field
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Cc: Chris Wulff <crwulff@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-s390x@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Greg Kurz <groug@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-ppc@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Rolnik <mrolnik@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>, Bin Meng <bin.meng@windriver.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Song Gao <gaosong@loongson.cn>,
 Stafford Horne <shorne@gmail.com>, Yanan Wang <wangyanan55@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>, Brian Cain <bcain@quicinc.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Huth <thuth@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20230908112235.75914-1-philmd@linaro.org>
 <20230908112235.75914-4-philmd@linaro.org>
 <87cb0174-c652-aa44-be7c-49e78e0a5003@redhat.com>
 <af78b6c9-14e5-3256-9670-c106f4942140@linaro.org>
 <35653f53-a977-02ea-28f6-6fe85b1efd5a@redhat.com>
 <a42dd7a0-e73f-8410-d096-8298da03f70d@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <a42dd7a0-e73f-8410-d096-8298da03f70d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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
X-TUID: +SPo00IP+p56

Hi Gavin,

On 25/9/23 02:24, Gavin Shan wrote:
> On 9/12/23 08:40, Gavin Shan wrote:
>> On 9/11/23 19:43, Philippe Mathieu-Daudé wrote:
>>> On 11/9/23 01:28, Gavin Shan wrote:
>>>> On 9/8/23 21:22, Philippe Mathieu-Daudé wrote:
>>>>> Add a field to return the QOM type name of a CPU class.
>>>>>
>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>>> ---


>>>>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>>>>> index 129d179937..e469efd409 100644
>>>>> --- a/include/hw/core/cpu.h
>>>>> +++ b/include/hw/core/cpu.h
>>>>> @@ -100,6 +100,7 @@ struct SysemuCPUOps;
>>>>>   /**
>>>>>    * CPUClass:
>>>>> + * @cpu_resolving_type: CPU QOM type name
>>>>>    * @class_by_name: Callback to map -cpu command line model name 
>>>>> to an
>>>>>    *                 instantiatable CPU type.
>>>>>    * @parse_features: Callback to parse command line arguments.
>>>>> @@ -148,6 +149,7 @@ struct CPUClass {
>>>>>       DeviceClass parent_class;
>>>>>       /*< public >*/
>>>>> +    const char *cpu_resolving_type;
>>>>>       ObjectClass *(*class_by_name)(const char *cpu_model);
>>>>>       void (*parse_features)(const char *typename, char *str, Error 
>>>>> **errp);
>>>>
>>>> The question is why not use CPU_RESOLVING_TYPE directly? It seems 
>>>> CPU_RESOLVING_TYPE
>>>> is exactly what you want here.
>>>
>>> Unfortunately CPU_RESOLVING_TYPE is target-specific, we want
>>> hw/core/cpu-common.c to be target-agnostic (build once for all
>>> targets). This is particularly important in the context of
>>> heterogeneous QEMU, where a single binary will be able to create
>>> CPUs from different targets.
>>>
>>
>> CPU_RESOLVING_TYPE and CPUClass::cpu_resolving_type is duplicate to
>> each other. There are two options I can figure out to avoid the
>> duplication.
>>
>> (a) move cpu_class_by_name() from hw/core/cpu-common.c to cpu.c, so that
>>      CPU_RESOLVING_TYPE can be seen. cpu.c::list_cpus() is the example.
>>
>> (b) remove hw/core/cpu-common.c::cpu_calss_by_name() and squeeze its
>>      logic to cpu.c::parse_cpu_option() since there are not too much
>>      users for it. target/arm and target/s390 needs some tweaks so that
>>      hw/core/cpu-common.c::cpu_calss_by_name() can be removed.
>>
>>      [gshan@gshan q]$ git grep \ cpu_class_by_name\(
>>      cpu.c:    oc = cpu_class_by_name(CPU_RESOLVING_TYPE, 
>> model_pieces[0]);
>>      target/arm/arm-qmp-cmds.c:    oc = 
>> cpu_class_by_name(TYPE_ARM_CPU, model->name);
>>      target/s390x/cpu_models_sysemu.c:    oc = 
>> cpu_class_by_name(TYPE_S390_CPU, info->name);
>>
>> When option (b) is taken, this series to have the checks against @oc
>> in hw/core/cpu-common.c::cpu_calss_by_name() becomes non-sense. Instead,
>> we need the same (and complete) checks in CPUClass::class_by_name() for
>> individual targets. Further more, an inline helper can be provided to do
>> the check in CPUClass::class_by_name() for individual targets.
>>
>>     include/hw/core/cpu.h
>>
>>     static inline bool cpu_class_is_valid(ObjectClass *oc, const char 
>> *parent)
>>     {
>>         if (!object_class_dynamic_cast(oc, parent) ||
>>             object_class_is_abstract(oc)) {
>>             return false;
>>         }
>>
>>         return true;
>>     }
>>
> 
> Since my series to make CPU type check unified depends on this series, 
> could
> you please share your thoughts? If you don't have bandwidth for this, I can
> improve the code based on your thoughts, and include your patches to my 
> series
> so that they can be reviewed at once. Please just let me know.

You seem to prove (b) is not useful, so we have to do (a).

Unfortunately at this moment I feel hopeless with this topic.

I don't want to delay your work further. If you find a way to integrate
both series, please go ahead. Otherwise let's drop my approach and
continue with your previous work.

I apologize I kept you waiting that long.

Regards,

Phil.

