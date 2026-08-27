Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11D8C61DC2
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 10:54:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzXjc-0001HR-86; Thu, 27 Aug 2026 06:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stephensportia@gmail.com>)
 id 1wzXjb-0001HA-Jz
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 06:53:27 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stephensportia@gmail.com>)
 id 1wzXjZ-0001oH-VY
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 06:53:27 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-7e9fc3de7ceso1649298a34.1
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 03:53:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787828005; cv=none;
 d=google.com; s=arc-20260327;
 b=Q/rVFUEC5h/t5EncvCjmQpWz18xVDRYwF4539i26exTEELCTitfHYLgo68k1PIXi1L
 GGjcHOap0hvgylJtcqnoVtKCLPiMzi6TBCE9l8P4q7aSnDB00Ytr6UlxackbfRbnPtj4
 cXENyxRkdrC6UBZIzS7JZcesBSivCGMtbEvtbntEUh0Fa6kcDEwCMLvDoVgSpM781xYD
 33Fljh14OWVkHO/dFIEgZeST4Oou/wbAuclSCiOpu/9K+DK2ZWF6qTh3KrxmJx9nfuq8
 EGcgGvQ5pgsq4yUST8SsDvLK25dRAurySece3L2EKIU1UEFUFHXfUbLmjivF1AjYqmQ5
 zhHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=8v8GfvZwk7BzWpgG+e3H0fyxQybwxyMNONC30vcpZSI=;
 fh=EeZb6St/NKfHdeyz6CZTlle4Kl24tWYE1Hy9kLOXCBQ=;
 b=egGpIVv9wEVpuKG5LbZMJjdC4YfRq4yC6PUp3/4AyV0/Ozotkz16wB3iOPN6QKRYDi
 ERWCwFfjVA2ye2yDpnDkpbofe6UMdu9xPLO3GJknDGLIDJ2LWYOJZiRJiyi8g2PKiM9U
 FUFb38zF9Io+fp9g5pv4t37BR3G4+TYZ4ZngyRyCkGZkUpcK/yRVkqIvWEAI7V3aWVEA
 IFGBpv5ialf30+qfiQCuZ4+9qIlFB1W+5pfvipNCpPAj/vMnEXM/77MC5DSNllaJNvNq
 26SI3Vm1d5lAn0ow5PebrSo0OootTjMouvGLGj7mJtDZsImbeU35y134QD95HXe4CpDP
 B8qA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787828005; x=1788432805; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=8v8GfvZwk7BzWpgG+e3H0fyxQybwxyMNONC30vcpZSI=;
 b=gaNtPc1cautM/+ZcDMHvItNatPhAwLUWLwSH+d51gwOJaCvO7frZsiWuy982w0vPGS
 Rr2mZjqREpN6VKkWTwwRKY9wtlsFJAvPIATeLNIiR1Nl3F7y/Jtop1AT0TDpFQL68lGH
 coLFWTIbKz0ordboRraImU3aSwwZSerLapvXC8eOm1vqCipVaWNFiVW0XUG/1TWN25rt
 f/g3Ssk6io3auiAhK27iXR2JyEqXJ+GyW0lya0QW3Pwm6gN+2t+pblFWsyAyi8EAMZtO
 kyl1QxzoggncVxNcehg2lJUgLzMckEddylaQXcGiFgLa2VUJ9NkWDQoSmafb/9L/sz3Z
 T2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787828005; x=1788432805;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=8v8GfvZwk7BzWpgG+e3H0fyxQybwxyMNONC30vcpZSI=;
 b=RteFceAtUGG0NzlrsfNtq1oFWmxTPmrwv4QrJpmQqNgjOgOcwxjX8eoCTIoolP0Kb4
 hLc64p1Z2NbJL9xzURndmxcxA3kHmrw305kLtogWybmAm7dJcItbM9mjnvJFCs9dIA61
 LiqQ5ZdAQ7y9j+oCjqkc+72FfvsF5E01ugmPwmgv/HrSgPhTPG1FgXJBjI5dupRZsFpQ
 YjhKHb6lpuMuHlGUDuBrZ/wWSsS3ALgmQ8CctszGGdBaEs+3uaPfkelHaOK3QOaq97H4
 7GZhud+VGVKvyHYPcwv48JfvFC5Uro7BkznlVr/pRgBsnUgqvfn57PF2TYYoZIGISqAy
 ZAcg==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro3t0goUuNO7hENlAxHd3EAt8NXQ+09OFCuxMhj0kQpcY8yzbhQsGMqJLUz+J0UASSgQvaE6owzcA==@nongnu.org
