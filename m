Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAF7CA5FEF
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 15:53:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDOWk-0003yv-31; Sun, 04 Oct 2026 11:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDOWi-0003yT-Gm
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 11:53:24 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDOWg-0007ug-QQ
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 11:53:23 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-8ab43af5e97so5949167b3.1
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 08:53:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791129201; cv=none;
 d=google.com; s=arc-20260327;
 b=rciTF5gOkrx2g5/distixKDeycLwn8s1vXxKSJ/Dv2KIq/FtJx1om1rLtPGM81HCqf
 uzPxG8kWgdVgDYq1xb5wG8HSqmphwg05A1We23/kSP6xvnU64cQbMOaY64X8FEmEEqvH
 YzhH2hcRCFzoRciTUyF95dBdyAfet0YR6x2i6hkXUWxlU2l690DjQrP74iV9T8cKgH5h
 ac/WyyeixkhEx4cYfvwiXIEUNlzuu5of6X37ReyZOC9aRiIFzeqVoih8EZCiOSlvD+0b
 kgYxMclVZ+LgRBsXaI+OpJ3VqIrLP0iLjjlWAUJ7ldqTE+sta+VH5togNcjMftkaaSfP
 lFGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=FeEbyMHkwmXzDovflUJ+i0Q0NQy/p4VCmcG47ied77o=;
 fh=9gcLbSeni2G78NskGtjLCZTXxxkwidvbRxOXPot8PuE=;
 b=L0nQTuo8+vqkQ5e3j0MDbL/NHLhmBIYIisT+xkrxmn83OBU7K0iYJqTbiGFX8LqlRC
 GLQAjxPBahBG2JqIqya/8dVUVNRfp2QDqR9nWGUMLoV5ZFo7hfrxVLxIReKdlxL8LhAk
 ibz9xpEt9NJDG7CccGejI4qfp5t35mxA4TQAWCzyxVrvPFs8tqpgvjz+UBe+ZPAgW+GF
 q6NShZ4ajufLjcPYyXPwruFCXp2mQPquj6pXEMLZQycPPfA5DHa2ZooRHmpPLRPuC2B0
 S8Qdlc5+JMBNnN9nc2MslIuHQZNHKcv43PFIUwZqQ6JmTz5nTaROiqXBwmrpV7Ac2asw
 xfYg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791129201; x=1791734001; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=FeEbyMHkwmXzDovflUJ+i0Q0NQy/p4VCmcG47ied77o=;
 b=FQHDVXiUg73HUj6+t2PiGX2S+7cUnY82/j0M0MnCKfUpvBR3g4iDso7LiYz2TSnm4C
 GDL0hBm1yknzcnTcBAqO88wlThU34LGZ3THaNspHBw2g29K5rp1/45+zwUhN+Ur5fYjK
 LQx6wqHEL074QSbfl9GPJCd+sXjOr35ruV650hkEyw8CcGoVGuBWwubKbzamcAGAAs7H
 E0d14yb9ky8p4QA/oh2sFfKdFio5iUAGRY/r9su1Xgv69yLlBPYRRgDJgKPuZkiELGo7
 i9f9EizlrN86ghikCX0+5II/NMw+ovhWI71i3EcUiVi/5n1dRR4ht4Z/6BcPFSM0FJHd
 yAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791129201; x=1791734001;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=FeEbyMHkwmXzDovflUJ+i0Q0NQy/p4VCmcG47ied77o=;
 b=Kr7EHFBjOvCydp7ilDtEb86cr0gaEWOjlwBjYQEhDe1JCclPQEYUoYmqZoRfayQZtE
 AqSzsmtCHExEFDav6mszvgxtErjYKo2xKNbAzxI9wPLOkq58qydAC9n+mlMpR2Rz0w7y
 xSBXxtGJJcJY/I6IpLZldgMFVdqRQgcui+orjWlOfI22mZH/AmjV906vZw6upXmuxGX/
 kdoVaYL7jdYpzWrsTn8FRw6E3lErc7N+ZhC/IUYhj1PmVx8Vpog2upNuIV2ppStnTF5l
 uKippCWtcafqaCO8QCfNSGpXlP0qEAZWWG/wrpEDEHWBqgu3OCPpAZah80MQC3I6ntDI
 96bQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxYkx9pVYU4hdS3qRMuA5NPHf/hH/f0kPznN0R0Aa41HBYul2fOZR3N195LHdxRkb7kTAfYau0B0Q==@nongnu.org
X-Gm-Message-State: AFq9FYKqhUKL5pC4BZxN6gVY4cWbLpoiDgNeOZ6QjgOOA7oIpkKilwgp
 EhXIOpId8psOUYjcvBwrhGwKTAsZch25xZrBF4955ir6FLjdZAmomImgQj0DtOE2ucUiAlsoNq3
 T7pExW4nIVa12HEi7IB8Uoa2vJeWhHDE=
X-Gm-Gg: AYBFou0vLFyZXWkAQysLKyrIwHCTzkawdxlKGBw54QvaoWUreonLsBDPNgzW7omDapM
 TvIqPHakA0EvQb9MNUxUItCBnG0EPd/KYDSpXVplHojUyyLxph51i1836Lv69uB4oW93DcX3cgh
 FHl96FRndU+n/SMb+bceXvI0pjmklV55e274Po9nPNODmR/7IP0PhLshRy52pY79fODbaMd5cQ2
 EN3DmwbifKVuRSFcJn8dJIzxQ6hLOYyU2WC3mMz4afgZa6F+wWAtWreNUFd83EcNXxfmHY2g/CG
 yeBLjn61BoY9yao9drFHLS4ILPRzzicuipVdzG754cw8OcnvIr4Eocr9OTC5HorOYCsXI2Vj1A+
 Hj+aqE3gWILEIHwNKfTGvhlrHpA==
X-Received: by 2002:a05:690c:6d84:b0:8ab:3b98:5a30 with SMTP id
 00721157ae682-8acdaf466f2mr36731357b3.33.1791129201582; Sun, 04 Oct 2026
 08:53:21 -0700 (PDT)
MIME-Version: 1.0
References: <20261004122647.3913-1-shentey@gmail.com>
 <20261004122647.3913-10-shentey@gmail.com>
In-Reply-To: <20261004122647.3913-10-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 4 Oct 2026 23:53:08 +0800
X-Gm-Features: AclHuK8Rz-PMMKlpHymm_QudP_fkSO9zoG5lHPFwvuZ7eI-crbglCO8rQClc9dY
Message-ID: <CAEUhbmWdOG6Zf2Qwyr=wdp+X8PepMWP4ZdveR8DCcSb_KE9W_w@mail.gmail.com>
Subject: Re: [PATCH v2 09/30] hw/arm/mcimx7d-sabre: Have 2 CPUs and 2 GiB of
 RAM by default
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sun, Oct 4, 2026 at 8:28=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:
>
> Having two CPUs and 1 GiB of RAM matches real hardware. Fix the machine
> defaults to make its use more ergonomic and less error-prone.
>
> To reproduce the old default behavior for e.g. migration purposes,
> `-smp 1 -m 128M` needs to be passed on the command line.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/arm/mcimx7d-sabre.c | 2 ++
>  1 file changed, 2 insertions(+)
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

