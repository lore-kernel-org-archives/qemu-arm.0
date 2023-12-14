Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp2247986ejo;
        Thu, 14 Dec 2023 03:24:03 -0800 (PST)
X-Received: by 2002:a50:951b:0:b0:54c:d896:e433 with SMTP id u27-20020a50951b000000b0054cd896e433mr6259636eda.25.1702553043569;
        Thu, 14 Dec 2023 03:24:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702553043; cv=none;
        d=google.com; s=arc-20160816;
        b=RHVK6NacY0jccL+0PlJ+rHAKIyTM67HRw0cf6o6DmR8/XdUuJJee5Zpz90IjdZLVNg
         eaW4Ll/3nMYjvDZzORyPv3PXsKwDKWmkr+3PV9ooA7cfTbEfNiy6le76zL/H4aDzhrXC
         cYRkvUzhRJOvdauRydb114P8OaVmk7OHr9+03F66hmFYOUtJjRI+ctebld88rQ7k9MRE
         Nmq/+KCPJgxEcAIh4zuXy6/nRWfrdg3vAD3pwo5V4ifI0eOIdHSKBEEtX/Ziu0plV2Uz
         kBTg5G6LLnDd8GNtYq+/VcTUWb9sKwvdapAXNCC6+VYSZ9Ukv9+ibWjNH9noSFbT+z2W
         6PZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s6GSrMHhCyV9l++DIiKx2H1WRv40mBKulk8S9B3/7L4=;
        fh=7PJcrcioSZ5bMjbCnET85bXJp6aktO4FLtYuM5x2vvY=;
        b=rZRWE3j8SuKhi/m23UBq9RMfgGiZUWyMheEexwUUAc9EWR9UWCyEJDfcgwRoOr6k+L
         eiIMRHRrFJ46603UiSqfou53OOnHOjPPcZ6bT8TZCXiTGD4x4dM3g/ZnmQKVyEwjSu4W
         3o5NDIG3GuSgiglOI8tVpMV7cgtDtswelFId5zLgdaa9bL9u0S+rG1LllB7k3t2rKEa2
         ShE78nf6Rd/ll48rjDOrhzq1nVAS/GcFXeGcr9oFsM9a1Qek/TPOi9GVMtfrN74W4uSU
         jzuiN763JQovR5VqHh3LhST7PsxVaD15d0jT3EUCOnBsl+y2ftiTwaixHceP6LrD/t1n
         lnRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oCifHCsF;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 15-20020a508e4f000000b0055223c371cfsor673756edx.12.2023.12.14.03.24.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Dec 2023 03:24:03 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oCifHCsF;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702553043; x=1703157843; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6GSrMHhCyV9l++DIiKx2H1WRv40mBKulk8S9B3/7L4=;
        b=oCifHCsFdJ9o72UZrMp7Mx2mKp66p7vgBbit1wmJ3xTxWLhX8REeuN61JYxXh3Bjl0
         jVof/xqA/meUh1CN8XxrCWEk0hJZXCZYLOMih1w+Hieuo7EWmw+5M6Mn8RFAELXH+lJr
         yZdtCyKJhATgTawGHQ6NHaUdvLFlWyueoX49YHe6u+vsrEOXAvasZM9ZM0QvrkFpA1VE
         pTpWGjF7zqenw9HkvCPFuxwJmzjm7M1O7qbb5opXAA34gnKT3lL8iHb4eQUCkmjOF7jF
         DQMEqC6D5g8la2PdbZDp04R0K4flqi8IbH80pK1Zc1ckxCSbYf9NvcsQ+jjE7rvWnrxh
         gegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702553043; x=1703157843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s6GSrMHhCyV9l++DIiKx2H1WRv40mBKulk8S9B3/7L4=;
        b=BZyFegFFVHzyFz1HQ0gUe0rb0g7gc2QB2iflgfvmHRpku2MdtSaQj1FZmOos12b2De
         PLbQb/n1/oXiW/v/6S/rLkyMG/PAtnfrs0mDurn9hZPjzuEBDlQ+2bVPwKrPz7mvtJaU
         xYhh/P54LU3pBBI5uVU/cN+ycfNF/Eefz1mzcg5RjnHi2sJ29U2bAXDeFHWcQaQm/Nk+
         SRN3tMJi5O5nnehdhQMU9+KvCaQOw4I6rRZFi9VSYI0nXBwdeq9768vXnqhGt/jcwo66
         IDDc9E5/aEcnq70QjGn9MBFgJE6mmxDOeUasHJLJVdyfw41I9dVKnawdCQAqGWLoYM0u
         00gA==