X-Gm-Message-State: AFuF++kkR4ysRmMyb9Q6oV+TWuxbvFsS+HK+kfRcCrK41FIdW1/WJ6Gx
 eYc5l0nBlON60sU8WWRexjGV5iRniWVTOBrD2JkTG7DhULDFmf2VgGqb8njYx8EzL1VJ6YHkA4N
 V4H/eGkQJwVhceZC4haw+5pMRIw5q3dk=
X-Gm-Gg: AR+sD13lsEv4mGgP/SQIU3WOQNV8mOI9B4sVUZtKMSJ5ao673dDGvRWbhjB49fP8WzQ
 dt7kpO3xTVYwLrP53lDG2hhaG+8nWXEwQ9wTCLtPI0Y8P2FxsGL+fMRszIcdaoKAq/zI0PI4nl1
 VlajXROQJ07y8M4DqFSurNGrDW4avyXYZMwlnJDkF6iDAn3beWqfRhRhKdC1UPV6VqwYprRtA7Q
 azCmXZOrwymfmZjF4YV+BvkEZtVsOMt9NSRVidtPQSVmjSpofrtxoyqq+3l5y1u6dBVUX6xQub0
 rLYn/06kAUHygZ0/uvVjayepfMXoW+iAC2kgRhakhHYMfccJlVtIFd/GLJESV3UbuAQzauWdNA=
 =
X-Received: by 2002:a05:6820:218:b0:6b1:b91f:e26e with SMTP id
 006d021491bc7-6b1b92015b2mr1859451eaf.16.1787828004652; Thu, 27 Aug 2026
 03:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260825040452.1322251-1-stephensportia@gmail.com>
 <20260825040452.1322251-4-stephensportia@gmail.com>
 <CAFEAcA8h4JwFFxnTQwxgC2HPAE_YA8CnLSgJo6pdhFcJeLyGmg@mail.gmail.com>
In-Reply-To: <CAFEAcA8h4JwFFxnTQwxgC2HPAE_YA8CnLSgJo6pdhFcJeLyGmg@mail.gmail.com>
From: Portia Stephens <stephensportia@gmail.com>
Date: Thu, 27 Aug 2026 20:53:13 +1000
X-Gm-Features: AcwNN1UBTXOM2sA-Q8fvUMea08dCNL4ND4ttlq2O0VKoNWoo4xudaklyYJg4f_8
Message-ID: <CACYNXwKkh6zAha=ChX_456TF0pyaS-mQsdZsJ_JtP7Fq7EP2RA@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/arm/strongarm: Fix dropped upper byte of ssi
 transfer
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-ppc@nongnu.org, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
 Troy Lee <leetroy@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Alistair Francis <alistair@alistair23.me>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-arm@nongnu.org, 
 Tyrone Ting <kfting@nuvoton.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Aditya Gupta <adityag@linux.ibm.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Francisco Iglesias <francisco.iglesias@amd.com>, Joel Stanley <joel@jms.id.au>,
 Hao Wu <wuhaotsh@google.com>, Glenn Miles <milesg@linux.ibm.com>,
 qemu-riscv@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Portia Stephens <portias@oss.tenstorrent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=stephensportia@gmail.com; helo=mail-ot1-x333.google.com
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

On Thu, Aug 27, 2026 at 7:09=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Tue, 25 Aug 2026 at 05:05, <stephensportia@gmail.com> wrote:
> >
> > From: Portia Stephens <portias@oss.tenstorrent.com>
> >
> > The strongarm model intends to transfer a 16-bit value over SSI. There
> > is no machine using this model with a peripheral attached so it is
> > impossible to know what the intended SSI peripheral is.
> > There is no in-tree peripheral support for 16-bit transfer, update to
> > use 8-bit transfer.
>
> This is the strongarm synchronous serial port; the manual says it
> "is used to interface to a variety of analog-to-digital converters,
> audio and telecom codecs, memory chips and keypad controllers
> as well as other miscellaneous serial devices". I don't know
> if it's actually connected to anything on real 'collie' hardware,
> but if it is then  I don't think QEMU's ever emulated the connected
> hardware.
>
> The data is between 4 and 16 bits long. I think the intention

In this case, how can the device transfer function know what the
expected transfer width is? From my reading of the current
implementation, there is no way for the device's transfer function to
know what the transfer width the controller or guest software expects,
only a value is passed, or am I missing something?

> both for this hardware and for QEMU's ssi_transfer() API
> is that the guest software is supposed to know what the device
> on the other end of the SSI connection is, and program the
> controller appropriately. If it programs the controller to
> transfer 16 bits to a device that only expects 8 then things
> will go wrong in both hardware and QEMU; conversely if it
> sends 8 bits to a device that needs 16 that will also break.
>
> -- PMM

