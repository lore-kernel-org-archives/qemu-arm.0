Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp3457432lfo;
        Mon, 1 Feb 2021 06:29:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHWKjYkiipXQGOoFlCUYaNjs5WJ9UmykObUjXfNcDLhyVsmKAFMBroRx0VouDqD9RatppR
X-Received: by 2002:adf:ee43:: with SMTP id w3mr19385411wro.200.1612189776758;
        Mon, 01 Feb 2021 06:29:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612189776; cv=none;
        d=google.com; s=arc-20160816;
        b=xyDtcFB373snYuVuGve533GbX9d/Uv1PHtcMJHgl8uc0JADeaXFnc+t1HDBS7KMpWD
         EwBab7nndtGFnKRPXNtd0VUSZtfUm731KawJ1zlnr5nfclAiniR6KDiiWaBh8oD7VYfT
         Wz6J28WPTsMYgZ+hpQry84FJnDflqSh6DBDyQZ5/vjpKLqZr/OXis5k8EfNGOV7m2lul
         VEeqKPwR6DHnnNn7TIXD+h440VXKNXCBocEW+80ByGqOJhvfWkg/R44DpL7vQBcP7tL5
         QCIredlbSQDDy6vw/eXP74ulqjmRzKwerqvJxozi+NdaU/JwcL9tNvmRYdfAVb+nSSZO
         VHfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=b4c1pEYTdKGO7AGdXtxJmgv49Ckw7QSls6QGZV7s6Zs=;
        b=MVZOE8vEUdDY2yPj5bHZlQ9CX/FBAiDFSJ9nOa3XsEt6E+OMNsz5dxPzuhz6Uks3i4
         58jTEjB7U5Vz+UssLhR7pG+URAkOjCHPPZyYtAo4Wc+nEO0uDEU9luw+sWKIOf01HFQu
         3IJSEq6way5trW3/E2ND5eT+PqpQGfvSlXgMH1vB877H3gwra1ipaJvr3VIVwURKSPTE
         Eq6Wkm+xi2PPsNXJDJoVnlis2pVgZ8kAH6s/5V463p4YlenbTxHefdc+LvRl2b1khVIG
         h3lUIQ1uyI8cFhuRPCRJq5d9m0GQr0p3hV8L2yElM+hsfdUKS4kXxe1fg4TTPc6OYpRU
         HG0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=cfontana@suse.de
Return-Path: <cfontana@suse.de>
Received: from mx2.suse.de (mx2.suse.de. [195.135.220.15])
        by mx.google.com with ESMTPS id h84si15508wmf.3.2021.02.01.06.29.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Feb 2021 06:29:36 -0800 (PST)
Received-SPF: pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) client-ip=195.135.220.15;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=cfontana@suse.de
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0A2E0AE03;
	Mon,  1 Feb 2021 14:29:36 +0000 (UTC)
Subject: Re: [PATCH v6 01/11] sysemu/tcg: Introduce tcg_builtin() helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
References: <20210131115022.242570-1-f4bug@amsat.org>
 <20210131115022.242570-2-f4bug@amsat.org>
 <87d562ba-20e5-ee50-8793-59d77564f4da@suse.de>
 <009b3856-cc7d-af85-0094-69490aa6e824@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <e448f5af-273d-25f4-a341-3867121a3ee9@suse.de>
Date: Mon, 1 Feb 2021 15:29:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <009b3856-cc7d-af85-0094-69490aa6e824@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Y8ME/2heSra4

