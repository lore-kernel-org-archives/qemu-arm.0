Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D192DC44501
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Jul 2026 09:34:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjD3e-0006tF-NN; Mon, 13 Jul 2026 05:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wjD3d-0006su-8V
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 05:34:37 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wjD3b-0001xS-AB
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 05:34:37 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-66628618509so3508904d50.2
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 02:34:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783935272; cv=none;
 d=google.com; s=arc-20260327;
 b=kirUImGTxli1fQ90SHlejO497Uk7nqU2CmzG3+pxB8wj19jXCHo9KBeUDZmGxRUWdC
 RCW8yZzKN2DY6Ye5a0BzDf1CLwOr4NedZ6gBNHlkW2aInqFNnqoSJiNMXZd9s6THj0y9
 N7NB7ADQFJ6waeGbi2twGEfHWFizShKaZjzA0fca0p6HkudWRVxxL3DX3eNI8bPHQccX
 kSMsS7H+JStm+3R7/v/IKmvR+IOfziwUn1kXbE2PTELNrwi3QaZZhJPk7p2X/kwnRYS7
 mNyQdQCcTExCG0c6j6jN6u1H+JcBK2tNzItB6eBiGc7iUlHwQ+hpWsxnPsAycVPvbMrv
 ORxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=6B2WnhOE8NF02oIsGMsXQEgrM7im3pLdjLr6S6+erhw=;
 fh=lFxKr5rsGh2iF62mIXCZ+eRLuFqXNLxK0yZTcMvPAi8=;
 b=VIK6K6VsZgNafVeAcJE1YAhemxHHYzH68iVAp9QBVwJZYUjrJR+SLqem40dAI3RHEM
 5H7/j7EIPB/XyGdbaTsCVlVK250Uf1oKOIxu4az32f7y/l0er74aI9TODaGt0q91boo9
 yEJBzeUBpJq2u9rOPNvtIvEn+zQClc9q6yE7KqKR4K6qy7zyEO0dVQh5YIJKXG/+PapO
 /HtGB5k5WU4iMGbYGq7Dsg+458WJGSsyZ97TXqOJA4840B1QS8NQqqgs37F6zI2WXevb
 qudY/XEg7uwKU0pI/3HPuAe33O7gcfKKY8z9+JVw1qxyYzbFvI8eYVeMhah4eh5FRQUB
 GO7Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783935272; x=1784540072; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=6B2WnhOE8NF02oIsGMsXQEgrM7im3pLdjLr6S6+erhw=;
 b=hcVhShFRFG2/xeUJrJiC0fK5lD4VwlP6E0RIW8DMVcZEorFgNjQK8IylU65rTZ+RHt
 yOtGJSmoMrNxTFK2rJ3A8m5cB9PU+ho6AV69jGLP4uuo7zEp9HMsktGryetVhzw160oK
 wgtreU0IeM0wK3iavvdH++1TFOKd1Qnqfri+m+GRhSwfE3cD32gu3/vv6GMsGtlhPT/O
 ksGRZ6LhKiWlLZS7YeDexkaGWs1/lPztcmNBAhIXx5v1arOdRztoMn82N0o9x9deUrYI
 nuPFAcvlcmW2STlD7TF2/iy/FNQsn5SR8k7xcx5U3dIwPZU4whIziNUsMD0Op9XpqQ3i
 OgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783935272; x=1784540072;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=6B2WnhOE8NF02oIsGMsXQEgrM7im3pLdjLr6S6+erhw=;
 b=T9EQUGkdXgSRM6LoboJzjcI+/wHeWbkmYxtLb+ugLJXC7getc9wJ6C82sAUNYpl17l
 JXcV9eIVC24vkgPWvzgzF+ObycOoNEvLxmd7LhA74SMIIau3Jb0w++TLSM3OhtFn6ck3
 umMcIm1v2G50Fdww30Voi11C7Uis/S6a7SMwsMgFkosN4vNeRRz0yZL6t5tTr1DnF6PP
 1L2KOkxpOm+Amnf0W7CXY59wstn02/JJMBgvN4i6uUcgeIevMMXmI3vtdxPi1+CCqj37
 OS6n3s2a0bUkVjW95KcjpLOTh52wcyQEe5igX5+K4p4l5FDMEI1jiquOujxg06H2hXUh
 UbGg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpuuT0aylm5NqJdr2FARJ0Pzs3NgZJGcPELnvBF+fplvuu2ixHoAy58eCpHckziKD36Py//w6Qedw==@nongnu.org
X-Gm-Message-State: AOJu0YyK37+sJeblC24gwR9RuXMw6JTXkXfOixr6duVtuGiIbzHKXqfQ
 ++LZplMfjk4g691i2s0PlaRHV+TR0XXUzukxZpZHNpCFun23jVppSQWwOkod2qu+klORplfs7bo
 M0TMUYddUTAt3nt0w6A6QpVSufW9M9Dq6La7grF4teA==
