Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1715014ejb;
        Tue, 20 Feb 2024 20:45:25 -0800 (PST)
X-Received: by 2002:a05:6a21:3116:b0:19e:378a:124c with SMTP id yz22-20020a056a21311600b0019e378a124cmr23114252pzb.12.1708490725266;
        Tue, 20 Feb 2024 20:45:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708490725; cv=none;
        d=google.com; s=arc-20160816;
        b=OfWvPFz+sbvVI9tZNB5hxGkDwOWHKCWThfaziu4DZDEr817lwiPpBhJesgG8968omA
         B+EB6PISjWNyOa6sCVU7+CxFuVrnv+DYtLpAWCznXFOueCPQkkakGCY+rrKsWmteP/ZT
         qgzeN18D5v8Mw/Q8q+WoZGlT6XRkvOayjxTltFqfQ+ORmgcJvdjAa88rIcwWFU+wHd2i
         ai9AXHx2pEllWmQ3Bp8l/cGk+LyQ4KKpqKbUDodkF0DTpoN0I2e/CQsa3rQZGScVkPSF
         uVS/qytDa2d3z8FoM/X/WY2BV7khaElVk+2Y8FGYpd3Kr6T1ZIJ2wsVCPQvu/pwc9+Fp
         BguA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=lfLJWsa65ASUYlZui0NxNUFsMoaCE+gG01MijQygC9g=;
        fh=8cuZ7vqpV859GmXJMo8BdyTx8PFbjG1t2be5aGq38dE=;
        b=qmawCyfH9MRJRAxaIk6z/hdY77gE3HPM13p9zFuqleXeSjsUDaSi2x0YwtOx4X9re2
         Qoi3lGnVz7fWD8YZlDylFy8i9Ialc0Bu7YoWyo00vibxRn+g8zvz6QkIqv1DMLdRKHUB
         sRNBbSzPoAqu7gvDRn5DTFNxqbXewO51u34TaAJdnXCIbo7Tn1R0sGNVMtp0aXPx1AWQ
         rHS+m99SvoxZ/RtQOkY2D1HruXlDj3pYZ8kosRfz4uIcPHQ+L8Rz7a55GNE3NHexxgRi
         NQswCg6ZRXrtorrmGSnwJ1csPUg6QqnJ1nS/j55Kn+S9yosC4db+riOuxIjfN5gLtu9P
         ogHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b="KlP2Vxe/";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t1-20020a17090ae50100b002993b78fcc8sor4628487pjy.5.2024.02.20.20.45.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Feb 2024 20:45:25 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b="KlP2Vxe/";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1708490724; x=1709095524; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lfLJWsa65ASUYlZui0NxNUFsMoaCE+gG01MijQygC9g=;
        b=KlP2Vxe/M4mhZB9+ozmwyzkeX3iHx/jQad/JYRjjMSjKcsjEF0rAMhMIGMbw5PNE4z
         QKR2GWoQ1jU0fa2q+X5zQzVsL4PPdGrebd7SLm0Ojp9lh9uQxr1/6QtGQA3K4nK5YNz/
         ZQOMCdiZ5zl+D8hlx8CXOZ/AtmSN/QfjLKYWwWF32tUL+Erzy6vo/YO/51FoZadT8PSL
         YgdCQrVhwVDYgoTA9eG1bKeePnp8YUugztPTdLjg81EE4IQ09bAGMCAyd03g5POdLFWM
         826LZbOZeWrGJQYo+IqGS+UmZCqCITB+OCUgZxmXGkZ/e2vITYqqbh0c14S7j7DDU08W
         68oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708490724; x=1709095524;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lfLJWsa65ASUYlZui0NxNUFsMoaCE+gG01MijQygC9g=;
        b=e36dVateOcG37d9+4pMq1s1B7XZyfRF0JnRqi6DuYSYaBbbcrBd24Q+/qb5JneVCmp
         kEKmqUhiHc4doKfi3RZB82hlFFQD53uBfrk65oofh/IIUIFq4qmNxsc3Jdv2gwpn9K7+
         KJpdOj43pX2flmAaJmA3P4fHdR3045k8oxmrIO2fvG9V/ZiSuY+y+b0e1jhOZopBviyY
         5hvTLELL98pkdNKhvcpOa1v8j2V4yH20yLHFUlkpmqhdrl/tegtZIA5J62scH9AU1jrO
         7tIDrs44tpRAv/NA7LvDzye8cRfPkjngKEY9PkeTNVEgCCRnQO5wFzRzzH5cpZU2/c+T
         z5Yg==
X-Gm-Message-State: AOJu0YxsFdMdMb+HVtgbArx89aXROxtP76TrXuiWewGkicQvqU0rtuMH
	n6C99578wKvSeibbjSe2glTKiZH6AO/FFMxQusi5a3CB3ZM9+uJRS+ZYP3nVx2kpy+PTbmaa9Kg
	D
