Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp3733646ejf;
        Wed, 10 Aug 2022 05:22:30 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7JnegBNmBfyFrFJ+YyK46HIva72+NQkoPvUJlCyw8GXNc+jeww6rxlEaQjs8fqfgWhk4Hc
X-Received: by 2002:a05:620a:2606:b0:6b9:a803:aecb with SMTP id z6-20020a05620a260600b006b9a803aecbmr1257444qko.656.1660134150780;
        Wed, 10 Aug 2022 05:22:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660134150; cv=none;
        d=google.com; s=arc-20160816;
        b=lagKCh4n8fPn2ZrSApbJho148sNLpKVSz/2KGhyrbowHPHDaVX6kjbFGPSZEdS0kcy
         4Y2F9QNNtGxfpKO2crzhwvcVeO2XpKIqg+zgqHWjg+XOM/C/JcZOwvF6s72jcab+idTt
         VprLUThW8cvIE8RJGxX7eGpgfY+Gdy+ZoaG/zIfPv+0uBs/5P1loqhMMGeFLMihM/krz
         e1nEJH3ug5IL25n/rpwf/dYxX86lABbCmMjzvTXj4sPDdxpV3+D38krU/9IhBDeqsYwG
         eolIGM60CBE7c0yyfRNWmdpMqD8PDyxvl2fs+ShMM3GoJIiG+78pD6J3nozwdA/sSes2
         CBXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=2Jipa5cCVLQr1pCuJwLIKcVPQhTtTjmjFqhQGp0LHLA=;
        b=n7b2K1nyv0wE1dkHplMT5+3OPuzNwva9hskK9ajTriFVlZyxj+r7MQ86kQ2qsULpnJ
         e2NGykbgdbN9Z0sbQlAZGbCPmKFuYIoASQkTD6OroTLdL4k1xqgZ3yH0VmXyfUZKTW2b
         XUGJt6CC6ciJ2UpgNek58+ncv4ZVGxcbW/BLQomRQpVEK5FKgdhvts3lQ8tbfnDm0Cx8
         BAndbRgO0wifh96Ilpdppa76g/2uKTtzTVAAw5dVBrEVOVfpA+fWUuy7dgmvX4h1oA5R
         7kqtMFc4hdWVf8JJO2mW/+oeEe5EroXxjAO4i/PM9ithjpsVmMdShBrP2cJcCvwTSBTZ
         Knxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="J8SUt/TI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m10-20020ac8688a000000b0031d3ea50dddsi8560798qtq.422.2022.08.10.05.22.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Aug 2022 05:22:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="J8SUt/TI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oLkjG-00056Q-9M
	for alex.bennee@linaro.org; Wed, 10 Aug 2022 08:22:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oLkgh-0002Sd-Ia
 for qemu-arm@nongnu.org; Wed, 10 Aug 2022 08:19:51 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:55976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oLkgf-00014X-1H
 for qemu-arm@nongnu.org; Wed, 10 Aug 2022 08:19:51 -0400
Received: by mail-wm1-x330.google.com with SMTP id b6so7697649wmq.5
 for <qemu-arm@nongnu.org>; Wed, 10 Aug 2022 05:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=2Jipa5cCVLQr1pCuJwLIKcVPQhTtTjmjFqhQGp0LHLA=;
 b=J8SUt/TIcIDwqF6kQXBizFPsBqrkCvyKaZok+fZwUpDbKmjO43mpwj8uEM461HnXwX
 cnFV+Oq7EfFEVVsdwL1UfbAaNkWvAbHdVXLuevaOBBPI3k0+Ken2ABcyfJSE8VcOnkYx
 1JaeYqozp8v8ASzuPFwy+LalBlPA5mx+RjvgZnl/HLDMkuxTvbwazxGWguMJRhtrLSsB
 0kcA58ihmPwQvHhcVN3YXZ1ho+ixcovgFabFhJmf0prdepDo8x3b5+dMM2W7GtkgqrkT
 chKXQqeMsycPjBw82zxK/34/j9WNsKik/bT7usUW+ldGQqRKAcv/KVIKUgdKbP+X80h1
 WIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=2Jipa5cCVLQr1pCuJwLIKcVPQhTtTjmjFqhQGp0LHLA=;
 b=XGlAIiFTwbOrclms3OPFnoa0U2Dha0sSrsp9XBsApEO/Ng66wG0nLMRcEDgAZeCEnH
 AXATleRfmNaxrKpZ7KRKzV5N8e7HXRjKeDAYGScZ7cGBYOj0keNVzTBGGH2TWLbrFJJI
 vspN8BU7Uj4BQ9gy2s2q1ct7Ti8wHjDsXApQ+2Por2jr0JBHQjbUoKPOQfgIYbFL6c+v
 h2DXwvawDpHsD1JQL69I71feEOzzUu78qhKtoIwi0CCjpJwRfRAd4efoJy2lGL6/rnuw
 ibnDQ4CKARBEGD9dW8GnX/hNp/RN6h09ofl1Eb7iQBN2yGpRrWm2hEiU+aW+8cpglHtY
 1HPA==
