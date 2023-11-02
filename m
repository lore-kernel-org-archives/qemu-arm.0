Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp199181eja;
        Thu, 2 Nov 2023 00:19:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/3V/UhSAu5DOsCZckwv4lq99fhPimz5WBv4PZWjUBjhVtkkzHgTNcz9sU8P21XhAHM1xh
X-Received: by 2002:a05:622a:11cf:b0:410:9089:6b77 with SMTP id n15-20020a05622a11cf00b0041090896b77mr23082291qtk.10.1698909554998;
        Thu, 02 Nov 2023 00:19:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698909554; cv=none;
        d=google.com; s=arc-20160816;
        b=yBkmr8Z+jbuSVHtFKb7h2JKA+z4qqoGfD1xFzh+5PW7L0E++Mz9qFE1lq4SFtGA10K
         eakO+aBqFrM1dzqPozh9ib6Q6h1MWQ+I/K5gxhxrYYQvf1q1FT1duUgWaEMgQAf2M7+b
         pwe9lIMRJCFRbcFHD4peHJHzOPgeFiAZqQi8b8bHQZOm4i7NXirLqr+6XtHVYiFcNNjT
         +z8uNfgw9vOxz6tAIGCWfLOwx+jpDwyqDfO2v6eT0jllT4AialxnjVRBJsLQ0q45pobW
         RHtWWtUHM6CU4Oc5rocJKMkyJRCZCYopvoDs6e0NUnXhqr/8LJgLeyv1p3Lk0exsPoUP
         FFGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:references:to:from:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=ZVvKGRMAa/rMtwa7iaV3I70mDb1RhhCre61fd44Qwtc=;
        fh=DuEaqkrjC096WqKe5kAiiFohIK1bqLCXeTtEKvSjoDg=;
        b=1D7xDpiNH4oK4o3aW6gZtGlbCx5BIpeaLzGymHpJxkVTG0Oh0D2xRp4iSzToaSxBAu
         GGwNuXTEPlkaCvVzzZRiZkGq1ZxDrsgVVR6bKnYe0Dbl1BYq6hi7OmghWs+oiQ5S36Sq
         JUDwoDiSIeVjaPU05lG6CNt9ZJSM67rwHR1e5Sh9NfnIj60kP88drSrqljyKIIHDAL7M
         vLiIZqMHWWkX1rvzEWopXxUUOIgGNcy5vlxeQXCs99Mt7zL0r5Er6M3PTptgOavx7SQs
         Vcr7kbF8p6Dk5zuQ/afPTFhFbq8MD9AXCicVCHdFYSzQj3+x35Iwg/yVgDUTgWl6uXxw
         U9Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YBPqmd9H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p17-20020a05622a049100b004180387dcc0si3842819qtx.605.2023.11.02.00.19.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 00:19:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YBPqmd9H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyRyt-0002IT-OU; Thu, 02 Nov 2023 03:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyRyr-0002ID-VS
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 03:19:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyRyq-0006pO-5C
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 03:19:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698909542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZVvKGRMAa/rMtwa7iaV3I70mDb1RhhCre61fd44Qwtc=;
 b=YBPqmd9HLHJDdvQuLa7pmCBpFrk8u4o48WYwNQTCqPoeK9BcHHJMe9LRmHsXlpSX2sNwF/
 xtD2SiKcH5ozu7FBfYCHkphKq/zg95yB2Ok/+sxpFdinM0cfHIHKNwmQO4c2TyNi+Rw4Sd
 5N1SoBnnOx7dkPyefVWcLv7tD4o3bZQ=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-zCGremJCPtCCQ3_gJCrsCw-1; Thu, 02 Nov 2023 03:19:01 -0400
X-MC-Unique: zCGremJCPtCCQ3_gJCrsCw-1
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-1cc23f2226bso5072315ad.2
 for <qemu-arm@nongnu.org>; Thu, 02 Nov 2023 00:19:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698909540; x=1699514340;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZVvKGRMAa/rMtwa7iaV3I70mDb1RhhCre61fd44Qwtc=;
 b=fCDccIJgVCdh6r4PjJdt+Ffy5AyHKs2qavLCDHvKVtARHk5umOfpwdqSx14idZ2EKy
 JhmkOtCksVmNPced5dkeS0/pB5GHXMd+aLyvUy3OrwlL2aUQN17qjOyxgkwqkcSya9wd
 D9lczUh3lO/HCIHdcWiz1i7hhZjjsxv+DLKpyRfERTN1zNCjB2p2YZ9g8ITbShVolhb5
 5P2Kjm0fe+powywXdTqFQRuc7QP0Opb+WudhCzlA8ZxvnGmjBWIYv6Y0tGFR5kT4MVxC
 blr+fe8tL5NoX6k4IVV81DlDAII2rFlOQorMdS440f5d9oUJfKCiUI0nT+ME6RhXMdrg
 nb5g==
X-Gm-Message-State: AOJu0YyQw6c+9jurihfSF29HA6WdiMdR+PKvODOmwoASRKwAwUEaKdpz
 kIPzvCxlMIzP80DXelW1TIKgILPw5BYCdOKResULncr3iKwXIZiNM+fqotFIEJyVVAQo8FdeNyr
 EVL4EZoVPYmMc
X-Received: by 2002:a17:902:e847:b0:1cc:4559:ca with SMTP id
 t7-20020a170902e84700b001cc455900camr11678255plg.47.1698909540345; 
 Thu, 02 Nov 2023 00:19:00 -0700 (PDT)
