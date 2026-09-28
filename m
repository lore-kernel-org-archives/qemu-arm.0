Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3176CA5FA2
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 12:12:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBACm-0004Ef-D9; Mon, 28 Sep 2026 08:11:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBACj-0003zx-7M
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 08:11:33 -0400
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBACh-0006Pm-FA
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 08:11:32 -0400
Received: by mail-yx2-x11.google.com with SMTP id
 956f58d0204a3-67109935888so2544875d50.3
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 05:11:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790597490; cv=none;
 d=google.com; s=arc-20260327;
 b=WzKOk1qiuEYwlSivlIHa26C7TnYgZyXHjUtU0fBzFsjvh3gqKfuKrLnmMdZfEk9B5J
 x0B9dQYBJ8sgg/UUthau3jDyqs3mwcRoSXw/+J3ETh0Qcw0EhxVcMSzKZ4EVRZcrwrIt
 oCl+wKFXpfb2JohPD2cKjYVY4iG0dpJo5RVIFFYVxSGrLVkbN+BdEbl1NjR1BVzoawoK
 J+h5a9/Ft4uDJ9jnSIV7W1YahPpdazYOgyvLRaF2gXcfewjQpGVk7CnfIB3Otc0nztHa
 xXr8RGxvjMpfOhHEdjprc4YHyZGayeOr8Uf8WkQW/hRneZkCET6QZJAdo9s5zizf6Jic
 fJHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=BVZ285iW8xYSkl8diGIPTkpZwkwzLt8ODv7loB0mGcA=;
 fh=7KvDfNFOS/5kz1ESFcPtVxDHeJp4XujvgKdlabWSDPI=;
 b=mfulI8aL20gm7+eE4Cg3ng4Zm13KN8mzIikZlIr9rV28LOLbGJ8/9LMQs5pq2x9v+n
 rFX5Q+g/qnjSTHvzpzQjVdxA6O+VaT0PLCPHwjCHM5LitvG8ua10Eckj1k+SoymzXesn
 nrlYCOb1U4jDBW2wVabXsp6caSqy8+kTZ3Czlo2NxAJB6ZzmxXB5HKlH+0Dbyb9YEH4a
 pr/Tbn9Kl0WE5P5JhVaPIk9FbInR2Nkm0LbPa6tC8Q5MtlHwjs6jyb6UKxVqs10ak8nX
 llW+ltd7Yxkqa566NxDN4kwfrTMoLv41RB1F0wbmUN3LQ/cD1XyiOe4nbsNF+oXsxhZ5
 ZIqg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790597490; x=1791202290; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=BVZ285iW8xYSkl8diGIPTkpZwkwzLt8ODv7loB0mGcA=;
 b=eq/fG26MEH/upzw1sfoDUhUfs8NL4jStqY3MDrlGtc6+8aYfY1UfH4XzdcwFSmir/K
 0TdVuQfiovyf7d4VZ6uFXmrDUZajvNqoSB6qSyZv0X6l8SIglGA07YZo2cTLpWKkJrV3
 RWSeeN8AkjZil9NUSyQRmEk+mYI7ftKddBoMjjeoiFLGIx6G4R5um7CqEJpP9gLeIs5x
 M/eJxfEP2PnvF29HSl8artdnRjECkjzAGSaWNlQK/LKoA8HPNDLNjIB5jjboHXM1hYBo
 2mTUGpxXtWf1Sm6p82MQoNuBj01wtzfJhNCkwqIrlQbxve2qpDSfNZ3zKMrT9ZMmy8iN
 aekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790597490; x=1791202290;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=BVZ285iW8xYSkl8diGIPTkpZwkwzLt8ODv7loB0mGcA=;
 b=vKANRulLLnO8rQnCXyxsBoBRy8ywM5vKT1WU1XdDQzHXDl7U0Cu4L+n1btDA7n/GfH
 m1DZAk9eoM91/KfMrGP7r1GDcK65Uq9CjfDLGBtOsVz1IpC4R3dm2lkpMnDDq3HcWICs
 o9OFi+CHNnEzB6LtvFmU/qMRHsLe/gV8S+o7Ca5Ko7R2K4YS6o1a28IXL+LnkU2+bzoA
 OxX3wEe9P8MMldMG/9kgcUEQJnE5wC2LZ/NriH4Rkm/e2lHSlGKnyQJAGp2mL0z/EWMA
 we1BbYuYci4kim+T2HUHLK7vjUgBLXUTIprkJXnuwIoFpBnCM0JuPBowIuydtPL4dheC
 NyBQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByJ+ASE3x8OoXT0VoNYGXj8Eg3bWzxmNaQ/FQ6cM9UMff9w6vyLBS7r7BQVKO4gKg+3VAmgVSFzTQ==@nongnu.org
