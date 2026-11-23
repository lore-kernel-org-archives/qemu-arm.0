Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707A2606A31A
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Nov 2026 11:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=t2Gwq6oE
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xVSIw-00052F-89; Mon, 23 Nov 2026 06:33:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xVSIq-0004yc-Hy
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 06:33:47 -0500
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xVSIn-0007vk-PB
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 06:33:44 -0500
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-67583c777abso3083487d50.1
 for <qemu-arm@nongnu.org>; Mon, 23 Nov 2026 03:33:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795433620; cv=none;
 d=google.com; s=arc-20260327;
 b=fvXtnPATrnhS1BlwSRS3Goy2vd+xXntsJ4w+L/HjlR3hdMYLLLZwB5FnrJ6V2vqM/1
 WW/gABcCqgOhoq/T1/HJkZBjgiwmlqaxLayNwJ5fjrDmOQWjT0Qa8X9WHEdAzxXNLgCK
 BMgmsoX0rwDvcVbli3Kq/M0RNCxmpxvL+oUTZmq+gaFR5r5TMJMhfYi8Dg2c93Zh6WM2
 HPD3nUQS+C52VkrjohWkWgYEgBU0EQIrCbF/sd1HSScwZPZX/+K9GB6CH/NcqJInrv/L
 aXYcqM6/3Z1kD5A0ToXw4rBAsFlZcujVULmFZyG+T9pLHOrwFRsuVP6dajp3LqDfYtVg
 hrNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=EKkmkSylR03Y9B23WtbRqfh0zauSJ8Gp8q0rHWrMgss=;
 fh=0rJmLhybS9zgrhM1AZCkRbL+a2BBEOFv+VeA1WybGYY=;
 b=FnJMQp3b1gMR/gAaxuhilu6y4pYPjMfKV4uJ/NjyE1QNSBDkJRg0mDrxyKDDpMD4Xe
 CEaUQDx69ZnBeLP6p07KN8/JHPVW/NMbwyRAsmHYBASQmA16YqHygUZnIb5g0QQGAtRy
 tFFvRGTZvmr1IDF1j/7dOkRQJ0SYm+LECuoswi3/dV6YE6tkmGl/M3hu+uIiQBjrb421
 7XDQdpQIufa7gFZjJymEdFZBorjItehRF1dW42TzMvujk7+0Ean6FQVnriJFtKOSXs+J
 mxKTy0ZlJ8obavblnEx3cEsMyh4OHmiKBoz7lBcK/xXtTtHo3uSPaH3b/7p1Kj4AHeGj
 pC4A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795433620; x=1796038420; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=EKkmkSylR03Y9B23WtbRqfh0zauSJ8Gp8q0rHWrMgss=;
 b=t2Gwq6oE9TT75BVFcmzzja1E3/0TMuOurMQZNY1Y/dB7sb6CW5PxI5ffcec6l2bpwW
 5rgdBhpmhWIkoxDETL704UZFXmUC1mmUgPueXs+wSOZ8DxmwWqB0HUrdNhvH2OdseXQs
 aXIONGIx0QBE2ojLK1zi+E6X+HOtaKjNIZfkYsKww4e8QXwr79zJm21M6hFhTXCagnef
 4zVAXC7IEXiSdwiJUA27UNAT94LA5vmLezNkI4g0IoVE7CA19C0bpKBbuQ71WCfIPw1n
 8zKpxunEz2iRMHm3EWks1O+JZ2fhieWwmC52T2dI7db5gc+3OiFKkKXkU1Qcu+1qGG/6
 q8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795433620; x=1796038420;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=EKkmkSylR03Y9B23WtbRqfh0zauSJ8Gp8q0rHWrMgss=;
 b=MLDQrXBhWk2S872nuZwi41qlDsOc8nixvJVz3YAEyqC2p1EAh/Lo0RgZrN7+Qrj2LJ
 hNRjNFZRtLhnXMnd6gIvFzMgJMs4oJufb90Cy16StYQSO+0+utCZ82zi1mG2wMqcsg5V
 vynMXhayyKaoQpt7ZiqN59V4Mvy7CuGcuKuSszamJVAGEsH2K9lzLqNgcuUcR4v5V0uk
 QBZxT6Ur+ez0+FJ83A5q/yC5qm1sjm3bmNAGp3WYQZDzYMe+mMR8MVXZtbcOdEFpM9zu
 uvo+1b7DRiiYgKNapDMsbcWDRrenX2+NfIzJ9ovTOFnO6FkWpCG/6G2nWGUPV1IrpqRO
 zDmQ==
X-Gm-Message-State: APuU4Z8+5r9J1zsImHbR0jiFvTbLDLvaKvYKaxRozUnKRmy7Gyo5TBIY
 xckg7xSJnGAZ8GXpxKQoXKg5oO404zsBC5E9SYAjVYoITdznB5iCux+fuUkdBKx8dVL6CcC+nFb
 buzHfDUzMDV46B3KA3BgkcRTlo6WJtblM3QueCnlYtA==
