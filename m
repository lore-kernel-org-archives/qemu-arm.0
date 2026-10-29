Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1FD606A31A
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 16:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bgsflDgd
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMSwO-000573-No; Thu, 29 Oct 2026 12:25:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMSwE-0004xE-Qq
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 12:25:14 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMSwD-0001m0-0q
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 12:25:14 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-8ab432273c5so22760967b3.3
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 09:25:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793291111; cv=none;
 d=google.com; s=arc-20260327;
 b=srCsSwcvGgDUyvVBcN+W7l7SE2k12giN32+n4fX+/fzVg/2o8YAKrvs4wOzaqpIKr6
 Vyvk1oQmTe9po4LVqumWSmqI11WTDqAE7rkLivDSPWaWGTHmkqN4l9WB/HadR9vCnDwp
 08HT6zVXR7NCKpsudk4Rzsm5PCYxJHsxFCI/m2Ivd/707y7l8Tl2EveMA/FAMjME2Iom
 aG8sdcuiJ/xoE7DFApr3Bn+9cLJkzqtOuo+DiSQ8z6nYh2cEWBOhYk9Ga1ev6VCGLQtT
 JIuf8fR7s3lJE4iqkYdn/C3V61DWr+u/qS9udzAtO0qoSSiNfDcXNZFONnDrQp0MBsXt
 rKlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=splBKlMlcrvGccJeIJ187T4TxJMqgNzFe1PSJ6nKeO8=;
 fh=pHBm7Hpie6hjydXlF2dCidxAWZFVo6dFiVMdMScQxb0=;
 b=Ar8TIJtiHNhuIo3VIIs6Klwd+/nDnl1Bln9jVfZr6rkGmw6LQpaqU13Q2Azgs4qnGH
 J9Q+pdzlu6QH+mWVi1G/RwtRPs3FBto7P4HOYIYOfmZxeRz3ONszZTwZaRkpO0JxV7F1
 JRTo/tsfyU7mLgowBhFnaAxm/piYbepwqT1jI6zgnJjzlRafFEP/NE3VaMSVJ4kPYIQZ
 HHZHnhBbUIUeYql/0SoIQSWelsjbkI70d5LL98VGo86t4R3LwSuI+1OVjxN08CP2aTbF
 VBSpyDyXqMRDGEVw/oqdqL3fVN2s6DgKajKXTby2LFMriGm19kkmmeohzfSdnqs5lQt2
 LU6A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793291111; x=1793895911; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=splBKlMlcrvGccJeIJ187T4TxJMqgNzFe1PSJ6nKeO8=;
 b=bgsflDgd8HSC+/QA6aLn97tH2SS4vnRrx+H58AxYEEsljr12IU0jdURyZk2RRTU9cb
 ynv4o5sOP+qdqw1JXl+n/i5xF4fH6CGYCMKh2qf7UmmidVFDIZOHzVYtQUW197Pr4rhJ
 V8Q6qpaGkJ2uJ72uLPqaR8qFE8r+m6sX3eHbr3FLfp6gEGum76upPcwjc0Ih2D2D1pLI
 XyUZW5e8Z8wiCLyif8cpC9kwz1R1yr+Z1F+ykZu8ah7Yv23ql6E7HpmWj4w+IF0n3tN2
 z0+dxKfyrKtolh/iejuTDzZ/UyxqK6sC7JlOtGanT8qyl5Z6Bp3oKcSLAJbWXmlsSvMk
 UyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793291111; x=1793895911;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=splBKlMlcrvGccJeIJ187T4TxJMqgNzFe1PSJ6nKeO8=;
 b=F8OiRZWczdJDuk0JTMZ7Cr3VNxbdf4PSxIl0+epJZBQaYA7cE355QScSdQxAp5jX1a
 kXqmuz+ulbxAkFg8ew+v22SKYsOo+ihmMnEASw+YaGSFYJ/WFIsnf+6bShnklhtgF5vG
 8wji4YkOLaR1eBRr0c6f3BGOFB7v+wGs8X6ryezzWO3o3IPTwE8uWvMcCLzU88W+Twjt
 p/Ku3cp7u7EEDxJCbhH4U1wTKjR8kDTIos/Kyb63CGrzWhDHm54pNq+yazVccmhDv92+
 0tTEV/7TqpfxcQp2J4AN5Oie2ldDuE7IU+WJk48Cre5wy8Ytpj41d1Sj8tIM5OnRskXe
 GK5Q==
