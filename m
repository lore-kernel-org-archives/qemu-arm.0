Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4617424lfb;
        Tue, 27 Apr 2021 02:39:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXUBzZwvx0WctHVPRI+6biSi1EdreDMegDfYwQvv+jRG5yGD2s+Y7DaB1Q/u2YHipOE8Wv
X-Received: by 2002:ab0:2a8d:: with SMTP id h13mr16544822uar.24.1619516356687;
        Tue, 27 Apr 2021 02:39:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619516356; cv=none;
        d=google.com; s=arc-20160816;
        b=ZoWjukeYzXoUFqwPapjDIrME8GCot/zlNZ4AOzJa7wubZLOq9Mbgg1uXiOKNgGXv6J
         unv4DdsAytlsaCs2f83O5VEwUjJt5Te9Tb6aG/v94HVo/r2GW2sGGIuDDNHc3ZQ0jW5E
         3HQ+4BrdVz2PzZUHDzX2Wr14zgRPCc5P7v+wcIJIRnx4j+o5lCggzHyBwCSB56qQLRpU
         SbHH3w+crNQ/YoheJpuCk9JVwnMK4HDAsZ+nLlB9XLhVVSxb5FN47xvrPFU8uCUvRNSO
         9VEYTbIj3EK+mRP8ee5p9ngIUx7blg7tWG4kolYnJjEWPtB5uWbFJwb9ZdKuCj23qomw
         D6Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BYG1qizbeqBNYv12CSgZVkDlBFgKN/kaa4esTB+OyoQ=;
        b=r3TLn4GE/PJw0FVTZhXh8mxaiW7cANh90zQ0z89uz9h/fxSfKr1cWZsPUHjxg6XzzT
         DG4TeyFRE8MP5v1RIptCqQABNxt6pQdDa4KXB8iCl0dEZucwGpDnWKXiRlLnSL3P+sOc
         bdCkOWGKvTTX3dr41K38xbq0nhTLCvrWf2r4jL+XolTkmNlovS3Su10qV73R7dvGg5ij
         ZTbZQr+ZYbuDM4qjPxcnhZN4c7rslbzawaCu9kWH0IN0kONJ6MxDApAl7XxOW/xBoBMj
         tqAeEce8eUbi1k0C4WtocdbSe7mExLoEqS0XlCixjCplwCG+r1ofZZqrx2BCjk+9Bni2
         GjNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=br9XcAjY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v7si9078862uak.216.2021.04.27.02.39.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 02:39:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=br9XcAjY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbKBY-0001rf-1D
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 05:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lbKBL-0001pu-Gz
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 05:39:03 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:42570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lbKBJ-0001Pv-8n
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 05:39:03 -0400
Received: by mail-ed1-x535.google.com with SMTP id j28so5133662edy.9
 for <qemu-arm@nongnu.org>; Tue, 27 Apr 2021 02:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BYG1qizbeqBNYv12CSgZVkDlBFgKN/kaa4esTB+OyoQ=;
 b=br9XcAjY9vZ3lG/lDh9FIbroCOgHWELK1bbdli+9P8YvbACYI8WQqOLiFwQJ4ftECS
 QuXssKIn0lM0qFSRKwAMxCI3+RYbouCgWzoBb71DyF+YxZfoK+3wtnCpTIQJY8X8dBtP
 ziqkuv2ztBx1eHfW/6ttry5dXAORdXKmwFgQPBDzI3zm7NTescxVRDckoZQ/teEiStlo
 DYGekNLa9mYOXHrLsouejQPftkjlqFpzlybu9rigr5JNzKQm++4/pvcXHRtPnHIazmkA
 EI/oD3L1eOHmIWh+DLY6/iq33WVofRcqwUFYJ+TqqxaH9TFFvVvEal7Z9poG7cQ0h4s5
 JvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BYG1qizbeqBNYv12CSgZVkDlBFgKN/kaa4esTB+OyoQ=;
 b=CLrmo1hhA7fL4otaey/Kn9aOD7slqlesD1lXEmHOo5WP+8IBjx6yiYYmFvP1K8Fbsw
 pr7wdIsrcBpVwF1CFyyss0M0WQPMtXCeYsX/JA3pGmv5DwTXsnsnvXOMcjtMfrcRwxu2
 AG5u9mm0tachwqhkk6jyZixDbeOadPR73Wc0UfP6AuZ3dE3WCu4ouEFpY8ZpPvE3jU1v
 IDq1s5S2qLi5K4WWBxYseVRyryQDOzuYAA2Wp80TZ1vqXIVvIDyJOBhhUpJMGIIvOdki
 sTkNhqXceaYKX7K9jKUIh++ydo+UOIn5Hde8rGcmIpCh+g6KFyYIYKuPnia0neQc0Q/t
 bcDg==
X-Gm-Message-State: AOAM532+YiumXGaq5Gu2AKG0gLKqh0GL8oVVQb8NHFVNsbtFFTw23NQH
 Sdiz9XPPyIH6hC76SufYgMc8vMP1H4n1/VG1ZW2A6w==
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr3233495edu.100.1619516339568; 
 Tue, 27 Apr 2021 02:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617281290.git.haibo.xu@linaro.org>
 <37df1b1872f15086dd1d066e53dc1eedaf114051.1617281290.git.haibo.xu@linaro.org>
 <20210427092423.q3ktw4kkd5xhapad@gator.home>
In-Reply-To: <20210427092423.q3ktw4kkd5xhapad@gator.home>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Apr 2021 10:38:00 +0100
Message-ID: <CAFEAcA9+VpFp70rwZ5rWEQX9TxPH558jCiSU6Z=qPnUfieSukA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 5/6] target/arm/cpu: Enable 'el2' to work with
 host/max cpu
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrea Bolognani <abologna@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Haibo Xu <haibo.xu@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PhoSgaZCVqKP

On Tue, 27 Apr 2021 at 10:24, Andrew Jones <drjones@redhat.com> wrote:
> I feel like there are way too many ways to track this feature now. If I
> didn't lose count we have
>
>  1) cpu->has_el2
>  2) cpu->env & ARM_FEATURE_EL2
>  3) (for mach-virt) vms->virt
>  4) possibly (and probably should) some ID register bits
>
> I realize the first three are already in use for TCG, but I'm guessing
> we'll want to clean those up. What's the plan going forward? I presume
> it'll be (4), but maybe something like (1) and/or (3) will stick around
> for convenience. I'm pretty sure we want to avoid (2).

For new features added we want to use ID register bits. However,
a lot of older pre-existing features are keyed off ARM_FEATURE_FOO
flag bits. Trying to convert an ARM_FEATURE flag to use ID registers
isn't necessarily 100% trivial (for instance, the ARM_FEATURE flag
is always checkable regardless of AArch64 vs AArch32, but the ID
register checks often need to be split up into separate ones checking
the AArch32 or the AArch64 ID register value). So we aren't really
doing conversion of existing flags. (I did a few which were easy
because there were only a handful of checks of them.) As a side note,
some features really can't be checked in ID registers, like
ARM_FEATURE_V8_1M, so env->features is not going to go away completely.

The only use of cpu->has_foo should be for the QOM property -- the
arm_cpu_realizefn() should look at it and then either clear the
ARM_FEATURE flag or update the ID register bits depending on
which one the feature is using.

vms->virt is for the board code (and controls more things than
just whether the CPU itself has EL2).

thanks
-- PMM
