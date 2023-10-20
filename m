Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp998543ejb;
        Thu, 19 Oct 2023 22:43:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnuWf+znIvd1pd34h26SbLt0xf2seWUvTDeq6NKyjMekEE4TMnLzJJVREFSUgN5LVKjlUJ
X-Received: by 2002:a67:cc1b:0:b0:457:df59:b43a with SMTP id q27-20020a67cc1b000000b00457df59b43amr939688vsl.4.1697780598958;
        Thu, 19 Oct 2023 22:43:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697780598; cv=none;
        d=google.com; s=arc-20160816;
        b=nznXWvB3JMcdHiyjEi0HfmMK8A8di0kncY7B/k7tpL7EvxsCo3uYjzREWYmhiSDEaE
         9YAQ5Z4iKdl4o3MVYqmtvVw8PwEA/qB0nGaljitMVKvVA9gruU+OjwFwzVHYDzpNsWpv
         OsRAUcODmV0By5T1FptHFJgFlhiUp1iNwlQ1EMKVZZE/3OmsQFWmEjjuUnmZS9fhVDyo
         CjN3AUznYB+TMMg7DK8cVmPG304g1KDlQMbQikvhIL/j9Ds9Jrhg9txJ8MmGlDVBeBkZ
         2QGfV38FXOebn7V5s0PYoDboFzT4BF00slTTicBNDuaLSBAZDuRd9SAMZ5HaqkzgPonr
         TrNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=WnU1h1H4Y6QbpEomiRt28ptrEhBhNMGnVXShQHzkunQ=;
        fh=6LIferDA4/z/iWTju/wr9elUK8av7rGIJzQfEXz5NGs=;
        b=HfrXsSjxzPckvgJpXVSVqakeTmzm16U9+/Q/6fEvrjD4uItK4JpQpL1JyW0uCeeaTL
         j+aJ3hl8sKX+J6Ok8934fXfsqMMEgzg4fNjLVHVnfjZHondBY2qqSd3rdSJnIkOVKGjO
         krq+qjG+ibC+hUnd9wq5CcybsfvhVlYKE2UA3TVMvoIqJ1CD0Cf/ZpSqCA3TxM8MpHPx
         K7IZoglP5Mo0NeG7oInkc/4FI+JblVE9l8XO6By6Ci6Ylr3pviDvfweR8W1S8f+pSkV6
         wDEM7B6KsJtcZ14GHU3mpP0+XWpIqAlmrYyZfTDJuOXERNFHAXQNCkdzD2g8CWH2n1cz
         1Syw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=kQflDmMZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m21-20020a05620a291500b0077099ee8b66si777335qkp.349.2023.10.19.22.43.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 22:43:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=kQflDmMZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtiHY-0001uB-1d; Fri, 20 Oct 2023 01:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1qtiHV-0001rD-32; Fri, 20 Oct 2023 01:42:45 -0400
Received: from mgamail.intel.com ([134.134.136.31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1qtiHT-0002l6-At; Fri, 20 Oct 2023 01:42:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697780563; x=1729316563;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=M85QpS6g1ScTZoR7bP1pyrEzxvh1oaAtmh24F6M6lv8=;
 b=kQflDmMZu5R+c2fVpH1NcKS7Ef9bh1UlUPm2QH0uA5KH37dvBBIQxwqh
 NoVd2lUmRU054P4Js2gqKzVFCgMKWh55+DtDE4aA9VG+6s5v4hi30Dp1/
 Ewq0HJHNyY/1X9nFsr2Hu2qCSJriPmIW6f6VtCio/676aJSxf+Sdbbp1P
 K/+tJsI8h3An4dlZ1NPfW4Ff5+l06HOxSQ2C7IQi9ekz4/U/7AcUAZLmO
 IHPUaxgKiTnZEREY5k4OUZcV7aB+qtN2Qf/24fZk3+KQxAZUlTlq7yGJX
 8dUeqV0Wn7PI8HVj3x85/xHbIgeyhnxE/b86rwW5Yj/RBE9FQPE64OAQK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="450659059"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="450659059"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 22:42:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="901038638"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="901038638"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.36])
 by fmsmga001.fm.intel.com with ESMTP; 19 Oct 2023 22:40:14 -0700
Date: Fri, 20 Oct 2023 13:54:00 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Song Gao <gaosong@loongson.cn>, Paolo Bonzini <pbonzini@redhat.com>,
 Stafford Horne <shorne@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yanan Wang <wangyanan55@huawei.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Marek Vasut <marex@denx.de>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Brian Cain <bcain@quicinc.com>, Thomas Huth <thuth@redhat.com>,
 Chris Wulff <crwulff@gmail.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Michael Rolnik <mrolnik@gmail.com>
