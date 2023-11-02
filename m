Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp176752eja;
        Wed, 1 Nov 2023 23:16:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3h4L+zBg86Pk2CIRscA/S/pPNtHcDNR3/CtttBVwjVH2SfSNffybI/Nqs8SlHcxk0iHS7
X-Received: by 2002:a05:620a:2613:b0:76c:b341:15b6 with SMTP id z19-20020a05620a261300b0076cb34115b6mr17543737qko.40.1698905800069;
        Wed, 01 Nov 2023 23:16:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698905800; cv=none;
        d=google.com; s=arc-20160816;
        b=yH/JI3PMbD8NKMeA3uUE+gOEdLEhaHYfsbW5PX+tUq4x1YycaTVQCV0+rZ42wrtVjl
         S3pJWAyw+e6AUgimshlxhQi/CLB+oaK3xgTy24iQDbA+6PTcV/DgOpioXb1jVetl5z9f
         dG8KsD4Yp6LdTgmDQulIJsKHNII3s2b/oTNgH6cWabcghARFypU9TGI/w7TZm7P6I5oL
         vTreLGrkD0CbaU5RD6blh25qIiSP+phPO7Hr985t0CKDfWoCrOiVpUbHf0r/J8O72T+3
         4z8rJYA6Y8bUDGRMVlUkKHPhE/eV0IQv1wJGhxFI3CMhzskSa9FEV3S5GgFzknBbt0oF
         0bFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=i2X6yBkDldEuRBCp9wvSR+ldJ+6jzZMZEdx9KUow4Hk=;
        fh=DuEaqkrjC096WqKe5kAiiFohIK1bqLCXeTtEKvSjoDg=;
        b=S0qF3NgElSTL09sNKLGKTkjrRCYB8ubwF4NUrDQZ1wHUiTlQXrJ5Qxx53RErPtdJy1
         zzchnE/pkkYPe55bPRYg4ItNFj6JTLEPtJzs1Qgh1sHHQ+oIp1ECrMaWEWpyOeGWLV3t
         fCkLOXtRWC5SorYfRcU4WgQ5SGILHIO7qw2ouNQzEMrC/1JKP0nDMxyDbNB+3dPYkhom
         z7R2GPXxgmmrSS99gTS3YRcrHV2l1R3laDeXeBncum1f2g9JTBTnSBy/naJHuk4cKBEQ
         x765UXSaVrT8ppR8l4rUUTYgD2VnRpeHYZEfbyX7rbQShGsvGRzggs8mSCAAaOJ0Wymg
         KNcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gM6PGcc8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y26-20020a05620a09da00b007771d46fd50si3837945qky.111.2023.11.01.23.16.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 23:16:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gM6PGcc8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyR00-00065t-AD; Thu, 02 Nov 2023 02:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyQzy-000659-Iu
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 02:16:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyQzv-0004KA-RO
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 02:16:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698905766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i2X6yBkDldEuRBCp9wvSR+ldJ+6jzZMZEdx9KUow4Hk=;
 b=gM6PGcc8BZw4YnwqvFORf4oI65X76hWVHOVJXeXWYpbx4u3NUht5o4USmTkhsq3sFaFCg/
 KmOdi8FZV3rO3uRl8BWORgel0FZkPy8yuV4rlD+6hhewohACFZ1H28O6jYQu7vrU7xrJsX
 Ht1yDY/UhM9hrjyrVrw+cXdoioQcZfM=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-qfEEHPUXMxyj4HRstX-TdA-1; Thu, 02 Nov 2023 02:16:05 -0400
X-MC-Unique: qfEEHPUXMxyj4HRstX-TdA-1
Received: by mail-oi1-f198.google.com with SMTP id
 5614622812f47-3b56bf3d7a9so968836b6e.1
 for <qemu-arm@nongnu.org>; Wed, 01 Nov 2023 23:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698905764; x=1699510564;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i2X6yBkDldEuRBCp9wvSR+ldJ+6jzZMZEdx9KUow4Hk=;
 b=DRDLV+Drvn7KeUyf+tmA5Rwvxf3fvGqMRKw5eh21eafJbv4XewCHTslRToxrEPu3Tu
 tyJGqZMZzAn0TKJSD2l2f8GlQRhkavtneEIxBiYb5XQJFacUdX2D+e8JiJtcrpuPPL31
 JEgjKelQK1rm7oqVNOm1uXiJJE1qv1u8hEo6a8mabBBplxrjzwItdan59snFQEAa3wIr
 cr40IDxJzTuJfWpPZL4wGy8BtTnTl3l8lfOxMpH68lNvM7lfSf7Nk0G7hrKyFkMD51wq
 jonEK6MZjYq+fDq21usslG/LnMia7sbtKy7shGhblJKuKKDWgxfipkbdm1D7+Jua7zvK
 FYFA==
X-Gm-Message-State: AOJu0YyMAxrEI5Q1HekVr/J1gjYwVAiQFt4j2MC0wc87JjF7l5/G2mFy
 /e33MoM5jEuEpPsRK1zP3P9sVfU2wDBh7rs88U9RZHhdYS+o3JlfOocwzQG/eTkYopHciYUVdlr
 uFTGgmBFb/OH0
X-Received: by 2002:a05:6808:191c:b0:3ad:f6a2:cfe2 with SMTP id
 bf28-20020a056808191c00b003adf6a2cfe2mr20912846oib.22.1698905764371; 
 Wed, 01 Nov 2023 23:16:04 -0700 (PDT)
X-Received: by 2002:a05:6808:191c:b0:3ad:f6a2:cfe2 with SMTP id
 bf28-20020a056808191c00b003adf6a2cfe2mr20912832oib.22.1698905764048; 
 Wed, 01 Nov 2023 23:16:04 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15?
 ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
 by smtp.gmail.com with ESMTPSA id
 x11-20020aa784cb000000b0069ee4242f89sm2203151pfn.13.2023.11.01.23.16.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Nov 2023 23:16:03 -0700 (PDT)
Message-ID: <d8e41c83-1a81-4bf1-b77f-489774afd738@redhat.com>
Date: Thu, 2 Nov 2023 16:15:59 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/33] target/arm: Use generic helper to show CPU model
 names
To: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
References: <20231102002500.1750692-1-gshan@redhat.com>
 <20231102002500.1750692-7-gshan@redhat.com>
 <85bf076c-a329-4459-afb0-df83ccf643e2@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <85bf076c-a329-4459-afb0-df83ccf643e2@linaro.org>
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
X-TUID: sFtw/e73EKHi

On 11/2/23 14:12, Richard Henderson wrote:
> On 11/1/23 17:24, Gavin Shan wrote:
>> For target/arm, the registered CPU type name is always the combination
>> of the CPU model name and suffix. Use cpu_model_from_type() to show the
>> CPU model names. In arm_cpu_list_entry(), @name is renamed to @model
>> since it points to CPU model name instead of CPU type name.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   target/arm/arm-qmp-cmds.c |  6 ++----
>>   target/arm/helper.c       | 12 +++++-------
>>   2 files changed, 7 insertions(+), 11 deletions(-)
>>
>> diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
>> index b53d5efe13..c8c712a2c6 100644
>> --- a/target/arm/arm-qmp-cmds.c
>> +++ b/target/arm/arm-qmp-cmds.c
>> @@ -233,12 +233,10 @@ static void arm_cpu_add_definition(gpointer data, gpointer user_data)
>>       ObjectClass *oc = data;
>>       CpuDefinitionInfoList **cpu_list = user_data;
>>       CpuDefinitionInfo *info;
>> -    const char *typename;
>> +    const char *typename = object_class_get_name(oc);
>> -    typename = object_class_get_name(oc);
>>       info = g_malloc0(sizeof(*info));
>> -    info->name = g_strndup(typename,
>> -                           strlen(typename) - strlen("-" TYPE_ARM_CPU));
>> +    info->name = cpu_model_from_type(typename);
>>       info->q_typename = g_strdup(typename);
>>       QAPI_LIST_PREPEND(*cpu_list, info);
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index 5dc0d20a84..baf4b104ef 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -9436,17 +9436,15 @@ static void arm_cpu_list_entry(gpointer data, gpointer user_data)
>>   {
>>       ObjectClass *oc = data;
>>       CPUClass *cc = CPU_CLASS(oc);
>> -    const char *typename;
>> -    char *name;
>> +    const char *typename = object_class_get_name(oc);
>> +    char *model = cpu_model_from_type(typename);
>> -    typename = object_class_get_name(oc);
>> -    name = g_strndup(typename, strlen(typename) - strlen("-" TYPE_ARM_CPU));
>>       if (cc->deprecation_note) {
>> -        qemu_printf("  %s (deprecated)\n", name);
>> +        qemu_printf("  %s (deprecated)\n", model);
>>       } else {
>> -        qemu_printf("  %s\n", name);
>> +        qemu_printf("  %s\n", model);
>>       }
>> -    g_free(name);
>> +    g_free(model);
>>   }
> 
> Rather than adjust this target by target, I think you can create one single cpu_list function out to cpu-common.c using TYPE_CPU, not even CPU_RESOLVING_TYPE.  All of the target-specific code could go away.
> 

Actually I thought of this scheme before. Some targets like x86/ppc/s390 don't follow
the unified pattern. However, I think it's reasonable to have a common helper for other
targets who follow the fixed pattern. The point is to avoid duplicate code. I will have
something like below in v5.

--- cpu-target.c ---

#ifndef cpu_list
static void cpu_list_entry(gpointer data, gpointer user_data)
{
     const char *typename = object_class_get_name(OBJECT_CLASS(data));
     g_autofree char *model = cpu_model_from_type(typename);

     if (cc->deprecation_note) {
         qemu_printf("  %s (deprecated)\n", model);
     } else {
         qemu_printf("  %s\n", model);
     }
}

static void cpu_list(void)
{
     GSList *list;

     list = object_class_get_list_sorted(TYPE_CPU, false);
     qemu_printf("Available CPUs:\n");
     g_slist_foreach(list, cpu_list_entry, NULL);
     g_slist_free(list);
}
#endif

void list_cpus(void)
{
     cpu_list();
}

One question is how list_cpus() can be called from bsd-user/main.c where cpu_list()
is still used.

Thanks,
Gavin

