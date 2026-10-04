Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6CFCA5FCE
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 15:27:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDO7B-00068M-SU; Sun, 04 Oct 2026 11:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDO6z-00060U-RS
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 11:26:50 -0400
Received: from mail-yx2-x2b.google.com ([2607:f8b0:4864:41::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDO6y-00060J-AD
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 11:26:49 -0400
Received: by mail-yx2-x2b.google.com with SMTP id
 00721157ae682-8ac8eb87a11so5332457b3.2
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 08:26:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791127607; cv=none;
 d=google.com; s=arc-20260327;
 b=W4X/S3lReAHcmeP/d9REquKCRbcRrwUre/DkojAHhXUvU9oLJunPxR+xTB53DHx9w7
 VmHOk5ahHlRvWEEh++LcIS8q9e+ovsj9SjfWAmETt+3mpMEK0jIZMwM/oLskuAI+dGKO
 oDZV2OI/HydPAG1pNBGnJqurd5zjsIJaaJNqlyMYIOKiu6S0FoBV/UqCt+Jp5L9qJW2+
 oHeAw6bIssVKr7y7Lc5rEfWkb8Pr+fLOHnzNHIC2cKkNVUsCWbwBJ9OLIv+cCvSrWruz
 oihrgIageW97XAj1B3J0t0znhZIAtEeZBETIOKgkCsO1uszZYHI+6nQ63kjMfs3NBq00
 IRKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=g10pd3X1IgzZ/IO4Y3r2j2UA80f1HVdhL5FiOZhyBNw=;
 fh=RIOxBIHy8GcJAmc7qtw7V+dh1KLvSmLCmPoJXsTysPQ=;
 b=LReOSnaR3dPPrWvnqpraQpS5iZnS6ZqXVqCif+05ok8BG35yghLXA5lAHFrkd7sQXE
 OQK5Mm6UcTB1BFwTcg9DhHtiJsX/o9t/my3LJmyw35Qm8NeE2sP7BVhhdqTh89BGifGv
 PrlW7oL6anwT8wcPOB2khpWHmwivbmEu0xQDlWrur+A7DWJHlz88v9mU3/tRaftK0BTb
 EFaj0BHk+zfE2hV5e1LELeiEqVVh6ox3V3LVL5UArsdqH2YvSyc/+bP1yHWPOSNhZ3xs
 yOKfxdyw4E8Z3WnY87fD3DWoVh7d/iugs3NsTnk2MCe50sMC4EJuBPOmWWMWtPXEFxc8
 fozA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791127607; x=1791732407; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=g10pd3X1IgzZ/IO4Y3r2j2UA80f1HVdhL5FiOZhyBNw=;
 b=g0frr2CAnbgPefFlpCpONvjhJY3OykawQD1LtNcTOPwcWKYWh/iawqVIRgWqfJiNGP
 y0nbscKCJesLLe5iO0cTme/J+3cfGc0vDV4+3L6goKOOcvpuRC0jiiXlcOwjvxXGOzFN
 necregcZMsFj3sm4BBnJAY4UmECuBDoHhZtribtdbGnXxT279igFryaA40DyJ8oJ3v4Z
 XuElYW32L4UTa9hZT7IwBQSXxvvMRgW2H5w3d8Aatnz4R+a5jn0nvDHzhQfAP4llvT7m
 rp184IK/Z00qmvl2VTLNgf8+cniNNogcag+Tmj6i7d497sUvaG/lZRQbJCLU9tF28hbw
 BcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791127607; x=1791732407;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=g10pd3X1IgzZ/IO4Y3r2j2UA80f1HVdhL5FiOZhyBNw=;
 b=ADsghx5x8/uy9BexQDKY2VurV7KEGahluwI+YgVCPArCeciYSTY5W2nPjsGRWbwubB
 pcUsG6Izu5Pv4S25EwupLqRVRJG57CX/GBTzsB1zWMUYxUvuQyk4oblrxpv2B2N1BhLR
 x7QcFNBIi8qYJdij1efpU5bmm3tkIgg6xgmHqfueW/ovezjZD1I4wlM5ncEarNXQTaS+
 rkGow9MqWZ0IZsOep24lXVofGdARxk+JF1q9bUevbzleeBpibGpU64+yfgCQmyfesUph
 brWaQ2mcbwR+KgxfEUfYvm6D51gUqX6ACXJbOrvt29U6lHOiE8c64Y5rQ/yN01DdB2i2
 wvvQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByVZQh/iLItQET/ZXYGd/eFNXsjsKMQWSOyNQuqAO51sSOj9pK5iuRItfY8sInJi4zRIoRcElMI/A==@nongnu.org
X-Gm-Message-State: AFq9FYLUbjeYsrU69AcTRvNHuCsrniGfEiKvkhe9TMMAL1Xr/z4yrB+P
 GO/UhYn6qZAOAry7OOcLXnSUM0HFS87wTLFXD8DDqi1Vms0CKkifW+oEbw4sjdWiZiWxn/nIP83
 XNpWk3tamIzWlWQGN1Y7OyCNss12m/QM=
X-Gm-Gg: AYBFou2KrvIjrcAMiJ5LwPJZKd9DuuTC9hBDBe8KrgkvKDk9QGfcjlIvaPseCti+Ory
 Ucc9JzNjkGl1RBtVpm10GtgvpyfZBY2vLtIHCzz9+yTA1A4xoxF3v5twn9FM02C5NNPxnN/5/1O
 yiyvQkomu5Bzun9Hpzurkf5MJZRzx1FRR4PplNPNiob8b+7Q5IDh8jKDZHIgTFVa+946r0Ga698
 Ze/UO2eZS4QSzJoTNSWjjC/bi2UqVxIIbXIX5FvtM4QxsG/NtyYvr90Fh0jZ+vIdNdJy4r/krDd
 7PuXYkDZCBJ0PFt5VWFGIwelzxGQmI+Me85xgLDp5zvGmQU6i98s+T9Vu7u38ZjTnN+8d8Kyu0p
 T/cj11zxGH3Hu59xr
X-Received: by 2002:a05:690c:9990:b0:7db:ccda:a409 with SMTP id
 00721157ae682-8ae392b6973mr35221947b3.9.1791127606991; Sun, 04 Oct 2026
 08:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <20261004122647.3913-1-shentey@gmail.com>
 <20261004122647.3913-5-shentey@gmail.com>
In-Reply-To: <20261004122647.3913-5-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 4 Oct 2026 23:26:35 +0800
X-Gm-Features: AclHuK8kOWrucEEovAZ35f7qWzs0b5o9-pcokpk5q9uQOeB-jKLKjKqBSPZfs1s
Message-ID: <CAEUhbmW0BcgxFLF6MMasng_dkQ93dG8-1D_RrcmyNYdSeXexfg@mail.gmail.com>
Subject: Re: [PATCH v2 04/30] hw/arm/imx8mm-evk: Fix reference count of SoC
 object
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, 
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Jason Wang <jasowangio@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx2-x2b.google.com
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

On Sun, Oct 4, 2026 at 8:36=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:
>
> Using sysbus_realize_and_unref() requires object_new() rather than
> object_new_with_props(), otherwise the initial reference count is
> subtracted twice, i.e. ends up being one too low.
>
> board")

corrupted commit message?

>
> Fixes: 7bcd1f30bc83 ("hw/arm: Add the i.MX 8MM EVK(Evaluation Kit)
> cc: qemu-stable
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/arm/imx8mm-evk.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/imx8mm-evk.c b/hw/arm/imx8mm-evk.c
> index c3215b11cb..6de0d9c4a2 100644
> --- a/hw/arm/imx8mm-evk.c
> +++ b/hw/arm/imx8mm-evk.c
> @@ -83,8 +83,8 @@ static void imx8mm_evk_init(MachineState *machine)
>      ims->bootinfo.psci_conduit =3D QEMU_PSCI_CONDUIT_SMC;
>      ims->bootinfo.modify_dtb =3D imx8mm_evk_modify_dtb;
>
> -    s =3D FSL_IMX8MM(object_new_with_props(TYPE_FSL_IMX8MM, OBJECT(machi=
ne),
> -                                         "soc", &error_fatal, NULL));
> +    s =3D FSL_IMX8MM(object_new(TYPE_FSL_IMX8MM));
> +    object_property_add_child(OBJECT(machine), "soc", OBJECT(s));
>      object_property_set_uint(OBJECT(s), "fec1-phy-num", 1, &error_fatal)=
;
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(s), &error_fatal);
>

Otherwise,
Reviewed-by: Bin Meng <bin.meng@processmission.com>

