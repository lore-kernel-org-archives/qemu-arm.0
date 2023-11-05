Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2151106eja;
        Sun, 5 Nov 2023 04:40:22 -0800 (PST)
X-Received: by 2002:a05:6602:3411:b0:794:eddf:daae with SMTP id n17-20020a056602341100b00794eddfdaaemr31651775ioz.12.1699188022399;
        Sun, 05 Nov 2023 04:40:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699188022; cv=none;
        d=google.com; s=arc-20160816;
        b=pIuDq4H4Xp4OQb6N8thBUmvwzkjH25GNoKl6qpJhEfeUTIyqikL3dbQsjPZ6/Bq14B
         NT0plNB5X8Bwe2wGvYxjJhANpWNZM07NVpv2+OVJDQgbe1+J9yUhWsuHCwWkC97z/+6U
         aZtN33Xc+TfVSoVoQCEUk06WgGzk42SydKnRhMNch8u6wQANvVLQQQSJ3nuFGMN2Z0Hv
         lTpifAPem4ktwdYHnzng/XlNISeTPoh2+Z+4SmVkp1tkc17vgmCvnSffmbAOg22VMijt
         ImICDEwIxopwBzrcbJUdKnkSPBY1xdXr1q5X74qA47y+kbUwbALV1sjO2MuYACpXzcRt
         afdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Vf6hD4b5DeYyR1VQm5b1bivfW1BFqsDiKGbajuDl/eI=;
        fh=H+gvt3q0+D3Q3kUdvq+81g6fiI9pf3XHGmw+1XzI+is=;
        b=WxHTPxf4EesFqZvCs4I/iNVFH9PtHpiEjL/w++uvGJ4RwacxAINbfKIhgZarG+hlz0
         UN4unVXZ4AAaBcyb/HR93geBioNCGq2u9OJJI1CxHBFkd0HlJbMnQrqp7aMf7wdAUdtY
         A3w4CHZQgexTVrnWvUr0uHJP8IrMPkITPb8EYFQurSAxCj7BgQYsKtHSK5R4SLmQSVHC
         PLwEtvZHX7qVPUm56IdJBUGRscPcF+qt/R8RgvUxhD44MJoyNVcMVRW46221i3kFjYgj
         wKPNNaG35j5W2ayvEtCpi2h8ISO6cPIvgK8feABd55b1Ato6xtCBu/NaTq8Xgv11xof6
         D8iA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=1kFVSBRN;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n23-20020a056a00213700b006b5034de047sor1996744pfj.8.2023.11.05.04.40.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 05 Nov 2023 04:40:22 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=1kFVSBRN;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1699188022; x=1699792822; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vf6hD4b5DeYyR1VQm5b1bivfW1BFqsDiKGbajuDl/eI=;
        b=1kFVSBRNXAyK9D0LIMk2qGbqxYEp7FtU0PkY5PpVclMC2wDTJMVOMcwgbhthQKcSKq
         Te44CScvc38prG3E6ufpd6M9vi2JZqjoRFhc2Z5DxSjF8AQz64sUgTc8hbEFbdgoA9zp
         QOhHQMv3kS3ujTAx1l6r9p+UWUVhh1s0KJRvChOogZG0udHIYW3s+cZo0Joi6EY6FEOT
         btgI1mwg+QT59JBA9S1oWQKHMqeoN/S+yOlt2NPRoThY8JqoB3HiFafkXWNdg6FO4EJz
         DgmzinQLZEcZRyrTzgIRZ8mx1Wze14ttZRWG9AxnM6zTNbeYNwxBiH/z8gwVGlgEdIua
         B0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699188022; x=1699792822;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vf6hD4b5DeYyR1VQm5b1bivfW1BFqsDiKGbajuDl/eI=;
        b=cSV5+SHad6WMhtJ1BaJtxrceeFTxFLKQ8SHqy/hdneSDSUN/+fTQURU6LO3hwcLJAO
         nTAWqOtYgKjXbGYolf8VFxvgW6d9oJl2u8VH5/WtjnAVoEes/uZyrXABIBLCf8G4N9xN
         GQhbqUz6g2tyiCYcyftGHE4J2mou3DloWiTgaibNBnQyz5S/8YnHa9pGBkwnOfoA/WjK
         CVs4i2BNyDYQS2l0DPcaIVFu35+Mym6o1nKx404e1FN0ic+cS74LcYTGLOOU7K9rtYxx
         KhKbtzHfCRYAqnagx7rmuuvHhKmQBYwfJEM+qJUeQnO65O0APCMSWr5roVJHO66O8UZC
         ZX6w==
