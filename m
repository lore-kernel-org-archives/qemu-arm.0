Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp1226953ejx;
        Mon, 11 Sep 2023 02:43:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGq/FK7CUhZggPdhFmeGgaqvT/fnbXP0SGj5g6/lVkomnTMv1/6WxJcokVKEV0/T57easea
X-Received: by 2002:ac8:7d05:0:b0:40f:9f91:e0f1 with SMTP id g5-20020ac87d05000000b0040f9f91e0f1mr12151302qtb.61.1694425428264;
        Mon, 11 Sep 2023 02:43:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694425428; cv=none;
        d=google.com; s=arc-20160816;
        b=lMROjTHyk46zYn5AhQHfuiS3INlSSL4Z9EpHgI1ttcimBAHVowRgMy6w90LkESI2tP
         7Ji7kiYBojwiobkUUH2pvhB7oEyfMTeLrM8UGcTaDbs3ostw/050T8jBcmS0mj3a5n8B
         /wWy3RftbhM9N4nTVsq9dggw8OOKuFbRhgIviu/VAZJK9eRREGLpGrIEgFgMonMssoxl
         0jJ4IXTdiJ+7/yxFAx9cGqBjvME2m2EqN070Kb87r6iQ8ZI0hieY5Xg9ZzlD/bGAonKc
         fmWBYXffe5Zz7efW2Id+o+mGN4Gu+hdGtHik0ls2plTHguqqahFyDkCkl4cKnaz8ZgF6
         72jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=jmjKOQuW73CkxyzBkHVYL2o2wQ74q95ptQBD70bJNtg=;
        fh=KjiU3tbxaoqKC0GlE6WPrxSlPtVLzRqnc6cCINtWsJI=;
        b=kxjeRbXGvSQ6mVJ5J4SMJ9zg52p8Mz7dhy/Bo7LALsNZCeoR3mkiDHyV7aFn/PShKE
         xF0SBh8QXRvLeSmWOScc3CLaWYVANpk3J8W7yqbC77RgQp4Z8hZ5+EwyRWHjpBuoBOCa
         4N2ByxcQ6n3mhlo8A8xAKT7R9qjVMcjms/aOx3ubDPrc34Sn0/xpZe5KJjOnLcxj1LBx
         96no+1w3z4W+R+H3rSrN8T+2s2xkQdESrnL0oMy7kcofFdAQOItma7RPHj6jmSovncep
         okwn9534dpjIt7l/luBHSKWKKEoXejA9UPP76w7MeHreBuKEiXOfPBrgndOm7oT+ek8h
         PHAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f2PMyopQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n16-20020a05622a11d000b00403ebb30761si4591415qtk.361.2023.09.11.02.43.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Sep 2023 02:43:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f2PMyopQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qfdRu-0003aD-R4; Mon, 11 Sep 2023 05:43:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qfdRp-0003ZB-8U
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 05:43:13 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qfdRk-0003vQ-3s
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 05:43:12 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2bd6611873aso66636581fa.1
 for <qemu-arm@nongnu.org>; Mon, 11 Sep 2023 02:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694425386; x=1695030186; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jmjKOQuW73CkxyzBkHVYL2o2wQ74q95ptQBD70bJNtg=;
 b=f2PMyopQmLdegxN/11jahK6fgxWi458StEtOphpE7uf1d5MKvhmZDw8VNQYAyzLcHk
 ZcSk8W5FQmAPgiXtGygsxyVced55hUK9ByW+Ml7ylsdidM63Yajv1UMyldCeZLBw4xGU
 THD2KQwXDYBSjDov+BqxirBP1f+fvHHPofDE2zisL431Ldn29y1liAMTLEmPsaNs5KvK
 Xg0vCr71+ukV3xA33VI1FIGLpxFIy7qPU15zVMgu4HVumA8OesGlItgHONd0TiGYOi+g
 RrZX7ojocWENrMnBcL95lx+Ryp1rVn5c0JL54WwkYFTwuImCFZigLdgjGlljWZja/1LE
 hIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694425386; x=1695030186;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jmjKOQuW73CkxyzBkHVYL2o2wQ74q95ptQBD70bJNtg=;
 b=utQSmfXof/ZbZ20FHIdMVOV0bfff61YG2/QRxVxcGrTs/xmA2hZ1CqL2EQufgzda2p
 fSKBFz9A5wZ4y5V9wUvKII2MwNxXDKJFXHH6YFeqeMSDR5L/+jhNdzRRlldRY2a90CNR
 tuPlzgYokboPHNckoh5Nrd7rfFQ38wQYxyjyP8RbnwEKK3O0U4gdwcU968+NYnJEND7I
 ZXGYTlH21atS3SqkaelBn262QnGDQUgOIe+ziJfsmUvsU+UlFuqrQGX3OXFnGj1MBdIG
 8WLZt+IQxjTiGJCyQ3DRs1KPlwSngwqk3l+Rh11ML9c6AOLFuAxm2cO2gC1oemkt3G9a
 D6Bg==