X-Received: by 2002:a17:902:e847:b0:1cc:4559:ca with SMTP id
 t7-20020a170902e84700b001cc455900camr11678244plg.47.1698909539957; 
 Thu, 02 Nov 2023 00:18:59 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15?
 ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a170902bccb00b001c0a414695bsm2407302pls.43.2023.11.02.00.18.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Nov 2023 00:18:59 -0700 (PDT)
Message-ID: <2af40cad-ae5f-4251-b9eb-38403def54eb@redhat.com>
Date: Thu, 2 Nov 2023 17:18:56 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/33] target/arm: Use generic helper to show CPU model
 names
From: Gavin Shan <gshan@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
References: <20231102002500.1750692-1-gshan@redhat.com>
 <20231102002500.1750692-7-gshan@redhat.com>
 <85bf076c-a329-4459-afb0-df83ccf643e2@linaro.org>
 <d8e41c83-1a81-4bf1-b77f-489774afd738@redhat.com>
In-Reply-To: <d8e41c83-1a81-4bf1-b77f-489774afd738@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: xJLUPQsKC7ja

On 11/2/23 16:15, Gavin Shan wrote:
> On 11/2/23 14:12, Richard Henderson wrote:
>> On 11/1/23 17:24, Gavin Shan wrote:
>>> For target/arm, the registered CPU type name is always the combination
>>> of the CPU model name and suffix. Use cpu_model_from_type() to show the
>>> CPU model names. In arm_cpu_list_entry(), @name is renamed to @model
>>> since it points to CPU model name instead of CPU type name.
>>>
>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>> ---
>>>   target/arm/arm-qmp-cmds.c |  6 ++----
>>>   target/arm/helper.c       | 12 +++++-------
>>>   2 files changed, 7 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
>>> index b53d5efe13..c8c712a2c6 100644
>>> --- a/target/arm/arm-qmp-cmds.c
>>> +++ b/target/arm/arm-qmp-cmds.c
>>> @@ -233,12 +233,10 @@ static void arm_cpu_add_definition(gpointer data, gpointer user_data)
>>>       ObjectClass *oc = data;
>>>       CpuDefinitionInfoList **cpu_list = user_data;
>>>       CpuDefinitionInfo *info;
>>> -    const char *typename;
>>> +    const char *typename = object_class_get_name(oc);
>>> -    typename = object_class_get_name(oc);
>>>       info = g_malloc0(sizeof(*info));
>>> -    info->name = g_strndup(typename,
>>> -                           strlen(typename) - strlen("-" TYPE_ARM_CPU));
>>> +    info->name = cpu_model_from_type(typename);
>>>       info->q_typename = g_strdup(typename);
>>>       QAPI_LIST_PREPEND(*cpu_list, info);
>>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>>> index 5dc0d20a84..baf4b104ef 100644
>>> --- a/target/arm/helper.c
>>> +++ b/target/arm/helper.c
>>> @@ -9436,17 +9436,15 @@ static void arm_cpu_list_entry(gpointer data, gpointer user_data)
>>>   {
>>>       ObjectClass *oc = data;
>>>       CPUClass *cc = CPU_CLASS(oc);
>>> -    const char *typename;
>>> -    char *name;
>>> +    const char *typename = object_class_get_name(oc);
>>> +    char *model = cpu_model_from_type(typename);
>>> -    typename = object_class_get_name(oc);
>>> -    name = g_strndup(typename, strlen(typename) - strlen("-" TYPE_ARM_CPU));
>>>       if (cc->deprecation_note) {
>>> -        qemu_printf("  %s (deprecated)\n", name);
>>> +        qemu_printf("  %s (deprecated)\n", model);
>>>       } else {
>>> -        qemu_printf("  %s\n", name);
>>> +        qemu_printf("  %s\n", model);
>>>       }
>>> -    g_free(name);
>>> +    g_free(model);
>>>   }
>>
>> Rather than adjust this target by target, I think you can create one single cpu_list function out to cpu-common.c using TYPE_CPU, not even CPU_RESOLVING_TYPE.  All of the target-specific code could go away.
>>
> 
> Actually I thought of this scheme before. Some targets like x86/ppc/s390 don't follow
> the unified pattern. However, I think it's reasonable to have a common helper for other
> targets who follow the fixed pattern. The point is to avoid duplicate code. I will have
> something like below in v5.
> 
> --- cpu-target.c ---
> 
> #ifndef cpu_list
> static void cpu_list_entry(gpointer data, gpointer user_data)
> {
>      const char *typename = object_class_get_name(OBJECT_CLASS(data));
>      g_autofree char *model = cpu_model_from_type(typename);
> 
>      if (cc->deprecation_note) {
>          qemu_printf("  %s (deprecated)\n", model);
>      } else {
>          qemu_printf("  %s\n", model);
>      }
> }
> 
> static void cpu_list(void)
> {
>      GSList *list;
> 
>      list = object_class_get_list_sorted(TYPE_CPU, false);
>      qemu_printf("Available CPUs:\n");
>      g_slist_foreach(list, cpu_list_entry, NULL);
>      g_slist_free(list);
> }
> #endif
> 
> void list_cpus(void)
> {
>      cpu_list();
> }
> 
> One question is how list_cpus() can be called from bsd-user/main.c where cpu_list()
> is still used.
> 

I think all functions in cpu-target.c are visible to bsd-user/main.c because
parse_cpu_option() is also called from bsd-user/main.c. Hopefully I get correct
in this regard.

Thanks,
Gavin

