Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp260661njg;
        Tue, 25 Feb 2025 06:44:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUOPpKY6Jdx3CoNG0E54LC5wRTB/VcJ6W2+UUqWyP6y1+J7KWECTyVn1BLEA5Nl+IgJXnaswxU+bSlH5g==@linaro.org
X-Google-Smtp-Source: AGHT+IF+GYl6+GcvM1tFEwevv5LYNLvDRjud6X4UFFkCI17xfYFf9ICK/Cp1EbTmoldVozwz6csM
X-Received: by 2002:a05:620a:269b:b0:7c0:a431:6c5e with SMTP id af79cd13be357-7c0cef1313amr2204392785a.31.1740494659055;
        Tue, 25 Feb 2025 06:44:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740494659; cv=none;
        d=google.com; s=arc-20240605;
        b=QVktb4HNDbnYSb9Ckim8g7c5c4+eBv/AMfqONwPrcOv8Yid4gf2D3uWHnE6WdvEcc4
         HhdsmEC7yTX9tuQz/sSDVbGTO8yVPniu9PMi+NhRqhRHWmBoc8KP8DLS+rR8X+ZD4PXn
         8FVbZVwRrfsfdmhZvqzrUhMY9zmzIUBjXaRmE8FTs/L4gsn3dnfrdArShXA+g/QPgeNe
         gCBviox7Rvb5kSv2DwPPje3Cj6ed638uPlGZa+RMT7UgnjVLGfkMOaoQ1G0dqqyZ9L37
         bPcd5cmN1o2SBkq7cMl4WHh4w/3J9uDfU4CFkwFPrx2e++0HZ+JKkQCFczLmtT0NbroL
         A0uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=HBNy19b/C2sAJP/mSokGEuCO6HlNPkFcNqQI5DINW4c=;
        fh=sgVfRVyc1JW/Jqy/bCy+b1p55JJe+EsxHtApeFhWR7o=;
        b=N+QFIXKQg2rregQlOBOLcD+4HjIgNiyatJbDL7vJ3EjOZh8ij9aG6hXHGnJwW1lzkZ
         NrCuLg6bLbNbsxYts4B3sYrkIBuqW2HXEW+GM+M57UnuiZT3rBS1cOE4kYj9xT8mFHfD
         SL05wDlBFL+FQkOPz1nk0rnilgbp6gi7/dEKXzf9X4XnQ2gRLFx2Tnw1bZa3qMeeVcHq
         9/dzmuUWtt/Jj+ND5CCgxi1fBnZiWl9cUhdVjqaJSIqc1DkfNLBpaTdoHmWDyvaJ04Jd
         n3felAEJ8QVxSUrRNcWNd1fbDT9aRxFKEc/tlzsUNX+U/UPEi4yUk8EN0luf6jUJK3hZ
         s7cQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yu0x1eAM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c23c2e2aa5si175497785a.529.2025.02.25.06.44.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 06:44:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yu0x1eAM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmwA9-0003sE-A4; Tue, 25 Feb 2025 09:44:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tmwA1-0003rj-0F
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 09:43:50 -0500
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tmw9y-0001Av-MK
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 09:43:48 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-6ef9b8b4f13so49719787b3.2
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2025 06:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740494625; x=1741099425; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HBNy19b/C2sAJP/mSokGEuCO6HlNPkFcNqQI5DINW4c=;
 b=yu0x1eAMAg3xp5hEcwOzvArQY+6o4gLOeuOYwSTY3at7adAGk5iTcbvuvnBIHy54GV
 IaNCFCWCF2puWrdlZYmTaRjEEqmJahg+b2UWWxfMpTf9H+YVidvXhD66kFIi67g7pkV2
 MDan1N5BJE+1Aqu/x97jf5gWQuZpHrzZwsturEaOz//v/QQSW1MXXQ0rSaWTT6cozJqa
 WV7GHt7rwAMvsdDSYeIKu7StDAd0fmJue0W55aGUfmoYPRw+BnpL/ZPPE/mCqJsIPc8S
 I06iTA91+KenNYyWUnXJ91m6kkT9RYWuYPZlwGjK96X2VxkD5aWSZR6/C3rVNyeh7HhA
 NSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740494625; x=1741099425;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HBNy19b/C2sAJP/mSokGEuCO6HlNPkFcNqQI5DINW4c=;
 b=cC3doXlklCzL74z164lW+vDBh/y489NbhIJQNmWxW5KcQ4moRLxD6+fh33g+DL6aP3
 qBECF1KG92IwGS/XEU+wVgggNQYjiaV3MAoV1RtfPXbhHtxZueyjumrg7NqQU7OmUTUf
 MYETuhhXOc4iVJ12wyWg9ENX2Mt3oJENSpsJIa6AXIlYeqbXt6Df8m9Jm4g3pRlMZG89
 4F9AEKjB0U87ENT6TlpCjIprIteLWk5OrBWlTldEInMbe2IIFQ4LrtStt+X3F0Ki6Hre
 CNeXgcE88/gkayig0HVeDGee/x3ykiH4CWhcYnnV1+sV4Y7Aqyzx5d08NB2Y+UVO4vrS
 Uehw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXF/KC187NPZrkxAcl/JQtSUvGXQxU4mPaemvSq3Sy5oTsT635unQjnJOHsR2lJe0Z1Jmqi3LnBw==@nongnu.org
