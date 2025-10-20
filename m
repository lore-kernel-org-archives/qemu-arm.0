Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1865CCD1A2
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 23:15:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAz6G-000233-JE; Mon, 20 Oct 2025 19:15:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vAz66-000211-4j
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 19:15:33 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vAz63-00072x-74
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 19:15:25 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-33d962c0e9aso1500251a91.0
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 16:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761002120; x=1761606920; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OUaf7wYIozWx/WFVk2ZCYyAiKwn1asAj1d6d6nXUqbI=;
 b=cPUasQ2c4ZkH/P5rJ+qXlg1ujhO2Nq1OQShf/2Bm7or6uRQzRhnusjZg/HpTXRaVTB
 cbVmXsDm0AJpkWCgwW1Hd0dM4R9IuMrUHUAy1wQpTeCCnP/Qptm729GFwSNKuAR1F/iJ
 B/H3qAnv2rScA7lkl7f42l1UnfjPfZ4QBxeUsmicXFbf+vAfgLk57/n8z2jvOET9YDYE
 LT8WRvNmy9VbOsguO67c6sGcKGo3kz2srOb/6lxYO26H653pByxrDpQ20NVny/Mgl0gv
 c1EhnWPOXzsTn6GKtV9gQ2zY1lczV6qNRfAenwLPPPVmqkxEmQnJvDje3X3pB/wW360L
 bBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761002120; x=1761606920;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OUaf7wYIozWx/WFVk2ZCYyAiKwn1asAj1d6d6nXUqbI=;
 b=BNIQA3UXR6R63dDWR15Z9CpP++LjRSrsL+vPDy3JDuka0hkZpoeNrtBuSQB7Cas00F
 cWPWjU5zCHUmyaMN4k0isscnq/G/55N6AupI7ZRwWx9D+BJaMYSfFnP16aP7nrYMKbaW
 qy3rwhqtqjS8iwu89mQsMOREviVZNDZfCfdKEpYAAK0ZygXl9PWoT5PyG16B2AgPEPqC
 X1IEUJMkpZM6xzp7IzBADmX8iqacte9XLp4shed75qiv8j5svjZXDsVGzsMYnYfklcCu
 8NoI7PBFByjpgiJ9040quw9eTtrbrFUK2HemteaY/tv6kLSwFSGu2NW3OQA98HmSc6yi
 16Xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAOwVZJhW4pg172tsk7o6KY+gU1my1eUJhGM6s2PinUgg7eOZwdsy+g9QuVxj8OKD7ls4c370a/g==@nongnu.org
X-Gm-Message-State: AOJu0Yxis+24Xl94MGNLDrEshVe06uhlBWUY94EL+Mm1HK/MD/zFXBo6
 x3rBChlc13aQfLJisHp2po1ollIMvGBaS13T+wJCiDOnQ4bjWRabhaFb2bkXN2VW70Tn2NF0L3p
 W4CjSm54=
X-Gm-Gg: ASbGncvCu/jI8fTm7ZKpPBwgf9/V6fy8xc3+LDJ+1PHD2F/Pdk5PBNH87MqTyFqVE6X
 Ucjet/FDTdd25OVTXtOssFb6pgthoDnQP7tOIpOfysVY3JXxGB1BivTuWHR8RoPdFwd9l7NoK3G
 t/7Z7orpd2w0vS8eqEIZGbbdes9FJiFRnnEk7C3z/P3zG+Zp4WFAicNsu93dSmlo+cueG5YP4bo
 Ws4oIXjPAz2gmt3j2URtRikG8qKYSBInmjluZ99+aaqjBSOVoa0g1BhcMnvj0e0Npdv9Rs7jxtG
 Rd00MVcEDllKBFeNkNVVvhrK7MrnoiAdxC0yL4Y73qetC/Qj/YQdCzdyXE+SugHhFO7rjKSxheR
 /ZcphOK70WIL6pxdlO60qeQf1J4S/67NuelUZ8vFMbjHIzslx/4Z674e0fef9yQQkAmfGAhzi1u
 nvprpI8dGzrge4ww==
X-Google-Smtp-Source: AGHT+IGp09JXsgTv4dDf0DY1tD+NTvYWJXBM5SxGhMeaPywLJVqU+oYlMHiWari0fHQYrqNMm0+o3g==
X-Received: by 2002:a17:90a:d406:b0:32d:e027:9b26 with SMTP id
 98e67ed59e1d1-33bc9d1a8e6mr21159317a91.13.1761002120486; 
 Mon, 20 Oct 2025 16:15:20 -0700 (PDT)
