Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp362995njm;
        Tue, 29 Apr 2025 09:01:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUKFcpqD5Nm83MgTvabZ6J3JuyuKY8tJCABrLcBjgEHOk6IFgpQnBabNSkJOcZWR9OMs/T1WgTnJMrUnQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFsrGXovI1/JhN/YBTShrWkitFKa5q0+iD0hogS8XIIUJ9vdmZjNBk3001RAdF36YPXjs4K
X-Received: by 2002:a05:6808:80c8:b0:401:e921:906c with SMTP id 5614622812f47-401fd6ec656mr8485308b6e.8.1745942508085;
        Tue, 29 Apr 2025 09:01:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745942508; cv=none;
        d=google.com; s=arc-20240605;
        b=agUk+yiyAWbUvyrrwyw0uryh+QuUq0Zij+DZL0Wh433/q8bQeu/r6F5DW/vLj1vkpR
         yljMu9l5xgMlxK1C1h6hKbFWId58VogjxkZ8US0+kELMfXxEvByJvS6mFYM6XJ0Iyg23
         fewRMhRqLfwm759TK+dza0YdnAIkX4k5DYxIb2bnNf+phS62rytGO9v+3Da4fs3Hbdrc
         ACu2e52rFqp1hf+saX7QIP3x3mIFBZS+hDiKWBpDWn+1vcWeyRud+Ma1aO7n4CC54WlH
         Yor2iAQ+7BLLBOBE4b/pFIplL8AHkXmqE/EbXOzoR/a7lgEJfCll+UKx3LShFSgAxRDL
         ioHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=NshikzmT5Pcip6CvA/hgkEdeHh9n6MWtgMTwqzB0QF4=;
        fh=4wPu5hhtcF52lT6BSFy8dMUUKtebvMKLmoDwM+IzlAU=;
        b=Inop90fLyN59lhFc8ACWcWJfuu/Op9mxkZboBBHgFHyJEfZFDKLs0LWNOjweXOwCrJ
         qX5+LU3Lx8OEKxQbVYP7G7mcQigUv6J2VBN19SlNDGh5kL2m9NH7nbYRurOsd3yHhklo
         pbIlkMjG6Jz5+8waQ4tbqzyccqm1+OVNgwG4WPgcVQORt+z+Cm2qRmjKlzfr+3U04Rf6
         ShUNzwjsplz9rNDFiqTcrkd1h6ibILhErSLIrTZtNktXODWMPEqDe/tXAMBSXb48AYiY
         Dtv4oESUf6Jt5DRH5F1bD9smNpJK9rQdeAM4/IIsg220L5XLJRMu9zZ8DecjlSv70ZLe
         ITkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=TsMPDy7w;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-52a99209578si1976447e0c.43.2025.04.29.09.01.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Apr 2025 09:01:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=TsMPDy7w;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u9nNt-000520-Qq; Tue, 29 Apr 2025 12:00:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1u9nNi-0004pH-1D; Tue, 29 Apr 2025 12:00:26 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1u9nNf-00040X-HT; Tue, 29 Apr 2025 12:00:25 -0400
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-30bfd4d4c63so52772671fa.2; 
 Tue, 29 Apr 2025 09:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745942421; x=1746547221; darn=nongnu.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NshikzmT5Pcip6CvA/hgkEdeHh9n6MWtgMTwqzB0QF4=;
 b=TsMPDy7wTzJy28bJ3ycvvyHlqx94BqLJf1W6SoaXwCds/uCrc1jQ5sCQxaDEYioaau
 BSlE0IBiG77guw5JYsd5fFfbTs92IXlk527MclnPg7uSRjgGg1zq1QXKOICSLzR3+Xkb
 EZVKdMXJ+sj2c2aw3YE3JjiqxKU49anQoO92alt9qU2psBnWylBF56E8b4Kj7U47Hjqd
 5PN1OuQy0LhgZhx0Ldl+ZxjJ/QtAMt2vTTbxRVElljSt6C3XDqpwEiw5RVsO6o9qGDk9
 wefLg8QwZNrBaqBM81CJRbAb/PXZpAvxMYItll2e/iXb9EivHvMtq89EbU1DoVj6U3Vs
 6Dpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745942421; x=1746547221;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NshikzmT5Pcip6CvA/hgkEdeHh9n6MWtgMTwqzB0QF4=;
 b=OrKc28TIeD6IzaWhwulPQbvVz20xByowct65IXFZVmVMHSFG3FrDFZvzoyIqMjL0qz
 TJxWaBLi2Zoo2Dlq381aOLCeBGUhRah4v/zuPbQw2p76u2JZTE/AnTYki8VWE4VHxU6l
 e/iN5XWKtAzJRZBNbM890RsvVfqWXIg+d1U1X9Rmhg6AotzbvyXz7BtxYBCvcnY9bzct
 na6SQbyGZVdeF2H9CarRj6bc6wXLjnO6F4ZcT9fj7LR3ZjlbVbXUSfeQDcSmH3ZgBr/Z
 hmSi2y2xXyS0qaeHLGkDHtdxirKkkTMNQhPUT6syNDXH4fy9Nc0ycZ4lSLFPjA0dwVJx
 xM1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ9CACor4uGGHR/xQWSb3JTm4jNmDnY4+KqCxmk9k+Xrqq33YEnk5wICtlcHvAFAhutAOsJ0tEzKXB@nongnu.org
