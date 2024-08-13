Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp99621njf;
        Tue, 13 Aug 2024 05:13:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUtymA10sdGWjA2rl39qnumcm7pXHdkFMK0BhNwREBW6+9ZPYjEW1qxwwAt0bQLqPp+k5BqxBnTPj3MWyPfeSzwwqT9mogv
X-Google-Smtp-Source: AGHT+IGDQgz4IHm/qdmM5Mf+d7x30WrOCQ6CpHD9St+qUKE4WO/ZrgbazzapSU6SmQUNxarDR7me
X-Received: by 2002:a05:6122:2a0e:b0:4f5:21da:9b98 with SMTP id 71dfb90a1353d-4fabeef189dmr3302344e0c.5.1723551220682;
        Tue, 13 Aug 2024 05:13:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723551220; cv=none;
        d=google.com; s=arc-20160816;
        b=Wva2d6eZUDSga+0Jji7rIzIe73pOQIyQfPj5vKNmtmoIaS7f5KuylztJv4TfsF0S19
         yBFiPsBDLzw8fXYwFEqV3gfUwcKNPq433ANEfG8AODdUfFEUvmwC1oPQumHnkukfVeqx
         Yehfoeb9P0c/9xwqnMrvrUz9kWtyDW+YYqGMKchD50mbJ7CjkiUeVIWmuc1d4vUzAiz0
         u7WGu7jr8jonHIt4pEu2yZz5uiwbWiSaMihmRfmo4RqtDVfD2/KXZxYt4YDD4JMExKIk
         U/uEdhO/V+YZXkHcTEocStKikoI+cNbbE7IFCQzQfQiBvEKaBwRSRm11pcubf06/8KRa
         jDRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=kWsktjKwmcd8WRnSV7pR1/+wwmW/m1PAvw8UnYHK1/E=;
        fh=WnEXHxtYNRFhBXsP+I8EnZa5IV3hGBJh7thYMvBr8rA=;
        b=km5AFCrM3SitybnlzMp1m7dEGgzWaMJbx7qRyQTPYIs/GAXaPMYHWPjvv/CJ9+QBqV
         Ze4GQ1+TJ+MjRr2C4fNovlfntVRAFCPQNj7WBzgQvO6AwKZvEZq9OQFEis7Su0+mjrZC
         +aiLqiIkMHb+G4LIdvX/nxWKbj/QQChudeVhJCOriAhUWMeodKVob/exnG0oaGfXUUb8
         TTiuiDlxQ2wLJXp8h9PkXoDbyRfTd0yAUDq3CXAGHGMGxIHsLuYyM+DcdEMBqbADXinV
         q86ookt+cm3v/rKvTUGIS53RhTKIuipFA/5Q76OGXs0mZRlnfbjfYrrRY5a9eNKcetBz
         b5sA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=adDJ6INj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4970a0e974dsi1077522137.356.2024.08.13.05.13.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Aug 2024 05:13:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=adDJ6INj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sdqP5-0003wp-IY; Tue, 13 Aug 2024 08:13:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sdqOx-0003uT-Fk
 for qemu-arm@nongnu.org; Tue, 13 Aug 2024 08:13:26 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sdqOv-0007v8-NJ
 for qemu-arm@nongnu.org; Tue, 13 Aug 2024 08:13:23 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2f1a7faa4d5so46389401fa.3
 for <qemu-arm@nongnu.org>; Tue, 13 Aug 2024 05:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723551199; x=1724155999; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kWsktjKwmcd8WRnSV7pR1/+wwmW/m1PAvw8UnYHK1/E=;
 b=adDJ6INj81EqSxo7jEJQo4PHuGXCYNTv4MQY9/t8he3j0zURSD7aTTjlFfVW36d9En
 NU4C1s/kJ+B0eIrWAHJTADk+6uEJjRLLWJayQ26Cs+hAgHkBdbBPlOQQXFqTkB8uiJhK
 ZVWx2DAgm7NBx9cjvJAjIFZitOmLlxDbx1zrf+X9MJeaP97lnYU0A0yRVQ67WMw9geg1
 5f0ydnaJQAq+xCCMIC5ZLJiuiMngJfrLGb0eE8CQmbsxjxOxKc1a4SdsLNdco+dD3CCQ
 e0CoPquTdLuWb2qPEdsoiCdihJ37FgFcEcRa3U/bLYczlLIcnRkcNIgVi+dU45llyGxM
 3aVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723551199; x=1724155999;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kWsktjKwmcd8WRnSV7pR1/+wwmW/m1PAvw8UnYHK1/E=;
 b=WC+OCSF299TWekYkrsFDD8TEFa8QLfW8prG83jXBAfmd7QBGN1mauNvrI1zCfRNEF7
 TgPP2FhV6Lj5VIKBhV46ZTipcYeX1hW3owCfe+4k4sto0IBWRiYoBaY96At/vTuhLzC+
 X/X+oAq9fjKFJUg73ZZmXUHixvFHXW51t0+y0RQ9VnzR+7gG+R0sfFi6XGmrilw3ZYNm
 4l+n9yqU3R7WzNmt2CZPMBksPxbWRhx6w5YyNTAf4k96Tly/2lVXsbbTNkvXFVZU0TZi
 haYmtHK474NcDE3L8PcLPyjL5CirJDoequyiev76kxzxwLkxzbKNzChem9RiEq6Y0ds/
 G3Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCULj1DrIs2Y9E6HadRZ5bynPXBkjkd9bNTx6zIgmUc4KnKVBh/a11WFHM5UiE1OSQcOY0YEUW4gM3ZsOoGETlsNdjQf