X-Google-Smtp-Source: AGHT+IFxkvhTpn7WYr15xsK9Opo2pt7EBMmd0rceTM0c9yO5qCdM3SZM2ZOJ7mKoEimRnvCYGUfNOw==
X-Received: by 2002:a17:90a:bf82:b0:299:ecba:cc6a with SMTP id d2-20020a17090abf8200b00299ecbacc6amr2709783pjs.40.1708490724411;
        Tue, 20 Feb 2024 20:45:24 -0800 (PST)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.203.206] ([157.82.203.206])
        by smtp.gmail.com with ESMTPSA id b23-20020a17090a489700b00298ca46547fsm8201030pjh.36.2024.02.20.20.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 20:45:24 -0800 (PST)
Message-ID: <bf31a250-9539-448c-9c64-4168ab8741f1@daynix.com>
Date: Wed, 21 Feb 2024 13:45:16 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/23] plugins: add an API to read registers
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Song Gao <gaosong@loongson.cn>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, John Snow
 <jsnow@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-s390x@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Yanan Wang <wangyanan55@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Brian Cain
 <bcain@quicinc.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20240216163025.424857-1-alex.bennee@linaro.org>
 <20240216163025.424857-19-alex.bennee@linaro.org>
 <c38a22b5-01e8-40f1-bfc4-4bba9bf7b516@daynix.com>
 <87il2jcje8.fsf@draig.linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <87il2jcje8.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Xq25DyYyDiZL

On 2024/02/20 23:14, Alex Bennée wrote:
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> On 2024/02/17 1:30, Alex Bennée wrote:
>>> We can only request a list of registers once the vCPU has been
>>> initialised so the user needs to use either call the get function on
>>> vCPU initialisation or during the translation phase.
>>> We don't expose the reg number to the plugin instead hiding it
>>> behind
>>> an opaque handle. This allows for a bit of future proofing should the
>>> internals need to be changed while also being hashed against the
>>> CPUClass so we can handle different register sets per-vCPU in
>>> hetrogenous situations.
>>> Having an internal state within the plugins also allows us to expand
>>> the interface in future (for example providing callbacks on register
>>> change if the translator can track changes).
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1706
>>> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
>>> Message-Id: <20240103173349.398526-39-alex.bennee@linaro.org>
>>> Based-on: <20231025093128.33116-18-akihiko.odaki@daynix.com>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> <snip>
>>> +/*
>>> + * Register handles
>>> + *
>>> + * The plugin infrastructure keeps hold of these internal data
>>> + * structures which are presented to plugins as opaque handles. They
>>> + * are global to the system and therefor additions to the hash table
>>> + * must be protected by the @reg_handle_lock.
>>> + *
>>> + * In order to future proof for up-coming heterogeneous work we want
>>> + * different entries for each CPU type while sharing them in the
>>> + * common case of multiple cores of the same type.
>>> + */
>>> +
>>> +static QemuMutex reg_handle_lock;
>>> +
>>> +struct qemu_plugin_register {
>>> +    const char *name;
>>> +    int gdb_reg_num;
>>> +};
>>> +
>>> +static GHashTable *reg_handles; /* hash table of PluginReg */
>>> +
>>> +/* Generate a stable key - would xxhash be overkill? */
>>> +static gpointer cpu_plus_reg_to_key(CPUState *cs, int gdb_regnum)
>>> +{
>>> +    uintptr_t key = (uintptr_t) cs->cc;
>>> +    key ^= gdb_regnum;
>>> +    return GUINT_TO_POINTER(key);
>>> +}
>>
>> I have pointed out this is theoretically prone to collisions and
>> unsafe.
> 
> How is it unsafe? The aim is to share handles for the same CPUClass
> rather than having a unique handle per register/cpu combo.

THe intention is legitimate, but the implementation is not safe. It 
assumes (uintptr)cs->cc ^ gdb_regnum is unique, but there is no such 
guarantee. The key of GHashTable must be unique; generating hashes of 
keys should be done with hash_func given to g_hash_table_new().

