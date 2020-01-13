Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4015534lff;
        Mon, 13 Jan 2020 03:41:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqzXJb9cLddKENlW3WUqDt/GxNO6Cpr/Qq6ZJzoUEz0XyD8S2TIHJnbQM+AzCP/xGMxnucBh
X-Received: by 2002:a17:906:84d7:: with SMTP id f23mr14465255ejy.106.1578915696966;
        Mon, 13 Jan 2020 03:41:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578915696; cv=none;
        d=google.com; s=arc-20160816;
        b=zMKzTXJMj/xUKZUpHD3CXvb1ksNL2TH7KrD1Xkzj8DcUnnKuFeevoTvAvorOvXgSk7
         uwKdSB4bm22zsXcQ6XTzC3rmMRZoy8HKSIonMc6GvtTsh6FGNY3/qEb5gxVOPiIcL1ll
         NIWPoOJwuNLbc983LV7hr2aoLitk6rdB7EIwUWpoBz6Vq5GURHd+ibcfz7JLL8OEeai9
         PQlxC79v3VcJVHtNuJTo6VbwRhSijRlHUbUBsrVWNLEuwFXoRKktDcP2fdQ6/eV/babS
         1klRvKuOv539piDL7RWQuMIsxYAr3O8wPWKkEnQYFCtE5iWJJ/G7NUlroHNyq6G4djpS
         uUiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jXuAmEqcarzf+a78FkUZCIwn83+tXkGCweIcG3ngEx8=;
        b=BYFYhOTZz/GFZqgu5sK1NT/4bWPFj1QB33E4LdkxF1/hqUJL+Yo54lhs9YUSgDQ9zq
         N5M2rh68OAAXfSZIIrEWaYBIFUBSkkjes/uCryFCGAjpG9utxb4Kh5BKn2Gz+k2Qym8M
         3fCOsRECFtQX0VwluCHaock7wqoXhexjDVjCmeXOex3jrg8JPW1/VUaMkcR/FqKWMHYH
         3KdcBlox2LL/0NlmCfYx7YhWGZM3gVGtO0JQFO/G4HEEE3POB2vTIFSvX73kypdJplLM
         zPSLMCKY7BTv3GNI9afRl7bJ9yvHGTMegXRpAZsQdNfz2CsuhNUk9IpF2O5HT8tn6ibM
         THZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jnl608Qh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y1si6827623edp.59.2020.01.13.03.41.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jan 2020 03:41:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jnl608Qh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iqy6C-0004Rw-0P
	for alex.bennee@linaro.org; Mon, 13 Jan 2020 06:41:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48193)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iqy5x-0004JQ-Sb
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 06:41:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iqy5w-0004cw-IV
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 06:41:21 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:35490)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iqy5w-0004be-By
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 06:41:20 -0500
Received: by mail-oi1-x234.google.com with SMTP id k4so7947261oik.2
 for <qemu-arm@nongnu.org>; Mon, 13 Jan 2020 03:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jXuAmEqcarzf+a78FkUZCIwn83+tXkGCweIcG3ngEx8=;
 b=jnl608Qh+6bv5qSQKmcZSZvX66xxJaHhAaUWItOB0GWDamsBFlbI+mUb2gB3V1jPJ3
 srdIsfmJ5kL70sQJKArKM45nc8Eof9dU/o+WpnaJOkpC3EZooig5u047Jd+a6LutkTYW
 Y0YWri1z0b7sI9OdYYgmvTLmT+F+0ZFYcS532oGMZf7JPv5+a2ArN7Am0Z7rSX1b8hGD
 TE6B6cwK/M6dimmA0nNWAeQm1b9SpLkD7Z006sh7/3/+USDLhGOZRc6LAjstXoMeJj/4
 5o0yMHMRhJvg3t9GhZJcORFQ+mzLEjm0n/NsSySVfUl9IrTpL2tY54IQhRMjDZcfSzML
 gv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jXuAmEqcarzf+a78FkUZCIwn83+tXkGCweIcG3ngEx8=;
 b=a6owcijWKCS6Kl/UO9oqvUfkPpSQFIoHrCpAGpPDF2V3tk7/sl7QJ8qQURjSS6ZTV0
 kkm6/3sWUQZFMF++1H4xTOcC0GGLuDCw2gQgnSy25XDkPtPO50yNrRIuz4/CSscEXyGC
 DQhVOWbxmA6ghHGrF2gHHt4eg3Ex3FdXbAUv8Ztvul6HOHr4gJoE1djWxl70HxxjHYPi
 yoKOlvJmvLadWqybdaQYGGR9BY6A4T0Hia08qwkzVCc6z+pmJnsEgWgs5cqakg1IauIu
 KVyGudA0Ir+GO0vQS/dY1ygfNGeE+dei98M2wZFgB0rYDQFVQ/fOrXete/ym0OLXFi6Y
 NZ6g==
X-Gm-Message-State: APjAAAWfpfDdKZgK8SbeceWEMH5nwTNmgRWHdRW0BSE9Wjvb5IT5s7Ws
 GSpHonzspAW2egmZl6+qEc0ifOTuJWf2GwvEpLUqAQ==
X-Received: by 2002:aca:3d7:: with SMTP id 206mr12514660oid.98.1578915679351; 
 Mon, 13 Jan 2020 03:41:19 -0800 (PST)
MIME-Version: 1.0
References: <20200108160233.991134-1-laurent@vivier.eu>
In-Reply-To: <20200108160233.991134-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Jan 2020 11:41:08 +0000
Message-ID: <CAFEAcA8feV07E7Fwq77EaBRyUao5HYVUNCrkp2mn4OU4rSLvkA@mail.gmail.com>
Subject: Re: [PULL 0/5] Trivial branch patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::234
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
Cc: Qemu-block <qemu-block@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dHzjk6DowAgY

On Wed, 8 Jan 2020 at 16:02, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 035eed4c0d257c905a556fa0f4865a0c077b4e7f:
>
>   Merge remote-tracking branch 'remotes/vivier/tags/q800-for-5.0-pull-request' into staging (2020-01-07 17:08:21 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
>
> for you to fetch changes up to adb464ff671d124010953aad48dd9194cedc6ff6:
>
>   vl: fix memory leak in configure_accelerators (2020-01-08 16:12:39 +0100)
>
> ----------------------------------------------------------------
> Fix some uninitialized variable warnings,
> some memory leak warnings and update MAINTAINERS file.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM
