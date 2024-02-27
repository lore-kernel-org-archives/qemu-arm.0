Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2523112ejf;
        Mon, 26 Feb 2024 23:47:36 -0800 (PST)
X-Received: by 2002:a17:902:6b02:b0:1d9:7ab0:5e20 with SMTP id o2-20020a1709026b0200b001d97ab05e20mr8939998plk.69.1709020056438;
        Mon, 26 Feb 2024 23:47:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709020056; cv=none;
        d=google.com; s=arc-20160816;
        b=kpIVfMaPP73gF1BiIyYocPt1+cG5LWqSFC4VXClV3ZQ+v7tg0P70KOlxZzeuAzosdr
         godIVAzlrTGmWm55sbzdjoVCbiwJufatgVkcp19siOgrKOnJwMB1a0LAVz79hT38QhV2
         VwzfpNlFvhwtzhmmc8niexC8ikIHpQ7fdy3hhNfvUHqcQa2/z5eVXq7mbdxUkcpZKaT5
         rTai78b5IVRHta8xeuuoX4rj8cKnaN4aCXDarFkBBeieI6A5aUeVPSTar4Ez3L+N1MPb
         LxRbx1Xh+pVwze0Oe1+A1yg63WNhXpppV/IS0E1PPrFN1+OB1UhZe6mlRwp9nk5ydC95
         YeIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=5Va+9CpvBWB277k7Vk/5Lq5SeV6/w0TKZhR5/P0tOS8=;
        fh=GPqR4IZ4tpxxMztuFlE5yid8HGx5q38zTNywteBGTK0=;
        b=S9SxU2U9QZnJhwaG2yZNfl6fEPydmUOQiIvZCbZaODWgixfH274YKeqms0EXHaA6Qw
         7excQWUjFEO1KLOX8V40/QsACg81DdeIYUdQ4fD47oILmZ+eFLR1Os+Z2P47PsMb3LrH
         z9sgbDGvZAH0f6VlkzO88XrSdGjv+uJOLqbYfBoepL1UREvyV04PFFPYicZhJLbUhI2y
         B106aI6lQmZLmzrxlB6h9UwMGQv2lZdtQVrc4CIFFze4DzDJGCkKqAQurOx7YOtKdanL
         QEGkvms0YK7+nLLdebDU+wz1F9aU80OyiziaU3ZbCpXyMMlGujw7D8jTJ38uhKa6eCFs
         Cuyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=schmqYi8;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e7-20020a170902784700b001dc3ef7aa26sor4067623pln.10.2024.02.26.23.47.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 26 Feb 2024 23:47:36 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=schmqYi8;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1709020055; x=1709624855; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Va+9CpvBWB277k7Vk/5Lq5SeV6/w0TKZhR5/P0tOS8=;
        b=schmqYi8kqUlz0E5Uo8PuovwUKl3OCgWaMvE4XJwsOksmViTIV0Gjni5AmViExEVww
         Gv/vJbbEoLMX061KmMyL30wxV0c8xQTITbQIMg6foAYigi4euOr8K9BgTHLuo8GdsNHb
         Xb7BOeMj01LVOVUhxhEQpIyDIC+zJu4VekzsRfN6/SWoDKMogYhI9SBJCP9VEoXICQRA
         hJcxjPIzon5e+Z/6EQGpQCGWDdSmSV1ZjfOvEk/7njdUr/itX0p6oxpbeaglk2Sc9jPr
         3AmlGUk0RxFPDLxjHgCwRvXV3f22qa2y/1UuPqRL/3NZuxK9uZCUAsfJLPHPBWKrxWNj
         V6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709020055; x=1709624855;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Va+9CpvBWB277k7Vk/5Lq5SeV6/w0TKZhR5/P0tOS8=;
        b=nVwQMP3ToOk+V2pS+ULlXTImleZlJskRTqLNm6v0xdK7CMT/052DVvc4Q/bQ2ZZSTF
         9XOgFIzAqWiPSE0OBt8XApphhSHn11Ee/FJLlGwRO4gq882ausNh0gVTBHQMUVJpdagJ
         FPyZTc2ZvnryFlP4J51zPvarIaFMUli67ecMpXUTteaH+wCbnY0xld3AInS4TSpeK8XS
         lEDqa8t5yVKBVmfGtDSpyYUhVzyvAz8Rqw59Y5YFS4Uwz6yjaNlBjR17SGQQZX/3/bOC
         t5PITw3K6PaYETbtoe59a4lrs6NuAyuAGO1pYsMXZRMEneqR4Dzhgorzmkntm+97Mms2
         OIOA==
X-Gm-Message-State: AOJu0YyzEGunGjcKQErLqpujGXKTExMwC/BfSbPYBXjrnrMBkIZzWs6q
	FpPfttpZjJHD2u1quEbUgTeqh5RZVFFVr0KzbPVyreQNr/vW+cCmyogUt370KfqtjVT6xtunktD
	S
