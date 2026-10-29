Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207AF606A31A
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 17:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MkuwSACV
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMThi-0002Yi-Aq; Thu, 29 Oct 2026 13:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMThg-0002YK-0v
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 13:14:16 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMThd-0008S4-DE
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 13:14:14 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-8565d77c277so21388517b3.0
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 10:14:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793294052; cv=none;
 d=google.com; s=arc-20260327;
 b=n6yYgVMTQzYS8f1PVtX9ZyDp4u+jfDJ2Sa3FJagvj4dyAx+5MhK87Fvaps5Bb04q0r
 RTO/DlwW1sUJNMSc1dr4/4GY5w40OXw3ch63PB+R3qXrBtbgWzhbnkdr2b/f2YYZxIjb
 v6251R0B5p/xTWQpopbeKdkqVnCOr942PHiHgnpg0fxk+IPxLC5yYVdnJIWzo84cwIAP
 Ts3TRUhwraFMvJwdhaQW1YVhkXugZ9JwSY6HjEqybinA25Tx4Ql5qeSi4+/36adTWXz4
 SOVunyB7d+zCW2HuzDxblFS2xbR8lyFSsp5jTRd0Hvs/LPDweY/uEnQtfM5zlqoKkbAB
 x5kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=OZltaCfsq/DctB9nKAoelIK+foBX9/OFav7sH4VV7Ps=;
 fh=1BFyelrS2SOnSx8dMxnfPtnH1xbxcYuWfreklCpT5B4=;
 b=LL31jtx0s9RMH61ffPfPrbyYXZfjupYtSyC2CGYTjpgzfNXxuP5rTGLQoeI2q3R9Rn
 +pEPhgzpCnacsYmUTQ/n24CxTTBEKSlCJyhi9C/A55WeyybBH4fHP7Tm+OfbOjnEFkPy
 xCtBorsU1v2Y9K3m/X/yIxnstIdBfygJ3mcsIF2tkYIXAQtyH65om9w+CD0VmNsYRioq
 oq2TfPPp2nbWZS7Yns8NqsY353PxeGpJgohCBiLU7r7keI2KawxTvyqFNPGwjdYA22yE
 rukzStZz4Gb2qjzMwb8yWWm7EhaLKt79c78TOL/oAjvcLsJpgSoJKSR8pTqbZRtYWMqK
 5bbA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793294052; x=1793898852; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=OZltaCfsq/DctB9nKAoelIK+foBX9/OFav7sH4VV7Ps=;
 b=MkuwSACVX8UYnAqXhpohCjTQkuHeVmCX6U/E71lViXcIfyrx2NLjoDQLaUBQoHRksR
 t+mnLkOnm0sCTT9LxtCyJYnR2SGp9bsISUDC3W0/9o0Vja0aJ9JjXlD9TjBAUtGzR+p+
 Mdtu5/3ykNDk7l2kciYbbCXsYron8nqdb1TP0+jgvu3oDkscRDEw0AM6HfquVyq5vThj
 W3wF3GujoxILhA1bAmKep+mJxon25Xa5aOs8w/h8JAykuTphSXNEHGAQyftRd7WEJMlx
 GdZupX3N5pd4KsXXck4VdkCiz00rsyPtC1chj7X14wjymjUSMfa1ZPCwCPYG5Td/2CJD
 X2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793294052; x=1793898852;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=OZltaCfsq/DctB9nKAoelIK+foBX9/OFav7sH4VV7Ps=;
 b=Ib88ZxC6kirzkDsBd5TzfF2MLUDSf46GJNoYDFRA6QvN9MDnCsn01DVgWQ++ArU4Dh
 ScMepu9D6vn9sev/5KiA/h83fOJdn/9XNNvb5ddcQ5mjlQhvaype9CjuxKv5RFQft4TT
 G+mL9/EoIhOsg3SJaKv3lwZUEdVghQsZVpbLMUWTz3uW4yvuJuri0I/J81SWYJMNudI2
 Y9GrCjWYTn1LVKu+k87JeStm/kof1REs2bLWHviE72LALvN3tPy/HUutvoo7wridL9+7
 +QJee7rO2RRICK/fLuAfhEwSLe5aQRHE1yZLqxS/sVouN7Nk7K5JwaEYCVQlriyeifKM
 Ebvw==
