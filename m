Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1345336lfc;
        Mon, 9 Mar 2020 09:44:32 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtTgA/v8Gowqzd2JIHlhjCg05Am9gEMaNAMObTSQ4h6CWe3J24KVs0SDaCqhD/Hy9AKdFbF
X-Received: by 2002:ac8:c4f:: with SMTP id l15mr15373920qti.177.1583772272537;
        Mon, 09 Mar 2020 09:44:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583772272; cv=none;
        d=google.com; s=arc-20160816;
        b=lTFCgCe7TAf7OJzzE1vxWrJ/ZPAhHYW/b9M+IJpjReA2kCuOYG0NgB/ywTFoHnausV
         G2QAWDiSTHU2EBfZ5/jud5dRCGk82cK3LvQhFcdOObkGAaTPiRGWcDLvb43vfDaO9WMr
         N1qjPbOGTyAadlm73A/gwTNVt7BZYT4us1gd9WgX9I2sH595iBPgjvD1FYHqgt1LrhV8
         24QiwVmAxW7X11h2FV2BsycK2VlfQnL5057lgdseOyQFmOeypPwdAIWylVmLjYaCMnqc
         1DcoBWRh1YFNTBSLpNrM7CyOhtdJ3eF/GaUXLONvliUgoDQAet3YQc4EEzNh7F/l68HW
         /GOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vsbxzOYE0aVq29heeEadFUFvp2hO7sl6c9V+gJlGK1U=;
        b=SuUj98Kh2QF+nYHVGtTnqt68FK1i3GKnJJXs/qiC/ewimICYh3/jGrvOGW654MJd10
         7z4LgG9Um6pFn/0nAER5vUPXs+eqOkPyo/EvVkYSndaeYTUtDZyynJyHemxLPRuUMLy9
         UCHv7SotX4gBYA+yIhtGcZcenXhv/GG3a5MpCCtwGZeC17i4NCGvaeAMaYeceajIkNhq
         9kOlgKAlafLjF5qpfrxV1vEpFsfiMRyUxybsYOysb9mlg8Vmxpz188VXAYzVZZKxrjBZ
         4OZCodVl9lD0uV3uZubwKoJw3ginpB0YXat3QlfMv+SlgumsG6gl+kfhtYQ6yWQ7ipuP
         eoRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A2tRITAH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y4si6121223qtn.385.2020.03.09.09.44.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Mar 2020 09:44:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A2tRITAH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBLW3-0004AT-Tg
	for alex.bennee@linaro.org; Mon, 09 Mar 2020 12:44:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52297)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jBLVv-00049S-9n
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 12:44:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jBLVu-0007MG-4X
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 12:44:23 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:44729)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jBLVt-0007Lj-U2
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 12:44:22 -0400
Received: by mail-oi1-x244.google.com with SMTP id d62so10770365oia.11
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2020 09:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vsbxzOYE0aVq29heeEadFUFvp2hO7sl6c9V+gJlGK1U=;
 b=A2tRITAHhIIEJ4IpYm3rHTDk46dcAlRMUAh1jEsr3/QcrxEZbZj1e5sn/6ZIoe4G/C
 XY3DrCvI2YIj+6LJmnT9bSnA408qHbihPrTxanf19ACGXs7I8iwdm8rUBC7ZB4kze54m
 Ifm8n73lUQRXaVv4gpUpBdm5qARMi8XmPle0XGthAIYBGsZQpkIxHxO4RGeMtmZsLcc1
 I0zppwHe+RNe/ZimUcOObMQLkpxUL+kDSM6Zlef7JedrRpkWA9A3B5cKEB0N/OGOFbu0
 zvjwzVntIRaWXIx+iLgQ0h7NooK7RzB5LA7tEIog7tyKluuHDMcvTrilgQ2uojXA7AR8
 1mZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vsbxzOYE0aVq29heeEadFUFvp2hO7sl6c9V+gJlGK1U=;
 b=Dam3uNw0ZoeABgeMkexuBaEh0Mp86QsZ6td/PnNwj1lCWDnq2rGadjR4U20cfYemcY
 6ONFfxJ4O8CssKexvn7jyVIJZncDiaJXF2iToRfoztAboHCs7ZluHzz8fJmIkoCBAzIL
 VyTrF/t4vXvNrSau+x5wTDhXy8dkuU/snGmWQxhnKeGkkjr0k2Hh4ASkBc9PkHjfvqng
 /V0h0afG+YVhJS0XrSDIXhiqXPVKOaS88TXTuzW7xefwr9uogjsTZK5FbNw3BntNzU9w
 28HQswtOmvvq/gxf0TqIK0EC3G44jdouqX9YtnFtx4HZqDtPIgDy7VkFQUiBLKYpjKQu
 F1FQ==
X-Gm-Message-State: ANhLgQ0+s4S1TCntKEcMYSUQ8XB8ghRHrE3aUE3NUjQRxSSJY0MHj0R5
 jj/oWAHPTbqDmHrhoPRnFBmvY3LHk8IKQLCFnY59uA==
X-Received: by 2002:a54:4f16:: with SMTP id e22mr149238oiy.170.1583772260918; 
 Mon, 09 Mar 2020 09:44:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200309150837.3193387-1-laurent@vivier.eu>
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Mar 2020 16:44:08 +0000
Message-ID: <CAFEAcA_ZjyuCb3gZUXe1MN9PkN5D8hD7SLPoX0-sp231hVQV2g@mail.gmail.com>
Subject: Re: [PULL 00/33] Trivial branch patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: Fam Zheng <fam@euphon.net>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Helge Deller <deller@gmx.de>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V54ZPhaOVnni

On Mon, 9 Mar 2020 at 15:09, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 7a5853cec479a448edae0fb2aaf4e2f78c9c774d:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2020-03-09 10:32:53 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
>
> for you to fetch changes up to 916c92503bd5348a33e561db600d8894bde636bb:
>
>   monitor/hmp-cmds: Remove redundant statement in hmp_rocker_of_dpa_groups() (2020-03-09 15:59:31 +0100)
>
> ----------------------------------------------------------------
> - includes cleanup
> - reduce .data footprint
> - fix warnings reported by Clang static code analyzer
> - fix dp8393x part lost in merge
> - update git.orderfile and rules.mak
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM
