Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F19F54AB8
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Mar 2026 13:31:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w51qf-0006Su-R6; Tue, 24 Mar 2026 09:31:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w51qa-0006Qc-1H
 for qemu-arm@nongnu.org; Tue, 24 Mar 2026 09:31:08 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w51qY-0002RW-Kg
 for qemu-arm@nongnu.org; Tue, 24 Mar 2026 09:31:03 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-79a46ebe2beso48256977b3.2
 for <qemu-arm@nongnu.org>; Tue, 24 Mar 2026 06:31:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774359061; cv=none;
 d=google.com; s=arc-20240605;
 b=N8cxfSAXbqtSCOdE+ml6s6+QcPqAxJQgmJaap+ICyEsXFrlsa//enkK7x/OJ/lGG/Z
 +3/8bxcZDPKjyj0KSwWYwb/jUDnAuutrHp4/qZLpq9i58R5qCZnllhDIc0UsuiER8otI
 iIoNUhkVDH/ohKetpN15h3S9b8WWh5vEjZqbeiMYdnIDwZducYpm/U5YSf2IuPgbyGVy
 UzynmzrYSDMdg1BQHealT2Z5ylG6GmcJ+1TGu96oe4PnOJI3EKsqzOkEs7vj0Hfi6NQq
 0CBm1B830h20M/C+pmLK7HyF5bQV3rMOmPMLjDChJ7mIfAv5XwO8577Gb7QD2lPCVjpV
 346Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=aqPQiONfmeI14EDLb1xzYRtNQJRb6bddVhHFm8fkElc=;
 fh=jVPx2xvVbCjq1OqdR1rd/nVz3yb9PmuH/uEGNDwCmUA=;
 b=AJ/xqO3z7MMbSX5n/d2jEt2BmLH2zZMpeT7NJbplnPHpHxVQ8hmzfnHJ0birgV5N05
 gwq2ajmDKCX9d+dIIUUaV+L9/yeDq7696qlTrTTzGWm68J6XNVgzhdUXhFiAEuXryJWS
 m0SKehjtZItoVmGKHEqKdE2jZJVshHO8PqWzAjSLOLJxdcIimkVRrS3u812/bBIms5nd
 xnXB+QH0o2H73SVPozmI12DVopps2n/4GqVE03QQg4sLlZi/v+cEk4hRQtEsoEpITObe
 qQuVlxlfMBuL4LlbSkzMjfKssz7+K598+DW0m5F/9bUqCy8NYolqjK+zuN+GbqYBcdUD
 54Tw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774359061; x=1774963861; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aqPQiONfmeI14EDLb1xzYRtNQJRb6bddVhHFm8fkElc=;
 b=g3Wm3ZWBxmAwL82oywdM70ZeZzlm7eYUoitz0cikW0XLbNPANDjoO8IQj7knt5Ure5
 WiDjAGjJ13tMUYEn47EvGCLyMjoUJp3b/PyFES9nxvfIXhAmO9PQudp1xEknGp+LqGS7
 yxqAM8xIMcJHn8rTEM5fkmEEOqOQxfOlWCSLn0KLrFzGO8iYMtFbBkGqL3O1wuT64vqJ
 X/fp6xRilDPUFfRlRIkDhFHQuKf+7DJj93haPQPuVielKvUq20O4ajLSX7nHC7DzAy+j
 Zou3TEDH4uHfflvyx/XGU8HHtBPiSNJEAVItYwm8jKF2GJhXi6IeJlg4HFmORWYmRVt1
 skCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774359061; x=1774963861;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aqPQiONfmeI14EDLb1xzYRtNQJRb6bddVhHFm8fkElc=;
 b=r1MnZR/ByzWSG5I/3PnQZs9x4wqaIymPqBcd8v6bcY+7HXM5sdQZ/WLbiYT7+OlAq/
 yvWCqKPNNtZgVdb9egA7YOPDu4nDNcZUPRhaIiLZ4h/IGbFIZbMjH6gkBvDajueEFNfR
 9qnBmZM6hsRaWhd3J+I+VAptLztZVOFeuxZVQ602Ef2ZIsqYo9rgQ2SguldeC7El/xcr
 GAVFZ3jufaijX0OAoAAy+JTMr8JeZHVKMeX47XeWX3/EqfcMe8CU9XARGi1VWc73tQZG
 l84NCHbk+BZHgRiTQk8Bs7cMcMROKHtfjeYdBssNBqalOtN3J7TowxnW4Qim12Plylco
 coig==