X-Gm-Message-State: AOJu0YwGxz83C0Hzbu0fwYW22QmKt/4qLUyESzdWKsMrkxdRogGN3EAv
	PcMjcluWc1vtSEtGqMOllxAGy3iGrEfsRSOzYiw=
X-Google-Smtp-Source: AGHT+IEi0KXGbZSe7qwgF+DFcSd7hs7HKWUtrLO8aYPCk34nFrOvK5drPh0J5mkKUj9JCs46tRY81A==
X-Received: by 2002:a05:6a20:914e:b0:16b:b824:b25c with SMTP id x14-20020a056a20914e00b0016bb824b25cmr22441456pzc.25.1699188021599;
        Sun, 05 Nov 2023 04:40:21 -0800 (PST)
Return-Path: <akihiko.odaki@daynix.com>
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486? ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902d2c100b001c625acfed0sm4160870plc.44.2023.11.05.04.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Nov 2023 04:40:20 -0800 (PST)
Message-ID: <e9c6bb21-678e-44d5-b34d-e7a840a1b7b0@daynix.com>
Date: Sun, 5 Nov 2023 21:40:12 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/29] plugins: add an API to read registers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>, Brian Cain <bcain@quicinc.com>,
 qemu-ppc@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-s390x@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nicholas Piggin <npiggin@gmail.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>
References: <20231103195956.1998255-1-alex.bennee@linaro.org>
 <20231103195956.1998255-25-alex.bennee@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20231103195956.1998255-25-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: OMTeRrB8WOTw

On 2023/11/04 4:59, Alex Bennée wrote:
> We can only request a list of registers once the vCPU has been
> initialised so the user needs to use either call the find function on
> vCPU initialisation or during the translation phase. We don't expose
> the reg number to the plugin instead hiding it behind an opaque
> handle. This allows for a bit of future proofing should the internals
> need to be changed while also being hashed against the CPUClass so we
> can handle different register sets per-vCPU in hetrogenous situations.
> 
> Having an internal state within the plugins also allows us to expand
> the interface in future (for example providing callbacks on register
> change if the translator can track changes).
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1706
> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
> Based-on: <20231025093128.33116-18-akihiko.odaki@daynix.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> vAJB:
> 
> The main difference to Akikio's version is hiding the gdb register
> detail from the plugin for the reasons described above.
> ---
>   include/qemu/qemu-plugin.h   |  52 +++++++++++++++++-
>   plugins/api.c                | 102 +++++++++++++++++++++++++++++++++++
>   plugins/qemu-plugins.symbols |   2 +
>   3 files changed, 154 insertions(+), 2 deletions(-)
> 
> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> index 50a9957279..e5c16df5ca 100644
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
> @@ -218,8 +219,8 @@ struct qemu_plugin_insn;
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
> @@ -664,4 +665,51 @@ uint64_t qemu_plugin_end_code(void);
>    */
>   uint64_t qemu_plugin_entry_code(void);
>   
> +/** struct qemu_plugin_register - Opaque handle for a translated instruction */
> +struct qemu_plugin_register;
> +
> +/**
> + * typedef qemu_plugin_reg_descriptor - register descriptions
> + *
> + * @name: register name
> + * @handle: opaque handle for retrieving value with qemu_plugin_read_register
> + * @feature: optional feature descriptor, can be NULL
> + */
> +typedef struct {
> +    char name[32];
> +    struct qemu_plugin_register *handle;
> +    const char *feature;
> +} qemu_plugin_reg_descriptor;
> +
> +/**
> + * qemu_plugin_find_registers() - return register list
> + * @vcpu_index: vcpu to query
> + * @reg_pattern: register name pattern
> + *
> + * Returns a GArray of qemu_plugin_reg_descriptor or NULL. Caller
> + * frees. As the register set of a given vCPU is only available once
> + * the vCPU is initialised if you want to monitor registers from the
> + * start you should call this from a qemu_plugin_register_vcpu_init_cb()
> + * callback.
> + */
> +GArray * qemu_plugin_find_registers(unsigned int vcpu_index, const char *reg_pattern);

A pattern may be convenient for humans but not for machine. My 
motivation to introduce the feature is to generate traces consumable by 
trace-based simulators. Such a plugin needs an exact match of registers.
