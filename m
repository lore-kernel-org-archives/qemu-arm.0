Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3284606A32E
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Nov 2026 13:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Gxfcb3M0
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xRUZ9-0005cO-Nb; Thu, 12 Nov 2026 08:10:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xRUZ7-0005SO-NW
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 08:10:09 -0500
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xRUZ6-0001L8-3N
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 08:10:09 -0500
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-67c6a0abc2eso2169872d50.0
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 05:10:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794489006; cv=none;
 d=google.com; s=arc-20260327;
 b=PhrCr9cquqAptEjcNvB0FNb6c0JKXxV1aSpqvbxZUGT6CJwz6KGsoU0VUiPlx95BUE
 5GYdwTBw6c57BbK808hXmwlEawh/49XTzkeWNkyTgrKGB1yy82LNpWrvABwQJNIu9LXo
 9x1xGwnl4in1Xh2pOiAktMQbbklljWTJfAshFccjWBZolsgCGiyZN8FA95zr8iIYA2O8
 km6x6SKEHSW4tPyOiN0fT2k2MKtjVTjNK+r2QEAYNal5USdJeAUUey7Vu2t9dRdbIy1i
 MyU4uGPZIuBcMt2oz17WypSV5J2pIFoBQ72XI8GSLVNR5LicOV9B+EHjXEckw3xE58Bg
 ZKUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=nMySanBpzNXfKjFd7aBQpGBvl+mNf1G+VUmyrU87fNY=;
 fh=dObdA2GdvpwVIQnWd9zV/b9QPHv7wp9q6lWVF8RYyXg=;
 b=Asmok/LxjhVqApFj4C6Z1KGdL5vsEXbnK1rvXrjB273qdnr7G6Y+elIK/actaxFGb7
 TIicxp6m8uxFFHsKxFSZygFapGIqoTMTzZzUQEpT98egCWCu1cQPIb+HPmDJLqSDFQap
 A52Eff2lWb4Zr7FKhHaohjSsstqnz/a9lW3uYQinNsX4XwEenkT9Y7LSuMilvy3x8pT/
 Fba9nrRGyafwxHxF9gWigSDkfFvMlQ9BCGYwVMRQKmjQPlSk7OQsm1fchtrGLkRyW+zy
 laBycFlJjulWVm0eo0kdaHsvPD+L8zK6iYW9oonreoIPGWp1j+iaKpshm603TnsWmNE3
 5jug==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794489006; x=1795093806; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=nMySanBpzNXfKjFd7aBQpGBvl+mNf1G+VUmyrU87fNY=;
 b=Gxfcb3M0qNg0nS6qw6JcrOsqJ1lJ/SPjMDROt1QMu2nfntK19mikC01ojlRziX9fzM
 6MR1+7oMo1TFOuWywaK0yPe1ilYIsr79NsJDx3KRGVyGI69ra+VJ7+e2Ko8G2o1UEHre
 p/S9zBtz/i4rGa+LIZMTgNyK/5Z3mlXD+cxj/9PPw6jXelyvFvHGSY+Q4eyYlGk5V8nk
 H/TqUT6lwwHec6XP/uZmsrGSPOweJI8wT08x6+8ZB+kDBXDnYhHm2gVDSsvKCvHKRmIH
 Yqev3ZbCdZaazr3xLVn5DIMTsO/t/9UUP/HjeV+bYk3Tia/d55ZTLqPctv4VATXYnnGP
 qK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794489006; x=1795093806;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=nMySanBpzNXfKjFd7aBQpGBvl+mNf1G+VUmyrU87fNY=;
 b=rM8jiPwf/a8H36OXnfhliMYyNCvmOgUyYgUgFRk99ZKOkspJEEc71WtbLBC5sjel9y
 mV5My/4vDZrjk1fE39qT1MQ1ra/rR0RnUrpck1vS89KGfBkCv+A+q6Q6YLRv074DAAPs
 Ee6yuRADlv6+ExafHaqBdgMRZ42MFvQj7wzaO36Ej1ur3hZt2KS+aprdatxdNEq88Wjq
 Fj3kr1Wnm1ohC0I7VMskmOnhxXHn1c1i1U0ksU1A7STaJ+YL/5gdIHutMpgc9jT/Xirp
 bjvYniT2NXWRgNV52G4VoI+rBcAkWpqbdKr1OQuqZBaZ9DfDOMsSZmNLxgK8LqY8Q+sb
 Kihg==
