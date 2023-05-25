Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp410067ejb;
        Thu, 25 May 2023 05:44:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Fj+z3uy3LzpV3zSSRxfhShuzBGSsPacMza9fI8QNZvDyJEWunbeZ5i+Y3yned9lfIbjdr
X-Received: by 2002:a05:620a:6541:b0:75b:23a1:367d with SMTP id qc1-20020a05620a654100b0075b23a1367dmr9417384qkn.62.1685018650021;
        Thu, 25 May 2023 05:44:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685018650; cv=none;
        d=google.com; s=arc-20160816;
        b=Hi10wA9ZQYXS6RyVKrm0pewBdNvyfehX+Od7r217GvyVKfcBJ23D/Fbky2jNM/AXiP
         jxzKsAu0sbcEXlACJo78QpJuHeI+0gQ+VkZaJDwyKtyel9VC9vZhH4eVU1kqS3ReW9kp
         lVzmChIuQ9oie8J92Kea5lP2G5jWU+6TJy9M/sHA1YIxX3yaiXtXhQQ1o2rRKKeb/JMx
         TyDlxEpocl7xves133KgzB12GtpyO+AcXMFD28cFhklo2l7Uw9Xu7CDtf6j5O2qLICzY
         vteKfUA0yVBFxryt9qGqj/7Fs0qDq2OQpc1aeOFA1YloMtw3pAwNppOpWpcLRSibtgRJ
         KfjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=HA/F61vPeDrWGjErZmjlvsJKcEf5NVSbiqdZpYg9p9Y=;
        b=vht9Fktk0liX/QfnshwLGzI5vULjv987n7936U1OhUgN1G+jTMGq73CqKOHeuQwhPF
         TmJbmA8svaeoUH9zNeHLqC0DM/Kh95HFb/Lj5qzMIkJXd4BGuX1XWxrfYz5Yv4CStq/b
         FzPBvAu9QgDqWHN1756RvGlL6KAf2ussOkrznSA2wD86RlFrHPq5LQL6j8XWgUsLqTjk
         O2ehsIOCzFvQA3ROMQbXUjfpn75daDpDDMOP1T+1KKjF+YxUrDqQFwL9UxXzNZd6UNmo
         l+ZK43IlePGgHzAuYueZlHLD7139vKfo/36tlMxkUdb5xeFYf4PbVb6ntGqWUq2qYoNw
         6ieA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ap4kOfp5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f23-20020a05620a069700b0074ac8fb7061si442209qkh.508.2023.05.25.05.44.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 May 2023 05:44:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ap4kOfp5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q2AJw-00055A-Ku; Thu, 25 May 2023 08:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q2AJt-00053d-IO
 for qemu-arm@nongnu.org; Thu, 25 May 2023 08:43:53 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q2AJr-0000Sy-H6
 for qemu-arm@nongnu.org; Thu, 25 May 2023 08:43:53 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-510d1972d5aso3799232a12.0
 for <qemu-arm@nongnu.org>; Thu, 25 May 2023 05:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685018629; x=1687610629;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HA/F61vPeDrWGjErZmjlvsJKcEf5NVSbiqdZpYg9p9Y=;
 b=Ap4kOfp5QNIRWGZJuY8IJfMF9AYF6RtLJ+8AtZYTBgrKyrLCl1MZvmUyeP8qZsclLh
 oNiotE3JtovoWZ3b8gCagWTWGkAzJ3CGCX/jR/+qy02E8UFsi2337UZaR3lStdjFTQdE
 bJY6BV7WhlhJqJmCEKkCOWieOoyOiunKd1APTGsoZo74EBNskIP0vFtFdOjKXthR+eYa
 DvIPm+Nrgl/lWahI5s525NGfNnbfwHm9i/bAhFHrYbJJCYqhEQEhvxVq3GaJ3bNJKeZf
 CcWHJUI85e+RQXlkkclq0LwZgfh6LWiBLTfJP6YWKpxcYdxEf4xkj3Wn4vBsDfedw/6y
 8/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685018629; x=1687610629;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HA/F61vPeDrWGjErZmjlvsJKcEf5NVSbiqdZpYg9p9Y=;
 b=CPfyOu49XfGhoGYBzqhZP48cq5aKVhKdI7lnTRQVtknzq/ke73K+JMBCisewyIJKC8
 wdTBadIkSjk0IETk2Erxbp3lZ/i6eDGz31/ZTytUV0GpFMwFhadM3FjlEJgxdB80O3yx
 w3fq3ryY0Ko1yufmluFe6QMcqZGi9wKSLx3S6G1sIPhT3Jpp2nnDiLAbuJlS7Cg+niVe
 /bbJb6x2AzwNN7ItqdkWxY3vKKf17Fyz86hAhjwtzoOcvbLErevoFYdJa4Yv/CSxQH/i
 9u9WSIe2l7MGmEegFg7o03A4j7WVONoP3B36FSx7nUUzYkNgKVQxJ0y3nxhmFcca8Tek
 Aw+g==
