Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp1650463ejx;
        Mon, 11 Sep 2023 15:41:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPf3Wtc31xpjoizqx7VFioX3FJ4ZGjeHr5L3SDABKJDP/2UULFLis1ucFWmHanud70S7Ce
X-Received: by 2002:a1f:4b81:0:b0:48d:1b20:268e with SMTP id y123-20020a1f4b81000000b0048d1b20268emr8655102vka.10.1694472079317;
        Mon, 11 Sep 2023 15:41:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694472079; cv=none;
        d=google.com; s=arc-20160816;
        b=zDgE6kPdSIkQ0Oz58q3wD62cbF0kKI2/K1Mhtihq5IM23/lyJLy+N8/UKljTfahm4W
         QXCxUG90ajy8mNdHYrmh52ZUmPfLaHVFsusOoLo10db8Rs9lm+BC+rOuMT8Nn+n51aBx
         pGqL/8R99wOws9ACroY9amIZQX91eN1LCY2Qkhx7XKg1E3b7hlgw1v4OOZsvZCJoEDn2
         kJBiaEFeQCfTsu3Xkh/iy9yTZMQc8wu566sUcffkBs7Bq5AiNwZgKtN11io2QnUtD0se
         r9uFeiwH0FLwLZ1UnZI32ySBiJuoMuHU8HuJCFgs83/ccmJDO6lCUAkCxhkruFmOb7dl
         Ksgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=9jsh/ygEfJhVGAYXcW+fsIqXOFyWRWwqCGx99xPmbqw=;
        fh=umzWOJsUp6qBpMZfaR/35tHg7PJylqVzX5Du8QxP/Gc=;
        b=AC5wvkhxjnDcH28IOoEd0LArAwv/FuUecPTzJMu+IkfVK+rHiY+dinDmfk2pF9PA2c
         jUadB4vLvJpYsUm28Q35fETUqKn7udlk95j0uK/54KRY02m66QMX+pu4P97gaz5+u/gh
         jsuCh74rwi9Mvq1b5SWee6YJzav0rQZo8R4f63KG2cpiSHQJIo1b2UnGH3JbNuheGGvJ
         s+5+k3T/OqcIuI5maZtcFiCYlMlGJbrWKoxowVIkEnJvx1ltn1s4oSoqIFhw/lK4y2zm
         4Ftz9k7flY0RvDbmjen6NO8zmSlVPpXvqf6rgPmzvQOOgNwpKiBlLU2YSH9/ECi73b2Q
         LNRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WyXWtzRW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12-20020a05620a084c00b0076ee8f45fdbsi5129536qku.203.2023.09.11.15.41.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Sep 2023 15:41:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WyXWtzRW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qfpaF-0005jR-6K; Mon, 11 Sep 2023 18:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qfpaE-0005ht-8U
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 18:40:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qfpa9-0006Jb-4q
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 18:40:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694472035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9jsh/ygEfJhVGAYXcW+fsIqXOFyWRWwqCGx99xPmbqw=;
 b=WyXWtzRWJoiA/+YC89cCtvkkWWAuO2bjs8Z1s/tDsrXk8JdGFcto17d4Y/GaHhpzw1iSgj
 yrKErElgQyHqW1QshXirjjRFWbLNg9zImzYqEd6tFL2bNEn9SDWRaP6ZORrjN7Sqd4IIN5
 15OPD44BHd4DS4bDl67JN+1ktIVyw6Y=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-303-MnurFnP1PrKOLNbRvQBIkQ-1; Mon, 11 Sep 2023 18:40:34 -0400
X-MC-Unique: MnurFnP1PrKOLNbRvQBIkQ-1
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-68faf55989cso2928935b3a.3
 for <qemu-arm@nongnu.org>; Mon, 11 Sep 2023 15:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694472033; x=1695076833;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9jsh/ygEfJhVGAYXcW+fsIqXOFyWRWwqCGx99xPmbqw=;
 b=E8+VPLMeyrOPiYn6JooAa1kVln+iQ2UFjkROX/PWvFGrId9Zs7FwPOwkSKiqgqm5ce
 0A5N2JrfR05iT27jxsspWSCC9KH4sQky7hvaNO/KDCe/5ltPEBPPmn3OXe9FJ7Va2HD0
 CJ252cz0SaB5vWz4A8JH1xIRMlVCpektlfDg6dqaqAbAHg3XD6sFJuXtU6schq7lJhXp
 bHQr4hz4wUrJbeXSfnl2aXfyxb15OPZEWHmrx2b8dPa2f2o6bVnt6rWYUPIdmbeTOSiV
 pgzK0K6yCt7C8bAdD3Jm2JRY1tzIzz9cx6XiwRT81g5X4IEWW0ddQaKrvCUm2JDUMQG7
 6F8g==
X-Gm-Message-State: AOJu0YyILuAlogubWqUWdpD/LdMTUdrmom2jAHHafcIfNEJfiKam88f7
 SldVTplwBxkHvN+0uKTUhSUCzZGqvQsWfrbZ3mlBaGioxUOfyke/NmHBNE77dkpZf2OHPhNc+Pt
 EgGPpOncdmfYw
