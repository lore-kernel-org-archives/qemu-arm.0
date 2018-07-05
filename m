Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1755579wrq;
        Thu, 5 Jul 2018 08:48:20 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf0r3Eiw5HzPPsuxv5g5zl80+yaVcEzIqB5Ar/M+izLo/6KQwD0p1R847HwLbxtBSaP6i1B
X-Received: by 2002:aed:24e7:: with SMTP id u36-v6mr5874603qtc.58.1530805700225;
        Thu, 05 Jul 2018 08:48:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530805700; cv=none;
        d=google.com; s=arc-20160816;
        b=NTWgO6DgdxReL8O9xrGkT7i8TB8fLZ+AsPFsEcDN7PtLLgvtwExqnQnwr1pegD5P8K
         2MqhibrFR2zi5ySwgbJjeQSG2/ezG5zWHA6jJS30/JnxU3dapv5H8XWAaAV35i223VVE
         Vv4AMVqx6oSAnbcLDDKVGKWO3q65EEWFltDcMf52bL1mFIMfU8RL/XLRaAtuUfARqvuO
         RT2egJj6K9/NGd/JAtdoJfmlC5ROiSIXXYeX5bHgneWLzHEO8+Ljcgyu0b2+CA/4SndC
         i4Sb5OtCDjsn6unKHNURRyFNbDlidSVc9QANY//Nuf3RjwM5M0YMp8muDUt02fw19yfQ
         21wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ZaFjEP04JUEZ8XU1SkgmUHQW1mtILmfWrNai1Qv1c/Y=;
        b=HZmfUrnew/lFQqXqt/PAJ7TryOZGiIFZvD1/Sr9lw92JpvY26qi7so82rtWNGHixtx
         X8ku8ggyKK0wydrXAcm62ikLcG5aJny/6P9Get1gTy1VR9N4LLcYVdA9J0EPUPC5KxhO
         F12IiefMo4GzBZV39roWYsRyZuK87LWLIgV23dhoF2Xjd/k1wUP8N0u0Cw4biKVJ5EC8
         ZAqSUX2aIH81hxZ0fyN4RCkCZtYx8WK/m7sBl7ygygLVl+lgFKEDHrqPVziVdAj/5/G2
         O14+iTpiEwbZedbBbsIspsn7jITqDOyLIN2lUKo4ArmtFsUZLiK7FNyXF4iSE48L1ZM4
         ohsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HbLGuA79;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j55-v6si3633928qtf.239.2018.07.05.08.48.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Jul 2018 08:48:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HbLGuA79;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53368 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fb6UV-0000hd-PK
	for alex.bennee@linaro.org; Thu, 05 Jul 2018 11:48:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50628)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fb6TF-00006c-UN
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 11:47:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fb6TF-0005D5-8y
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 11:47:01 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:41599)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fb6TF-0005CA-4J
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 11:47:01 -0400
Received: by mail-oi0-x241.google.com with SMTP id k12-v6so17741959oiw.8
	for <qemu-arm@nongnu.org>; Thu, 05 Jul 2018 08:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZaFjEP04JUEZ8XU1SkgmUHQW1mtILmfWrNai1Qv1c/Y=;
	b=HbLGuA79ujL2yKoKdqQAyCCoOYd+Qgy4qqjSzxQ4G6rDape15ESgtcEOD43956jvTH
	u9mQxfInNSpiSdx5H6iNNO219xFaOdCiH9YlRLfxxqw3mioFQH86lV2mSeD0Esc3QZhy
	rYyeLtMzPeGBwIdwYqWdz/pkX6fYfjlmw1iQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZaFjEP04JUEZ8XU1SkgmUHQW1mtILmfWrNai1Qv1c/Y=;
	b=D3CLZlfdFkUbJvK/2EyoPUBtxq4WSjCZu7WB1/v/xD6xJQ5e/04GLTS9Fhh9Y5LlGH
	2m3b3lnqo5bzWNutehATo1Yb8+BMjT5AOq0p7jvA0PTRfNPlI029f51nHR7r5Ds2pcLL
	2/zZlpg1WTaqNN+i8UkxmkZ1ibKk6KlAE7R4sWs1DBzy07hFL4vzMd4KNsQ+LojVwMtq
	JW5CwV63oePo2Xy07St7FospSwiA+0Enn1/m1Oznr4Z19TaHbots8Ekbge0yMBeem4B7
	K4M4+QYtOp9yzd9P/xxb1+J8ZCsHN8d7HLZkzfD7juZ7VIXcn928/PVTYEgx5z4hrX9R
	igFg==
X-Gm-Message-State: APt69E0Zx1LMWIbln1PfvQHYJSkzHMjpQrEhL0JRjLi41jCMbqtcYJdJ
	jejZWQWdUZ75NQdqx6xAkItxEZpa5k2dtc+5B7XRbNy4
X-Received: by 2002:aca:4c14:: with SMTP id
	z20-v6mr6742069oia.164.1530805620469; 
	Thu, 05 Jul 2018 08:47:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:554d:0:0:0:0:0 with HTTP;
	Thu, 5 Jul 2018 08:46:40 -0700 (PDT)
In-Reply-To: <20180630091343.14391-3-stefanha@redhat.com>
References: <20180630091343.14391-1-stefanha@redhat.com>
	<20180630091343.14391-3-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jul 2018 16:46:40 +0100
Message-ID: <CAFEAcA9_nXBF6GWaQhp2K_s8c2dwjBQ+0HME5g_Og5FBcvERGQ@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v2 2/3] hw/arm: add ARMv6M object
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <mail@steffen-goertz.de>,
	Liviu Ionescu <ilg@livius.net>, Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: smI4prujqU10

On 30 June 2018 at 10:13, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> The ARMv6M object will be used by machine types that need ARMv6-M CPUs.
>
> There is no logic beyond what the ARMMProfile base class already
> provides because ARMv6-M is a pretty small microcontroller without many
> bells and whistles.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
