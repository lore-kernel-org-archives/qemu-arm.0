Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69692C79F80
	for <qemu-arm@archiver.kernel.org>; Fri,  4 Sep 2026 08:17:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x2P6b-0005QR-Uh; Fri, 04 Sep 2026 04:17:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1x2P6a-0005Pk-5B
 for qemu-arm@nongnu.org; Fri, 04 Sep 2026 04:17:00 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1x2P6Y-0000y3-FG
 for qemu-arm@nongnu.org; Fri, 04 Sep 2026 04:16:59 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-870502743a4so4183167b3.3
 for <qemu-arm@nongnu.org>; Fri, 04 Sep 2026 01:16:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788509817; cv=none;
 d=google.com; s=arc-20260327;
 b=DVFOv16AvP9GAQpkYxQZA0FqNLgDYpzoae+2ZDLGb6JFtJqJx9+mx8eGl4zY2P0NMh
 y9ujVO4opoyTaN/AXMxffJR5/m13MR4J4yUCaLn/ABZ7mgVw9/taTTe+WR1tjRRZOOC1
 nq39KvrpqS4cl5s3YLwOnQOdZlur5uY6ruAnNxPh33N+k03gbEK+kWuAKHf2/VfOZuwA
 V5ZLW7kuzH0mPXPoKuaGRaB15dPFINhXci2FrIcsCgup6C1PjMOdCGaqcXdk6RbMZR9L
 AXJUhG1mbP5iw0dStwpdHjCaKppY1n0G/MAXh7dBVFSxb2F+OJP7ifhCykeHZ9oeYnQY
 SJBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=gDPorsHeR8rwd1cihZpzORhaWPZhCy76UXygT/KQXMc=;
 fh=ph1U9B1NiPGYiAerDnhiTqajW5jy+IPr/JRrk1ep+wY=;
 b=mBpXLcorM1osRjnU+cksR3rr2fuRGLoHM62vy9MluFB+2FeO63y/efodQZwOcAOWQm
 bSWYbF1ua1r841Iur0dOAr7cqmIwLz3/Kh1Smgv8LcotjGhde6egQLWcmX3i6siV4Nmv
 AwDT4fCjMUe1SR6VMy9V5vUyzPjDhK0Uj0RIGe+g0JoD6OWxXvJSbzC/yNYPWKdBsH5x
 3bvIb+/YMC+OHTa8raH1p3TyBF/PE3NHU3ekF6Yd3hA0agcWL2aA3//nTdQxJW2M/xyN
 W58ttNq4ootRNU74FUDdyQIzllgA47nTCD5jyFr6B2hMTK3+nPvOZapFfxItdTX7y5x0
 afwA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788509817; x=1789114617; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=gDPorsHeR8rwd1cihZpzORhaWPZhCy76UXygT/KQXMc=;
 b=ABjER+Heab9BbNELpxs+dAodAPAP25TyX7yCSrIgHuM/bJmMXN3Vev3IH/8lKO7kiX
 ruBjyuS218uQzk7y5/uNS72PcsYFgHEMBHzI9QG+BUmIiIZTV7Pf0d7z3I1yGNqAM3u0
 LGR5J7mVEsZX7D6GsGFtkbOurRhoIE9T0IwdX0fnGARYSHlHIx5/cstK1e6fsDU+fHeI
 wbI2Td3Cwv2uKtyL0ioSdxdVNwa3ymJXsUo8aIS05H+lHe/IS625mEoTisM3D8PnGI9W
 sElB98nXr8HnUQkDM2XVDYQIvcNe0dr+5tMZFuUWn6SHN36+xVrCy5bfkHIfQD4ZrGGt
 e+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788509817; x=1789114617;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=gDPorsHeR8rwd1cihZpzORhaWPZhCy76UXygT/KQXMc=;
 b=M/81O468rdjaFE6Q0ECfKh4UqgQIXhGDOuUWI3tUfgXK+0tCc+Gj2IDjz7w7AP93kK
 Su5PXNGByc7RCRcF6Y+nboSFoq4wMBf0JVCh80FlAI7rhVCuiykbL++MVAc6mEbkKwkA
 gQd2ybchVCrRLubz2pWR9I90L4/ArGGtB6lckR4gBxYlp7bEnTor3z6vEGuALobXFhg8
 HtwAIr0AMibjjtl9F4JkNzf2qf8DWKVHc/FZPHZsiVbEyxg8RQ4e9qQbKLZBoaSFZZ5P
 b2JUxYsJHGbcFEvleIdWGBYHymcUdEkhBQ+z8LPnAedv1iXUs8dwN3fUsM86y4js2pPA
 t7Rw==
