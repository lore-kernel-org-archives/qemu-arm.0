Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96D6C61DB9
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 10:38:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzXU7-00053K-2a; Thu, 27 Aug 2026 06:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stephensportia@gmail.com>)
 id 1wzXU6-00052u-3X
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 06:37:26 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stephensportia@gmail.com>)
 id 1wzXU4-0006Ru-4j
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 06:37:25 -0400
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-4b1bf68b387so1393604b6e.2
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 03:37:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787827043; cv=none;
 d=google.com; s=arc-20260327;
 b=SSQsNyrA5J0H++ettVOLpOp+669Rz+DxQn3w6vOSRuH27f3PA6w8wXiAYHW059oFzM
 IJDrywGzEzn4i4hrqlJauKtnOzg44kBvwsUUf66MQ5aLreES4A6orFuZE7y5zzmm7tnx
 xnI4b+c7mEQ5JCC+3ZLbIc7FpCMyj6irIi1VCvxmv8W5f8wie9qVt+sjJKwHpwhxMDaa
 wgHS1UtLEQV7GlpHUq8G4Iq+4kqiKbPObJweQsE+DnXfyd3Z164b+5OEeydNJyAGbh/L
 hra2kYSP1BCxIFgiavtKYssUDx7KGMsOZ0kqGkdhgxL3hpk7teCdn+MZRsFbwOiUmr2p
 cz6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=+049ShgHyUj99nuL783HWpFvu79K2tvNuriDgzPsxd8=;
 fh=nPgAUYFkdTzHSqjbhNjCDUJzT5MRYH4w1BVSOYzQogs=;
 b=avSqZt/VSRcJbpI0cKGEjC7+c6HSzlS/h3RuFJ+bMrJ1ZYt4VZGmIVrXnoDo+Kl+EK
 oFyEyEyTRsLHoqehn3qBJWwKamQpUHsxD5RwdmpTQoVu6MfNZLh2Blrp7wXHYLcVF9SA
 gjBwGEaSKk/dG8Wh6KeRl+ax3tBDxRKQEJS2EtBa1fXSqCCMLVu2PPPlcDd+wwHNHSvH
 XcVchq0anKrLXxBnqirqxPXHiiaPWIUwjzxP+rzL1mAdzde8spYQV3ppQtaCYxz28kZF
 w4H2wiHscYsHgfDz5Ks3fQoL95xBBh0T4/Nd1CEhZyiu+qDAm5tecJftg2xaQgGkWhMp
 T8EA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787827042; x=1788431842; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=+049ShgHyUj99nuL783HWpFvu79K2tvNuriDgzPsxd8=;
 b=eAFAnMAC+pQ/C1lVpTJhDQJ56+rXaC+uvcNiZkr0DyRkAymbpnpf+mCBwLNkLc7d4w
 JwzFcpw6/oQya2LQ3kP1L8qgERbVVZnMdr1XZS7bc4iwTVSnXgtgC8Vq/IF4Hdy25ZtX
 tbQx9dwX8C/5MDBZHKsLUhKFkmJlMPwnDloyl5LAz3c8gZAG0acd4uCL6yBbcvGdY90P
 45fjLJtfXExMPWQGf52tfOdKB8A8dYD40dsoBfcWUJO5YMjPSbDlezGYS831J1xvRtD5
 +eVYadb8fHRFXKWUBrIJNooRwuU8ctM1k59PZb2oWnzJqBrJ8O0v+ERhl7wSYf4rkrF7
 EAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787827043; x=1788431843;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=+049ShgHyUj99nuL783HWpFvu79K2tvNuriDgzPsxd8=;
 b=on89jjJ4cehZ3qUZ421kdHxRUxIb/jb5pKYiYSEpzKb9cMEV0MSDJcEabd0irelqNG
 ukIohps/joF0Tyh0HZq0k+y0jYxPPMpbQGIr9itucj41ZIVDUPeEbPrprpyHeN+EQr05
 bw9N4wrdUVnXNe4uGPk3bhJQoV2B8rcLpb0fyr8mrEbI26A2dVtf0jNxl72z02GRjkuC
 bctmkMlhlP8r+EB8UY6WznIA7YoITrjVDne2jpwgfMyB35/18kXpO/FW7Jwhvq13zc2+
 rufG+OlOeW/iqn46QvQWiUL+KKTfIVyXyn4B7L9d9iq74oO8kuUMkDDnJY4Lf0kc4yM1
 3ooQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoyFWL39/veakMesec7IE7e0d8nHQScLDyhVJBwP88nzwgwP9A2RdM+Ct1aLddN1bdkhp2RtjA9Ww==@nongnu.org
