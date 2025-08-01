Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EEEC87FCA
	for <qemu-arm@archiver.kernel.org>; Fri,  1 Aug 2025 18:23:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhuP5-0008NQ-Rw; Fri, 01 Aug 2025 14:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uhsml-0006lR-P8
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 12:39:32 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uhsmk-0002l0-0Y
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 12:39:11 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-71a3f7f0addso22615867b3.2
 for <qemu-arm@nongnu.org>; Fri, 01 Aug 2025 09:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754066348; x=1754671148; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3jwB5SndLxSLn3CLa2Zip2Nya51ZQdcQ0VG/1UijsEc=;
 b=tbcGf8x3cpei563iriQbOQng+9XGViv5qTf0zvoeKle3+hDkGVvcWqUnDszqJcBchx
 NXrG+qAshjXV2VEfyFTIzONbtv+TPHQHcuLcjECUHUCb4H8wz2hVXktWRwS+4BUjpQ3W
 urd0mtPs6kpXwQEFOjbQ5IkZGxXicjGTfsurpFYJBlVoByt6BK68QmXoL1ApHesLn84j
 CCO6kzLrNOfJcM4RibhCwpO39YCq8ev2bkNh5PfqxCPwWvBAge0iHiPjmVSTzkCVvfrS
 sOlY4HS2zDb46PPo22XL0DETFrrXsvd+gOIlqV3Dnvoxt3yP4wutJN+2CzDoC6W1w+S5
 P/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754066348; x=1754671148;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3jwB5SndLxSLn3CLa2Zip2Nya51ZQdcQ0VG/1UijsEc=;
 b=dnA120spcdUFCxt3urKZuSTTRwweDlHYYc0rHpmA2FHxP9b2MI/4e0pAlq3ttFKGcF
 1ngKw7IRSChFRFsDwS5ro/XYd1JKwGbeEnwEGQvETkB2ltEoxFG6esLyqOwE7TGLvs/h
 rI7+ArhsJbB/IXi9u9Tx37ZmbI5xhjHpV+615wpHL1lA6umOA2Yi23SVxn78Yg2H/wXP
 gkwRmqBziSNXDuMYfZFgZQag9kstIaJ0L6hKYM0furvxw5vhoF9jhrcSJbyhaNUwy3Ms
 Ud+MIRL8yfDO6iqKsKo5QmfGIhvlGnaOKoVuozG8DwyHL2ac7f1pjhyKTiLfZWJJ55JH
 6/EA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcBtI1CENrLlDOQrpDBX2Bw3160p1KekzWOdYMuv6MGG9ljyfQVB/wcqb5KiG2bb+Gx9VWj+gxqQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz+RRDFlkCcoH7orvJOjW75Q/CXh9BJj2+vWwGiqOJaEo7VTqnJ
 Z3CeC46Ql0KTcZbJV3Qjdl1FEXyOhOki71bsOfukCceoPYCE7kuRogG5m5nYYDM7rBP/ne5GrLn
 UG8fIp7rqdW17UwCW/gICbRKd4V0FdNCZmQBSM/FcUQ==
X-Gm-Gg: ASbGncsbojIQqiO53tWhtZzAekWPz9X8OlIbJVnazJ6KvNpwwuhpJA0L6dbtyaV9Wxu
 0H0L5d3Ywx5N3l/fkrLszz0h8MC89S38x5owQm41uMmEl2/iHvwu8Ro5oeyLp6HP0sNlt7il/rJ
 WROvlY9z+Jm5FFlDBux53GfWYQeDh4GNAtbo7Nny5P/NziA8LbIH5dqmoqmLWINgH4YTjaFVBtg
 4sn1t2yK3xuDI71iOA=
X-Google-Smtp-Source: AGHT+IHPmiIPWJavlcndnHVMaLRgwax8Bwr0A9pnQsMWSTfQB8X+Jlek3dkVq9+4ljBrBDOrq7o6kdd7Wr94S2KErJc=
X-Received: by 2002:a05:690c:2783:b0:71a:3c89:d132 with SMTP id
 00721157ae682-71b7f5f35c8mr4036697b3.37.1754066348358; Fri, 01 Aug 2025
 09:39:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250725201906.19533-1-pierrick.bouvier@linaro.org>
 <bfdd8821-a7f7-4648-a389-124426da6d15@linaro.org>
 <144f0930-af30-42b0-849c-99242d3f09ee@linaro.org>
 <CAFEAcA-ycO=AO8UO+X3f6pw34J=iFwW3dpPyMXKm5BzJ11dt5Q@mail.gmail.com>
 <25fe9c70-be00-4884-8d91-53dfff745cb6@linaro.org>
 <CAFEAcA8qHUT-0k6chAFZ61J=YZ7xLvhYgqsgtQiCgkfaxfFRxg@mail.gmail.com>
 <034c953f-dce6-4068-8f93-05e758e67703@linaro.org>
In-Reply-To: <034c953f-dce6-4068-8f93-05e758e67703@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Aug 2025 17:38:56 +0100
X-Gm-Features: Ac12FXwzMw2UMBpy09nEG-t1hw2KeO_0GDieial8QRGc_voE-8FInLNSetqqNpw
Message-ID: <CAFEAcA9H4WtVUuEX8kf8LiHQ3Z421Fq3ukbLnCRRfUKLyRF6QA@mail.gmail.com>
Subject: Re: [PATCH 0/3] single-binary: compile hw/intc/arm* files once
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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

On Fri, 1 Aug 2025 at 17:31, Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> On 8/1/25 1:34 AM, Peter Maydell wrote:
> > On Thu, 31 Jul 2025 at 19:30, Pierrick Bouvier
> > <pierrick.bouvier@linaro.org> wrote:
> >> Regarding the "modern" completion support, I recommend you take a look
> >> at it. Even though you wrote or reviewed most of the code you navigate
> >> in everyday, and thus don't need it, it has become a standard tool for
> >> any developer, like sanitizers or omniscient debugging. It's especially
> >> interesting since those tools are based on compilers (clangd is the
> >> standard for C/C++ nowadays) and not a bunch of clunky regexps.
> >> It's even more interesting when you learn a new language, like Rust.
> >
> > I do actually have clangd enabled at the moment in emacs:
> > but my experience is not good, because typically what happens
> > is that clangd runs itself out of memory and falls over
> > fairly frequently, or it produces obscure error messages like
> > "LSP :: Error from the Language Server: trying to get AST for
> > non-added document (Invalid Parameter)"...
> >
> > So I mostly continue to investigate code the way I always have
> > done, with grep.
> >
>
> By any chance, are you using an old version of clangd (or an old
> distro)? It has been a few years since I didn't run into any issue with
> it, and it's quite easy to update it using llvm apt repositories without
> updating your whole system [1].

I use the Ubuntu 24.04 version. In general I try to avoid
using tooling that isn't packaged by the distro: it
tends to result in headaches later on.

-- PMM