X-Gm-Message-State: AOJu0Yyj++OQi6dwaQ5w3o/r4uneJ8qpP1tih+DLbtFwTSHGYfckdCDL
 SC7hPuFGXzc8+TZrg5cWCsZZRw==
X-Received: by 2002:a2e:9303:0:b0:2bd:b99:ab7e with SMTP id
 e3-20020a2e9303000000b002bd0b99ab7emr7401965ljh.42.1694425386023; 
 Mon, 11 Sep 2023 02:43:06 -0700 (PDT)
Received: from [192.168.69.115] (tfy62-h01-176-171-221-76.dsl.sta.abo.bbox.fr.
 [176.171.221.76]) by smtp.gmail.com with ESMTPSA id
 si28-20020a170906cedc00b009786c8249d6sm5134068ejb.175.2023.09.11.02.43.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Sep 2023 02:43:05 -0700 (PDT)
Message-ID: <af78b6c9-14e5-3256-9670-c106f4942140@linaro.org>
Date: Mon, 11 Sep 2023 11:43:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87cb0174-c652-aa44-be7c-49e78e0a5003@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x229.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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
X-TUID: IyoC7Ln8Aehr

On 11/9/23 01:28, Gavin Shan wrote:
> Hi Philippe,
> 
> On 9/8/23 21:22, Philippe Mathieu-Daudé wrote:
>> Add a field to return the QOM type name of a CPU class.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/hw/core/cpu.h   | 2 ++
>>   hw/core/cpu-common.c    | 2 +-
>>   target/alpha/cpu.c      | 1 +
>>   target/arm/cpu.c        | 1 +
>>   target/avr/cpu.c        | 1 +
>>   target/cris/cpu.c       | 1 +
>>   target/hexagon/cpu.c    | 1 +
>>   target/hppa/cpu.c       | 1 +
>>   target/i386/cpu.c       | 1 +
>>   target/loongarch/cpu.c  | 1 +
>>   target/m68k/cpu.c       | 1 +
>>   target/microblaze/cpu.c | 1 +
>>   target/mips/cpu.c       | 1 +
>>   target/nios2/cpu.c      | 1 +
>>   target/openrisc/cpu.c   | 1 +
>>   target/ppc/cpu_init.c   | 1 +
>>   target/riscv/cpu.c      | 1 +
>>   target/rx/cpu.c         | 1 +
>>   target/s390x/cpu.c      | 1 +
>>   target/sh4/cpu.c        | 1 +
>>   target/sparc/cpu.c      | 1 +
>>   target/tricore/cpu.c    | 1 +
>>   target/xtensa/cpu.c     | 1 +
>>   23 files changed, 24 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>> index 129d179937..e469efd409 100644
>> --- a/include/hw/core/cpu.h
>> +++ b/include/hw/core/cpu.h
>> @@ -100,6 +100,7 @@ struct SysemuCPUOps;
>>   /**
>>    * CPUClass:
>> + * @cpu_resolving_type: CPU QOM type name
>>    * @class_by_name: Callback to map -cpu command line model name to an
>>    *                 instantiatable CPU type.
>>    * @parse_features: Callback to parse command line arguments.
>> @@ -148,6 +149,7 @@ struct CPUClass {
>>       DeviceClass parent_class;
>>       /*< public >*/
>> +    const char *cpu_resolving_type;
>>       ObjectClass *(*class_by_name)(const char *cpu_model);
>>       void (*parse_features)(const char *typename, char *str, Error 
>> **errp);
> 
> The question is why not use CPU_RESOLVING_TYPE directly? It seems 
> CPU_RESOLVING_TYPE
> is exactly what you want here.

Unfortunately CPU_RESOLVING_TYPE is target-specific, we want
hw/core/cpu-common.c to be target-agnostic (build once for all
targets). This is particularly important in the context of
heterogeneous QEMU, where a single binary will be able to create
CPUs from different targets.

> Besides, I guess the changes can be 
> squeezed into two
> patches (commits) as below:
> 
> PATCH[1] target/alpha: Tidy up alpha_cpu_class_by_name()
> PATCH[2] Move the checks (oc == NULL || object_class_is_abstract() || 
> !object_class_dynamic_cast())
>           from individual targets to 
> hw/core/cpu-common.c::cpu_class_by_name()
> 
> I rebase my series of '[PATCH v3 00/32] Unified CPU type check' on top 
> of yours. Please
> let me know if I need to include your patch into my v4 series for 
> review. In that case,
> I can include your patches with above changes applied.
> 
> Thanks,
> Gavin
> 
>> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
>> index c6a0c9390c..2d24261a6a 100644
>> --- a/hw/core/cpu-common.c
>> +++ b/hw/core/cpu-common.c
>> @@ -155,7 +155,7 @@ ObjectClass *cpu_class_by_name(const char 
>> *typename, const char *cpu_model)
>>       assert(cpu_model);
>>       oc = object_class_by_name(typename);
>>       cc = CPU_CLASS(oc);
>> -    assert(cc->class_by_name);
>> +    assert(cc->cpu_resolving_type && cc->class_by_name);
>>       oc = cc->class_by_name(cpu_model);
>>       if (oc == NULL || object_class_is_abstract(oc)) {
>>           return NULL;

