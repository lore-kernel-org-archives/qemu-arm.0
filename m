Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1671648lfq;
        Thu, 8 Oct 2020 13:40:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyh4dTLtdJN+WBCWqlQDNuZ4XbcvKQMPVzH/f1yz3wu25YopQWNVLY/9hagaTt1Ma+gZAHL
X-Received: by 2002:a25:2ac8:: with SMTP id q191mr13573664ybq.306.1602189639946;
        Thu, 08 Oct 2020 13:40:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602189639; cv=none;
        d=google.com; s=arc-20160816;
        b=UHLPB0CvmBg6paAhRobkUb8Y4fvv1TisqXh5qJqPzPgdS5MiHCrwM6hSg4HA1+XbXi
         L9vfV/bv5n9so0rMCXQ59ZHRtPdXWoP8muoVHclWZc2wklD3sYen37EhBPwycQ+nksem
         fkXziz7B9KNN9oQZ9ku5ximnDU6XImB+Z82P5zRSuIVucJ1wmyUiqfxeTJ27xW6yzK5H
         pc9ZPDSycYcFB/wi4AWdYXy70Va+VOo0jZ1bxZ1hsTX/pXtA4iocjYQwfRDgeeQaOO1J
         pdeH6uBDsDHwaod01Q7H6tWJQpv8cWhsiSyqsbDLv1R/LiYzohOm9X9BBRKzJDMw8hMm
         +lig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G3fapPkb6Gmr4cexZnT4DAT69IL+SilREqXWZZPjQy0=;
        b=YCsyjCygQOrTOSc3O3p7ZTbZYl8GpDJZytDr9yhdFcPwfO3E349//Nr5upFxiU6mxH
         zaQLUHWlusLj9DjMecHdo6b4+vIf4TSqUuNKvab+OMaQrq85vOka11Mo1O55Xp+K+0Ul
         d7YZ0BiDmG31KKgDBi9YmuDBX5x6sDbrubyBrVMGHoq2MqSEUWvumKWhPJPvUN7jFY3O
         NWKU6xqaFGFD3SN6TJ3gXNFTUPT986D67xXpzzjtk7ibQgwrbjRHTpNGipFgVl5IwX/i
         qu5wr3oZAtlF8ubLKC7L0HBjrazVJBWYs9054lef31wUR7xYwhCY64icvyOObyiUywh5
         CuBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QyfskRwS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n62si6194255ybc.198.2020.10.08.13.40.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Oct 2020 13:40:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QyfskRwS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQciN-0000hm-8i
	for alex.bennee@linaro.org; Thu, 08 Oct 2020 16:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQchx-0000gv-Na
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 16:40:13 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:45129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQchw-0007mX-7F
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 16:40:13 -0400
Received: by mail-ed1-x541.google.com with SMTP id dg9so4831323edb.12
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2020 13:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G3fapPkb6Gmr4cexZnT4DAT69IL+SilREqXWZZPjQy0=;
 b=QyfskRwSuuk+mHKReYYO/+YCD2hYYHD5BykYaqS4eH5G86jo8yCGbTJ1G6Hrd8NQdV
 w+RvkOWKP/UEmC3bMVn2aR1k95+avyRLjMEucl1wqIyHsPHLt63BFxxUSPLp77k0FA50
 jyWPqkqK7u4ova6JncZCS1u1eRMD/m+/5X84cj4fr74OnyhYuUS0di2pzH7PT7BrI8Np
 NBpuXx0vWy78hfJjkgzuhs/ix+3t+pY4QgYHlbwrlWDuJ4W8J7XSpobavzmAFngYM9/+
 5JUJqgNh4oSf1/CTW7Lol/SsFtV1eLPeWpxPgKRroYRI0TchO0DLOxwGP23lTWZZ3Bte
 YEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G3fapPkb6Gmr4cexZnT4DAT69IL+SilREqXWZZPjQy0=;
 b=E1W6m9XvDFEPk5yX8MAfA8iTOAagoBDVl4ueDT9qu3mr2eg/lUNTP8FUj6yJV6pgcY
 RMbwEB+edzl8sC4ABGyIZH82p8yyMp4WNk5Pumz3yCqxGecaK1Y97O67CoouhlpEcWYX
 v9741iS5iGSoZsBTB/WKCaeimDcHrY5zAsA8IsfFo9pzklf5wpxnFUUSmTJUw3y39x+6
 oCsp95SzZw2EgWXTO+2ohtsiqK0BKz4lMeE1fO32iSal3iPwWHsNfvJXPrzkAutLVXi1
 On1P6lQSt/TDurka3Wg4+EjJornqsGkkLFJtONh4Wy/0gA1QPLr8aa+pg47tMH257CFB
 VxVw==
X-Gm-Message-State: AOAM533P387JJrmbMkKw/J7bEAFuelWq2APebP74s1VBxwLHUQotwu0G
 pg4ztNSRPeOtUJwXVsD6yHwW+ECuQz4qElpLhBOczA==
X-Received: by 2002:a50:9ea6:: with SMTP id a35mr11512471edf.52.1602189610373; 
 Thu, 08 Oct 2020 13:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <20201001061718.101915-1-drjones@redhat.com>
 <20201001061718.101915-7-drjones@redhat.com>
In-Reply-To: <20201001061718.101915-7-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Oct 2020 21:39:59 +0100
Message-ID: <CAFEAcA-ZwwzrjPjsaGJbwW-y0g+j-usk25f1hiFVadaS74Nv+w@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] hw/arm/virt: Implement kvm-steal-time
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fAJCkYmyWeis

On Thu, 1 Oct 2020 at 07:17, Andrew Jones <drjones@redhat.com> wrote:
>
> We add the kvm-steal-time CPU property and implement it for machvirt.
> A tiny bit of refactoring was also done to allow pmu and pvtime to
> use the same vcpu device helper functions.

> +            if (pvtime_size > pvtime_reg_size) {
> +                error_report("pvtime requires a %ld byte memory region for "
> +                             "%d CPUs, but only %ld has been reserved",
> +                             pvtime_size, max_cpus, pvtime_reg_size);
> +                exit(1);
> +            }

This turns out not to compile on Windows:

../../hw/arm/virt.c:1693:30: error: format '%ld' expects argument of
type 'long int', but argument 2 has type 'hwaddr {aka long long
unsigned int}' [-Werror=format=]
                 error_report("pvtime requires a %ld byte memory region for "
                              ^

I'm going to squash this fix into the pullreq:

--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1690,8 +1690,9 @@ static void virt_cpu_post_init(VirtMachineState
*vms, int max_cpus,
             pvtime_size = REAL_HOST_PAGE_ALIGN(pvtime_size);

             if (pvtime_size > pvtime_reg_size) {
-                error_report("pvtime requires a %ld byte memory region for "
-                             "%d CPUs, but only %ld has been reserved",
+                error_report("pvtime requires a %" HWADDR_PRId
+                             " byte memory region for %d CPUs,"
+                             " but only %" HWADDR_PRId " has been reserved",
                              pvtime_size, max_cpus, pvtime_reg_size);
                 exit(1);
             }

thanks
-- PMM
