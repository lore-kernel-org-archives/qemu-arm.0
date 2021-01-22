Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp874319lfb;
        Fri, 22 Jan 2021 06:02:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcZu6U19TY9p7L9Y/Ar7ro34d6Z3oAqhGCpAneBK2IDi7pFGDoxRWNmqXAlSyuuJyqOqPV
X-Received: by 2002:a25:1389:: with SMTP id 131mr6649286ybt.210.1611324178326;
        Fri, 22 Jan 2021 06:02:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611324178; cv=none;
        d=google.com; s=arc-20160816;
        b=bKIMsf0MoZMWf//vhL6+a3o2CAiYvuN6aS2vX7HslgzoPBupmzyVkD/X0YRsl+/Tmt
         teNlQz6rUqVluGUQ3Lx9O9pDeSFJDAYAeu25JyLUP50h3pqvrPVgkBkKGU4vqTjaCfUR
         fFYB7llldn2jt6gPI411t/89zPJz5B7GBdPO7UXFE8E0vWDEe2UQIUknH1HFJJgpKMfi
         L23DKzJzoVDkHZa8FmOdX2IyrU8h3ZA3DBuyyh+laX8j0jK7UjBzeArWWV8D9bTfJmuB
         gYAFOP9eQ7NOtMsbfIxqRqDiuyIgw8OOppAqj+0MlHJvE6xt5vliwrj6ifq9jHnBVY38
         I/ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ovmnVInjHZhWRkbSKOjIOLVvM+0ket6BTwAo/sK0J64=;
        b=eam3dx2wMXK3zxKaNPcmRGkE/BStzCvATurCGKANH8NhSRAlqEXdrivjB5890T0iT0
         z93yV+jgnu4Sv/BJB06qAAxq90+3/fFBctzyrp4qyi0jhLK07vIASLFcSG41tyANs7Dv
         HU7Lz+AyLFVFeJqRrFfSuXApb2eJLtwVkVUWTJ/Vu2Cky9FQnp/hiPKQmOPaSZstYgKT
         8SrSec3+CNt/EW+wqOfxD3NoXy8ZemFiiEUyh9vjx7fhWM3T88Gbe8n+L6m03itp36vp
         J524PFwjqH6VzIr0vd/4wNqDbQdG6Gwv76/txOOg0s2e6Z13VEf0QYSToErxXfU923SN
         +dvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bXrXGvao;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q1si8308682ybg.263.2021.01.22.06.02.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jan 2021 06:02:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bXrXGvao;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2x1d-0006HR-LV
	for alex.bennee@linaro.org; Fri, 22 Jan 2021 09:02:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2x1C-0006H9-Kz
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 09:02:30 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:43881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2x1A-0002NR-Pq
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 09:02:30 -0500
Received: by mail-ed1-x52f.google.com with SMTP id n6so6647987edt.10
 for <qemu-arm@nongnu.org>; Fri, 22 Jan 2021 06:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ovmnVInjHZhWRkbSKOjIOLVvM+0ket6BTwAo/sK0J64=;
 b=bXrXGvaoN3Pi3F17SavZVCiGj753gq1nvEmqcmOZzIJ1JutIkDlj34nfk57mGNVxQI
 g6HW0ahIhd40i1O/SQQqoJBTE7TherXs1qN1xUDo+JcI+zpjzYcdbJcFyeFq0B6DRjQ8
 FUIrMVt/nIIhPk2hG+WcM0tULzrLhfNSTXIlvCgkG2urzvuUeZ/h+cCgM1gyDumR6ZrR
 VkKl9R/IihPcxMyLDjr4/wgkTvi1vmhIdm/Nqzq7bV4yuGAbNOgMni3OuFB80j8qVSte
 g8OHTR9bwTCqjcAXh8ASGXASyHpl+bng/EhJYpyrn+Gr+wahDbLhJt4AyJiIMLEO2VfP
 z3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ovmnVInjHZhWRkbSKOjIOLVvM+0ket6BTwAo/sK0J64=;
 b=CARpwfdqZPoJqFDELJraLIa7ryG2SB0/vq676D9pusmpyllPdurVfrdJPDfr429b3M
 tnjhukVKNvZJL24DmTAa4GbC/l3LVgbCN+y1wTnxXguqxR/qVGb99QzDKuJWm7pb9jLL
 fo7+MQmf1qMhsfu5YSrg9ap5kgWulnecr/GZQhwaIEk3Ndh0D5d2lkNWRm453YHAhIMV
 3BsZ84fkhcQt8gUIvKANsuTIdwe8BAOao3urkh5VFuSxiTBEw0GAHJAa3YiHbKxNv1Ng
 HUEFLQm/CdFNLtPt6vUM/12njBaDSIV6HSguYk1bNhQwJCQ/RDrRPWko9J8NhWYZKTJq
 dcug==
X-Gm-Message-State: AOAM533bdxv5eEQb5rfT4GBkuPxqFTb38Rh1cAgxtnWed20pE7YeKvX8
 JZEU43t0sV1P7Fy0gnQpQtTcg6V55S9otERRgPUOqw==
X-Received: by 2002:a05:6402:31ac:: with SMTP id
 dj12mr3264185edb.44.1611324147310; 
 Fri, 22 Jan 2021 06:02:27 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-21-richard.henderson@linaro.org>
In-Reply-To: <20210115224645.1196742-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 14:02:16 +0000
Message-ID: <CAFEAcA-iTzra0m+xNQNuKA7uQ9Yv1=wqSUykYhSG44B4YkxDmw@mail.gmail.com>
Subject: Re: [PATCH v3 20/21] target/arm: Enable MTE for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +sNchvNfnCZk

On Fri, 15 Jan 2021 at 22:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index abc0affd00..5e613a747a 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -208,6 +208,22 @@ static void arm_cpu_reset(DeviceState *dev)
>           * Do not modify this without other changes.
>           */
>          env->cp15.tcr_el[1].raw_tcr = (3ULL << 37);
> +
> +        /* Enable MTE */
> +        if (cpu_isar_feature(aa64_mte, cpu)) {
> +            /* Enable tag access, but leave TCF0 as No Effect (0). */
> +            env->cp15.sctlr_el[1] |= SCTLR_ATA0;
> +            /*
> +             * Exclude all tags, so that tag 0 is always used.
> +             * This corresponds to Linux current->thread.gcr_incl = 0.
> +             *
> +             * Set RRND, so that helper_irg() will generate a seed later.
> +             * Here in cpu_reset(), the crypto subsystem has not yet been
> +             * initialized.
> +             */
> +            env->cp15.gcr_el1 = 0x1ffff;
> +        }
> +
>  # ifdef TARGET_TAGGED_ADDRESSES
>          env->untagged_addr_mask = -1;
>  # endif
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
