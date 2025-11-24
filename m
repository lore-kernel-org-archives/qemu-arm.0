Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC57CFD313
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Nov 2025 17:07:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vNa1w-0000I8-KH; Mon, 24 Nov 2025 12:07:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vNa12-0006OS-BS
 for qemu-arm@nongnu.org; Mon, 24 Nov 2025 12:06:17 -0500
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vNa0z-00045H-KC
 for qemu-arm@nongnu.org; Mon, 24 Nov 2025 12:06:15 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-787e7aa1631so62123287b3.1
 for <qemu-arm@nongnu.org>; Mon, 24 Nov 2025 09:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764003958; x=1764608758; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AMcfu2h4bevoj0RykyRrAeEPkRNFg8Ac4Sz94eecfzo=;
 b=SVrFK/Q++cUGqeMuGenQWmyLnfvYl/FcMMuPKcZWuJDm+mnFtprM6q9Fc5dj+G+Tey
 StaNvRWJZJw5eg7WBDkkiBGU5oYknwefJq5xDsLN4Co7NW1DUzcNRn+R1yXEeLGpvsM9
 Xm3TivUTjN9ixmFnSfZxZWPzIMiWG+5kYB8c41gSCWSEsSggmpXgY+qfPtWDCGnH9kiw
 idPM7Ew2JWtwmAo5Q9u9N4S3zgp0C29RAin5SJ8ZivJoe10k8Dm/92ZVIqsCpZsIg0qI
 OnIwTQrQKefffx/7P8XAbJHcJDeLP3xopyLMuUJXCH6rvmfOPOdcpqfQBAzrYEVILnXB
 lA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764003958; x=1764608758;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AMcfu2h4bevoj0RykyRrAeEPkRNFg8Ac4Sz94eecfzo=;
 b=t4FETibskoaImOA9jO3ZCFflJF7KudpXBpxB6RI6wQNvRlGdaPgKEIZ3e59kj0VayF
 d54ANel6EVXCIPcuvhfxmj9giBZWWZrNsZq8xeyPJFAKQkm33c6sceBNhhIFkbx/DHyu
 QPoGO7peBqLjLYsWYEuauwKGvl8iaKkttCo199JWgx7y13BkeCfjQvPTs30+xc0htyyv
 6UOU5QCwYm+3paGIoLh4dtlRCk7WVQsNFrXFiYd+dbC4eF3EJfz9Tgu4E/5aLn84ZoQT
 qIenKB27bl5/a4bvq7NHUjLAY90s2rK1LmQ6Gz3fv7R/BkCwTbpBB6/CabOH56OKdAlu
 o8kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7zN9+HwnAQ0bNW9DOqbQ6hTEllR1zLEDK1R0ZC8xnFalLAKtaoVj9T5tK4/RXYjnETm7MFCZ6Cw==@nongnu.org
X-Gm-Message-State: AOJu0Yx3xLRnPr5TPhQ6u8f0hSBt8Ly79W+ZhNIZtm48Z84g7dtZY7JP
 GcCwdY9H5iecRL1vi2IimOVZurNXDnR0evSOddcmYFIL1BsX/haFCgpyvDDBATyf5x0BMJY+0a1
 NlTcUwLtjPXLZv5zTcITeeDLngGx41w8gk6aLTNI+oUs92ZPmsdmso0o=
X-Gm-Gg: ASbGncslRzjb3IJFj1XyzLm3+7UIJMYlmmCScRHZj2s3C7jJV28u01TTtci7G8FpluU
 p4H7HN/ATk23oOduaqrCcEiJQZwC9OMZTcNKs9+DCfL75RK0SOOZG5frQ9Y3+F0zeKcM7iYKADe
 0ndnutt6GQ4pcJgSDk04xto5LxYc/NdDtkEx9e8elgvpU/66rYcx+MIEVDLaarayFKOxDxqabzQ
 qHDvvoajV07/4etAtSDE72xKLKy4+jrgLNR5hpNq4kLKjOrdYjpOiLsXNsUdygY/Cl+AdGf
X-Google-Smtp-Source: AGHT+IGrNE0mNX8XVsAvxmQmsLaqA/mtdbfwCV2rh+VjNztxXWWD3xBgac4yGK2A7BNesdMUOKTfEJzYNSXnmeUPUuw=
X-Received: by 2002:a53:d005:0:b0:63f:b6c0:23f8 with SMTP id
 956f58d0204a3-642f8e430c1mr16487535d50.33.1764003958498; Mon, 24 Nov 2025
 09:05:58 -0800 (PST)
MIME-Version: 1.0
References: <20251111102836.212535-1-corvin.koehne@gmail.com>
 <20251111102836.212535-2-corvin.koehne@gmail.com>
 <9bc047f0-1122-4381-ab5a-01878a10297e@linaro.org>
In-Reply-To: <9bc047f0-1122-4381-ab5a-01878a10297e@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Nov 2025 17:05:46 +0000
X-Gm-Features: AWmQ_bnx4AQTpBZhl2nOLh-u7rfw-4-PkC72NCq7FkZ1J5z1JYlvd3GM705Aya8
Message-ID: <CAFEAcA_UHmXA5HGmvYEucxXX8uiQbHK9-_t7R7EDrxvsxcMmyQ@mail.gmail.com>
Subject: Re: [PATCH v4 01/15] hw/timer: Make frequency configurable
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>, 
 qemu-devel@nongnu.org, =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>, 
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, 
 =?UTF-8?Q?Corvin_K=C3=B6hne?= <c.koehne@beckhoff.com>, 
 Kevin Wolf <kwolf@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
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

On Wed, 12 Nov 2025 at 11:24, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Hi Yannick, Corvin.
>
> On 11/11/25 11:28, Corvin K=C3=B6hne wrote:
> > From: YannickV <Y.Vossen@beckhoff.com>
> >
> > The a9 global timer and arm mp timers rely on the PERIPHCLK as
> > their clock source. The current implementation does not take
> > that into account. That causes problems for applications assuming
> > other frequencies than 1 GHz.
>
> This change makes sense, but IMHO we should model the source as a
> Clock object (see docs/devel/clocks.rst).

I agree that would be the modern and cleaner way to do this,
but I said in review on an earlier version of this series
that I wasn't going to insist on that:

https://lore.kernel.org/qemu-devel/CAFEAcA8opzjChTA7UONEPtrUnQ-xayoMgxH5gK9=
Bi-_VnMXjUQ@mail.gmail.com/

thanks
-- PMM