On 1/31/21 4:23 PM, Philippe Mathieu-Daudé wrote:
> On 1/31/21 3:18 PM, Claudio Fontana wrote:
>> On 1/31/21 12:50 PM, Philippe Mathieu-Daudé wrote:
>>> Modules are registered early with type_register_static().
>>>
>>> We would like to call tcg_enabled() when registering QOM types,
>>
>>
>> Hi Philippe,
>>
>> could this not be controlled by meson at this stage?
>> On X86, I register the tcg-specific types in tcg/* in modules that are only built for TCG.
>>
>> Maybe tcg_builtin() is useful anyway, thinking long term at loadable modules,
>> but there we are interested in whether tcg code is available or not, regardless of whether it's builtin,
>> or needs to be loaded via a .so plugin..
>>
>> maybe tcg_available()?
> 
> The alternatives I found:
> 
> - reorder things in vl.c?
> 
> - use ugly #ifdef'ry, see this patch:
>   https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg08037.html

Not sure it's that ugly,
if it is followed (or replaced by) exporting those pieces to separate files, which are only built by meson on CONFIG_TCG.

I did not try to do it, so you know best of course.

Ciao,

Claudio

> 
> - this earlier approach I previously discarded:
> 
> -- >8 --
> diff --git a/include/qom/object.h b/include/qom/object.h
> index d378f13a116..30590c6fac3 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -403,9 +403,12 @@ struct Object
>   *   parent class initialization has occurred, but before the class itself
>   *   is initialized.  This is the function to use to undo the effects of
>   *   memcpy from the parent class to the descendants.
> - * @class_data: Data to pass to the @class_init,
> + * @class_data: Data to pass to the @class_registerable, @class_init,
>   *   @class_base_init. This can be useful when building dynamic
>   *   classes.
> + * @registerable: This function is called when modules are registered,
> + *   prior to any class initialization. When present and returning %false,
> + *   the type is not registered, the class is not present (not usable).
>   * @interfaces: The list of interfaces associated with this type.  This
>   *   should point to a static array that's terminated with a zero filled
>   *   element.
> @@ -428,6 +431,7 @@ struct TypeInfo
>      void (*class_base_init)(ObjectClass *klass, void *data);
>      void *class_data;
> 
> +    bool (*registerable)(void *data);
>      InterfaceInfo *interfaces;
>  };
> 
> diff --git a/qom/object.c b/qom/object.c
> index 2fa0119647c..0febaffa12e 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -138,6 +138,10 @@ static TypeImpl *type_new(const TypeInfo *info)
>  static TypeImpl *type_register_internal(const TypeInfo *info)
>  {
>      TypeImpl *ti;
> +
> +    if (info->registerable && !info->registerable(info->class_data)) {
> +        return NULL;
> +    }
>      ti = type_new(info);
> 
>      type_table_add(ti);
> 
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 990509d3852..1a2b1889da4 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -24,6 +24,7 @@
>  #include "hw/loader.h"
>  #include "hw/arm/boot.h"
>  #include "sysemu/sysemu.h"
> +#include "sysemu/tcg.h"
>  #include "qom/object.h"
> 
>  #define SMPBOOT_ADDR    0x300 /* this should leave enough space for
> ATAGS */
> @@ -368,18 +369,26 @@ static void raspi3b_machine_class_init(ObjectClass
> *oc, void *data)
>  };
>  #endif /* TARGET_AARCH64 */
> 
> +static bool raspi_machine_requiring_tcg_accel(void *data)
> +{
> +    return tcg_builtin();
> +}
> +
>  static const TypeInfo raspi_machine_types[] = {
>      {
>          .name           = MACHINE_TYPE_NAME("raspi0"),
>          .parent         = TYPE_RASPI_MACHINE,
> +        .registerable   = raspi_machine_requiring_tcg_accel,
>          .class_init     = raspi0_machine_class_init,
>      }, {
>          .name           = MACHINE_TYPE_NAME("raspi1ap"),
>          .parent         = TYPE_RASPI_MACHINE,
> +        .registerable   = raspi_machine_requiring_tcg_accel,
>          .class_init     = raspi1ap_machine_class_init,
>      }, {
>          .name           = MACHINE_TYPE_NAME("raspi2b"),
>          .parent         = TYPE_RASPI_MACHINE,
> +        .registerable   = raspi_machine_requiring_tcg_accel,
>          .class_init     = raspi2b_machine_class_init,
>  #ifdef TARGET_AARCH64
>      }, {
> ---
> 
>>
>> Ciao,
>>
>> Claudio
>>
>>> but tcg_enabled() returns tcg_allowed which is a runtime property
>>> initialized later (See commit 2f181fbd5a9 which introduced the
>>> MachineInitPhase in "hw/qdev-core.h" representing the different
>>> phases of machine initialization and commit 0427b6257e2 which
>>> document the initialization order).
>>>
>>> As we are only interested if the TCG accelerator is builtin,
>>> regardless of being enabled, introduce the tcg_builtin() helper.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>> Cc: Markus Armbruster <armbru@redhat.com>
>>> ---
>>>  include/sysemu/tcg.h | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
>>> index 00349fb18a7..6ac5c2ca89d 100644
>>> --- a/include/sysemu/tcg.h
>>> +++ b/include/sysemu/tcg.h
>>> @@ -13,8 +13,10 @@ void tcg_exec_init(unsigned long tb_size, int splitwx);
>>>  #ifdef CONFIG_TCG
>>>  extern bool tcg_allowed;
>>>  #define tcg_enabled() (tcg_allowed)
>>> +#define tcg_builtin() 1
>>>  #else
>>>  #define tcg_enabled() 0
>>> +#define tcg_builtin() 0
>>>  #endif
>>>  
>>>  #endif
>>>
>>
> 
