Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E661EEA86B
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Feb 2026 22:52:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqfY2-0003Zs-Qe; Thu, 12 Feb 2026 17:52:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vqfY1-0003ZR-Ox
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 17:52:33 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vqfY0-0008EL-7V
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 17:52:33 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4836f363ad2so4264545e9.1
 for <qemu-arm@nongnu.org>; Thu, 12 Feb 2026 14:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770936750; x=1771541550; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DbXcYxrj3BrGFXbpy+bSldzKZuSVVSUmgcL5W0fpdzw=;
 b=HI/HMAf/HxLBMpeKUiOp7dmmOrwTqcVRzDg353ZxcmlcEkZHbLYCLqpVG2jS+tsLeU
 +ooSzzeZatchP4CM3rDZQC8FUZAwFfX2hjxeHyfInH9SsX5Hk9JV0cIifBBMryLr/Asw
 f1qGhKO6t2UmOF0PDemM9gLwqubmuRZO196eY03Hc9Klb47imLDOiCvualpILL3NKk/c
 M7fwduGI1J6KK2bh7uxGHygT4BsLuhZUBtmdCr5egM5PB86v05h3i90qO9lMRwg6ABiR
 PIbCmWXwjXHr9OrK5JHKVx0WML0AqNyJ0Y6lziVSmLoNFloaBIBbcaEsglg/nUyDvTK/
 Fddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770936750; x=1771541550;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DbXcYxrj3BrGFXbpy+bSldzKZuSVVSUmgcL5W0fpdzw=;
 b=ClABorak/9rdpsi6ZTDqy+4WUBtXano10I0o8WZLhkRtX5BMCdBHK2Pgq0kWiZApfZ
 uiLY2udg0T1G6B03ZkFtBtCF47aeJ3h0nZKlLnhuVNROHpU4Q132u9enJvc8W6BFaHfj
 3uUF2wZts1bafzoYq6ymNhvYnsN6pvwT4UsbzYqZhq4OzbsYQY9x3W4yPX20Y/LH9MvH
 B6J8L7AT0HTdAe7UbZ/um9dprSC07KOf+A6LctobYua70wKxQlKMuA+ZXcLOsizjuOU/
 r0VHDUURYlEAeWG7f1IwQqt9Lu2pSIxx6nEpvaRtEi4uGom5BmCZf7bhkgJUPnqplEqr
 R+BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwkGBzHXVeTSeLAF+Wv0yrqA2IVwsSYnBOr9KPoajUwvKRm5KJtjCTUrT3pEADBi+kjBBghyuTmg==@nongnu.org
X-Gm-Message-State: AOJu0Yzl5+ydqeDm9Qfcc+BJEHwgtKdLp8EGyXM45RJbuhV4XHUcONgl
 Ur9/4CseKrUg8TZSsJciUf3nIgAbkJ8SKCaBHhu/awUMEUKY8vVLrAjV
X-Gm-Gg: AZuq6aLqx4Ms3m3HfHr/IuqsOIlTDU0oTF5Q5dTd69WUbcw03V42f6uk4ghera22HnF
 v+Nmr9+KtYSWcmIxr4H/dyAm43bJLkff/cYjw5PsHNHpgHzEcFjl/JwKBkiJeO3Qnh7vCPSpsBP
 4GksulVQtcDdp0r61LDjeclJLNFkIEgU6h+8UQ/tSLvdlg1+dfCE4wNKYmcf6dswUEXJ7e0cGLr
 89vlgackNJCcr1HccdEeR+NVFCjeDj5UQBJyuNE8cBnm2kf3SXGjgQMuu+EgzwS3CS2XzK5qVWV
 I5e9EW91p4mrx860zCjzSFqSGDPQe/2+wlkr+hhIhlByjh3S8JOhD+dJckF5Vku/4rQilFaJZqS
 fjCRoIz4UAfvfAsz5jdj5nwKctO22zxRHDocLeK01OIfoTny2YtMkMpsOEoG2NAHke0iM8rVuzv
 CxBf1FCZl2Zh5Z7LceBnXOJ0xwka4WVqzEfctPy/HSBU8/Jmr06y57QA+yaKDNDp8Nhc099A8ju
 2MRcr/tQA+fKYywp8SbrYSTJoDAcZGMQvof+evm36ndrEY=
