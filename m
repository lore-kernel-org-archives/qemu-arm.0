Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A35C88E75
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 14:55:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x685h-0004xD-BH; Mon, 14 Sep 2026 10:55:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x685N-0004Mo-07
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 10:55:11 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x685K-0006Ey-Ut
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 10:55:08 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-671061b015eso3404683d50.1
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 07:55:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789397706; cv=none;
 d=google.com; s=arc-20260327;
 b=P/fYrcV5nFFIPmT6Mra0twE3+XnigEClHVxaaBqMhp+nOmgFztB2NrBU9GdXpd6fKf
 FP7CEdekVRGSRT8wFc+wDQjqgWJsQdDTQSY29M8prfCibv+0ln8j3cA36GhzQmh2aaZZ
 70SyXliMhlM9A9ObCDBPljBMAxW6p4hGpFj1QhEjjP1n8y155l8x5USEkAujlJ8ffH9G
 xXp9gm9ebGxP2WJKd+pmI5AxFTBgAKQv5NwA9YhlOcUXxWLKkVMzWGy8xq9m+oz8qXjc
 EhwUSFSZRXX2LdTafne7OSPbUITUbSRtpY4dDfvLGzLXdOVdv3gZ1FMoRM/xF2C3aE3T
 ToEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=sM0/2gF1aJyA5yUI+R7y6wBgnZVV4qIB2xbuBa5hlKk=;
 fh=bylHTlXKagR60JR6hlKikcBZkjoax/Kz3v/HLA7SjSY=;
 b=VONUsIVEi0ATI0EJ8CiiyMom3psOe3c/d/U71vN/HwMn3CS7ENpVgVLaweS5LuNOnr
 8/qZoRUNLHHhbzjTrXdQ53R9DmUroTzBCWM/4e6GMpWTy4miQkMuKMEbtmTE3Se3iRCL
 T7d2n4k7+Hr0bK5ZP+m5+bnlr/GAZgBMAJERqjioWWbUAeS/wIkHyNtQlArBt14eVCG4
 udVK6QrFCqfdL3BtyMGwcVJL4IDdvzRr7PkYOSR1l8rzzGWqw9FeyZftC4wxn0f3iPXg
 r1KOk3D3p9BSQY3XrZIcLVmGk7CXSGcVhaqXPBNJDQLZMvgxKV/Mbf6yB2Fh+trmDKRH
 aJgQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789397706; x=1790002506; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=sM0/2gF1aJyA5yUI+R7y6wBgnZVV4qIB2xbuBa5hlKk=;
 b=h7jBrkenpoMT9BDVNdZ8mLWi58IaAZYHjbEjo49OMi2grmyNpPXrGM4+/v7NNoaw2I
 cR9XVEscIU9E3Ujo8VqtGIvEcV5sjKldh8pVBUvkey8PKJErL8DNNxuHSJleVPd2TyR5
 pEkoyoG/ZMH6EkYQkxUGHVyjvx8IVI/l0gqWf2L78M6t9pFmwjZkUN04MZpb3pIBr6PM
 Xv8x+gJKYWXCCmxNaovcZTppw9m/shiXdGy6/eHnMZGaIsUnSKFVgsFNHIm0zijfYsA7
 G5sGTmfwVMyRMSGDTXOdrLuxKOH9/3ZshRLKltHKd/sn4EbWcTy3Lec8/4a67Lo8DHAT
 4iHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789397706; x=1790002506;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=sM0/2gF1aJyA5yUI+R7y6wBgnZVV4qIB2xbuBa5hlKk=;
 b=tStMlSUao83e3Vvg6bqFRYnScdNkRTZhtVVDth79CYIOepKCge+k+jPCbbsMi0AvnI
 TUT6sjuRXY5XZ1qEZJZyLRv5nEJtwkYHeDa3HPpwsSgVM0n4xKJBZqzHzgmBjL03RBcY
 2uDZs8qYdDkfv1udN/2EQDt0FYXpT3weW56TttNKSOm6EzmzqsIkOPgtR2D5h80EmmbL
 RxCgdmlbfW4qrOOMdF5OslhiAioocw6aa1bFXwGJVIW3JUF+a7LwYn2v+kMMOpbILc8K
 e3cZRj/bueDqSp/u7l0HUWHwq/txLT1Vp/29yVCHWJgRiWMXU0Zpuf2YMjgZfj75kx8u
 UydA==
