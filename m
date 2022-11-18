Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp118291ejx;
        Fri, 18 Nov 2022 02:14:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Vq5M74+33U5pF5bj6zFzk1q1VM/xWmnLDNOFdHc50PbTzS5NfdnLoPgKxkQ7bGnh7hob0
X-Received: by 2002:ae9:edd0:0:b0:6fa:825b:690a with SMTP id c199-20020ae9edd0000000b006fa825b690amr5125012qkg.340.1668766491301;
        Fri, 18 Nov 2022 02:14:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668766491; cv=none;
        d=google.com; s=arc-20160816;
        b=LIVUXjR3XbQfb8AqxZyosemHiuDDtH25klMc7OAI4CC7fJLmxij8F8IZIrtBVjTEcC
         pOQhtCUUk2iQohBGD0Oe1jZpD2QRvrKmXXzXmJPzCSYpeNqsqvjEuUCvJYfz8k7eCuyI
         kl9oTNnHFddnVMmBWMiauc/7kGlYYKXCUKzl9SRydFFV37duuSAc8RisPXscA0sbWVtV
         66U3Sbk7vtji1iYD+S9lDHh5BgoK5PGsOpbhk+B18+kaFt9SAIPu7yPrHxY4/wS4qV5Q
         VSpHZvoTa2+5NBpXjU/5MtZIR8YiGwv76+KSrbpXrtJ8a9sMd7EiTa8YX4z2/RhsC5ZC
         f9Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=UwF+hK0hYZHkUUTdtD+IwRx9BoEUDj8uehw69wK1ITM=;
        b=SJDSFuDO60SXBx/iMM6PCswPAcuN2awjJZ69Qf1Yry8z8S+yQ0aDmx61QXzjVG8OF2
         uDQvnvEuaa8LgsPqp0FIakEg9JbiOn0lFrMc+Ho/4YcsXeh7F7XwEY77jYnBk6i9jN7t
         ZmIB6fY9cPQiGNZq9kOmcv4yExmikYiMwd/qOqJRI/5dNYSDnjW/EnQ65/QKO5NJRFsZ
         T/z3VdMy5h4Ei3zjJrTIvp0NCs823Y9knNAzEwT04vuOyyuJquzDF6TW4+u3aLv6KFQH
         C4QNH2FKHzxAmGhYXNo7JaDFvx2wYb4nNj4izxJ7alBS7pOC+7ruF5ABGsY5drZ5mHpm
         Nhvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZcRq4wq4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j22-20020ac874d6000000b0035d20f40dbdsi1532019qtr.479.2022.11.18.02.14.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Nov 2022 02:14:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZcRq4wq4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ovyOT-0005lp-Uv; Fri, 18 Nov 2022 05:14:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ovyOR-0005hW-RJ
 for qemu-arm@nongnu.org; Fri, 18 Nov 2022 05:14:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ovyOP-0006Cv-3s
 for qemu-arm@nongnu.org; Fri, 18 Nov 2022 05:14:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668766479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UwF+hK0hYZHkUUTdtD+IwRx9BoEUDj8uehw69wK1ITM=;
 b=ZcRq4wq4zONs5aNQdCTHFYJepC+/n5ZpxF6ugnB4NNb+hCpsL/o8IZcpX84OyaUkGW9V9q
 odwKZZM1QRii9iLtCSvLi/aM1rmObsOtRwgOs1a7HDdQQDMtJPTvvPV240tdeDCZ+kEIKM
 Vb1867tYyJDF6r5pobY7cv/1VBcSYEA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-GPKWHuhbO_6o_JTy-Nu88A-1; Fri, 18 Nov 2022 05:14:34 -0500
X-MC-Unique: GPKWHuhbO_6o_JTy-Nu88A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76728833A09;
 Fri, 18 Nov 2022 10:14:33 +0000 (UTC)
