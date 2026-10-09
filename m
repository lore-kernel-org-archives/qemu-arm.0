Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC696CA9EBB
	for <qemu-arm@archiver.kernel.org>; Fri,  9 Oct 2026 22:09:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xFImY-0000NB-Rg; Fri, 09 Oct 2026 18:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xFImG-0000Lj-8U
 for qemu-arm@nongnu.org; Fri, 09 Oct 2026 18:09:22 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xFImC-0007HS-DF
 for qemu-arm@nongnu.org; Fri, 09 Oct 2026 18:09:18 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6a0a4aa99bdso224717a12.1
 for <qemu-arm@nongnu.org>; Fri, 09 Oct 2026 15:09:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791583752; cv=none;
 d=google.com; s=arc-20260327;
 b=QKHQYKEZQLq9ArXRcuJ2PrlQyFiKdjpKPAtSSgW5tUxQpACKAacdzzsuSDRFhbCTAn
 ac7YX1h7z2qdCF3PGt/cMUIZleXI6Mc6YUpE+oCIUvDCZt6L0aDeJJjRypZ+FrzKhq7o
 SqbivNADAx328AOOLBGMfz8G+ijyJbjpn+lefrnv6OB5c7koqMdkh/0mn9ZNRTR0m3DG
 RPOfZhfjNY5fmiaKx0kPSCSFwL/d+mHD64gzEzEWjJK9jd4l4juOKtyMQ/WbntbwrVyL
 FsKdH5VTqYItKR4VsF7oYz+OFfQ0HlOu7qqrdhYDIES4/F4cGOCr7V5KEpQC3uQjKhWg
 7+KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=J+S78Kjyra0pvWTejyWpSKIHbExHG/f3ZbwVnekTvZg=;
 fh=gXCzNXD2fa2kD54hfD6nUce8YphTb2AR0yVOhhlEdJs=;
 b=bZKO2RjAOdOO81D7uxt97CTP5QxrfhnL3wPwnn0mj8urEIKfWq2ASIgQDHJknbdx4J
 m9UyoErX5Yzl3WRra8rdIp8P9jWMJz+pr+sJT2sQyMrfGRy40NKamnIWw0TJHb6fnbRJ
 imWKxWX/eKLElUjmPEdayqeXRPBgNf+HVjjKmtyfKU0beKXPi7tNoq1imJmXWpe9N/pk
 P2fc81bJessH2OQpvd8ZrlZK0h7MNAA4hxZpIB5UbOLtRi2IkaJJNpwoYIuHeTpSaNBr
 l7m0/C2c3s4TI8XnufBSwCTDoDsRHN2Wb5NDCOgHhfB+JEz7CYa4yh0sT8t96PRwIVY/
 SG8A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791583752; x=1792188552; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=J+S78Kjyra0pvWTejyWpSKIHbExHG/f3ZbwVnekTvZg=;
 b=i/BdhnsVy3VKyaOypYeRjfwDycSrWhIntv6l66Pj1biOUJbXPQzV/+YS5vXXUbL0wY
 zIw+gq/GFV/SIUDhtR3HYXHoU2mRUHZ6hLNjprBe3r8PMuUoqOYmhUEBGH5cPxYqe9nS
 zJndOJ2zHgG+6aNhmtluPKJk12AQz+WccB6gPO+6iA4KwntvJ7WSRy3Wkc8GalBwOHeS
 yUT0IN5BcaRe6hyXj9mlU2Z+vQGZOo7Wu2+NUQsYpe7tOX7pStndBd/bjpVA6DXmoTTN
 2t4IBVivy199dw/N6fZgrOhCjM4ZKqkz7s8rKbhFwcYX/Hp/z2+W7oqhqORKxGL96yr1
 3qkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791583752; x=1792188552;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=J+S78Kjyra0pvWTejyWpSKIHbExHG/f3ZbwVnekTvZg=;
 b=EiOUEfp5TL0hYp37lKJ3kD8qhwnLWXnTJGhJho9WKO+VHqzgr1PecKTUec6Ea0GKGy
 IBNX8JheWT4rsar6DzojakN3wQOAor64jTRRQw+FO9eCNsPmzAxD/l86AjXj37XFbW4D
 iqH9mUpfOnXEdI2ylk3eR6LQhIv7SZq/2c5b2zvj9ns7VRMZ2zV1spAHq+JklElesLrR
 yH5oDb9g70URAdRQr2dSsov6fnb9e62UBQtss+d3ARhdIxrVBa5CgaHDyomaDmrUumwF
 RNABlAilBpbRW+lVhPzf98b641mSL92mmuqH+Ryqlk0g2LldOQlNolMkXnwejDllhUNA
 a6tQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzR9CTYapaXqas9EyI4Fhsps3N/9pIEIXzLpAPdpOnyZ+vTKtTmJlC/s3UWiNT/yDwr85gUxbqKMQ==@nongnu.org
