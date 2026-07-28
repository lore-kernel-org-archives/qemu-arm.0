Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76931C53219
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 09:36:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woeEP-0000bS-5v; Tue, 28 Jul 2026 05:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woeEM-0000aa-OU
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 05:36:10 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woeEL-0006cF-8A
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 05:36:10 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-668c1b780e5so4428881d50.2
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 02:36:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785231368; cv=none;
 d=google.com; s=arc-20260327;
 b=gmsimIwwB2wCsqJ8gBMIn1S+RuAkYonkJ9JbRWn4fXHsX8Myq7mOwwq14SMPIbsjtO
 L/az10E+eW0X0cY1ozGMwZtchB7qeitsEwPcSvya980ZYBlXkDjnIoj7JHf9lf8p0M9j
 50X6CGfvK7XG8QUZWMMecyoqna9tdZ+/Ukj7qwgpJI0W+lzfDMN6jLC2HWVjjyHrIVTy
 mfU/BSlN2D5RfXo9RYc3hafB6ldH4tsxIXowbA5b90zaUHjUQ0cza6hDs8JZXeVpD8AN
 mdLqGrXTpF1hCDuc0FP/8sbOujf8wX0ApIhz6BJ72ZC07EQEGA9ZgwnlQXC3+nyj0ewR
 vqlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=bQ8g7wh/VQmeuL3pf7641R7XPUOWCoD/LSEhd20H3PI=;
 fh=aVfbsrNtmFbHqgb/Z20kfeG8GMSZ6yQRHQQzMUisRNQ=;
 b=G89HnlOUzxcp42t5nlv7Y8oHOGHVVKomuSRx3DA3rKhGpEoFQf8azsRCjrPd2NC6Kv
 s25WojlwWDiaFvwbCpJ1TathsSmm6ufO0V09J0GXK3U7zq6qeYjNNvI37rL4OQutuB1T
 1uYbBRf0RJfIjp6bEPMdSGKKNPbVpSYjhTuocxQoG1LzUAyBaseqYMTAsp/zXRJqqgWG
 TC5ixr6Ot3iErPya6emsqpLLdVHrAxjZdWIyTneu3Eu642n9qZJc4bvIs6X+1XLOGIsx
 ewrF3nYjke+yMxvvXdYObLJbs+UuOWUYoeQ+4yn6EPiMx6JxS06M8k1q51eRMwGOUO18
 5UWA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785231368; x=1785836168; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=bQ8g7wh/VQmeuL3pf7641R7XPUOWCoD/LSEhd20H3PI=;
 b=V2T/7LwLJC5hmBfKBTOnBast5vdk92h5CuPYpeCxlHOO/Lv5vfATEKkLf4ghVcpZKG
 cFAgDMg6kUrrY0DG8EiT7vMX26F7hgoIAf0KvK06VJbMXDbRYp0uklSmTNfkh5zT5fXM
 9avPzhYO6BM4f2m6xadC0dS5z3nwfBQtzhA33qXVeuxG1nZ86PewIVWn30eZBcmTck3n
 6hRDkizFCCPoTh1nBjmhBuWfXaXfHfRDYmNdogmnHViLkI/OxZGObRvZL9gumJCflPvH
 w6NHsRwLSpLn0pTdDjmmtUFhfKN7O2GxYPYmnqqpl9Jyt69xJ1pI+aVRftO5zql6oR+E
 tOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785231368; x=1785836168;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=bQ8g7wh/VQmeuL3pf7641R7XPUOWCoD/LSEhd20H3PI=;
 b=hzczxMowAmJ18A3OW0kkxDtu2DX/Ip3icmCPzeYqvVGDdqhxYwwTdl3O2kJ2UJq6T4
 uEzVY/daNnu3vgoCuIR8NX1PEMELs/PnwgtgnqjH2vU6gjN+6aX92nVtby4xS3lBJVxh
 nntztlAOo90extcRhcF6UUFgMZoLgqS3t5JgrGPu5uL8NlbaNbFELw52euKgeMxZ83lE
 1QRUI0hFKH6C3MArLVDYv7lfDXQPicaHiXoUY7Yg8SoeOpHH8qw+NV/Mx6MzpjaUreBv
 XmmcJlychmyQ3B0PZK71u7Q5426yUlevJ6GE/ZHBiV9U3JkkuUwM/dyk9Brd8fSHNbrq
 Yp5Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RodAA2S7/26lrXLj0RuR93KimznsC+n2giZ8C9q5cDYwPYqi+MkZgvuDLcFk6XEXr8MTfWNfAA8tw==@nongnu.org