X-Received: by 2002:a05:600c:8219:b0:480:4b59:932e with SMTP id
 5b1f17b1804b1-48370e235a0mr10827165e9.11.1770936749710; 
 Thu, 12 Feb 2026 14:52:29 -0800 (PST)
Received: from ehlo.thunderbird.net
 (dynamic-2a02-3100-1982-5d00-f009-a6c9-39e7-d8fe.310.pool.telefonica.de.
 [2a02:3100:1982:5d00:f009:a6c9:39e7:d8fe])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d835f6bsm200561535e9.14.2026.02.12.14.52.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 14:52:29 -0800 (PST)
Date: Thu, 12 Feb 2026 22:52:26 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org, Mohamed Mediouni <mohamed@unpredictable.fr>
CC: Phil Dennis-Jordan <phil@philjordan.eu>, Wei Liu <wei.liu@kernel.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Pedro Barbuda <pbarbuda@microsoft.com>, 
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 Magnus Kulke <magnus.kulke@linux.microsoft.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/7] whpx: x86 updates (2026-02)
In-Reply-To: <20260211055356.44664-1-mohamed@unpredictable.fr>
References: <20260211055356.44664-1-mohamed@unpredictable.fr>
Message-ID: <90285696-0769-4934-9861-886179CC74D6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x331.google.com
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



Am 11=2E Februar 2026 05:53:45 UTC schrieb Mohamed Mediouni <mohamed@unpre=
dictable=2Efr>:
>x86_64 WHPX updates:
>
>- fixing debug support, which was broken since around: "gdbstub: move gue=
st debug support check to ops"
>a48e7d9e52f8fe8b47f4c74f3e99d9d677b87fe5
>- switch over from winhvemulation to common x86 VM exit emulation code
>- remove some log lines

Hi Mohamed,

I really like this series because it replaces proprietary code with alread=
y existing open-source one=2E So I gave it a spin=2E Unfortunately I have t=
o report that I noticed some problematic performance regressions when booti=
ng x86_64 Linux with Grub: Before this series it takes ~20 seconds until th=
e first Linux output is visible, and with this series applied it takes a bi=
t more than 2 minutes, i=2Ee=2E about 6 times as slow=2E Also, when using a=
 GUI, mouse button presses easily take a second until reaction which is rat=
her unusable=2E So I think this series needs more work and I'm happy to hel=
p with testing=2E

Best regards,
Bernhard

>
>Mohamed Mediouni (7):
>  whpx: re-enable guest debug support on x86
>  whpx: preparatory changes before switching over from winhvemulation
>  whpx: refactor whpx_destroy_vcpu to arch-specific function
>  whpx: move whpx_get_reg/whpx_set_reg to generic code
>  whpx: x86: switch over from winhvemulation to target/i386/emulate
>  whpx: remove remaining winhvemulation support code
>  whpx: x86: remove messages
>
> accel/whpx/whpx-accel-ops=2Ec     |   8 +
> accel/whpx/whpx-common=2Ec        |  62 ++++---
> include/system/whpx-all=2Eh       |   5 +
> include/system/whpx-common=2Eh    |   6 +-
> include/system/whpx-internal=2Eh  |  16 --
> meson=2Ebuild                     |   3 +-
> target/arm/whpx/whpx-all=2Ec      |  33 +---
> target/i386/cpu=2Eh               |   2 +-
> target/i386/emulate/meson=2Ebuild |   1 +
> target/i386/mshv/meson=2Ebuild    |   4 +
> target/i386/whpx/whpx-all=2Ec     | 308 ++++++++++++++++++++------------
> 11 files changed, 252 insertions(+), 196 deletions(-)
>

