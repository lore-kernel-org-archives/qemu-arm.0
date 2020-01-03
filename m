Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp19706956lff;
        Thu, 2 Jan 2020 18:43:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqwCTuuotoKAf6UWb+65pgIK/jDO5SkuTqhJ1fKk+ubgojMvfqWcJTYySneuxAKhTWx8pMvl
X-Received: by 2002:a05:6830:128e:: with SMTP id z14mr92691252otp.184.1578019404032;
        Thu, 02 Jan 2020 18:43:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578019404; cv=none;
        d=google.com; s=arc-20160816;
        b=JEe+49YToXhhwjOx6MTRb3YvCgxf8id1ACWuKv9Wol76L/jhr3KOsxzG2F/LxfFM3e
         Py/KrfVj2JxEp0hNpncP5Uaf+9xB+9dAe88HUfhALu1xCXHFHbCGXnVXZYIRhNjjmnSV
         Pk8vDOi1zF72SQNA4BwtEKHly8oYTV+ZWpFNkazNToUjm1H0nOOio46okCsYEVSd3+ob
         4KYUqgxENG741eL53FbMljq1oE3dFcQs1mVOehTPrQoRq2FZHyV5pKDWApPZrl3pPW7N
         rjHS6ov/Qisne36Y0g7i3LHpQznSeDA4Q7nYxrgC5kBEdk6PtUwMO0g6dY8auvaWF4Wg
         1eVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=+7cA0d0Hyi5444bKwVYHxmPS0oGCkXfU/S2Nefqv/E4=;
        b=nbNmgtCiwqG+zTA9U9a3PugfLoXxVJfB0JRDG9QJeHYwIApqSRCvroJRzr4bLwVZyz
         Koc2J2qN5k1wwpfVHDxDhFA+e/UPxerwGOhPBsY+DStdg10lYTeeCsgC63RnyZ+LQAW1
         t/J/Fa0uP68hM2SLsU4Ff6CJ3Urp6Tx2pB92488kICO2hhHr3ZlcXZ+7UmR991YDJU3c
         EaGokO2p2J517fX+snL+CRKCYHSw+ZXpRDacq1aUHfHM154vmvVEx9FqUzD1AxV1Uu23
         e8ouT5X0iJe1hxtJ4C9vBQBDGSys3pyflHP7U99h/HwT89sqXzOesy4T0tQsIOwxoYl4
         wjwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sf2Lzd2h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h17si15994711oih.53.2020.01.02.18.43.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jan 2020 18:43:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sf2Lzd2h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1inCvq-00030w-TP
	for alex.bennee@linaro.org; Thu, 02 Jan 2020 21:43:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53161)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1inCvf-0002wg-Uu
 for qemu-arm@nongnu.org; Thu, 02 Jan 2020 21:43:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1inCve-00055R-Ri
 for qemu-arm@nongnu.org; Thu, 02 Jan 2020 21:43:11 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:34394)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1inCva-0004ve-Ex; Thu, 02 Jan 2020 21:43:06 -0500
Received: by mail-lj1-x242.google.com with SMTP id z22so37753000ljg.1;
 Thu, 02 Jan 2020 18:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+7cA0d0Hyi5444bKwVYHxmPS0oGCkXfU/S2Nefqv/E4=;
 b=sf2Lzd2hOuHlbhMGyxYZNV5Cvzh+3KLU8lTMbdmKHMjHNh0igsRrL4XjCAk4yRP8vf
 s/OjWrR6da7a2LVtU5DeediGnZbXeF4F/Dp76/g8PuMr8i2mtdYPg7S9M+ZZeqxXx30p
 eUi2GAw68sH8XnxlQNcJj5TJ7E1NyzlKLM6xa91OJqT7SYkm84GvPH23zQggZ2daCl0a
 rjrQ+GkiLEecFyt2uN+r94Qft6M0goUgtbv3NLqccuBOLRS4kibs2CdOTPxFJghJ69Xw
 DyrwAnU6vA74NzWNMy9eMT/YARCg2dl7x2Qryev3G/6DA+nfrE7iGijvPqyBDAPm6NKl
 XeyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+7cA0d0Hyi5444bKwVYHxmPS0oGCkXfU/S2Nefqv/E4=;
 b=e3W2egTjOhGsXM1pUhCn5zHC0G8DFn+aDLT8iYgW37ho0kjebaqPIORQYh4n2H/9Qt
 UjVGzpcCqMZ0wCBhItWvSyEOlovucNKb9+Dr3XnOA0TUI3hmWjQK+tYn/WoazkgFaKv9
 4F3NWm6E71Tn88Y0x6oNwn3C3Zxj7IO7cL7Xnf0ID2znRcpRtb7PUvGYrO4BT8NzWGY+
 JEuPJmTQhGEx2F20sBSkreyvvcVB1BRg6FTnxB2WUtsCcsJEpJMmfeqP1cm6bpn8EXQt
 oGFCoDR6DailBtZq8GMlzwat4XsSs95093XKALiTyrK5FI27uQXTIgnZ9SVEvB1wZdFi
 dinA==
X-Gm-Message-State: APjAAAWIpQUv51hk5TuVNyNqdpPVJJsJNRj+xCsD6OJyXwIYNzj4k2zX
 D4dOnvPesJIVaFvjIDOr5M8xF/ptCbn8mIAJiVQ=
X-Received: by 2002:a2e:96c6:: with SMTP id d6mr20605277ljj.4.1578019385388;
 Thu, 02 Jan 2020 18:43:05 -0800 (PST)
MIME-Version: 1.0
References: <20200101112303.20724-1-philmd@redhat.com>
 <20200101112303.20724-5-philmd@redhat.com>
In-Reply-To: <20200101112303.20724-5-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Jan 2020 18:42:38 -0800
Message-ID: <CAKmqyKPGWZh1a6vQk2TF=crN2yK7ZxpAvre55wx_-cuOMLrp9w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] configure: Remove tcg/ from the preprocessor
 include search list
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Riku Voipio <riku.voipio@iki.fi>,
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Stafford Horne <shorne@gmail.com>, Richard Henderson <rth@twiddle.net>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Claudio Fontana <claudio.fontana@huawei.com>,
 Laurent Vivier <laurent@vivier.eu>, Michael Walle <michael@walle.cc>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yOa1ON9RW3ho

On Wed, Jan 1, 2020 at 3:25 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> All tcg includes are relative to the repository root directory,
> we can safely remove the tcg/ directory from the include search
> path list.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  configure | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/configure b/configure
> index 940bf9e87a..74dad08580 100755
> --- a/configure
> +++ b/configure
> @@ -7436,7 +7436,6 @@ elif test "$ARCH" =3D "riscv32" || test "$ARCH" =3D=
 "riscv64" ; then
>  else
>    QEMU_INCLUDES=3D"-iquote \$(SRC_PATH)/tcg/\$(ARCH) $QEMU_INCLUDES"
>  fi
> -QEMU_INCLUDES=3D"-iquote \$(SRC_PATH)/tcg $QEMU_INCLUDES"
>
>  echo "TOOLS=3D$tools" >> $config_host_mak
>  echo "ROMS=3D$roms" >> $config_host_mak
> --
> 2.21.0
>
>
