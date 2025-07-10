Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C402FC83F1B
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Jul 2025 15:20:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZt3X-0003Jj-J4; Thu, 10 Jul 2025 11:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uZt3J-0003Gt-NJ
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 11:19:22 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uZt3H-00012H-FI
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 11:19:13 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-70f94fe1e40so25045567b3.1
 for <qemu-arm@nongnu.org>; Thu, 10 Jul 2025 08:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752160747; x=1752765547; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+2JnUO3M0YY8rGoeSB+tv7JnTpSpken2SRrv3bQ5Jy4=;
 b=z8JCkq08oVQZ8FZZAdHNPGHS+wh0LgATwodqkI8RvzihrFo9uxaahGJxlukE5xVUtl
 Gbl6p9t1CkCUFlw4w5ky3ETFx9LcrLaQ6DAkdCdLu8E9n7WRHdwGq3X/nGhVxBTS64NK
 J6nd2MaWqTdlufPI6kfZdwbnBs4GGcKJ0Me0yfV4Vv0u1iiE1uMuhDAXPGKJF+5yCZl3
 VhuUsyauGNfw1sj7nDGXiq8bXUXWLnviXY86mXkdQ6KlkkjPMIJlouZ3ZGjscoUBJqws
 fJDFrK3+SRfh6ab2qBI4t4fGpVecjd/nuAugOI+PhT4hmJ4C+2idX8WszKmjnJwzhXzh
 U0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752160747; x=1752765547;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+2JnUO3M0YY8rGoeSB+tv7JnTpSpken2SRrv3bQ5Jy4=;
 b=iIgy8wWSaXOOrmwPJ8JOWdOupvS+6dV9geMfa07KtOmerNP2SQ6SzemBH5P7MQML/P
 YbLQ23nOY5d1ToeSnGDeqCnF2EA/eCI5w9IEk0er2NEFK/GNRUCD2uaX9ejHN1E735+V
 1LiaGjvDnYk4MgqmBSxbGdTzzsCdYy9oALGQ8VnU6uVe3a21Q6Z+5UtrxJzSEhwcXwzJ
 73WBEI6BZhL8T0JtMxCU2S2Stvq2ChpXkthDZR9KqABGXmszZYUluJY5dRE2TIwdfdVO
 3MvQamZ+Fsueu0xvblCS+l+XHFdF/8BoXCOAn7YX0gGScDhtYaRHyF3eBP3jwYZjUBuk
 C8Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCSKXaFiPrED2Om5y0uGzguYhS2Vt9swWnEuu5BErr3R8fYNNoYVc1FcLdlqcBOhRyWsRLqIwqGQ==@nongnu.org
X-Gm-Message-State: AOJu0YyEl1xSWXISz8bPjVWA1/Ws9LVp6iqmlWJSJve5z3SUg6JPH0Xq
 FCZlbTW2pXpU3OecXCBnjG65VgFLP8Fk60R5NJ7EzslqhBRKeFzy2bemv82hRg6vPSGJIkx/jYr
 MGKJP4TCN01Syt7Q0K1Jmo5zt0JF1LZwpqSxCCoYR5w==
X-Gm-Gg: ASbGncuOiuINE4DJNGWpn55XppUXyLcSAuB4kPDwbvM5sNUJHrMJUpxg3y+PKjoiWdj
 ksx0DwUdOIdctjGm9TqvMhdDvm5fStXK8QzbFMj6dr0J+7AuSxTFCg+YeRQWO/irzfn4Scjux4E
 nPd9p+5GGjSOdO6qVM0EXdsdPIINopfpUmmd9JzQjAUe46
X-Google-Smtp-Source: AGHT+IH7VzE98NAaYDWBUCzd0xce5lBapm8hKhcHcVWABvn7jOJ81kUkdx68ja5YxLsU4TBy0Bf/jLPsbutF24vRTZk=
X-Received: by 2002:a05:690c:6308:b0:713:fed3:70a5 with SMTP id
 00721157ae682-717c151b1edmr66678767b3.9.1752160747501; Thu, 10 Jul 2025
 08:19:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250707164129.1167837-1-eric.auger@redhat.com>
 <20250707164129.1167837-5-eric.auger@redhat.com>
 <48fca85b-096a-4d1c-97dd-380669cb6604@linaro.org>
 <322a9301-a1ee-4cd9-b423-fbef2fc0593d@redhat.com>
In-Reply-To: <322a9301-a1ee-4cd9-b423-fbef2fc0593d@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Jul 2025 16:18:54 +0100
X-Gm-Features: Ac12FXzxwGzQ-xJuggpfn0Q7XoT7jchqe7Sb1ozy-EXBRk1eeZ9ETYDG526lBRg
Message-ID: <CAFEAcA-BYms8AtBPqaohvoGCwqLem-uXmmxiOczWb-RP5GRa4A@mail.gmail.com>
Subject: Re: [PATCH v9 4/5] hw/arm/arm_gicv3_kvm: Add a migration blocker with
 kvm nested virt
To: eric.auger@redhat.com
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 miguel.luis@oracle.com, richard.henderson@linaro.org, maz@kernel.org, 
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com, 
 hi@alyssa.is
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 10 Jul 2025 at 15:10, Eric Auger <eric.auger@redhat.com> wrote:
>
>
>
> On 7/10/25 4:04 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 7/7/25 18:40, Eric Auger wrote:
> >> We may be miss some NV related GIC register save/restore. Until
> >> we complete the study, let's add a migration blocker when the
> >> maintenance IRQ is set.
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> >> ---
> >>   hw/intc/arm_gicv3_kvm.c | 8 ++++++++
> >>   1 file changed, 8 insertions(+)
> >>
> >> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> >> index b30aac7aee..fccb3886bf 100644
> >> --- a/hw/intc/arm_gicv3_kvm.c
> >> +++ b/hw/intc/arm_gicv3_kvm.c
> >> @@ -827,8 +827,16 @@ static void kvm_arm_gicv3_realize(DeviceState
> >> *dev, Error **errp)
> >>       }
> >>         if (s->maint_irq) {
> >> +        Error *kvm_nv_migration_blocker =3D NULL;
> >>           int ret;
> >>   +        error_setg(&kvm_nv_migration_blocker,
> >> +                       "Live migration disabled due to KVM nested
> >> virt enabled");
> >
> > (mis-indentation)
> Did not notice as checkpatch does not complain.

I'll fix the indent in target-arm.next.

thanks
-- PMM