X-Forwarded-Encrypted: i=1;
 AKwUvBy1Wn1kLmQ31H/SG3xKa/zvErzOXf8z/l9HWH5ImZ7AHwIqzlLokPe2bFrktHBd7BCQRrFSsXSoyw==@nongnu.org
X-Gm-Message-State: AFq9FYK52Ha+YYkJHZkbXeK5EhDAa1s8mDHEfa4BbZANOdFmnL7xZHYY
 P0dx82CM7LVblZpw27PKo4ISC3aDsvH4dunZs9MOteM1P9nULSKRma+OLmBTw1UKiAAXOxPN962
 gvMfxN9tcb8MQLv+VdU0JhO0NMi3yJy6YFybrO5rgOw==
X-Gm-Gg: AYBFou2xL2vAQUpaXPz23EJPdX0mXAV+YPFWwZ2nHkqJEh+40kyDsMwNpA0RF7cerx8
 KEuEKYvFrJ6INI4p35K+zBn3Ent9QXKrHyubw2O5wcOaBemJWfgNRxQTdljGSaOi1mrgG33a2rE
 /7EUSueot6pRdm3dwPYcHTa6iEA29NaqE1qlDjYinhdlBBbC50dU90QsETXRfHpbQuNOXhVbg/1
 XkaapOGkIifcxgPE24wJnODfVh/flqMUw/7THtUKhRbe+BS2lkZ+MvfD8CreR2OELdhrn656A0j
 CykREonJPBho/TSL80BRSb2l+HmF1TrbYyFKvb2h4rXw1fW1yLsud7jc9AJWHsXrXByD7nli1Gf
 X+vMm00GvPkLIWhqWlaSZy6++2WVl4eL9UYh8jQVusa1soOOcBnIZnG4C/PZX+ytGeoHrIoa+08
 Twt2HkuImDJ07hgnvPtiJq
X-Received: by 2002:a05:690c:60c7:b0:8b1:58f8:9137 with SMTP id
 00721157ae682-8b1b5d62e29mr36563187b3.57.1793294051790; Thu, 29 Oct 2026
 10:14:11 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027120135.53048-1-mohamed@unpredictable.fr>
 <CAFEAcA-=bOxmonNOYC2_1MHDrdof6eciYrehJRDfWx_7kYsJmA@mail.gmail.com>
 <1016C70E-8B1C-4F3F-A19E-59D7A0E66A33@unpredictable.fr>
In-Reply-To: <1016C70E-8B1C-4F3F-A19E-59D7A0E66A33@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Oct 2026 17:13:59 +0000
X-Gm-Features: AclHuK-cMpbWtQzPWK7m8kOfbNLNEPGbtlHca-h7tugsFMt84qz1hwQJpmBBSZc
Message-ID: <CAFEAcA8Ywq6MZxO5jt4AKay8wjWGLQYxnJ1rMkFjzoF1ppUJ3w@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] hvf: arm: fixes for QEMU 11.2
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 29 Oct 2026 at 17:02, Mohamed Mediouni <mohamed@unpredictable.fr> w=
rote:
>
>
>
> > On 29. Oct 2026, at 15:27, Peter Maydell <peter.maydell@linaro.org> wro=
te:
> >
> > On Tue, 27 Oct 2026 at 12:03, Mohamed Mediouni <mohamed@unpredictable.f=
r> wrote:
> >>
> >> v2:
> >> - remove GIC_ISPENDR workaround: currently under further investigation
> >> - simplify SME save/restore patch
> >> - rework the CPU reset strategy, with also taking care of the GIC CPU =
interface registers.
> >>
> >> v1:
> >>
> >> - workaround for presumed Hypervisor.framework issue
> >> - save/restore SME state only when SME is on for the CPU
> >> - add ID_AA64PFR0_EL1.GIC sync to advertise the system register interf=
ace
> >
> > I've applied patches 1-4 to target-arm.next; 5 and 6 I left comments on=
.
> >
> > What's the status with the apple-gfx compile failures on macos 27?
> > (issue #4486)
>
> Hi,
>
> I think we should just disable building apple-gfx by default for now.
>
> It=E2=80=99s private API as of macOS 27, and as long as a decision on whe=
ther
> to keep that reverse-engineered device model isn=E2=80=99t made yet...

That makes sense to me; we've had the vmapple machine disabled by default
for a long time, and that I'm guessing that was the biggest reason to use
apple-gfx.

Do you think we should deprecate the "vmapple" machine type, or do
you hope to resurrect it still?

thanks
-- PMM

