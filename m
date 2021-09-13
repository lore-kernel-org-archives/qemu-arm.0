Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3481588lfb;
        Mon, 13 Sep 2021 02:04:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyFZbtZpFTRE8mF5Zs7UWQDgquL2PSqy6Hz4IPCQAAJIz/EcIti/o8meQRguFAbWUmYrVp
X-Received: by 2002:a5d:9253:: with SMTP id e19mr8139072iol.35.1631523882490;
        Mon, 13 Sep 2021 02:04:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631523882; cv=none;
        d=google.com; s=arc-20160816;
        b=G1c5pfEOPGOhUGXaQKRnLAZSfSDSdIRqWegeTM/2d4YygoVhz+e5y9idwWAFOG0jZz
         va4jGnIb8px7G/zFi0sI/U/LYdkGc53gft0yJXstPp6V1wa+ZkcKZj6JgusaiFJxzdN/
         uxQWGeo5KOqQ6UDEAyxeHLj0dEgxxEoTXld7NXa5QyPWFikFzD81kdFGFzMLyJ2CeWNO
         9cQujgb/jtxNnKzoiM1gg7DagvZcEql/iGvVfnM9g1I4+TH5qPC0G9zG7u/VtqmsvnXT
         a3RO13GZu0DyefELJhP9dqonfNf92g+6nK4szLjfVmhJdV6E65o7AlsDcsyf6fAkbFze
         6Kow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v1c2/lceSHhulHQ3IFfXauC+rXyjeaXeZ0GjcuFQNEw=;
        b=rdovFTMQlmkNL78ESTBZZTilTNhKkFsZLWInLAvAJn+yXOWzYiaAzib+HLJIJbPfck
         t8JL8IMlgrRRsHDtFpGebFxrd+kZfuanpXq/w4c7s3+BahaqK+F+7jI5Wmnoq7DJaC7I
         r8XVUNYfdkdh774FFtBxR6m/SLeZ1A/F9FpOoHuu/6aZgX6jj4AVnYAJrwhPICZPQR9X
         Nc2A+WPObKJh/fzQhgn+RZI1lZdqHsOzkONvLo3QxDUJaXsZ0wJnT1xqHpVayh+Sp/Sh
         PFNBxhNeqqrq5q8E6hsEOtuinuDmxzQf+mHN7ySsrjOmjEeJm9t/uDEWeDQ6kSlI/6An
         VBdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="iIu9h/k6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay23si7016267iob.33.2021.09.13.02.04.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 02:04:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="iIu9h/k6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPhtJ-0002C4-R6
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 05:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPhkL-00014V-75
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 04:55:26 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPhkH-00027i-51
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 04:55:24 -0400
Received: by mail-wr1-x42d.google.com with SMTP id t18so13472217wrb.0
 for <qemu-arm@nongnu.org>; Mon, 13 Sep 2021 01:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v1c2/lceSHhulHQ3IFfXauC+rXyjeaXeZ0GjcuFQNEw=;
 b=iIu9h/k68X9a715NXjqNQCjfjRU5FRt2ixlAqEz/kOy5YmePyJg9zjEfBjbBG1DJM/
 AzJfoY3d6rwz+Az+4mT1X1My7e4bVqk/iQ0GyRsN4CZ51RXq2iudY0+jlCHa6BByXVsX
 Nihcl0vyC4kPY21qOlE9aAYu6Xlqk318WAgOiQw3Xv0UHzrJM2uVmD5nneDr4wr8LWix
 4DJWq3pCgsGvEfI4lQxoU8kZgm4ZRtCJ0N2YU/MChizIHQoOjbBCpDkiJ4KNQ5nApB5u
 WZ2cum1c0g3xZdDZUTB3Qq5CQLrkvqWTxO/4j/SOCOlOAq0ldfb9dFzgPnWutJlFWM06
 SmIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v1c2/lceSHhulHQ3IFfXauC+rXyjeaXeZ0GjcuFQNEw=;
 b=L3qjaVJbDZmySOanIik40EFyAbnO8ZJKjkZF4J1aWKgHZm5Cq7fSH1vAMEnrltrUNq
 kckuD1fz69PfPYoLqa9FijCF5aJ8CiQri8B/VrNGj9Nqr+XxtLJ/wFVfeZDSb0vLsAww
 SMNfzFgIy4H8hGUYful84fgUlNF1kw5wiiHu36aTV0zVZSbc97F5kRmDW0FD2jJ6+a6Q
 JHIUsyp0tJE6eQePelujDlqzDcmkn2DXDjllInvYyrPMftmLw1WtxatD8N6UyXikQ4J4
 4HjFL9VZRRvEb11T6s4f6AMNk8TL0MHkvnLlthW2on1yMYbpM29GE7Cazr2GpT3zzFD8
 PU+g==
X-Gm-Message-State: AOAM530Fdny/IUmGd0ZcdejbRI40TQtcltmlQ/fwl7wM682Cx2wVfI/l
 9qr+ZfbHZN9OreKqkphPMTwzRZNva07QV/NxDQrNCg==
X-Received: by 2002:a5d:4a08:: with SMTP id m8mr11012380wrq.263.1631523318882; 
 Mon, 13 Sep 2021 01:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210912230757.41096-1-agraf@csgraf.de>
 <20210912230757.41096-8-agraf@csgraf.de>
In-Reply-To: <20210912230757.41096-8-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 09:54:28 +0100
Message-ID: <CAFEAcA8BybrfxNxkWbEjxji4DvDumr6Otb_RK_f84Dt_TWXfpA@mail.gmail.com>
Subject: Re: [PATCH v9 07/11] hvf: arm: Implement PSCI handling
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qgn7103jJnix

On Mon, 13 Sept 2021 at 00:08, Alexander Graf <agraf@csgraf.de> wrote:
>
> We need to handle PSCI calls. Most of the TCG code works for us,
> but we can simplify it to only handle aa64 mode and we need to
> handle SUSPEND differently.
>
> This patch takes the TCG code as template and duplicates it in HVF.
>
> To tell the guest that we support PSCI 0.2 now, update the check in
> arm_cpu_initfn() as well.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Sergio Lopez <slp@redhat.com>
>
> ---
>
> v6 -> v7:
>
>   - This patch integrates "arm: Set PSCI to 0.2 for HVF"
>
> v7 -> v8:
>
>   - Do not advance for HVC, PC is already updated by hvf
>   - Fix checkpatch error
>
> v8 -> v9:
>
>   - Use new hvf_raise_exception() prototype
>   - Make cpu_off function void
>   - Add comment about return value, use -1 for "not found"
>   - Remove cpu_synchronize_state() when halted
> ---
>  target/arm/cpu.c            |   4 +-
>  target/arm/hvf/hvf.c        | 127 ++++++++++++++++++++++++++++++++++--
>  target/arm/hvf/trace-events |   1 +
>  3 files changed, 126 insertions(+), 6 deletions(-)

Something in here should be checking whether the insn the guest
used matches the PSCI conduit configured for the VM, ie
what arm_is_psci_call() does after your patch 10.

-- PMM
