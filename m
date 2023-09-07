Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp56498ejb;
        Thu, 7 Sep 2023 16:45:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqHDxfytaAkNtNjrH73FVig5ej0ypMJ++RxkwqP5Phf4S+HWmO6QSPUmh9cyVWYf+Jd9Gu
X-Received: by 2002:a05:620a:28c1:b0:76e:e68d:149b with SMTP id l1-20020a05620a28c100b0076ee68d149bmr1128813qkp.50.1694130308900;
        Thu, 07 Sep 2023 16:45:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694130308; cv=none;
        d=google.com; s=arc-20160816;
        b=nQ5sHm8zOTBbumxbpuSMhV9MeSaDRbnsdYjHTtUUzoKQjkxAFf4T10FZtwEGp3gXsI
         /S4j76rvId94dcJCRR3h2Zu6U81MsdzbxJyWGMbqphK7v7ptOl8bOQSnwrNfe5Sm/470
         fp2jTp6zdtFpClqytX8Yxmqr9AlJ52cv859ogSJt3qH7Ql+AYVBXg8/WXM1D6eOTKsR8
         IV8qH6b3nyJtQP420UqgyL67HNEmYMEuIVd6zunY3I8JQmtYB7J/q8YrPyszXaErLUGb
         b/aIreDyaTLQkM/mUC6KtBrTBjc6q/W/kzuE6437Fa5St4zY8LyH1+Jv3VUa9DgnZfbF
         YoCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=auFvH47RQsTJlEWgbS6R9mPJHb1EUu2ooesuyxdHYpE=;
        fh=CSO+xP+eyEMPhmWo3nfwejT6bjI5Rc2ee72Q7STLHvs=;
        b=nBO/CQ9xEnc9SjxeJ6qdASzXILW/kJY/xVNyOGeoQX/Q8ySdgkLjXqgihRuFuwV8p/
         4N96DNke2yL0faDsh/IBaSi1BRNT86KnpfQEKeqqv4BWgqHxeCpqzQPg60IujeiYvhFo
         bm282cU6bwt8wY+XzQjl1fIcyjQZhkdqQX7f2NA8DSIJD1VqwvBraqp6c4KVaOJ/sNnZ
         ZuOn070OMWOXgvkDf91fnOXekLecQkipc51ARYGYFdljAS+mDf3DkxzIdf0JBIPvY+uZ
         y63H8n50EsJ3Mxh+VX8Mdy9RZh+PGYT4TIcKHEFfNxqr1uISKMbzBGuXqoOWcAABRsoi
         r8XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ACLINhdC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5-20020a05620a244500b0076ee8f86e8csi374102qkn.90.2023.09.07.16.45.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Sep 2023 16:45:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ACLINhdC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qeOfr-000686-HP; Thu, 07 Sep 2023 19:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qeOfq-00066l-6G
 for qemu-arm@nongnu.org; Thu, 07 Sep 2023 19:44:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qeOfl-0002rh-EH
 for qemu-arm@nongnu.org; Thu, 07 Sep 2023 19:44:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694130268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=auFvH47RQsTJlEWgbS6R9mPJHb1EUu2ooesuyxdHYpE=;
 b=ACLINhdCOWW7HUQwHhpo4AR6p8UXzo7d8ZgSwnXJdchHo8heJTsn1vQAQ3oDsV2xEEzXtb
 9aQlBmUym7mSLYRIqrLrwt0Cq+qZTtfU6sp9XVC94bXCpcQuW1FDpDU5egeh7CIh7C9mDm
 5LPSSdzntcBJslN1cPtEAI+GGx5+2Jo=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-zcDfQOwNN2G27kKlDyMylQ-1; Thu, 07 Sep 2023 19:44:27 -0400
X-MC-Unique: zcDfQOwNN2G27kKlDyMylQ-1
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-1c091a563ecso21593745ad.0
 for <qemu-arm@nongnu.org>; Thu, 07 Sep 2023 16:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694130266; x=1694735066;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=auFvH47RQsTJlEWgbS6R9mPJHb1EUu2ooesuyxdHYpE=;
 b=XtpVnoNiPklKyU5d178pxQUJGI82+tMlC9EW2JOH8u4tc+qmdFu4AiykTaZVyLfgl7
 xC/fvPswCkyYIIgJcr0korO0w9HLkgQWIWeWYgCYcvOvq700R0FnjNWvB7GIXZOXc90s
 RTndnOuE2hMlcdbmq91HE75fSwK9/B4CJAcRlUYpoWLb9f2VaXcANTAOGsVWTXI01PkU
 29my7YNHeWt+ZDrF3Z2znvgj2wAUOanAUrS1l1cb3J5xYx+kFN2MobS6C9xWLkUD2Eyo
 KcVJigAVWJjAw232T+7NQlZqqacL89FoUxOzznrTFIHR4k4yeEwq2ecE/g7UJsPu9Pkk
 NTpg==
X-Gm-Message-State: AOJu0YwyYt3gTwYOHlxeD9mSatsAcj6St3AUvXf/QwYFkmcxUgJxqyZx
 AV4GjssKTX9s/1HgtxKoQp8JQ34p4ZV8MYlwY+gCZ2vbvTLpURBPkh3rUaIbEyjrOnTz1nOHCuV
 1LFuALcKiFiVp
