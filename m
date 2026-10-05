Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CE6CA5FF0
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 15:08:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDkIf-0000Wv-U9; Mon, 05 Oct 2026 11:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDkId-0000WC-7t
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 11:08:19 -0400
Received: from mail-yx2-x0c.google.com ([2607:f8b0:4864:41::c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDkIV-00064l-Ke
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 11:08:15 -0400
Received: by mail-yx2-x0c.google.com with SMTP id
 956f58d0204a3-6762de1c77eso1319606d50.1
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 08:08:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791212890; cv=none;
 d=google.com; s=arc-20260327;
 b=JJqrzKWnInlgMMn/UVP7cwxDXOYcuo3ftyr1paHGg0P9yPHWgkb06gUUUqI9I8E16K
 k8JS5wt8ZUOdmXcdhX7l20FTigiWP14AeFdAWPEKff9w6GHqo37dYZ7BsneGxpxftWb2
 2Vpqrxm5SP07crMwJ++SqpKjGWAeAVciwc8SslNccKY7Wmc/RPhyMX8dfhRElb8qVgEW
 FmtDySAaHLhW7Sgai4zyTIT3YgVXpURIo0RzYRlDowbOaIO3IPke9VgsmKEosLIol1Rb
 BCSgTsTROT7L7sTsKxaZRk9zbrYpdY5sOAhwiWVIUi0/VVGHXhN8Q1vrgWl2guBwoHaY
 fQKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=g9XDQERIpEJdOMP2/uzhWF5CSnKyHjRJ3Uin0QIeTek=;
 fh=Q+NGUnMo2bD6UQC/MsVsqY5QPlBsXSqX58pkOASfYMY=;
 b=qJXPfJjoi0bJanIeUmGOqHJQGjTBrD3ZID/sAsmp/jzvnFTUrpRvyHoVubMUQ85b8N
 IVfBcQnuqDlnXx24bEIMNx3+zrbaB7qAbnJvrCl2rdeI2PgAZ1cQYHdFJqjXv7K/rbnf
 1dl0CmHF9a6dYbtBWFUBhP4Hgo9vnwhp14voeL7K5TByLSORxQ7PFwGhPRIsaA3Ha8/v
 FaVo1U8/w8qcaic8mJPswyrfT9I9fngI1hWCwqMg47xOeYZ4gIBJKKobFlKgWIPqFKwM
 +9DouksYzotVPIeo6mKKOXWDnjGxfuv9fpqRHGo37f01NbN8mWAGrHjp5aJgpegJXn1K
 y83g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791212890; x=1791817690; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=g9XDQERIpEJdOMP2/uzhWF5CSnKyHjRJ3Uin0QIeTek=;
 b=OoxopEwil5PXpWv8p6/HqW88hLLO8Fy+lPjDyAs4i6F9ecMQ4yiqV1IkHq7Voht0gl
 3B+dIMrQQAfEWlKtzdx+LZjKkf8Odmpy2TArEUZrt7iujL6Nket3V/PkoLiTvT4VugtY
 4ZP6prLAOrvEuhcBy081whk0cFK3bE3Rvu9Dsj0wmJDzEDqe1mjet7C6puTxEeonOpWA
 IK7swOOLS+H61W8jYZD59soyD+XWeOLVx5vaxelEDz3jjylZxNjN3mSUDv0MuuTJE2AO
 dUHJE6F1xPfAyGTNpduoEwYtsfxGXDK0xQQrxyVOxAWGERUbwiu8bJTErpglo4Ezjm0i
 gY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791212890; x=1791817690;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=g9XDQERIpEJdOMP2/uzhWF5CSnKyHjRJ3Uin0QIeTek=;
 b=zF1i+qIHhkj/FtSMAxnPIJ4cUixy3ZwLjdkweh/lpDLpPJCkrrUXF25txbihjBK8Xr
 zidht0ee9kVMtJq0cC07i1aO7C5eEnIJPAkUP2PYOnacG6FyKns74FmsepfKbl1iIrY4
 aGYsTv1n7w9UnfpDRDncif49UC4i3jw9P6dF2llMyo9swc4TozDdDn57sGQgMDRM/OQc
 PlUJR+dlGZ8YWAd0JoySckLPQCxX7akawe/ewuCvDZl27gzMUr7ohHG+Od6vyUaMe+c8
 DbRNm1pZ3ypqxu95wOLKjKRurm0JQmuAflLklDlxKE3Axzmp1aY3wnPgI7ObwlzJS1s+
 D2aQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBztGkimqo+TFRx5r/2XZqEEzsi0LhOlFDaxIwZw5xd6EPpp+MDt6u8MUN4tBBA93zSERcyxFX2qEQ==@nongnu.org
X-Gm-Message-State: AFuF++llIye0zz/VV1sQ/K+m1VDYw5HDYIHKq4LO7iOgU9Kwbvb9OyjL
 tC7DS0j+IVz+QwcLfu4W1FWgdfKQrNxnlI/l6aawLoN58WWFDo65vcJCpnqTyPkHLxKxAEY/Uij
 6ZjdrAFhJqBNkMezISRZyqQrf8lGgEFU=
X-Gm-Gg: AYBFou2IkQFz+KLFDg3uXQ8s/VtX+QNuWcnKamMp66ymvZpGu5NJ493ToT75jLZ2k2C
 X+AjvNkF4l5+hzX8criXwzTeh51k5GrPktvII/Zld2p7qoj18RzwxevxMvfX4QTwx+kvGUNJsrG
 ly55aZJx0xf6tI8OHG42dS34mjRHLa5vKgK7DThbru49exur9SqRlWg3ZDs5TCZvzlvEKuZhkfx
 AfpEF8+gxGu89228SZ1zswet32aqPcmRod4l5Ry9BbC8IfTmwSOgLJfODBrdQPBelXhHqmoSk/z
 mM+1WHVIIra3lPXmfsmVk+cZbQaD26/c8Op4UOxdGFsogUwkzu7OumfYwJSdk9XiWkYVGcG8/Ky
 f2zT0JmNgdjLGNoAc/QtKyrWJBg==
X-Received: by 2002:a05:690e:11c9:b0:677:bf19:f06b with SMTP id
 956f58d0204a3-677bf19f758mr2332695d50.84.1791212890137; Mon, 05 Oct 2026
 08:08:10 -0700 (PDT)
MIME-Version: 1.0
References: <20261005101800.10821-1-shentey@gmail.com>
 <20261005101800.10821-15-shentey@gmail.com>
In-Reply-To: <20261005101800.10821-15-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Oct 2026 23:07:57 +0800
X-Gm-Features: AclHuK8z3qK3xccJoMLL7NVz7FZQRz7m_Sh4-My2IkNTLcGIon1NGaq0QsjSEuk
Message-ID: <CAEUhbmUBYsV77Pb+uPL1OBnCurhYpbvObisXtpGX-mcY+TtqZg@mail.gmail.com>
Subject: Re: [PATCH v3 14/31] hw/arm/fsl-imx6: Derive from TYPE_SYS_BUS_DEVICE
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Gaurav Sharma <gaurav.sharma_7@nxp.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org, Bin Meng <bin.meng@processmission.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx2-x0c.google.com
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

On Mon, Oct 5, 2026 at 6:23=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:
>
> Deriving from TYPE_SYS_BUS_DEVICE fixes the SoC object to be reset upon
> machine reset.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  include/hw/arm/fsl-imx6.h | 5 ++---
>  hw/arm/fsl-imx6.c         | 4 +---
>  hw/arm/sabrelite.c        | 2 +-
>  3 files changed, 4 insertions(+), 7 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

