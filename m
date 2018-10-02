Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4905186wrt;
        Tue, 2 Oct 2018 03:58:08 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63YDrV0Oj6O2UFoDa2FFK/Yhi0IUSaexy94hrjHLa6QkfR+DVK+naOCFPqloeNp2f5fzvmN
X-Received: by 2002:a37:8346:: with SMTP id f67-v6mr11628085qkd.18.1538477888286;
        Tue, 02 Oct 2018 03:58:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538477888; cv=none;
        d=google.com; s=arc-20160816;
        b=t7+wl0DHaGEMG6EyClJWolNdpL766gxEk8Us0voouA4/6ZIzF52eHe3apyZCfRbgXQ
         Mz2VbsvP+HNiajLapX8RxXRcoY+vO6bvdp/aZdDu05SCqvB5m756mEeDCBKp8W2gFyTT
         UE/o7d/rbr1OVtbTEGJPe2MbYXvQAlrQyChjaNSRsiXvmKVEcFuo6Vd19+HN41isGDYF
         UhUMBa0dKTPFiM4achSuFq5zAwWqrJMrkDeHOvaoq3fTxRPJ/C5mRHdcJJLfNzlOSxz6
         ZpWU35HVZX8/G5XQqG8MVilaGz2qE/Cf9ju1gp5oAzwkKnjX9N8mc2H65enVPSWr8dBx
         TCHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=Pr/dQGw9EwG5u5ZOdTEDmRSNMMuBeCvKZpGf2rYr5tE=;
        b=M3gpi+yB7vVerq38vExW3y7k2CYA5okYIOgNOUDWUFQpYM8OI+kZU25qjIyOnu79Hs
         uw6cGRTbaXde2S31QjvkRraQJOYzdU+nqKPVpZfJ0e1lOH5srTCYD/83Jlg3MBYoQsuf
         rOqbAqNqdvc7iVXcwz8NgSbWT2aCVXshx9HRuAn1cW2cKDETwOa1DSX2pW2kF9wrepsz
         U4ls3TTllsOTQ6MfKezZB1v6KjKKFeGCILCyGubXBUDXL3sSneEWGmgkVV39/LNWuo+B
         oYyhc7IYxYf9O8WU9ayRxS8I/ulztFOcGdbpGEZL4bor07AcA9NRRjv/MZG4Xw1umkxP
         UnLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="BnFEp/4H";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 93-v6si3466955qth.50.2018.10.02.03.58.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 03:58:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="BnFEp/4H";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42803 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7INT-0007fy-NU
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 06:58:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g7INE-0006z3-1S
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 06:57:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g7IFk-0002wn-Av
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 06:50:09 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:34678)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g7IFj-0002ul-Od
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 06:50:08 -0400
Received: by mail-ot1-x344.google.com with SMTP id i12-v6so1428522otl.1
	for <qemu-arm@nongnu.org>; Tue, 02 Oct 2018 03:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Pr/dQGw9EwG5u5ZOdTEDmRSNMMuBeCvKZpGf2rYr5tE=;
	b=BnFEp/4HMCgb1Rqp1EsH9BWm09P6yaLR0NdydPZ3UoqPfrP8/U/9EwNO9CUesHl3kG
	ZRfWgeEK/Q9GqRD7jTDkx1eO551fVzYgH5u7cyWAiVL1eofQfNe4PZCpwL+4w26dX8CQ
	5tYBsZOMFaRJ/EQUZrtueU6cw4zSUjww0dDEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Pr/dQGw9EwG5u5ZOdTEDmRSNMMuBeCvKZpGf2rYr5tE=;
	b=FlFHSrGWj+DmUaiO0/ODnBoxYRlV6WR/+6jbXSgkMeTTCabwoTGq1bKAHZqCXE5Ugg
	1DfgGerdX0hePeLBItOgKIfPLxRp5Id40buZMxbtRPN7M+8IqIx8dwG7rwimuA6XF9H1
	qLCDG1ib41053K5AKNWLmkwi+O87P3yh9P8JIpZ8rs7tMzMVHQUs5prwtOykjfYXKJqg
	+rt2uMrqhvT8WTSN1C3hdxEWG873932xIX/s2vwngAbwrnFl7LqRWcNcLa/q0dxKXWYZ
	KXApCAl2j/cQyjhoowzugS8/oz4Q1azAzJseb/E7UkByOAW6XVXSO03RYyR3ckK/hDKl
	gexA==
X-Gm-Message-State: ABuFfog9hjCmA5DyIHJU1WJ8vKzqUt/n8zln3aAkWXrU/WB7HnhhQhsG
	4NvMeJXOGa4mfJDbm0lVX9a9r2bJBU3IilEDNc5Qxg==
X-Received: by 2002:a9d:3cf7:: with SMTP id
	t52-v6mr9306985otf.201.1538477405947; 
	Tue, 02 Oct 2018 03:50:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP;
	Tue, 2 Oct 2018 03:49:45 -0700 (PDT)
In-Reply-To: <20180921161939.822-5-clg@kaod.org>
References: <20180921161939.822-1-clg@kaod.org>
	<20180921161939.822-5-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Oct 2018 11:49:45 +0100
Message-ID: <CAFEAcA_NmJO1OiE51ypZXek6D-_hqtBX+Gi2=kzEBtZ5fzo_Mg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH v2 04/11] hw/arm/aspeed: add a
 'execute-in-place' property to boot directly from CE0
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UgrE+BFZguad

On 21 September 2018 at 17:19, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> The overhead for the OpenBMC firmware images using the a custom U-Boot
> is around 2 seconds, which is fine, but with a U-Boot from mainline,
> it takes an extra 50 seconds or so to reach Linux. A quick survey on
> the number of reads performed on the flash memory region gives the
> following figures :
>
>   OpenBMC U-Boot      922478 (~ 3.5 MBytes)
>   Mainline U-Boot   20569977 (~ 80  MBytes)
>
> QEMU must be trashing the TCG TBs and reloading text very often. Some
> addresses are read more than 250.000 times. Until we find a solution
> to improve boot time, execution from MMIO is not activated by default.
>
> Setting this option also breaks migration compatibility.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
