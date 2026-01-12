Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810ACC9EC8D
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 14:06:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfIXU-0004x6-O6; Mon, 12 Jan 2026 09:05:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vfIXR-0004vc-RF
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 09:04:58 -0500
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vfIXQ-0001ar-Bp
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 09:04:57 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-792815157f3so11220247b3.1
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 06:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768226692; x=1768831492; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UziT9209levcy8cck8gsNOynkewUOtZyDWNcEauP+8E=;
 b=BL3bztZvUKCwHd4swU5hx9xozr6OUdPzI5E3DyDEqW5KPvBJHdPd+2zoA0EU3biO+8
 Nv5qFNi3/+QXmvIPrgrBatTsr3bJUihlAuXHCu/Ok0dCTbIVDPASA4BQd6yESOMEX7un
 K4Kl/IR622cCaZb8Nab/3uGBWU13uMAvXdf6uR2Qd/aB7XScTaLPR09WKY8gthRsQtUK
 0OFA+HjE1ZdraLqrH9Svfh0fCPiC9sZdxKlxDqj2RB1mjcsPwUR80x0rF8QSlcXogWpR
 cFlJTW00bw//FWYqCwt1AewMPPvphuYr7ZRrH8MHropQNzXWegQJPCz5y2AMK96H6Pm1
 i4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768226692; x=1768831492;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UziT9209levcy8cck8gsNOynkewUOtZyDWNcEauP+8E=;
 b=VyAg3FweysqDKc/ieNxfA4ijbrumxISfLssg5qp16wAdwvamuv9Y3TwrlQSmiAqXt0
 lrdflHpy4x7UN+eKokfe2fwAyF/dVp8Iw9B/iE04uPTAkii2fEfx5JHwEdOd16d88cd0
 LTjl5gEztiYwtra88egBB4H2ta57zgVW3fbvVq8RLzxmi4yjUL3UZX4FBMX58nRhvutg
 Es5MgXESEWUYvPvKAkHozYhjv3jFX7oDn8PPViXERgAlkziEAZpCFpF7zDEOYLb65k+T
 ZQM19jMlwDarvehk9nrO1eh3LYqXTujZ9Azv4VAUvaFsz50iCbgXQ5qlphYyDTEE/hoG
 fTqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRj4MVPv0XKWgBw7iA/c9QYFKUMuopiwbw3LbDo2U4scGs++YRHdZzD2rTUOerB4PUHPXENj9q1A==@nongnu.org
X-Gm-Message-State: AOJu0YyBL2Jj6otRUUHAAQ3ntRTY6QkepSqAOOlhGNi2n6VAvwwBpjsS
 7yv49EvtPdeJEcEOsu1GAO9nC7WKimDdvJ+zleDjYpjbhp4nd429Vr2ZIHtYf0lszvFMFzolYmq
 NntP5pPazHyvxVP6YQDkU4y1fhgJCVfmXrpUEPSBGqg==
X-Gm-Gg: AY/fxX60w6TaxXK2PmCuczm0rVdsRACWUPP+ZxMQR4Lb9QIfcTAaO1eHTm04GjVrNut
 oczisEMPzLKZf3VWXmhHVsvRq2c0OhffgmrNu3rJ1Gti7hjA37EQFEid7uIzyj9j0q5Dq0+zyky
 D55OPraLCXPkpKXCAmXuYFTlg/rvDJAQlglAK5bpU7xNewaff2vzp2MJAnJjPrj/Dmu6AOWPRbd
 i84Qp4522uOac+oQHkerrQbZjYXZQFW38nMRhvcB6VjtbkintleP9s1vaxI0GkNjrmpZ+05JYq3
 2DqmBXp0ahRIirTU9HdbHKc=
X-Google-Smtp-Source: AGHT+IHaWY6mtUI+MKNlCASlBsnCdbvPpP8jKKDOD8JdvnrnBHLfXAXKXOJ1SyXNuG5TW9I79NZBDGkqmXcn+DDAUJk=
X-Received: by 2002:a05:690e:dc6:b0:63f:ac4d:426c with SMTP id
 956f58d0204a3-64716c60389mr14968462d50.51.1768226692211; Mon, 12 Jan 2026
 06:04:52 -0800 (PST)
MIME-Version: 1.0
References: <20251128162306.13701-1-osama.abdelkader@gmail.com>
 <CAFEAcA__=TnXrcprp464uw6VNZKLcSBKYP0oj1T2e33Jysk18w@mail.gmail.com>
In-Reply-To: <CAFEAcA__=TnXrcprp464uw6VNZKLcSBKYP0oj1T2e33Jysk18w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Jan 2026 14:04:40 +0000
X-Gm-Features: AZwV_QjQJ5sdAKDpNqyh-BjZDX8pABqp_2jlqicBTsUe4g6mGxkKvooWcxfxj0Y
Message-ID: <CAFEAcA96T8JJ3K3OaGuhpwgn1A5QwwyNEfx5h4sChON3U_z_AQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/raspi: remove duplicate include
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Tue, 2 Dec 2025 at 10:00, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 28 Nov 2025 at 16:23, Osama Abdelkader
> <osama.abdelkader@gmail.com> wrote:
> >
> > hw/arm/boot.h is included twice
> >
> > Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> > ---
> >  hw/arm/raspi.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> > index 81d2fa1b67..bc723dd7d6 100644
> > --- a/hw/arm/raspi.c
> > +++ b/hw/arm/raspi.c
> > @@ -24,7 +24,6 @@
> >  #include "qemu/error-report.h"
> >  #include "hw/boards.h"
> >  #include "hw/loader.h"
> > -#include "hw/arm/boot.h"
> >  #include "hw/arm/machines-qom.h"
> >  #include "qom/object.h"
> >
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>



Applied to target-arm.next, thanks.

-- PMM

