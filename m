Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A9FCC6B34
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 12:33:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHKe3-0006du-Mq; Thu, 15 Oct 2026 08:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHKe1-0006dO-NJ
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 08:33:13 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHKdz-0006ua-Td
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 08:33:13 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-8b06c0794cfso21447967b3.0
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 05:33:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792067590; cv=none;
 d=google.com; s=arc-20260327;
 b=Exbl9YoNVqGDPakXYmpOdilCndp8juVIecZAzq8Id3Uhk/6Hv8rRJCOiToTLEuB6zx
 VOgGMQ742sxU5Qi86UloBnxWsvyQAZNv+M03ljRppBKMIPrAOXBSgzjd41rKKp3icG2s
 PimhJ3wKf6Muw8sCkdDGIWTxsmIslNMvbEBRk/FE7aqsXJvDrTyPwxg7mqHdETnPGYEv
 e3EVwt4ULXMW3v9sbi7WDhsjYNf77LUDCttySv6sw+JUwnwrDeCeex8bB3A9lyza3Pr1
 4PuFUe52HvzctXvqJWNnFg2CGKryuEEp4tF1T9HUQxsvQV8ugEgmWKv9sxlITdCpXPqp
 x8Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=m5KJty38CRnym4hNOjpybq5CBojULdf02RdOpPHIuhI=;
 fh=bylHTlXKagR60JR6hlKikcBZkjoax/Kz3v/HLA7SjSY=;
 b=SoH3eeyTjcqBcNu1inM3HZD7jgRWMfa64C0WjRVV+o1TdF3oLGh97qhy88ziPvw5t+
 AHaANzMtubcxCfjSUrTvtMaXdMBnXCNDrSBebgoB5Tu1bzQFtla2Ni+EdniVTpNFBFzh
 pNhPnVQ+NhFsHCrzUuqCQkoMLiZSEOJB24ZV6Jsu8gzyVdDu0J3nf8Cq2XbWC22ASJgr
 M8GaCntyNtCcez0ioTV9m9qpqs+jwI/ZX58VJp1VxN55ThR4PdwZaQbfeshOe66g7ilk
 o7aUrg6BD/vo1+WbaSnVfkKm+hH2lmPbDmEyRgP7+HBx4giKH2LNZRcJOWiFXId1xUnn
 zmdg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792067590; x=1792672390; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=m5KJty38CRnym4hNOjpybq5CBojULdf02RdOpPHIuhI=;
 b=ep7QsJ3rZ1RP9O/9Iz4qHjCEpVJlQQk9ZBmEOjsU0kfDhYBJh4k0wNBZLaigsHxQ+y
 6xyk+dcziDKcdi6sUiIgwJtPH8H/nqqWzi1YU0djaWroWTLyZxpfoy3euSRJp7v5B5mg
 CS+g3PWb2x9Q227FOohhEbQP8FEv6B+kNygzA6+b5PxuabYgZ5Tax+zgJtOTWhMRfsf1
 2ElvIRnoFQWP6hxrrZ3rvjorHSlJ2Z9S7oMG4xtnSUA5B0S6eK0Hzh5BVSouBv4Pj7rh
 zysWg0vPiI5Zm2cF+3PcHiE7kYps/urwIS/9fXF0cIaW491BBu97XX0IWvSeVfGWpB3T
 oIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792067590; x=1792672390;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=m5KJty38CRnym4hNOjpybq5CBojULdf02RdOpPHIuhI=;
 b=nFCs4asfPcrAxWajljUMXlRgVhaiJN/0SUBrT3bBgbikVBpHddncATVMo707E9QQaw
 nF5OL9nrxnOq4xde/AZiGs5QpCbgfyUjcOtj0o//gHrlmOmMEfIZ8aXw+do4ORAmz+R/
 3RhcfW5Ncg22tOl6UCrr1M88itCtSC8IFsGgIj0WxbpHJLKIMSauVZDl+/qGR2nPnpJS
 kaS8CbvrX6LHV1whQ+rRPvIaDfp0kpBekXnl5NpUBcI3IIw0C3LRVojLR88R4F9pAJzt
 rfZtvezbLtkWFvbYwE6dDv4JePSpf5fC4nmsNwRtX6R52STH3m9DAo8bM0/x7JNQGZBe
 ylpg==
X-Gm-Message-State: AFq9FYKxnDoi+rxojnUcsti3wOf36CMIw8tT8DzcsuajeR8KJrelJSlU
 uBcFA2C3lPb93qpgO1ClRge03E0ytqVTqS4VwEumni4hfMa8vJZ7C/EEefoSCZph8tgOKRmcakT
 pTaoX5hspr6a5DDGe3Vda9xi3qUKaQqbq2um7It5quA==