X-Received: by 2002:a17:902:c1c4:b0:1c1:e53a:c2f with SMTP id
 c4-20020a170902c1c400b001c1e53a0c2fmr962847plc.27.1694130266056; 
 Thu, 07 Sep 2023 16:44:26 -0700 (PDT)
X-Received: by 2002:a17:902:c1c4:b0:1c1:e53a:c2f with SMTP id
 c4-20020a170902c1c400b001c1e53a0c2fmr962829plc.27.1694130265736; 
 Thu, 07 Sep 2023 16:44:25 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5?
 ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a1709028ec200b001b89a6164desm289730plo.118.2023.09.07.16.44.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 16:44:22 -0700 (PDT)
Message-ID: <ab07d81c-da98-a270-c3f6-0625912c6d0b@redhat.com>
Date: Fri, 8 Sep 2023 09:44:03 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 15/32] target/s390x: Use generic helper to show CPU
 model names
To: David Hildenbrand <david@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, imp@bsdimp.com, kevans@freebsd.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, peter.maydell@linaro.org, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 wuhaotsh@google.com, nieklinnenbank@gmail.com, rad@semihalf.com,
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org, laurent@vivier.eu,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org,
 mrolnik@gmail.com, edgar.iglesias@gmail.com, bcain@quicinc.com,
 gaosong@loongson.cn, yangxiaojuan@loongson.cn, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, crwulff@gmail.com, marex@denx.de, shorne@gmail.com,
 clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 npiggin@gmail.com, ysato@users.sourceforge.jp, thuth@redhat.com,
 iii@linux.ibm.com, mark.cave-ayland@ilande.co.uk, atar4qemu@gmail.com,
 kbastian@mail.uni-paderborn.de, jcmvbkbc@gmail.com, pbonzini@redhat.com,
 imammedo@redhat.com, shan.gavin@gmail.com
References: <20230907003553.1636896-1-gshan@redhat.com>
 <20230907003553.1636896-16-gshan@redhat.com>
 <698b58e2-0c41-856d-cd79-71c8d0b3ff79@redhat.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <698b58e2-0c41-856d-cd79-71c8d0b3ff79@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
X-TUID: C5CKQ+1itYhT


On 9/7/23 18:20, David Hildenbrand wrote:
> On 07.09.23 02:35, Gavin Shan wrote:
>> For target/s390x, the CPU type name is always the combination of the
>> CPU modle name and suffix. The CPU model names have been correctly
>> shown in s390_print_cpu_model_list_entry() and create_cpu_model_list().
>>
>> Use generic helper cpu_model_from_type() to show the CPU model names
>> in the above two functions. Besides, we need validate the CPU class
>> in s390_cpu_class_by_name(), as other targets do.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   target/s390x/cpu_models.c        | 18 +++++++++++-------
>>   target/s390x/cpu_models_sysemu.c |  9 ++++-----
>>   2 files changed, 15 insertions(+), 12 deletions(-)
>>
>> diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
>> index 91ce896491..103e9072b8 100644
>> --- a/target/s390x/cpu_models.c
>> +++ b/target/s390x/cpu_models.c
>> @@ -338,7 +338,8 @@ static void s390_print_cpu_model_list_entry(gpointer data, gpointer user_data)
>>   {
>>       const S390CPUClass *scc = S390_CPU_CLASS((ObjectClass *)data);
>>       CPUClass *cc = CPU_CLASS(scc);
>> -    char *name = g_strdup(object_class_get_name((ObjectClass *)data));
>> +    const char *typename = object_class_get_name((ObjectClass *)data);
>> +    char *model = cpu_model_from_type(typename);
>>       g_autoptr(GString) details = g_string_new("");
>>       if (scc->is_static) {
>> @@ -355,14 +356,12 @@ static void s390_print_cpu_model_list_entry(gpointer data, gpointer user_data)
>>           g_string_truncate(details, details->len - 2);
>>       }
>> -    /* strip off the -s390x-cpu */
>> -    g_strrstr(name, "-" TYPE_S390_CPU)[0] = 0;
>>       if (details->len) {
>> -        qemu_printf("s390 %-15s %-35s (%s)\n", name, scc->desc, details->str);
>> +        qemu_printf("s390 %-15s %-35s (%s)\n", model, scc->desc, details->str);
>>       } else {
>> -        qemu_printf("s390 %-15s %-35s\n", name, scc->desc);
>> +        qemu_printf("s390 %-15s %-35s\n", model, scc->desc);
>>       }
>> -    g_free(name);
>> +    g_free(model);
>>   }
>>   static gint s390_cpu_list_compare(gconstpointer a, gconstpointer b)
>> @@ -916,7 +915,12 @@ ObjectClass *s390_cpu_class_by_name(const char *name)
>>       oc = object_class_by_name(typename);
>>       g_free(typename);
>> -    return oc;
>> +    if (object_class_dynamic_cast(oc, TYPE_S390_CPU) &&
>> +        !object_class_is_abstract(oc)) {
>> +        return oc;
>> +    }
>> +
>> +    return NULL;
> 
> Why is that change required?
> 

Good question. It's possible that other class's name conflicts with
CPU class's name. For example, class "abc-base-s390x-cpu" has been
registered for a misc class other than a CPU class. We don't want
s390_cpu_class_by_name() return the class for "abc-base-s390x-cpu".
Almost all other target does similar check.

Thanks,
Gavin

