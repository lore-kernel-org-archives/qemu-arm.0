Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp4186353ejc;
        Wed, 30 Aug 2023 00:35:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGz88sx9kHjo6fuMMUOerwLh+fyWlmz3NEWodZSHHoCe6mJQQHNBwGsua2dWGTmMUbxQL2H
X-Received: by 2002:a05:620a:28c1:b0:767:2bbc:fcc7 with SMTP id l1-20020a05620a28c100b007672bbcfcc7mr1789479qkp.14.1693380933126;
        Wed, 30 Aug 2023 00:35:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693380933; cv=none;
        d=google.com; s=arc-20160816;
        b=YI5mT+tDH1Trp7wL5szAYuEOwwnSMV9xOWw2pDESCszhH4Lk++xCOUIf6b8fXjamyD
         zZ0ViBbIvy1C6TcmWzd9rwWafRPaUNQxyvDq7cfwyUbpzqWcb9mBXpzt0YClgzgGERY5
         sLyE6Oy68bLN74nCiPwaetquJtcr2PZBSLdM4S6DGVsLA+qNNdYgt4J1DcfhU63MWQD6
         sizM50tCHk2Hx7/gKI96JP73KZajrL86+zRUf6ePJHbTpocPTf7EQ9MJP/gAKMtoB3Sa
         m9X6Z7+uaUE4s+GnXZk28t0xGxNsA1iA4lkPIArE8dzX5kHtPUEwXmRzhrVvaAy2A7fb
         BpRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7werSWx5Ui39smoCuUYu82liYHbeojLYi98Cs0wtRFA=;
        fh=jW+/Z6j5OOVkUj2O5cy47A3XiBm3LedLlRHnZsgGrII=;
        b=TQfJcxk7hwABl8gmoc7GpvDxYA7FvZojphoa7398k3G8eIAej/xwSshqCaZxVRd8EA
         q0ywv/Xsfwg3Jslqcvk3d3WsXeBY8b6hazSpjQzGFXbMRBrtC0fIGvYyuucCUZ5hP5fL
         C5MakS+RettaRzjQFfE6BXuSnnkICz4NNyya/7YgORkn2kmKtDHHWGGUxQFLKXHPN8Ze
         yHvZETVObq7BR+iYuyYvi6fk8aqKqukIVsf2yKnq8LzubvQd1yn5KsH8Ux+xpXWbtoIN
         8w/OGmeJaY5Mu2EQUKuC+1uRIgG0zp6vyfqG6Hnad5D4BMOYtuit8O3Gg62vUJV3ZRKa
         iu0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="D2m/Wvme";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id sm5-20020a05620a944500b0076eed2a7335si4800967qkn.57.2023.08.30.00.35.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Aug 2023 00:35:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="D2m/Wvme";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbFim-0005b8-8z; Wed, 30 Aug 2023 03:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qbFih-0005Zm-Ia
 for qemu-arm@nongnu.org; Wed, 30 Aug 2023 03:34:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qbFie-0001Ue-Ji
 for qemu-arm@nongnu.org; Wed, 30 Aug 2023 03:34:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693380866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7werSWx5Ui39smoCuUYu82liYHbeojLYi98Cs0wtRFA=;
 b=D2m/WvmeV+IBTbpEgfsx1PRp6PXG1y+tVBoJwAPFfJCmifLR5N7IPJ2q7ALKCCAKp/Kavh
 k+KMYBIaT6+RilytaLYBFfbSd2Pd/v4Y6MBT8C7dvKdMN6KsjHA7Afj57ZAYIb8jHnFAJN
 gsCzMsTIaB7n1R71IqgAe5xiN6ssWBk=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-FsKqmK7ZOwaH2DEPWR39Hg-1; Wed, 30 Aug 2023 03:34:25 -0400
