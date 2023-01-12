Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4718677ejc;
        Thu, 12 Jan 2023 03:54:03 -0800 (PST)
X-Google-Smtp-Source: AMrXdXststxDNtFqonaOgddonQNyFOgmUIu2cvDjozm/qynYYiKUYpm3YOqiFwMluNNNMFfgdbri
X-Received: by 2002:ac8:785:0:b0:3a9:81f7:2d7f with SMTP id l5-20020ac80785000000b003a981f72d7fmr97945688qth.11.1673524443638;
        Thu, 12 Jan 2023 03:54:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673524443; cv=none;
        d=google.com; s=arc-20160816;
        b=tBOwPOaFLbhaB0TYcuXlyntj6OMvFM8miRlEBUOn6TPPeqIl9zEzuhqKjzZKsxbtLr
         kg29MNVLwHxIfv45LBfPgmLDTBIg8QcYbn3ucYo0OmO/rBaOeb0vvfgJor59SjmTsAs6
         5r/SxUjkVrm9eVz4c1LVqNeCRhQKLO5hz9QTwlOi3Hwktn1yY9hko9aXB7YAEk/2yu1k
         ZPELmAfI7BjZArT36hZLbzDQ4reEkm+B3wzivCm9vXohjmIIz3aYiOPeanONOLR3rJFl
         AYAyf8A0eepza9eAqvxhWCdom72PqTv4QAlcSeMScFskfBpoj9UpWTfjrv7eleyHgPSy
         QTdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=TuBT1UmMzhIkr9f6z4IKhG/o2krvfANwL+uknNUri6w=;
        b=dVZ5dJtw8GGMGRewWzsVnmpxl35B+spew7+3N7IBPK20sezn96V+kpHljCMfMywNza
         Mjk7eG89gyeJw3e/s+M6xFxtqM52Y3xYNSd5NVesjp78k0oFKyrvmeXWCa5ShUOvk6+g
         qHcHQg8iRYUDIc9NbvT3QspFjHeVvvep7h1pALQ3r4iE4XShdW/R2mlepTtZkolRqOyC
         yOfRHtOrzLAWNse7eFhADk3uzCTUwwkkaS9qkmPATbT+kvsl6M08rbG+1VequoUKy3TA
         qhXJNiRRm/Q+N+6QQ9CIhJ0jL0yr/6Q6ZdngptSvsSAs8gUBliECtYA74LZXDbq3QBLu
         YhAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NTnE8amX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fg26-20020a05622a581a00b003a7e5da777esi10925168qtb.206.2023.01.12.03.54.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jan 2023 03:54:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NTnE8amX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pFw9F-0002uV-Cc; Thu, 12 Jan 2023 06:53:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFw8z-0002hS-KZ
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 06:53:21 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFw8x-00011F-CR
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 06:53:17 -0500
Received: by mail-pf1-x436.google.com with SMTP id 200so7443309pfx.7
 for <qemu-arm@nongnu.org>; Thu, 12 Jan 2023 03:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TuBT1UmMzhIkr9f6z4IKhG/o2krvfANwL+uknNUri6w=;
 b=NTnE8amXHT4X6TaUSVyhQq+DVjisRP2XpubDBxlyJ5ffV8TxpesJCJg11De60Ypy7k
 vXaq4rinBH2SPYQu05xFLKNQtr9bP7kYZSYZaZXtudNVjbn894YMrN152LuThvViLPkQ
 PoK0rXYg+rIhT3CHsCBdAYJNe0ysnxQfVN82yd7nujggS2iBp4WGmjvvYUdSZfz5KQmp
 xVYr6IFAkDI6UKMbpyPRZaIvaOmcf+V8muvG6YAfvAU+V8CwmItwcIVHXK7FtKm8U5UH
 oq8MCJAY4++Pm3/7BnoZ2/lrC0kaIm5Ud2IFO3IcD6hNoTEZMKIKjt+I4Ta4KmWLjfrn
 nkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TuBT1UmMzhIkr9f6z4IKhG/o2krvfANwL+uknNUri6w=;
 b=x7x1s9fwVVU084aML7kt6nYsXtOOqcDpVyOmAB6EMw4qLn24pCW+qY1ZsQBxa2EMiY
 CY885roKjbujBa7Zou7jwwqENDeu+wlayII9DiXJjoxCrz0+nB+416qrgnhVZ9ZRM8hs
 UeFr/cxykVzXywYjzyj5QB0z1x6Kt0l2yQsuaRVJbVshMAehb3kUWecmT56N5lbzTr1f
 nrvBQCA2VfP75MMvIllEGx3BT7s1o2Y2lPPChV9IFOR8Jsl6fJGxUfcFRVtuA4JraX3e
 m1mMZtBMClGxTbnKTJusgtLOx6EGE6HEK8pPPDnZRdvqbQo5pfZgJnLdRCNCVRL/ACoj
 6nNw==
X-Gm-Message-State: AFqh2ko6uzIzQ1AyEDOrm3Dt4XjFG4Zr1SgOaTVYz+R+ibw62bMWH3kC
 lRq4eK6BmToPp8sLoAaUbEx9qk/708DeaDRc+WgkvQ==
X-Received: by 2002:a65:694b:0:b0:477:86c1:640f with SMTP id
 w11-20020a65694b000000b0047786c1640fmr5580687pgq.231.1673524393692; Thu, 12
 Jan 2023 03:53:13 -0800 (PST)
MIME-Version: 1.0
References: <CAE=NcrY02FoRhbAYiw+BQ9q111HcMmGjbpVW0pM8e6P5agusHQ@mail.gmail.com>
In-Reply-To: <CAE=NcrY02FoRhbAYiw+BQ9q111HcMmGjbpVW0pM8e6P5agusHQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jan 2023 11:53:02 +0000
Message-ID: <CAFEAcA9-2dvt15FWFy6yOfZDJoVbkiKBEjgLwzkC5dkzuVd_tw@mail.gmail.com>
Subject: Re: static builds on aarch64 ubuntu 22.04
To: Janne Karhunen <janne.karhunen@gmail.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x436.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: h1z9cSZqEByI

On Thu, 12 Jan 2023 at 11:20, Janne Karhunen <janne.karhunen@gmail.com> wrote:
> Anyone seen this on aarch64 ubuntu 22.04 when doing a static build?
> Broken libc build maybe? Standard -fPIC (and disabled PIE as AFAIK
> those are mutually exclusive) doesn't seem to affect, neither does
> gcc9 -> gcc10 change or even entirely disabled stack protector.


> /usr/lib/gcc/aarch64-linux-gnu/10/../../../aarch64-linux-gnu/libc.a(abort.o):
> in function `abort':
> (.text.unlikely+0x20): relocation truncated to fit:
> R_AARCH64_LD64_GOTPAGE_LO15 against symbol `__stack_chk_guard' defined
> in .data.rel.ro section in
> /usr/lib/gcc/aarch64-linux-gnu/10/../../../aarch64-linux-gnu/libc.a(libc-start.o)
> /usr/bin/ld: (.text.unlikely+0x20): warning: too many GOT entries for
> -fpic, please recompile with -fPIC

Yes, this is a bug with the way your distro has compiled its
static libc.a, which in turn is because the upstream glibc
default was to the wrong thing.

Upstream glibc bug report:
https://sourceware.org/bugzilla/show_bug.cgi?id=29514
Upstream glibc change that fixes this:
https://sourceware.org/git/?p=glibc.git;a=commit;h=51231c469b49fb3837590f40a93f88db9a20bb86

(It's a very small change, if you want to propose it to your
distro as a backport.)

thanks
-- PMM