X-Gm-Message-State: AOJu0Yy6Le//WbhaySVPFJZ8gsXy5gU8tTYkiIFhlvDzGAGpPwbLsrTr
 rEoDAtxa3ME8mWpr0JJbLe2Jgp3c2lVP19cqGbIBqETupEVuxwYhboNUKUGOZChHQHwOH4dwUTT
 ShMfdqfEAp9Xyo1WOWjzXQT2X9eq0BMuRwcowa6JBWQ==
X-Gm-Gg: ATEYQzzTLUfBvBboMqk4SOkPKkzNTEybpwoVti+cOMRpwfbM04IolN6nuGNNKHVCqRV
 IGH0FrdyAmwq05/2y4aSu6epaT5hCOy0xwLBWBnzrGQH2hORwU9WHTP2RzLDVTQ4NgIoLJc5Rz9
 cXO3XNoWDwDeVWMcTdCrU/TU6iU1c/iP1YAaHaX4384Hk1+OcaUMSvZg9XhACQNGBdUS6O6nnwq
 ts4k5W8tbHR6vOHzCjpLx/An/yF923EmuMK2xV7uprNK9SsnzZl+FyyJbl7c0Qn0DGEI1IW2yR1
 UBdok6lBUWrBA2/cnOfj8lVCOWPw5xwmBmZX10q63GmAemCexQGjlzC6oFcQvKUUGUipYx+wOXa
 y/Q==
X-Received: by 2002:a05:690c:a058:b0:79a:55f5:a3f6 with SMTP id
 00721157ae682-79a90aeb6b5mr131105977b3.26.1774359060873; Tue, 24 Mar 2026
 06:31:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260323182454.1416110-1-nathanc@nvidia.com>
In-Reply-To: <20260323182454.1416110-1-nathanc@nvidia.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Mar 2026 13:30:48 +0000
X-Gm-Features: AaiRm51FmqfZYv-eQk927A0Kc0Tb7kxuT4N0ndkjz1MpqNbS8AVHaTO5_S_-354
Message-ID: <CAFEAcA-TC8zpKivJ-Um14qHEbcrdCtT9GabkM_+m=B08esyaWQ@mail.gmail.com>
Subject: Re: [PATCH for-11.0 v5 0/8] hw/arm/smmuv3-accel: Support AUTO
 properties
To: Nathan Chen <nathanc@nvidia.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Eric Auger <eric.auger@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>, 
 Shannon Zhao <shannon.zhaosl@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 Shameer Kolothum <skolothumtho@nvidia.com>, Matt Ochs <mochs@nvidia.com>, 
 Nicolin Chen <nicolinc@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Mon, 23 Mar 2026 at 18:25, Nathan Chen <nathanc@nvidia.com> wrote:
>
> Hi,
>
> This is a follow-up to the previous series [0] that introduces support
> for specifying 'auto' for arm-smmuv3 accelerated mode's ATS, RIL,
> SSIDSIZE, and OAS feature properties.
>
> In QEMU 11.0 we introduced new options for vSMMU [1], but feedback received
> when starting the integration of layered products shows the need for
> auto/host-retrieved values. To avoid breaking JSON/QMP compat, we want
> to fix the option types so that they can later support the auto mode. At
> the moment the auto mode is not supported though.
>
> A future series will introduce support for resolving the 'auto' values
> based on host SMMUv3 IDR values, as well as setting per-device ATS
> capability.

Hi; I'm picking this up for target-arm.next because it looks to
me like it's been reviewed, and it seems to me better to take it
for rc1 and if necessary make any last minor tweaks with a
separate patch in rc2, rather than let it sit on list for a bit
longer and take the whole thing in rc2.

Let me know if you'd rather it wait longer.

thanks
-- PMM