Subject: Re: [PATCH v2 13/16] target/i386: Declare CPU QOM types using
 DEFINE_TYPES() macro
Message-ID: <ZTIV+GyXWGNPW2fX@intel.com>
References: <20231013140116.255-1-philmd@linaro.org>
 <20231013140116.255-14-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231013140116.255-14-philmd@linaro.org>
Received-SPF: pass client-ip=134.134.136.31; envelope-from=zhao1.liu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: JFDF6kUDgSs9

On Fri, Oct 13, 2023 at 04:01:12PM +0200, Philippe Mathieu-Daudé wrote:
> Date: Fri, 13 Oct 2023 16:01:12 +0200
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH v2 13/16] target/i386: Declare CPU QOM types using
>  DEFINE_TYPES() macro
> X-Mailer: git-send-email 2.41.0
> 
> When multiple QOM types are registered in the same file,
> it is simpler to use the the DEFINE_TYPES() macro. In
> particular because type array declared with such macro
> are easier to review.
> 
> In few commits we are going to add more types, so replace
> the type_register_static() to ease further reviews.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/i386/cpu.c | 50 ++++++++++++++++++++++-------------------------
>  1 file changed, 23 insertions(+), 27 deletions(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 3aab05ddad..81b05d421c 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -4990,13 +4990,6 @@ static void max_x86_cpu_initfn(Object *obj)
>                              &error_abort);
>  }
>  
> -static const TypeInfo max_x86_cpu_type_info = {
> -    .name = X86_CPU_TYPE_NAME("max"),
> -    .parent = TYPE_X86_CPU,
> -    .instance_init = max_x86_cpu_initfn,
> -    .class_init = max_x86_cpu_class_init,
> -};
> -
>  static char *feature_word_description(FeatureWordInfo *f, uint32_t bit)
>  {
>      assert(f->type == CPUID_FEATURE_WORD || f->type == MSR_FEATURE_WORD);
> @@ -8018,19 +8011,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
>      }
>  }
>  
> -static const TypeInfo x86_cpu_type_info = {
> -    .name = TYPE_X86_CPU,
> -    .parent = TYPE_CPU,
> -    .instance_size = sizeof(X86CPU),
> -    .instance_align = __alignof(X86CPU),
> -    .instance_init = x86_cpu_initfn,
> -    .instance_post_init = x86_cpu_post_initfn,
> -
> -    .abstract = true,
> -    .class_size = sizeof(X86CPUClass),
> -    .class_init = x86_cpu_common_class_init,
> -};
> -
>  /* "base" CPU model, used by query-cpu-model-expansion */
>  static void x86_cpu_base_class_init(ObjectClass *oc, void *data)
>  {
> @@ -8042,22 +8022,38 @@ static void x86_cpu_base_class_init(ObjectClass *oc, void *data)
>      xcc->ordering = 8;
>  }
>  
> -static const TypeInfo x86_base_cpu_type_info = {
> -        .name = X86_CPU_TYPE_NAME("base"),
> -        .parent = TYPE_X86_CPU,
> -        .class_init = x86_cpu_base_class_init,
> +static const TypeInfo x86_cpu_types[] = {
> +    {
> +        .name           = TYPE_X86_CPU,
> +        .parent         = TYPE_CPU,
> +        .abstract       = true,
> +        .instance_size  = sizeof(X86CPU),
> +        .instance_align = __alignof(X86CPU),
> +        .instance_init  = x86_cpu_initfn,
> +        .instance_post_init = x86_cpu_post_initfn,
> +        .class_size     = sizeof(X86CPUClass),
> +        .class_init     = x86_cpu_common_class_init,
> +    }, {
> +        .name           = X86_CPU_TYPE_NAME("base"),
> +        .parent         = TYPE_X86_CPU,
> +        .class_init     = x86_cpu_base_class_init,
> +    }, {
> +        .name           = X86_CPU_TYPE_NAME("max"),
> +        .parent         = TYPE_X86_CPU,
> +        .instance_init  = max_x86_cpu_initfn,
> +        .class_init     = max_x86_cpu_class_init,
> +    }
>  };
>  
> +DEFINE_TYPES(x86_cpu_types)
> +
>  static void x86_cpu_register_types(void)
>  {
>      int i;
>  
> -    type_register_static(&x86_cpu_type_info);
>      for (i = 0; i < ARRAY_SIZE(builtin_x86_defs); i++) {
>          x86_register_cpudef_types(&builtin_x86_defs[i]);
>      }
> -    type_register_static(&max_x86_cpu_type_info);
> -    type_register_static(&x86_base_cpu_type_info);
>  }
>  
>  type_init(x86_cpu_register_types)
> -- 
> 2.41.0
> 
> 
> 
