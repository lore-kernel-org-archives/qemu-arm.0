Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC90ACA1005
	for <qemu-arm@archiver.kernel.org>; Tue,  2 Sep 2025 09:22:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utNE8-0003bC-LL; Tue, 02 Sep 2025 05:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1utNE6-0003a7-IV
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 05:22:54 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1utNE3-0006Mv-DH
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 05:22:54 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45b9853e630so4488085e9.0
 for <qemu-arm@nongnu.org>; Tue, 02 Sep 2025 02:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756804969; x=1757409769; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WPBJaao5eU9miItbgKqnM+Hdb/dWjIBar4Rn5uGCU90=;
 b=U1cVIZBnOy6zHu11PSz/pSEAKGCQ212ek8srojz8psQXun/wSVYqoigrTyvJuBfc7I
 EP7ryvYTiLJgY6oNgtfJU6VaPYVSo8vz4Rxz6G7WfO2nihS2fkiHMXMm1NmFKGXWm+tR
 KAE/pNYNKNGH1x0Bj4EWd/RrsECjkDbDrWyGl/64SBULLXzVdawMBQs0EvSHtxJGqoGW
 ksOVlHkXweKtfnxR5vJIj4qBLEnTtPycVfCbW6d4PxtDdzliBq0o0MN2SCDR1VrrvYhP
 FPFB1OuPYhRCICpIXr1VEhC4EYQFiIeeEKltWcBU+W5RxhUtCTG4YHn89Fo5ElHx/rxI
 PRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756804969; x=1757409769;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WPBJaao5eU9miItbgKqnM+Hdb/dWjIBar4Rn5uGCU90=;
 b=NLYQGqbwMNj59aDosx1skER22siwdkDIyAOlYe0HJIRF0UtMx3t/NFOFijj2EPXthw
 q7ck0egp1c9P7b+IIX7mGphzp7vVdS+HTbV7tlsMsXUMEBFRaNFjfyeETS6Lw8Ay7jQJ
 mqrLgLyyPLWaJY7bKiqXP3lMh8moUjSZbbg3BvRscQvwNbPrYcK+uQVGikE+fLBoqZ+b
 aEzNN25eykT2267HgOx5hFDsQm9WWaUARGcf7FO2IvcTW1uieyt/xbtmx3hS5VhDIxVM
 D5wkmlI2GGce88tN6RfF7W9OnTMWmrniswMVrLKSrP8ZZ8mYsBAgYbFrB1Au9QMMy7pX
 Ei3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXotFQktnUyVW7hBBKsINEJmwWnpuXYa5J8SNbM/pHzeiMjR00r2xNK6r8v9OhnN864BWyYjGRvFA==@nongnu.org
X-Gm-Message-State: AOJu0YxC05JK9lMiAI5a8QOiYikmobEUzGYsaWFdK3qBr8N9ETIEaB5F
 ymRbfuWk6wy6tLHBC0ZSiutui7JnMvSB1EcRDGdW6axWUd50NnIHQpZawB6xoKZf2qg=
X-Gm-Gg: ASbGncstXg6HFpflL5/hiri5DVvc0vBYgjsma4OoUcbWtCtSbSlkGnMn+qOONIhMMqF
 6AaPG14Y1PurxrYk+8Gh9knt39a9gUgY1qV4qfnUpRoo89s41DtVBEKSPeZTZczPQmtRcskZv87
 LmCM2M7vnXYwFWx3n65ek9ad2YKmdif0rap6V0sB1TbrgdkOw1GAb9nRgHRk0JouPnIfgAerR5E
 +1CjXafaBIg3ZmBZimRGqeZj6ZZ9h5BUVx4H4+L1l4oIdqso4C5j92AJJRuvJHJwmNzTde4OyE4
 v97iBE1vKTuYFY0+nf96tlVYnu7IpScjyJiz262ACpRoV6z9gT9BmVtTJ5jH6F/ikN5VuE1Xox8
 1Xst8AYpI2flxq5AH7yUhIAmYVZYsxV30z8EN5WUQcq06
X-Google-Smtp-Source: AGHT+IGtVRj02XbDxp/oZkR6xLljpfRs0MXZUU2nscQdKfGFiRwvUDCIswEJLfdafOzKqQWoufz6fw==
X-Received: by 2002:a05:6000:1acd:b0:3cb:46fc:8eaa with SMTP id
 ffacd0b85a97d-3d1de5b087dmr8666817f8f.31.1756804969301; 
 Tue, 02 Sep 2025 02:22:49 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d978ab6fc7sm3469726f8f.45.2025.09.02.02.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 02:22:48 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A34135F894;
 Tue, 02 Sep 2025 10:22:47 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: peter.maydell@linaro.org,  qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/arm/boot: replace fprintf with error_report
In-Reply-To: <aLYXHdYRlLyjr7Gc@osama> (Osama Abdelkader's message of "Mon, 1
 Sep 2025 23:58:53 +0200")
References: <20250823150321.135527-1-osama.abdelkader@gmail.com>
 <CAFEAcA-GpC3ouaXTQ18VhcY7c-jXK_SF0MLiCMFW471U5Cqr9Q@mail.gmail.com>
 <874itm2joo.fsf@draig.linaro.org> <aLYXHdYRlLyjr7Gc@osama>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Tue, 02 Sep 2025 10:22:47 +0100
Message-ID: <87tt1lyzrs.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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

Osama Abdelkader <osama.abdelkader@gmail.com> writes:

> On Mon, Sep 01, 2025 at 05:59:03PM +0100, Alex Benn=C3=A9e wrote:
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>=20
>> > On Sat, 23 Aug 2025 at 16:03, Osama Abdelkader
>> > <osama.abdelkader@gmail.com> wrote:
>> >>
>> >> Replace direct fprintf(stderr, =E2=80=A6) with QEMU's error_report() =
API,
>> >> which ensures consistent formatting and integrates with QEMU's
>> >> logging infrastructure.
>> >>
>> >> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
>> >> ---
>> >>  hw/arm/boot.c | 22 +++++++++++-----------
>> >>  1 file changed, 11 insertions(+), 11 deletions(-)
>> >
>> >
>> >
>> > Applied to target-arm.next, thanks.
>>=20
>> I didn't see this had been posted but I did a more extensive clean-up
>> here:
>>=20
>>   Message-ID: <20250901125304.1047624-1-alex.bennee@linaro.org>
>>   Date: Mon,  1 Sep 2025 13:53:00 +0100
>>   Subject: [PATCH 0/4] arm_load_dtb cleanups
>>   From: =3D?UTF-8?q?Alex=3D20Benn=3DC3=3DA9e?=3D <alex.bennee@linaro.org>
>>=20
>> >
>> > -- PMM
>>=20
>> --=20
>> Alex Benn=C3=A9e
>> Virtualisation Tech Lead @ Linaro
>
> sorry Alex, I didn't know that your patch set covers that.

No need to apologise - qemu-devel is a firehose of patches so its
inevitable two or more people might touch the same thing at the same
time.

> I just submitted a simple patch to replace fprintf in raspi4b
> Would appreciate your review.

I have left some comments.

>
> Thank you.
>
> Regards,
> Osama

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

