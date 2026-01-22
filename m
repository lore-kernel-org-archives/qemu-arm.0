Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450C7D3EE8B
	for <qemu-arm@archiver.kernel.org>; Thu, 22 Jan 2026 16:07:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vixAN-0005Wp-E7; Thu, 22 Jan 2026 11:04:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vixA9-0005Ti-HK
 for qemu-arm@nongnu.org; Thu, 22 Jan 2026 11:04:08 -0500
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vixA7-0001qK-GZ
 for qemu-arm@nongnu.org; Thu, 22 Jan 2026 11:04:00 -0500
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-78fba1a1b1eso21942097b3.1
 for <qemu-arm@nongnu.org>; Thu, 22 Jan 2026 08:03:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769097838; cv=none;
 d=google.com; s=arc-20240605;
 b=SAK5+GhcS3fu6ZQcRVmykiCih+x/MGZ/ZlSRyywvu/DJ8/vdiLrLZlDUAkompn5WjK
 FUZFYQrCTfpYqIg7s5RyEe/SxA0i3sKUbywzmxpfxo3GRNvQw5ftnsUdf40Y77K0Pp4D
 9AIzvhNyHmebsiyUC3tf8Bn0wmyMApi7PiWuvjQ2AORXQLy5PdlebeJarkxG3Ptuu199
 Dx8BcC23y9RLAwXygoS0q/q76R10j8Kolp7XbbYpDtZtPMC08pcY5BmhTg/YUCioel1g
 pkUx+5hPzCuj3pXewPzk1vT1E/5Zpx/U85yi9DXIRH54IxO9MOLs776Vhf2poYzsyO9g
 RQkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=V3h6BN0iHCZPqzNEsP8FQyIesF9/U03y4JkbzQWDoUQ=;
 fh=0J82Nd8Y9NyLUyuU05RZSw6H0J5DHrO6s6If+vV3/V4=;
 b=WBKd4vB+0ynpW81ig+784h10khN2wAczuWfW2FkzE70FqdOoEyriQRGeA4yNTm5zyc
 IC/pbq8PIeIiV5ktJyiBb9OhI77dnbXll5InqVzsBqiDg1qiXVBLzoW5wtd7N7vEtcgb
 RH2+4DrqAGVJDnaFUJgHVuovl0c28a/l+X2wJvfD5PcwKoDaKb4W+Qz6s1gctGL2QCb4
 PJHQlpZiKJGvIigYhf04Difb3aKksJFR/hFcrE3f2ASmgUmsuFlO6kR7zC+mgkgpEqSo
 StweY7eBTkjdS7rbSARqeY9nawK14nH+l6T3jZpNK2xs8QyFm+zbKVmaU3AVVQB0KBcY
 LC8g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769097838; x=1769702638; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=V3h6BN0iHCZPqzNEsP8FQyIesF9/U03y4JkbzQWDoUQ=;
 b=HUshFFzEPGDj/Izr58DM8s03w3QJJJEQEjGf2GrSkbbDqm1wLkt36WIWgRlnKJYFd2
 x+eGyKaawgpm03lrIKHYKmW6bwkaKqD2Cq92K38boukv9/DJda5Ixt/CdOdV8Pt2vUDG
 DtYByu11cmUrYU0IgunnZe6VG/VM8sVhIz94xvbXVug+otLs0Gt9/ZWk4r8/tu+qPZYH
 AAIeOav3rEinAYx/a2ywZwXq5GmN0FZFWerJrAZVbuxC4x1dsFAx6UI7KMaDXJlSRWwR
 zIPtSIwdyHlW2llf5AmBy+GQ5Uzt2X9+CZEa/hXG55mfJxdAC35HtmXAfQJiPWoD8jUo
 un/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769097838; x=1769702638;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V3h6BN0iHCZPqzNEsP8FQyIesF9/U03y4JkbzQWDoUQ=;
 b=PvYIYTg3JNbV4ln8BeQCPLBYZlDM/iOPOE/6GEUsy5DBbjNQJKbcrfBzOQPmODOngi
 xr+IvobTAfW1ow02AqH9Ty3zGqg+FhRmzBFgkH2UG5kldJcwQT2vMVa5WNfV9yFqSSe5
 +uM26sDYgd5sPXzOpVcHaIRl9LGMQwGFhX9Jk2t8ct3vs1KuYg4SDuYY/wgJ2J8bK+mc
 r+QSORCsx3FyrCv5bQQ5aoZ7IfVyqVWqrGguxdRH3hkyBYBJ4562bWgngiAoySb4JVh7
 Ek+dfOZ21iR50Pbh63uLQC4ucHa+ERC19eKi8c4PR4yGLP+H3jiRNvbTVrwNYkb1rR/0
 mxXQ==
