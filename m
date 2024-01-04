Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp32762ejo;
        Thu, 4 Jan 2024 04:05:33 -0800 (PST)
X-Received: by 2002:a05:6e02:1986:b0:35e:6b97:b8a4 with SMTP id g6-20020a056e02198600b0035e6b97b8a4mr542993ilf.4.1704369933145;
        Thu, 04 Jan 2024 04:05:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704369933; cv=none;
        d=google.com; s=arc-20160816;
        b=c8BYR5636Gt84YRY2qMayVpOUiMIZMES04f6NueO2VGO7eg33EoKyY1hmyF0LsF+6B
         KrHOrlYZZwhwJ46SGJf4Kxtdl1x0ZgE2p8hHueFN7FUZNpuE8Q2U/dROvKfRlIydiIO/
         zpslr80IDh9dIvqCIw0PINq3I8M2emafPpzXpbdfGmFrq6sLf6oUhPkEtfu2jI+1U7/I
         11b+WuNmXfsZ1AdhcNKtMnXdQWMiKrqzxBkA/1DQbiUlXznMZxOlB1ODyeecVrstz6ni
         TKfXu4rAWRprtR8AZxxXNrornjFqYq8sDozq9B7ylv6jAZtc4eIivo4dnM+3MbPHMnBL
         7MKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1JfSYgvG+gN3IuIgW3mKT13qe2Rfz3AaTGl7a0v25sQ=;
        fh=NP0n39o7MvmsMqwVycokvR4b3+8v0bd4xNfhcG+WTO4=;
        b=iLWWihHj0xdKdDXD+eB0SWSheEh+xOtpQgPVOmxzKicyGIU83nIt6/Yw09GPGdmxC6
         S9fhtG9k7L/3eLplWsESzdaYESDzWYtA5ywbPcMUmmzJ7NaSGgWGkP5CvivfPC9fBXbj
         KUYc3n8rUJaEFgA6g8cNCu42TiBudRdhgEztpZO5cZJcZsOJoAoWZ0USyfFjuNA/VOz4
         KtSWWUXBwiFmG3RolQzCHdXoShBhmI9pFnjVD8g8DcxGV+Xw3py5ZVN2rokLhpd9qcby
         3RnVXOZelEeXxD6sXTf4/t/AEGhMP+zBy3dHX7oMPVBejjZMs8MW54/mJyF/iNmKPhon
         8UEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b="L54Pe/V1";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j189-20020a6380c6000000b005cdf7aa62acsor5109367pgd.9.2024.01.04.04.05.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 04 Jan 2024 04:05:33 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b="L54Pe/V1";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1704369932; x=1704974732; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1JfSYgvG+gN3IuIgW3mKT13qe2Rfz3AaTGl7a0v25sQ=;
        b=L54Pe/V1g/+/6fn6gAodtL84OVsjqrxp3nYBzKoKPG0ofIcNeohzuF0Kr72I1pCVMH
         y2O4C4VOLIznvXgp6TZjm//7uYivZHxZYC+cL3diT/3bFTpWfvuAAzpiW1xuWZvh0JHP
         NV0F7i24j8PxZ4m54eoxchRQfHnlUeaKCypTJV+gO76Yh4TPwI1vMAuMC3e8s6zGsZIb
         xomOHELW50GNtiN6q500qWZxdFummywukcZrbdobRoJG6eMWEoppNuxRZ+oI4k0VvRxz
         daQLA2RpCyMzDzDaniZO/ZQZhzlaTsB4KM39WFjvFWgKtH4K1LfpQUwWoVW/6XrnPj8W
         jiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704369932; x=1704974732;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1JfSYgvG+gN3IuIgW3mKT13qe2Rfz3AaTGl7a0v25sQ=;
        b=jZPbBVJxnQhvEbfWjWMSeIeICNORCdKd1Mo5gO97yQkWrFVDiMD4z2W36UFsLntgtX
         vjmws4j93z/fe6eY0zQe/C8Odfo8POJVc8ZFNOWIuuv1gnT4LS2QXbBZrfiQdXJB3oPD
         ptiCKRs5WWTXo2cEDXxaAX6LxyoZBGlXLZRRU/S/VomwSSvw59/kH4q0sydEl72v4YZM
         c8A9Y8TUTyRdflWmAEUW4Rl2PUFE8LkJPv1pvf3oYzm5DTpkyFkbVVcLrIHW0oPqNHZf
         ZbmAdY7SFJVUTPZQY9XYt0BGzUd9iyptOHLoFq41e5D8vW1bdMKX98InTPUgU31bC3og
         E3hQ==
