Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DDCD6100D
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Jan 2026 11:42:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlQP7-0000Gt-LM; Thu, 29 Jan 2026 06:41:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vlQP5-0000Fa-Uc
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 06:41:40 -0500
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vlQP3-0001LL-O0
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 06:41:39 -0500
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-79273a294edso8284837b3.3
 for <qemu-arm@nongnu.org>; Thu, 29 Jan 2026 03:41:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769686896; cv=none;
 d=google.com; s=arc-20240605;
 b=dkmXq9Wsn16JLWiM6r0TR4pnawDBehAkZOP3GlGyYg94vXj7hrUHaLladHyJjlBDQD
 /F/PTHhJKo4snzs4Ir7YKp2G4ijy3OiWxFz48in9Khf7A5hxbn9o5RwXiCe6GbiGNXXf
 L+PeuM8XmjhxUvO3tSKiBueUK4KAKtn8nom3BMWXp9nw/U7vECo5O1eM4KctPAS+/4Ia
 mNzyaHAGOAeGjYTS0SZJaFanufgIGyloTRP90maTXof56SSQ6SDXMtT4zFgY8LKPJwuy
 AopPM7evah5bYcD2a1VTsP9x1R4yIWApEzAF3X9838Ux1bcX6X/NQaoTMiDjTLdD9yyp
 VD+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=uimdnHTjxESHe6U4Yu5NNwY/Dveasqe0UAi1Rs6N2HE=;
 fh=no0SYXYZGXVCWapVLGd/mY2S6KmDryJ/4hhBbjGr4sQ=;
 b=RQsaHtD4N5HPT+r+0Ec2oXub4ARleLnquZHXVukxtNEPgauquDyoYCCafNR3HVahL5
 v0f52RwydCwpVjoNNxlDLeqSCfNJBiqVttslnxFjqF4VNjV3jvr8pC0rzgBHW9IKVzqH
 y+Si9uo0LYZ/DDOkU9p0ZZuNdZseeOQw2zxL+UMFEF4CwZo+qEj50yNZ6xpdreku8fcN
 Sg5eILhFt+FhWfbfQExiv5uhjXndVuFlW9Fmt9Z+CTGqeyl/+rMLFw2HbgzoTaoxXZTe
 rkCMrLvV/eqVUG5SVrMgdX9EeStEJ4EWvjqjz6/gqF5nqNG5ksN0Xz/5aoAmLWOuA81B
 lzPQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769686896; x=1770291696; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uimdnHTjxESHe6U4Yu5NNwY/Dveasqe0UAi1Rs6N2HE=;
 b=Z/iKj9ro2YDE+YCeZ4dP4x6WdhFiwNa8pYH1DO7rLlDoEc/uv9ygpBd7yGZHGf2nk8
 3GtLWOOQsvlMkUxt3V1IErqQeeneYQF4ozYC88c4EU2rq3wPiYhz2JMjG4kAUjx1NCvN
 Rn4dxcw+/9+CTsnelfYyw1VUkqbv2cmZRGS6X2MyypByR5DqDAvIyToXH0S87q2Afu6d
 AB84FH6YujlkV4muS9mHtVJVEi1HVuEetgE891iVxejlaeS3lRrcEbaFSmM8sefnzfKw
 sSJjrFvYhSka3qmqAoS+pevBc/FKIoMJGivSUyVe95vZ3/bzCQsoNFDU4GeCoUCkVCo4
 easg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769686896; x=1770291696;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uimdnHTjxESHe6U4Yu5NNwY/Dveasqe0UAi1Rs6N2HE=;
 b=HzDyUgez0OfV2Or2KzXWuMEcVc9wm2cTQBGi2DBHMyRUg1ZAPF89Vq7CTpTDyy2yzS
 CoTUIu2j3p0aY9uMWqmAUqOIB3JaSrdBr/dxyQlFmQrVheWd8QS2CqR63xSyQfAZpfg+
 PFbOaao8nEfCNXDvzfwifJCjVCK0kewPQI8k7bP8W7WAADcZE5UKx8tQxYgXIbIVNF2G
 T/H3GriE4wvVaRT8lTOFHVBiWMEhsjWn6e6QRKti+LdFd3qLt5kk+eHn3mhwUk/yuRKL
 t4NekolKBX5ITp5rDjd/InikgOPrTmqPz/Frchqxb6KrwcADlap1pgwJpOridVxZWgZ7
 z4FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUR8eIVp+E759V6HiiZVpuYnOGoIQMrTdpzwrayMLIgAscOW7Cg5WoixI+oTeBuCmTParvoIGBUug==@nongnu.org
