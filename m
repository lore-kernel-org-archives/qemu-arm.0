Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4458317lfb;
        Tue, 7 Sep 2021 00:19:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1iopWTiZRbTjjUVjbs0akeImx/rALHQmivbKmvezY4bO+dxUeARL0f1OanqKnmlp4lGlu
X-Received: by 2002:a05:620a:13cc:: with SMTP id g12mr14489523qkl.277.1630999146796;
        Tue, 07 Sep 2021 00:19:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630999146; cv=none;
        d=google.com; s=arc-20160816;
        b=xisIW/6UgAK2f6l93AE/OdC59qDS8GnkqolfIF8MRFVLnz/5gRSzysha8/oZZylmbE
         PaHL9BsFQ1TWArGAczzJDinZjyTwXJTTke/SYaJfOHzQfl3n4CKS97G8oau1HNZpnd+Z
         UjIcKPtIPoEmRQyagXktknVu11As+TNuODI0bu2vARMhF6wbUB9WskpoNYgrBZqRsic7
         qewuQJiKPIHej9ClgEbe96Zw7HrbSJuq4zvAcQyiMbM68jAIxqoY/vev27iqzHV8ldB3
         hT3YqfMXnCkCbIQ+hcCCmH+wU93L03OfIDs/NM5snJORAUgEbWjoAvnClMq6yDLgtNcj
         xNGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=NubsH088qZJb/TWoCTclNzD9Tqkg2lWWg4TQHLadbRI=;
        b=dHVKEOtjhsT4xgCleBcHs2gbgHXFW+VbX47k/FLY6wdHLltzEsTCnIgzl2EoxRbuGb
         ghj2H5bnLJ9v6DfsboBFfCEZUTyiN6whqY4YwQMS+wBXUpNCWwIXL411o0NhyZWzJRIe
         i25LBEqTI6vQbITlTPCf2/N1eDpp62Uxqmwm13OsOdMvf6vbd+bRvLxG1aRg0RVXWqzc
         h20v/5JcBJAccScazMFENNEkbnWZMSKLJdBF/EOd2ZF3f+CPoimiC5fd6vwtJrazgOBY
         v9wmSEhX8D4EQnqSBMZy+dHJWeW6RBo8OnBTTdmholqEkIGDWmLiDcN4/pmyy2HynKvo
         WlPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b="hSpVf93/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t4si5840694qkd.171.2021.09.07.00.19.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Sep 2021 00:19:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b="hSpVf93/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNVNp-0002DG-UV
	for alex.bennee@linaro.org; Tue, 07 Sep 2021 03:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mNVMl-0002Ca-VO; Tue, 07 Sep 2021 03:17:59 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:37728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mNVMi-00004q-S4; Tue, 07 Sep 2021 03:17:59 -0400
Received: by mail-qk1-x72d.google.com with SMTP id w78so9145592qkb.4;
 Tue, 07 Sep 2021 00:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NubsH088qZJb/TWoCTclNzD9Tqkg2lWWg4TQHLadbRI=;
 b=hSpVf93/gXTDsjKeWNHb3fh+uKV68qChJawkyNKft1468HdrPOjI0xB0ilSnOqip1Y
 /vQiIRs44h6yPlHcQnJZ84Lt2dXey3jRcLpQo9h3j8ly2/OFC/FhNzOEpu+GZzPUSL5m
 K5PW0EJxGbkIO+L3vhlc9JWUcPPxBDjbD6eIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NubsH088qZJb/TWoCTclNzD9Tqkg2lWWg4TQHLadbRI=;
 b=GnYVh+caCdJ0LFkC1Qba2JffKK+zEgh2UOlGG4r4u5jM72JpA/GF45OLGvgt7GAn2S
 qR/Ujb0MBWFbopg0gGF2jy+E5w0jWRnZNAyD5UplnxWpU2ra/FdJW07obS7gjZEX5WSN
 mV3lScN0kgYUuxXQbHjX0tJjwz2IFiFepznOp4hI2luKDjuCwllRaJAB73zfIoPFpg9d
 qzL5GsUYrOtbcnK7gQa9mljo+2z+O4AUdnUDy6V2T3i1y4QLA2EDyEpV0VrUhQg6BeR7
 TzugTl1sitPYA++6b4KwYoxaz13CSR1xJLEUMBgee36cItE7x4WRI7GGfAVLogDf7mn5
 pRmg==
X-Gm-Message-State: AOAM532tFMoBEZdZB8sbY/Y55wrophSO4UprNWZWJPlWe3snr6pyHS+g
 38nYKzyWwQEoEd0gW7rqlx3DOeFUxbvAD8+EglA=
X-Received: by 2002:a37:67d7:: with SMTP id
 b206mr14194743qkc.395.1630999074451; 
 Tue, 07 Sep 2021 00:17:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210907065822.1152443-1-clg@kaod.org>
In-Reply-To: <20210907065822.1152443-1-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Sep 2021 07:17:42 +0000
Message-ID: <CACPK8XePp=EKGYC3XiM-tdTB+Pk_JvdeJCPkPd4L_Nt_Ep-6pQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] aspeed/smc: Cleanups and QOMification
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=joel.stan@gmail.com; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lGTle8SFyjz0

Hi C=C3=A9dric,

On Tue, 7 Sept 2021 at 06:58, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> This series adds a simple support for the 2nd watchdog registers which
> were moved under the AST2600 FMC controller to deactivate the
> alternate boot function. Then come cleanups of the AspeedSMC model
> mostly removing a useless AspeedSMCController structure (that's the
> noisy part) and QOMifying the AspeedSMCFlash structure.

I had a read through and it makes sense to me.

Reviewed-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel
