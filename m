Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp769219lfa;
        Thu, 10 Jun 2021 12:09:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1FKM9IcebWCPiZIJe20b3TrM5egIlea+ys69SP60JrOjWvHXa65Bo5UeE6mRwdoK0qD8s
X-Received: by 2002:a50:ce0b:: with SMTP id y11mr9089edi.356.1623352175793;
        Thu, 10 Jun 2021 12:09:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623352175; cv=none;
        d=google.com; s=arc-20160816;
        b=cJnk9WpFSzCB897c21Ijx08N/fjF2JJuB6OQYueumbLoMam3uFNcflCsUuFmB1h+4D
         E21I5ByZcUIkrAt5lJt17+OA+eedxNbGY+PDBNgXYJbYntQFKnn9r5La4ucyty0u2vkS
         v+UCZDMYtEKB3BDgite9bcOKdnnESfHIc7OSa5K9nWDNroc4cDbsOctd+jIH5JM3PBpC
         6ksjYnzOgE7wJAI8FCHmWj8RPm6hFXtd/3um0DahBk5PJ+YoiQ4wSktb+crNxvPS7fTM
         r1d8Li1MATvoLafrtLtb9FfJG1r3Aen6hoprgX64yMQ0OzPIGbY4UNh5TStDVOP8vEeK
         2Rxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PoR1hE3Olfip3z0NofjDscUf1eIC0FJ9k+LWBvMJzzE=;
        b=KqHTeSNPxpOZY+FDkslTnIXXvxG1qt3YUL8wyNtLT6R1CuMubdWv0NmOaGD1RQ1OVV
         +yAEWUOuu3nGS9T/F8DnZA8b9wIYLeR2GdnXFMXC/eHTvRByNjui6fYsEPhPn98I1XTk
         C9gqIqttI03SicGcYGtqHq44GZnvta5WzOBQa2UQkaROlEyFgYATG3z4RWswoyHIfT1z
         0OO195lpNCFvfNNuTdtXFAtEG80GwWVZyHGR2CW8luJ8MWcD/r3uaDiD16zpxNF/DXF9
         jefqoCjublhBtT7qe+bLPkBoV7ZKnzEcLE0LlUWOtIxwPw1aeg0UNmgIcy7GoOxyR2Yl
         n/Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="i4/zwVNg";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7si3190916ejo.265.2021.06.10.12.09.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Jun 2021 12:09:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="i4/zwVNg";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lrQ3a-0002iZ-SU
	for alex.bennee@linaro.org; Thu, 10 Jun 2021 15:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrQ3S-0002iE-Ki
 for qemu-arm@nongnu.org; Thu, 10 Jun 2021 15:09:26 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:43864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrQ3Q-0005oZ-Nl
 for qemu-arm@nongnu.org; Thu, 10 Jun 2021 15:09:26 -0400
Received: by mail-ed1-x52d.google.com with SMTP id s6so34300937edu.10
 for <qemu-arm@nongnu.org>; Thu, 10 Jun 2021 12:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PoR1hE3Olfip3z0NofjDscUf1eIC0FJ9k+LWBvMJzzE=;
 b=i4/zwVNgKlSzJ0mRUQBvwmHhjRh7tsw/t4XUeMrgmNU6TCan/zVAvc/4R3aICt91I4
 8zHDlOfRt+7oKGMpE/TTamVpwG6CNUtYjfAuBPKbJoCeWsakAZUaEChlFs76RzoD4yu9
 QFTKHjj86p6ndW/+IwSpdPJVfi2B91ptrRV2jVxgL4JHuWwC2pAl5VjaFJUYD3GBGfKK
 2jV0LgNlVEMJCDP7aEq6pZrketOT9r4+yEB9Br/NaBMeuYfKbsrWDtmy0SkiPOJwOtV4
 uxgo1lqc2gYlCKB/faIuLzSarV55P8RnwhDB5ItVP+nh5u5ur+pMYRRSy5LPLXw16IDp
 Gffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PoR1hE3Olfip3z0NofjDscUf1eIC0FJ9k+LWBvMJzzE=;
 b=jNXwD/jgrkqOnYGse2kgGmLk0FfuUtOhPez7Y/pSrmSkTKs0QLJJO/RsLrdO9tlBHJ
 OL4VwAPR3etuqsyl3fmPlq2s9JOZgpqWbMI+qbYXPDHWur6dI1U5mFoFgLxjue555wz/
 Q1DSnsr4nXugAnkkyp4XEGbJZyu6ccdGEVPAWc9dpbV7Pm+c8uZPrwdEJFuX1PGuCbhO
 wNASyWRoTna1sbXqD9jHxwfHbe/NqTu+Kn4lZvBbWnU2s65qWhDkDYA0b7wZxCV+aafN
 PLWJ/5HtlZSdFYmgVgwX1IldJiV47XLXTx8/cnG7VgrykM+PgPYDLwjm+NXaSVivQMiL
 C/QQ==
X-Gm-Message-State: AOAM530yK8U77t5wlgo2qEKjcKgCrShWpIpK+aoRV3Ikr0SrqKauAu6H
 tCePsTj/DXpsUKwVhenx6rzN+VujYZ9FGmqu4g3x6g==
X-Received: by 2002:aa7:c857:: with SMTP id g23mr35774edt.100.1623352162024;
 Thu, 10 Jun 2021 12:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-50-peter.maydell@linaro.org>
 <5b0a7b23-7e96-4d0e-abe9-5f137da131da@linaro.org>
In-Reply-To: <5b0a7b23-7e96-4d0e-abe9-5f137da131da@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Jun 2021 20:08:48 +0100
Message-ID: <CAFEAcA8UNnD_gzdNTAVb=Qow7rLc_a7W7r2H37MBz=+e-JSVwA@mail.gmail.com>
Subject: Re: [PATCH 49/55] target/arm: Implement MVE VQDMULL (vector)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 58rV8URp9+4v

On Wed, 9 Jun 2021 at 21:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/7/21 9:58 AM, Peter Maydell wrote:
> > +++ b/target/arm/mve.decode
> > @@ -39,6 +39,8 @@
> >   @1op_nosz .... .... .... .... .... .... .... .... &1op qd=%qd qm=%qm size=0
> >   @2op .... .... .. size:2 .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn
> >   @2op_nosz .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn size=0
> > +@2op_sz28 .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn \
> > +     size=%size_28
>
> Move this back to VQDMULL[BT]_scalar, I think.

Why? VQDMULL[BT]_scalar uses an entirely different format
(as a scalar it uses the &2scalar arg struct with an rm field
for the gp register).

-- PMM
