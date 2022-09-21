Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp2183300ejy;
        Tue, 20 Sep 2022 20:49:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM65IRHWEdp4oyabuhr3lGZpdH8GFyxru4EsGHmZ9HOYd8g7J5L5OD5iVir1tK4NdxkqFwfR
X-Received: by 2002:a05:6214:da7:b0:4aa:a2ea:2483 with SMTP id h7-20020a0562140da700b004aaa2ea2483mr21576494qvh.8.1663732157489;
        Tue, 20 Sep 2022 20:49:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663732157; cv=none;
        d=google.com; s=arc-20160816;
        b=e2AHhyC1QNg8+VCX+jB+Y6LCH5isxMBmpygFKClvGT/I+pi8QHtapU26rRxUHUg57i
         yahok9TYhpf5hSzd6QhPfG4FLbf/gqsZOzPGzZDfM491QBbsG8QhX4qbdaqRSLVehs3j
         BIhFcpR3zmbuqhBjOfWAii1lFinlYpHJOi4I+7md0HU+txT4m7MfNSLRoqQwD6YykkpM
         tG9isIK8xjxMwx/bc0rJXB/3wtujn/iRxenZmPgj6wMbaVCj5GDZ8r7KO3kVaVFyVBb6
         52nW6aA5nzVIybgMbmLs6Lc/4+VAf+5GTge/VHFbq3zGNALCPEHUYn9RXsXa2//yM59J
         9nTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:date:from:dkim-signature;
        bh=jnHuIl8/YV0NnqiWIQrPxHg951D+z8Vy+MbuOzpTNEc=;
        b=UQaosRUFewZ7TzMVkYGtab0K0C6rlCrX7Sp9GJd//W1ZlKRrV4t0+afcVas1zC/uRx
         q8azsDnrcd6E0v+ZwmCv+/Og27c1uSisC1bxkoBaMAM1eJcLQu8CvAVi7ReJov9SKdaI
         kc4fd6GHs/fBkkOxs30xlUcrsO0AzLMV+MR6HWoBYOlb/KGC58i6cd8bZ6wVxezQf799
         dg+tYOovKakM8DYzbliLwOG1QhNR/8SEGSYJ09xLgXSikF9C13ZNWGY68/CImKpf6/tJ
         komwyZRRdLLuEkd5QLJ8HCyeeeUBSs22VCiaRghubEcY/gUq5K4Oeu5lkvyBMrCKICkB
         BF9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@anisinha-ca.20210112.gappssmtp.com header.s=20210112 header.b=N4xM4tt4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1-20020a0562140d6100b004972c488b2dsi902871qvs.529.2022.09.20.20.49.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Sep 2022 20:49:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@anisinha-ca.20210112.gappssmtp.com header.s=20210112 header.b=N4xM4tt4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oaqjc-0000E6-K4
	for alex.bennee@linaro.org; Tue, 20 Sep 2022 23:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oaqjB-0000Dv-Qe
 for qemu-arm@nongnu.org; Tue, 20 Sep 2022 23:48:49 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:42625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oaqjA-00056C-AE
 for qemu-arm@nongnu.org; Tue, 20 Sep 2022 23:48:49 -0400
Received: by mail-pf1-x434.google.com with SMTP id b23so4633755pfp.9
 for <qemu-arm@nongnu.org>; Tue, 20 Sep 2022 20:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:from:to:cc:subject:date;
 bh=jnHuIl8/YV0NnqiWIQrPxHg951D+z8Vy+MbuOzpTNEc=;
 b=N4xM4tt47EtW72g5kbFQwUmkiwuUIw0WxEj8ZOhv5vCA6rJ9nsW/J20iv4rWLA26JN
 7VaxLRwWv81/OXlLuSXzr39yuFUnL/cnsdycflEpXsi3W3994NFyg94Xam5qnqVRYi9o
 +i57vrDBYOxOu70YYFO/KxpxJeFroKbqLEAJfqxKJhWe59qMUhavlyN7nGmp+V8R43HB
 P1pQmbVUK7UzAZbD4ZA6rrR9gKYsyPF/YhuD4FUyOx8CYhVwNL6Am/yXzYrAQvs8GiB6
 FKQACrq0wJv184DXZI3RLpfTpkpwtuPqEZW4rxWzowAmAQIjtpwJsL4g7vS3Xe462QVK
 esDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=jnHuIl8/YV0NnqiWIQrPxHg951D+z8Vy+MbuOzpTNEc=;
 b=SAOzKRMiQdnqTg1DNylkHFoy3U9FmbNyPzj9gp7xVqBlNi2mGN4fVhK1USon7FdkDe
 ksRkA/Xo5ykUmsImyoB7M9xtjlt1jz1lmbqlW+OPtKWHDXPNZDH+54UM+n+aJvUoivRc
 4ojZW4YyoB5HpNZyb1eits3BEQLUjiG2BActgTWnR0isa/5yE+RpqWki3V+rh7zrkzCn
 msipNnCVIm7BcNTgki7PxjRvMBRgj03Z2Kdj2jYvjLyPgWdeN+Osr86wZmeZRWAjXbpf
 vR8Wk74slzxL/OrJ8Dl0HEPv455CyO+DRlbwn0qn0O/9nthNowWe4/BAXlTOewD5BJs/
 k15w==
