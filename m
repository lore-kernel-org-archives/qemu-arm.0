Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp912328ejn;
        Thu, 20 Oct 2022 23:58:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7ibHCnDqCgCuAEofW8G1Th+jVAB63HDAE/uZ6Omz9/juEVxCecq34WdYBQW2E248cOOxDc
X-Received: by 2002:a05:620a:1471:b0:6ed:ea91:3cb6 with SMTP id j17-20020a05620a147100b006edea913cb6mr12651929qkl.758.1666335502975;
        Thu, 20 Oct 2022 23:58:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666335502; cv=none;
        d=google.com; s=arc-20160816;
        b=OPasLCCVJyWhmite+1I7V1arh9JghVHt9p+vR23Y00exEoG5ty+f+luMxt+qZJ7HL9
         TNvRv0IyhW/1PFz8MfVW2C4gsJZnlrx+uton05Uh9unMDGok95ezhKTeky7u6SgIk04d
         sKfLrejhSV0XrR+HCdhlDXUgAjdC/WN5tT8gSAHyS1SwAE4BXEDqzXDPVozDhE8bte+a
         bu6Phje1FXa3vBKwMxg0seqNOh0BPBR8zI8bk5ncglcm+a/qiZiEFtpEqF/l/TqUDpYB
         YBojWZmExBoohoaGQ9UYfk9gNo5VXN6TZcmYBcvbhk8OYOfY5hZzDjfS5Rt3Pd4iWeAX
         R6bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=n3M7VM54w6TTnxwW0xFBTdrPFLiI4kH4Y+jYA/IxDXM=;
        b=o1YIvrRWpC7jaMtybZvRmMrL+Ytv3rgCcBoEg7DqRXmRA1dE+8sD2nYA/eGc1lUyxk
         JyQYwQlyeiPhxKezGExCrhk3oaSiZnRzYxOohms1WvFUgZ107huytRDDk3tJkYR2hqzD
         sz/XfbaEXIM6NZZ1WMfn6srg/OGhSNp+3x5phcJVxAUCyURedVwWPDauw8ohn2senOD1
         KQOBFmQW25fnLz2ljxgYWFoaPok0WxR81ame5Emin13S2W3OhU6kjHSzzTbZoAVnaM+q
         y71jMqdNx4Z9fjor/HBodzHk2YUSMmzm7iXcEq5DIZoAYQutTNOHguNzm+zcFHPBxnW+
         9uWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=dEEJ+BQg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t29-20020a37ea1d000000b006e03a7bd338si11634751qkj.550.2022.10.20.23.58.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Oct 2022 23:58:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=dEEJ+BQg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ollz3-00080M-CC
	for alex.bennee@linaro.org; Fri, 21 Oct 2022 02:58:21 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ollxN-0004VZ-JH
	for alex.bennee@linaro.org; Fri, 21 Oct 2022 02:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1ollxA-0004BZ-1d
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 02:56:27 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1ollx8-0007I0-0J
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 02:56:23 -0400
Received: by mail-ed1-x535.google.com with SMTP id t16so2940193edd.2
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 23:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=n3M7VM54w6TTnxwW0xFBTdrPFLiI4kH4Y+jYA/IxDXM=;
 b=dEEJ+BQg7gCirRoBdxykOu1/wzG+hZrju7ZLm3y/BA2iVPPekd159s4g1ITvWidfAx
 Vs9GjXQ8DwCKVqgHHvBn7oL07xnnNiPwrYQm+Rijf7TIwXaNxgk5EbfItZ+54YcEEHbD
 Sj6XjxaN/+qwwIMx/Y5yXxIokt9MgqkJblqfTn3xQ9jD+2lThnj9AjaD73RwgxSPbqd5
 0d/6bQ1Pm/Y8BEWKZvDfKhg5WA7kys7b2P7CvZjKee2CwtBAdya57y8exPo4SlnWg0GL
 sQIMcoxDQ/3B3PExGwyf2PAbfJEK5+wCDzb4VdI7uJCLw67n1WSL5bLhxIHz6j4+YgmW
 iPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n3M7VM54w6TTnxwW0xFBTdrPFLiI4kH4Y+jYA/IxDXM=;
 b=UJ6sz3zpIGEgPyOWGbUviq5DNqetoGM5e8RnIbhgZ4J3FtEtUUQo/Pm3Y3evZDx+KM
 PzlQdX74ppR6PyWv86FrtFSmeIJuWP5dy/CKcDxln41WnPNho5lo2dlxYTWxDLWnCmvp
 kPRHrsNmjJw41KEHzHM0bvRjX3ThKqTBPSWnfRB9tqz4Zw5l0awuNcd7I0Vyni9r71rz
 SYVBLDTE27Tafh7wXzAlCNc5S83FMR5XsG/tLky2v32A7z4uK3O05w1/JjSXcOIiqJwt
 NceHPI9f1EkcA7zuJgurMUxnsrpiIJW6jJB5FJ9dlwnxGAZooygXJQ0LXzSXhtgFNyCD
 IH2A==
X-Gm-Message-State: ACrzQf04sp9Fnd7dYvC9nw+gUgzZwG1223g9+9QdDDU3o7VEkrcShHaD
 irAo0nuuxAB6I4fo/6qPmbh6Kg==
X-Received: by 2002:a05:6402:5cb:b0:452:e416:2bc4 with SMTP id
 n11-20020a05640205cb00b00452e4162bc4mr15559962edx.114.1666335379926; 
 Thu, 20 Oct 2022 23:56:19 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
 by smtp.gmail.com with ESMTPSA id
 lb5-20020a170907784500b0071cbc7487e1sm11308368ejc.69.2022.10.20.23.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 23:56:19 -0700 (PDT)
Date: Fri, 21 Oct 2022 08:56:18 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, alistair@alistair23.me,
 peter.maydell@linaro.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH v5 1/6] device_tree: add qemu_fdt_setprop_strings() helper
Message-ID: <20221021065618.hdu7elwg4tnj3vuj@kamzik>
References: <20221021055808.342055-1-qemu@ben.fluff.org>
 <20221021055808.342055-2-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221021055808.342055-2-qemu@ben.fluff.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pm6jAY327N7u

On Fri, Oct 21, 2022 at 06:58:03AM +0100, Ben Dooks wrote:
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
> index e7c5441f56..cb49df471b 100644
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
> +        qemu_fdt_setprop_string_array(fdt, path, prop,          \
> +                (char **)&__strs, ARRAY_SIZE(__strs));          \
> +     } while(0)
> +
> +

I made several comments on v4 of this that aren't addressed.

>  int qemu_fdt_setprop_phandle(void *fdt, const char *node_path,
>                               const char *property,
>                               const char *target_node_path);
> -- 
> 2.35.1
> 
> 
