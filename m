Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp23532625lff;
        Mon, 6 Jan 2020 08:00:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqykjQS6EEnR3o8k7Tzrt4RZKKrOViaqLQBdCcL1YyiHuYmnqGTUiHy2f7sxp92UQYGskoac
X-Received: by 2002:ac8:86b:: with SMTP id x40mr76811418qth.366.1578326421196;
        Mon, 06 Jan 2020 08:00:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578326421; cv=none;
        d=google.com; s=arc-20160816;
        b=qx5ZFhLWC1Fhy5H3pfp79YxtUsJwYBoSr8smMCzZvD+w5/nrZjQ1HiemyvNGXdp39F
         WkyHtrKyUpxJNmjaCvxg2a6z5CcXWgcNRsypT9W8meJn56wrU7kFwr6zE5RqQXgDM9C1
         gNWOBjRpuQliJIVzzZy17eigkdRpJ4rVBNxNkW6yLn3EU82eeWITB1oQovZP6juXyVuX
         mYSptXCD3pVrEBSzFyAZxCjGRKV3aA5wsFf+s/sVc+H6LyGU7V5wSRvvDrFIg9ebEsUk
         7YWN0hIpsbuORXjVcmk7AS40P9z7LaL07NoBPQBsGuNVg5IVF1G0CvFxFW+ARpFezeLQ
         1udw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=bgOK7NoTR1RuGbGG5u/CCCNXHoAk6w4r9z7PP/8VPDk=;
        b=0fBu/edspYLBsL18zhf2MxrWJDbqHzxkMBmyZixcLDRkqzys5CATky3HcQyw1QJeBU
         Lhm+yfmExF9rgq5iCQgQxwF2n/c7i+FEeaoMTqo8s382MCcGxIOckzWQR0UA39VOoBqI
         ENqmwqny2smIlrDVugPtwk2PEb5gQivar3/nl1IzRbgqxfrV4iyRUfaUYmnLtOaOJWfz
         vvAzudFgMgcf8Ccziza3q+kxI0/Zcc85VInCshX3AIcfeKcqo6//G4MNn4tyBNjU9yg3
         rrbGFeH8IhI4LuskZRQWSO0g4fnVOMd6C6SThchXJazYevarJMvmzShtAfDGnsopbYKR
         hdJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eP3JebAv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j6si27665519qtq.27.2020.01.06.08.00.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jan 2020 08:00:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eP3JebAv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ioUnk-0003JO-H2
	for alex.bennee@linaro.org; Mon, 06 Jan 2020 11:00:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54460)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ioUnV-0003DD-D4
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 11:00:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ioUnU-00035F-8I
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 11:00:05 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:38003)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ioUnU-00034i-2T
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 11:00:04 -0500
Received: by mail-ot1-x344.google.com with SMTP id d7so67823620otf.5
 for <qemu-arm@nongnu.org>; Mon, 06 Jan 2020 08:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bgOK7NoTR1RuGbGG5u/CCCNXHoAk6w4r9z7PP/8VPDk=;
 b=eP3JebAvrcjGSTK1xyr1kGI1OhPsdcro7GuTZjWK8bYn3+gYLSQ+qIKhYWvJ6DBdSL
 thLjTUzYRsfCxNuO7I81GVyEoLnPjU3Hb9sNauj4y+6gA3ObJ/n7hxR7EiHUph3BJ3RX
 2ZC0yjpgHbZ+HnU5GvHPcZc4TxyR80gMFm1mwetpquvTjAsgsehXsYmqbYr5NQql4mSM
 M8H6MKC0plXxwDSdpJHKtYzVG99kX4btyFMxnIVKQRkmsuPpJrrNwT5t/3OGCAhbERaF
 hFDe6q0sOKz1MrW7imT0g1udjojaBPCgamRjhe3bflTuXXvMCW4ARfcxfdbR+A3rtFfK
 r1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bgOK7NoTR1RuGbGG5u/CCCNXHoAk6w4r9z7PP/8VPDk=;
 b=pT6iyXZ7sqIItP+Py6HssYyLM6hFCGQGtFvgAI6qPYCwkAryTZkOtgrKpa2sEoEVSJ
 +piBwzMh8ILk833B06czmITW5mUUe6HFw7j1X/3KfafVO1ptc1d9jF+WAPqEUS69SR2d
 lAMSvJ938fn6oHdSdzgCywAtDDrc3n0d0cVoYfNXYKiF3MVTvwkynS6H2vGhZGA8VVrE
 oLJ8Ap9tKjmgo5Zu8Tvy6H7Hgx1NVeKc9AsGwQx0m0w+p29zuXr7qOnsnGwOBJJ/cRzi
 2wlnDud0BvDe64lZEOXmOhEVXEb/uQhcIhc/v9I3pOHW4zNTHHNprZWlzXjQAj8KihSL
 F3aw==
X-Gm-Message-State: APjAAAVoYwCHmeGqUPJ346MLxwO1L7DDtpgVCRNPAj3wXZzGeNRPSilX
 F/SYHq+egb+pa2byLZhop/Dl+2wvPOeUGPLcXTbaKA==
X-Received: by 2002:a05:6830:13d3:: with SMTP id
 e19mr108130484otq.135.1578326403093; 
 Mon, 06 Jan 2020 08:00:03 -0800 (PST)
MIME-Version: 1.0
References: <20191230110953.25496-1-f4bug@amsat.org>
 <20191230110953.25496-4-f4bug@amsat.org>
In-Reply-To: <20191230110953.25496-4-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jan 2020 15:59:51 +0000
Message-ID: <CAFEAcA-UBNVvskK+mSjHGOhfXbkGgi1TPJZLFGzcdOoW=6i22g@mail.gmail.com>
Subject: Re: [PATCH 3/6] hw/arm/allwinner-a10: Move SoC definitions out of
 header
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PE6ywhwyjTfD

On Mon, 30 Dec 2019 at 11:09, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> These definitions are specific to the A10 SoC and don't need
> to be exported to the different Allwinner peripherals.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/arm/allwinner-a10.h | 6 ------
>  hw/arm/allwinner-a10.c         | 6 ++++++
>  2 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