X-Gm-Message-State: AFq9FYLRW0OWlcAqPqbZs47TQgzL25Fhi8JLvxaqk+VDIWhYhieDd/2c
 pgtQLwztCvnlRGNRhf0wJIEiXPH+h0fV4ZuVipx6Fgv0TcFnIgOw5EEpAedL97uOwoIqtz7xRGx
 UjhnCyyF9HUkPFj6dowN5Wh/P3PZMuBY=
X-Gm-Gg: AYBFou2gTOqfsLK1Lo6sIJyymioRpuIu35x2VrRL8UrnxCsBAh3lMb5LH3vf6aVB3Vn
 fiOEpLTNdCitzimsPZtdOs0Cr+icOxX1JvPTH7ncKOBWo3VX+80sxuFLwx7jyPTGRO6I/HdoLNh
 OPUEFCLjFUy0j0wR9HQ8Jwu9HBD7sRwQg0EoJNzIzX4qTQi2BSsDW9tPXHJSKjBiNV1iy374GRi
 PuudNgRVXkoJ+TxzOjbqo7ajm32UAPbADtJ+9eAYM2CjR7mcZvZ7f7sv0uJIp/U6S4u+lYnorw3
 wsKLbzv84wHi74qdiKi8CSdYPsTpm5Mmu2pNUhtxLKLZBuQNPGe6+UE=
X-Received: by 2002:a05:6402:450e:b0:6ac:9a44:d409 with SMTP id
 4fb4d7f45d1cf-6b17c1dec0cmr3075874a12.4.1791583752003; Fri, 09 Oct 2026
 15:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <20261007115253.328-1-luoyonggang@gmail.com>
 <3631c54a-5ad7-4037-a21b-37c3c61d712d@oss.qualcomm.com>
 <9ee6fad5-4117-42f2-95da-818d5b4e0aa9@oss.qualcomm.com>
In-Reply-To: <9ee6fad5-4117-42f2-95da-818d5b4e0aa9@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Sat, 10 Oct 2026 06:08:59 +0800
X-Gm-Features: AclHuK_cvxi646yeVzZLiozOdpnp9huFOGL5MpdHk1rUuPJWd9KqDO6kZS0J6jA
Message-ID: <CAE2XoE91jjqtF_gW27tQUMiWoJi-pfYQwxWGe75+DFpYmY2iHg@mail.gmail.com>
Subject: Re: [PATCH 0/8] qom: pass TargetInfo to the is_available callback
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Laurent Vivier <lvivier@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>,
 Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Stafford Horne <shorne@gmail.com>,
 qemu-arm@nongnu.org, Philippe Mathieu-Daude <philmd@mailo.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Steven Lee <steven_lee@aspeedtech.com>, Alexander Bulekov <alxndr@bu.edu>, 
 Darren Kenny <darren.kenny@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x531.google.com
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Sat, Oct 10, 2026 at 5:58=E2=80=AFAM Pierrick Bouvier
<pierrick.bouvier@oss.qualcomm.com> wrote:
>
> On 10/7/2026 1:46 PM, Pierrick Bouvier wrote:
> >
> > I'll pull the first three patches.
> >
>
> Now merged upstream (40ba85501c0b6ac2a7319d3804dab072edf67564)
>

Hi Pierrick
Seems you post to the wrong place.

> Thanks,
> Pierrick



--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

