Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E48CA5FEF
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 16:21:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDOy3-00066p-EJ; Sun, 04 Oct 2026 12:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDOxv-00064P-Dz
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:21:32 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDOxt-0001jx-VZ
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:21:31 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-8925e417565so6911167b3.2
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 09:21:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791130889; cv=none;
 d=google.com; s=arc-20260327;
 b=rfL+kqv53Qv/o9r7a2MifOf1lnEib33bR5j1kUxw/DK2B5Ijd/7JgGT2eFQAfDkIpJ
 VBsLCgmFivW+R3TOC+pzwPLNZpIl9dloHAieoxQl16R+ekNLTW+/2eWBPVHTs3l8LQ1F
 HQzRGf+X5HzVCeD1BFWbPGOlP4Igh0DjIrDfWF0fwoXwwlAkhgymg5fcbn+4TNh5FuuV
 JLYMUGCah1dw1LGsgLWuRzbJ6Rg6uCnjs2ItMtH9W6/AMbzWIW6GraxJA5/2yKHm/csj
 BjBGZI8L1LY8uxtG/Lpl+Hh4EaZWF5RWksNwgfYCamRDWFaO/jhsbG6ODfnGJApg8mCR
 lGeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=4gsK/d0q0ehiNmWTKW6O9tNfG9O/1FIlMej4M+HIvxE=;
 fh=IZy8xi8N2h7Tnf9w2OYZ8rX0CnBYRtv4eyOmhSm4Edw=;
 b=j6YGLyQ2KEWQZ9VLUx2fFGH25sK77xuXbptev/JGBL1wTjCaACoIDQFDwD/39j6fSf
 NzCayM5pMV3TqQEkhk0pFvU/6IBli6PqA4//4kBs85xRlx6vGWFBdCZSoHKlZz6rRbGu
 eLBHVNNmepJbXcXP3L7i+Almc57zax44AGv9ql+O5v9NNTg61JAwMtAOr/raEPotojsh
 PJ0xqMPGbcCDYQSWjSXrD7Pef0jToFN7NHAPNOan082LV/Eonm3qY48PMfsmZKxxyoN5
 X9GaJL51LY63fX7DQ0RAC7OHv5425nHCZjbhSwzGMFY+iB5fr2OECRbMi/8r7ShpqubW
 6q5Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791130889; x=1791735689; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=4gsK/d0q0ehiNmWTKW6O9tNfG9O/1FIlMej4M+HIvxE=;
 b=jqHzIw551XcmZmGvbpjReuVZ4NzVQZrMmN83O4x2oocq8Nji3g2O1YK1xuXZMLdAOJ
 HlcS3tZiCHvVGc0hXwl6/1ys5d8ubm2TiVHxWaE/vqXuPyzHjeDjOJ1vELvdDtfTAnEX
 TTg4hguMHBFRuxX3tIGRb9wlfvtUGfBt1rAER6yLy9yYpVU3Zs6hMShcwUwzhru8FkxA
 7L6WyXWu3rZbwhfbbPEUA+/tRk6wY4//BuDbr7B1Y3LNnQLTihLAoLN+H4pVhumHGnlb
 rE9KS950i3oK4R9uV0+E6lsV4dCGw5l6FlqrR9ktx0W2ty9xoTpyAjFKOU7WUlohLe/j
 CyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791130889; x=1791735689;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=4gsK/d0q0ehiNmWTKW6O9tNfG9O/1FIlMej4M+HIvxE=;
 b=Y3RVao+ZTygd+s5kYln/HAT7gxHa2DY5d0zthSKuqrYyWd8xy0Fu1WFJLVRe6rQxeu
 IEiccGuayzE7lgVmum3yJagtrCzyoFq70U1c2hc8QZMJvWkIyLu/HAA06qh1l7TcgrGp
 zUgyIOt2EMWyT8+2LJYZ4kf8Y2p7y/Jqv+ccuXeAkmWBPOhhv8S8fVeGXyF/ZOkU2g8E
 a8FBUyX/Kag5AiPxeVKxdrKisXr2GJ7m5BNOSGjoKQO+lqyQMJqfJqlIYxhsWMRn7zwx
 g7izHKmRIrvoSxBJUl9h3LnQLcuY/GxwVPWifYYEgrsDD1eZSmFtfb86gvjF5FsrGH9R
 wmeA==
X-Forwarded-Encrypted: i=1;
 AKwUvBy+fK2RjFyKpgHZjWGVBxfvFnp/IPolES4cq/QunTRWlO+BSW3vN1RvQQ8Oit3s81Oh5TRDyFtnag==@nongnu.org
X-Gm-Message-State: AFq9FYJ8sv74FzdzqAdVATuWHEkX300QhKzDnvcSsAZmEZc+XQJC0l2+
 rMqy5NnreclP8kc0q64cHV1Jnzc9qvKLB6Fn9BGj8DTpt6m7o/bd9cRRZ0keQqTe2ZdMobLM9tF
 PgiHA4ShvYN7oESamMYd5w/EMuXvgeFI=
X-Gm-Gg: AYBFou21Rve4Rp+upkCn4SpTccFC1XhHq/izXgt2GjbCYDU5ehoSDzgptZpgIjzYXeD
 egOkyzI/O6mWZf1mm9Kw9rotxw2+GKwMXYQBx4TC9b+uN/Wy8+pnd0D6CVZvvzidduRhoCSB6gu
 qNbpiiDfJ5qc4qE7DrVWLssIMVOAdOV7YH2fqQQx8JYr9JUrU6jlIR19Zo7KoH+t+ipexLLsUp/
 uEOEEYRvIxLZLWYA/y8zD25HavoucAUH6AhV4trexavxl1gbOebl74V2wVtdlsu0uIAEemsFMkZ
 Qkamx+NMrz8DR3ynQWlG//PO/XFvpzKkeDqnwwDyIDQMEI2oqSNyf9LCLLP85KEnbtgu/BsTVQi
 AHeZKQ0Hn2hkqztY=
X-Received: by 2002:a05:690c:e3e8:b0:8a0:e27e:8e75 with SMTP id
 00721157ae682-8ae951fa642mr18052627b3.82.1791130888524; Sun, 04 Oct 2026
 09:21:28 -0700 (PDT)
MIME-Version: 1.0
References: <20261004122647.3913-1-shentey@gmail.com>
 <20261004122647.3913-22-shentey@gmail.com>
In-Reply-To: <20261004122647.3913-22-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Oct 2026 00:21:16 +0800
X-Gm-Features: AclHuK_1W2qS_waYy4Np_-BRAdGJTYJ6CNIOmg3xlU88F8rxp4YASb54Lcbf2Dw
Message-ID: <CAEUhbmXwKi5r9Ye5eVoH61dNJcJO0EsqRQwJVJsN2feZYjRqLg@mail.gmail.com>
Subject: Re: [PATCH v2 21/30] Kconfig: Extract config FSL_IMX{6, 7}_SRC from
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x112a.google.com
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

On Sun, Oct 4, 2026 at 8:29=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:
>
> Over time, QEMU has grown a number of i.MX boards and the monolithic
> config IMX drags in unneeded dependencies into each SoC model. Extract
> SoC-specific config FSL_IMX{6,7}_SRC to eventually eliminate config
> IMX.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/arm/Kconfig      | 3 +++
>  hw/misc/Kconfig     | 6 ++++++
>  hw/misc/meson.build | 4 ++--
>  3 files changed, 11 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

