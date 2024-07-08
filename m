Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp2489771njb;
        Sun, 7 Jul 2024 22:30:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUspUBLnGa6GfDcdotvQ1X1wZP2h3UDKpxxcwqVovIRT9LzkROkuWH0H73LQkAJEPkUAzW/lp4GxiMjnBuFw+8wiOzkYKsf
X-Received: by 2002:adf:e443:0:b0:361:e909:60c3 with SMTP id ffacd0b85a97d-3679f6e4db1mr9397395f8f.9.1720416621532;
        Sun, 07 Jul 2024 22:30:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720416621; cv=none;
        d=google.com; s=arc-20160816;
        b=Zbi7ya2MPI1Vao7fiGfkq5tyJT2htC8NF0PyP1xKzmBOtl/WTjNteMWAoeVVOFxVYi
         26Rf7UciKQYUq/Uh+JIh1LbqQCf35rC1wsSzFsjV9uXzcs5kWEKPyYcNlQXFU1c4A5jS
         39QFPKW+d0CoRauPglGWFATY5EcyxoBfw+juMi9K5PCsURyAYRaRo8tiHq2HD3i4ldJw
         4ekGHM5YXP0nMDVMLJnKorfiyOe0BDPoSTKvYCq2g8E2HrE/EJ7WfoP22bvz2yLI1u8E
         J+hFJssVR4zEhxiQsaK1w62z4EWjUd3e/ojPeLfsFGMMBSUD8ArVVjRdzo9bsnq+Ntvf
         l3YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=MdxhzsEahdwu6Vr8VLJzv6yiEh6/xuSTCWcfQqzOv0Q=;
        fh=NTwHc/IDOrySNEx9OrbE4hLpfkWCr0waNLIq/p3tz90=;
        b=NpjqRadiPmaHLSG+JuCfCa2bs5tVSAvUmJhcLHA/K6WtUAcwzCPLYRgbNkEYwT1IfZ
         8ixcKcH9AHSbeWqyrgEvSshD5R1OAK3KCU6q8KLCzkiTp+Gmfu3xzIwVxZjStLatBwfa
         yCrwbkaCuDAqRR4LygbLbpRsXzMGj/ja2e4WusZUrJbQNTeQHBED1Zs05+lg0KL4dQQS
         uva6xfbZuaNYM8c47QF95xJ/zqyayL2p4LeqNZvqhCTEWdvvKBaqrmbHDNp6TQe9rO2L
         znoAp6ZYknkcz3utYvuaGUOVnCeuwRUo1VijHfgSFULKVh7idEFoDIw3omw814QuVcyU
         alBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b=Q+BMoKgb;
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net;
       dara=neutral header.i=@linaro.org
Return-Path: <salil.mehta@opnsrc.net>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3679d2599aesor2426530f8f.2.2024.07.07.22.30.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 07 Jul 2024 22:30:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b=Q+BMoKgb;
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=opnsrc.net; s=google; t=1720416621; x=1721021421; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MdxhzsEahdwu6Vr8VLJzv6yiEh6/xuSTCWcfQqzOv0Q=;
        b=Q+BMoKgbJIvAIRIRD7+13GTrGX58iYeHvf1+eow9abIBDonWFQ0bnW99VTIJ2c1Tok
         Dit4l44tdxz9T+cerbC1MrmXjgAcQn/4+WxBUFKzfkATxa5nt3JIUAmlQaYV4uk5XGMI
         FzyPXeZnNhwKKKDVFVrVlvTSuPAemIf9ma2LhKOPBW+CqnnQU1I2ejLCL0IdGrHE+TnM
         vwNsoHrkhzCp2zehLrn0ZYXWjoH1oEyrwpBgJGot9JwmK6CjbYvC1geay0YRrZ/S4Z2j
         AoJaUJv6DFHt9x4D2NdjJrWYASTlpLPCAnC34LTt0U+RH7eqLRxCGuJ83jy3PtfJPn0i
         Vsqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720416621; x=1721021421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MdxhzsEahdwu6Vr8VLJzv6yiEh6/xuSTCWcfQqzOv0Q=;
        b=iTZspUQlC0TO2YCmNy2W3C/tG1Z+etKG7LZEwLQAlzD6u8I9L5Ii/irBKUChZT9Jwu
         lAcXzQCFsKMLFIspTo67aVEtIjQz6zujCd91Db8MDseknb11ss/75y2mlkKafflBdjvm
         twg0yHBydgLj84N4cVoA7cZc3C8qJ1U+BlKJihNARTYCAuabWDtIDnOFKVj/pbuHQ5Dh
         JQVh+TZLyFNSAPE4PUPFLYVh3OCz36vS9Wa4LjACrHnmoIUEx1geX8gX9mw8GKIXMIKH
         K/CXVU7QF5yv0+x0yjqMbUCbVxA3/WXgbPC5ThoTCxenZ+Oiu7ZUdBNzT5t54kDIS+8k
         RSbA==
X-Forwarded-Encrypted: i=1; AJvYcCVCD3YzqK3/AAUBG7UUi1ZeOfLyr+XFWLUvlxDEyB+FffLRHEK8L1H3H27IC62AIwB5M5At2TG0EH6dBadBFhkgD6IXNvFx
X-Gm-Message-State: AOJu0YyNn3IZ7OUeoyQBX/sVmN1Fm1o2S7zVTOcc7DtVV1sLXaEtSP0a
	Qq14dfs/S5hoKRAk8svBVmg7jaNkWS/lcI/yg3Gc42ExqmOqKVbYxMQG8gS8emQ=