X-Gm-Message-State: AOJu0Yxjw5V8yi6V1V06nkvn2hYXCiJMwTDNQWTwkjDCXot6cRB7ewqm
	NCz3OYecj0AEmRDs8eCxAzJu8uI/iqP9bKlYdTFutFN1eNm15Q==
X-Google-Smtp-Source: AGHT+IF2iS1huYrRTsdmtHUlZNPJuYf+UOYa/O57oEjcrmBp+rJUuvidSwvdw5+1d7IxIqlfD1OWKQ==
X-Received: by 2002:a05:6a20:430d:b0:198:f146:b2da with SMTP id h13-20020a056a20430d00b00198f146b2damr405894pzk.93.1704369932451;
        Thu, 04 Jan 2024 04:05:32 -0800 (PST)
Return-Path: <akihiko.odaki@daynix.com>
Received: from ?IPV6:2400:4050:a840:1e00:9ac7:6d57:2b16:6932? ([2400:4050:a840:1e00:9ac7:6d57:2b16:6932])
        by smtp.gmail.com with ESMTPSA id c1-20020a63a441000000b005ce472f2d0fsm12383424pgp.66.2024.01.04.04.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 04:05:32 -0800 (PST)
Message-ID: <52cac44e-a467-4748-8c5b-c9c47f5b0f79@daynix.com>
Date: Thu, 4 Jan 2024 21:05:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 38/43] plugins: add an API to read registers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, David Woodhouse <dwmw2@infradead.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Paul Durrant <paul@xen.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, John Snow <jsnow@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
 <20240103173349.398526-39-alex.bennee@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20240103173349.398526-39-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: h0K/c1h/MYLu

On 2024/01/04 2:33, Alex Bennée wrote:
> We can only request a list of registers once the vCPU has been
> initialised so the user needs to use either call the get function on
> vCPU initialisation or during the translation phase.
> 
> We don't expose the reg number to the plugin instead hiding it behind
> an opaque handle. This allows for a bit of future proofing should the
> internals need to be changed while also being hashed against the
> CPUClass so we can handle different register sets per-vCPU in
> hetrogenous situations.
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
> v3
>    - also g_intern_string the register name
>    - make get_registers documentation a bit less verbose
> v2
>    - use new get whole list api, and expose upwards
> 
> vAJB:
> 
> The main difference to Akikio's version is hiding the gdb register
> detail from the plugin for the reasons described above.
> ---
>   include/qemu/qemu-plugin.h   |  51 +++++++++++++++++-
>   plugins/api.c                | 102 +++++++++++++++++++++++++++++++++++
>   plugins/qemu-plugins.symbols |   2 +
>   3 files changed, 153 insertions(+), 2 deletions(-)
> 
> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> index 4daab6efd29..95380895f81 100644
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
> @@ -227,8 +228,8 @@ struct qemu_plugin_insn;
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
> @@ -708,4 +709,50 @@ uint64_t qemu_plugin_end_code(void);
>   QEMU_PLUGIN_API
>   uint64_t qemu_plugin_entry_code(void);
>   
> +/** struct qemu_plugin_register - Opaque handle for register access */
> +struct qemu_plugin_register;

Just in case you missed my comment for the earlier version:

What about identifying a register with an index in an array returned
by qemu_plugin_get_registers(). That saves troubles having the handle
member in qemu_plugin_reg_descriptor.

Regards,
Akihiko Odaki