X-Forwarded-Encrypted: i=1;
 AKwUvByH87CghemmllLLayLF4fQYu1hPC5meKN1s2mztAPr0U/3IWqX1ODVuCLEHN15pB2Kf2tX8vxEnAg==@nongnu.org
X-Gm-Message-State: AFuF++kxKR9UqWfF1nr5HZPBWdR09cdKLRG4XkAgyUjdD0k+mwxhb39s
 lCAlMrf2EeQZY78OYEMgL3RGpL1mSLNNzc9nDt/sFCslsqNToA5CqNqhRHNECpMxV3K7O6IiFP0
 1qcWM1t7bYhHG+7BO8Ll0iygG842J5fM=
X-Gm-Gg: AYBFou3V2Vgyg3QGeRD2tGT93D+V2NLwSDhl5wyWK6tvsDYWZ96UPyH5SzkuNnMnn+4
 n2f07ixjE7yN/Kf2pkNwSGRyiDn8Qc6dka4ERCL53tXYqKQlIA9UG8ozdCd4Pm7X1YLtIkrVqbM
 njDOL0QGo6QbKfxo2M5+JTzdWBVzBf7xvKbooA4/ULHkspbIfMqD57aw1MXQxR4vQUGfKoSpF5i
 uoYZY4wUHJuwR6PYvdcVft8NoVK57FMgmcS5eSac3rj0lC1AgZ6vKTYnVkphKkWrvpjlLD6nAFo
 MhHGdAwPa1+LoxKEym1FNuqVXVU/1DVy62BRU8XN5yuk
X-Received: by 2002:a05:690c:e18c:10b0:86e:8abd:702a with SMTP id
 00721157ae682-8712820ca33mr18839077b3.32.1788509816874; Fri, 04 Sep 2026
 01:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260825084224.1827672-1-bin.meng@processmission.com>
In-Reply-To: <20260825084224.1827672-1-bin.meng@processmission.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 4 Sep 2026 16:16:44 +0800
X-Gm-Features: AcwNN1XiSJddNETTzkEQT6JpaW3cKF2BAyu3yXWlFnhs5mvZSsxHoGdWh3XDnds
Message-ID: <CAEUhbmU+BQ=MErMdF1t8BHp-Xzwc2PbFY6pN3wtAgYKbO7jdaQ@mail.gmail.com>
Subject: Re: [PATCH] hw/net: cadence: Honor subword lanes in the GEM registers
To: Bin Meng <bin.meng@processmission.com>
Cc: QEMU <qemu-devel@nongnu.org>, Alistair Francis <alistair@alistair23.me>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jason Wang <jasowangio@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Tue, Aug 25, 2026 at 4:43=E2=80=AFPM Bin Meng <bin.meng@processmission.c=
om> wrote:
>
> The GEM MMIO callbacks ignored the low address bits and access size.
> Byte reads therefore always returned lane zero, causing guest driver
> that reads the station address byte by byte to turn four unique MAC
> addresses into the same value. Partial writes had the corresponding
> lane-selection problem.
>
> Extract the requested little-endian read lane and merge partial writes
> with the current register value. Preserve the existing read-clear,
> write-clear, and command side effects, including dynamic queue
> pointers.
>
> Fixes: e9f186e514a7 ("cadence_gem: initial version of device model")
> Signed-off-by: Bin Meng <bin.meng@processmission.com>
>
> ---
>
>  hw/net/cadence_gem.c | 94 ++++++++++++++++++++++++++++----------------
>  1 file changed, 60 insertions(+), 34 deletions(-)
>

Ping for review?

