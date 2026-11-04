Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7108C606A31B
	for <qemu-arm@archiver.kernel.org>; Wed,  4 Nov 2026 15:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KCLjNMnh
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOdHP-0004Pg-5G; Wed, 04 Nov 2026 10:52:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xOdHM-0004Oo-Vs
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 10:52:01 -0500
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xOdHL-0002a1-96
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 10:52:00 -0500
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-8b300713befso8103467b3.1
 for <qemu-arm@nongnu.org>; Wed, 04 Nov 2026 07:51:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793807517; cv=none;
 d=google.com; s=arc-20260327;
 b=SiW7H2NExPyEUxFUPqrPN9Plssk7wE9RX/84/K7GypzYQSaXnxedbbLjir4doFxznd
 z5m0/iII2cfIXXamLhukKohs3aQ9ukiw5zNmMGDYSXCfxTDcV4t9YFDzu1PUAtycD5IB
 stUBfjlMSRs2eeAxldfr4YV6z+aYp7ZLa+n2bkvNngmwi9iOWPJG4nGbjklH5gvxQtLU
 48MXWdxj58d8YYTyEVdMDrV2yiZc+adWxH1BK6aGEbeKYTRFat2/b31DROEOyNMPnEV8
 lWxR72vlt1RYaQWC8u5r22fJZmiYIn2sJO1W/ZFYGk8qa6e2ZZ9BEstDaIbCZeXo8SWE
 5OYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=vwNeySTU0zElIXJJtnjeMJC2Gk06YnJ6rgloBT0IKw8=;
 fh=IBr0NPqIqse9JEq3FIO2JsUZPkSmv4ttLvQgBo6bjWo=;
 b=Pe2d2C15zE2wqYKpvTLliOfQL8NNRWtbY9EEPIm3rwcMoMGCHc88nImToQgnK6/9Gl
 aGeYYkOnkB5WXU7tO7bB2lBG5VtY8FOeP5gK0cq7q3avcypnO/rZhL5MPk8nboT/1gfW
 KAq4ql4x5fryYfN6AevoOM1C9N4kfH6RgN4lIREJKydIN6x1yVZwYBLyfzgNDozBg9Nk
 mYPAXysTJB+hIkdyw4Xn3rPUfprEf0zIrKAFOofCgamssX6jrpKgr/J66fxBf/yD3j3a
 8EebAdrwy1Ghbsn1KksKYLT5ROlKzHxU3cjtjOUjPjJVuOTUxAOu9n2JZZ4Nkg3pcmIz
 GrHA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793807517; x=1794412317; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=vwNeySTU0zElIXJJtnjeMJC2Gk06YnJ6rgloBT0IKw8=;
 b=KCLjNMnhPlrTjcbc58SMzFBMz10JEBgdjmNAx1Mi1A46OR/8g51+mfBAVRggqq8ihq
 TWWOszCGH6rLys4JBsZf8O/rnCqgKlz4NnHd8s+UxYrzjAjk7PGqYW+deqa0vQM9VjO4
 izXx7bwQCMf7p7fwNhdRoQHUprEpQ4ik987gZb8+M4HNnIrZ8DroMYwQiD635AsPMOxO
 q73ibPnJZvinTxo5Gybx+/LmKICEHLiNfNqOsp0Pp/OVRTYKtu3gG23vB4GBUEXpOet3
 FY5AShRaEvmt9z2RVBN52KZ62sSn8zaXT0eYRXfMBkiXTZJDpmxYAJp9QyANddymFDTc
 mB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793807517; x=1794412317;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=vwNeySTU0zElIXJJtnjeMJC2Gk06YnJ6rgloBT0IKw8=;
 b=s+pGRJEb80fpFI19pivnt7IHLtOsegufe7yNkQK11GA6of9R0/lQxEPcVBKIhHYZH6
 A+B9pdw1v9nElgDGz8p/Dgpf3fckW4Z5msnJe12NDQ7cd4GAmeYlyBQF0EFpmFxYTTkI
 IoRThdU+9Hd/nFBITlwXY2Qk+hbIvm6wy1lPAwUxDeH5HA4jwFELD2lToIAMGjAjcxDp
 BGtXhHYUALTAF9PTqRXU8H+Siv1MEWTBDpns6J74paCPvf9f/RQ6BeT0OdCabAAX/ZaK
 Aumg6n/7JnGqbdQ6zZI1jp2cOQgYXYcnT2z6awBGxWBAgjii5aHiHBvxGu9YED/Jkvon
 pj8w==