X-Gm-Message-State: AFuF++nVfZN04KzrvtfRq6v7mBNA7u6bh7EzEtu+BAU3m1BFF6q2RnoI
 8tj2e4BX95foDWagpFjZilJsMKdbxbFrcfmQUjMVxGNwS0mZjWaciFVRH9HJ6RQFLB7Io29dq+3
 4WOCKxbC4zo6D7hUtQf6WDB6fs4x6FLc=
X-Gm-Gg: AR+sD11oNySVrWgYzE48Q49CwG1Bn8vOXa5WGtO2fTI/D1x9ORlOBiLO9dKOHnuMS49
 U63VS+G7tJl75q0xBZOvBrd3zqpFp/5vGuFySL1Du1SZCTi8qYFG3E6NieEe8vBgQ/MZxibikr3
 PrtcrgX1q3WQwIruBB2SGV0oCwfVC6xnkor5WtrOyvyqU4JzwOfgWCC20XRQM6a+v/gYJNa5ki4
 7lEX+OzBdKuOS66STBZTO2sJVmuGwoqCu2KBTUwsJcP/TkobMZCM8cwVeqIuEU8eyhrKKaOc7zI
 jP5TjMX+WFxvOfmqH/MLtdcAC5IjCHKWxX97bSiKt4r3rM/PIR72HQ34LOmD57p48xlZUAghqre
 qz5+WvSba
X-Received: by 2002:a05:6808:1910:b0:4b3:880a:f08e with SMTP id
 5614622812f47-4b3880b1abcmr2250536b6e.13.1787827042685; Thu, 27 Aug 2026
 03:37:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260825040452.1322251-1-stephensportia@gmail.com>
 <CAFEAcA9etHvjL1igO4mFy5iQNy1pCbNFGaSg5HFva+YCeMkGEA@mail.gmail.com>
In-Reply-To: <CAFEAcA9etHvjL1igO4mFy5iQNy1pCbNFGaSg5HFva+YCeMkGEA@mail.gmail.com>
From: Portia Stephens <stephensportia@gmail.com>
Date: Thu, 27 Aug 2026 20:37:10 +1000
X-Gm-Features: AcwNN1XcfRUbsldtwVE7ZLjcGTDazu0Fo4Mo2swVpAOsooTm6tjhILuszIFYo_I
Message-ID: <CACYNXwKU_UuhrBWHNFtYYmSfzRsUd5jRFjSc1++xvQHxPk6rew@mail.gmail.com>
Subject: Re: [PATCH 0/4] Rename ssi_transfer to ssi_transfer8
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=stephensportia@gmail.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, Aug 27, 2026 at 7:19=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Tue, 25 Aug 2026 at 05:05, <stephensportia@gmail.com> wrote:
> >
> > From: Portia Stephens <portias@oss.tenstorrent.com>
> >
> > The ssi_transfer function comments say that it takes a word varying
> > between 8-bits and 32-bits. ssi_transfer takes a 32-bit arg to transfer
> > but there is no means to indicate the number of bits that should
> > actually be transferred. All child classes of SSI_PERIPHERAL class have
> > transfer functions that, despite accepting a 32-bit tx, only transfer a
> > single byte; m25p80_transfer8(), ssi_sd_transfer(), ssd0323_transfer().
> >
> > The current implementation depends on the SSI model to know
> > what peripheral model will be attached and what transfer size it
> > expects which is error prone. If a SSI_PERIPHERAL model was written tha=
t
> > accepted 32-bit transfers, it could not attach to any existing SSI
> > models.
>
> What is the motivation for this change?

The motivation came from reviewing the designware ssi driver [1] and
realizing how error prone it was. The designware ssi supports varying
frame width but there is no way for the controller logic to know what
the transfer size an attached device expects. It seems like all the
code, that is actually connected to devices, is just written to expect
8-bit transfers so it should be made explicit.

https://www.mail-archive.com/qemu-devel@nongnu.org/msg1218153.html

>
> As far as I know for the hardware SSI protocol, it is indeed
> the case that the SSI controller (and/or the guest software) needs
> to know what transfer size the attached device expects: the
> controller just transmits (or expects to receive) however many
> bits it is programmed for.

This is true but do the devices currently model only support 8-bit
transfers in hardware, do they not support multiframe transfer? SPI
supports varying framewidth but the devices are not actually modeled
in this way.

A better solution may be to have multiple transfer functions,
ssi_transfer8, ssi_transfer32, etc. This would require the device to
explicitly set what it is expecting. It is challenging since the only
model's not using 8-bit transfer don't have any devices connected
upstream so testing is challenging.

>
> > This change updates the the naming of ssi_transfer to ssi_transfer8, as
> > well as changes the return value and transmit argument to be 8-bit.
>
> This means that the API will no longer work for a controller
> and device that aren't 8-bit. We happen not to have any of those
> devices today, but why specifically stop them working?
>
> thanks
> -- PMM