X-Gm-Message-State: AC+VfDzXFe80y+WbJWii/2ld03snPZ4eitPcC36Q2vDNucHqcogZXrq6
 wSXClyQNoA1yrNq2Ud30UGb4BVAMawXrUDTHjL+YpA==
X-Received: by 2002:aa7:c949:0:b0:50b:c62f:9ff0 with SMTP id
 h9-20020aa7c949000000b0050bc62f9ff0mr3368720edt.30.1685018629652; Thu, 25 May
 2023 05:43:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230524145906.33156-1-philmd@linaro.org>
 <20230524145906.33156-2-philmd@linaro.org>
 <78cc4cd6-f961-a271-6d00-b04d5a5732ff@linaro.org>
In-Reply-To: <78cc4cd6-f961-a271-6d00-b04d5a5732ff@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 May 2023 13:43:38 +0100
Message-ID: <CAFEAcA-BocRfJ4SmA+Sy0t+LUrVvPkbRW9gGfGjG0Le-UFyG7w@mail.gmail.com>
Subject: Re: [PATCH 01/10] hw/arm/realview: Simplify using 'break' statement
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: UiYRIFgsWqjQ

On Wed, 24 May 2023 at 20:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/24/23 07:58, Philippe Mathieu-Daud=C3=A9 wrote:
> > The 'break' statement terminates the execution of the nearest
> > enclosing 'for' statement in which it appears.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > ---
> >   hw/arm/realview.c | 6 ++----
> >   1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/arm/realview.c b/hw/arm/realview.c
> > index a5aa2f046a..a52ff35084 100644
> > --- a/hw/arm/realview.c
> > +++ b/hw/arm/realview.c
> > @@ -88,7 +88,6 @@ static void realview_init(MachineState *machine,
> >       I2CBus *i2c;
> >       int n;
> >       unsigned int smp_cpus =3D machine->smp.cpus;
> > -    int done_nic =3D 0;
> >       qemu_irq cpu_irq[4];
> >       int is_mpcore =3D 0;
> >       int is_pb =3D 0;
> > @@ -294,14 +293,13 @@ static void realview_init(MachineState *machine,
> >       for(n =3D 0; n < nb_nics; n++) {
> >           nd =3D &nd_table[n];
> >
> > -        if (!done_nic && (!nd->model ||
> > -                    strcmp(nd->model, is_pb ? "lan9118" : "smc91c111")=
 =3D=3D 0)) {
> > +        if (!nd->model || strcmp(nd->model, is_pb ? "lan9118" : "smc91=
c111") =3D=3D 0) {
> >               if (is_pb) {
> >                   lan9118_init(nd, 0x4e000000, pic[28]);
> >               } else {
> >                   smc91c111_init(nd, 0x4e000000, pic[28]);
> >               }
> > -            done_nic =3D 1;
> > +            break;
>
> While I agree this preserves existing behaviour, it doesn't seem like the=
 logic is
> actually correct.  This will only ever connect 1 of nb_nics.

Does it preserve the existing behaviour, though? I think the
intent of the code is:
 * we only create one at most hard-wired NIC (the lan9118 or smc91c111,
   depending on the board type), and we do that for the
   first entry in the nd_table which specifies a matching 'model'
 * every other NIC is a PCI rtl8139 (or ignored if the board
   has no PCI)

Maybe I'm misreading the current code, but it looks to me
like it does this: done_nic is a flag for "did we create
the hardwired device", and we only create the hardwired
device if the flag is false and the NIC model matches.
Once we've created the hardwired device we set done_nic
to true and the if() will then always take us into the
rtl8139 part.

On the other hand, this patch using break means that
once the hardwired NIC has been created we'll exit the
loop entirely and won't create any subsequent PCI devices.

thanks
-- PMM