X-Gm-Message-State: AOJu0Yz5uxK0fUokV3cV6flxqq6qY0IPDbeJZxBqoCsx0EekcftQ04Hx
 lC/2O6+AIzpCo2Xg6Tk8CLpefYnnBysMYMr21bsXWMTEjxeQYFABMS8kIw8RhIS8cJDHmRUxcmG
 2yihC3V2ctKrEtSt/AgZk6PNyExXwrjRBP/gdGBVY4A==
X-Gm-Gg: AR+sD10rYL4ppzcNVkJJ3FD9vxCmKRs87FeGUMPF15BeH04KyufK42qJnsvSSOGMKqv
 PR5bm5nPl8x2+QXAqBxp9wQKZaB9X2aa0KqO1fjeNWmJkMxz1gnewIG7Xs/USWtJFmQ2AkfI0my
 EzIWubKphLPM7Py0iQ+a3CWOyXo1SqGGQ/qGX5FrSFILDb09BjP7FL1HFKGPiJ+FZEu8gHrsucx
 p3Nl5JiBXEZVpj29OEEN+7twSAYh6jH8P6LBJ4WVMlIIQH5gsVJ8t84+bYpZFlpVRv+2G6TfhmU
 6sXKZd8SlltsgL2zWlSpFQ1t9e+0ASc7+UF0MHg+fVPr4g==
X-Received: by 2002:a05:690e:438c:b0:668:8bca:3c44 with SMTP id
 956f58d0204a3-669054c30d6mr414180d50.7.1785231367803; Tue, 28 Jul 2026
 02:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260727032649.145381-1-gshan@redhat.com>
 <20260727032649.145381-3-gshan@redhat.com>
 <CAFEAcA9_tDRAd97z4UtNhFPK+fMbq37LJhWTSmD5cueo61hvvg@mail.gmail.com>
 <0a384d67-fc56-4a21-9d0e-25f218a45228@redhat.com>
 <CAFEAcA9HbTSj9cJfv8o=jYSuPhScr-RVKWCos4kpUJ+T1S6g5Q@mail.gmail.com>
 <13333e56-3725-4550-849c-9035f6925213@oss.qualcomm.com>
In-Reply-To: <13333e56-3725-4550-849c-9035f6925213@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 10:35:56 +0100
X-Gm-Features: AUfX_mxoPQ0uNECS8VRE3JYfpevUh2jVyh0wg_6Tx3dOKzoqW1yLGkxMX_uuWPw
Message-ID: <CAFEAcA9X7SNUvQpwXA2_xReUERB-eBETty3g32-PD=MVk536sg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] system/memory: Use qemu_ram_move() for directly
 accessible regions
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 peterx@redhat.com, mst@redhat.com, richard.henderson@linaro.org, 
 alex@shazbot.org, berrange@redhat.com, philmd@mailo.com, david@kernel.org, 
 clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com, jugraham@redhat.com, 
 liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

On Tue, 28 Jul 2026 at 10:22, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 28/7/26 11:01, Peter Maydell wrote:
> > On Tue, 28 Jul 2026 at 04:01, Gavin Shan <gshan@redhat.com> wrote:
> >>
> >> On 7/27/26 10:51 PM, Peter Maydell wrote:


> >>>> +    test =3D (uintptr_t)src | (uintptr_t)dst | n;
> >>>> +    len =3D test & -test;
> >>>
> >>> What is this doing? I am not a fan of clever bit twiddling
> >>> that isn't commented to explain itself. Readers of the code
> >>> shouldn't have to go off and search for an explanation of what
> >>> is going on.
> >>>
> >>
> >> The following comments will be added for (v5).
> >>
> >>       /*
> >>        * Maximal length of aligned access that are determined by @src,
> >>        * @dst and @n
> >>        */
> >
> > What I mean is more that it ought to say why "x & -x"
> > achieves that goal.
>
> Hmm isn't "x & -x" restricted to power of 2? Here we have no garanty
> @test is, because we have no garanty @n is. Ah, this is catched by
> the 'len !=3D n' check and returns after calling memmove(). Indeed not
> very clear notation. Again:
>
>    ...
>
>    /* Overlapping buffers, unaligned or oversized access */
>    if (!QEMU_IS_ALIGNED((uintptr_t)src | (uintptr_t)dst, n)) {
>        memmove(dst, src, n);
>        return;
>    }
>
>    switch (n) {
>    ...

I'm not inherently against the bit twiddling (QEMU_IS_ALIGNED
on a variable length will do a division, maybe we care?);
I just want that if we do use a bit-twiddling trick that we
explain why it does the thing we want it to do.

-- PMM

