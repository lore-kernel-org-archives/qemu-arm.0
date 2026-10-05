Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF0DCA5FF0
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 15:08:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDkIc-0000Vr-DH; Mon, 05 Oct 2026 11:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDkIZ-0000VH-Ew
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 11:08:17 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDkIV-00064Z-C4
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 11:08:14 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-8ab43af5e97so12179187b3.1
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 08:08:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791212887; cv=none;
 d=google.com; s=arc-20260327;
 b=Xo4tTV8nNUCs+Ad8Q5YMzd02BT79dngYl9cphK4dHrr9VBx1Z0jWQOZWjj9t+meeA3
 VUVxfGNXsd7U/Hng8wU8HmFZ/YQYnu4qvkzKA2RDObDZOvy4x6vEkf9ofxPMw5DWPuI3
 WEzCbQUTA4/vvFMwa+9sMCv1Y3U1tS0dXp4Lbc2Mjd/7RqRLq2oNpQpS/igs3GOnN2j4
 fb/VhYtzaG4eKq28r1PJ09rVFiEq1oxeBQeeTSWYbZXT9GolhhmcnumH14W5HL5EyleL
 9V4LRJurYqbisFxnzTGqoVCCWTw+qmm4aDQVPEKTxhmY1F9urVlypbL+5OOqX08PNWm5
 G2fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=oq5JYA1bgT50M9QhvD044UfS8+Gb/z4f3LAqwgF2ZEQ=;
 fh=GfAmulPWcvfBQks8A+VzcbszlphqjtyJzz6DMge3lvs=;
 b=cyX+kf7SrHI9eeFJh2i5zXMW85jzsjLHOajDgdYJtKhgJQ9Yaq2asMPNifhUHSB3mR
 HTn8vNLsutkXeY46UJmbniJtbL3sk4MIk7VvadN23kpRv6qYeKUjgk8do9ftBWeWH8kq
 5pAOQWH7LYH9i01dfvhg/jgpflBwiK6U/yAHVcWFzc5A2mBR5BSLmDW7inzLlwVRp76U
 P1ikApJft+evcazeaFikNQb7CiSixWiTXuGWrQNgF0LgqrOewUyn6HdJp8nej7eM/nkf
 IPAD+lur7EnUBteHhz99zpzPcew2bG6YgqebIeXfDkyeUFb1VDl2Z6Q9GUwuMhHduKLJ
 THKQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791212887; x=1791817687; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=oq5JYA1bgT50M9QhvD044UfS8+Gb/z4f3LAqwgF2ZEQ=;
 b=B5Dm5/5E2WuUyyGSP0c9C+2LwnqjC9xNcn+7+Nff+6FdSYRRferIAWZkX0w1r6Ap3o
 f5Q4IrHgV6e3ZsaYfKiHvx/Umc+SQTBMSQcZyGcDW5zF2nRI3QIggi/3qNQXnIuBFHAC
 M/Y4wqouUtklEPvDbnmiW8Ck657qKGwMvnuoerBRO5meEZTtvHozcpC8arluGMxd4CKZ
 SadBCSxWMxtTwszC4ZUmHU/kTzRKBiTuCpcE9Ap6cDBsf5EKvL+JsSednZYWSJKIfqqh
 m6LVS7Q684zd8cxoGpTOtedF7/u5aBUh9e2qLy+bhCZAh0iK8+J5xSotoGifMiVsJzDS
 89FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791212887; x=1791817687;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=oq5JYA1bgT50M9QhvD044UfS8+Gb/z4f3LAqwgF2ZEQ=;
 b=cVffFzqGcDOnpu/6GY2fhiR8HHi4oOytpXhhYVswDAC3/BwwhSs5XFzVIFHsYlcFpn
 zmooo/EDa+M42ldeDyn5+bPGHHfYGOe1wVOQlrCV93Add3HhbDpEjo9IqpYZ7cIr/D3G
 ryYOgFajgX1rsYQZt9vIRO//5yFkkng1ZAe3oYDjb/wkEfU4l3VELgrPwD5/X+RFZ3gk
 OJHLlSgF5FNMBIYIr48wTr9udqiO1/hO8V9SOhGG092/VcsjZAeFZVaBbeR4PIo2kuCV
 LdE+edkmTs2DtB2FEfuZ6GE2Op79UEZE+yJbSe9B99NQb23lxnJY0vWArmm54JsT9ce9
 8WDg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxgBF2GVWE/fHWK0h+harA2FAfp4qFt2DJXf1NR6iHzNMIrmtktEr+pHcq0DXqV4BhUf9INRwLyNQ==@nongnu.org
X-Gm-Message-State: AFq9FYKoZfohSymc0o7ee+ZmqVRzNApJuR+tQcJ3PpQpneavt7WSTGk9
 p4xTHW/cJbV/H3eouiU0lmYYL5XcI1xfHjjatM5DMrdLGK+QuTlWiaTxOasS9HM2nxCg34s39bl
 nsmTdPKCthEYLF3BKfbI5ISGORLNbfQc=
X-Gm-Gg: AYBFou0uxGNKeGu+viVkokYGiGFuBSeNKHtZW6ALIP6xZVPLVhoZgP+HR6yM0Hm2vrm
 m8fmEEGTdkDBRyA9o3duF5nwB+HgBPr6BRHwEIzx20Aiw4WOI52xhdIdw02UC1LqDgD3/gv9eTI
 v+zSe2s3Ixry6sOYVPpzNX7kWNTr2ha/436N4ExiPXVAxjo3FJ6Ez9vMxEUv+C2RNiiJ+JQBSQX
 PACB9KA1ObJzLyEdyjHUCGl4+I96rvfcaWr9/bocPhtQACAeKCwuliSqSOnnTtZDklEJ0ic3wYz
 RN6oad4V3KeqTui33fwNc/F70DtTniOQD57dQT/tawemOU6ETjPIEBb8DVZYmg8DuuVGcVHe+l0
 fzBQEdQhoP3CDoYU=
X-Received: by 2002:a05:690c:c510:b0:88b:6ad8:48cc with SMTP id
 00721157ae682-8acdae9b61dmr63940687b3.16.1791212886786; Mon, 05 Oct 2026
 08:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <20261005101800.10821-1-shentey@gmail.com>
 <20261005101800.10821-14-shentey@gmail.com>
In-Reply-To: <20261005101800.10821-14-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Oct 2026 23:07:54 +0800
X-Gm-Features: AclHuK-qMuFjt5suOK997ZTubhMbQVt--84kuqd3YFOJAEMoXX0o4Ih5TpU9JXs
Message-ID: <CAEUhbmVmuYTAHMWwGeTX3he_1_AvzTV63CwLwG+pPgYgvUk3aA@mail.gmail.com>
Subject: Re: [PATCH v3 13/31] hw/arm/fsl-imx31: Derive from TYPE_SYS_BUS_DEVICE
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1135.google.com
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

On Mon, Oct 5, 2026 at 6:23=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:
>
> Deriving from TYPE_SYS_BUS_DEVICE fixes the SoC object to be reset upon
> machine reset.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  include/hw/arm/fsl-imx31.h | 5 ++---
>  hw/arm/fsl-imx31.c         | 7 +------
>  hw/arm/kzm.c               | 2 +-
>  3 files changed, 4 insertions(+), 10 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