X-MC-Unique: FsKqmK7ZOwaH2DEPWR39Hg-1
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-44d4db63bb3so2127182137.0
 for <qemu-arm@nongnu.org>; Wed, 30 Aug 2023 00:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693380865; x=1693985665;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7werSWx5Ui39smoCuUYu82liYHbeojLYi98Cs0wtRFA=;
 b=HaBytxEKn2HjkOobJbto+e7wW1Wvd16etwK3+3Pd7ST0KLQ+0nQSPG3B1t6coaTucX
 ugmRc2irwgWohhHIQdH0quzNLC6oPuUliCDlh+cU+lQ92sLQWYwydrFEwC6RlHH+t9cW
 YiDf5S1VU1B/T27TLn6HwSp8kDUHKOn/vlll5WbKWbLN3gQYpDjeQDt27SVkZMXPaAbU
 6/rmjctHfCaky1rSjmH8rPDzdJ9PtlyUxhPGFBa4dyFQxhHaOhylwgjQ5hSnJ3k+QdYy
 tJcaP0DWOD9vz9bRgWAwPvcKaNDstCWQm9FoSopb2Ccyutde5/BYcYYbX0ior6V0pHAK
 g9Kg==
X-Gm-Message-State: AOJu0YxqcKadDSqCJN22sOS4L6XFPvjXb85ndmBabUFJvxSbjOhp9WH2
 rkbAR8eWKfVPsD1lQsAW/wsSynp8L1oh+f4AeNfV3xSnmubDFX/Rizsbdo6HgHkJhBzXjhPE3Kp
 uLgrOiuAq+/Gf
X-Received: by 2002:a67:e3bb:0:b0:44d:40b1:926d with SMTP id
 j27-20020a67e3bb000000b0044d40b1926dmr1535128vsm.32.1693380864843; 
 Wed, 30 Aug 2023 00:34:24 -0700 (PDT)
X-Received: by 2002:a67:e3bb:0:b0:44d:40b1:926d with SMTP id
 j27-20020a67e3bb000000b0044d40b1926dmr1535091vsm.32.1693380864324; 
 Wed, 30 Aug 2023 00:34:24 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5?
 ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a17090a6a8b00b0026b420ae167sm695187pjj.17.2023.08.30.00.34.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 00:34:23 -0700 (PDT)
Message-ID: <a5a61f17-6792-fd53-e48b-aa9ab8fae803@redhat.com>
Date: Wed, 30 Aug 2023 17:34:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 3/8] machine: Print supported CPU models instead of
 typenames
To: Igor Mammedov <imammedo@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, laurent@vivier.eu, vijai@behindbytes.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, cohuck@redhat.com, pbonzini@redhat.com,
 shan.gavin@gmail.com, qemu-ppc@nongnu.org
References: <20230726003205.1599788-1-gshan@redhat.com>
 <20230726003205.1599788-4-gshan@redhat.com>
 <24e54bac-9149-20da-e4cf-5829a6dcb174@linaro.org>
 <0454c1ad-314c-3df6-d6e9-1a05cb4c4050@redhat.com>
 <20230727110010.648b61a6@imammedo.users.ipa.redhat.com>
 <5f26299e-f1e0-a2ab-db83-87011fe524d5@redhat.com>
 <20230828164637.52c2b5b0@imammedo.users.ipa.redhat.com>
 <6e637717-b739-3ee8-ac12-a339ea5fb166@redhat.com>
 <20230829110308.5282936f@imammedo.users.ipa.redhat.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230829110308.5282936f@imammedo.users.ipa.redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.242, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: crwPB85BcDFO

Hi Igor,

