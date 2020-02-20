Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp818917lfg;
        Thu, 20 Feb 2020 09:36:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqz+PVJLGYmqG2o/Xd8qnl9vq1mPIJW7Rf3vthcdv1WEV2QW+Erl3wFimWV6a5+ChjoPk7GW
X-Received: by 2002:ac8:1e05:: with SMTP id n5mr27659628qtl.227.1582220182003;
        Thu, 20 Feb 2020 09:36:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582220181; cv=none;
        d=google.com; s=arc-20160816;
        b=V6dN2X0RCp/g8uTkwpJWmQL/Ja1WuQPnCfMCTcjEy3pxtolzRr30nTVDLUgHpgkN25
         Xro2K1/CxooMBVGnCu8CDBjor8NBH/UYh1L+M2kbPAVXZt8sMY5nRdHVKkYiAUyOCKWy
         syP29uqgRQNiOYYKPx16Ap/zO1xnBxOL4rWMZmr6jtUbqQo8mTfUy2zzyrzk2J+RfM+F
         TiFXlE09QnF086rGY97C1Ui0A0j+v8AZeJEvkSkyC2HUS5pUEuENRU5qip64+efe8ZQM
         APMeVC6UbCkO0agnDh+a6Kb3QaSBoSmtiy4FRMxQRFNBj0pRBI2W1kPAbtzbygS/8nTo
         viNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g3Q2fkCcFtALG4YlComMunPy5B22O7Kd3mD1z1ByAOo=;
        b=BuGGQEQVVnRfrfkf2CafPtGQLSZ7yf9HUTXOJjhdvG8XUoqEd0hDUkRtv2eOubbHtf
         8NzjjQRKvevJHcHigggci19r6qewsbLkyle1QSD+u5ScJBXNX0Sh1jWyUt833r89uHG/
         cNFN1LWZ8KafGoFA1sW2kdUgu/xdY4TnE4pbxk3w2Ji5+IPlPB4kSt+eqpf4pthPyoVc
         9t/eqLMOk2HIsB2dGMn+xdDzxqJO5dk/XZZxz2jPZF2GC2ZbzwwMlI8VwmI9TO7PpNU8
         ArHhs+F+iVJkptqlOifsddhW6SWhvil2+lzRPF9EawvsbtlYnA2SAKTGvq20V+x4p935
         mw8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=p17McKuk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b69si89369qkc.241.2020.02.20.09.36.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2020 09:36:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=p17McKuk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j4pkL-0006CF-DY
	for alex.bennee@linaro.org; Thu, 20 Feb 2020 12:36:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41982)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j4pjm-0005ok-5m
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 12:35:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j4pjk-0001Ld-WC
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 12:35:46 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:43493)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j4pjk-0001L8-QQ
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 12:35:44 -0500
Received: by mail-oi1-x234.google.com with SMTP id p125so28336357oif.10
 for <qemu-arm@nongnu.org>; Thu, 20 Feb 2020 09:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g3Q2fkCcFtALG4YlComMunPy5B22O7Kd3mD1z1ByAOo=;
 b=p17McKuk4SBntEB9/h3/rGj0w290mFAxMu1QNUGgm7EngzxPTAGlcWhyq2D/JtluJ/
 SPHce6349p3NTsEA+9oEtlYeuzR6pXqgufeRQ4vcahrlbQcxAOvXQBS0hwbiLTYta4P2
 jvtagr4h4netvD8i16/H4eNUj3Pzi5QHWmfVxFVHIqOY1a+psIzSiNR5Mij1ArxfuVo+
 bDPh78BYwjEn2iWKh6it7dxNm13LDZ7MxwBcKkS4aj8M+HtI3Mf7DdTCWTzWy6KyCZkw
 cw0b1+PlEY8uTOgNnSzxWWvWeO4uW1h/XGSLIpcU4PelDpvLKrxHY/kzPzydDD/vmNp2
 WW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g3Q2fkCcFtALG4YlComMunPy5B22O7Kd3mD1z1ByAOo=;
 b=bMF35VN70pftMedrg8vEMUaUF9I7xUnqNK7GkBYnbUmlUeCEsMlobTkIwTB32YAVD9
 ZN9SUMCsf2nVT7+88j1gQU1LTx50Fp1z95NHyZBDWuz2zHefv8Wii3hcE/cABWwfj9mJ
 VtXgFvSqTDZSPxpyCyRDuzWENbBKANzEg15MvKr+RoHmkWSiRjadtEoaeGI583+VyyzU
 qVgtAUPfTiVnh+ITXFbf5DkkycQD5uYXBrrbGdYl9QsEjALI2oxqcoqEZdDej9IPHbUL
 U/7cBYKvCUqdGeG/LxnSrOI7yQy4TEeaTk0y6xmeuQW1TA0xJbgi9gNbZqgqaELz2m7c
 bXww==
X-Gm-Message-State: APjAAAULNTBI2C0/0QMrpWB/cawOm9RCQ9HnWR2QENuxe3uoGokr83X8
 M3JpAsjHgBW35d+vr8oG2p84f46GF+3kkUEMlx8EiQ==
X-Received: by 2002:a54:4f16:: with SMTP id e22mr2994886oiy.170.1582220143945; 
 Thu, 20 Feb 2020 09:35:43 -0800 (PST)
MIME-Version: 1.0
References: <20200219101612.1033925-1-laurent@vivier.eu>
In-Reply-To: <20200219101612.1033925-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Feb 2020 17:35:33 +0000
Message-ID: <CAFEAcA-gVy=KkOnjo7b4EsaetNKo_CPYA1WFwZYJT1vZVNao9A@mail.gmail.com>
Subject: Re: [PULL 00/17] Trivial branch patches
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
Cc: Fam Zheng <fam@euphon.net>, Jason Wang <jasowang@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Marek Vasut <marex@denx.de>, Qemu-block <qemu-block@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Chris Wulff <crwulff@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VGd0GjNG2NXL

On Wed, 19 Feb 2020 at 10:16, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 6c599282f8ab382fe59f03a6cae755b89561a7b3:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-monitor-2020-02-15-v2' into staging (2020-02-17 13:32:25 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
>
> for you to fetch changes up to d1cb67841ca213802ee789957188ec87e8b7996d:
>
>   hw/xtensa/xtfpga:fix leak of fdevice tree blob (2020-02-19 10:33:38 +0100)
>
> ----------------------------------------------------------------
> Fix memory leak with fdt
> cosmetic change in code and logs
> update mailmap
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM
