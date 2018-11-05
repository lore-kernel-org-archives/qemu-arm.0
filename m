Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2829188wro;
        Mon, 5 Nov 2018 09:06:47 -0800 (PST)
X-Google-Smtp-Source: AJdET5dv20Zzi2AootlH+03Z+FRibXL390bXq2dPzl5dcw6NLw42GKuuOao55BSpPYhBNfiIYKrU
X-Received: by 2002:a37:a84b:: with SMTP id r72mr22228425qke.2.1541437606937;
        Mon, 05 Nov 2018 09:06:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541437606; cv=none;
        d=google.com; s=arc-20160816;
        b=Dituo6q9G+ZPg0fKeqC3hTqEVwaljYjKHZm+Ga61fIzwSESuKlpX46p+2ACgFrJ2lF
         JWPu/iNXOeGtLrwxKdlC/LbFSv3Ho2Cb0WpYWDoueD7Fbr1bplBHjHGpukw2Ms/6pLON
         wUxlUop4pUzHbCdXBhEU7fh+7OcP7EsuS3KWy2/NRLLcBfO9t5AFyTrFb0NDKdY5Ne6s
         fPOTg4/OJ1ghPxL8YJxNE3UqtT6s/gRzhNd/OaIkpzzLTLPrT/HME7J8wWQss6XTqhBe
         5ZXgy8jBr1GbO3LH/HhNqCtcL6lxq/xkWVZOJnVLHgmh0DyPPB5O0CKoBuJD0EUOvoXO
         43CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=lTgmKBXODBhznGpHhOc5HkFgk4PmjYiHCeFAWeRXYP8=;
        b=pIsAU4ziL3yPYmXXUY3N7MFIJ0kABGl87S+pH0viZ0lNgVtZ669JeSw93QjiizJNBX
         IaEx4Morkv4rqHVoiYu5M44zY1uk1i+Wmf7pObJeqaOSYLZ959Gw8+DBSs0haIqKUr8+
         f7hUuIFrnn0xpdO2tFbt/B5ZbTfA+P3WRWnb1J3YPNv33DVdIGBnl/z/7dMCHVl+9zR5
         +8Fg/m+jnOz5urixl06pjkut3xDEsVFHdTN+8ggtBMqY1OHHWBYZGK5M0VatqTvg/Nrv
         ELGaMElZ1CuEE2M+qMI5FFII4u46Po+o/Besm4MeO15eUF4TZBGeBPrBfdCB2XaE/HCC
         rG5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RoIdDQAo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v18si3492889qtp.194.2018.11.05.09.06.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 09:06:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RoIdDQAo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36350 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJiKs-0007mB-Cc
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 12:06:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56287)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gJi6d-0007IL-Bp
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 11:52:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gJi6Z-0003uR-9c
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 11:52:01 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:32982)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gJi6T-0003t9-N2
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 11:51:55 -0500
Received: by mail-oi1-x241.google.com with SMTP id c25-v6so8091359oiy.0
	for <qemu-arm@nongnu.org>; Mon, 05 Nov 2018 08:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=lTgmKBXODBhznGpHhOc5HkFgk4PmjYiHCeFAWeRXYP8=;
	b=RoIdDQAod3uvHBSqZo4+J2k1vgXi5sUqA83kVvxtymbtZjIFNMLYAEXIpFYeQuP1zI
	susAuXjxp1kd0nslTsgkWH9UxPGK/pZeJesIFXwT98hFmgPvGf3c35H6f+b7plS0ezRs
	vQMy/pwhog3HrGoM6SRabx4dZRwF9CgTWQZ9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=lTgmKBXODBhznGpHhOc5HkFgk4PmjYiHCeFAWeRXYP8=;
	b=gJ1LloDEBLfiaWwWNjKiNfUnVu3XasGBjVR5VLwjHojHBPYaMlHSq8CdByFZe9vc4k
	VM4DB6gSVraQXgyWZ8Kxb6EFA16nY3e8dO8Ley7qzelL6QRL6SMjrHLPQuYO2583R/9A
	Cfji3+1hXJ1QKxJSDGEeghnfndUSWm6Nf7XcnjgHFvf6EALOzgGY6NbhobbXL6ej+JK1
	BlR6H7traQEkcTXv4QH7UOgQrMQCMgJlGeEDT1t17x9q8/pgSi8Y9o0wepX4P0EqmCNI
	sQtUOebEM7LfKSTH2PpS9cf4iDLbrDeCjn6WRJ/F9SPyEpwmqyKBj+p6MJy6ji9PoKtr
	JFVg==
X-Gm-Message-State: AGRZ1gLrtWS0tGM6mwM0SByNKnl1jJfN6zVs/4c87zf1BQRvga0EUgra
	pqdLmz2OffKfCRp0atLBD1YEBLm9cL3ZDAgxievFRg==
X-Received: by 2002:aca:ed51:: with SMTP id
	l78-v6mr12561576oih.112.1541436711941; 
	Mon, 05 Nov 2018 08:51:51 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP;
	Mon, 5 Nov 2018 08:51:31 -0800 (PST)
In-Reply-To: <20181102170730.12432-10-contrib@steffen-goertz.de>
References: <20181102170730.12432-1-contrib@steffen-goertz.de>
	<20181102170730.12432-10-contrib@steffen-goertz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Nov 2018 16:51:31 +0000
Message-ID: <CAFEAcA9ZFbS5ixv-Sf2yOgF-r7oK=rW8EmG4983PMUbEPh9D_w@mail.gmail.com>
To: =?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH v4 09/13] arm: Instantiate NRF51 general
 purpose I/O
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
Cc: Jim Mussared <jim@groklearning.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"open list:NRF51" <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cIhjZ1xhYEf+

On 2 November 2018 at 17:07, Steffen G=C3=B6rtz <contrib@steffen-goertz.de>=
 wrote:
> Instantiates GPIO peripheral model
>
> Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  hw/arm/nrf51_soc.c         | 16 ++++++++++++++++
>  include/hw/arm/nrf51_soc.h |  2 ++
>  2 files changed, 18 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