On 8/29/23 19:03, Igor Mammedov wrote:
> On Tue, 29 Aug 2023 16:28:45 +1000
> Gavin Shan <gshan@redhat.com> wrote:
>> On 8/29/23 00:46, Igor Mammedov wrote:
>>> On Mon, 31 Jul 2023 15:07:30 +1000
>>> Gavin Shan <gshan@redhat.com> wrote:
>>>> On 7/27/23 19:00, Igor Mammedov wrote:
>>>>> On Thu, 27 Jul 2023 15:16:18 +1000
>>>>> Gavin Shan <gshan@redhat.com> wrote:
>>>>>       
>>>>>> On 7/27/23 09:08, Richard Henderson wrote:
>>>>>>> On 7/25/23 17:32, Gavin Shan wrote:
>>>>>>>> -static const char *q800_machine_valid_cpu_types[] = {
>>>>>>>> +static const char * const q800_machine_valid_cpu_types[] = {
>>>>>>>>          M68K_CPU_TYPE_NAME("m68040"),
>>>>>>>>          NULL
>>>>>>>>      };
>>>>>>>> +static const char * const q800_machine_valid_cpu_models[] = {
>>>>>>>> +    "m68040",
>>>>>>>> +    NULL
>>>>>>>> +};
>>>>>>>
>>>>>>> I really don't like this replication.
>>>>>>>          
>>>>>>
>>>>>> Right, it's going to be lots of replications, but gives much flexibility.
>>>>>> There are 21 targets and we don't have fixed pattern for the mapping between
>>>>>> CPU model name and CPU typename. I'm summarizing the used patterns like below.
>>>>>>
>>>>>>       1 All CPU model names are mappinged to fixed CPU typename;
>>>>>
>>>>>            plainly spelled it would be: cpu_model name ignored and
>>>>>            a cpu type is returned anyways.
>>>>>
>>>>> I'd make this hard error right away, as "junk in => error out"
>>>>> it's clearly user error. I think we don't even have to follow
>>>>> deprecation process for that.
>>>>>       
>>>>
>>>> Right, It's not expected behavior to map ambiguous CPU model names to
>>>> the fixed CPU typename.
>>>
>>> to be nice we can deprecate those and then later remove.
>>> (while deprecating make those targets accept typenames)
>>>    
>>
>> Lets put it aside for now and revisit it later, so that we can focus on
>> the conversion from the CPU type name to the CPU model name for now.
>>
>>>>   
>>>>>>       2 CPU model name is same to CPU typename;
>>>>>>       3 CPU model name is alias to CPU typename;
>>>>>>       4 CPU model name is prefix of CPU typename;
>>>>>
>>>>> and some more:
>>>>>        5. cpu model names aren't names at all sometimes, and some other
>>>>>           CPU property is used. (ppc)
>>>>> This one I'd prefer to get rid of and ppc handling more consistent
>>>>> with other targets, which would need PPC folks to persuaded to drop
>>>>> PVR lookup.
>>>>>       
>>>>
>>>> I put this into class 3, meaning the PVRs are regarded as aliases to CPU
>>>> typenames.
>>>
>>> with PPC using 'true' aliases, -cpu input is lost after it's translated into typename.
>>> (same for alpha)
>>>
>>> it also adds an extra fun with 'max' cpu model but that boils down to above statement.
>>> (same for
>>>     * sh4
>>>     * cris(in user mode only, but you are making sysemu extension, so it doesn't count)
>>> )
>>> For this class of aliases reverse translation won't yield the same
>>> result as used -cpu. The only option you have is to store -cpu cpu_model
>>> somewhere (use qemu_opts??, and then fetch it later to print in error message)
>>>
>>> x86 has 'aliases' as well, but in reality it creates distinct cpu types
>>> for each 'alias', so it's possible to do reverse translation.
>>>    
>>
>> It's true that '-cpu input' gets lost in these cases. However, the CPU type
>> name instead of the CPU model name is printed in the error message when the
>> CPU type is validated in hw/core/machine.c::machine_run_board_init(). It looks
>> good to me to print the CPU type name instead of the model name there.
> 
> It's the same confusing whether it's type or cpumodel it it doesn't match
> user provided value.
> 

I tend to agree that it's misleading to print the CPU type name in the
error message in hw/core/machine.c::machine_run_board_init(), where the CPU
type is validated. qemu_opts may be too heavy for this. It eventually turns
to a machine's property if @machine_opts_dict is the best place to store
'-cpu input'. Besides, it doesn't fit for another case very well, where
current_machine->cpu_type = machine_class->default_cpu_type if '-cpu input'
isn't provided by user.

For simplicity, how about to add MachineState::cpu_model? It's initialized to
cpu_model_from_type(machine_class->default_cpu_type) in qemu_init(), or
g_strdump(model_pieces[0) in parse_cpu_option().


>> Another error message is printed when the CPU model specified in '-cpu input'
>> isn't valid. The CPU model has been printed and it looks good either.
>>
>>     # qemu-system-aarch64 -M virt -cpu aaa
>>     qemu-system-aarch64: unable to find CPU model 'aaa'
>>
>> Are there other cases I missed where we need to print the CPU model name, which
>> is specified by user through '-cpu input'?
>>
>>>>>>
>>>>>>       Target         Categories    suffix-of-CPU-typename
>>>>>>       -------------------------------------------------------
>>>>>>       alpha          -234          -alpha-cpu
>>>>>>       arm            ---4          -arm-cpu
>>>>>>       avr            -2--
>>>>>>       cris           --34          -cris-cpu
>>>>>>       hexagon        ---4          -hexagon-cpu
>>>>>>       hppa           1---
>>>>>>       i386           ---4          -i386-cpu
>>>>>>       loongarch      -2-4          -loongarch-cpu
>>>>>>       m68k           ---4          -m68k-cpu
>>>>>>       microblaze     1---
>>>>>>       mips           ---4          -mips64-cpu  -mips-cpu
>>>>>>       nios2          1---
>>>>>>       openrisc       ---4          -or1k-cpu
>>>>>>       ppc            --34          -powerpc64-cpu  -powerpc-cpu
>>>>>>       riscv          ---4          -riscv-cpu
>>>>>>       rx             -2-4          -rx-cpu
>>>>>>       s390x          ---4          -s390x-cpu
>>>>>>       sh4            --34          -superh-cpu
>>>>>>       sparc          -2--
>>>
>>> it's case 4
>>>    
>>
>> Yes.
>>
>>>>>>       tricore        ---4          -tricore-cpu
>>>>>>       xtensa         ---4          -xtensa-cpu
>>>>>>
>>>>>> There are several options as below. Please let me know which one or something
>>>>>> else is the best.
>>>>>>
>>>>>> (a) Keep what we have and use mc->valid_{cpu_types, cpu_models}[] to track
>>>>>> the valid CPU typenames and CPU model names.
>>>>>>
>>>>>> (b) Introduce CPUClass::model_name_by_typename(). Every target has their own
>>>>>> implementation to convert CPU typename to CPU model name. The CPU model name
>>>>>> is parsed from mc->valid_cpu_types[i].
>>>>>>
>>>>>>         char *CPUClass::model_by_typename(const char *typename);
>>>>>>
>>>>>> (c) As we discussed before, use mc->valid_cpu_type_suffix and mc->valid_cpu_models
>>>>>> because the CPU type check is currently needed by target arm/m68k/riscv where we
>>>>>> do have fixed pattern to convert CPU model names to CPU typenames. The CPU typename
>>>>>> is comprised of CPU model name and suffix. However, it won't be working when the CPU
>>>>>> type check is required by other target where we have patterns other than this.
>>>>>
>>>>> none of above is really good, that's why I was objecting to introducing
>>>>> reverse type->name mapping. That ends up with increased amount junk,
>>>>> and it's not because your patches are bad, but because you are trying
>>>>> to deal with cpu model names (which is a historically evolved mess).
>>>>> The best from engineering POV would be replacing CPU models with
>>>>> type names.
>>>>>
>>>>> Even though it's a bit radical, I very much prefer replacing
>>>>> cpu_model names with '-cpu type'usage directly. Making it
>>>>> consistent with -device/other interfaces and coincidentally that
>>>>> obsoletes need in reverse name mapping.
>>>>>
>>>>> It's painful for end users who will need to change configs/scripts,
>>>>> but it's one time job. Additionally from QEMU pov, codebase
>>>>> will be less messy => more maintainable which benefits not only
>>>>> developers but end-users in the end.
>>>>>       
>>>>
>>>> I have to clarify the type->model mapping has been existing since the
>>>> model->type mapping was introduced with the help of CPU_RESOLVING_TYPE.
>>>> I mean the logic has been existing since the existence of CPU_RESOLVING_TYPE,
>>>> even the code wasn't there.
>>>>
>>>> I'm not sure about the idea to switch to '-cpu <cpu-type-name>' since
>>>> it was rejected by Peter Maydell before. Hope Peter can double confirm
>>>> for this. For me, the shorter name is beneficial. For example, users
>>>> needn't to have '-cpu host-arm-cpu' for '-cpu host'.
>>>>
>>>>   
>>>>> [rant:
>>>>> It's the same story repeating over and over, when it comes to
>>>>> changing QEMU CLI, which hits resistance wall. But with QEMU
>>>>> deprecation process we've changed CLI behavior before,
>>>>> despite of that world didn't cease to exist and users
>>>>> have adapted to new QEMU and arguably QEMU became a tiny
>>>>> bit more maintainable since we don't have to deal some
>>>>> legacy behavior.
>>>>> ]
>>>>>       
>>>>
>>>> I need more context about 'deprecation process' here. My understanding
>>>> is both CPU typename and model name will be accepted for a fixed period
>>>> of time. However, a warning message will be given to indicate that the
>>>> model name will be obsoleted soon. Eventually, we switch to CPU typename
>>>> completely. Please correct me if there are anything wrong.
>>>
>>> yep, that's the gist of deprecation in this case.
>>>    
>>
>> Ok. Thanks for your confirm.
>>     
>>>>> Another idea back in the days was (as a compromise),
>>>>>     1. keep using keep valid_cpu_types
>>>>>     2. instead of introducing yet another way to do reverse mapping,
>>>>>        clean/generalize/make it work everywhere list_cpus (which
>>>>>        already does that mapping) and then use that to do your thing.
>>>>>        It will have drawbacks you've listed above, but hopefully
>>>>>        that will clean up and reuse existing list_cpus.
>>>>>        (only this time, I'd build it around  query-cpu-model-expansion,
>>>>>         which output is used by generic list_cpus)
>>>>>        [and here I'm asking to rewrite directly unrelated QEMU part yet again]
>>>>>       
>>>>
>>>> I'm afraid that list_cpus() is hard to be reused. All available CPU model names
>>>> are listed by list_cpus(). mc->valid_cpu_types[] are just part of them and variable
>>>> on basis of boards. Generally speaking, we need a function to do reverse things
>>>> as to CPUClass::class_by_name(). So I would suggest to introduce CPUClass::model_from_type(),
>>>> as below. Could you please suggest if it sounds reasonable to you?
>>>>
>>>> - CPUClass::class_by_name() is modified to
>>>>      char *CPUClass::model_to_type(const char *model)
>>>>
>>>> - char *CPUClass::type_to_model(const char *type)
>>>>
>>>> - CPUClass::type_to_model() is used in cpu_list() for every target when CPU
>>>>      model name, fetched from CPU type name, is printed in xxx_cpu_list_entry()
>>>>
>>>> - CPUClass::type_to_model() is reused in hw/core/machine.c to get the CPU
>>>>      model name from CPU type names in mc->valid_cpu_types[].
>>>
>>> instead of per target hooks (which are atm mostly open-coded in several places)
>>> how about adding generic handler for cases 2,4:
>>>     cpu_type_to_model(typename)
>>>        cpu_suffix = re'-*-cpu'
>>>        if (class_exists(typename - cpu_suffix))
>>>            return typename - cpu_suffix
>>>        else if (class_exists(typename))
>>>            return typename
>>>        explode
>>>
>>> that should work for translating valid_cpus typenames to cpumodel names
>>> and once that in place cleanup all open-coded translations with it tree-wide
>>>
>>> you can find those easily by:
>>> git grep _CPU_TYPE_SUFFIX
>>> git grep query_cpu_definitions
>>>    
>>
>> Thanks for the advice. I think it's enough for now since the CPU type
>> invalidation is currently done for arm/mips/riscv for now. On these
>> targets, the CPU type name is always the combination of the CPU model
>> name and suffix. I will add helper qemu/cpu.c::cpu_model_by_name()
> 
> cpu_model_from_type() would be describe what function does better.
> 

Agreed, thanks.

>> as you suggested. Note that, the suffix can be gained by ("-" CPU_RESOLVING_TYPE)
>>
>> Yes, the newly added helper cpu_model_by_name() needs to be applied
>> to targets where query_cpu_definitions and cpu_list are defined.

Thanks,
Gavin