X-Gm-Message-State: AOJu0YzqqfWfj/BxKY2NswMzj2wXizL/aHRXWjaUzFIXBJncE41DZcui
 QuoYAk9O+GY+hi2lDCfS8N+SSntbESdz0A7tJhvp4YnRDPJ5oA3ZErBOeKKPj7M=
X-Gm-Gg: ASbGncsiFF1NM3/SEwp59j8EnrxzC4Vy4hXnyp++w8HEbFa9/yF1maspYjVXqgT2i0s
 aO92hf79BoXGi1Xymw9tuidKj0WGDCaGZiNCaoOXOmi0M7/I+sv1Bn77snF2Sq+V//0vbC4SPWX
 SQ3ZHpxQO2YW+IwFF9STsIELI9gYx6S8MP//vMXFRKLL5Fq5ad25Z+sgsWYYGGIsOkrNctuokbH
 0iuU/FbOhlwuLOkYAyzM/t9gL7jvYQgOjOYPzmmnYgCFggYeov765mJPbIkwx955n9+dOBuwDHK
 G0TVLM26jqXHAwxtlYAvO+FqOUPU3KOTMGgKvKEoQ4BBo6DUQx9jlHz9kyO/S2yoR3FG+HTXKJb
 0zihBXKb7TbOFGsylyuZqqKg=
X-Received: by 2002:a05:651c:212a:b0:30c:4be7:1d42 with SMTP id
 38308e7fff4ca-31d5af36c0dmr11373091fa.12.1745942420595; 
 Tue, 29 Apr 2025 09:00:20 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3a347sm1894703e87.76.2025.04.29.09.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 09:00:20 -0700 (PDT)
Date: Tue, 29 Apr 2025 18:00:19 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 2/7] target/microblaze: Delay
 gdb_register_coprocessor() to realize
Message-ID: <aBD3kxdoAJCARbhz@zapote>
References: <20250429132200.605611-1-peter.maydell@linaro.org>
 <20250429132200.605611-3-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429132200.605611-3-peter.maydell@linaro.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5HVn52cK7FGD

On Tue, Apr 29, 2025 at 02:21:55PM +0100, Peter Maydell wrote:
> Currently the microblaze code calls gdb_register_coprocessor() in its
> initfn.  This works, but we would like to delay setting up GDB
> registers until realize.  All other target architectures only call
> gdb_register_coprocessor() in realize, after the call to
> cpu_exec_realizefn().
> 
> Move the microblaze gdb_register_coprocessor() use, bringing it
> in line with other targets.
>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>


> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/microblaze/cpu.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> index d92a43191bd..b8dae83ce0c 100644
> --- a/target/microblaze/cpu.c
> +++ b/target/microblaze/cpu.c
> @@ -252,6 +252,11 @@ static void mb_cpu_realizefn(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> +    gdb_register_coprocessor(cs, mb_cpu_gdb_read_stack_protect,
> +                             mb_cpu_gdb_write_stack_protect,
> +                             gdb_find_static_feature("microblaze-stack-protect.xml"),
> +                             0);
> +
>      qemu_init_vcpu(cs);
>  
>      version = cpu->cfg.version ? cpu->cfg.version : DEFAULT_CPU_VERSION;
> @@ -324,13 +329,6 @@ static void mb_cpu_realizefn(DeviceState *dev, Error **errp)
>  
>  static void mb_cpu_initfn(Object *obj)
>  {
> -    MicroBlazeCPU *cpu = MICROBLAZE_CPU(obj);
> -
> -    gdb_register_coprocessor(CPU(cpu), mb_cpu_gdb_read_stack_protect,
> -                             mb_cpu_gdb_write_stack_protect,
> -                             gdb_find_static_feature("microblaze-stack-protect.xml"),
> -                             0);
> -
>  #ifndef CONFIG_USER_ONLY
>      /* Inbound IRQ and FIR lines */
>      qdev_init_gpio_in(DEVICE(obj), microblaze_cpu_set_irq, 2);
> -- 
> 2.43.0
> 