X-Gm-Gg: AZFdTZcHttCTJfTcCJKRGPXBYM4LiBUZtz622/rDX1hk+3nENX90A0uX+LFiGacbAB2
 7ckdKP12ce2AuDZ27BHQpLkiFKnsbype7pGMYINRfJpPyO+Nvc+WyyI6vO+Ss+Jpw+jgZx3zPAe
 WxVh3ifmgw8mTPPmqD650Ark8S4knUwgb/UlF/h57WPq1b9TpqlFGuUr2wAgGTNPvW9FMjbiezY
 uGBJJrFbLEa+6DEib15lh16O37w005Ub7zN2DCw1ezhXPPH92i0shnFUdFiCvgRuXYhbbQn3KEg
 t010ls7/mmq4ackS8VTpCF0P12ZSK2GkKtpAoXrZDmQPkppgt44pukDFTSrf9B0PtlDOycwKE21
 55auZxOJeU7Xtj5sxjs956XSfrUVXyze98kCElcTGk5u6dWrArtya6aJKNjLF4B+75TiNHP7hzt
 FX/MB1bSLHtIK34CQ/MwF9
X-Received: by 2002:a05:690e:e87:b0:677:c90f:46bf with SMTP id
 956f58d0204a3-67dec4202b0mr4628300d50.17.1795433620401; Mon, 23 Nov 2026
 03:33:40 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119171425.3186790-1-peter.maydell@linaro.org>
 <00f62c2a-f094-4922-92c9-2d3c26a012d4@kaod.org>
In-Reply-To: <00f62c2a-f094-4922-92c9-2d3c26a012d4@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Nov 2026 11:33:29 +0000
X-Gm-Features: Aa3M54oDzgtNUMLgOZ7sO0mQ_a5gKfBubKT8eGfW0-_wnlfq_yBZ22Zyx0o-Zzs
Message-ID: <CAFEAcA_mntTSsiZZRH1vOd9g4W2D=2AaNEEXvoucVDyf3ur1SA@mail.gmail.com>
Subject: Re: [PATCH for-11.2] hw/ssi/aspeed_smc: Correct minimum_version_id in
 vmstate
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 20 Nov 2026 at 07:08, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 11/19/26 18:14, Peter Maydell wrote:
> > In commit 29139270d8ad70f2 we made an incompatible change to the
> > migration state for the aspeed_smc device, and bumped the version_id
> > and minimum_version_id: this is because we increased ASPEED_SMC_R_MAX
> > and so the regs array is bigger.
> >
> > However, the old vmstate was handling migration from a range of
> > vmstate versions, with version_id =3D 3 and minimum_version_id =3D 1.
> > The change to ASPEED_SMC_R_MAX is (intentionally) not compatible with
> > any of those older versions, and so it should have moved
> > minimum_version_id up to 4 (matching the new version_id), not merely
> > increment it.
> >
> > The effect of this is that trying a migration save on v11.1.3 and
> > then a load on the current head of git fails in a confusing way
> > ("Missing section footer for aspeed.smc") rather than clearly ("error
> > while loading state for instance 0x0 of device 'aspeed.smc':
> > aspeed.smc: incoming version_id 3 is too old for local minimum
> > version_id 5").
> >
> > Since we now don't need to try to handle migration from versions 2
> > and 3 at all, we can drop the complications in the vmstate struct (an
> > unused field, and field only present in version 3 and up). Clean
> > these up and set the version_id and minimum_version_id to 5
> > accordingly.
> >
> > Fixes: 29139270d8ad70f2 ("hw/ssi/aspeed_smc: Add Data FIFO-based flash =
access support for AST2700")
> > Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4880
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   hw/ssi/aspeed_smc.c | 7 +++----
> >   1 file changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> > index ec9ad0f747e..f82947e752e 100644
> > --- a/hw/ssi/aspeed_smc.c
> > +++ b/hw/ssi/aspeed_smc.c
> > @@ -1218,12 +1218,11 @@ static void aspeed_smc_realize(DeviceState *dev=
, Error **errp)
> >
> >   static const VMStateDescription vmstate_aspeed_smc =3D {
> >       .name =3D "aspeed.smc",
> > -    .version_id =3D 4,
> > -    .minimum_version_id =3D 2,
> > +    .version_id =3D 5,
> > +    .minimum_version_id =3D 5,
> >       .fields =3D (const VMStateField[]) {
> >           VMSTATE_UINT32_ARRAY(regs, AspeedSMCState, ASPEED_SMC_R_MAX),
> > -        VMSTATE_UNUSED_V(2, 2), /* was snoop_index/snoop_dummies */
> > -        VMSTATE_BOOL_V(unselect, AspeedSMCState, 3),
> > +        VMSTATE_BOOL(unselect, AspeedSMCState),
> >           VMSTATE_END_OF_LIST()
> >       }
> >   };
>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks. I've applied this to target-arm.next as I plan to send
a pullreq before the next rc.

-- PMM