X-Gm-Message-State: ACrzQf0JWDPgWhZZJcZsaT6fJ6+J7leJkLGeKGlB0eIgQ729W1JAehHt
 qPizpd/BClyinHfZjk7CLZBcRg==
X-Received: by 2002:a05:6a00:1a0e:b0:547:1cf9:40e8 with SMTP id
 g14-20020a056a001a0e00b005471cf940e8mr26901648pfv.82.1663732126572; 
 Tue, 20 Sep 2022 20:48:46 -0700 (PDT)
Received: from anisinha-lenovo ([203.163.244.51])
 by smtp.googlemail.com with ESMTPSA id
 13-20020a17090a0ccd00b001fabcd994c1sm748286pjt.9.2022.09.20.20.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 20:48:46 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Wed, 21 Sep 2022 09:18:40 +0530 (IST)
To: Miguel Luis <miguel.luis@oracle.com>
cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com, 
 imammedo@redhat.com, ani@anisinha.ca, shannon.zhaosl@gmail.com, 
 peter.maydell@linaro.org
Subject: Re: [PATCH 2/3] acpi: arm/virt: build_gtdt: fix invalid 64-bit
 physical addresses
In-Reply-To: <20220920162137.75239-3-miguel.luis@oracle.com>
Message-ID: <975ce98f-265-1db5-4bb1-2d1ec3113ca@anisinha.ca>
References: <20220920162137.75239-1-miguel.luis@oracle.com>
 <20220920162137.75239-3-miguel.luis@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::434;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x434.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-TUID: 1BSjaFNjRkG/



On Tue, 20 Sep 2022, Miguel Luis wrote:

> Per the ACPI 6.5 specification, on the GTDT Table Structure, the Counter Control
> Block Address and Counter Read Block Address fields of the GTDT table should be
> set to 0xFFFFFFFFFFFFFFFF if not provided, rather than 0x0.
>
> Fixes: 41041e57085 ("acpi: arm/virt: build_gtdt: use acpi_table_begin()/acpi_table_end() instead of build_header()")
>
> Signed-off-by: Miguel Luis <miguel.luis@oracle.com>

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  hw/arm/virt-acpi-build.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 9b3aee01bf..13c6e3e468 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -592,8 +592,7 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      acpi_table_begin(&table, table_data);
>
>      /* CntControlBase Physical Address */
> -    /* FIXME: invalid value, should be 0xFFFFFFFFFFFFFFFF if not impl. ? */
> -    build_append_int_noprefix(table_data, 0, 8);
> +    build_append_int_noprefix(table_data, 0xFFFFFFFFFFFFFFFF, 8);
>      build_append_int_noprefix(table_data, 0, 4); /* Reserved */
>      /*
>       * FIXME: clarify comment:
> @@ -618,7 +617,7 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      /* Non-Secure EL2 timer Flags */
>      build_append_int_noprefix(table_data, irqflags, 4);
>      /* CntReadBase Physical address */
> -    build_append_int_noprefix(table_data, 0, 8);
> +    build_append_int_noprefix(table_data, 0xFFFFFFFFFFFFFFFF, 8);
>      /* Platform Timer Count */
>      build_append_int_noprefix(table_data, 0, 4);
>      /* Platform Timer Offset */
> --
> 2.36.0
>
>
