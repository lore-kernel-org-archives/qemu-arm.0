Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp491078ejb;
        Mon, 18 Mar 2024 01:17:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXcYpt6saWCSoLAjdxBaJ7v/zIHb5LNk6bUAD4SD2KPfn2X3KzzoIGDJ8nyyWEnRJJQ3naScJcxEhmxIK/+KHf5TD1mqYYo
X-Google-Smtp-Source: AGHT+IH8ogboiEgBTJHTiET2ae6r4BSrO/OKuZ8659qPYzrGe7NoQj46uzB3p415Rytv1yl3tqaJ
X-Received: by 2002:a05:622a:208:b0:430:c5c3:c64a with SMTP id b8-20020a05622a020800b00430c5c3c64amr6700059qtx.5.1710749857112;
        Mon, 18 Mar 2024 01:17:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710749857; cv=none;
        d=google.com; s=arc-20160816;
        b=moe39Wk4xGFVf9yy+gLde2gwvnYeOsf5mXrF3SsFYh8QxbylT0mL26f+CPDfhwNYIy
         MGFHT4J+9IaD9ACbCuMzdLCzgGvUH6pYvVdvJ07gIaDt7Os5lwDznABG7orkuRm35jH/
         eELc3/o3DHbbAVbxt0r/GXlf6w520FI1lLJr3Iv8GluyZAHKIqoCIW7WAl1GFbHE8Rjd
         aOwOZAxv8MRm4vtDZeUah39pI37qKSeM7OZxEQsfMMlKTsWNVvdTT146NDYgM9wiU6QK
         R9mZukh8u48Az/cW2wDlzKveyPwAanfB13Guq7+ND8Oqsz3oHWniw8TbnxThmt2m6HNL
         YG8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Z3yZzYwPNdCo9HzinNcI6GbK9jexvtc4AGQqdNMTOwc=;
        fh=6YUZx8aMYw+jOHwD8KPYk1ytutxkPPdbJOTiy6onye0=;
        b=BSGr9k7QXQG0ObVXUZoAkCO8+EsUJJBjXVpV+6iE4w+xtnkLCcjch3LdiK9ccKXY7x
         Aa6w3lGSzyquoMlwqBfubOsDoj78Gi5uH3yzvoij+F2USjGTM9GvQrn83FOHTZrN3FOH
         OFsJSXm5HhNZcy6xXvssvZdKg21yaKpSCk2s47mC4s0JF19DlOY+uVuD3AVf+b5Eg9ZN
         MVV6DxLO0X5f1KjkcU1kLa+Nu4BHxxTxr/iT8Iz4eaQgjrEL5bqAaZutMH8DmQqXgsiX
         ri2kCekWBq+rbcaKSOT10G7rCe/v2HBBVcSCPk8kkejGhzBulet+M9dxb6/SOM2msQA2
         oaaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=CG+026bW;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.9])
        by mx.google.com with ESMTPS id w4-20020a05622a134400b00430d4e537easi989108qtk.628.2024.03.18.01.17.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Mar 2024 01:17:37 -0700 (PDT)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.198.163.9;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=CG+026bW;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710749857; x=1742285857;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Gp5/N3Kgd9u6t4pstjSRJF2QxivLRDeeRMPxXHWN/cY=;
  b=CG+026bWV+ZeHXgTTT6mHbFsLGuLiL+fu8Zb7Ujd8UhuPpdrGHaelShk
   lkyopzZhS8Iqvs3GfIZFRbV7WfD34BySVLD3Kivo1ByKt7DW9eziOqAYi
   5cJVSo52tYse2KVddmTQ5fw1bH7oprhw14FRzLRHn+T7IeUCVGEcpe5Ww
   7MpO2TPnOmXrIU5He/We+VAvzXyiO0kys2FMtHUhMCWpRWPeFa+yipla1
   1YK7ElElT/HT8JC1yD8FGUM8l9nCR+69n/PvWVy6Ch39RmaEWd8ju9RMK
   vSPykBqwodKQ3v2R/PozeLqXVk/TUXrP9il1bGGFkuiwd2Ti0uHEBdWvt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="16271091"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="16271091"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 01:17:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="14034331"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orviesa008.jf.intel.com with ESMTP; 18 Mar 2024 01:17:28 -0700
Date: Mon, 18 Mar 2024 16:31:19 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	qemu-riscv@nongnu.org, Anton Johansson <anjo@rev.ng>,
	qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
	Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>, qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH-for-9.1 05/21] cpus: Open code OBJECT_DECLARE_TYPE() in
 OBJECT_DECLARE_CPU_TYPE()
Message-ID: <Zff71/46jLOGz9XO@intel.com>
References: <20240315130910.15750-1-philmd@linaro.org>
 <20240315130910.15750-6-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240315130910.15750-6-philmd@linaro.org>
X-TUID: w+n3GlZjTixs

Hi Philippe,

