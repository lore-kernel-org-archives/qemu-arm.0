Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDB5CAC5BE
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Sep 2025 08:28:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3Vh8-0007Bb-Js; Tue, 30 Sep 2025 04:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yulei.sh@bytedance.com>)
 id 1v3Vgy-0006ol-9P
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 04:26:37 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yulei.sh@bytedance.com>)
 id 1v3Vgh-0002Of-Nu
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 04:26:35 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b3c2db014easo485416766b.0
 for <qemu-arm@nongnu.org>; Tue, 30 Sep 2025 01:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1759220770; x=1759825570; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k6GLUUkgLvDZ+Tm+Pc+6u0FXUZ1AzZzv78+xXdVWMaE=;
 b=S7jOANxsly1yfeQ7rCGfngo3SItNS95cDVtgSbwO7c5D60ehhOMzenvp5MM6bG7cin
 DO8TyxC75cUoTiUstdxP7607K1LujJ+n95ZrIENIxzkqLuG0i9Zl87rZA2XXbf0cFhwi
 O6xrBBYD3XkGbfySOzZR/he3pQrP66vtV0g5x+0z6a1Ltpeqk4fe8VQKvoSsVsrwUd5d
 S4eJEEua8C3CxYW1jbqSsc++u51FPM6PgIaYMoIcbTiB+DiFt4dKr4QlfIzPhcAwMN87
 4jkttVKlHM1w6/bEHjFbxLWOHiEveQqbssD3/YNnYdLDkS8ReM1a5ilKgiLYfi1WZ5oJ
 hO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759220770; x=1759825570;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k6GLUUkgLvDZ+Tm+Pc+6u0FXUZ1AzZzv78+xXdVWMaE=;
 b=md8+NTKMXNd+UFzgPCX5BjC9W6ucahSZktDtpqDRyWL0moWJf/UTzlGjPgSekQYOIU
 7DZQgQUhQkfJjZ8eEH33jb9dhyJXkldSXsLHVZ63QZ9GCYCetai5evRJB5o0iPAnPOKB
 ASogVTxvzi3SpspzgKPTGs+HfDJul/WPJMnpaL7+Ap5R7zn0LTmDBjEqD8euFKqzu+p4
 zQrGkxcrEodQ8Yf6U2dFjCREI1baHug1axlqziE6NjZUxcBSm8Y7g/tWkS58B3UW13Yc
 CXuuSPZpvsly5xvGAn+nDoRLzWiceas4/WBaphWjviQTdYWFlMi15GOoUGM5UjSlL6JE
 WlAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxxvpGY2N/X2njLvU13FS/M3g/hDfupziThoI23U6wWQKpoZdOs4jkOM7jfoIktn3ZERxtera8Og==@nongnu.org
X-Gm-Message-State: AOJu0Yz62SCdCFnobNZhl9YLQOTI/fybteSCPaJizzVYmPRapsCT+c4S
 sTKJZyZ0O6IwJlm7bJlmce2hbu84diXbQBMoSEXj3hse0ZpxtVPXeoY/IzRdLpO7DJMyYfC43bo
 OmPzoxqcJGtkIABSVSnJNGpdb0BoFUrBnFfhaNbVHntpVq8+RB3dxUn50uw==
X-Gm-Gg: ASbGncv4404seT64kUWG87yW+T52rhTCNdlzakSGwQ4Fw60Z7KwiXMReZn0sbXV8Q29
 WRNgGQEh2jhD02AuylfjPkEtmNUUdIRv3z8ujvKFoeZnzUqyn/vem8hS3XybuyoQPqvF5vns18L
 Sb+rTEJKCZJED6wE9myRNs5WJkfQkGAQhciwOcYPbKp3eYqp8sbAo7VZW8Bw3gq3kRDKX61egR6
 XLE3pBw3nSMhBRQSOEA+I1XP/Xurs2etu8Y7JSTwPBpWomIKfLCyoqvwSk=
X-Google-Smtp-Source: AGHT+IGaeyXCfToQvvO95i2F+nQ5XV5jW8f7rXJ+cTi870Y05+C9YKmJi7ekmrSHw5jXrLvFg8EnXYgQb2MLJAYi32g=
X-Received: by 2002:a17:907:98a:b0:b2b:59b5:ae38 with SMTP id
 a640c23a62f3a-b34ba545629mr2573260766b.40.1759220770056; Tue, 30 Sep 2025
 01:26:10 -0700 (PDT)
MIME-Version: 1.0
References: <20201025131435.144-1-wangzhiqiang.bj@bytedance.com>
 <20201025131435.144-2-wangzhiqiang.bj@bytedance.com>
 <a3e42923-d81a-40c2-8b17-28d6264d5518@kaod.org>
 <CAGm54UE3D_gd8=iDMkF+nPUqZN5-Mhp-46HONi3Ok6oEkdyDwA@mail.gmail.com>
 <3c61d5e6-e571-40a1-a770-7e9d2f53a189@kaod.org>
In-Reply-To: <3c61d5e6-e571-40a1-a770-7e9d2f53a189@kaod.org>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Tue, 30 Sep 2025 16:25:58 +0800
X-Gm-Features: AS18NWBAFRRzYF4PfjF8d3_IeIAplsh2iau0SU6iGLz1gJ7IO-KwZcVpajPcrx4
Message-ID: <CAGm54UFhhh1DtKkm+X_g4NFUTqSN_f3CF4w4-FnuuouVk7rVMw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 2/2] aspeed: Add support for the
 g220a-bmc board
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 =?UTF-8?B?5byg5YGl?= <zhangjian.3032@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=yulei.sh@bytedance.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Tue, Sep 30, 2025 at 4:21=E2=80=AFPM C=C3=A9dric Le Goater <clg@kaod.org=
> wrote:
>
> Hello,
>
> On 9/30/25 10:13, Lei Yu wrote:
> > On Tue, Sep 30, 2025 at 1:57=E2=80=AFPM C=C3=A9dric Le Goater <clg@kaod=
.org> wrote:
> >>
> >> On 10/25/20 14:14, John Wang wrote:
> >>> G220A is a 2 socket x86 motherboard supported by OpenBMC.
> >>> Strapping configuration was obtained from hardware.
> >>>
> >>> Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
> >>> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> >>> Reviewed-by: Joel Stanley <joel@jms.id.au>
> >>
> >> Hello John
> >>
> >> Would it be possible to contribute a functional test for this
> >> machine ?
> >>
> >> Since this machine contributes little to the Aspeed models,
> >> its value lies in the firmware it can run to exercise the
> >> models. Without functional tests, I plan to schedule the
> >> removal in the QEMU 10.2 cycle.
> >>
> >
> > This model is used in the QEMU CI for g220a in our internal CI.
>
> Good to know !
>
> > May I ask what exactly are expected to do "to contribute a functional t=
est"?
>
> It's a small python test downloading a FW image and booting
> the machine, possibly also testing that expected services are
> up and running, network, I2C devices, etc. This last part is
> optional.
>
> See the test_aspeed_*.py files under :
>
>    https://gitlab.com/qemu-project/qemu/-/tree/master/tests/functional/ar=
m?ref_type=3Dheads
>
> test_aspeed_bletchley.py is minimum
> test_aspeed_ast2600.py is complex
>

Got it. We will submit the functional test script for g220a.

> Thanks,
>
> C.
>
>

