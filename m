Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B6ACA5FCE
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 16:21:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDOxF-0005KJ-CB; Sun, 04 Oct 2026 12:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDOws-00050X-DU
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:20:31 -0400
Received: from mail-yx2-x2a.google.com ([2607:f8b0:4864:41::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDOwr-0001hm-2P
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:20:26 -0400
Received: by mail-yx2-x2a.google.com with SMTP id
 956f58d0204a3-6768036283dso561874d50.0
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 09:20:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791130823; cv=none;
 d=google.com; s=arc-20260327;
 b=Lu+itWWTP6tvI1F14wOuiOsRR23/+g3dolDRdbjmXFjzsfT+488Xioj0UGGdAR5S5l
 LXYYUsd6SuAdMeBrBlAsxgU5pefH7+dNBo/PGyMdmya9ujLJq4zkvKu/y1QyZozzic57
 Js/qcm6dDYr9TLbbzAqfGV2ywnAzFoOwQ+UuysEXCpxCxsCkCx5511/u4/BznJccFLWC
 TclTm+cWCFqKTKlD93L97fBiOVms2HNO4hPmwxVkvn8LK5yHX0t+85JgWytKkugeqa3+
 ul4C9aIfDaDekbB3I6M4R9ukQrK/QqkoZFLFSLnmGZf6yUkyNkJL2ZSz14ZjY/8vSJ9/
 0PMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=XepaRebXl3TFwgGX+CNdlobqtN3R550ovzKc4RUOPr0=;
 fh=mPlTd0UyXHkwOGbcwI478/P8COnZ7AXmqjRRIn9Mo+M=;
 b=r8qWNIL0ZJKynUIQUyWMjUhPAtNYXqYFrUaVtf+oZe5xG/8Q+XzM2j21Ol+mVVAwke
 V1WGZfTlQF+4BCwNrluqxtLs7vVYgGu+KVLO9Ez+uf8UKdy1QwA+CbZOlLRsLwCP7MsT
 sbSRiavlnYS58BHjC7UXTMXPk6yXYwNrmrfasAf0ONm5HtoiHCd5Hn1ia5byHuIj/ese
 Px1ic59gxyUQO5Dqpeb3NdWXXDQY3lCJpU0avDjedGgSEpq3c9TVe/0U/XoiMkQephnX
 H6jZ/SqfwZOaIrmCN/2ZLdM41i7rCpL5+3YmBtfacLWZdh/gYsGxWTBBADxqehYM+oRl
 D/dg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791130823; x=1791735623; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=XepaRebXl3TFwgGX+CNdlobqtN3R550ovzKc4RUOPr0=;
 b=i8KH5Tt5EtMmIBp8DAYICdiRmTFoBy2gb50e6a2Hnopup7CPNc3eX+FBeHcVTYnRd3
 wrd9/YRp4zK0O/roSTv2uTF0oQPH+dulVnEHs/ARa00w6xjF8bcoN8ab1efqwQlleyXp
 ye6CjwBhZgfPfmm05X5K3TX6Y/cfHYaW3aQRDiXqXEwXuwcxOn8qOI0DU2dXlJdCr8fx
 gOcJvOzgDVf4co8zAe2dYLZbQW5mm5ptD45lPI3oheZ2AJoclMtRTljFxnaamtUxJI2N
 ydWIGHEjPygKgp0OGhbfIjj3T0xHF0g7XiobdjE20JATKiILo0DT3P9wJ4Dxxhawzdr2
 F+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791130823; x=1791735623;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=XepaRebXl3TFwgGX+CNdlobqtN3R550ovzKc4RUOPr0=;
 b=l3UyRlnemea4stqGbYQ1CrvN6ZX16+tTpxAAY1SltFZz602VsDImzP5+FxsrC20kl2
 jM33EJeBMJuKdeb2VriBxbUwDntlm0ZAD/0DQbYqtX8i/aloai9j638Y4HpPoU0OATKo
 ZsaONcJ8yxVDN2ryHEYE/io5GC8gqVK/dmltx44gnPzt447wRCKwKbCmHgc2E3vPEbPI
 ELpZCPBMOYrJGWUoislVx0EGmYK/th60ckDY4GwICf09av0RXW72UfBM84LvbNlwOLG+
 //tODNqnQDKOtXN35BqGOHG4rdOzNKccwoKuwhGsN0OXFz7cXE5WMejRv17ALqnmMEi+
 f5sQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwxcQUr57D4BNhe+y6+hxwVb9li7SFc91ryo2pnM9czGe6ixUCmAGd3u0F0NYiCPKuArSR3x2LuAw==@nongnu.org
X-Gm-Message-State: AFq9FYJ5Ih2EIC9wb8/CifVySzrrhicCP6RgRVc/D0/U32R4VLOtkn0w
 xmChEHHII81LpG7WwUK7/6utoxr5DmMWL2r6cjl33J8sY4a9+sXVT0CnGSPchTNRpSaTDrSn2xl
 2d/Cp9NoZpwQuirdxi+EOTQCid8wfr6Q=
X-Gm-Gg: AYBFou3Lzd8ncWN924JOYN8Z+i6Nj7LhuJfTV6QpDTvkwLJU14/EM+22j8fN3cO6vGP
 0bS/OguX5TAAS4ByET/m6wW0vGH8bbiGY36BC5noDA5mBOKm1GBS8BBr2QOsgee37zf1Ynm8LMy
 B2wbuS7yfO1MX/pmMw1O3Ab+83s1ZZGYzSn1DZgKOfHR/rhhzxNtGu33BJxG8XDuhXkGK6W/5GS
 eTJyNNn7byQ4H9eWo0R4402s9//BUg7R+/sepK6+HHp3+zdLXwrkKdoO7Gmfnz42sJKyJGyfVq+
 wjBsPPHf+3QijrQZMSGzBWtlXBn/kH9EkLe1uSEEUgSpKMcmta1hmWbfUq7OzSOOBAQLYOTFups
 kH0G6IKfvcJ+0zZc=
X-Received: by 2002:a05:690e:1384:b0:677:bdac:d1ae with SMTP id
 956f58d0204a3-677bdacdc27mr1757322d50.40.1791130823248; Sun, 04 Oct 2026
 09:20:23 -0700 (PDT)
MIME-Version: 1.0
References: <20261004122647.3913-1-shentey@gmail.com>
 <20261004122647.3913-20-shentey@gmail.com>
In-Reply-To: <20261004122647.3913-20-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Oct 2026 00:20:10 +0800
X-Gm-Features: AclHuK9uce4zIeqTWci0lI95PQn3HbKjdOl6huCTP9O8nZ6VLSNWA_MLYp3jL5M
Message-ID: <CAEUhbmXmghW1GLFUQjXRivNKQ3cVeppxT+-G=F9Ecgfy1RM4BQ@mail.gmail.com>
Subject: Re: [PATCH v2 19/30] Kconfig: Extract config IMX_RNG from config IMX
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sun, Oct 4, 2026 at 8:33=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:
>
> Over time, QEMU has grown a number of i.MX boards and the monolithic
> config IMX drags in unneeded dependencies into each SoC model. Extract
> config IMX_RNG to eventually eliminate config IMX.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/arm/Kconfig      | 1 +
>  hw/misc/Kconfig     | 3 +++
>  hw/misc/meson.build | 2 +-
>  3 files changed, 5 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