X-Received: by 2002:a05:6a00:14d0:b0:68e:417c:ed5c with SMTP id
 w16-20020a056a0014d000b0068e417ced5cmr10594275pfu.32.1694472033413; 
 Mon, 11 Sep 2023 15:40:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:14d0:b0:68e:417c:ed5c with SMTP id
 w16-20020a056a0014d000b0068e417ced5cmr10594259pfu.32.1694472033042; 
 Mon, 11 Sep 2023 15:40:33 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5?
 ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
 by smtp.gmail.com with ESMTPSA id
 z24-20020aa785d8000000b0067aea93af40sm6124067pfn.2.2023.09.11.15.40.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Sep 2023 15:40:31 -0700 (PDT)
Message-ID: <35653f53-a977-02ea-28f6-6fe85b1efd5a@redhat.com>
Date: Tue, 12 Sep 2023 08:40:16 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/4] hw/cpu: Introduce CPUClass::cpu_resolving_type field
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>
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
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <af78b6c9-14e5-3256-9670-c106f4942140@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: YYhqaRiLZgtC


On 9/11/23 19:43, Philippe Mathieu-Daudé wrote:
> On 11/9/23 01:28, Gavin Shan wrote:
>> On 9/8/23 21:22, Philippe Mathieu-Daudé wrote:
>>> Add a field to return the QOM type name of a CPU class.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   include/hw/core/cpu.h   | 2 ++
>>>   hw/core/cpu-common.c    | 2 +-
>>>   target/alpha/cpu.c      | 1 +
>>>   target/arm/cpu.c        | 1 +
>>>   target/avr/cpu.c        | 1 +
>>>   target/cris/cpu.c       | 1 +
>>>   target/hexagon/cpu.c    | 1 +
>>>   target/hppa/cpu.c       | 1 +
>>>   target/i386/cpu.c       | 1 +
>>>   target/loongarch/cpu.c  | 1 +
>>>   target/m68k/cpu.c       | 1 +
>>>   target/microblaze/cpu.c | 1 +
>>>   target/mips/cpu.c       | 1 +
>>>   target/nios2/cpu.c      | 1 +
>>>   target/openrisc/cpu.c   | 1 +
>>>   target/ppc/cpu_init.c   | 1 +
>>>   target/riscv/cpu.c      | 1 +
>>>   target/rx/cpu.c         | 1 +
>>>   target/s390x/cpu.c      | 1 +
>>>   target/sh4/cpu.c        | 1 +
>>>   target/sparc/cpu.c      | 1 +
>>>   target/tricore/cpu.c    | 1 +
>>>   target/xtensa/cpu.c     | 1 +
>>>   23 files changed, 24 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>>> index 129d179937..e469efd409 100644
>>> --- a/include/hw/core/cpu.h
>>> +++ b/include/hw/core/cpu.h
>>> @@ -100,6 +100,7 @@ struct SysemuCPUOps;
>>>   /**
>>>    * CPUClass:
>>> + * @cpu_resolving_type: CPU QOM type name
>>>    * @class_by_name: Callback to map -cpu command line model name to an
>>>    *                 instantiatable CPU type.
>>>    * @parse_features: Callback to parse command line arguments.
>>> @@ -148,6 +149,7 @@ struct CPUClass {
>>>       DeviceClass parent_class;
>>>       /*< public >*/
>>> +    const char *cpu_resolving_type;
>>>       ObjectClass *(*class_by_name)(const char *cpu_model);
>>>       void (*parse_features)(const char *typename, char *str, Error **errp);
>>
>> The question is why not use CPU_RESOLVING_TYPE directly? It seems CPU_RESOLVING_TYPE
>> is exactly what you want here.
> 
> Unfortunately CPU_RESOLVING_TYPE is target-specific, we want
> hw/core/cpu-common.c to be target-agnostic (build once for all
> targets). This is particularly important in the context of
> heterogeneous QEMU, where a single binary will be able to create
> CPUs from different targets.
> 

CPU_RESOLVING_TYPE and CPUClass::cpu_resolving_type is duplicate to
each other. There are two options I can figure out to avoid the
duplication.

(a) move cpu_class_by_name() from hw/core/cpu-common.c to cpu.c, so that
     CPU_RESOLVING_TYPE can be seen. cpu.c::list_cpus() is the example.

(b) remove hw/core/cpu-common.c::cpu_calss_by_name() and squeeze its
     logic to cpu.c::parse_cpu_option() since there are not too much
     users for it. target/arm and target/s390 needs some tweaks so that
     hw/core/cpu-common.c::cpu_calss_by_name() can be removed.

     [gshan@gshan q]$ git grep \ cpu_class_by_name\(
     cpu.c:    oc = cpu_class_by_name(CPU_RESOLVING_TYPE, model_pieces[0]);
     target/arm/arm-qmp-cmds.c:    oc = cpu_class_by_name(TYPE_ARM_CPU, model->name);
     target/s390x/cpu_models_sysemu.c:    oc = cpu_class_by_name(TYPE_S390_CPU, info->name);

When option (b) is taken, this series to have the checks against @oc
in hw/core/cpu-common.c::cpu_calss_by_name() becomes non-sense. Instead,
we need the same (and complete) checks in CPUClass::class_by_name() for
individual targets. Further more, an inline helper can be provided to do
the check in CPUClass::class_by_name() for individual targets.

    include/hw/core/cpu.h

    static inline bool cpu_class_is_valid(ObjectClass *oc, const char *parent)
    {
        if (!object_class_dynamic_cast(oc, parent) ||
            object_class_is_abstract(oc)) {
            return false;
        }

        return true;
    }

Thanks,
Gavin