Received: from localhost (unknown [10.39.193.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D3F349BB67;
 Fri, 18 Nov 2022 10:14:31 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>, Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, =?utf-8?Q?C=C3=A9dric?= Le
 Goater
 <clg@kaod.org>, David Gibson <david@gibson.dropbear.id.au>, Greg Kurz
 <groug@kaod.org>, David Hildenbrand <david@redhat.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH for-8.0] hw: Add compat machines for 8.0
In-Reply-To: <32f9a700-28f3-ada6-9526-c53cdcd3b5ac@redhat.com>
Organization: Red Hat GmbH
References: <20221111124534.129111-1-cohuck@redhat.com>
 <32f9a700-28f3-ada6-9526-c53cdcd3b5ac@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Fri, 18 Nov 2022 11:14:27 +0100
Message-ID: <87pmdksh6k.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: pyzE98kKKbkz

On Fri, Nov 18 2022, Thomas Huth <thuth@redhat.com> wrote:

> On 11/11/2022 13.45, Cornelia Huck wrote:
>> Add 8.0 machine types for arm/i440fx/m68k/q35/s390x/spapr.
>> 
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> ---
> ...
>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>> index 0ad0ed160387..1c0a7b83b545 100644
>> --- a/hw/i386/pc_piix.c
>> +++ b/hw/i386/pc_piix.c
>> @@ -435,7 +435,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
>>       machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
>>   }
>>   
>> -static void pc_i440fx_7_2_machine_options(MachineClass *m)
>> +static void pc_i440fx_8_0_machine_options(MachineClass *m)
>>   {
>>       PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>>       pc_i440fx_machine_options(m);
>> @@ -444,6 +444,18 @@ static void pc_i440fx_7_2_machine_options(MachineClass *m)
>>       pcmc->default_cpu_version = 1;
>
> Instead of renaming pc_i440fx_7_2_machine_options() and introducing a new 
> pc_i440fx_7_2_machine_options() below, what about moving 
> pcmc->default_cpu_version = 1 into pc_i440fx_machine_options() instead, like 
> it is done with all other options? Then you could introduce a completely new 
> pc_i440fx_8_0_machine_options() which would be way more logical (also when 
> looking at this file with "git blame" later).
>
>>   }
>>   
>> +DEFINE_I440FX_MACHINE(v8_0, "pc-i440fx-8.0", NULL,
>> +                      pc_i440fx_8_0_machine_options);
>> +
>> +static void pc_i440fx_7_2_machine_options(MachineClass *m)
>> +{
>> +    pc_i440fx_8_0_machine_options(m);
>> +    m->alias = NULL;
>> +    m->is_default = false;
>> +    compat_props_add(m->compat_props, hw_compat_7_2, hw_compat_7_2_len);
>> +    compat_props_add(m->compat_props, pc_compat_7_2, pc_compat_7_2_len);
>> +}
>> +
>>   DEFINE_I440FX_MACHINE(v7_2, "pc-i440fx-7.2", NULL,
>>                         pc_i440fx_7_2_machine_options);
>>   
>> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
>> index a496bd6e74f5..10bb49f679b0 100644
>> --- a/hw/i386/pc_q35.c
>> +++ b/hw/i386/pc_q35.c
>> @@ -370,7 +370,7 @@ static void pc_q35_machine_options(MachineClass *m)
>>       m->max_cpus = 288;
>>   }
>>   
>> -static void pc_q35_7_2_machine_options(MachineClass *m)
>> +static void pc_q35_8_0_machine_options(MachineClass *m)
>>   {
>>       PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>>       pc_q35_machine_options(m);
>> @@ -378,6 +378,17 @@ static void pc_q35_7_2_machine_options(MachineClass *m)
>>       pcmc->default_cpu_version = 1;
>
> dito
>
>>   }
>>   
>> +DEFINE_Q35_MACHINE(v8_0, "pc-q35-8.0", NULL,
>> +                   pc_q35_8_0_machine_options);
>> +
>> +static void pc_q35_7_2_machine_options(MachineClass *m)
>> +{
>> +    pc_q35_8_0_machine_options(m);
>> +    m->alias = NULL;
>> +    compat_props_add(m->compat_props, hw_compat_7_2, hw_compat_7_2_len);
>> +    compat_props_add(m->compat_props, pc_compat_7_2, pc_compat_7_2_len);
>> +}
>> +
>>   DEFINE_Q35_MACHINE(v7_2, "pc-q35-7.2", NULL,
>>                      pc_q35_7_2_machine_options);
>>   
>
> Would it make sense to remove the m->alias = NULL from the 7.1 and earlier 
> machine types now?

Hm, all of this is how we've done machine type updates for the last few
years :) We can certainly clean up the redundant stuff, but I'd prefer
to do that via a separate patch.

