Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FDFCA5FEF
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 15:27:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDO7J-0006Hy-9x; Sun, 04 Oct 2026 11:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDO79-000665-Kz
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 11:27:04 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDO77-000615-HH
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 11:26:58 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-8ab37e44643so6180457b3.0
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 08:26:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791127614; cv=none;
 d=google.com; s=arc-20260327;
 b=cCvdC0crScRJTIf7xrZUz+5jjoTEQ+yvzHo0oZZkvPvO3ldjea7IsPfyXxeikpYzwF
 veiiLVC94zw0P5nG0TFZxwjV8a01qhKpGOUsw6qHT1Id8WQgjdWYlCsRl0HsI1KWSsDb
 y0fSZF9nleoNq418rcijPbxNoVUvKEkX2Rmfd1cP9/tZCDDipdkaf6HcLOcwMZI55iAc
 1KSwIhMl7KdjdWxIID8jCDNifkLMhyn9B4wMljOfy1GY+fvv2muDVU92D4R68LYC73yx
 7Ez+3qSEYUgTi2Ru2pYDK9tunWxQC+lCQAaIkYI0GNYdtGmRKetczesRqBgSVpuevlX0
 BXVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=OYCf/3IiB3r6J5jKmU00e9JY0kvGwGvWihTLOwfnIzI=;
 fh=Ze1NMT7Nq2gKBpLE1uZaUk6MDWZtxVFgy+Ufhx4ewkI=;
 b=ATKfCRJjKLSP3IMOtA/BzJYKaDup+CVKCPjyQQrSO960Ez959zfdYh9VCp2IGVOuPt
 rosa8ywRg3rydrHejDfHahaWGowMPjULhHukyZyxUmeYhISp8eVVK074FGGnMY+1fcKD
 7XR2AckM+bs2jNJgCQ188YQncGV1qi3NTGd/o1S56pje0L37RE9F71SBvOHxVG58C2gB
 Ox+LkMt2baRoHNdsPzeoGyOKnE3BrOIa7ddwjCZYE3aEhpiRJ86v641lijhXI8Dt5RQi
 R3lY/QBuEHjeLrhSb18j44DO04puwsjPbFiIhkgkeu9oSMuRfH7IgH12BF54kmdzfaXr
 usoQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791127614; x=1791732414; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=OYCf/3IiB3r6J5jKmU00e9JY0kvGwGvWihTLOwfnIzI=;
 b=hHx4YbnS9UMsGMELhCRbe6IMDIMIUSkLW1yJJwW7YkifJLnMM/ln0OSoV+Q5R6g6WX
 WzosdsZzKTuqJt+CMvqBO6Ym9qsOuWzgepy0TlYgCowHG2e0E1psG301X+gc4oRlQN/8
 jrKIT4IbxA1H5rIyRzHvTyAaoG/dZTkXSwkb9FaceYZTQPhkJc0hF6WCFhvtLzfZwnf+
 hkD5DFcJ5nq9QKgS2w3vS3LX8L2LnBq/jhZigJp7loi12dcPyXYYioUWuhFkNbB/P8jS
 xb750RXdc4Ie1hkj7pN4MQ6jWdWnS/4cMAR8UhU/jbmWPQmNqDHD0huMCNsO7OQ95Qe/
 X3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791127614; x=1791732414;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=OYCf/3IiB3r6J5jKmU00e9JY0kvGwGvWihTLOwfnIzI=;
 b=Zj7h9saythHcM2IZpwieNvl5ngOahid8cgFB4xBQ2TnHtNO5KeRyi7cocZtBKBp3C/
 o5R06STzEuEGDzQWCqZKlaeTDtlrkbT+pEIfSOLbtKFNUO4SBOVW6N2/cxrtPe5BTQ/i
 OLWIs0gYteJ6V5miqcK+lLD0FvjTRgjhziu83p3ZKSYqTj5AIMZWyD4xsTziAM5gVXaX
 CGnHBl1YKzP/tRX5xd6tRULy1dvHmZNaVxO3bkUy+QLQyp7ZfF2Hp5LIhMS0Q4uI9IIb
 aRlEi4qj7X6gCsYeYoGdfraa8hfOqpXRbQ7XMMF7u4VVGDv/Wak2HiKfhkrRBmBr0kXh
 Msfg==
X-Forwarded-Encrypted: i=1;
 AKwUvByM84GE0/zkXN2ZQaAlfkIOXGe7QPYaXZ+Ppx6Fq9ODAkH1KyzAuKu6fJ3AG/xXnzG5cvTh3uouNw==@nongnu.org
X-Gm-Message-State: AFq9FYKz9gzKwhs2TbTLnFiStuouUvGQcpRKhoxQ33dSYqY8rfPztome
 ZUV+fATmBnsCSoZV+vnjltT+2JhmKxV16qubIX0Kqwnk6uV9l+kzqOMGcp2o9mUd8LKQKr9UZsm
 yrps4dSGP0EEJ2IfCgxUJ1l426GeBIvM=
X-Gm-Gg: AYBFou14Bnnr7EL2hyf3bPZS46emhEU3yzjMafNCyIAYzrachTeSE9MqbRCxvzDcNcw
 IfP0GZKA8zi4gOLQwTgBet/b2cpJQxd27miOdyyBbnQftzkDFTFaZ6x9EzKAdllZdF1yLmU1EeW
 jdcgOPkT/Y6CSWeztNwPSwNitzrjP/hJXyO6C2VTjH0u2Z60l6QLvajQwwnVCNxIqRzQe7d9qhH
 WDDnSvQ09IeVlrehHcmUA+qfh3Oc/fpO1x0uzwYfQPcQWVmEGA6fQc3TSo1dhkGCwiqyDFPNjpZ
 qhzLecJVpFncv4ZhsNMntevb1kqZELsVC6L5kOk6flVXMSKI1P+l+hLb2mE7u8upEEc033Hh4IY
 +w+sanNzss1PQao9F
X-Received: by 2002:a05:690c:f04:b0:8a9:8021:5cc0 with SMTP id
 00721157ae682-8ae951f455emr16778057b3.21.1791127614473; Sun, 04 Oct 2026
 08:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20261004122647.3913-1-shentey@gmail.com>
 <20261004122647.3913-7-shentey@gmail.com>
In-Reply-To: <20261004122647.3913-7-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 4 Oct 2026 23:26:41 +0800
X-Gm-Features: AclHuK9hyi-xQl_dfCb6JkYFBIL0ffw9g2vr7wWM1Qp5GNM04tZBkwxSkG1va3Q
Message-ID: <CAEUhbmX0+nuoRxutdXQvfM02AAMRnazkPv=ZpqA6o9REaUX7wA@mail.gmail.com>
Subject: Re: [PATCH v2 06/30] hw/arm/sabrelite: Have 4 CPUs and 1 GiB of RAM
 by default
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1129.google.com
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
> Having four CPUs and 1 GiB of RAM matches real hardware. Fix the machine
> defaults to make its use more ergonomic and less error-prone. Also
> reflect this in the board documentation.
>
> To reproduce the old default behavior for e.g. migration purposes,
> `-smp 1 -m 128M` needs to be passed on the command line.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  docs/system/arm/sabrelite.rst | 4 ++--
>  hw/arm/sabrelite.c            | 3 +++
>  2 files changed, 5 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

