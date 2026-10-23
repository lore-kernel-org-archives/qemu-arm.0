Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D9D606A322
	for <qemu-arm@archiver.kernel.org>; Fri, 23 Oct 2026 10:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=azfpA3Hx
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xKCMg-0008J6-E7; Fri, 23 Oct 2026 06:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKCMf-0008Iq-8m
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 06:19:09 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKCMd-0004Ey-Hr
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 06:19:08 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-8b0f59a5fdaso6120137b3.3
 for <qemu-arm@nongnu.org>; Fri, 23 Oct 2026 03:19:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792750746; cv=none;
 d=google.com; s=arc-20260327;
 b=T7ZNrsJwcoPfxsBpDWPL86TKKAVR1sXOWW1Od9q8vUt4yK89NwOhWXf3Ewa++Z/JqP
 dIlKkKF5IXRhhYu4I001EHvvsjIUX2Wxb68OrTsrQ/dxeSOW9qQRc8AHmdrsvKDwU3nC
 M2XmHKq++f74Mo7/2TCleBLU1O83AFqF05DBGl9n7XdAJ1yZVuOzr12i5ovsBEZyaQsb
 ulAZs44Af2JGOy6dL4X25QJvFHSoxc+EyMVFFk0qY/rSVGZOM5mtRkjCkWmML/pu9WC0
 5R5wfl78lvfdeRrXd5N5PCgLGmCj7sSUm89jaA/KtPNBrQPpwVbFxpEuLKGHjGDyhuj9
 +Nfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=UVa77CmCGoNTH9cWHwzF/QvGY+ELP93ZdUCUzNwlhf4=;
 fh=/4dTHdgD4TSDAeV2N1ZLmQ2SFzzL3EUq/sMWIfYvCgo=;
 b=oxHliLRxSGI2uOaeLq95jyNUeScHy+TBstOeImUFyqBgXXwXB+CfyNyq79dALNuciB
 9am8oerY46kCXoWDuoX083BmxhrWPLs0oirE7IFvdxef2sqc+EhrugUitl/LQay44sFC
 NfZRBUBt7Tx2KtEttlyN8ENt/0cW28BbZ+g/IPIY6xcwfYNuiZC/GjXz0jjScxYf7HzG
 Zo8jGdGsveT7KS8+6YpBha4YtN1JnUEPRBWpQzoQxpXrF07cGeYqCw4KLiPK2yUi5a7p
 jeS0ULGRVRK6LmN13TApYRnHLjlliTrwcjlLVFsC5GMgm8go7pwHHbTIjIVGthgyDM9z
 FrmA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792750746; x=1793355546; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=UVa77CmCGoNTH9cWHwzF/QvGY+ELP93ZdUCUzNwlhf4=;
 b=azfpA3Hxp0gSR3tiz3M2MNulIz/DrxZYMoqN5iBef+vlRo9AieTHWI1j/tQqMadhaZ
 efKvWHjsO9nJ8KmCMJ29g1/JCnC9c3PVFNsV8QCCQ3XSWF9hQXsUI8SZUJ9n7U3PUlpa
 P37SDKk0s9EpfPaCL9Hh1fJbxl9AFzWvVcSpN6NttuT7FY9grMC3a6qgnTBuoLk7rdP5
 3zdBu959rjmDMOEAkH6imCmzWQyi96Z6+/wtzKCf3NNkJgpfBCLtrhlCSWRFVp5lfJLP
 mdqDiJQ0k09oyM+/E9LAK3u+kca2sNKqsTUxfAEZQE2woVwR2CJ5IM15pJoJMBjAn5Vk
 aDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792750746; x=1793355546;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=UVa77CmCGoNTH9cWHwzF/QvGY+ELP93ZdUCUzNwlhf4=;
 b=J6xAyoXCxVl027cyB+UOqzvSJJ/rzseAbA0EMAiq+1NM4S3HvrCcN2NSYhVU2UOumc
 Yx8fhWa1Bj55Wq8NP4mFkizWJPYAjWtpQdzBjjSSt/lMlQ3Iwzq3WB6ulS6t/jHdXpUg
 cVt3No5QwUd3iuzwpCzI9nDvzjphraP+aVnm2jy9L5NPHK6SgS+8tn6Au/7/ibfpdId6
 EBleD2UrHnp9FPVmyvw89J+OhiSK0y+888sikfik55mONIkT+0NFvy7D0b/XU8NOY/kn
 lahs37UOVOtoxyF7Xa0rF5G+Tbok7VYL7nu7rZ2mSg5ozPQFOi0V5nJvYScu5bVbP5Wi
 mn4Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBz1jbQDEMmrUuLncvM6UbSiMKM0mXGSkI5vN4MCuQE8KoXZRjff1hB8wo0528Kv0P7Pu1WU/h3fXA==@nongnu.org
X-Gm-Message-State: AFq9FYKuQvPKLwi+wImgFDJ5T36GYRRU74V7Y7NvaP07Shfoy6hhjy3b
 Y22oAX6tsw94mVHPAJI6CFomlwLjECl0eVp2298/QbNJ3K5AFSHezEn4R7etDjfXiJ3yEyZINu1
 yx3eSCaPOrFpztDf3jW5hb/RVGDK/KZExNF1/VO75yg==
