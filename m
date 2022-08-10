Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp3737243ejf;
        Wed, 10 Aug 2022 05:29:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR57fkP+VAItx1d4Gyr6GNrNtOINyuhWZi9av0UrfgzKTfuBx1ygR8yn2Xu7jLsSP5FwV4mk
X-Received: by 2002:a37:8606:0:b0:6b8:e6d7:af09 with SMTP id i6-20020a378606000000b006b8e6d7af09mr21370917qkd.416.1660134571158;
        Wed, 10 Aug 2022 05:29:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660134571; cv=none;
        d=google.com; s=arc-20160816;
        b=fhGTi3kW+/foAjohwBmgB8fH14w7q2YmrSKHSl7/Ij7YDQrzeGCz1hkla23ls+coLr
         oAsDp9P8QL2i7NHfFtQbf5PXQ+bnFl77IT+tekYLPAVp74O19EQzGOCmVmma2/HYqesO
         UZtjXYj5MOWII1eyX18EigxCil/pQLzmEZBldsAMxPH20794JyUexvmq+35szAUuaFSB
         M19KTpesMHyRCZ+3J+qygPO+u0ZN8FWkIGAUwCMIqTAa3ADQPCOWmZc2kYcj2B9nIH7R
         eyaZ0x92T9noAU9GsI3hv0w1u4+nrU4syMjSvP3Jf0MPRaHfyUkGPugYIUJfXyXwTBLZ
         Vx7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=t8nZ21QBoIE3muUsD8yEsXo6tW6EUTtAFupwkvuEGSA=;
        b=PHTGUiAyuoGIzzebHZmZedZNfUsPY+VXPr5Vz5bfHxVQlJsCxzLIwmC/5D0/XiXUOR
         q/wZoDTQyffk1ztbJaiYHwj+SQVrmTHqBP1NsPo2FmV1DaE9xQfgY5mDnvtYLQjBS8WU
         B4MnDLuIQw3ktcPghgdQThzLcYz9jynKqzur9h94MCGaLgDtqcQ74AuScqevxjm9Kp4l
         Y11x7qT8xnQjjgvU2dNZG5AOBaoPlfChkncI54bwHqOPGC8J40pRmot5cO1fKhmMtbg4
         jlayf1i33uJD4FAPpu7XFh/Rzddg30IV0UjZ3svxs1avKexNRVG/1NcULlUJ42/9obXL
         GpBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="e6WO8r8/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 13-20020a0562140d6d00b004738f54a56fsi10260960qvs.335.2022.08.10.05.29.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Aug 2022 05:29:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="e6WO8r8/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oLkq2-00041k-Lp
	for alex.bennee@linaro.org; Wed, 10 Aug 2022 08:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oLkou-0002Hg-Ne
 for qemu-arm@nongnu.org; Wed, 10 Aug 2022 08:28:20 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oLkos-0002lp-2l
 for qemu-arm@nongnu.org; Wed, 10 Aug 2022 08:28:20 -0400
Received: by mail-wr1-x42d.google.com with SMTP id n4so15801538wrp.10
 for <qemu-arm@nongnu.org>; Wed, 10 Aug 2022 05:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=t8nZ21QBoIE3muUsD8yEsXo6tW6EUTtAFupwkvuEGSA=;
 b=e6WO8r8/Hf1Q8zlWjiN0wvxkw4t13pwYBjmAHW45HdRwQQBGeV+stlw6shMdbYJkco
 O72Va7RIXq0RY9CmG0hLLXeoB/2VPnWa8jOG8h6mWNdX3TlD744xtNq3f5lQRcqH+uzt
 x8GVoo/VYCF7kgViwnygdbDovzEZtmNh0nHaiCGy46fl/IKOaLBAHVL+iUSSyjSaSyAJ
 5uSVfZ+4Hjny9eCsbmIUFvhcNJ7EhhwAVUwwIgD3KCaR6s6Kyps8s6NDkVrYgrCSiCTo
 l8HBrenSxmO1+0swLXFIH5DU8rgqub8xP/kmnbwC9IzEQY0zIxNrlrAWhummVmxqcD8W
 V++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=t8nZ21QBoIE3muUsD8yEsXo6tW6EUTtAFupwkvuEGSA=;
 b=hoL0/3hJchImYBZ5DGaD0kcaZbMBDUjx8wXLRqgPwRbtMUvzeE/EDnbv+r2a3Li8Mc
 NaAZCPUta29Ji7eeKFLCSPHmotGFA2tKAiorvFVI2k6NZWgi2zZwcf2UUj1qRbx2EQFI
 uoRNyrwH3W6mMuruAZsFRdwDtP4jme1hyW4eJI5tV3Obh+sd9qxpvoik05gwxJZiJJ/U
 PqfH/JDDU3p8J+BzZqaMf+EAqNthXHQYHp6kehkILCCICkmg09bKFyRiNHyzI42PJ7Nd
 wUe6mxUh67DfYk3JNCP0DrnRAztF59gEWKC6DtSlPQsKn8uD1frkIFaHX3rBFyfllWkj
 eHsw==
