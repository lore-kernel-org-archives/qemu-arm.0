Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F124606A326
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 16:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pqvyeyuq
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xP04j-0008UO-8i; Thu, 05 Nov 2026 11:12:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xP04i-0008Tv-38
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 11:12:28 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xP04g-0006eX-Fr
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 11:12:27 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-48bbb06e746so1314778f8f.3
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 08:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793895145; x=1794499945; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=cThoCKzcNWHWVRzxPBiXG6CPz0sEKxtSG0WvkJPGTrw=;
 b=pqvyeyuqW0tqJCAB6SxmsTaiQqQh355PxQoQXef1D1efph0spVmdakv1MDtMyAMwx8
 UxFEJ3fUDOz+rQwVrVPvFmOCo/Y+jG7TFuDS36vPsJNXxKYQtUZ4x9JI8bMK7/Hs4tN6
 qvV/SMfFLZO7ehhepgmzUQOVn7boaaPKQKJO14eUvQ9JFmJctkeVSmreKZ6eZGxa2c0z
 FKeuDaJYP4KAXLGucrjFaDFXzZPkFH/sVeakDiaVf+vQK6kj/isZ2WRShGgU2dlwWZck
 qWBXjRmviiCk4OB9pJaFX99k0qk1A8rx7npP9+63eQqwwBt8oVRSwhfdq4LvTo7MWCXW
 ewCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793895145; x=1794499945;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=cThoCKzcNWHWVRzxPBiXG6CPz0sEKxtSG0WvkJPGTrw=;
 b=o7tTdsdSwmzDDWgx9qD514mTBu2HgORKDH5f93gPDU+8wk5RgcVSlOsNSuDFhCW/1g
 EtW9E1foXlyDrwyrFwbFMEajGqFUz1XdHa7apN0troH5Qhv/FA83k2mGMa5qRA4aqYHt
 ovA7S53pde8TwLC3nXMq2vfKS6AaHPkJTGUDCANa7MVar4QTjyOm4XdlAU+Amyl4OWQN
 Z5avbUo1627f6yPe3I+8krHWQeGYoec3LNzg9XA/ir0A+H5GKGdUyD0maIrpnXWyd1Hy
 9viJvBhIE4t2QDeIlmkUwabJHUfZDNNO2pZPPZdEru2RgN8zjdCYbaXOU9B/wWcdjydS
 Xh2Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBxhohyN0/wZGjL4ZbFUzVQK1KPfJysgFPujV6WoeHUWzCTDDIMU+EGHNQhvGX0lR/9eM1rBcQ+diQ==@nongnu.org
X-Gm-Message-State: APuU4Z+yNKzw55di5rd4Be7l5MsI2M4+XjfA5k9Au7e8yH6aQ7CV7ZwL
 HQbU7c5E2s0Gt3P3DD23SeIViEvkc/cELW0N5a7lfx5Hx19bc7xr0w/VIX6ceq5eaoI=
X-Gm-Gg: AYBFou366RqAqYrpXO1cKMPRMS+Kfmk8tmd6B4tDg2S2NqxZ2OnMJmJUmPiIHMFfwr5
 gcEdIVHTbwX/AvYbCP+LYBwPC2sh7ukmp3Jl7cwKM71cNPoq9fvwFDKgx+lH7moEKfxTI/TJCJQ
 3DYnNVj9LHnSh+1/0LyerCO5nd7yx90MInskpY1trBJJNA9CU8OEddhJohs8p9CENxw2KgKrJ3K
 Y9ue0efwu03pujjKHcclKoVnmeJkHrmlgIl6wSr24AN5B+eV31QQhGyH71atCSLM7Hcdr+20p3e
 69ZB9s7ZpdrjXAGdr7m1wuAWeERaAt/QdBC1VvK5vfschuzyERv5OEQzjijUBY0Z/RnFxk201un
 HLvDFQCapezrObwX8+qVxLBtYE7pWElthuk+Ef7fIknwgKL9PHZKj2XYefiru8pL7zNOgbjdDrJ
 L/i5eCxzQBMY93a/RNrUhq3Fb+qKVcC2wpYnIssLxtyi7/Jesr66GSOsNO7Zc3GfxjHG3KQI3IC
 2Sj5pQhOeNtWGwcIPksjA7mFD4GL6tBSDZN7bh5ImYaY5jFZHBl2+hupSO67QDvDlCP/ToMwsnS
 DJUn89NFodKhYyRD/qSSz3M65QR+
X-Received: by 2002:a05:6000:2486:b0:48d:ff81:5201 with SMTP id
 ffacd0b85a97d-49277f88144mr107115f8f.41.1793895144611; 
 Thu, 05 Nov 2026 08:12:24 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48feeb5196esm9849698f8f.58.2026.11.05.08.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 08:12:23 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B5EE45F8AF;
 Thu, 05 Nov 2026 16:12:22 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org,  qemu-riscv@nongnu.org,  qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org,  Stefan Weil <sw@weilnetz.de>,  Jason Wang
 <jasowangio@gmail.com>
Subject: Re: [PATCH v2 10/17] hw/net/eepro100: Replace deprecated sprintf()
 with snprintf()
In-Reply-To: <20261105125203.40320-11-philmd@oss.qualcomm.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 5 Nov 2026 13:51:55
 +0100")
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
 <20261105125203.40320-11-philmd@oss.qualcomm.com>
User-Agent: mu4e 1.14.5-pre1; emacs 30.1
Date: Thu, 05 Nov 2026 16:12:22 +0000
Message-ID: <87wlqr5kbd.fsf@draig.linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com> writes:

> Replace sprintf() by safer snprintf() to format debug dump
> silencing -Wdeprecated-declarations produced by Apple clang
> 17.0.0.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> ---
>  hw/net/eepro100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
> index aaa3eb60f8ab..44eff5fd3ad8 100644
> --- a/hw/net/eepro100.c
> +++ b/hw/net/eepro100.c
> @@ -369,7 +369,7 @@ static const char *nic_dump(const uint8_t * buf, unsi=
gned size)
>          size =3D 16;
>      }
>      while (size-- > 0) {
> -        p +=3D sprintf(p, " %02x", *buf++);
> +        p +=3D snprintf(p, sizeof(dump) - (p - dump), " %02x", *buf++);

I was going to say the whole function could be re-done to avoid the
static buffer in nic_dump but that took me to TRACE and then missing() and
I realised you probably didn't sign up to modernise the eepro100
emulation ;-)

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


>      }
>      return dump;
>  }

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

