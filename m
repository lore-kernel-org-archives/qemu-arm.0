Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB08DEDA685
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 15:12:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxRNX-0004N1-VW; Tue, 03 Mar 2026 10:09:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxRN6-0004A1-DL
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 10:09:18 -0500
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxRN2-0003px-ML
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 10:09:15 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-798374d0f44so89589657b3.0
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 07:09:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772550551; cv=none;
 d=google.com; s=arc-20240605;
 b=XA4B33emCEEtEdn73FgpikiO2BULNqYZ81E4Jb7zCbk6aNiEjrokXLQH+vZwZsJJmI
 kxA7fGlIf3UkoejUR6ir4BsUJKKRipdkx6qmKjqOkPFGCHmY44jKRkz7pRdRk9ojTGqh
 7SvrNMPBkkOmy0tKV9jClanyYR8v0teM5T6dO1DHbFtG3PY4kpgWR5bqje23dVMvoGfk
 RvF6IgHOrBtCUdTO1yjbIKO1E/hqUkq/Q0sOJBiAxR7oLn171nLxil6Y9cHTRK5veU2Z
 wY3XMpx4BnVgLcS+R197Q3XcOljxstJ3Qt65NR7YehaEPWY+nF1Z/wdMVBBjlRlm2Ah+
 DKGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=EVsl4KNaXtWkiKOuqqaGL0YvyFVVA2j+IlJDQ709Ows=;
 fh=PW2FViwq9ttFdbfp/8I6VDYlSXN5V9IxHZNyGNlICQE=;
 b=XvfubVV6R0RyoTIL9VsKzE09ah1tI7/wCC8l373JFEFLN2BI2SKFdiGhHaBNqfh3Ah
 43YXEN4fwrstL3POK3kKI/jSAxoud2vQfQ3Ao2UlSHJPgBEY8+VxAYhVbSTJx3TNEhE0
 /Y9RYq0oszBLplOv74s2o5JlOVNVSSHao1vEF31DKSjEEn7Ocm4cnevPHyEIyTeeEflX
 UwSP70uIZunpIjVDdOwpcd92uLLqnAt+RvmRgekpRMjvKgNH0RAe2n3VaBud/fvzNzn5
 wQE7dFE6ECeIqUsaa8SWWUq08waSS8OQnWCz8bwIgIGGSsmtu8MBbq2OE3P0Lvq1iSaG
 BYVA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772550551; x=1773155351; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EVsl4KNaXtWkiKOuqqaGL0YvyFVVA2j+IlJDQ709Ows=;
 b=tuhbx1gsBAv7gHvAwRQdlu5b/e02tODwDolsacE7Zpwu7znEO2rXMpLjN0v/CfyAnl
 5HAuYIT+i/G+7XingOJDYtit1LUNsSXM28sPbMVUlXkYTrtP3Ok2idQwcsyJuWKEYuon
 M72KxemxNk6ddXDKQh2nwXQAzfTeCmkB7V55LsE5UffocZTjjzxWk2VZ/Pn2ZSxuADnj
 N+o0bhKvpA2x2CV7bZxwxNTeFa/pII+ytMPg05zq69YE2rqhNPlQkgCcQMrjaVOtVj+o
 /t5YSGKUbYyNnq1wL2DBuU85MNHC5AqdV5avgJuHLhKhs3LB/K7pjll0OvJ3aXobytg+
 SdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772550551; x=1773155351;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EVsl4KNaXtWkiKOuqqaGL0YvyFVVA2j+IlJDQ709Ows=;
 b=CzknEF/uoawPeSIG4u+HqmZo67biSv0wLZ3gicd0JgMJ0OSe4EaN1qg2vGRZBi9UKc
 MoNjqn7DQ6CUCjqt3lEEBQldg5txT8MTBcuWY/0TeNGQ9VUxIIo20eU+kCu5O8LnOMnA
 UTvkNMMRBCucbbJHCb0cRX+P7Prd497Y4GhRZfkbqv2YRVrFw1whLX86WYaL3GQQ8iPj
 ZSFZby7bQnSRTJkCaXrmApLYnkZZ/NFaT1GNRt0UgvDQZI2luRIAP+e7Tr5UqgEOpe3b
 zBk80MEC9vtTND+xEFmRnC05zLorvq1SNHLQ9tdaVRx9DFoqnIEJUMf+YCIdyWHU0kjr
 /Hsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUkqjUooA5I9BbWl318DykSJlmEV1pySA4KKGadbllzSTGnIhUFLdBVOvDb36RFTcd2j2j8LApjw==@nongnu.org
