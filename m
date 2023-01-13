Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp383739ejc;
        Fri, 13 Jan 2023 05:21:21 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuEkhK8FrmX8+5/k9rkS2cpNpupcG8jZpcDEYjslt+XJ7x6K6oZx4L6MJuN7EQYTiiC3mRq
X-Received: by 2002:a05:622a:4006:b0:3a9:818f:db3d with SMTP id cf6-20020a05622a400600b003a9818fdb3dmr116169093qtb.53.1673616080861;
        Fri, 13 Jan 2023 05:21:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673616080; cv=none;
        d=google.com; s=arc-20160816;
        b=l/jb+PAYyFMUxI0DIxBP0RvEtpbE8/9KZfktNZPLwnpR7loueZD0ZfqqzHJ18pyuln
         St0pAZWZQunyAsbz11xQx7RDFnfoGMiEEltWXQ+wZ2uz7L8F5zVXLXQm5cNLr41SOfqv
         nSQySOOgm6BH5xWEqUwE5ih/LwNUyC0fGqfmlhNL6b48ChzMw3SQiCPdYvmIUcyX8ITL
         FBzAJJvvOuKfqY3IQIwKufy17BRfeqrb3h6Zss8HKi9IJY+pV9CoE1AwzmpgpXK3AxI1
         /XpgxTOAXXGRWAfNr5R7BHheaAU/tmx3XOnf2jfjg5TR3Je5KAi+zjl510QeH/eAHHSX
         DwTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=2HiQcavuJZg1YKdzcRCo0RHAlxM1LHlsbYqDs55xGY8=;
        b=kPaha2KNIqgW3ri0o8xV80kMof/Q+yv7MesRr8GcKn00dAmZjfekm2WDWOWzmGOvAo
         CxRQG+ZJ/QcF6u59xTNDmqMeK/eUbZq2a60Z8mqISLnRs4sPZzORvNJiiFYNwg4y0s9T
         gaRS8oVeWyi4/D3YIt+H6357ueTCaBzSKfVo0p8t5ZhDnRj+HT+TIv9apG/UdzfMoBzB
         KNuAjxOMowR8s5Dt91XT5gj33vm3bRomUa2x1vDWthNgAcWewYLJDg8nuOaNEg9HBxQ5
         iVmExNjW7dzlX0DYMg7pQQt0+fW/x4EJSL19jlJXJe1/NWf2xcukVFNrwQh8f7uhnIYz
         qd5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Pfdw/SHr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o25-20020ac841d9000000b003b15e0632afsi3944112qtm.325.2023.01.13.05.21.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Jan 2023 05:21:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Pfdw/SHr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pGJzD-0000Os-Ef; Fri, 13 Jan 2023 08:20:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGJzB-0000M7-6s
 for qemu-arm@nongnu.org; Fri, 13 Jan 2023 08:20:45 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGJz9-00006v-0e
 for qemu-arm@nongnu.org; Fri, 13 Jan 2023 08:20:44 -0500
Received: by mail-pg1-x52f.google.com with SMTP id v3so14967793pgh.4
 for <qemu-arm@nongnu.org>; Fri, 13 Jan 2023 05:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2HiQcavuJZg1YKdzcRCo0RHAlxM1LHlsbYqDs55xGY8=;
 b=Pfdw/SHrpuUQQXRZW/2rwUjKZ+phvsuOqkZ73ICmSQM8IRjnfTfZ/1jOxFmCj+DKbq
 piNNzbWGZzOJMhIEDPZjP8SB9Oj6zQLwhgS54zLHZ4DbHklebHHvXZY2uCpj295aLYpr
 rMA7ekh7qlhgkiXy4aDXLK9DBObVrYWLrUICgMdD7qmJk2+OHpl1iJSqC5qjiO0BBjhC
 Yz2Icuf6PY05+8wXQAG0/BhOc1ITM1YlZ07Egn6fjpkODbN8i0EVAZN4kbBwgNqfffHW
 +iveYELxihrcgnQOrp5FwdySKOHT9M0u+jHpqFWhxlMmHaoXEGj8hSkdbxAoFibm/OEN
 MO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2HiQcavuJZg1YKdzcRCo0RHAlxM1LHlsbYqDs55xGY8=;
 b=jkCoSL/e0s+UZFMEf311eFAG73GKtdCbLEfM3R/nAi1LRlGy89a5uO/LGMoJbc6zVn
 MpNs5gcTy0GWPhHLj/Wd9CoGDKF/UBldl/4SIrjNupGKIpHljS8Yj39YTIJhToxnQwwI
 qGdsa1TgjsJ5HTGTqgfg76TnbY4R/duGTYv2WVLBRRWXR0ky6S+uXcoSmNXRyG8KeWRW
 iJ2LbaB0g36LJ4mJYoyY6SCenkLdmfoLceXcbYzjldQgiEYW6CwEa0TORzd+16F/ehw2
 LubegdPrzWaLHu9CtIs2SJsiDUfuuS420LrvK62MvS4Xofgq0SI5CTtI3LQD3On9Vxqa
 vEsA==
X-Gm-Message-State: AFqh2koJRhkCHWCDkyOUUvegPLxyyqLh6vRc2a2V3Mf5TNU+h5pdATHz
 7mEzNNoY/2+zBgogI050Fz98FGOePCgdGMY2W/wBS079yVPg8w==
X-Received: by 2002:aa7:999c:0:b0:582:74a2:1e4e with SMTP id
 k28-20020aa7999c000000b0058274a21e4emr3618316pfh.26.1673616041255; Fri, 13
 Jan 2023 05:20:41 -0800 (PST)
MIME-Version: 1.0
References: <20230105221251.17896-1-eiakovlev@linux.microsoft.com>
 <20230105221251.17896-4-eiakovlev@linux.microsoft.com>
In-Reply-To: <20230105221251.17896-4-eiakovlev@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jan 2023 13:20:30 +0000
Message-ID: <CAFEAcA_1K6jC1aM3DX3iNN503pqw14yyCUiORoHPSfxN7g8Xzg@mail.gmail.com>
Subject: Re: [PATCH 3/3] target/arm: allow writes to SCR_EL3.HXEn bit when
 FEAT_HCX is enabled
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 qemu-stable <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uRYQtgSoIJR6

On Thu, 5 Jan 2023 at 22:13, Evgeny Iakovlev
<eiakovlev@linux.microsoft.com> wrote:
>
> ARM trusted firmware, when built with FEAT_HCX support, sets SCR_EL3.HXEn bit
> to allow EL2 to modify HCRX_EL2 register without trapping it in EL3. Qemu
> uses a valid mask to clear unsupported SCR_EL3 bits when emulating SCR_EL3
> write, and that mask doesn't include SCR_EL3.HXEn bit even if FEAT_HCX is
> enabled and exposed to the guest. As a result EL3 writes of that bit are
> ignored.
>
> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
> ---
>  target/arm/helper.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index bac2ea62c4..962affdd52 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1844,6 +1844,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>          if (cpu_isar_feature(aa64_sme, cpu)) {
>              valid_mask |= SCR_ENTP2;
>          }
> +        if (cpu_isar_feature(aa64_hcx, cpu)) {
> +            valid_mask |= SCR_HXEN;
> +        }
>      } else {
>          valid_mask &= ~(SCR_RW | SCR_ST);
>          if (cpu_isar_feature(aa32_ras, cpu)) {
> --

Oops. This is worth
Cc: qemu-stable@nongnu.org

I think.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I'll take this 3rd patch into target-arm.next now; I've left
review comments for the other 2.

thanks
-- PMM
