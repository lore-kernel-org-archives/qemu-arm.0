Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0717D44C5E
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Jan 2026 14:57:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vgOn5-0007Ai-Fz; Thu, 15 Jan 2026 09:57:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vgOn2-00078w-Lq
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 09:57:36 -0500
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vgOn0-0006Vc-Jj
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 09:57:35 -0500
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-78f89501423so22885017b3.1
 for <qemu-arm@nongnu.org>; Thu, 15 Jan 2026 06:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768489053; x=1769093853; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KLju0veGxDRCaNlNCZ9kxVtqnhSLkNS5jHDofzqZdqk=;
 b=fdaebW7ep900y9P/aSxFwOEyd6lcbTaYJwm+0zdgL9vx/gEJOsa9Q8E6RqkolcgaW5
 grWPj0ojcQyXXpvsjRdbMm5sAyDMDMnJ0t5e/gD8V6MRMjCFhsMcB6HTnT/E1rhAkD8l
 pqujt13WuRz7qtMoBxujonzpnkPmINk6ZvKT039nUCGDBpU4Rx4wJiWa78bpZE3FW3BQ
 /KLfISdbjYKn1RNTNwc/oaBWOGQTAMjFDCjRnzmxJQpCnwnA4d1Zd0nB00WPGgF1+pDo
 VQAAHTBeqLXwb9t3mQ8JiY8VhwDKIL4Zd2ximlXsFC8evhV+Mo/I0VQnm94JemuMKbeG
 WG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768489053; x=1769093853;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KLju0veGxDRCaNlNCZ9kxVtqnhSLkNS5jHDofzqZdqk=;
 b=cTjo/SZQMs0ZZ8LWkFxxbeKQEojIJaiRNwfauEcKgpy9+ok/bZ7iP30fgH0+f3A5Mc
 vm9swRST9t1oZWdGpIYZkFoSpNuxoIhyavJY7I/kLcAZA5lJrrd+tM/o9c+3C0cSSy/b
 kWvCk9kgMf1+9YGgycXHbgaLfmYgP8dWnKrBPuo38OP6Q+gJXz36bbx32xt4HWD4px9D
 0GVti0RsZ42BGLQ9JaDK06JHtzsGAdfP9tYJOh2l9u46DUsV0TgSUrgNlyK0qpJFXUO9
 mofv1eAnJsZVDIbJ+pZZNBbdPiLL2qurjnFD4jwUPDYn7V4aMlD9uXstGFvcGyoW70gH
 ajEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXe0Mxpzu+ugS4vRqmyLhwPJWHXJ8ZfG3znJEhqm4NBk05ITWW52lmVmNQJowLYF2SCAwi728lIKw==@nongnu.org
X-Gm-Message-State: AOJu0YxdTkt4g34ux+vWCikioQ9s0tHLibqFccQ9Y6VWutz4KBtiqWwE
 9c03FEGYlBp/yhikFsgtZT4NoKH+tbEehEBtwrT5prk8GlppPVopKyTz2/bB4X1h2ITP5q3fzZo
 nsdlYyg9BNBWNuyvUUtereIJ/AYKpc7j/rNs4Qrzofg==
X-Gm-Gg: AY/fxX4fcBwdtRD7urZAHdusRQk7nD6oxRGc53EUm9mmifERqMJ04Q5vGHXAvuZrpNa
 ytSXH+FOAeFImPPNqOB+piJf0UJdDslkLKUzRG9009C5sa0mE2m792xdcgMGvbwL4DalkvfKxNG
 NuQUPPF11ANTEmErUave4jCIiwbbYmz85b8JVvfs8ncn3O91EcQJoQydFSN7vfUskuB+lNPbfJu
 DMkAvZ26bjX8cCdafIe0yVcQETmiJTybc2TzLdpekRmkvqicV+6hTcYJ/mmNUyoDgp9SxZFqW/9
 aQNzDT8b+Q4mzr/chBfF2mQ=
X-Received: by 2002:a05:690e:16a0:b0:644:4431:5742 with SMTP id
 956f58d0204a3-6490a634d1bmr2335112d50.23.1768489053206; Thu, 15 Jan 2026
 06:57:33 -0800 (PST)
MIME-Version: 1.0
References: <20251204093502.50582-1-corvin.koehne@gmail.com>
 <20251204093502.50582-14-corvin.koehne@gmail.com>
In-Reply-To: <20251204093502.50582-14-corvin.koehne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Jan 2026 14:57:21 +0000
X-Gm-Features: AZwV_QgipE8e9I0ddnG3h3pWcNpLvGxV7Tm9kKn0Nff5rlgV4Un4-Vn-kGgd7fk
Message-ID: <CAFEAcA9w2r4Od5o3BqU=Q_SHTshb1_gHB8oG0aj9spF1Z7tMGQ@mail.gmail.com>
Subject: Re: [PATCH v5 13/15] hw/arm/xilinx_zynq: Add flash-type property
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, 
 =?UTF-8?Q?Corvin_K=C3=B6hne?= <c.koehne@beckhoff.com>, 
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 4 Dec 2025 at 09:35, Corvin K=C3=B6hne <corvin.koehne@gmail.com> wr=
ote:
>
> From: YannickV <Y.Vossen@beckhoff.com>
>
> Read flash-type value as machine property and set the flash type
> accordingly.
>
> Signed-off-by: YannickV <Y.Vossen@beckhoff.com>

Machine properties are user-facing : this one seems to let
the user specify any random device name with no error checking
which it will then try to instantiate. I think it would be
better to have the base class code know via some other
mechanism what kind of flash device it should create.

One approach would be to have suitable information in the
machine class struct, which is filled in by the class
init function. You can see this in hw/arm/raspi.c, for
instance, where we set a board_rev field that then the
code creating the board can look at.

thanks
-- PMM

