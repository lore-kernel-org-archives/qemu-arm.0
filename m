Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09206C5AD55
	for <qemu-arm@archiver.kernel.org>; Mon, 10 Aug 2026 14:58:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtRSO-0002S3-OG; Mon, 10 Aug 2026 10:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wtRSN-0002Rf-JK
 for qemu-arm@nongnu.org; Mon, 10 Aug 2026 10:58:27 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wtRSL-0008Mv-SE
 for qemu-arm@nongnu.org; Mon, 10 Aug 2026 10:58:27 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-49557167508so16365535e9.1
 for <qemu-arm@nongnu.org>; Mon, 10 Aug 2026 07:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786373904; x=1786978704; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=MxdIz3kikgU2hEFrcrCau2io7vnun9UoeypO6RHhoik=;
 b=DMgqXC5OlmcbpRE95TWE8xueFqssh29+VrjcUCNvUINA/SOAI7VXBsMKj2eiqM5YGR
 v6zAn/ToNHaj1RlBXCvAyBfT3tK5A1EbfFgJ+wEf7qMAPNjlmgttt5s7ktNN9ulTVMx6
 FbSuR9V7F8GrfoA2RtEBp8XjTzqTUTedH0lmlfYFZ8iw8FsXrnkJOdBaurwU7vGnoUeR
 0HeINNmVoD3byw6DJmDv/3uXrm4w39vib+Gqee+eJ7xtA59m5Kiw5oiQ1PLkrRmU9p2f
 hwdA5yGpYMSKM3WcZ90+n0czFoSspZ6RuTlwELYmpYKJOkFQ6v+K7kcRYch2Etylhwmt
 hKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786373904; x=1786978704;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MxdIz3kikgU2hEFrcrCau2io7vnun9UoeypO6RHhoik=;
 b=B2ksvbf93uZFQbw20AJ48qzKjnM6WzecyJtst7FB3YJ0zm5zaH89jX6u2vOYMgeWQi
 4Rjhr15u+vJDkG5EAxun9dUmI7upa+YiKMVnGECPiboVeVmAA5xevq5UhWCwENcut1J5
 UWs6Bh+LmyjG0JHqNl2UMTogNR9NQl6ZtPYs9gvQkndmZtVm0idbTdMHdBZ4HWo0l0Qc
 quv5UB1DXm5jvlfFyvnsMyXB4yqID9wXEADl+bUcw+YVIjQdHTSKsp0f3q6rPPp/nvzO
 nifdGuW5qQj/92g/1pcE0KBNMm3Ws7C+jrrgkpYHfIzevcrTcuLHvyljgXPiQTslmAY+
 Nr1g==
X-Forwarded-Encrypted: i=1;
 AHgh+RokKtsiZCTJ8fpekRGYaJS3yGjpuXsQSRT0M6BTPysl3wE1Llic8yG2egXDg2+gzJTGxZjhigjsbQ==@nongnu.org
X-Gm-Message-State: AOJu0YxX3e3LiaYBP7N4zexWUgsWehjhdgsdwW5LPtf2WrlwGUnvmdmY
 qQx+bf7Eab3fxG5F9I6fETncJyxqHc8kbclESGxBL9PxZoCdFcDdls8x3qCRs4MGT+M=
X-Gm-Gg: AR+sD10B9EA2VM18/hlKBNSHo67URiQwRZiHvuid37pQgDNNY/XlyQ9s9IaZ0xCWyJ4
 XlNUrnQmR/4MzgpP+X0Cprf5Cp8ihdO1Wn95oZfZo7ptrW4EZJmY5OVGN6YjM9NqqHLOeX7pQHE
 33ta+P//3TRg+7TfLSyburoa9H1U4L4q84g1psIjG5dpIZXeYY4jw125RIYJBfU7wealHrCviqh
 /bd8018Vxfuumxw/bplA00Kdog3DMBQWvYEjT5mT3N5kuUiMsPb+vTU5qB8lmR+PSC4XRh49/2Y
 13t01bQDi5brEsAHj6rpapAguGUJmS14fHq2MWGIRYazzbdvCmEEj73PFNN2SrTwQlv+5uFgRa7
 PMd0bEmv/QQ7jlSMAv4dzLD1cmzdyn0hAISuR9elp3xgw9qV99r5BeVV9nVGPurvLgsQDdkZR/G
 0Or0w3MzdbBKMIAB7TD4JOZf+dL3ZeB1ncDBiWTOfoO6OMTqVjuen3bI0exD2c