X-Gm-Message-State: AOJu0YyUN1UlE6qvrObtvjYKRcoOCQFNP8M4APAWYc7JSGGyqlpj+uFl
 kAr4QzR5vwXWIxSbL9P+llEcxhB3WCezxFBhj8R6e0Geto/VgbHd1wsJRZoKHJ7p3AMuNlT4x5u
 cnCBsCJf7OrK9//TdhKsYHewL/phZYTY4KMT0QizSYA==
X-Gm-Gg: ATEYQzzyHVktJcTeRvH9Egr5W4piIJWFlP+F/r5uK8UYqvHuHKfdMVFZEF5WJVJ9Bec
 YTgqz0QSFkCYR3GXiAyckgNxK/yJA4ffWDefNuItXyXTc61I/QPIGr5ocQPYY7xCJLugmYWnkgc
 tOtKEfj26TtJKoZZBrBYLt0sDOQLef1qZxxSR1scx1HXJ69I/G4wBnl+eVkzaHm7fU+H5NuX3hE
 m38ow7kkREsRvrR2tgpg4YinOcgq3rjsdYZhWpGU9IfmEc1OxFjaRUtNjT0aULhlSPUsz3nJ1mL
 B75kk4+inmo8jrJafDL/Y/J3ol8T8Waw7Xfduu0IJyx1h1YmLNLK5j3nQWGh3L/T9fI=
X-Received: by 2002:a05:690e:1383:b0:64c:9c1c:5f6e with SMTP id
 956f58d0204a3-64cedb4a00fmr1920478d50.5.1772550551233; Tue, 03 Mar 2026
 07:09:11 -0800 (PST)
MIME-Version: 1.0
References: <20260303143928.1747116-1-eric.auger@redhat.com>
 <20260303143928.1747116-3-eric.auger@redhat.com>
In-Reply-To: <20260303143928.1747116-3-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Mar 2026 15:08:59 +0000
X-Gm-Features: AaiRm509veks7jfVF4zfG7cRsBuRkgXkq4k39mF1vLk9aEJBBXtjiziT_3Hbcgk
Message-ID: <CAFEAcA9i3PmcX8xLEPd+254Ry7ojPKetDGzYtSNp46WZqSNP7g@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] target/arm/machine: Use VMSTATE_VARRAY_INT32_ALLOC
 for cpreg arrays
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 cohuck@redhat.com, sebott@redhat.com, peterx@redhat.com, philmd@linaro.org, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 3 Mar 2026 at 14:39, Eric Auger <eric.auger@redhat.com> wrote:
>
> This removes the need for explicitly allocating cpreg_vmstate arrays.
> On post save we simply point to cpreg arrays and set the length
> accordingly.
>
> Remove VMSTATE_VARRAY_INT32 for cpreg_vmstate_array_len as now
> the array is dynamically allocated.
>
> Also add a trace point on post_load to trace potential mismatch
> between the number of incoming cpregs versus current ones.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>
> ---
>
> v1 -> v2:
> - also modifies the allocation of cpureg_vmstate_* in
>   target/arm/whpx/whpx-all.c
> - added Peter's suggested comment on cpu_pre_save()
> - free the the vmstate arrays on post_load
> - add assert on pre_load
> - fix comment aboy length check in machine.c



> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index bbaae344492..aa617dd64db 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -1,5 +1,6 @@
>  #include "qemu/osdep.h"
>  #include "cpu.h"
> +#include "trace.h"
>  #include "qemu/error-report.h"
>  #include "system/kvm.h"
>  #include "system/tcg.h"
> @@ -984,11 +985,14 @@ static int cpu_pre_save(void *opaque)
>          }
>      }
>
> +    /*
> +     * On outbound migration, send the data in our cpreg_{values,indexes}
> +     * arrays. The migration code will not allocate anything, but just
> +     * reads the data pointed to by the VMSTATE_VARRAY_INT32_ALLOC() fields.
> +     */
> +    cpu->cpreg_vmstate_indexes = cpu->cpreg_indexes;
> +    cpu->cpreg_vmstate_values = cpu->cpreg_values;
>      cpu->cpreg_vmstate_array_len = cpu->cpreg_array_len;
> -    memcpy(cpu->cpreg_vmstate_indexes, cpu->cpreg_indexes,
> -           cpu->cpreg_array_len * sizeof(uint64_t));
> -    memcpy(cpu->cpreg_vmstate_values, cpu->cpreg_values,
> -           cpu->cpreg_array_len * sizeof(uint64_t));
>
>      return 0;
>  }
> @@ -1034,6 +1038,9 @@ static int cpu_pre_load(void *opaque)
>          pmu_op_start(env);
>      }
>
> +    g_assert(!cpu->cpreg_vmstate_indexes);
> +    g_assert(!cpu->cpreg_vmstate_values);
> +
>      return 0;
>  }

You missed clearing the pointers in post_save -- I think these
asserts will fire if you do a vmsave and then follow it with
a vmload in the same VM.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