X-Gm-Message-State: ACgBeo2/Pmgx4JPi/izPokz6ro0gHsuRyY9HAURS7Jlk+N1JNxmePwHM
 A/dIZDNRMIIMPfGUmsq4iADI0g==
X-Received: by 2002:a5d:64a4:0:b0:220:b43e:d600 with SMTP id
 m4-20020a5d64a4000000b00220b43ed600mr16903522wrp.27.1660134496474; 
 Wed, 10 Aug 2022 05:28:16 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 c10-20020adffb4a000000b0021f1ec8776fsm15829553wrs.61.2022.08.10.05.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 05:28:15 -0700 (PDT)
Date: Wed, 10 Aug 2022 14:28:14 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v4 2/6] hw/core: don't check return on
 qemu_fdt_setprop_string_array()
Message-ID: <20220810122814.yg6rz7jnr7mqxatx@kamzik>
References: <20220809185639.750345-1-qemu@ben.fluff.org>
 <20220809185639.750345-3-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220809185639.750345-3-qemu@ben.fluff.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z7zgHpHeX7KL

On Tue, Aug 09, 2022 at 07:56:36PM +0100, Ben Dooks wrote:
> The qemu_fdt_setprop_string_array() does not return error codes and
> will call exit() if any of the fdt calls fails (and should print an
> error with the node being altered). This is done to prepare for the
> change for qemu_fdt_setprop_strings() helper which does not return
> any error codes (hw/core/guest-loader.c is the only place where an
> return is checked).
> 
> Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
> ---
>  hw/core/guest-loader.c | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/core/guest-loader.c b/hw/core/guest-loader.c
> index 391c875a29..c61ebc4144 100644
> --- a/hw/core/guest-loader.c
> +++ b/hw/core/guest-loader.c
> @@ -57,25 +57,17 @@ static void loader_insert_platform_data(GuestLoaderState *s, int size,
>  
>      if (s->kernel) {
>          const char *compat[2] = { "multiboot,module", "multiboot,kernel" };
> -        if (qemu_fdt_setprop_string_array(fdt, node, "compatible",
> -                                          (char **) &compat,
> -                                          ARRAY_SIZE(compat)) < 0) {
> -            error_setg(errp, "couldn't set %s/compatible", node);
> -            return;
> -        }
> +        qemu_fdt_setprop_string_array(fdt, node, "compatible",
> +                                      (char **) &compat,
> +                                      ARRAY_SIZE(compat));
>          if (s->args) {
> -            if (qemu_fdt_setprop_string(fdt, node, "bootargs", s->args) < 0) {
> -                error_setg(errp, "couldn't set %s/bootargs", node);
> -            }
> +            qemu_fdt_setprop_string(fdt, node, "bootargs", s->args);
>          }
>      } else if (s->initrd) {
>          const char *compat[2] = { "multiboot,module", "multiboot,ramdisk" };
> -        if (qemu_fdt_setprop_string_array(fdt, node, "compatible",
> -                                          (char **) &compat,
> -                                          ARRAY_SIZE(compat)) < 0) {
> -            error_setg(errp, "couldn't set %s/compatible", node);
> -            return;
> -        }
> +        qemu_fdt_setprop_string_array(fdt, node, "compatible",
> +                                      (char **) &compat,
> +                                      ARRAY_SIZE(compat));
>      }
>  }
>  
> -- 
> 2.35.1
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
