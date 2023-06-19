Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2811485ejt;
        Mon, 19 Jun 2023 06:30:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5veuLxrNzopfwgj3z4nRfe5ofDevGe8vFAOoIwhKkJnExYp9aJcSs7p7h9z3OvezTmv2Hf
X-Received: by 2002:a67:f289:0:b0:43b:431d:8d51 with SMTP id m9-20020a67f289000000b0043b431d8d51mr2884767vsk.8.1687181428680;
        Mon, 19 Jun 2023 06:30:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687181428; cv=none;
        d=google.com; s=arc-20160816;
        b=lpOQXPLy29au6tudwo3/3L6L0uthVP8xUn0ZYPP2p49KEBFh00O9/hJHnwbB5yLpua
         oaHmI9pF+FjKeaUOHPzkHcSSWNiei7Ee6w89hcj0f0KDZ452zIyhhIVVyL1By/VaOd43
         5EjPkdLgihyuuR6tMtBNxENvrOBfZKCaIZjqZvUDF9BdzvcJnuLIfPziib5b52DX7Ktu
         rcC7xGHMzTcniL6nzxa/RkUAbEDMl3HnWTs4VYJR4/mwMEEgB+6fJkI4OoRXviH9O00D
         0vJ0rKoyCZrz4xBYyGE0eKqYQ2/a8UrcHF2PV3/fIMiws+dmF6kBIP3Xy71t390Vqsw7
         lrvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=w61GMLuOJlYAzuL0e6VboE27HsfD2McTSrV1nphgMVg=;
        b=XcI7w8X6H2PPcRcHxnl9/PlpcAvwTV5H9PGtD8ZuHYp0O/qBWKEL50eTzW3JGbYBMu
         IjIE9RSarhXofiU+hhtgKOCYKdIt9axUw2oOftoUQx7A9/kbdhDIaQXzgsRZBVaMBsQ7
         yiACRXV+QIy6FEqrbrzw1/B9odk+xmXCoUbrebBE0m6p3JdfIgvaPjsDxIQHbLnhdCLY
         kdo0u2B+Q66Kl8piV7x2mTrVi6RsR58US6coRF+xlHxB9msY3/HC+m+vbjRHEXtK1uj7
         WZdEaHCbtSQ+e4i1aDXrVGjPchf84BOBPfRUzIwsGCTStwHfNfGvVGlngV58ToMAl1lQ
         h3oA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fL1gBtFF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g11-20020a0562140acb00b0062de8284254si767128qvi.422.2023.06.19.06.30.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 06:30:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fL1gBtFF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qBENa-0006ED-2v; Mon, 19 Jun 2023 08:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qBENX-0006AN-T7
 for qemu-devel@nongnu.org; Mon, 19 Jun 2023 08:53:07 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qBENW-00067a-AD
 for qemu-devel@nongnu.org; Mon, 19 Jun 2023 08:53:07 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f76a0a19d4so4291760e87.2
 for <qemu-devel@nongnu.org>; Mon, 19 Jun 2023 05:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687179184; x=1689771184;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w61GMLuOJlYAzuL0e6VboE27HsfD2McTSrV1nphgMVg=;
 b=fL1gBtFFfp18r9hJsyqg9CVhTGQAUIu0Ut5OhpfIjBOgWTpHlORa4PDWQrmEJkMTso
 AsQ4xsjPpBnk4c0BkoW3jmWaPB9+fd18LT5nf90ecYb2D1LBjJdejE5mNk8VZGgyKQio
 TxsXvzv4NcB5VaEUO145aG1RJvrmoxrJlKLpNRlBFzxW1WO26PmIRsFNq+CiXKhYQk+U
 VDzoGJcjHsbzrLBhjkRmDteD76JTF7n3KxttqsFakW/5C8UHgG0+phNtT9c+dShVGAvL
 ummibZDjo/w2Rg8KThgkz5uqfsJuajOYQZu5czS05KkDaRQpEKXCv/gyXlNO1Y08sQm0
 vqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687179184; x=1689771184;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w61GMLuOJlYAzuL0e6VboE27HsfD2McTSrV1nphgMVg=;
 b=FrIadNJfJgwxvAglvgODJ1eY/R9MVM/zrxkyzhylx0sBDYS1FyAK6f51IOGtanEFhL
 XGNFlOow+SZLyGbjgOJp/S1bqxOtXlrie69Qm+SlEAy20MBM2/PDzyad1IWOLQgtqfDm
 KYEM0yJRL1rS8M5V+4VsyO7YEzNiQcdXJJpuw1D5KaZTRHHpUvbVkGqGsSNWCXAkz863
 3uj2du3znxd7trYQpWUYydtlqJhHBauhLs7b6ez7aYyH/DMByW0CDuJWDd3JHfMI7eU8
 X+nwOrL9NEMzd0KctjTo/8ixQfS3fmIvypHqSBcRTCG81NbPIkfgnE4QOTG0gCLBs/Jh
 cxZA==
X-Gm-Message-State: AC+VfDytFvCoZ4xtpXxrG/aodblETAhuGWPdMZ46qCW/qVPaCN0mlMKc
 YN0R7fJfhknL7Hqq+8SicZQeGY6l3zzuYQsV51QkVQ==
X-Received: by 2002:a05:6512:32b0:b0:4f8:5f19:4b4e with SMTP id
 q16-20020a05651232b000b004f85f194b4emr3129315lfe.51.1687179184331; Mon, 19
 Jun 2023 05:53:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230606182414.637467-1-marcin.juszkiewicz@linaro.org>
 <20230606182414.637467-2-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20230606182414.637467-2-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jun 2023 13:52:53 +0100
Message-ID: <CAFEAcA-u8KP4Lnt7TWwwOTeUdq9c0mE6NWv1duEYn0ujE8B6wg@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/arm/sbsa-ref: add ITS support in SBSA GIC
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>, 
 Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org, 
 Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: J7zeMk0yxYH8

On Tue, 6 Jun 2023 at 19:24, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> From: Shashi Mallela <shashi.mallela@linaro.org>
>
> Included creation of ITS as part of SBSA platform GIC
> initialization.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>

Marcin, this should have your signed-off-by too because
the patch came to us via you.

> +static void create_gic(SBSAMachineState *sms, MemoryRegion *mem)
>  {
>      unsigned int smp_cpus = MACHINE(sms)->smp.cpus;
>      SysBusDevice *gicbusdev;
> @@ -436,6 +451,12 @@ static void create_gic(SBSAMachineState *sms)
>      qdev_prop_set_uint32(sms->gic, "len-redist-region-count", 1);
>      qdev_prop_set_uint32(sms->gic, "redist-region-count[0]", redist0_count);
>
> +    if (!kvm_irqchip_in_kernel()) {
> +        object_property_set_link(OBJECT(sms->gic), "sysmem",
> +                                OBJECT(mem), &error_fatal);
> +        qdev_prop_set_bit(sms->gic, "has-lpi", true);
> +    }

sbsa-ref never uses KVM, so we don't need the
kvm_irqchip_in_kernel() check, we can just always
set the link and the has-lpi prop.

Otherwise this looks OK.

thanks
-- PMM
