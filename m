Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp1942197ejc;
        Wed, 27 Sep 2023 08:50:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDiiMDscIfmH4lZBCINJhySjdwmeURsRjORvWvH/oH9BD33mJ5E4xS8+kAUk2TT+4HS6jG
X-Received: by 2002:a05:620a:2448:b0:774:3235:4e6d with SMTP id h8-20020a05620a244800b0077432354e6dmr2507246qkn.21.1695829815166;
        Wed, 27 Sep 2023 08:50:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695829815; cv=none;
        d=google.com; s=arc-20160816;
        b=ihceJsuJsN0irXxT+EZ91yQIhw+rJ7YUmxupciikb19SfjDPIOH9ty7G9c8MXRoUPe
         /0Ji2MfGXedQetF7hkQzEtSQ2qvYUYsvyH6Buczk0aC8FS6eBC8FGlsTY0xXllBjjwEP
         JIRRZBhrWrF05rBya1ZY+jEgJkQT7ybIWrEhIgskOh0/iECeOLoY21e3iGRJlj+YIWO5
         v698lfSF96UBD/NhDDehqp3xxgW4dwlULN4ZuoOpoixNBNQrLBJUO6chY8ABczYVOYNz
         jI0r/4ZJgGCcCurzgeSmemfXwPjEslBqpO+H/ymvYi4qE2i3h1Wn1yu6dh9NGGTeK8cR
         dLwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=wA5Kmh+XAx86XM5lcRFTwfs4Gyb5oOZnqGKVQdHHICo=;
        fh=FOBN3oXk2DeKY4G1AXSUb2xqFKukdIQI2wkQjODk4EI=;
        b=Oip514Uzo0SPJqvnZGLnWMzrrtO8XvqJjpG2Jd7ave7nXlsc5X7yzo4qnVdSYflNIe
         I8BmgHW1ql/Tk0iSbGH0/PvHQ9QfwGtFim5kl8DJjlA76jrhgv2Kx2rBD9/icwMg23fm
         NanlzTb35gi4GkyUVZ4z7cr1664Q3BJnilfInNWlMmQnCy/HcJ02goMDY8XXjg8max6o
         QoA3tk4KaarvaBWvKajysIjwM8pd7BzmX0lnZAvWRarX1mFoLD2m1OsLaFp7aENEt3NE
         90jnpSGo9NEoe35EJRDHXWwEICcqrcSJyuK5wkGk8BG6XbOsDfcd6+7+/t0LPqcNz9kY
         Njwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E1cJSQUj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bm41-20020a05620a19a900b0076ceb5934f6si6344909qkb.64.2023.09.27.08.50.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Sep 2023 08:50:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E1cJSQUj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qlWnb-00045r-4k; Wed, 27 Sep 2023 11:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qlWnZ-00045I-Ib
 for qemu-arm@nongnu.org; Wed, 27 Sep 2023 11:50:01 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qlWnX-0001fp-UU
 for qemu-arm@nongnu.org; Wed, 27 Sep 2023 11:50:01 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-533c5d10dc7so10312786a12.3
 for <qemu-arm@nongnu.org>; Wed, 27 Sep 2023 08:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695829798; x=1696434598; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wA5Kmh+XAx86XM5lcRFTwfs4Gyb5oOZnqGKVQdHHICo=;
 b=E1cJSQUjUi6a03PMTIKYAjmiOKMSLZ7szZcx4H5+nwuQvyMLhFCg5WLl90RbPmsJVH
 2znOxDL/ukwfOFTvSo3EROV5pwHb8JKGe3kqJiHIXYPupXDNDy4AMyNk6PR73tF8oSVu
 zzLrYol8CQRKyot/U6inwfbXDDWaM4s0StxrkOB4ArPJmJr7h8gr+18Qi6RZ1MYmAyO8
 mfs5VJnTXlV0lpk0DDf8+qTADlQO4Y7Pu7k2eyKy9XasH6WJnJvOpMjVD6vojy8zdrZO
 qNv2BVJsbgu2h3irUdUcCrFxj7r0SJ2V77b12oCLqn1E6BjfW3oCA8VFDP+FlvdSzyz6
 8DAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695829798; x=1696434598;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wA5Kmh+XAx86XM5lcRFTwfs4Gyb5oOZnqGKVQdHHICo=;
 b=bfhNuESm0YEi/QEMMIKx+ClDpRhC3aXm5ntlaxokp/YVEH9VqcKZUugtOWeAvrNQHo
 K4VpAuF8EF8+NoyxzCrTlBN0vLefVUf60Uitgw6YUxwqzCcYiuEeG7qS8ec35Z4lISb8
 IUtzS+ZQ8r3vDmMVWkUq+vJgu2EnWL+uldCxfrs9Xe1nWEEuSFgLOXV/zVSEx8G1ksMG
 pV5sGw9oLUw5Nveq+d4+C9AOkhD0izq8IDMUvsDLhEVcWFt0BFAU1tOfUJ18uff7P2O5
 Gyq1S/jmFa0qh82UKDFKBeJq0ad2o4hSi3rQOJHViQ/EhrjTcN+u3wa1Wn3hKLdujvGG
 vqDQ==