X-Received: by 2002:a05:600c:1d23:b0:499:51b8:d649 with SMTP id
 5b1f17b1804b1-49951b8d652mr502149015e9.3.1786373903672; 
 Mon, 10 Aug 2026 07:58:23 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4995ea2dc4esm345729905e9.13.2026.08.10.07.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2026 07:58:22 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E92D55F83B;
 Mon, 10 Aug 2026 15:58:21 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Cc: qemu-devel@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?Q?St=C3=A9phane?= Graber <stgraber@stgraber.org>,  Paolo Bonzini
 <pbonzini@redhat.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, qemu-arm@nongnu.org,  Alexander Mikhalitsyn
 <aleksandr.mikhalitsyn@futurfusion.io>
Subject: Re: [PATCH] hw/char/pl011: support backend hotswap
In-Reply-To: <20260810121525.100540-1-alexander@mihalicyn.com> (Alexander
 Mikhalitsyn's message of "Mon, 10 Aug 2026 14:15:25 +0200")
References: <20260810121525.100540-1-alexander@mihalicyn.com>
User-Agent: mu4e 1.14.3-pre5; emacs 30.1
Date: Mon, 10 Aug 2026 15:58:21 +0100
Message-ID: <87h5l22faq.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

Alexander Mikhalitsyn <alexander@mihalicyn.com> writes:

> From: Aleksanr Mikhalitsyn <alexander@mihalicyn.com>
>
> Currently, when Incus issues "chardev-change" QMP command to change
> chardev backend from ringbuf to socket it receives an error (with aarch64=
 VM):
> "Chardev user does not support chardev hotswap" [1], [2]
>
> Let's fix this by properly implementing BackendChangeHandler for pl011.
>
> Link: https://discuss.linuxcontainers.org/t/unable-to-connect-to-vm-conso=
le-on-arm-architecture/23096/3 [1]
> Link: https://github.com/lxc/distrobuilder/issues/892 [2]
> Reported-by: St=C3=A9phane Graber <stgraber@stgraber.org>
> Signed-off-by: Alexander Mikhalitsyn
> <aleksandr.mikhalitsyn@futurfusion.io>

At first I wondered why the FE needs to care about where the BE is
routed to but 7bb86085e61 (char: chardevice hotswap) explains:

  However, backends are not stateless and are set up by the frontends
  via qemu_chr_fe_<> functions, and it's not (generally) possible to
  replay that setup entirely in a backend code, as different chardevs
  respond to the setup calls differently, so do frontends work
  differently basing on those setup responses. Moreover, some frontend
  can generally get and save the backend pointer
  (qemu_chr_fe_get_driver()), and it will become invalid after backend
  change.

> ---
>  hw/char/pl011.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index cb12c3e224f..3622248ec0c 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -660,12 +660,26 @@ static void pl011_init(Object *obj)
>      s->id =3D pl011_id_arm;
>  }
>=20=20
> +static int pl011_be_change(void *opaque)
> +{
> +    PL011State *s =3D opaque;
> +    int break_enable =3D s->lcr & LCR_BRK;
> +
> +    qemu_chr_fe_set_handlers(&s->chr, pl011_can_receive, pl011_receive,
> +                             pl011_event, pl011_be_change, s, NULL, true=
);
> +
> +    qemu_chr_fe_ioctl(&s->chr, CHR_IOCTL_SERIAL_SET_BREAK,
> +                      &break_enable);

So this is just ensuring that if we switch to a serial backend we
properly register the break behaviour on the backend? Is it idempotent?

> +
> +    return 0;
> +}
> +
>  static void pl011_realize(DeviceState *dev, Error **errp)
>  {
>      PL011State *s =3D PL011(dev);
>=20=20
>      qemu_chr_fe_set_handlers(&s->chr, pl011_can_receive, pl011_receive,
> -                             pl011_event, NULL, s, NULL, true);
> +                             pl011_event, pl011_be_change, s, NULL, true=
);
>  }

This does make me wonder if having a static pl011_set_handlers helper
would keep things tidy and in one place? Either way:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

>=20=20
>  static void pl011_reset(DeviceState *dev)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

