Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77E5D3F08E
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Jan 2026 16:25:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vl8M3-0007VX-1P; Wed, 28 Jan 2026 11:25:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vl8M0-0007OV-1w
 for qemu-arm@nongnu.org; Wed, 28 Jan 2026 11:25:17 -0500
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vl8Ly-0007sp-Fi
 for qemu-arm@nongnu.org; Wed, 28 Jan 2026 11:25:15 -0500
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-78c66bdf675so70665497b3.2
 for <qemu-arm@nongnu.org>; Wed, 28 Jan 2026 08:25:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769617512; cv=none;
 d=google.com; s=arc-20240605;
 b=VJRw4T6l9s3luuxt/nQB60aLTmOw0ZKwTNHkIhksAWo/iid3XfkAQ8j8O2T+5DXuUU
 V8tR8jXURJH3eYs8FfC12gEvqVFnJNW3Y39gkDSpwLNUHD75e8qXnWzn4tURHZzSS8IU
 cLTM1qG4q2AL55VJuM5ml2yyzYjOanDmyPUu6s6ukoz630vOMnugCqpKOSlR7qe8LOI7
 BqkkkVDM6dxSnFhZy61KPLh+iFpoMxZDZsKXlfeBGY3ev72ZpZbBz3ezdqChSn26Zdu7
 VqjwJc/lkK9UKv+yFjDhyFS4qda14Ua/uJqY53BHUvNcJ19HmR7HkE/1y7vI2F3Qd5Xm
 AZGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=kNWW//Fcg/Ik+gcxV3m4+UymViexcY5IqHxCf4R+Ytc=;
 fh=vg80NxQDyV5MjB6O2c3Wtvje3f1u3xSfjjDH8l7Kg/M=;
 b=Y56/aUuiwwf0IBohbz8/h9OuBQ1snNVO21t+wJLGbUrhGQrGthE61nzrnSw7uiE+Ig
 FAZplzn7MaoRrZPDTyUfK3fx+cLySfbh7Zo6LOIkxM3oYryqB/59/I5ojLt/KYyMVYa9
 tWjT7dbcydJtgrklXpY+OSnPY2EGnVyCUZ2xeZQ6R8MpKQbieizWQCjjKSTH8MwVM0rh
 WjkVaHJXLjB/x/SddD3/mSksiSy/Szl1pHNB+iaIHIGTN3WEFao9x896w02aA9Lpue3a
 NsdV3hWF/0bZlHXtXeBqAA/0KXkWzK6vFTnxrmuPsb0R/y17oGxOzHP4QvuW/UehFcan
 3vEQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769617512; x=1770222312; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kNWW//Fcg/Ik+gcxV3m4+UymViexcY5IqHxCf4R+Ytc=;
 b=du8MjygBDRSyxaxbwwsIkq3RE7u9G/V7VqIiGe1XRfb+Bb7qmckjYsssenU3TA8eKM
 hZiRTPgAi35+m8pcT5ZuLD36hC52Gv+flJAJ5apaiZ2xMuRd+7JdUuEM4jDyddulV2ot
 CA4Z1i2nGv7fErGJSQX0Jxs9clJHIKdFyoZV8iWV0EiV/7qaDftldoj09rVvYdEMUPhV
 WAH9QIbM81Z46JHebNldcJyOOJlgX1SgimjsOdI8QeDnbcEL7JKV/TBaRa1i68rsUAI/
 L+bnNUFBof6mju5SsrqsK+Am1dnedNlLZbCoi7lgfZynvAq22H83QUncZOwcBS153Zkd
 vb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769617512; x=1770222312;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kNWW//Fcg/Ik+gcxV3m4+UymViexcY5IqHxCf4R+Ytc=;
 b=Uy1XEn2yubnkkzINgXTVYgFkvTkaDQYVcGesViIDbldf4CWEjzkHyGSX2W6Zh3qgd9
 3CYWGxo9+KDcNcFOAr7cFtr0IqnFWB1jcm7+sQNl6TeBpXNFqvNUp4IGIa3Jurp62gvX
 KMtoxtpq3Zxd2nma3XvUrejEXkjKw0qE1hn/WGW9f9tdv7XYKv+LUwaQDaqC4JgLqc1b
 HNDa+50b0PS2gfEi1ZnTGC/EITmq8Lh4tQ1TvNnjdbF9+AgagdShApJuyIWh5k/DeTBI
 3GQAHB/51s5qvtlbP3Kjj3c8dX6bdaO4XWUCVuirPK4o2qAliizlUwXjKdHM5AzW9pze
 cHkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1FfiFCSjXJAjSJlEiQkrET+bHhQbVlBRSawcksDUJsBVMbjboX2MyYpqh7C5sk4VKYxv5FBQHYw==@nongnu.org