X-Gm-Message-State: AOJu0YyW6E3LngH6ftJcEOanexvr2SdDPHJz2LWH2/N7ipS/ME0yekPa
 L7zp4T+b9Fk/HI014g+A1ZZ6CT2zp9jaYpeVnlfnMPODvpLyoLq0gJ7roBMS4lWSCTuEo5Bmdcw
 +8CpVymi+QrE3Sa05bPW+fQVy62HUyfcBCA6dsw==
X-Gm-Gg: ASbGncuzLZrB+KzHLYOhelXxTtwGBdnH/NS1MkJ2VpjOsPhxKJH0mmy37sEGmPknGbr
 2RPz/ZX7kpbkn4aOyAcMPma4kn23pveBC+h/L5zKLVWE6lVeyhZ5nKvxPlDmteaCSa8+PbnAw9M
 hs4zto0Imm
X-Received: by 2002:a05:690c:6c04:b0:6ef:4fba:8153 with SMTP id
 00721157ae682-6fbcc23498dmr149955887b3.10.1740494625275; Tue, 25 Feb 2025
 06:43:45 -0800 (PST)
MIME-Version: 1.0
References: <20250223114708.1780-1-shentey@gmail.com>
In-Reply-To: <20250223114708.1780-1-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2025 14:43:32 +0000
X-Gm-Features: AWEUYZmhBOOPqyuhlExC7SyMb1-fy4JbTYnKLYVcxsVePox3tnXcSJaCGp_CyHo
Message-ID: <CAFEAcA-2KXeCVKrx0VQ1axA+nbTKV2fpy--Mti1Q+yFL5XC5KA@mail.gmail.com>
Subject: Re: [PATCH v2 00/18] Add i.MX 8M Plus EVK machine
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Fabiano Rosas <farosas@suse.de>, Alistair Francis <alistair@alistair23.me>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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
X-TUID: lsyHV53eNNK2

On Sun, 23 Feb 2025 at 11:47, Bernhard Beschow <shentey@gmail.com> wrote:
>
> This series adds a new aarch64 machine to QEMU: i.MX 8M Plus EVK [1]. It =
allows
> for running Linux distributions such as Buildroot
> (freescale_imx8mpevk_defconfig) and Arch Linux [2] via direct kernel boot=
.
> U-Boot does not work yet. I plan to use this machine in CI and I also wan=
t to
> make it available to a bigger audience, so I propose to add it to QEMU. M=
y goal
> would be to have it added for 10.0. For this, a Changelog entry could be =
added
> under https://wiki.qemu.org/ChangeLog/10.0 such as:
>   * New board model "imx8mp-evk": i.MX 8M Plus Evaluation Kit
>
> The series is structured as follows: The first three patches fix some iss=
ues in
> device models reused by the new machine. Patches 4-17 add the machine ste=
p by
> step which includes documentation. The last patch adds an I=C2=B2C RTC wh=
ich I'd like
> to use along with the new machine.
>
> I've based some code on existing one (see "Based on" in file headers) and=
 I'm
> unsure how to handle the licensing and attribution correctly -- advice we=
lcome.

Hi; I've applied most of this series to target-arm.next:
patches 1 to 15 and 17. I've left a comment about what
I think we should do about patch 16 (the bootrom).
Patch 18 (the RTC i2c device) I don't have any objection to,
I just didn't have time to review it now and didn't want to delay
getting the new board model in until I did find that time.
Since the board code doesn't instantiate the i2c device,
the RTC is kind of a separate thing from the board series
anyway.

thanks
-- PMM