X-Gm-Gg: AYBFou1OMe+y2bvMLjswpeNq2b9TlM2YVzt8yU+Maav10ttrbtkARwslcNV9B21kAYD
 uBJpeZPdxBeezPdRuyPu1MHKwCmHr3USgAZt6ZAjC6oxDw0LZ/1SSXZhFVw7/EgWrOzeyUDI7qX
 e5ExhV9DizkFF4HTvaU0HreY6Eo7NwvRYxusskaSwv3uRc+0Xb9+IxeE1jpRLH3UI2jKYiipwc5
 RC1BsYgu8QTRyH1SI26Kg7kA9CV8e8dX1ZY2UUSyZBkOii/9BIxLF3rkXpQMcFCsiY3CLxKS7k4
 KYFNHh+L9gwHb5YblSoXylv75mkWCnS+YqPNrC1ynGJ8/8qlr/orG9F/GBD2LFcUKaDBTOUJhtj
 6hrAtgRukRDBRzOmDThJN9vS//G3k52lC2WHUYzw0mCx5MrPPa3Y/TJep1nt0hLCnWv9aDb97Jo
 q0ZAOAhxC69m6agdscYA3W
X-Received: by 2002:a05:690c:f06:b0:873:5bb2:6c06 with SMTP id
 00721157ae682-8b157db5f77mr16062697b3.48.1792750745639; Fri, 23 Oct 2026
 03:19:05 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261018133603.64323-1-marcelomanzo@gmail.com>
 <20261018133603.64323-15-marcelomanzo@gmail.com>
In-Reply-To: <20261018133603.64323-15-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Oct 2026 11:18:54 +0100
X-Gm-Features: AclHuK-CIayPEcMCmy0oApD3882Ms4IGP9PvzvXQ4tzv_f7pdExhOTn5-aCBlGc
Message-ID: <CAFEAcA944adKVe2uKWHnKpL==b0arv+XLiu4VLQSMyih2e1goQ@mail.gmail.com>
Subject: Re: [PATCH v4 14/17] hw/net/bcm2838_genet: add migration state
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, philmd@oss.qualcomm.com, 
 Jason Wang <jasowangio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 18 Oct 2026 at 14:36, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> The device had no VMStateDescription, so none of its register or PHY
> state was saved or migrated. Describe the MAC register block and the
> PHY, shadow and expansion registers, and re-evaluate the interrupt
> outputs after load, since they are derived from the registers.
>
> Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
> ---
>  hw/net/bcm2838_genet.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/hw/net/bcm2838_genet.c b/hw/net/bcm2838_genet.c
> index e20358c8e7..643ee3ec0b 100644
> --- a/hw/net/bcm2838_genet.c
> +++ b/hw/net/bcm2838_genet.c
> @@ -17,6 +17,7 @@
>  #include "system/dma.h"
>  #include "hw/core/registerfields.h"
>  #include "hw/core/resettable.h"
> +#include "migration/vmstate.h"
>  #include "hw/net/bcm2838_genet.h"
>  #include "trace.h"
>
> @@ -1129,6 +1130,37 @@ static const Property genet_properties[] = {
>      DEFINE_NIC_PROPERTIES(BCM2838GenetState, nic_conf),
>  };
>
> +static int bcm2838_genet_post_load(void *opaque, int version_id)
> +{
> +    BCM2838GenetState *s = opaque;
> +
> +    /* The interrupt outputs are derived from the register state */
> +    bcm2838_genet_set_irq_default(s);
> +    bcm2838_genet_set_irq_prio(s);

You don't need to do this in post-load. A qemu_irq() itself
has no state, and you can assume that the device on the other
end of the interrupt line will have migrated its own state
so that it is correct for whatever level the interrupt
output is at. So you don't need a post-load function.

> +
> +    return 0;
> +}
> +
> +static const VMStateDescription vmstate_bcm2838_genet = {
> +    .name = "bcm2838-genet",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .post_load = bcm2838_genet_post_load,
> +    .fields = (const VMStateField[]) {
> +        VMSTATE_BUFFER_UNSAFE(regs, BCM2838GenetState, 0,
> +                              sizeof(BCM2838GenetRegs)),
> +        VMSTATE_BUFFER_UNSAFE(phy_regs, BCM2838GenetState, 0,
> +                              sizeof(BCM2838GenetPhyRegs)),
> +        VMSTATE_BUFFER_UNSAFE(phy_shd_regs, BCM2838GenetState, 0,
> +                              sizeof(BCM2838GenetPhyShdRegs)),
> +        VMSTATE_BUFFER_UNSAFE(phy_aux_ctl_shd_regs, BCM2838GenetState, 0,
> +                              sizeof(BCM2838GenetPhyAuxShdRegs)),
> +        VMSTATE_BUFFER_UNSAFE(phy_exp_shd_regs, BCM2838GenetState, 0,
> +                              sizeof(BCM2838GenetPhyExpShdRegs)),

Almost nothing uses VMSTATE_BUFFER_UNSAFE, and I don't think
we should be using it here. Among other things, it will
likely not work on migration from a big-endian host to
a little-endian one or vice-versa, since the data we're
pointing it at isn't bytes. The VMSTATE_BUFFER macros
are intended for byte buffers, not for registers.

If your state information is "we have a struct with a named
field for each register", the logical representation for
that is to have a vmstate with a set of VMSTATE_UINT32 etc
macros, one per field.

(I do feel like this device model is awkward because it has made
the decision to have named struct fields but then it really
wants to be able to access everything as if it were an array.)

thanks
-- PMM