Received: from [192.168.1.111] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b6a813d4766sm6984603a12.5.2025.10.20.16.15.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 16:15:20 -0700 (PDT)
Message-ID: <bc03818e-d76a-4301-931a-058f21bb6847@linaro.org>
Date: Mon, 20 Oct 2025 16:15:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 19/30] qemu/target-info: Add target_base_arch()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org
References: <20251020220941.65269-1-philmd@linaro.org>
 <20251020221508.67413-4-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251020221508.67413-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 2025-10-20 15:14, Philippe Mathieu-Daudé wrote:
> When multiple QEMU targets are variants (word size, endianness)
> of the same base architecture, target_base_arch() returns this
> base. For example, for the Aarch64 target it will return
> SYS_EMU_TARGET_ARM as common base.
>

I'm not sure that reusing semantic on a subset of this enum is the best 
idea, so many things can go wrong.

More widely, I don't know where we would need to access this, versus 
specific functions like target_base_arm().
If a code needs to check various base archs target_base_*, or it can use 
a switch with all variants.

If we really want to have this target_base concept, at least it deserves 
it's own enum, separate from SYS_EMU_TARGET.

> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/qemu/target-info-impl.h |  2 ++
>   include/qemu/target-info-qapi.h |  7 +++++++
>   target-info-stub.c              |  1 +
>   target-info.c                   | 10 ++++++++++
>   4 files changed, 20 insertions(+)
> 
> diff --git a/include/qemu/target-info-impl.h b/include/qemu/target-info-impl.h
> index e446585bf53..2c171f8359b 100644
> --- a/include/qemu/target-info-impl.h
> +++ b/include/qemu/target-info-impl.h
> @@ -17,6 +17,8 @@ typedef struct TargetInfo {
>       const char *target_name;
>       /* related to TARGET_ARCH definition */
>       SysEmuTarget target_arch;
> +    /* related to TARGET_BASE_ARCH definition (target/${base_arch}/ path) */
> +    SysEmuTarget target_base_arch;
>       /* runtime equivalent of TARGET_LONG_BITS definition */
>       unsigned long_bits;
>       /* runtime equivalent of CPU_RESOLVING_TYPE definition */
> diff --git a/include/qemu/target-info-qapi.h b/include/qemu/target-info-qapi.h
> index d5ce0523238..65ed4ca8eea 100644
> --- a/include/qemu/target-info-qapi.h
> +++ b/include/qemu/target-info-qapi.h
> @@ -19,6 +19,13 @@
>    */
>   SysEmuTarget target_arch(void);
>   
> +/**
> + * target_base_arch:
> + *
> + * Returns: QAPI SysEmuTarget enum (i.e. SYS_EMU_TARGET_I386).
> + */
> +SysEmuTarget target_base_arch(void);
> +
>   /**
>    * target_endian_mode:
>    *
> diff --git a/target-info-stub.c b/target-info-stub.c
> index d96d8249c1d..d2cfca1b4c2 100644
> --- a/target-info-stub.c
> +++ b/target-info-stub.c
> @@ -19,6 +19,7 @@ QEMU_BUILD_BUG_ON(offsetof(ArchCPU, env) != sizeof(CPUState));
>   static const TargetInfo target_info_stub = {
>       .target_name = TARGET_NAME,
>       .target_arch = SYS_EMU_TARGET__MAX,
> +    .target_base_arch = SYS_EMU_TARGET__MAX,

And nothing can enforce base and arch match by design, which is a 
problem IMHO.

>       .long_bits = TARGET_LONG_BITS,
>       .cpu_type = CPU_RESOLVING_TYPE,
>       .machine_typename = TYPE_MACHINE,
> diff --git a/target-info.c b/target-info.c
> index e567cb4c40a..332198e40a2 100644
> --- a/target-info.c
> +++ b/target-info.c
> @@ -33,6 +33,16 @@ SysEmuTarget target_arch(void)
>       return arch;
>   }
>   
> +SysEmuTarget target_base_arch(void)
> +{
> +    SysEmuTarget base_arch = target_info()->target_base_arch;
> +
> +    if (base_arch == SYS_EMU_TARGET__MAX) {
> +        base_arch = target_arch();
> +    }
> +    return base_arch;

More confusing, we can eventually return a non base arch if base arch 
was not correctly set above.

> +}
> +
>   const char *target_cpu_type(void)
>   {
>       return target_info()->cpu_type;