X-Gm-Gg: AfdE7cnbP9fVFAyRbwA38Spe6eYZjjYjvH6JCd8f3J92054Q+UZ5yTeCSqp6CcZVQhn
 zTWRER3XoGO4u8t/1V+Ag+57MSdzXlcBeb1hTdplTfSYAFymVgLc79Sa5fv9vNXJQGptSTgmNLY
 vDAKqpTU7SOoQ3I0wmU33gwZeVlkE3toV7XdnRQ6AS0NyNrg6cmVykPDp7WgL50vpVnHM/79lC7
 a8VNeqFNygAAqI1w27Ou44aXR5Tj9GaXpNx7BLJMctNymnPVl3EP9n+/e3qh+qP7el++vEySrKl
 YFGdeceB9eOdcfLJbQWHv1jH3cIsiMgxOQrB1buZHG6/GOsqfNOWPODL
X-Received: by 2002:a05:690e:350:b0:662:d25f:daca with SMTP id
 956f58d0204a3-667d7c3e331mr4113588d50.60.1783935271784; Mon, 13 Jul 2026
 02:34:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260623-guest-panic-unhandle-v1-1-6adfb6d4221e@ooseel.net>
 <CAFEAcA9LCRKmU+r77zGp+4Rgd-uaZLPnoPPQDSfG8X5eeiynJA@mail.gmail.com>
 <91ad4c80-adc6-4f37-8346-20230638e5f0@oss.qualcomm.com>
In-Reply-To: <91ad4c80-adc6-4f37-8346-20230638e5f0@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Jul 2026 10:34:20 +0100
X-Gm-Features: AVVi8CdgW8uZtfTG3CfbX0on-a2Zg1JVnLNeJcMW-0ssxWgaLotoK_8NUX27qnM
Message-ID: <CAFEAcA-hnm17d4PR0wmaKwQmM-K50nHeRYv0a-pCk3J1qUbPsg@mail.gmail.com>
Subject: Re: [PATCH] target/arm/hvf: panic the guest if an unhandled exception
 occurs
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: Leesoo Ahn <lsahn@ooseel.net>, qemu-devel@nongnu.org, 
 Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org, 
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Fri, 10 Jul 2026 at 23:56, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 10/7/26 17:37, Peter Maydell wrote:
> > On Tue, 23 Jun 2026 at 13:56, Leesoo Ahn <lsahn@ooseel.net> wrote:
> >>
> >> It's worth cleaning up all resources that the guest taking and to quit
> >> if an exception in el1 could not be resolved.
> >>
> >> Otherwise, the guest will get in the infinite black-hole by
> >> unmodified pc.
> >>
> >> Signed-off-by: Leesoo Ahn <lsahn@ooseel.net>
> >> ---
> >>   target/arm/hvf/hvf.c | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> >> index 8b902c6882..4358cf90e8 100644
> >> --- a/target/arm/hvf/hvf.c
> >> +++ b/target/arm/hvf/hvf.c
> >> @@ -2533,6 +2533,7 @@ static int hvf_handle_exception(CPUState *cpu, h=
v_vcpu_exit_exception_t *excp)
> >>           cpu_synchronize_state(cpu);
> >>           trace_hvf_exit(syndrome, ec, env->pc);
> >>           error_report("0x%llx: unhandled exception ec=3D0x%x", env->p=
c, ec);
> >> +        qemu_system_guest_panicked(cpu_get_crash_info(cpu));
> >>       }
> >
> > We should do something here, but my question is whether
> > qemu_system_guest_panicked() is the right thing. We mostly
> > use that for "the guest OS wants to tell QEMU that it has
> > panicked, so QEMU can reflect that to the user and perhaps
> > reboot or exit", though we do in a few places use it for
> > things that are more like "we don't handle this case". I'm
> > not sure exactly what the right thing to do here is, though.
>
> We usually abort() for programming errors (here unimplemented
> case) and don't let the guest mis-behave.

We've definitely used that strategy in the past (either directly,
or indirectly via hw_abort() or cpu_abort()), but I think these
days we'd prefer not to let the guest trigger QEMU to abort().
Some of those cases we've been able to convert to LOG_GUEST_ERROR
and continue in some manner, but some cases are just not
continuable from.

I think we could probably use a better mechanism for "something
went badly wrong and we can't continue executing the guest", where
e.g. we can suspend the VM and let the operator look at its state:
 https://lore.kernel.org/qemu-devel/alSqlDRT9L8OqAso@redhat.com/T/#m9ab2f4a=
819e33cd5ac0f6d22ab30f98a0d599866

For this specific patch: what is the case where we get into this
codepath (and in particular what is the EC_FOO exception subtype)?
Maybe the fix is to handle that case. Compare an earlier thread:
https://lore.kernel.org/qemu-devel/8D0BCB24-BB1B-40EF-A361-0F79D65600AE@unp=
redictable.fr/

If we're getting here by falling through from EC_INSNABORT,
I think that can happen if the guest tries to execute from
an MMIO region.

-- PMM