X-Gm-Message-State: AOJu0YwD1jMnxAvJNZe5SV2a+BI1KIl38o/jIRJcZsmbJYuySeFUQTJ5
 +U+tk/c8NHSDtxeGMtaGhFOGryeUw2LQH1iMWFE8kODwRwniVJD0GvPB4BYPr6+Dhhl43/jlI2P
 QK/itxXBX/vv7eWrrJwmj7ohSzxjAk5FaLvZmMw==
X-Received: by 2002:a2e:a7c1:0:b0:2ef:28da:2476 with SMTP id
 38308e7fff4ca-2f2b712f259mr23238631fa.5.1723551198474; Tue, 13 Aug 2024
 05:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240615185423.49474-1-florian.lugou@provenrun.com>
 <CAFEAcA_+WrzM4fXQMUxMi3L5yiUWMrUGTSZH=NDdYDKUCP+8NQ@mail.gmail.com>
 <20240620135627.qxcrkdx5v7wdurx4@flugou-latitude5401>
 <CAFEAcA-ngrrEUDD7eA_sOLGF+_wRCuQVxTwuCA4pXjRcuJucmA@mail.gmail.com>
 <20240621140725.f4hsasmhrhh4joxm@flugou-latitude5401>
In-Reply-To: <20240621140725.f4hsasmhrhh4joxm@flugou-latitude5401>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Aug 2024 13:13:07 +0100
Message-ID: <CAFEAcA9c9hbpsdyc7+=QEOZGrNY2m-urk6VrWdwCdfk9ipkwpw@mail.gmail.com>
Subject: Re: [PATCH] target/arm/helper: Fix timer interrupt masking when
 HCR_EL2.E2H == 0
To: Florian Lugou <florian.lugou@provenrun.com>
Cc: qemu-devel@nongnu.org, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: HPjOLXSjb5Ox

On Fri, 21 Jun 2024 at 15:07, Florian Lugou <florian.lugou@provenrun.com> wrote:
>
> On Thu, Jun 20, 2024 at 08:01:01PM +0100, Peter Maydell wrote:
> > On Thu, 20 Jun 2024 at 14:56, Florian Lugou <florian.lugou@provenrun.com> wrote:
> > >
> > > On Thu, Jun 20, 2024 at 11:43:17AM +0100, Peter Maydell wrote:
> > > > For this timer check, we're doing I think the same thing as the
> > > > pseudocode AArch64.CheckTimerConditions(), which does:
> > > >
> > > >   if (IsFeatureImplemented(FEAT_RME) && ss IN {SS_Root, SS_Realm} &&
> > > >       CNTHCTL_EL2.CNTPMASK == '1') then
> > > >      imask = '1';
> > > >
> > > > so I'm inclined to say that our current implementation in QEMU is correct.
> > >
> > > Indeed. I got confused with the specification, my apologies.
> > >
> > > I am facing an issue with QEMU freezing waiting for a timer interrupt when
> > > running with -icount shift=0,sleep=off. Bissection has shown that the issue
> > > appeared with f6fc36deef6abcee406211f3e2f11ff894b87fa4.
> > >
> > > Further testing suggests that the issue may come from gt_recalc_timer. Calling
> > > gt_update_irq before timer_mod (as it was done before f6fc36deef6a) rather than
> > > at the end of the function solves the issue. Is it possible that timer_mod
> > > relies on cpu->gt_timer_outputs, which has not been modified at this point to
> > > reflect the timer triggering?
> >
> > I don't *think* it ought to care -- timer_mod() tells QEMU's timer
> > infrastructure when to schedule the next timer callback for,
> > and the gt_timer_outputs qemu_irqs tell the interrupt controller
> > that the interrupt lines have changed state.
> >
> > Do you have a reproduce case?
>
> I do:

(Sorry I didn't get back to you on this earlier.)

> $ aarch64-none-elf-gcc -ffreestanding -nostdlib -T qemu/tests/tcg/aarch64/system/kernel.ld -o test test.S
>
> $ qemu-system-aarch64 \
>         -machine virt,secure=on,gic-version=3 \
>         -cpu cortex-a57 \
>         -kernel test \
>         -display none \
>         -semihosting
>
> $ # Exits after ~1s
>
> $ qemu-system-aarch64 \
>         -machine virt,secure=on,gic-version=3 \
>         -cpu cortex-a57 \
>         -kernel test \
>         -display none \
>         -semihosting \
>         -icount shift=0,sleep=off
>
> ... (hangs until QEMU is killed)

For me, with QEMU commit 9eb51530c12ae645b, this test case
exits (doesn't hang) with both these command lines. Do you
still see this bug? I guess it's possible we fixed it in
the last month or so, though I can't see anything obviously
relevant in the git logs.

thanks
-- PMM
