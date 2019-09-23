Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2757869wrp;
        Mon, 23 Sep 2019 07:52:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwir0XmjQHU8JPg/NrOHKD1/koTuym5SvlHEr6Q7LJomkDsaqz/D3Z6CosJFGYx/jr2jPXv
X-Received: by 2002:aa7:c897:: with SMTP id p23mr430820eds.199.1569250379685;
        Mon, 23 Sep 2019 07:52:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569250379; cv=none;
        d=google.com; s=arc-20160816;
        b=rORyBWNkO2uU+6WAq4+iGjYt+hfIKkYSJSr6+jrH+Wefkc92ngsAiUi/0XQ4LcC8sj
         0afxnulP05A7W/qHMYCmIiO19R61wB0LB6enfqA44TQWAhejh1JaDfpWx8R0A3DAxUE0
         LVLb6fkpaZt3e/Le+pjh10X4xcx45ti4fZPP8M1m08mARrhlrdb4LL24O6UWVxmd1V06
         K5e3x4bvd20o+u0N3O9h9cgjH0bIvcwwpBjL0o2NihQvCZb5PYZ2lUtcdqJV4p/KReR0
         YS1nJy0hwdXywvS39l6cliS8FOKcdVMI/bPcRo9krP4ULHyHiVoCeQUuAHwL3VYgLnWP
         ooBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iTbtJjbk8lgdEI0M1s4ncYPkAsxfZSTy4Hjoq28vzsQ=;
        b=LbJCY8DBZweOBqquOtTsDAQob0w8h0VQtyjw110Yfa5ykwYXfWNkBFe9PWqqAHc6ho
         2ex9LO2eopos7/S77HmyvQ4ju/sLi7HOegdxkPfCZCB+0HDFonECozeAi7aREjhgc3fP
         0AKEPZTZcSm7JMAYpHVhn4qC4sMgV656Y0WWx0ZLkl1OCHb74rDy8os0uDmwBMCRgEvf
         EwtGidY7jZyFrUkCbWX9bEg1SancToHakwugtWchW5uSidiUzPZqgGSQUAkW8dacncCS
         cB+qEJ3zaGHHwcMYkmGmesMGL/LUZS64GgD0cbJgcipoW8B5WP0zNkwycWjkPttwSix4
         ivwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xIfcfGNX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q13si5176563eju.46.2019.09.23.07.52.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2019 07:52:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xIfcfGNX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCPhx-0004T6-Vr
	for alex.bennee@linaro.org; Mon, 23 Sep 2019 10:52:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42301)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iCPhd-0004PM-O6
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 10:52:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iCPhc-0002yy-Eh
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 10:52:37 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:33369)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iCPhc-0002xw-7O
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 10:52:36 -0400
Received: by mail-ot1-x344.google.com with SMTP id g25so12385838otl.0
 for <qemu-arm@nongnu.org>; Mon, 23 Sep 2019 07:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iTbtJjbk8lgdEI0M1s4ncYPkAsxfZSTy4Hjoq28vzsQ=;
 b=xIfcfGNXukaILQEp/rh5XPacs37pF1Y4qkYF4QQy6svAPhi/n3RNbpWLaONPBQq4KS
 uxwRU7NWP0WC5oZKBnt6jKBpbGfInE/HXuJ9n47M6Cgs20A0YxNARq+S5f9ALzL++tiH
 dxISrAKKfKqK3TBlxIxKrKI8uwgWv0MHOHULwChIvZ2jNcw9I2ySp16I5z6qz6xu6sIl
 +Ixj0xM8UR2L3djaE/W9ovRLVUEX7IUN5PGS/xRHzXZtjBDw9/48o14OuVrdVcKFlP4R
 txYGSW5Djc0H6/GtidNTCxM+9KAz6Aq7FYOiQ7fdi+uMIxM9wByY0nYtBC07yBLlw/Tp
 GN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iTbtJjbk8lgdEI0M1s4ncYPkAsxfZSTy4Hjoq28vzsQ=;
 b=kmSIw5CvVaZm3sCKjh5Eh1vBiVICqYefsRFWwp0LRF2jzn9z1RJQSRByD7rg/QM7eG
 aHyomRBXv3GDFb0u7S+D+C6nFAxmk9/W9Rt8CqlXMCsfYGtSCxPxI1HDqeNwsfsiFcEg
 2D9fTZXHpo7k8CG9A5gMnE41epQ0/8CDdoagHSTQdg/wli2PPj00byLGBXiJjfzsneSK
 XOpjLJ1ow5L/6dPFzOEj6yNHpmKjOAVs+vEzXIPUad3RaNaSdlHz2QVMj1auN5t37992
 XkCdFNV8cdsb2RiXGJ+maauyA82GU4tvqQ/Ac29VKmzTgIJ2oSmdEeQEDRwbY1KsGaoz
 kvDw==
X-Gm-Message-State: APjAAAXW2FO/w9rpV7EnL6e78slsJDIOAjjbNizpdmDyaHy0j6efPY48
 6SEl0DkFj4y3kJ1/b2bWy+vcDx6UOa1KbiJ6R+nW5A==
X-Received: by 2002:a9d:562:: with SMTP id 89mr194605otw.232.1569250355095;
 Mon, 23 Sep 2019 07:52:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190921150420.30743-1-thuth@redhat.com>
 <20190921150420.30743-4-thuth@redhat.com>
In-Reply-To: <20190921150420.30743-4-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Sep 2019 15:52:24 +0100
Message-ID: <CAFEAcA_6UxMBeyOMM0iT5cnCQEpWXfRO2XMuV9ez_0Su2osXNg@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/arm: Move armv7m_nvic.c to hw/arm/ and always
 enable it for arm builds
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fL7Kh7E9ZPx6

On Sat, 21 Sep 2019 at 16:04, Thomas Huth <thuth@redhat.com> wrote:
>
> qemu-system-arm/-aarch64 currently can't be built without setting the
> switch CONFIG_ARM_V7M=y - which we currently always do in the config file
> default-configs/arm-softmmu.mak. This is because the code in target/arm/
> calls many functions from this armv7m_nvic.c, and thus linking fails
> without this file.
>
> So armv7m_nvic.c should not be under the CONFIG_ARM_V7M switch, but always
> compiled for arm builds. Since we can not simply do this in hw/intc/ (with
> "obj-y += ..." it would get compiled for all other architectures, too),
> let's move the file to hw/arm/ instead and always enable it there.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/arm/Makefile.objs           |  2 ++
>  hw/{intc => arm}/armv7m_nvic.c |  0
>  hw/arm/trace-events            | 17 +++++++++++++++++
>  hw/intc/Makefile.objs          |  1 -
>  hw/intc/trace-events           | 17 -----------------
>  5 files changed, 19 insertions(+), 18 deletions(-)
>  rename hw/{intc => arm}/armv7m_nvic.c (100%)

Please don't move this file. This is an interrupt
controller (with some other functionality jammed into it)
and so it should be in hw/intc. It's true that it's rather
tightly-coupled to the CPU, but the same is true for our
GICv3 model.

thanks
-- PMM
