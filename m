Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90082CA5FEF
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 16:17:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDOtL-0001jm-Ko; Sun, 04 Oct 2026 12:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDOtD-0001hR-N4
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:16:41 -0400
Received: from mail-yx2-x2b.google.com ([2607:f8b0:4864:41::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDOtC-0001GK-4P
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:16:39 -0400
Received: by mail-yx2-x2b.google.com with SMTP id
 00721157ae682-8ac8e048735so4923027b3.3
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 09:16:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791130597; cv=none;
 d=google.com; s=arc-20260327;
 b=a9tfevrZICkK+tV49c5zDESBDEmzDCC/AX3NfFt8j/s+JgG7D1QxcOkUP08g44gtGv
 5QZa2W1ceDyS8myXvi3/K1zEoHgQoykdbbL1yYnnoNOOzTSjm27SuC9xTODC8Upqm3ac
 OV9E42iQ/0VPHvoWORbcWDKB4G6pj0vJ0k8NN5J7oBBmIa/io4ECdxsotCBNp1r9xijR
 2wDRd94PiT3hQ8qIeXRG6VL3nuGGrRg8LnbVzVsTkSwRLfQsTWxgB8QUzTwXCy8KCISm
 asutFeNxZCzA4pnNKDLnhfjlz3y5KyBEWlfaKuAA3T/y0i7iH8I0G+qD4U4EerB+dpdn
 V9RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=7pTRaYFCGoLLVjBYPjkax3oP+NOXk5DiyxUnr3yvE6Y=;
 fh=uI1j6OqhZXgLrJ/R+TO2FCrxLZB15zIBO/4UT0hV22A=;
 b=LXGEBLnpJiNHnCtse8HImDzTwZW/MT/f+Y6Xp3smcliDlc/m0IToffdxLcw5yR20p8
 0MmiBeVHKNQHQZHpX7F0G1NMM5uoXM/1Fzk4ncCKEnLbrF8BPFqf+IEzMug/rM5AOH3Z
 vuZdsM2XJVUjhwvKIbzwM9EtmYfIaEpQMxjKLgEheQSi+P+7xECB60DwPZXsgFI8Zmbq
 NpVNhnOKC0cZFdaJKnRqB7IRA2o4KDMzSEsIsmaaubvDizYHvzK2bhzX1L3O1LIv4qTm
 G1sUXAgLfClyMecIwKDeatbPw4YyN2ciJwAk9TcRr4QBaN6NsR1Z9ARfnr6FaEEp7cyy
 wsFQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791130597; x=1791735397; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=7pTRaYFCGoLLVjBYPjkax3oP+NOXk5DiyxUnr3yvE6Y=;
 b=Tu3Yd5NNAmIf1bXk29y6AUBrFQA3qqhQYfjWzulmnhnroVo9/RzkHwAp9K/ASugQIc
 TByqDlxe30svKlnjKQHd0U732wB0od+ntM6dhTu4Tl/svSs1u+p56BkeeAaPHjE4KJrf
 Q7rGgaclTa61v2+5lwJ3+/B7e+sTHuhIIp6lus4Y45QSoJYTaYYVRqyBujPkTrL1UtzL
 HtQVpko5+cFGMYEyJ0sk4cCCGesCMsmwOQzpMPHHWSahILn+qMtmq11hq+bzaosYibIw
 pgq+6+cxQ4mDO3xDmZdPKRzLGtXpL7BbbJJ8/3wNQQSK1vZU1KKF7M2Ypn1h+t+wnJKp
 R5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791130597; x=1791735397;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=7pTRaYFCGoLLVjBYPjkax3oP+NOXk5DiyxUnr3yvE6Y=;
 b=iF8vx9haSVEghddebLL7M/CfUjerVllY/iGQoIL/3V03X7py8VG3t78Dv7aOqd7eVf
 /9Aq+eWREV7muCFoxWZ0pH3DsqwDD5FodE1BwooMUwY7QjLMvttBN6tnFIsvUPZPIOuM
 fe7GCu6RCJipz2qrUM1sHd4Xegp2RhBoye9dAWno9C4GOOjVkZNEFLgzdTKt4rxhAtOf
 40NuLjqIoFSQ+yCYJqw3+bOKCljK2JkHkmRP9dvRs77iG0x/KayuNtG97QIedr6+q0wr
 RgToL8+DT3XVdCwCog9dDlP7GgiZ/5wvYZOhdoyLpgkh3G/Hl4Hd8fCL5jCvwmaLcGx+
 P6SA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzREh/igKpgcVXsXFhyStwHegtDSkPyNO4Vt9k233UBFORK1iZkZOu3SkhWM0QNYioI44+UqVAUcA==@nongnu.org
X-Gm-Message-State: AFq9FYIZJoIVWRjFRMh01axR1GNmSwYMfWX81yll6V7m9Mf4nJ1KNlzJ
 i4x+RSjlmCyEv2CmwY31wMnxd/wQho7lr+nFmciU8DvQMMh+o+XECp+RwCqORPWyoes8K5NMbq+
 0zg8XpgwQeoDHqgTJUGpJ4hDY/Ggx8JF3IjmK
X-Gm-Gg: AYBFou056RYOHQqVkisnDUmf5CLDhze7DQqr7aS6y8PvGyniLrq7kpDC2vS8mwXNgwy
 sYF+kpQYLwrrZxb0vPdkkkyL2humYHI4v4GuF2QzEMMDlpG0LLlyIvyQ9CKCL48vlIDgHoJF1nO
 1YZvBLMm+OROP04ZfBrUZIeuIGkVNlWSAlL6TAoeO9rojWT3EV3LBQAr6/ndI3nduABNA9ctXPq
 svw/o6sgaDWBBMMOGKMFuMv1bzCfnYrhWUav2h1Z/cq02W10yyMqO1LwBIF/kI7QneOmtoTwoT4
 SkuvueqzJW28N0kkPmsUKssmeCaveYX203o1wMafU8bFu5uBcBc4Uu1AVnNsf+WTjeurEkLFSNE
 SI1CoZ+VTiVcstzdfDNMoPU1ob94=
X-Received: by 2002:a05:690c:c4f1:b0:8a1:eaa2:36d7 with SMTP id
 00721157ae682-8ae392af4aamr28246977b3.18.1791130597006; Sun, 04 Oct 2026
 09:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <20261004122647.3913-1-shentey@gmail.com>
 <20261004122647.3913-16-shentey@gmail.com>
In-Reply-To: <20261004122647.3913-16-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Oct 2026 00:16:23 +0800
X-Gm-Features: AclHuK8G93NgDcIqaZBrUCs4Wbt_SNeLVwmkNqXxsLrT1l5Iv6GhyteW0kGpn1Y
Message-ID: <CAEUhbmX7Fz2GQAAwK1buoiyw6dRyqwNqL1S7m5KWZpxROhTsXg@mail.gmail.com>
Subject: Re: [PATCH v2 15/30] hw/arm/fsl-imx7: Derive from TYPE_SYS_BUS_DEVICE
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
Received-SPF: pass client-ip=2607:f8b0:4864:41::2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx2-x2b.google.com
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

On Sun, Oct 4, 2026 at 8:33=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:
>
> Deriving from TYPE_SYS_BUS_DEVICE fixes the SoC object to be reset upon
> machine reset.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  include/hw/arm/fsl-imx7.h | 5 ++---
>  hw/arm/fsl-imx7.c         | 5 +----
>  hw/arm/mcimx7d-sabre.c    | 2 +-
>  3 files changed, 4 insertions(+), 8 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

