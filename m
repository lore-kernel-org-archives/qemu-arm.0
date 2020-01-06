Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp23618625lff;
        Mon, 6 Jan 2020 09:18:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqzcM6N3xNoZzmyjOjH1S9jquBysGBnS84QYlPaLCi7JPmfJWwfYj3ESFCaSVjG747Bpvexa
X-Received: by 2002:aa7:c68d:: with SMTP id n13mr110760672edq.193.1578331091171;
        Mon, 06 Jan 2020 09:18:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578331091; cv=none;
        d=google.com; s=arc-20160816;
        b=ZYVbV5QMK/1PRTEnFbMqvsl/kDO/XL5jA+KDbQXwc4lG7Ya/QtMju2nFDFoZ8OPKVs
         ojQGfJFuGscOxXuRJAl9fi6GTe0wHbYrIJ3+0R2nGeufyHhz2OM//4Tqrxpi1w3XDaMU
         mf6yiF22ZPqlBFVU5T6bxyesoZliij3YQsWh1bRarUFzwLF2V0rbf0vVG567iSnX+ZCx
         qHEyaZ+2tA5OmSdPb7tfNPZMaGi7v9cZDMxKQZRyrpn0Gwsy4LEFE59A3blTYPGrsNIm
         VC6FOPs8g55OZ4wfzefPOJdu04EZxL40AknlgZ7fTgRw744ygG6DVnLd48fVMqXkRKgY
         xa6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Edq6LBKbuEUkVplSckBaeEYD1hTN6Nww1y6Fk9AWehs=;
        b=h0f99DCZcXmE3YmPEAU+Jj7Vh0vJH94B/dgxJd//9cjEqTW36uEIvjMUag1jBxkK9W
         7OUqTjiNQL+vj6Lg8m9Bt+hr9h7YFNRjH7yUnL8mOdd2sEVK2UWTg+A6qpz99IRZmPNZ
         THouQ0jTV2ZJROdEbYmFP2w5NxjzP+TOtaMuK+2brUVityLzNxi8cYm32Vs+9T+T2dwU
         mlSbcn1zOzhHlIqg11cVEzwsQ2SQDHvDn5V4ZKxmrtBsdekPGgBsFW99fmCS/s72XwNH
         c2RKdk7xXzTT+znvsYrQx7azrvFD8+6ma4cX5/oRq3q5SWd7fWk43bIzshKOUbwbXfZK
         aHhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RAAZh8L5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9si46054877ejd.276.2020.01.06.09.18.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jan 2020 09:18:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RAAZh8L5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ioW14-0002wk-3v
	for alex.bennee@linaro.org; Mon, 06 Jan 2020 12:18:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50373)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ioVzy-0001wc-Fr
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 12:17:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ioVzx-00015k-EH
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 12:17:02 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:39506)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ioVzx-000156-9i
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 12:17:01 -0500
Received: by mail-ot1-x342.google.com with SMTP id 77so72491170oty.6
 for <qemu-arm@nongnu.org>; Mon, 06 Jan 2020 09:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Edq6LBKbuEUkVplSckBaeEYD1hTN6Nww1y6Fk9AWehs=;
 b=RAAZh8L5Od1ka1ePbvXBRgxvggFYE7qtpxJnGVuMAFhZVER8ZTeBNk95YjhViQiktw
 0ZDzg8Q+QxWKyqBma+/z4QD4XVLHOcVDcu8+/YkOmd6dlMnY2ggXZ8C5stvycl8dboeE
 12AseeCCgmwMqZpFZRvbsgElnvdVR+wqBb/HSpV1MaYYVq/Y88VirhFAUNPdW3o7KRzF
 R2XWDDnanOeX9XQFlLIJoGdlgr6+Yaq0tEND2vUbplKDT/ACmaVN5xdHb68i/jx3Zb6z
 3w/hwmedevxmxJqaCrKEyw6rXd9tpn0S5TxL2o1FbFohgjVGPiSUkGVJ1YMIZf3Oqz4+
 EzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Edq6LBKbuEUkVplSckBaeEYD1hTN6Nww1y6Fk9AWehs=;
 b=rBVHxOLFUDJTZdrcJD7l2tpx3ZH6Gq0rCExLyLQpEqVP3SzM1gbmGEljHUUsgqZz60
 Z/06BaeNf2E1ui46HPo9Cuypj9VaPrEfyfzgot2a2q4kIzb7qrNxUXYttdp4kbkGjqnp
 sHV57Vj/QEridaKpux/kHULWfWhqtLHkQeEZFyNbUehPCiNa7ymzszz6fbhVm/Gi0HKg
 RtzailQtZIJ3eLEFILS5rvNpkj6F8kRMTPPHE9poMxxygBZc+BvUCRhuMPpArhpBGGlg
 WEMvR4gO3eUzA2siGrvbv/xCFYNHg3RUH4WTHz8vCBkd+JyeTGM8qGHZ+tpBlKfEAUCM
 r/xA==
X-Gm-Message-State: APjAAAX2xBb6WEbrNs5bo5DPDcTGhh9PbNSIAJVkt8YCNYaBMqjOEIit
 /5lwOxTCfnn13+UD4iS6aNAfvmacoLuHcqQRzhbWTg==
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr117794451otd.91.1578331020524; 
 Mon, 06 Jan 2020 09:17:00 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576658572.git.alistair@alistair23.me>
 <dad8d8d47f7625913e35e27a1c00f603a6b08f9a.1576658572.git.alistair@alistair23.me>
 <20200106175650.0ddc9bf2@redhat.com>
In-Reply-To: <20200106175650.0ddc9bf2@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jan 2020 17:16:49 +0000
Message-ID: <CAFEAcA_VmuxuCWydF-ryi9dAF9_kGFYM2Co1fvMRosdDzTSXOA@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] hw/arm: Add the Netduino Plus 2
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <alistair23@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cH1MfKG5dLmM

On Mon, 6 Jan 2020 at 16:56, Igor Mammedov <imammedo@redhat.com> wrote:
> I wonder if we should make user provided '-m' a hard error
> for boards that have fixed RAM size. And make '-m' or forthcoming
> "-machine memdev" optin feature for boards that explicitly ask for it?

Maybe. I bet that there are users out there explicitly
specifying the ram size anyway, though...

>
> PS:
> (I suspect that the most boards with fixed RAM size do not really
> care about numa, mempath/prealloc and other features memdev provides)

Yes, almost nothing cares about NUMA and all that stuff,
whether it has a fixed RAM size or not. Ideally that
would be opt-in stuff so the 99% of board models which
aren't x86 PC or arm virt could ignore it :-)

thanks
-- PMM