X-Forwarded-Encrypted: i=1;
 AKwUvByl/tg/PwjxVF6BDEJe7uJxETzx0IYRXh9VoUMNWjANrOX0xzxr//6VuS5dFacFr9H2ln4bWA4/SQ==@nongnu.org
X-Gm-Message-State: AFq9FYLkI/6ckj3+wQ8rKhH7NWfIetch3dNzZxhT/hngwsU/BT3rlOw8
 k8cNlw/hv/FkH1CzV4CfZmM4qoUmBgvX16iRfjAaVzPTn0zv7JkCnX0a1+B/4Dz9jctrA9GwLax
 fXfESli+4+aVXaaw+DZ2SL6TUqWZIyNABLEvIS+IT5w==
X-Gm-Gg: AYBFou026vNlImgONLP3rHhnP66+T6Zm+eg7RL9aHb8WCO3qo8pDeutDOb6fkCQnR/J
 k0IvNAAGIfaNjxoUejM6HvJgdM/5EC2s6rTwgYPLtrWyLpJxplJDUJ0NNYCfMtOxmfpFiOyB4NP
 KvW67UyMDjrBzjMHTgxk9XffO7zrYfi+Dst38L7btkicXT/SSCjWf0TpZbw/mXnMP6XN6r/RC4H
 cFMekast/tykC+XB4G0laA5rR/Pp5tIn8UICmi+x5zTPhYxgBrf/Z/VbuxDPOt/WUt0rXOtidbX
 OddvqdTdIZlafvc/hP4e6GPKYvRNbAcBsI34dbjkEkUgj+F7ovzV8qcsP7FLqPLyqjQbFibSUVl
 R8zEO7vSU3MGFy4D4DS4UNGJZyC/0HxFR3tVpRlv089QSt5oP7JWye1t2DJh45EMvYTK1oFi69F
 JVZVVfdZ8C/JIwpBqh4GF2
X-Received: by 2002:a05:690c:31d:b0:886:70a9:3ad2 with SMTP id
 00721157ae682-8b1b5bbc1afmr44624467b3.15.1793291111249; Thu, 29 Oct 2026
 09:25:11 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029161310.2065290-1-alex.bennee@linaro.org>
 <20261029161310.2065290-9-alex.bennee@linaro.org>
In-Reply-To: <20261029161310.2065290-9-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Oct 2026 16:24:59 +0000
X-Gm-Features: AclHuK88JNA3RzGsb-is0Cegamf9ln1emsLMJRIMh-AbcZmkmyRVpFlCq34ze-k
Message-ID: <CAFEAcA_CeWj-teRt0bzdcnRfZ5oU_hLOvcaXuDZPtrb3SPoi5w@mail.gmail.com>
Subject: Re: [PATCH 8/8] target/arm: fix bcm2835 migration issue
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, 
 Chao Liu <chao.liu@processmission.com>, Tyrone Ting <kfting@nuvoton.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Hao Wu <wuhaotsh@google.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 29 Oct 2026 at 16:13, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> We don't take care to force re-validation of the config on migration
> leading to a crash when the defaults don't match the migration stream.
> The other frame-buffers seem to do a similar thing in post-loads to
> address this.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4668
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---

>  hw/display/bcm2835_fb.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
> index bd58f625fcd..c5731521b57 100644
> --- a/hw/display/bcm2835_fb.c
> +++ b/hw/display/bcm2835_fb.c
> @@ -352,10 +352,21 @@ static const MemoryRegionOps bcm2835_fb_ops =3D {
>      .valid.max_access_size =3D 4,
>  };
>
> +static int bcm2835_fb_post_load(void *opaque, int version_id)
> +{
> +    BCM2835FBState *s =3D opaque;
> +
> +    bcm2835_fb_validate_config(&s->config);
> +    s->invalidate =3D true;
> +    qemu_console_resize(s->con, s->config.xres, s->config.yres);
> +    return 0;
> +}
> +
>  static const VMStateDescription vmstate_bcm2835_fb =3D {
>      .name =3D TYPE_BCM2835_FB,
>      .version_id =3D 1,
>      .minimum_version_id =3D 1,
> +    .post_load =3D bcm2835_fb_post_load,
>      .fields =3D (const VMStateField[]) {
>          VMSTATE_BOOL(lock, BCM2835FBState),
>          VMSTATE_BOOL(invalidate, BCM2835FBState),
> --
> 2.47.3

For the fix

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