X-Gm-Message-State: AFq9FYKMRQMUE7bYym8+4fa4RuOUnS2Zr0mfERDxelaeeSOhc0wK5M6Q
 iy4AvdPQNPnHZ/bPn5TzxyarjRXmp9a3c2Sa2VIf8egokSaOyGl0/kC0Wr+iQ3qga/eAfs4d6rw
 Rj/sUP5oZGRckx7dwo3C+Ojv99g9tlP6MALZUzUMgCA==
X-Gm-Gg: AYBFou3Qy/qkaNTOndpkJ1lCRt2eVEVpTy3pjIMBA6zXDtLf9dQT7pM5mG3MH3c3m4l
 pF/NxOHw5C9QhJ4rP9bslVDBFjcg1tNW3IqF/4xILIOswY2yj8lyvTdL6Jgf+WUFguT3M2pqPnL
 Z0LmfLMVbSOcQMtx5aIa/2IdSNCFQ2ewAZAyzKttnzUL6Q9iDmHR4qGRS9XpfOphBC3foRHMTg8
 phk7ikjNN/f3MVI+PFsi2Y5flj0MYtRSo/xMiFBGjcPg8iKxKkkJGoIqSDJ/29HJqO5KVZbej7y
 a9ZlOraYgFndqE5RP6CdWo0lnmhSp9wDW/zUgzdFduhSGnRVvdH+tQg+1FWv1b5Mrd5mNvBsvTY
 ixHC4sRvWVcMYPhBaxeTmtPKIQQyYbhbjx4Bjc2s=
X-Received: by 2002:a05:690e:1384:b0:674:cc60:9ac2 with SMTP id
 956f58d0204a3-674cc60b315mr2526251d50.46.1790597489993; Mon, 28 Sep 2026
 05:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260916224454.91924-1-mohamed@unpredictable.fr>
In-Reply-To: <20260916224454.91924-1-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Sep 2026 13:11:18 +0100
X-Gm-Features: AclHuK9bMLoWbOKlt7SjK1LyL68r2xFbbzPleQP_W_Gsx0dMStOi9_A3hEsQfSA
Message-ID: <CAFEAcA81GZMWo5e4zV2MsWvzSXTLGskx=geamdno++3kuUQo+w@mail.gmail.com>
Subject: Re: [PATCH] whpx: arm64: check for physical address width after WHPX
 availability
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Pedro Barbuda <pbarbuda@microsoft.com>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::11;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x11.google.com
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

On Wed, 16 Sept 2026 at 23:44, Mohamed Mediouni
<mohamed@unpredictable.fr> wrote:
>
> In the case where WHPX isn't supported on the platform, makes the
> intended error appear instead of failing at getting the IPA width.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>  target/arm/whpx/whpx-all.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/target/arm/whpx/whpx-all.c b/target/arm/whpx/whpx-all.c
> index d106400686..46f0b9524e 100644
> --- a/target/arm/whpx/whpx-all.c
> +++ b/target/arm/whpx/whpx-all.c
> @@ -879,14 +879,6 @@ int whpx_accel_init(AccelState *as, MachineState *ms)
>          goto error;
>      }
>
> -    if (mc->get_physical_address_range) {
> -        pa_range = mc->get_physical_address_range(ms,
> -            whpx_arm_get_ipa_bit_size(), whpx_arm_get_ipa_bit_size());
> -        if (pa_range < 0) {
> -            return -EINVAL;
> -        }
> -    }
> -
>      whpx->mem_quota = ms->ram_size;
>
>      hr = whp_dispatch.WHvGetCapability(
> @@ -914,6 +906,14 @@ int whpx_accel_init(AccelState *as, MachineState *ms)
>          goto error;
>      }
>
> +    if (mc->get_physical_address_range) {
> +        pa_range = mc->get_physical_address_range(ms,
> +            whpx_arm_get_ipa_bit_size(), whpx_arm_get_ipa_bit_size());
> +        if (pa_range < 0) {
> +            return -EINVAL;
> +        }
> +    }
> +




Applied to target-arm.next, thanks.

-- PMM