X-Gm-Message-State: AOJu0YwrCm9OqdHq7v90kEI5U/bhm7NY6QwQb9fYfGXg3JRgrHzK7EON
	iE94tSw2xn7vfgBSJnXTLGhG33sxXbbWvVoZN9fR9Fbc
X-Google-Smtp-Source: AGHT+IHF2imRye3WUk1lCA5A9KB4VhaBzCydQgDtKEhvOR38AXKOLiQIfTTxk4aNyloAtY9JpjtzF6ltehCWoMyGC7o=
X-Received: by 2002:a50:d50b:0:b0:552:72cf:1cf6 with SMTP id
 u11-20020a50d50b000000b0055272cf1cf6mr415427edi.27.1702553043096; Thu, 14 Dec
 2023 03:24:03 -0800 (PST)
MIME-Version: 1.0
References: <170198625302.23093.6056065304261752852-0@git.sr.ht> <170198625302.23093.6056065304261752852-2@git.sr.ht>
In-Reply-To: <170198625302.23093.6056065304261752852-2@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Dec 2023 11:23:52 +0000
Message-ID: <CAFEAcA-nLiWq9yZBDx+zGY4JMDE1pZE96v=TwF7V5=cr=3RQ-A@mail.gmail.com>
Subject: Re: [PATCH qemu v2 2/2] hw/arm: Add minimal support for the
 B-L475E-IOT01A board
To: "~inesvarhol" <inesvarhol@proton.me>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alistair@alistair23.me, 
	philmd@linaro.org, alex.bennee@linaro.org, ines.varhol@telecom-paris.fr, 
	arnaud.minier@telecom-paris.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: jWMXvp5SM3Ne

On Thu, 7 Dec 2023 at 21:57, ~inesvarhol <inesvarhol@git.sr.ht> wrote:
>
> From: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
>
> This commit adds a new B-L475E-IOT01A board using the STM32L475VG SoC.
> The implementation is derived from the Netduino Plus 2 machine.
> There are no peripherals implemented yet, only memory regions.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>

Hi; thanks for this patch.

> +++ b/hw/arm/b-l475e-iot01a.c
> @@ -0,0 +1,79 @@
> +/*
> + * B-L475E-IOT01A Discovery Kit machine
> + * (B-L475E-IOT01A IoT Node)
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later

This line says "this is under the GPL"...

> + *
> + * Copyright (c) 2023 Arnaud Minier <arnaud.minier@telecom-paris.fr>
> + * Copyright (c) 2023 Ines Varhol <ines.varhol@telecom-paris.fr>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
> + * of this software and associated documentation files (the "Software"),=
 to deal
> + * in the Software without restriction, including without limitation the=
 rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or =
sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be includ=
ed in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
> + * THE SOFTWARE.

...but this text is not the GPL, it is the MIT license.

> + *
> + * Heavily inspired by the netduinoplus2 by Alistair Francis.
> + * The reference used is the STMicroElectronics UM2153 User manual
> + * Discovery kit for IoT node, multi-channel communication with STM32L4.
> + * https://www.st.com/en/evaluation-tools/b-l475e-iot01a.html#documentat=
ion
> + */
> +

Can you clarify which license you want to use, please? We can't
take code that's confused about what license it's under.

thanks
-- PMM