X-Google-Smtp-Source: AGHT+IHa5GPNZQyrh4lPjtiCaHfY4JaLVAhx3qAa4gyn6vwaRY7nzPSNlOoJIGtj3YT9SHvapxuPpQ==
X-Received: by 2002:a17:903:244d:b0:1dc:93b:8981 with SMTP id l13-20020a170903244d00b001dc093b8981mr14131905pls.14.1709020055516;
        Mon, 26 Feb 2024 23:47:35 -0800 (PST)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.203.206] ([157.82.203.206])
        by smtp.gmail.com with ESMTPSA id l21-20020a170903005500b001db82fdc89asm880947pla.305.2024.02.26.23.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 23:47:35 -0800 (PST)
Message-ID: <b7aac53e-cde5-4596-b0fc-d39f52d4ceb8@daynix.com>
Date: Tue, 27 Feb 2024 16:47:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 21/27] plugins: add an API to read registers
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-riscv@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Alexandre Iooss <erdnaxe@crans.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, John Snow
 <jsnow@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-ppc@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-s390x@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Brian Cain <bcain@quicinc.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20240226165646.425600-1-alex.bennee@linaro.org>
 <20240226165646.425600-22-alex.bennee@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20240226165646.425600-22-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: VP5mV9+NQh1q

On 2024/02/27 1:56, Alex Bennée wrote:
> We can only request a list of registers once the vCPU has been
> initialised so the user needs to use either call the get function on
> vCPU initialisation or during the translation phase.
> 
> We don't expose the reg number to the plugin instead hiding it behind
> an opaque handle. For now this is just the gdb_regnum encapsulated in
> an anonymous GPOINTER but in future as we add more state for plugins
> to track we can expand it.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1706
> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
> Message-Id: <20240103173349.398526-39-alex.bennee@linaro.org>
> Based-on: <20231025093128.33116-18-akihiko.odaki@daynix.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Hi,

Mostly looks good. I have a few trivial comments so please have a look 
at them.

