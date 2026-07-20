Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE37C44525
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Jul 2026 10:11:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wlkxf-0007k2-Q1; Mon, 20 Jul 2026 06:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wlkxe-0007jZ-KH
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 06:10:58 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wlkxd-0005Zx-1B
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 06:10:58 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-493f6de72faso24897115e9.0
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 03:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784542255; x=1785147055; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=OVGBUEeGZFo1W42u0kpF0dOOfKXrEoxpF7TLf/LckLI=;
 b=K1o7aQPP3EOAxmICYPyCZ0GgBOsFpP+N4xRXxdKP37ZhYPt01FnthtIgnMctettJjH
 DAmYPYUi1C4nyD7tgG8lwXRgCXENn0PCIQ4QWJZmmVKQ6fVrM3Baut6WO9t2/c2B0GGf
 E5fnHfEXs4FFdjnh50nKKkovWMCENlThAjiydVhn2nx8h36gsVwvgdUzbOX9d8bzUeaY
 LakD89JH653wYVu4T9hVyPd04C4x6hUuSV3AOfUjcmWYCzB6ntu1g4/jD5MleOXBBqkL
 tCHlO3j+0pyySVkvGs8B9amTRNybpcb3XJlMWVpxUaHtg0QYGTLPYommipTsOhjaCw7x
 RJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784542255; x=1785147055;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=OVGBUEeGZFo1W42u0kpF0dOOfKXrEoxpF7TLf/LckLI=;
 b=lMDHnjMGAoKPH9IXLY0IogACnd4oPR/+0KLQC19Po7kK68XDQEtexk6gI+PGIotSXo
 dJtbTrMf20s6deWrnO4/kQZdsCM6JghZKdRzI8uDQ8fU+nAXFTmZERWJKzUckdyInZBl
 ca/8AAG/suQmNHUbi16WQZQz0DiFHjPqtW4AZmux9r9tyDwXakFKqewl1p1/EwbVlq4+
 CQ8nn/TB60a5KJR2jpLEOe0rZV9hy5HxKjrAi5ZB9qvU9gLqTZK4KFShJY8rt4Nv7Tw2
 XdNiUNHFByIz0fPFi6Lr6tE1pwO2xnD6ZwBCXRfoEEZSkZb6ak1jlshkV+Cd93qrD3Tp
 ptkw==
X-Gm-Message-State: AOJu0YwHwHvxgKvDIY9WZRQpQ6F32SUM3a8qM+EQRnFejuw+tSzFxH/M
 p7Yrqnzv28dCmQthrM3CeT+x4Ajj5kGkCI+Ga+Hi9Bb53y97Y0Ifeneed4q146X7QK4=
X-Gm-Gg: AfdE7cl3WbsZ2lzJW46sNTIgq7nhXIWmu4/7/ajBu3lhevpdjbQSZYv4kjpzRkwpPCd
 PAuQ0emfbxw5bZI3ypYnpZSlqI7ZtSigK2gKfxPrLTGoT1VWU68tIC0+Yqe6dgMP1IQe8hm4Vb2
 EylKWQfAl+pTDxlHcG9v81KlGQ//LYzPbqqUkV7xftlMBMIt/hJnz748n1umuUybtivpb++rJO0
 KthGzBhsPlvKTHCjQkqfs3zXAnCIa+yMxDX7nH3lZdGPcUzW0/k5O1nMiOOs+C/PwkWieBHOmzn
 LlgyFrg03HJpNuRMEhJd0Zub6k4TN7AXdACY+kiaQUoLp4yha2IpM4yXHuj3b1HClMBJvl07bYp
 t2kgc7v3kavTHgAUnArERBN1QZ85WnbRxAzGxRq2WfNpC+B3EHkcVpnBmkW4Ipn29CF9txFKPfc
 d8iQ==
X-Received: by 2002:a05:600c:4f0e:b0:495:4f84:7280 with SMTP id
 5b1f17b1804b1-4954f847354mr118124475e9.4.1784542255037; 
 Mon, 20 Jul 2026 03:10:55 -0700 (PDT)
Received: from draig.lan ([185.124.0.114]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49562709500sm34499205e9.14.2026.07.20.03.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 03:10:54 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 5214D5F911;
 Mon, 20 Jul 2026 11:10:53 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  Jim MacArthur
 <jim.macarthur@linaro.org>
Subject: Re: [PATCH 2/9] hw/dma/soc_dma: Simplify soc_dma_ch_update()
In-Reply-To: <20260710105907.2570621-3-peter.maydell@linaro.org> (Peter
 Maydell's message of "Fri, 10 Jul 2026 11:59:00 +0100")
References: <20260710105907.2570621-1-peter.maydell@linaro.org>
 <20260710105907.2570621-3-peter.maydell@linaro.org>
User-Agent: mu4e 1.14.3-pre1; emacs 30.1
Date: Mon, 20 Jul 2026 11:10:53 +0100
Message-ID: <8733xet1hu.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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

Peter Maydell <peter.maydell@linaro.org> writes:

> Now we only have "mem" and "other" as soc_dma_port_type values, we
> can simplify soc_dma_ch_update(): either both src and dst are mem, in
> which case we use transfer_mem2mem and set update to 1 to tell
> omap_dma_transfer_setup() to update all the guest-visible
> src/dest/count information to indicate a completed transfer; or else
> we use the omap_dma_transfer_generic() function, and we set update to
> 0 to tell omap_dma_transfer_setup() that the transfer function will
> be updating the src/dest/count.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/dma/soc_dma.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/hw/dma/soc_dma.c b/hw/dma/soc_dma.c
> index 8ba531feea..ff51338388 100644
> --- a/hw/dma/soc_dma.c
> +++ b/hw/dma/soc_dma.c
> @@ -121,19 +121,14 @@ void soc_dma_ch_update(struct soc_dma_ch_s *ch)
>      enum soc_dma_port_type src, dst;
>=20=20
>      src =3D soc_dma_ch_update_type(ch, 0);
> -    if (src =3D=3D soc_dma_port_other) {
> +    dst =3D soc_dma_ch_update_type(ch, 1);
> +    if (src =3D=3D soc_dma_port_other || dst =3D=3D soc_dma_port_other) {
>          ch->update =3D 0;
>          ch->transfer_fn =3D ch->dma->transfer_fn;
> -        return;
> -    }
> -    dst =3D soc_dma_ch_update_type(ch, 1);
> -
> -    if (src =3D=3D soc_dma_port_mem && dst =3D=3D soc_dma_port_mem)
> +    } else {
> +        ch->update =3D 1;
>          ch->transfer_fn =3D transfer_mem2mem;
> -    else
> -        ch->transfer_fn =3D ch->dma->transfer_fn;
> -
> -    ch->update =3D (dst !=3D soc_dma_port_other);
> +    }
>  }

heh the diff is messy and the soc_dma_ch_update_type could do with some
clean-up but for this patch:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

>=20=20
>  static void soc_dma_ch_freq_update(struct dma_s *s)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