> 
> Indeed if I add the following:
> 
> --8<---------------cut here---------------start------------->8---
>     plugins/api.c
> @@ -482,6 +482,9 @@ static GArray *create_register_handles(CPUState *cs, GArray *gdbstub_regs)
>                   val->name = g_intern_string(grd->name);
>   
>                   g_hash_table_insert(reg_handles, key, val);
> +            } else {
> +                /* make sure its not a clash */
> +                g_assert(val->gdb_reg_num == grd->gdb_reg);
>               }
>   
>               /* Create a record for the plugin */
> modified   tests/plugin/insn.c
> @@ -46,6 +46,25 @@ typedef struct {
>       char *disas;
>   } Instruction;
>   
> +/*
> + * Initialise a new vcpu with reading the register list
> + */
> +static void vcpu_init(qemu_plugin_id_t id, unsigned int vcpu_index)
> +{
> +    g_autoptr(GArray) reg_list = qemu_plugin_get_registers();
> +    g_autoptr(GByteArray) reg_value = g_byte_array_new();
> +
> +    if (reg_list) {
> +        for (int i = 0; i < reg_list->len; i++) {
> +            qemu_plugin_reg_descriptor *rd = &g_array_index(
> +                reg_list, qemu_plugin_reg_descriptor, i);
> +            int count = qemu_plugin_read_register(rd->handle, reg_value);
> +            g_assert(count > 0);
> +        }
> +    }
> +}
> +
> +
>   static void vcpu_insn_exec_before(unsigned int cpu_index, void *udata)
>   {
>       unsigned int i = cpu_index % MAX_CPUS;
> @@ -212,6 +231,8 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
>           sizes = g_array_new(true, true, sizeof(unsigned long));
>       }
>   
> +    /* Register init, translation block and exit callbacks */
> +    qemu_plugin_register_vcpu_init_cb(id, vcpu_init);
>       qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
>       qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
>       return 0;
> --8<---------------cut here---------------end--------------->8---
> 
> Nothing trips up during check-tcg (after I fixed "gdbstub: Infer number
> of core registers from XML" to remove the microblaze check on
> cc->gdb_num_core_regs).
> 
>>
>>> +
>>> +/*
>>> + * Create register handles.
>>> + *
>>> + * We need to create a handle for each register so the plugin
>>> + * infrastructure can call gdbstub to read a register. We also
>>> + * construct a result array with those handles and some ancillary data
>>> + * the plugin might find useful.
>>> + */
>>> +
>>> +static GArray *create_register_handles(CPUState *cs, GArray *gdbstub_regs)
>>> +{
>>> +    GArray *find_data = g_array_new(true, true,
>>> +                                    sizeof(qemu_plugin_reg_descriptor));
>>> +
>>> +    WITH_QEMU_LOCK_GUARD(&reg_handle_lock) {
>>> +
>>> +        if (!reg_handles) {
>>> +            reg_handles = g_hash_table_new(g_direct_hash, g_direct_equal);
>>> +        }
>>> +
>>> +        for (int i = 0; i < gdbstub_regs->len; i++) {
>>> +            GDBRegDesc *grd = &g_array_index(gdbstub_regs, GDBRegDesc, i);
>>> +            gpointer key = cpu_plus_reg_to_key(cs, grd->gdb_reg);
>>> +            struct qemu_plugin_register *val = g_hash_table_lookup(reg_handles,
>>> +                                                                   key);
>>> +
>>> +            /* skip "un-named" regs */
>>> +            if (!grd->name) {
>>> +                continue;
>>> +            }
>>> +
>>> +            /* Doesn't exist, create one */
>>> +            if (!val) {
>>> +                val = g_new0(struct qemu_plugin_register, 1);
>>> +                val->gdb_reg_num = grd->gdb_reg;
>>> +                val->name = g_intern_string(grd->name);
>>> +
>>> +                g_hash_table_insert(reg_handles, key, val);
>>> +            }
>>> +
>>> +            /* Create a record for the plugin */
>>> +            qemu_plugin_reg_descriptor desc = {
>>> +                .handle = val,
>>> +                .name = val->name,
>>> +                .feature = g_intern_string(grd->feature_name)
>>> +            };
>>> +            g_array_append_val(find_data, desc);
>>> +        }
>>> +    }
>>> +
>>> +    return find_data;
>>> +}
>>> +
>>> +GArray *qemu_plugin_get_registers(void)
>>> +{
>>> +    g_assert(current_cpu);
>>> +
>>> +    g_autoptr(GArray) regs = gdb_get_register_list(current_cpu);
>>> +    return regs->len ? create_register_handles(current_cpu, regs) : NULL;
>>> +}
>>> +
>>> +int qemu_plugin_read_register(struct qemu_plugin_register *reg, GByteArray *buf)
>>> +{
>>> +    g_assert(current_cpu);
>>> +
>>> +    return gdb_read_register(current_cpu, buf, reg->gdb_reg_num);
>>> +}
>>> +
>>> +static void __attribute__((__constructor__)) qemu_api_init(void)
>>> +{
>>> +    qemu_mutex_init(&reg_handle_lock);
>>> +
>>> +}
>>> diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
>>> index adb67608598..27fe97239be 100644
>>> --- a/plugins/qemu-plugins.symbols
>>> +++ b/plugins/qemu-plugins.symbols
>>> @@ -3,6 +3,7 @@
>>>      qemu_plugin_end_code;
>>>      qemu_plugin_entry_code;
>>>      qemu_plugin_get_hwaddr;
>>> +  qemu_plugin_get_registers;
>>>      qemu_plugin_hwaddr_device_name;
>>>      qemu_plugin_hwaddr_is_io;
>>>      qemu_plugin_hwaddr_phys_addr;
>>> @@ -19,6 +20,7 @@
>>>      qemu_plugin_num_vcpus;
>>>      qemu_plugin_outs;
>>>      qemu_plugin_path_to_binary;
>>> +  qemu_plugin_read_register;
>>>      qemu_plugin_register_atexit_cb;
>>>      qemu_plugin_register_flush_cb;
>>>      qemu_plugin_register_vcpu_exit_cb;
> 
