Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D45CA5FEF
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 16:22:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDOye-0006hT-DW; Sun, 04 Oct 2026 12:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDOyc-0006dV-4c
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:22:14 -0400
Received: from mail-yx2-x2a.google.com ([2607:f8b0:4864:41::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDOya-0001nQ-F8
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:22:13 -0400
Received: by mail-yx2-x2a.google.com with SMTP id
 00721157ae682-8ac502960dcso7486477b3.1
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 09:22:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791130931; cv=none;
 d=google.com; s=arc-20260327;
 b=fJqkmwrkZy+RcxUizYqumdv7eMhqJQGQNIhH3lPy1GWE6sho0iCtwS29dCwJRk1Xue
 lt7Rim+iZtUMLZzKlwb3lDngySlYn0XGDZ1VJN4xpljcchhdSGDj4C4bRCdwar2EXI2n
 KtcLSWVpj7FN62ZzvlGvNB+iKwnaGz/BliqwbMjHhxOcEc5TvlsCR1PzBPE4+nYxuKS6
 F2f01dLQQ27/Mc2HX1Yd2tTwBbCI/N41BTqp6zVWOC8UzAUvu7duHx3434EUi89S7Im0
 nuWkUwwh2zqJkFw3unqLIPSkbZhWsrG3y3wJ5c3rPPYYJ/lbUyU998yi5V7GulL0KT0S
 ECUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=MDtcUjUbrU8VEFojMzmBTwAgi9SbbpAsq0gZUYFKZoI=;
 fh=XQrkgPbWy57J5ANdIa8xmYs/+ZXm8znem941AVc6RzU=;
 b=gmhbnQxuK3IzPagx2aD+j4aU+MhzFkr5jP57vArwV/1lEKiSjSVH36heTEqeDgg6aX
 quq2V1+pOlfVAfiC0fJs7LshyUZzzIZFiTEQvuMVv5pZJ35AJKsk3q+ZaJ+Zhmx49Ugx
 3ic9teYA/rDpUqcfuVuvcB6IbASG9Jny0zMWHRkBLKYFR0Cil+ItXh2/FLaDg1QFjn3k
 CbzKelUKz5M/klRXIqNqtA9hqftVbnGE1xs5K/7x9mExqtnwQP/rw9M5KvsKAVn0IrC1
 B17MUJS3MWy7LDjaZlcavhKxEvV4QB/CZtiV/w1KHl3AUnnFsq+0G5eNV5+30gIAR/UE
 YkTQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791130931; x=1791735731; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=MDtcUjUbrU8VEFojMzmBTwAgi9SbbpAsq0gZUYFKZoI=;
 b=PyC1p8TJsw6fzLpq8xup0q0DxhwtaylGNr7Ao1n3vOecnO5tI/zhD8W6dbkU2yzL0y
 tVmeZnwERTmYK1hJOmkyZbbvwNi8F1bOTwz8dahLkN2JJrCdgskUPVXckcabSt4La/qN
 fRc7EviCguZ/p+IydTZbzTZ05mFG4+4pEBFB4EY+5PhQhXrNXJK0a0UiHtswLr/SCp56
 lAi0IuLDqlag3ecS2W5Qr1QZkufwYqpkUovZi1cQrhXgnBmJ0Lc3pUBmmwRB4nBzGlFy
 lnr+FzkN5BXSr1fEEn0+vHxeEVlsLG1YT8t9wrer9mxFEb4m9dkCgBUAWU1R9/Ml1xfl
 m/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791130931; x=1791735731;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MDtcUjUbrU8VEFojMzmBTwAgi9SbbpAsq0gZUYFKZoI=;
 b=mh0S1QG1TRs49qQSE9Tz+sKbvGiXbLVamy0XtHzIgvpaZj7jhFEv2iUH23Oldm7ghm
 jBxtVy7I4VzM3tozWMzeYWCZIbj9D2W/kJRWCKXmvOr/jS0nvRmScK4yQs6YKEmEEmrw
 NL4Ou+5Jhp/W1BWDOR9e0zhTCiHfBFUioov/WHWmGGHDoeKf8Ty57bG3bhA3ihFDEK0A
 VFspfqOnzPq77lUsf8x9woKO0ZQQUntF+Ix4eXj6c0MbBkM81iOITxdQj1jg3D878Aa3
 MOB1QAdD2wkqFM4X6GFqr6vgD2F96bzfsufnCzjbPszqJAzef7ttAULvnpq3/hJMC9mI
 mO7g==
X-Forwarded-Encrypted: i=1;
 AKwUvBwYSowdIl3ElBSVIlrpO/TAfr7GoSKb6J0j6MDwYPaqnHdCW2a835we+FaUOdGdkaVG/dyY1rfwqg==@nongnu.org
X-Gm-Message-State: AFq9FYKTPArU5WxzsEDFjzSTl4bZ/ayDJ+kx5Ueng3op7deD8hSyDwu3
 VtFDA1GIJoZTM0VE25c0w4xXpTBtQfd+hriL1evShc6y45+0jcJUffa+addybu/pJip6bOzc4b3
 +c2rjhx7f6PeMu4w04Zo4/Khnk30sb1w=
X-Gm-Gg: AYBFou3id1v4REScNmiCbDAqZS4TpuhYPhx5b7ajXUq1y7Q53sos1UFhoqn2oGBtwZA
 0Rz6QHSbCBZXgpquH7qQPXatrTJ3R7I+gobiXdtgCEPN7x7QhIcTI048/HzQc7usA9nX3h8yb1i
 5v7PsKjqgM+fev0HoZKaJwmcagEaEXqOqyjIwmYzO9TMVUqqU4RWf/kT365YmeWMpjQ4FUNfIG1
 mGC8lCgO7oyxmVBGNgqOlONj2Y2ajX5cg0Vz36J22NmXi5C60p8nzGVRoIsBSHI2JkyKesMyY7T
 AQWQf2JuqQSGFfitMnfi/fFMNM0WY9/QvPvTQJ8GhWsMWR1gJlc12p7qV//GY2G2yG1enDOy/qA
 X1VYz6GjwqSbCmuQ=
X-Received: by 2002:a05:690c:a74e:b0:8ab:3918:33c2 with SMTP id
 00721157ae682-8ae39c0ab91mr22612747b3.27.1791130931265; Sun, 04 Oct 2026
 09:22:11 -0700 (PDT)
MIME-Version: 1.0
References: <20261004122647.3913-1-shentey@gmail.com>
 <20261004122647.3913-23-shentey@gmail.com>
In-Reply-To: <20261004122647.3913-23-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Oct 2026 00:21:59 +0800
X-Gm-Features: AclHuK8y0yb4FmFBGfXqW6ob7sFRzSDSA7q4HApxB1kiE_3y9m36JAZMdq05kTU
Message-ID: <CAEUhbmUYV-ukvhDy3XUE769a7zfWo-a2AksrXgEkaoNoWiU84Q@mail.gmail.com>
Subject: Re: [PATCH v2 22/30] Kconfig: Extract config FSL_IMX7_SNVS from
 config IMX
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
Received-SPF: pass client-ip=2607:f8b0:4864:41::2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx2-x2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sun, Oct 4, 2026 at 8:29=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:
>
> Over time, QEMU has grown a number of i.MX boards and the monolithic
> config IMX drags in unneeded dependencies into each SoC model. Extract
> config FSL_IMX7_SNVS to eventually eliminate config IMX.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/arm/Kconfig      | 5 +++++
>  hw/misc/Kconfig     | 3 +++
>  hw/misc/meson.build | 2 +-
>  3 files changed, 9 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