X-Gm-Message-State: AFuF++ntx8VuGZgQoPvkiyDVQ30XIwzyu7ZmEtE10M9oP98gMa97K10c
 inRRgBA9dv2vuXQK167ECe67QboEzn3gyUA8w7QDOBGTFntmt2aoS5W+9kAV3OFS7zJR3jwYDLx
 XWVuUBpyn+hjf6zRCu+U3BvEqhos1RZxxucj5o8yIzQ==
X-Gm-Gg: AYBFou3L2q4g35UjcH8zZ8yY78pxKB87PYDNdLowFWZVh7i3v47Z7BAZWhoNAxwJp+x
 LmmjBs+htQHTljDi0Ux5S1HS4S/Sl0IANvtdLuf06magbuBw7NKrxXcF7RXLAEYl/E9aQldfFn4
 WFQzOkLF2/E00OGAa2NZfwwJykmTI6rhL/6hPauJWkJUpr20Wq/7sMIp9rwTtKlcr8hE4iVIgOJ
 lgrMCVd0hYlBU90Bck4AQKBEnr6K4Oey3ZAgBBzQKNrxxN2I5rwtOgYYBEnrXjHZboqyP9uSaZx
 NhQQRsDp71H1uLdHUuQIqd2Axusev39mT8sST2kg9O7XSXlqg78Z+PIcss39MBcfQFkxh5BFPYa
 Va9GrCqplmyzH/yd7OQDj0OTzsn7iV4W5MVHwILo=
X-Received: by 2002:a05:690e:4553:10b0:66f:d560:32f1 with SMTP id
 956f58d0204a3-6714dff5f14mr529114d50.39.1789397701084; Mon, 14 Sep 2026
 07:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260824102805.639072-1-peter.maydell@linaro.org>
 <20260824102805.639072-6-peter.maydell@linaro.org>
 <03dfa51a-64c2-4b79-b524-2bac3e53335c@oss.qualcomm.com>
 <CAFEAcA8HOx3nQN00LTtqRVLqBGuQTT8bu7gaSntJyeot=hzcHQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8HOx3nQN00LTtqRVLqBGuQTT8bu7gaSntJyeot=hzcHQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Sep 2026 15:54:49 +0100
X-Gm-Features: AcwNN1W0n510HT8bNwFQDvmPqv-2zlbi0tBRu7d5nOtnPa2MdhRUFHS_iaHojgk
Message-ID: <CAFEAcA_=Xh543D3kf8P4Ghde9p2jZ=r-J-skO1M8xZXUmgiYzw@mail.gmail.com>
Subject: Re: [PATCH 5/6] hw/intc/arm_gicv5: Free memory in finalize
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

On Mon, 24 Aug 2026 at 15:15, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Mon, 24 Aug 2026 at 14:55, Philippe Mathieu-Daud=C3=A9
> <philmd@oss.qualcomm.com> wrote:
> >
> > Hi Peter,
> >
> > On 24/8/26 12:28, Peter Maydell wrote:
> > > The GICv5 allocates memory and creates hashtables during realize and
> > > as part of its operation.  Free those resources in finalize.
> >
> > Why not in unrealize() path?
>
> No particular strong reason. Do we have some life-cycle/style
> guidance on when we should put things in unrealize vs finalize ?

Looking at this again, I noticed that to put these in an unrealize
we would need to register an unrealize method we don't have now,
using device_class_set_parent_unrealize() for the child classes,
and have the child classes chain up to the parent unrealize.
On the other hand, we have (empty) finalize methods in these
classes already and you get the chaining up to parent classes for free.

So unless we have a reason or concrete style guidance saying why we
ought to prefer to do cleanup in unrealize rather than finalize,
I'm going to leave this as is for v2 of this series.

thanks
-- PMM