X-Gm-Message-State: AOJu0Yy6+gAlYLL1DrKDLCKVzQHZSQRdR7LH/QCpHzi6kSta7PHsWOD1
 XYQu0RV7ZPWFyYU7flGBIYhUDpLORdhVM8nh3Di1WxBfWx7DegijBmsiwhseicGmC8Q36Ke8Kds
 dcc+kZt/+jElzxXyRmnRZWPYbNXp/D9eGu5NiTm8vFg==
X-Gm-Gg: AZuq6aJFDOn/Zq12z8vygUhrjbd0/D8VLw1t48iXd2/NGNVnJyFda1qoVp7hLFrP+TS
 Eo2ahQHE22oPRSELlmhG/6rrxs2pGR+pALN6vjunErkFaoY4wOCyVj6nFQmmINpTvQ7MmriKSNy
 QB5/65gK7Gzk79au/PkjAA41I8IPtqNgBPr8QAtybbvAm9Dap59n67SMfLh8jeFsKQkrqk9nCup
 l+agQmz70Ia4QZFf4HMCJbEXjSPzQJkIZWzRMTGZ5YqX6mHQ0VR5I+BwKjDVctZF3+nGg==
X-Received: by 2002:a05:690c:102:b0:787:cad1:bdb2 with SMTP id
 00721157ae682-7947ac93bf2mr71809997b3.69.1769686896233; Thu, 29 Jan 2026
 03:41:36 -0800 (PST)
MIME-Version: 1.0
References: <20260115-sme2-hvf-v2-0-2eca481bd7ee@linaro.org>
 <20260115-sme2-hvf-v2-2-2eca481bd7ee@linaro.org>
 <2c3bb870-0321-4799-b7ca-65b2772ddf2c@linaro.org>
 <CAAjaMXabRsOX0OVXN202ev3A1sKqMmbDoeY6n7Z-EhmZWmL9Cg@mail.gmail.com>
 <CAFEAcA9oZ=rhUbw8WK5nUPAvs0TEPCJB8t8ReeViv=0b=_x-sQ@mail.gmail.com>
 <CAAjaMXZLG2aBtStRhyvmdENj1Z+Mx05BmDgyYUoYrc_ZnHwyVQ@mail.gmail.com>
In-Reply-To: <CAAjaMXZLG2aBtStRhyvmdENj1Z+Mx05BmDgyYUoYrc_ZnHwyVQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Jan 2026 11:41:24 +0000
X-Gm-Features: AZwV_QhiZwgWeiH3_RacpRrXFgRjLYr49rU20GVeVljiCA_drdbnCkdlxNs3Q1o
Message-ID: <CAFEAcA-odFctT+aJb3xXDa_76=WGPRV6eMNdNTnYHqWV=x7VNw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hvf/arm: expose FEAT_SME2 to guest if available
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>,
 qemu-arm@nongnu.org, Mohamed Mediouni <mohamed@unpredictable.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL=1.623 autolearn=no autolearn_force=no
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

On Mon, 26 Jan 2026 at 08:34, Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
>
> On Thu, Jan 22, 2026 at 6:52=E2=80=AFPM Peter Maydell <peter.maydell@lina=
ro.org> wrote:
> > If giving the SME registers a good workout with the
> > gdbstub interface all seems to work fine, then I think
> > we can adjust this condition to be "if tcg_enabled && ...".
>
> gdb had a disastrous workout, because it turns out it also assumes SME
> must have SVE:
>
>
>   (gdb) target remote localhost:1234
>   Remote debugging using localhost:1234
>   ../../gdb/aarch64-tdep.c:3068: internal-error:
> aarch64_pseudo_register_type: bad register number 160
>   A problem internal to GDB has been detected,
>   further debugging may prove unreliable.
>   Fatal signal: Abort trap: 6

I think that if we rebase this series on top of the patchset I
just sent out:
https://patchew.org/QEMU/20260129113455.1283266-1-peter.maydell@linaro.org/
that should avoid this GDB internal error (which happened because
we were reporting the Z registers as zero width, so GDB got
confused about whether they existed or not).

The GDB and LLDB changes to handle SME-only CPUs seem to mostly
be related to the ptrace API, because of choices made in the Linux
kernel API about how to handle SME-only, so I'm optimistic we don't
need to wait for anything to land on the debugger side.

thanks
-- PMM

