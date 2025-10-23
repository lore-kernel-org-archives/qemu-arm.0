Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2221FCCD1BE
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 12:17:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBuFY-0000Q1-RE; Thu, 23 Oct 2025 08:17:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vBuEx-0007Hp-QV
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 08:16:26 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vBuEu-0006Gx-EG
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 08:16:23 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-63e1c0fd7ddso774343d50.0
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 05:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761221778; x=1761826578; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OYqjNLINwpX2szmtdaLJYoEeEau05KENv0pqi0ZBucM=;
 b=zKn0CMER9JhHhgRoehgTy09N3ZefyH/z8TESd/Gfsn/59RlBeThPYTAyXAG/+9/CNP
 ETRxt7xHUVnb4ojAiv7OAU1SsDvFtlqqPPmNlx/ljMGd4509BXPI3x96aQlcUpvnLGea
 O3T28nRgvwPd3pY6i1iA3WpZ1E7xU0/F8Xu0aAdgAeNnM5fPLiM7/DD+1qPEptWp2fmQ
 C+MEqNNU63AjoUMpuzmp46S10TmbxLwRp6ukmtHWU/H7OmO+dm2zFh+Nkkv4q5n8aTGt
 ZRLZa1o7sblsyF3W2R3yfBfKvZhxzp5yGlQf1L73omxngvvVel7x3B72l6QKLfQUqP0a
 F0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761221778; x=1761826578;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OYqjNLINwpX2szmtdaLJYoEeEau05KENv0pqi0ZBucM=;
 b=iPf8g1Koppk0ULHaFoxUDD8VO3okU933tFB7wFCs9QLcou61p0ffhlkVK2LaVve8MJ
 8iyASBXdgBDwLOiPvsitIKuWg+ISePr4Fhz1X8bJMi58fN/k4kqtNQ2BhBjW5U9rE4Sz
 Wcblp9Ky3a8My302ku0wZHqx+8T+ln5jqjIpEroX73rFsArSw/qV5PeJtGHPRZLi9xSV
 lWi74YxIm3ZH7kG6BCVD9L0+8rVJJYYd+R0C7A4IqIuULcHF55kbo/VJ7VOR0s0XrPET
 gpbezmzwvUQ9waXrqyebTiqAMKMZ7NO8ipaKV/aCRvefrWDTFJNpq5MW/NKVdIgRMTbB
 si3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8f7lU2erg+gxa3ddjWaNOPbSzaa6cGY6084OBIGa2m6y2TvRUyqB497OhcpZz2t57NPxIjUnoyg==@nongnu.org
X-Gm-Message-State: AOJu0YzzhNSYUEhJqEbUvsyXoK9wUlfWKVqzxXH9yl+tg7rE1xaososm
 rQbJLiDAcvskNBq9SEIjNS0MJ4YSUwFlczUkMmCCQx/GDcXDaiDgr6p3VIzULKH2mZtY74Ifd7P
 qx9gUlWgqPGNrSBIW6D3p8fnz7YrUWuTiCkvY9FXvog==
X-Gm-Gg: ASbGnctN4qs3K3Sbruacx2zm0XYCbWr96z3rzG7ZkPch461z55tBWznk8NcQOzhRk+w
 2G71I3JZYINQd0jkSSGVLz/nadY8PBqcrnVFxB6irdKGWjaDStiv3XVuoRxGCvuTOrQiDG2L7Ld
 fE1zJW0U92zNMZizCTqFNI4ZR2pPnJKvlhlRZ7jZYWSadUll2eNut/+NmIOFu63UBfOGwjF6wEM
 o7UKP9jeDEhVsh54UIzEzV5B6RQO3QG1v9Vl7snYNZPikreMpDJZwzg3b4jS3PvYaX/Yq62
X-Google-Smtp-Source: AGHT+IEiLIIW68V1fqzLte4oP+NWpVEw+rvK+ML1Dh5hEK9jBH1bTjqE33rdxMrVMpKhGJ+jvReQFWrLaxt5CvrToSE=
X-Received: by 2002:a05:690e:4197:b0:63f:255e:a45f with SMTP id
 956f58d0204a3-63f255ea65dmr7174570d50.38.1761221778461; Thu, 23 Oct 2025
 05:16:18 -0700 (PDT)
MIME-Version: 1.0
References: <20251021205741.57109-1-philmd@linaro.org>
 <CAFEAcA8A5xa0nJUczM_BDCvVu+sP-tdbt_CxDGos6hKW27qEZA@mail.gmail.com>
 <a244a654-7bd8-46cf-bc55-87ab5287bda5@linaro.org>
In-Reply-To: <a244a654-7bd8-46cf-bc55-87ab5287bda5@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Oct 2025 13:16:07 +0100
X-Gm-Features: AS18NWCNEC6VA1mKUI9demB1yaNupA9PEd2LQywVJM_36-n8rsw2v5RhCitQEOU
Message-ID: <CAFEAcA9y29qsC4UQLjO+sJ5TLiA7FqtBTKwUAaQhq8Bz+WX+2g@mail.gmail.com>
Subject: Re: [PATCH v7 00/19] single-binary: Make hw/arm/ common
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>, 
 Luc Michel <luc.michel@amd.com>, Zhao Liu <zhao1.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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

On Wed, 22 Oct 2025 at 15:03, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 22/10/25 13:50, Peter Maydell wrote:
> > On Tue, 21 Oct 2025 at 21:57, Philippe Mathieu-Daud=C3=A9 <philmd@linar=
o.org> wrote:
> >>
> >> Series fully reviewed.
> >>
> >> Since v6:
> >> - Addressed Jan comment
> >> - Removed aspeed/raspi meson patches
> >
> > I'm assuming you'll take this via your own tree like the
> > other single-binary stuff -- let me know if you want me
> > to take it into target-arm instead.
>
> Since most files are hw/arm/ related, I tried to get it fully reviewed
> before the last Tuesday before soft freeze so you could queue it;
> however it is based on my hw-misc-20251021 pull request, which isn't
> yet merged. I'm happy to merge myself, but would you mind to provide
> your Acked-by tag?

Sure:

Acked-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