X-Gm-Message-State: ACgBeo2xAWVc+C58EUQ3Vef7zafds/KdYsqsBzx3GwxhGuT878+1GEP6
 4i3TNuVdZziYs+aObaxPrIrwWA==
X-Received: by 2002:a05:600c:350:b0:3a5:3473:1c23 with SMTP id
 u16-20020a05600c035000b003a534731c23mr2344563wmd.9.1660133984409; 
 Wed, 10 Aug 2022 05:19:44 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a1c4304000000b003a5a5069107sm2150830wma.24.2022.08.10.05.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 05:19:43 -0700 (PDT)
Date: Wed, 10 Aug 2022 14:19:42 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v4 1/6] device_tree: add qemu_fdt_setprop_strings() helper
Message-ID: <20220810121942.rlegpjuprzj3qsvd@kamzik>
References: <20220809185639.750345-1-qemu@ben.fluff.org>
 <20220809185639.750345-2-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220809185639.750345-2-qemu@ben.fluff.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 2A2GTVsBEJq5

On Tue, Aug 09, 2022 at 07:56:35PM +0100, Ben Dooks wrote:
> Add a helper to set a property from a set of strings
> to reduce the following code:
> 
>     static const char * const clint_compat[2] = {
>         "sifive,clint0", "riscv,clint0"
>     };
> 
>     qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
>         (char **)&clint_compat, ARRAY_SIZE(clint_compat));
> 
> Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
> ---
> v4:
>  - go back to the non-return call, no-one is using the result
> v3;
>  - fix return value for the call
>  - add better help text
> v2:
>  - fix node/path in comment
> ---
>  include/sysemu/device_tree.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index ef060a9759..d5c05b5ebb 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -87,6 +87,25 @@ int qemu_fdt_setprop_string(void *fdt, const char *node_path,
>  int qemu_fdt_setprop_string_array(void *fdt, const char *node_path,
>                                    const char *prop, char **array, int len);
>  
> +/**
> + * qemu_fdt_setprop_strings: set a property from a set of strings
> + *
> + * @fdt: pointer to the dt blob
> + * @path: node name
> + * @prop: property array
> + *
> + * This is a helper for the qemu_fdt_setprop_string_array() function
> + * which takes a va-arg set of strings instead of having to setup a
> + * single use string array.
> + */
> +#define qemu_fdt_setprop_strings(fdt, path, prop, ...)          \
> +    do {                                                        \
> +        static const char * const __strs[] = { __VA_ARGS__ };   \

           ^^ We don't want that static there. That'll keep the storage
	   for each invocation and require that __VA_ARGS__ are always
	   constants only.

	   I'd drop the const's too since __strs is only used for a
	   single call where it immediately gets the const's cast'ed
	   away.

> +        qemu_fdt_setprop_string_array(fdt, path, prop,          \
> +                (char **)&__strs, ARRAY_SIZE(__strs));          \

                   ^^ And then this can just be __strs

> +     } while(0)
> +
> +
>  int qemu_fdt_setprop_phandle(void *fdt, const char *node_path,
>                               const char *property,
>                               const char *target_node_path);
> -- 
> 2.35.1
> 
> 

Thanks,
drew