X-Gm-Message-State: AOJu0Yzu/Ex9PJBKa7HzGUXef/g2zNOE111s//EyN+oC1apr7qGC9I+C
 qGwo/sDbid8W1/dhda9VmXrUxMVgg1qmWKuFII3CKzrurlV5/n+y7q68dKUtnJA3Oy5X3kaI+O6
 mIedFkuZ/K7DSy2fjL/Ttr2aDZ1t8l/LfLiyyrJCjiw==
X-Gm-Gg: AZuq6aImXF0mtaR7JQLkyEDJGmToQ2jMpmKeENrAWKtNht1WkqkU+FGLYIYFr9FCN/o
 Y3AqDuE1+SubW5Ga+v+kAk0NqVIb2yndXs+xveuP+RooRF+eF9MTXpsyb+toc2J6KFln0cAj8wC
 28UZ0T0yYbEV0jRFGVzT3l1KIkmC8VOUy3NW29qCUbVEyxMoaY+IE+BsaHsGOKxJdLgSnbjp36M
 ufMy8wGZYaGUkxJ/vW4VF4D4+2yavJZ+DGKC2rnHKOo+V7WmKnOCRnU3u3mS8Awexs6Xg==
X-Received: by 2002:a05:690c:a789:b0:785:fe77:ccce with SMTP id
 00721157ae682-7947ac01fe2mr37317007b3.44.1769617512100; Wed, 28 Jan 2026
 08:25:12 -0800 (PST)
MIME-Version: 1.0
References: <20260128105839.3487840-1-alex.bennee@linaro.org>
 <20260128105839.3487840-3-alex.bennee@linaro.org>
In-Reply-To: <20260128105839.3487840-3-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 28 Jan 2026 16:25:00 +0000
X-Gm-Features: AZwV_Qj7SJxIJqr1FzwkHSVhyP-xonhXYQ2yVYk8RXvHb-_qxfJbukHXBwlNIh8
Message-ID: <CAFEAcA_sT6pGhXPpgaEqkJOVuAj3e1KMz_AP6-MZ6YP41YvoRQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] tests/functional: migrate sbsa_ref test images
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <leif.lindholm@oss.qualcomm.com>, 
 qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Wed, 28 Jan 2026 at 10:58, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> As the builds in codelinaro.org are going away migrate the binaries to
> share.linaro.org. As the hotlinks don't encode the filename we need to
> explicitly tell uncompress how to handle the files.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> @@ -54,15 +54,11 @@ class Aarch64SbsarefMachine(QemuSystemTest):
>
>      timeout =3D 180
>
> -    ASSET_FLASH0 =3D Asset(
> -        ('https://artifacts.codelinaro.org/artifactory/linaro-419-sbsa-r=
ef/'
> -         '20241122-189881/edk2/SBSA_FLASH0.fd.xz'),
> -        '76eb89d42eebe324e4395329f47447cda9ac920aabcf99aca85424609c3384a=
5')
> +    ASSET_FLASH0 =3D Asset('https://share.linaro.org/downloadFile?id=3Dk=
yoMLGC9zXa4oA7',
> +                         '76eb89d42eebe324e4395329f47447cda9ac920aabcf99=
aca85424609c3384a5')
>
> -    ASSET_FLASH1 =3D Asset(
> -        ('https://artifacts.codelinaro.org/artifactory/linaro-419-sbsa-r=
ef/'
> -         '20241122-189881/edk2/SBSA_FLASH1.fd.xz'),
> -        'f850f243bd8dbd49c51e061e0f79f1697546938f454aeb59ab7d93e5f0d412f=
c')
> +    ASSET_FLASH1 =3D Asset('https://share.linaro.org/downloadFile?id=3DD=
j1HRXnDnKtU6Nj',
> +                         'f850f243bd8dbd49c51e061e0f79f1697546938f454aeb=
59ab7d93e5f0d412fc')

Is there really no way to have a human readable filename here? I know what
edk2/SBSA_FLASH1.fd.xz is; I have no idea what
f850f243bd8dbd49c51e061e0f79f1697546938f454aeb59ab7d93e5f0d412fc is
going to be.

If we can't have useful filenames, can we have comments saying what
the filenames
would be if we could have them?

thanks
-- PMM