X-Gm-Message-State: AOJu0YxONX0bzzAI0Bc6T+dVG1A9qu9zoSaDwzG4QFmlaR4F0ASQ3rRd
 SynKX3Dm/h2h4x6YSwK+dp3URPsuRSsgIKPvMPvivw==
X-Received: by 2002:a05:6402:368:b0:534:7b49:9036 with SMTP id
 s8-20020a056402036800b005347b499036mr516214edw.12.1695829798132; Wed, 27 Sep
 2023 08:49:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230922132111.9149-1-michal.orzel@amd.com>
In-Reply-To: <20230922132111.9149-1-michal.orzel@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 27 Sep 2023 16:49:39 +0100
Message-ID: <CAFEAcA-Vbzt2q17-s_A4cw+sn2bx8uQS2QGFXt5b2nj9d0UJig@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix CNTPCT_EL0 trapping from EL0 when
 HCR_EL2.E2H is 0
To: Michal Orzel <michal.orzel@amd.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefano.stabellini@amd.com, 
 Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Z7g0agzFnHiB

On Fri, 22 Sept 2023 at 14:21, Michal Orzel <michal.orzel@amd.com> wrote:
>
> On an attempt to access CNTPCT_EL0 from EL0 using a guest running on top
> of Xen, a trap from EL2 was observed which is something not reproducible
> on HW (also, Xen does not trap accesses to physical counter).
>
> This is because gt_counter_access() checks for an incorrect bit (1
> instead of 0) of CNTHCTL_EL2 if HCR_EL2.E2H is 0 and access is made to
> physical counter. Refer ARM ARM DDI 0487J.a, D19.12.2:
> When HCR_EL2.E2H is 0:
>  - EL1PCTEN, bit [0]: refers to physical counter
>  - EL1PCEN, bit [1]: refers to physical timer registers
>
> Fix it by checking for the right bit (i.e. 0) and update the comment
> referring to incorrect bit name.
>
> Fixes: 5bc8437136fb ("target/arm: Update timer access for VHE")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> This is now in conformance to ARM ARM CNTPCT_EL0 pseudocode:
> if PSTATE.EL == EL0 then
> ...
>     elif EL2Enabled() && HCR_EL2.E2H == '0' && CNTHCTL_EL2.EL1PCTEN == '0' then
>         AArch64.SystemAccessTrap(EL2, 0x18);
> ---
>  target/arm/helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 3b22596eabf3..3a2d77b3f81e 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2483,9 +2483,9 @@ static CPAccessResult gt_counter_access(CPUARMState *env, int timeridx,
>                  return CP_ACCESS_TRAP_EL2;
>              }
>          } else {
> -            /* If HCR_EL2.<E2H> == 0: check CNTHCTL_EL2.EL1PCEN. */
> +            /* If HCR_EL2.<E2H> == 0: check CNTHCTL_EL2.EL1PCTEN. */
>              if (has_el2 && timeridx == GTIMER_PHYS &&
> -                !extract32(env->cp15.cnthctl_el2, 1, 1)) {
> +                !extract32(env->cp15.cnthctl_el2, 0, 1)) {
>                  return CP_ACCESS_TRAP_EL2;
>              }
>          }

I agree that the current logic is not correct, but this change
makes this code identical to the "case 1" handling, so we
can delete the whole "if (hcr & HCR_E2H) { ... } else { ...  }"
block and instead fall through, as we already do in gt_timer_access().

thanks
-- PMM