X-Gm-Gg: AYBFou0hsoJJcGMWjb0hVBJZd9sKmB7qncHzIJEa9O5F5UVrFnA7wvVwt9nVR+p21FA
 2WQMguHb2OgS4FT9eMDkt3EHU75H30d2pt/iYX+q0UkzIxQJAOJoVDdQoVt3cLbZhuXDRcIskSw
 zkGxzhXwJSKp+40mk3DOz4wOMnSLyycVtPeoFXCL7rB36F7UrSvOiyuRhxIDrZ86IN6VduPzY2o
 wG/s4HGXMVQcfjvNWGPVm/hzJZxY5MLqzEvESPjtMKly/0yEmm91EjJx/9d89t8iAG/+WPmA78K
 63Tab1XYwsJHuuF/r6ssJTe2RmAS4f0KEP5y1l+Z9/n0LhJxeqcXT2Dq/wzEQ1MOU7UQxU/nko3
 sirXPlYjjrHz/HxnyXW8S47F1dw+TKHwPTxp8+HA=
X-Received: by 2002:a05:690c:6604:b0:870:c600:686c with SMTP id
 00721157ae682-8b07edcea14mr84077067b3.18.1792067590213; Thu, 15 Oct 2026
 05:33:10 -0700 (PDT)
MIME-Version: 1.0
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
 <20261013083933.1024405-50-peter.maydell@linaro.org>
 <58c816ff-3678-479a-b8b0-df1f22a78486@oss.qualcomm.com>
In-Reply-To: <58c816ff-3678-479a-b8b0-df1f22a78486@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Oct 2026 13:32:57 +0100
X-Gm-Features: AclHuK_7gbDfABo9IfRt_T9m70qfaa-QSP6MlaMdKGdTnaNywL3T3qcKvgVfsiA
Message-ID: <CAFEAcA8sdXhM9+dBArALfMo0h-Dr6yCJv5JLHk+0iphPRT_=QA@mail.gmail.com>
Subject: Re: [PATCH 49/86] hw/intc: Move GICv5 register and data definitions
 into a header
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

On Tue, 13 Oct 2026 at 12:05, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 13/10/26 10:38, Peter Maydell wrote:
> > We put the definitions of GICv5 IRS registers and guest-memory data
> > structures directly into arm_gicv5.c.  It turns out that there are a
> > few cases where we would like them outside that file (for instance
> > register reset is handled in arm_gicv5_common.c).
> >
> > Move the definitions to their own header file.
>
> There are pre-existing typo worth fixing before moving IMO.

Yep, good idea. (None of these are in registers the current
code is using, so they're harmless right now and don't need
a stable backport.)

> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   hw/intc/arm_gicv5.c              | 270 +----------------------------
> >   include/hw/intc/arm_gicv5_regs.h | 286 ++++++++++++++++++++++++++++++=
+
> >   2 files changed, 287 insertions(+), 269 deletions(-)
> >   create mode 100644 include/hw/intc/arm_gicv5_regs.h
>
>
> > -REG64(IRS_VPE_SELR, 0x240)
> > -    FIELD(IRS_VPE_SELR, VM_ID, 0, 16)
> > -    FIELD(IRS_VPE_SELR, VPE_ID, 32, 16)
> > -    FIELD(IRS_VPE_SELR, S, 63, 1)
> > -
> > -REG64(IRS_VPE_DBR, 0x248)
> > -    FIELD(IRS_VPE_DBR, INTID, 0, 24)
> > -    FIELD(IRS_VPE_DBR, DBPM, 32, 5)
> > -    FIELD(IRS_VPE_DBR, REQ_DB, 62, 1)
> > -    FIELD(IRS_VPE_DBR, DBV, 63, 1)
> > -
> > -REG32(IRS_VPE_HPPIR, 0x250)
>
> Pre-existing (or maybe that changed since previous releases)
> this register is 64-bit.

I think I must have just copy-pasted it wrong.

> > -    FIELD(IRS_VPE_HPPIR, ID, 0, 24)
> > -    FIELD(IRS_VPE_HPPIR, TYPE, 29, 3)
> > -    FIELD(IRS_VPE_HPPIR, HPPIV, 32, 1)
>
> (thus the expanded HPPIV definitions might be wrong).

Luckily FIELD() doesn't depend on the REG32 vs REG64 macro
The only difference between REG32 and REG64 is how they define the
R_FOO constants, which I don't use in this series, which is
why this typo didn't have any visible effects.

thanks
-- PMM