On Fri, Mar 15, 2024 at 02:08:53PM +0100, Philippe Mathieu-Daudé wrote:
> Date: Fri, 15 Mar 2024 14:08:53 +0100
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH-for-9.1 05/21] cpus: Open code OBJECT_DECLARE_TYPE() in
>  OBJECT_DECLARE_CPU_TYPE()
> X-Mailer: git-send-email 2.41.0
> 
> Since the OBJECT_DECLARE_CPU_TYPE() macro uses the abstract ArchCPU
> type, when declaring multiple CPUs of the same ArchCPU type we get
> an error related to the indirect G_DEFINE_AUTOPTR_CLEANUP_FUNC()
> use within OBJECT_DECLARE_TYPE():
> 
>   target/mips/cpu-qom.h:31:1: error: redefinition of 'glib_autoptr_clear_ArchCPU'
>   OBJECT_DECLARE_CPU_TYPE(MIPS64CPU, MIPSCPUClass, MIPS64_CPU)
>   ^
>   include/hw/core/cpu.h:82:5: note: expanded from macro 'OBJECT_DECLARE_CPU_TYPE'
>       OBJECT_DECLARE_TYPE(ArchCPU, CpuClassType, CPU_MODULE_OBJ_NAME);
>       ^
>   include/qom/object.h:237:5: note: expanded from macro 'OBJECT_DECLARE_TYPE'
>       G_DEFINE_AUTOPTR_CLEANUP_FUNC(InstanceType, object_unref) \
>       ^
>   /usr/include/glib-2.0/glib/gmacros.h:1371:3: note: expanded from macro 'G_DEFINE_AUTOPTR_CLEANUP_FUNC'
>     _GLIB_DEFINE_AUTOPTR_CLEANUP_FUNCS(TypeName, TypeName, func)
>     ^
>   /usr/include/glib-2.0/glib/gmacros.h:1354:36: note: expanded from macro '_GLIB_DEFINE_AUTOPTR_CLEANUP_FUNCS'
>     static G_GNUC_UNUSED inline void _GLIB_AUTOPTR_CLEAR_FUNC_NAME(TypeName) (TypeName *_ptr)                     \
>                                      ^
>   /usr/include/glib-2.0/glib/gmacros.h:1338:49: note: expanded from macro '_GLIB_AUTOPTR_CLEAR_FUNC_NAME'
>   #define _GLIB_AUTOPTR_CLEAR_FUNC_NAME(TypeName) glib_autoptr_clear_##TypeName
>                                                   ^
>   <scratch space>:54:1: note: expanded from here
>   glib_autoptr_clear_ArchCPU
>   ^
>   target/mips/cpu-qom.h:30:1: note: previous definition is here
>   OBJECT_DECLARE_CPU_TYPE(MIPS32CPU, MIPSCPUClass, MIPS32_CPU)
>   ^
> 
> Avoid that problem by expanding the OBJECT_DECLARE_TYPE() macro
> within OBJECT_DECLARE_CPU_TYPE().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> TODO: check rth comment:
> What about adding an OBJECT_DECLARE_CPU_SUBTYPE that omits half the stuff instead?
> We don't need another object typedef at all, for instance.
> ---
>  include/hw/core/cpu.h | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index ec14f74ce5..4c2e5095bf 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -78,7 +78,12 @@ DECLARE_CLASS_CHECKERS(CPUClass, CPU,
>   */
>  #define OBJECT_DECLARE_CPU_TYPE(CpuInstanceType, CpuClassType, CPU_MODULE_OBJ_NAME) \
>      typedef struct ArchCPU CpuInstanceType; \
> -    OBJECT_DECLARE_TYPE(ArchCPU, CpuClassType, CPU_MODULE_OBJ_NAME);
> +    typedef struct CpuClassType CpuClassType; \
> +    \
> +    G_DEFINE_AUTOPTR_CLEANUP_FUNC(CpuInstanceType, object_unref) \
> +    \
> +    DECLARE_OBJ_CHECKERS(CpuInstanceType, CpuClassType, \
> +                         CPU_MODULE_OBJ_NAME, TYPE_##CPU_MODULE_OBJ_NAME)
>

The OBJECT_DECLARE_TYPE is expaneded as the following:

#define OBJECT_DECLARE_TYPE(InstanceType, ClassType, MODULE_OBJ_NAME) \
    typedef struct InstanceType InstanceType; \
    typedef struct ClassType ClassType; \
    \
    G_DEFINE_AUTOPTR_CLEANUP_FUNC(InstanceType, object_unref) \
    \
    DECLARE_OBJ_CHECKERS(InstanceType, ClassType, \
                         MODULE_OBJ_NAME, TYPE_##MODULE_OBJ_NAME)

So the above code change deletes a typedef:

    typedef struct ArchCPU ArchCPU;

Will this deletion break the direct uses of ArchCPU? e.g., in
accel/tcg/translator.c:

static void set_can_do_io(DisasContextBase *db, bool val)
{
    if (db->saved_can_do_io != val) {
        ...
        tcg_gen_st8_i32(tcg_constant_i32(val), tcg_env,
                        offsetof(ArchCPU, parent_obj.neg.can_do_io) -
                        offsetof(ArchCPU, env));
    }
}

Thanks,
Zhao