X-Gm-Message-State: AOJu0YwOq1dGjxJksQ4weXdPy0FbyoEe/dvBP4Iii57NpKZg07GmS/wq
 EuWTZYh+BEEUmS/7izuzjijxx2imEd+LAQxfZtVFEYm4ODOqcfuNBjd+yMfv/NUvI8MrTPgOrH0
 Ptbk8LYuKJEhy/HtRgpXdcdppgrzy0pqf2k82LE6tWw==
X-Gm-Gg: AZuq6aITyc+uMog2kL5So11QbTH0Oa1pKE29hkHjM4MJc/caC6tTCka221P4m7vU6nx
 a1jBHCjZsGhjggjIPwrmtPwyTSPWXXvwgqpgupMXnqRpE3WCo8R67Kb/S3WKd4LZZC+rNCCU4MJ
 JpBwvpv5dEHqXEWTnJWZYPW7ZDV1g9u9nNtN4Ryoytdvy/KiSNOBgtpyYoJEnj4QV2ViKVLK4th
 xxCOoORcN4TldwLMZTBtGADNBhpveT2Dj70ZgS5ml7DFR81m8BctW7OvZr3h4x1FEAs8w==
X-Received: by 2002:a05:690c:f83:b0:793:ad45:8e8b with SMTP id
 00721157ae682-7942a7bbcafmr28334327b3.19.1769097837444; Thu, 22 Jan 2026
 08:03:57 -0800 (PST)
MIME-Version: 1.0
References: <20260120180339.1416328-1-peter.maydell@linaro.org>
 <c272a3dd-5f16-4821-bc38-5bd60369dfbf@linaro.org>
In-Reply-To: <c272a3dd-5f16-4821-bc38-5bd60369dfbf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Jan 2026 16:03:45 +0000
X-Gm-Features: AZwV_Qh4yk1EtsslVr_pCcfVXvOI6lH5QQPzWlqHkys3d92PVIAstcCZeDmkej4
Message-ID: <CAFEAcA-xPER9Hedw=pnqDy-RYq8gEjo1fMt6bVzJVTHwHfgk7Q@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] hw/arm/virt: Deprecate 'its', introduce 'msi'
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Mohamed Mediouni <mohamed@unpredictable.fr>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Thu, 22 Jan 2026 at 15:51, Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> On 1/20/26 10:03 AM, Peter Maydell wrote:
> > This patchset is an RFC sketch of cleaning up the logic that we
> > have for selecting the MSI controller, so we can add the handling
> > for "hvf and whpx give you a GICv3 without an ITS" in a
> > hopefully clear manner.
> >
> > thanks
> > -- PMM
> >
> > Peter Maydell (4):
> >    hw/arm/virt: Clean up MSI controller selection logic
> >    hw/arm/virt: Don't use vms->tcg_its in create_gic()
> >    hw/arm/virt: Drop VirtMachineState::tcg_its
> >    hw/arm/virt: new "msi" property
> >
> >   docs/system/arm/virt.rst |  21 +++++++-
> >   hw/arm/virt.c            | 108 +++++++++++++++++++++++++++++++++------
> >   include/hw/arm/virt.h    |   2 +-
> >   3 files changed, 114 insertions(+), 17 deletions(-)
> >
>
> Maybe Mohamed could integrate this in his series, once you're happy with
> the result Peter.

Yes; I have the latest version of that on my to-review queue.

-- PMM