> 
> ---
> v4
>    - the get/read_registers functions are now implicitly for current
>    vCPU only to accidental cpu != current_cpu uses.
> v5
>    - make reg_handles as per-CPUPluginState variable.
> v6
>    - for now just wrap gdb_regnum
> ---
>   include/qemu/qemu-plugin.h   | 48 +++++++++++++++++++++++++++++--
>   plugins/api.c                | 56 ++++++++++++++++++++++++++++++++++++
>   plugins/qemu-plugins.symbols |  2 ++
>   3 files changed, 104 insertions(+), 2 deletions(-)
> 
> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> index 93981f8f89f..3b6b18058d2 100644
> --- a/include/qemu/qemu-plugin.h
> +++ b/include/qemu/qemu-plugin.h
> @@ -11,6 +11,7 @@
>   #ifndef QEMU_QEMU_PLUGIN_H
>   #define QEMU_QEMU_PLUGIN_H
>   
> +#include <glib.h>
>   #include <inttypes.h>
>   #include <stdbool.h>
>   #include <stddef.h>
> @@ -229,8 +230,8 @@ struct qemu_plugin_insn;
>    * @QEMU_PLUGIN_CB_R_REGS: callback reads the CPU's regs
>    * @QEMU_PLUGIN_CB_RW_REGS: callback reads and writes the CPU's regs
>    *
> - * Note: currently unused, plugins cannot read or change system
> - * register state.
> + * Note: currently QEMU_PLUGIN_CB_RW_REGS is unused, plugins cannot change
> + * system register state.
>    */
>   enum qemu_plugin_cb_flags {
>       QEMU_PLUGIN_CB_NO_REGS,
> @@ -707,4 +708,47 @@ uint64_t qemu_plugin_end_code(void);
>   QEMU_PLUGIN_API
>   uint64_t qemu_plugin_entry_code(void);
>   
> +/** struct qemu_plugin_register - Opaque handle for register access */
> +struct qemu_plugin_register;
> +
> +/**
> + * typedef qemu_plugin_reg_descriptor - register descriptions
> + *
> + * @handle: opaque handle for retrieving value with qemu_plugin_read_register
> + * @name: register name
> + * @feature: optional feature descriptor, can be NULL
> + */
> +typedef struct {
> +    struct qemu_plugin_register *handle;
> +    const char *name;
> +    const char *feature;
> +} qemu_plugin_reg_descriptor;
> +
> +/**
> + * qemu_plugin_get_registers() - return register list for current vCPU
> + *
> + * Returns a GArray of qemu_plugin_reg_descriptor or NULL. Caller
> + * frees the array (but not the const strings).
> + *
> + * Should be used from a qemu_plugin_register_vcpu_init_cb() callback
> + * after the vCPU is initialised, i.e. in the vCPU context.
> + */
> +GArray *qemu_plugin_get_registers(void);
> +
> +/**
> + * qemu_plugin_read_register() - read register for current vCPU
> + *
> + * @handle: a @qemu_plugin_reg_handle handle
> + * @buf: A GByteArray for the data owned by the plugin
> + *
> + * This function is only available in a context that register read access is
> + * explicitly requested via the QEMU_PLUGIN_CB_R_REGS flag.
> + *
> + * Returns the size of the read register. The content of @buf is in target byte
> + * order. On failure returns -1
> + */
> +int qemu_plugin_read_register(struct qemu_plugin_register *handle,
> +                              GByteArray *buf);
> +
> +
>   #endif /* QEMU_QEMU_PLUGIN_H */
> diff --git a/plugins/api.c b/plugins/api.c
> index 54df72c1c00..03412598047 100644
> --- a/plugins/api.c
> +++ b/plugins/api.c
> @@ -8,6 +8,7 @@
>    *
>    *  qemu_plugin_tb
>    *  qemu_plugin_insn
> + *  qemu_plugin_register
>    *
>    * Which can then be passed back into the API to do additional things.
>    * As such all the public functions in here are exported in
> @@ -35,10 +36,12 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "qemu/main-loop.h"
>   #include "qemu/plugin.h"
>   #include "qemu/log.h"
>   #include "tcg/tcg.h"
>   #include "exec/exec-all.h"
> +#include "exec/gdbstub.h"
>   #include "exec/ram_addr.h"
>   #include "disas/disas.h"
>   #include "plugin.h"
> @@ -410,3 +413,56 @@ uint64_t qemu_plugin_entry_code(void)
>   #endif
>       return entry;
>   }
> +
> +/*
> + * Create register handles.
> + *
> + * We need to create a handle for each register so the plugin
> + * infrastructure can call gdbstub to read a register. They are
> + * currently just a pointer encapsulation of the gdb_regnum but in
> + * future may hold internal plugin state so its important plugin
> + * authors are not tempted to treat them as numbers.
> + *
> + * We also construct a result array with those handles and some
> + * ancillary data the plugin might find useful.
> + */
> +
> +static GArray *create_register_handles(CPUState *cs, GArray *gdbstub_regs)
> +{

cs is unused.

> +    GArray *find_data = g_array_new(true, true,
> +                                    sizeof(qemu_plugin_reg_descriptor));
> +
> +    for (int i = 0; i < gdbstub_regs->len; i++) {
> +        GDBRegDesc *grd = &g_array_index(gdbstub_regs, GDBRegDesc, i);
> +
> +        /* skip "un-named" regs */
> +        if (!grd->name) {
> +            continue;
> +        }
> +
> +        /* Create a record for the plugin */
> +        qemu_plugin_reg_descriptor desc = {
> +            .handle = GINT_TO_POINTER(grd->gdb_reg),
> +            .name = g_intern_string(grd->name),
> +            .feature = g_intern_string(grd->feature_name)
> +        };

Please remove a mixed declaration; see: docs/devel/style.rst

> +        g_array_append_val(find_data, desc);
> +    }
> +
> +    return find_data;
> +}
> +
> +GArray *qemu_plugin_get_registers(void)
> +{
> +    g_assert(current_cpu);
> +
> +    g_autoptr(GArray) regs = gdb_get_register_list(current_cpu);
> +    return regs->len ? create_register_handles(current_cpu, regs) : NULL;

Why do you need regs->len check?

> +}
> +
> +int qemu_plugin_read_register(struct qemu_plugin_register *reg, GByteArray *buf)
> +{
> +    g_assert(current_cpu);
> +
> +    return gdb_read_register(current_cpu, buf, GPOINTER_TO_INT(reg));
> +}
> diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
> index adb67608598..27fe97239be 100644
> --- a/plugins/qemu-plugins.symbols
> +++ b/plugins/qemu-plugins.symbols
> @@ -3,6 +3,7 @@
>     qemu_plugin_end_code;
>     qemu_plugin_entry_code;
>     qemu_plugin_get_hwaddr;
> +  qemu_plugin_get_registers;
>     qemu_plugin_hwaddr_device_name;
>     qemu_plugin_hwaddr_is_io;
>     qemu_plugin_hwaddr_phys_addr;
> @@ -19,6 +20,7 @@
>     qemu_plugin_num_vcpus;
>     qemu_plugin_outs;
>     qemu_plugin_path_to_binary;
> +  qemu_plugin_read_register;
>     qemu_plugin_register_atexit_cb;
>     qemu_plugin_register_flush_cb;
>     qemu_plugin_register_vcpu_exit_cb;