X-Forwarded-Encrypted: i=1;
 AKwUvByKinwYcTNHbUOcmxOv1NSOmbaGVnunvjnxEf+cI7UojOmK3No1KKte6ATTGI+NQdztUK11AmX5PA==@nongnu.org
X-Gm-Message-State: APuU4Z9lzsZbCQeRHJTSjsJxnhhzf5F/nGPv/DQubRZEEfcYWQhK4eeA
 u9uDMgmFC8lkcYzXYdgP3YooO0bKd7swT2NQi0v4B/LEvln4oCea0yGm6oZcS+Wh6bx+nCxc2sW
 qbqx7iVRuIIllPfQNd/UJ5qCi9zPkdnCP/mD3QVo2hQ==
X-Gm-Gg: AYBFou3acxsGlLZsa4hACKgXGZrJrH3YdAkfyWhTeA6lJzLcKs8TofHxc7DDtGENERD
 MbCdGcQgG/r/Dq86WuCiFmTd2+wrRlkKoO9u/6WLWRqYKAUEOOb/J6gA1fy6/y6IEQdndUcOYv2
 KjotgDCpy3/dKM9gtQuPPCG68hIGl+z71cdyb33YY4Lf1Q/kDwwKrrKM3mmt5iV/TjvL2RZxVFX
 n1svnjFZTQWk2ZRQ3xRZUlo4zOXY10h2tO9RUNSB1KSTaYhzxKVsyFmA8u9rAjw8bG4A6QY2v57
 sSDqGgtK24T2fG6YHtYkCZUInEK1SMM9QsSsNQhdX+WS4huKK+S3OHQEXo8UmHZ2GLeS1e9vCp2
 y6P2ZGOTl7I3MgUcF2BXkbUrc2yYfOLirZqCp2PVAPl84BpsJx9DKW8crb1LCelQJS7Gsp54PDe
 BrqqUpRSRT/mEMi5aDugIC
X-Received: by 2002:a05:690c:dd5:b0:8b3:150b:43c3 with SMTP id
 00721157ae682-8b3150b5f37mr10814587b3.18.1793807516567; Wed, 04 Nov 2026
 07:51:56 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104145316.18841-1-philmd@oss.qualcomm.com>
 <20261104145316.18841-3-philmd@oss.qualcomm.com>
In-Reply-To: <20261104145316.18841-3-philmd@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Nov 2026 15:51:45 +0000
X-Gm-Features: AclHuK-HXQ7gxlOi-H697hxVJy7AE-cCpHCt-2vDRAMdL1gi2US7Awxgn5HSH7I
Message-ID: <CAFEAcA-KO6QUAm3Z3a2nzo0dA-ohftNUBnvhwE0yTANgS7mkNg@mail.gmail.com>
Subject: Re: [PATCH 2/5] tests/qtest/npcm7xx: Replace deprecated sprintf()
 with snprintf()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org, 
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 4 Nov 2026 at 14:54, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> Replace sprintf() by safer snprintf() to fill the QOM path and
> property names. This silences when using Apple clang 17.0.0:
>
>   ../tests/qtest/npcm7xx_adc-test.c:140:5: warning: 'sprintf' is deprecat=
ed [-Wdeprecated-declarations]
>   ../tests/qtest/npcm7xx_adc-test.c:322:9: warning: 'sprintf' is deprecat=
ed [-Wdeprecated-declarations]
>   ../tests/qtest/npcm7xx_pwm-test.c:244:5: warning: 'sprintf' is deprecat=
ed [-Wdeprecated-declarations]
>   ../tests/qtest/npcm7xx_pwm-test.c:245:5: warning: 'sprintf' is deprecat=
ed [-Wdeprecated-declarations]
>   ../tests/qtest/npcm7xx_pwm-test.c:255:5: warning: 'sprintf' is deprecat=
ed [-Wdeprecated-declarations]
>   ../tests/qtest/npcm7xx_pwm-test.c:256:5: warning: 'sprintf' is deprecat=
ed [-Wdeprecated-declarations]
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> ---
>  tests/qtest/npcm7xx_adc-test.c | 5 +++--
>  tests/qtest/npcm7xx_pwm-test.c | 8 ++++----
>  2 files changed, 7 insertions(+), 6 deletions(-)

g_strdup_printf() would be the preferred upgrade here for
all of these, I think. That gets rid of the fixed-sized
buffers entirely.

thanks
-- PMM

