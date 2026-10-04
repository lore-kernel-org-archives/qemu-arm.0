Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E69BCA5FCE
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 15:14:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDNuU-0002Qu-UK; Sun, 04 Oct 2026 11:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDNuR-0002QM-Sd
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 11:13:52 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDNuQ-0004zZ-Hu
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 11:13:51 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-8a08bb1eda2so7309727b3.2
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 08:13:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791126829; cv=none;
 d=google.com; s=arc-20260327;
 b=PiPGZkrTRqgiU4+BkK7+sMD8GBXegO9Hini+J04PcDBflixj54QqY1ChlxOAB2hiMC
 wwgqqFAWetzQKBoxYar5irtWx1Z7qdUIU9cYyKM3fAbqJcrHg+qV5A8ZhFpXFWyD+vTN
 HRvahygFLt2sgHXsDDfxfnxm3poGVqzJuQ6NMXeHlDcY2+LmuSB5xdNUkGGmBC9CXSYP
 sfDq1Ur9htLfaWnSFDtqmYl+uMZBbGgS5nR/recmK5+BqoPbRHSM0wpiGgxg1I3Z4zXi
 gIoURslQIQeZa0nS2xq6WPLxDkrv48U4OSQtKmXLss4+tHA1zL9uD5uoLH3HcktlIQNs
 n9rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=H28ncu6frmzApRnUTc09JypBbs/vijoLmtv7rbrufYE=;
 fh=PP1OQunQPnoizpEm+37eikGpfyycqLYlOYT0x21ftVw=;
 b=bpcNy5t02h9hRLRG9qzBdcuFpaHDPzjgn3oCXrFcnbOXH0d4Tdbiq9SZfp/des4o7q
 CuIV1ffTrlF7UgsSUkW2ByT4t+hSpEAk6ZhGNr3w0vxdm19A2L2NZ4krBII94Mq/Wnn6
 uN3fJ9+Sg5ttoI+976s9OUaaoLsw7ryer8HL1HdU7RJKdrmpKfivy3B8gDZeW2KSoE3y
 yTbjBua6qNgN5qSkWGuV5dSYIdOFOrLTX5wX431vZHIx0tSuV0o5vakkfo5hxHkb2cdv
 cTwOMod0irNkzdgwWk2eQG5rGpoRbp8SBfmLndDJg+edNoOBZd3iRH92l8wwpvIgx9mW
 H7UA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791126829; x=1791731629; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=H28ncu6frmzApRnUTc09JypBbs/vijoLmtv7rbrufYE=;
 b=iI0ojyBHPzg6boSgCTOCYEBkgDmkXe9bg+6WIBXrlDENSYgt8VirThXI4INE3FakFJ
 EM2oFLAFRUqbO/FktdkiN2TVTJcFR89zF/ayiqdZGnOWYmiHbilG9w/KJzr/kVOlPBNQ
 QD7UCbHLB0LL0AFm7IFf4MWiYT/RCP6xWrALI/wd5w9/DKy0zLqn+u1PAYqbPcC+sSvM
 nPGvKfriDSuu8GisM/WWMf3bAXq58x65HHVA47FdfFWaLY4P+97kh+padn04S/czxMOG
 9RzOHIVo5Sdnc3U466SDICQD0InpwvyuYNhQPrFaieZmXKPZssGSwoXZbgBodb0ayKQ3
 EA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791126829; x=1791731629;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=H28ncu6frmzApRnUTc09JypBbs/vijoLmtv7rbrufYE=;
 b=cFz7HmLb2rytzXbEbzDYQae16jqfM3QbwyXlogz3i6gA5AQlT4TuA9L+B9UzjNE1Ys
 zkgQ2/i0qEjp2IiASeKmRnt/HvCM5b06C999cOkk/LgH9Sl2sUu+xF2bgRKlXEa3ZNOB
 +tUS8KrBW1LGGY0vLpQym50yK9WyHmCsQJst1Xv1jYGhlR/Ipt7TFjE5DMBGrOdko4WM
 uqpsONMoRlv5w8SrBNAEKYohNPvow4oRG0D0VbLwwcnP3OC9SRPR/o/c1MwLHSYr4SPD
 kYgqpxrLMOPccfeErQxXP/LKTo4Eu+fd+tEiggWJKdsoJaKVfF8Ye3hTS/lPxdv8aJGy
 nxJg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxScDsgZucvPwhVF2/gqEdS8Hc9s/jht8kDvaXamwDRaAbSAiFlVTjLY2znuVv57k3aNZjpXmVzvA==@nongnu.org
X-Gm-Message-State: AFq9FYIb8yft15bj7EKUjkuQ/5949yR8XZgtrrG0PPemqlSxZMwBQ6tD
 jTl5xAvSddKBMezt2V55BV1pKVSVRuHMCQ4zBPM53dHu6udnxA/mwg/reR56ienjV01x0RtmfTp
 gwbz8neLm4qqi+OMfvwDnHFZPBYWkZWM=
X-Gm-Gg: AYBFou0XTek5xlPnSCk5JDiAcHPmvtwPqmT5+oMIIzt6brqoh7ITx76SXILZwFrVlv1
 9tn/JYQHnqaVFZ+UEKxuCm6+bYVGhC3O7kzHK9zaprxuCr6T+2fiad+9ptEArZs+SNn07YrQ9mS
 P9grOJKXWWVLCyxRCYAyzKyXiPuRILPG9rCQ+byRd+Taj6A8IdUMV+b+sD22rcl2f0e+6JaGwk5
 05atzfFAojnjXIuvwKSAjx71DqbtcVH1CFlRbPc+PyYXAmh6VlIxI8ne2DH7MSnAlFQj6olFjP3
 n3Pwqj+EtA3S1Jlu5YTZBIPx/+ozcgxD/xR0ZbXULLbcKffI4J5ubtdKA70wtqePuaD5zL6UAhA
 I6RrNbnnpB/LkgVg=
X-Received: by 2002:a05:690c:e3ce:b0:8ae:9080:2c1f with SMTP id
 00721157ae682-8ae951f3caamr20383677b3.36.1791126828716; Sun, 04 Oct 2026
 08:13:48 -0700 (PDT)
MIME-Version: 1.0
References: <20261004122647.3913-1-shentey@gmail.com>
 <20261004122647.3913-3-shentey@gmail.com>
In-Reply-To: <20261004122647.3913-3-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 4 Oct 2026 23:13:36 +0800
X-Gm-Features: AclHuK9dWQ6Zx5K--ao2lV4SD2QXTQc1YtePyBOawwK_3Dhrcaa9a_CnMnq3g1E
Message-ID: <CAEUhbmUtDSiqoV3tP9XfWW+8PM5jeE3r=8Zn21MHcNx1y6JSew@mail.gmail.com>
Subject: Re: [PATCH v2 02/30] hw/watchdog/wdt_imx2: Clear WDT lock on reset
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1133.google.com
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

On Sun, Oct 4, 2026 at 8:36=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:
>
> The WDT bit gets reset and becomes writeable after power on reset which
> imx2_wdt_reset() represents. While the WDT bit in the WCR register
> already gets reset, its locked attribute wasn't. Fix this inconsistency
> by adding the missing unlock of its locked attribute.
>
> Fixes: daca13d495a1 ("hw/watchdog: Implement full i.MX watchdog support")
> cc: qemu-stable
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  include/hw/watchdog/wdt_imx2.h | 2 +-
>  hw/watchdog/wdt_imx2.c         | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

