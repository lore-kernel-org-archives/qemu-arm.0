Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD34CA5FEF
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 16:21:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDOxM-0005dK-NG; Sun, 04 Oct 2026 12:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDOxK-0005Yg-Rb
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:20:54 -0400
Received: from mail-yx2-x29.google.com ([2607:f8b0:4864:41::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDOxJ-0001ix-Dk
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:20:54 -0400
Received: by mail-yx2-x29.google.com with SMTP id
 956f58d0204a3-677a7faac73so730233d50.2
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 09:20:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791130852; cv=none;
 d=google.com; s=arc-20260327;
 b=p6vlWxpOO8TV0OzO4+V7gtdljo/mzeLG/yhoI09RoWMBwurWDZMcRl/M/KNMJw8hEJ
 8Z9noBtcVz17tsU0CjTZrFqLScENc21309YcvNGABTVsP0SuijCBq16tRvFmkgo4e2gD
 t00dpRyjwLuSc0TSzvhhkeJFiyfu03aZSuSy1ldZqK9QF53L49f/YThWpM6bnbSIx+5x
 41cW9Gvu1XBXyxf5zmL2bl/ZurhXSmJiQAjsfe7Z+3cd7M2YIgblwY5n7a7VNQsO65oG
 6qm6Jjppz8gTCwLMFn/x4B84NhCcsckAJgRji5WIqW7S51wLM4mIyaOx37j1GPXiob0M
 5m4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=/hywT0BiVvvITDVjhSXn8IT5PfMHYkwYkfwHJeQppMA=;
 fh=S86armnq2JbLpkUvKyHrFlPDXToU9AY7wkEGZi/CKgo=;
 b=Wudhlqdd9xiPkNE1d24MFPXHsrI9D9CahbkKTzou4biQ9mdc9vGoG3DEO3d79H/HuN
 StJf3ulC1akP8ZGpllGwQHRzLIHzCWuHBEN510Rq+c4zzE6F61B8m3W5jG2Q7C9xyxZD
 BQmazeAvq8l+0w1DwP/ugvUYRBY3rnIBId3QpcmYKmCbvLxOr4sRznt2DnPfvSnJJy8A
 zc1PBxRzDjjiWrlB+CdbOsmlNFQsW9wfcawUjm2jF2VnGL5C79D53GR3eg/H4RZqejVO
 wZSJpJ0vsmsAfBEb/E8QDkM13i7YNqkGhCfMfmAagiCzqc0+XAAyOonADuhSATltsxRb
 rhCA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791130852; x=1791735652; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=/hywT0BiVvvITDVjhSXn8IT5PfMHYkwYkfwHJeQppMA=;
 b=rKIciZ/eyHVdvX+M+2QFDX7TNv1YBNaV9wWbR1awNVE6oGi0QL1EAr5nRW/Q+wdfDH
 cclyPUcHcgG0hXSyMEW6PUda1tO33zVPHXPwkTfxoWsZ8LY/v1OkKwv0/2tnC2bXpalw
 eH8iHmYHgnUH8oIHQT2eM65I9Ohv7bEyKEED24C837YD5ulOyLtVs4nn2tY5pLD0cxdX
 qztieBolzgE+xNtn7S2dXm67gG308AB2wyz3m8FdeMmruh2iBOtzRHjJo16xVR4FXtO3
 qqj19OBXOH7anBKRTjXnNOiaJE83jhYVW2Gmex3SVaMklIbXMS7ABxGZnBC8qxvzqhQY
 mmaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791130852; x=1791735652;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=/hywT0BiVvvITDVjhSXn8IT5PfMHYkwYkfwHJeQppMA=;
 b=DR9h8ulKfh4JqMp9o36sahEbpLe2ITyQUy0x5HgTI3c3IKs9fnjqyOUbZj64xJ4oQO
 M8yPSf4CplYGWexIR9tRHDAKV89eyatyQDervYRb5KjEPjM0e9u9Ktp2AfcVh6UjbQx/
 ukG7usyvLyjgi4euVypYaShjWPNi/5k7C/HB7JlEDqIxHOAu0fKeI2sccpOecwYPC6eB
 +vF5UkYROBAqJkjk2HsTNcMILRWYoi9vfg8ejb6fhFYeXNU36QtbSJ9dJKmsVD1hwryX
 ijTCyomx5CPwu9s2wrYAlbfYGzyy9A4s57KkrkGwUwa1MmBu57MpseJ6Dr2boe6L9dhE
 bdaQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxfoxA0/6hNOuhA4o9U/FtkoTQjs6Xp3m8BTGzPkfqo6frju3UDYa0ZbhSKinuY2n6LvOd0gf7ZCw==@nongnu.org
X-Gm-Message-State: AFq9FYKiSgRdXobt119Oy4RX8cdCkGevslvbaVarLiUmmiD4rIUizCrz
 18PwTp0ivrTd9s/8C3AA7jQX8zWGZgwzClCu1w5gd6ikyw7Dbddjo/7bBI7rfp9tOjxIMdYhAET
 UhfUZ/vP+bog/eGWH8KiKi05WGy4mzSA=
X-Gm-Gg: AYBFou2rWNwM9dK9OZh2lDrVVkBX3l+ePsSlPTFFDHyjTuzydjc6L15vjjODVJF9zSF
 1pa1mYcq4IexBnQoqXBTAWtKv/ON+8hScMRLptedF4OUENalAJtU3QxZd03gMsVOCZgVdYSohMN
 Xv30uZkFQHsaU7/QiLVfYkoUuv55s5UFGY5201PZRuYTAYSNBADEw2UCFMWHQs44Akki3JHKiaH
 mg4xT5ZlhMsoplmKzrvcm1RACajSWZP1jKyxWvi4CAgPNlhTS579Pym1VEEip0j8RYGLLJp/RtH
 GNJHiZAMWfj1Vp33m86MdNSugWs+AwQwfdxG5bdv4w0o6Kt5gKt/dbSpT2ThGnIOjcIjdgQsEh4
 t4Eixxv16fY9Zu0c=
X-Received: by 2002:a05:690c:e3ee:b0:8ac:b1d9:460b with SMTP id
 00721157ae682-8ae38db4b81mr33151567b3.23.1791130851967; Sun, 04 Oct 2026
 09:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20261004122647.3913-1-shentey@gmail.com>
 <20261004122647.3913-21-shentey@gmail.com>
In-Reply-To: <20261004122647.3913-21-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Oct 2026 00:20:40 +0800
X-Gm-Features: AclHuK8Fg-jdr0GBspjwbfUnw03ApYhZvRskuw_kQAHyucyrMzMF2sG3IFuYgjU
Message-ID: <CAEUhbmWpRxohFygDnv_ng0U0MP=--S4+zQoRr7JA_aNaFJxefw@mail.gmail.com>
Subject: Re: [PATCH v2 20/30] Kconfig: Extract config FSL_IMX7_GPR from config
 IMX
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
Received-SPF: pass client-ip=2607:f8b0:4864:41::29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx2-x29.google.com
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

On Sun, Oct 4, 2026 at 8:37=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:
>
> Over time, QEMU has grown a number of i.MX boards and the monolithic
> config IMX drags in unneeded dependencies into each SoC model. Extract
> config FSL_IMX7_GPR to eventually eliminate config IMX.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/arm/Kconfig      | 1 +
>  hw/misc/Kconfig     | 3 +++
>  hw/misc/meson.build | 2 +-
>  3 files changed, 5 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

