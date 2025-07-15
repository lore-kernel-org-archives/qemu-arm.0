Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41A9C83F21
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Jul 2025 09:01:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubbXZ-0003K8-AI; Tue, 15 Jul 2025 05:01:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ubbXK-0003IV-Jo
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 05:01:19 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ubbXI-0002Oq-P6
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 05:01:18 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e733e25bfc7so4472361276.3
 for <qemu-arm@nongnu.org>; Tue, 15 Jul 2025 02:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752570075; x=1753174875; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w6ZMhxiDCwA2EgPRE5Q6io1wbxy6/gKGnVOrp54CrGY=;
 b=euS0oqz2XFDqoIeKXua8nTNHVCJ25L39YIdEHQTxeihyAmwJl/qUDA+DZT8vks9yye
 lXK7uhnX2KksIeJI754uObn8ckh2ero19QRypaIiHyZxoOD3XcmZp0njQOeCqKw31N11
 zYx6i0JtoFkmhJfAa6AnhuOGoNhAwIc0iDcUqhzDgdu8RtHMBhqt0hyAaeJdNbk1730q
 AZcaXwT2NoBTZOKFhiYp/rJJQ5uQXatKduVsUn4kRSEjOZzwvCUfNrG1r8BZiTwJsXI0
 3tQWLdriIN5fsFT+OWI5/0LFq1t9soqOaV0fCCtEli6ysVkRqQppje1sQhfVT1DomFpe
 BJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752570075; x=1753174875;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w6ZMhxiDCwA2EgPRE5Q6io1wbxy6/gKGnVOrp54CrGY=;
 b=ZXGvO76fLagTGTczfB6gn+ld/dus4BBuAol7TtxQwjAA7yOCXN+oZv/BqjhKWS7c9r
 G5tIQs2HMIHJTCKKX89QDR/42bE2TitR0guGDYSJ/HC4hEY+wTdTz3HvC1ZBXPLNhIy1
 hK5IJctvqOSx8sbi6aMEoA12cnhngk5s6+mBhHN6gj66ugjeS0JlsfsZtItNA3TZc41u
 2W9yyPQSdnOIZQ3Kkb+mFJ/chkBtZd4O9nAXGWhWiShlgRYWqIpfs8m7eGHQJTCvyzOJ
 IJeiwKcYhD/bQWSUHOmBciOqjV2YWMR+9QU/hVoP4PhrjsE19NWMTO6a1g2u8qVENAFN
 GeHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUg8fO7Z0TK+zeSaxXmK7ZTuT6fhjsL821C1gk91Jl/a2KQ8vYrfRnY3vPMXVLdv9jd5WZilzLZmw==@nongnu.org
X-Gm-Message-State: AOJu0YwpKJdEqjByOVtxFFAjpO4ZZHB2trhwmAA5vTTr9eFSpRkvTtET
 DtVtQ9TaR18/akBo8pDAzECBF8KlVL15sSvb1e1tzL063kX1jGdvGqs69xHFVlcdyTc7KxUFbjT
 Qq7tV6MgdTgNtkOfluhnutYkeusIZruHj7KiamgtP6+Liv4nrmc8O
X-Gm-Gg: ASbGnct5NW0FBGsAa2UAKTBFz5kYhdBiWUCZmdDsNKYuwgBiun6uNm21OH2PPrqpeC4
 Vk+k0LVQRbUqX09TGyw08h96hdHNHDhnuTXU1QZmRhqZIYGxYDYfyzBGmwYWd1phJ5gvXc0zEzQ
 m2NqbB+6NFwgZD1kPuNSLVSCaKwt/rsHUKX6Cglo0DX7M6lUxSIr0hTyKZhF0gwK/UF0fIpprjp
 n6RZHm4
X-Google-Smtp-Source: AGHT+IHGnM4mBfw8AOWJSHZ9CKcLI/4akyV1mDhXXJ5jvGm1Wef6JSu9E8fcLBYJ2OzOV7AMMMltmTefKwZykXhsE9I=
X-Received: by 2002:a05:690c:61c3:b0:70c:d322:8587 with SMTP id
 00721157ae682-717d5b8151bmr243774917b3.6.1752570074397; Tue, 15 Jul 2025
 02:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1749741085.git.mchehab+huawei@kernel.org>
 <20250715104425.7a6835a6@fedora>
 <CAFEAcA-ry+zydpTnAi40+drtL8b-eMrVWjh=0jv3Uk2NJGuuEQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-ry+zydpTnAi40+drtL8b-eMrVWjh=0jv3Uk2NJGuuEQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Jul 2025 10:01:02 +0100
X-Gm-Features: Ac12FXwPqil6Y5rjeI_b6JkUyLFd8-rL2ESUHx6MMtY9IzxwLeHBw9NaDpQVOTQ
Message-ID: <CAFEAcA-f03Ua=eipArDKrvWS5SCeeMiXkuhJAQsQ46cNTPdtFw@mail.gmail.com>
Subject: Re: [PATCH v10 (RESEND) 00/20] Change ghes to use HEST-based offsets
 and add support for error inject
To: Igor Mammedov <imammedo@redhat.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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

On Tue, 15 Jul 2025 at 09:59, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 15 Jul 2025 at 09:45, Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > On Thu, 12 Jun 2025 17:17:24 +0200
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> >
> > > Hi Michael,
> > >
> > > This is v10 of the patch series, rebased to apply after release
> > > 10.0. The only difference against v9 is a minor confict resolution.
> >
> > Michael,
> >
> > it's been on the list for a while and there are another GHES
> > related patches in queue which depend on this series.
> >
> > Can you pick it up?
> >
>
> This series was only sent to qemu-arm, not qemu-devel, which
> is probably part of why nobody looked at it. You should
> probably resend it to qemu-arm + qemu-devel

...no, sorry, that's wrong -- the series *was* sent to -devel,
but this branch of the email thread has had -devel dropped
for some reason. Apologies for the noise.

-- PMM