X-Google-Smtp-Source: AGHT+IG59JCNKzPFGsDzMrrMonk2Q6S5KMxRwaYS3ffEEeQj4iJ+uAPtRRk45K6F4a7fbMQWGhc7fg==
X-Received: by 2002:adf:ef89:0:b0:367:9268:bfca with SMTP id ffacd0b85a97d-3679f75c4famr9360109f8f.22.1720416620962;
        Sun, 07 Jul 2024 22:30:20 -0700 (PDT)
Return-Path: <salil.mehta@opnsrc.net>
Received: from [10.11.12.72] ([90.220.10.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-426623153f9sm63051685e9.29.2024.07.07.22.30.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jul 2024 22:30:20 -0700 (PDT)
Message-ID: <9d1b4caa-6886-4dde-8941-f62bdf4a562b@opnsrc.net>
Date: Mon, 8 Jul 2024 05:30:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V13 7/8] gdbstub: Add helper function to unregister GDB
 register space
To: Igor Mammedov <imammedo@redhat.com>, Salil Mehta <salil.mehta@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, maz@kernel.org,
 jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, andrew.jones@linux.dev, david@redhat.com,
 philmd@linaro.org, eric.auger@redhat.com, oliver.upton@linux.dev,
 pbonzini@redhat.com, mst@redhat.com, will@kernel.org, gshan@redhat.com,
 rafael@kernel.org, alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, zhukeqian1@huawei.com, wangxiongfeng2@huawei.com,
 wangyanan55@huawei.com, jiakernel2@gmail.com, maobibo@loongson.cn,
 lixianglai@loongson.cn, npiggin@gmail.com, harshpb@linux.ibm.com,
 linuxarm@huawei.com, Shaoqin Huang <shahuang@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>
References: <20240607115649.214622-1-salil.mehta@huawei.com>
 <20240607115649.214622-8-salil.mehta@huawei.com>
 <20240706164103.16662dd2@imammedo.users.ipa.redhat.com>
Content-Language: en-GB
From: Salil Mehta <salil.mehta@opnsrc.net>
In-Reply-To: <20240706164103.16662dd2@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Wc8C2P8VBxBa

Hi Igor,

On 06/07/2024 14:41, Igor Mammedov wrote:
> On Fri, 7 Jun 2024 12:56:48 +0100
> Salil Mehta <salil.mehta@huawei.com> wrote:
>
>> Add common function to help unregister the GDB register space. This shall be
>> done in context to the CPU unrealization.
>>
>> Note: These are common functions exported to arch specific code. For example,
>> for ARM this code is being referred in associated arch specific patch-set:
>>
>> Link: https://lore.kernel.org/qemu-devel/20230926103654.34424-1-salil.mehta@huawei.com/
>>
>> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> Tested-by: Xianglai Li <lixianglai@loongson.cn>
>> Tested-by: Miguel Luis <miguel.luis@oracle.com>
>> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
>> Reviewed-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
>> Tested-by: Zhao Liu <zhao1.liu@intel.com>
>> ---
>>   gdbstub/gdbstub.c      | 13 +++++++++++++
>>   hw/core/cpu-common.c   |  1 -
>>   include/exec/gdbstub.h |  6 ++++++
>>   3 files changed, 19 insertions(+), 1 deletion(-)
>>
>> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
>> index b3574997ea..1949b09240 100644
>> --- a/gdbstub/gdbstub.c
>> +++ b/gdbstub/gdbstub.c
>> @@ -617,6 +617,19 @@ void gdb_register_coprocessor(CPUState *cpu,
>>       }
>>   }
>>   
>> +void gdb_unregister_coprocessor_all(CPUState *cpu)
>> +{
>> +    /*
>> +     * Safe to nuke everything. GDBRegisterState::xml is static const char so
>> +     * it won't be freed
>> +     */
>> +    g_array_free(cpu->gdb_regs, true);
>> +
>> +    cpu->gdb_regs = NULL;
>> +    cpu->gdb_num_regs = 0;
>> +    cpu->gdb_num_g_regs = 0;
>> +}
>> +
>>   static void gdb_process_breakpoint_remove_all(GDBProcess *p)
>>   {
>>       CPUState *cpu = gdb_get_first_cpu_in_process(p);
>> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
>> index 0f0a247f56..e5140b4bc1 100644
>> --- a/hw/core/cpu-common.c
>> +++ b/hw/core/cpu-common.c
>> @@ -274,7 +274,6 @@ static void cpu_common_finalize(Object *obj)
>>   {
>>       CPUState *cpu = CPU(obj);
>>   
>> -    g_array_free(cpu->gdb_regs, TRUE);
> so free() is gone but new  gdb_unregister_coprocessor_all() ain't called,
> are we staring to leak some memory here?

Ah, sorry yes for other architectures. Maybe I can put below check

and keep the free'ing code?

+     if (cpu->gdb_regs)

+ g_array_free(cpu->gdb_regs, TRUE);


Thanks, Salil.

>>       qemu_lockcnt_destroy(&cpu->in_ioctl_lock);
>>       qemu_mutex_destroy(&cpu->work_mutex);
>>   }
>> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
>> index eb14b91139..249d4d4bc8 100644
>> --- a/include/exec/gdbstub.h
>> +++ b/include/exec/gdbstub.h
>> @@ -49,6 +49,12 @@ void gdb_register_coprocessor(CPUState *cpu,
>>                                 gdb_get_reg_cb get_reg, gdb_set_reg_cb set_reg,
>>                                 const GDBFeature *feature, int g_pos);
>>   
>> +/**
>> + * gdb_unregister_coprocessor_all() - unregisters supplemental set of registers
>> + * @cpu - the CPU associated with registers
>> + */
>> +void gdb_unregister_coprocessor_all(CPUState *cpu);
>> +
>>   /**
>>    * gdbserver_start: start the gdb server
>>    * @port_or_device: connection spec for gdb