X-Forwarded-Encrypted: i=1;
 AL+hErGOBL4my0kjSoeBc1guYJfCNL54g/A4A8nBAmrNMiehCFGv48ad0RiB0mXU/FugQRFGrRGnv7TLdw==@nongnu.org
X-Gm-Message-State: APuU4Z+kLWfkO/EQ4EV24YgZlbqzsHd9JFrdn2zf7rIf4pd9dJ6WM6rt
 Czr6Rq7ZB3EG+H3BL8w0PhbAQVbK4pqUjwbBz7eEAbYa3uEDyQR05qqztD6iIEaazCaJc4ZXVLc
 hK+dvV5b3LXhe+5fvdg/5Wb2qsDRP7UDCF+5gqHcc3w==
X-Gm-Gg: AYBFou2QP+3xjPzUUK55My++5Uk3m4uc3gkJEJfOjMG7llcXlL2MJLlKkVWUrTCdMPl
 ER88FlMdpBpyxH+bUjRaWTvhqZdxYZDZ3WXU7iKJPs+m3tNx8L4su5mZMRswuc403KmKTMXNZ9z
 tOCPzbDBqOFaeHd8QqUQgX3+DA7YZAqyjRU8UPrNtwLXM5OFMTFXGVmF/p1Ya7vP5n/MHoiRmHF
 y8TROlU4X3/I55y2L3IfRxX/2b7NNPSXZlZVVaMP4PgRWGHjPRF1Eh1y8AWUS+5g5ufPBG47wCY
 GqucnXJ/i8SyceWSxe9K6DNbznGFtzFhqoJ/PYY0XSibmyanH1B0KnyiJbbeTf1l0gt+AdRwP66
 mmBMOhFGeDUsGpNVbmExmOdLa3BIgs9HUuff/vxZ2fReKxDJ/CrXvQQXcT6wv+hU2ATH99IVEd2
 sQezrMe7+NDQWlkD6INy/Q
X-Received: by 2002:a05:690e:12c6:b0:677:aee1:9f2b with SMTP id
 956f58d0204a3-67c67ca7a90mr3362603d50.12.1794489004820; Thu, 12 Nov 2026
 05:10:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021065238.15220-1-conti.manuele@gmail.com>
In-Reply-To: <20261021065238.15220-1-conti.manuele@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Nov 2026 13:09:53 +0000
X-Gm-Features: AclHuK91k_404xGNPKVDV0IIvjhlkMoTqmp0kq7EQAV1TyitwzdpdyAmAk6MtHY
Message-ID: <CAFEAcA9=pt=81YWPXEZ+UEnL5iVbqFAjxbMYtH_aoJHy4iAf_A@mail.gmail.com>
Subject: Re: [PATCH] hw/ssi/stm32f2xx_spi: avoid transferring data on DR reads
To: Manuele Conti <conti.manuele@gmail.com>
Cc: qemu-devel@nongnu.org, alistair@alistair23.me, qemu-arm@nongnu.org, 
 farosas@suse.de, lvivier@redhat.com, pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 21 Oct 2026 at 07:52, Manuele Conti <conti.manuele@gmail.com> wrote:
>
> Writing SPI_DR already performs the synchronous SSI transfer and stores
> its response in spi_dr. Reading SPI_DR performs another transfer, using
> the previous response as transmit data, and returns the new response.
> Consequently a normal write/read pair clocks two frames on the bus and
> can skip bytes in a peripheral's response.
>
> Return the response saved by the write and clear RXNE without starting
> another transfer. Repeated reads then leave the peripheral state alone.
>
> Add a qtest using the upstream netduino2 machine and an M25P80 flash.
> Check the JEDEC ID, RXNE clearing, and repeated DR reads. The test requires
> no board changes and reproduces the unwanted extra transfers before the
> fix.
>
> Fixes: 5ae74402d1f ("STM32F2xx: Add the SPI device")
> Signed-off-by: Manuele Conti <conti.manuele@gmail.com>



Applied to target-arm.next, thanks.

-- PMM

