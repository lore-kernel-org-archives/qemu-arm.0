Received: by 10.28.173.206 with SMTP id w197csp2556610wme;
        Mon, 8 Jan 2018 06:53:28 -0800 (PST)
X-Google-Smtp-Source: ACJfBos7EsNyEicHCTeBPfoRb0StY5zIYmlgfN48H10+HNlAvrKacH2YIafYs+JP4f1sqayNJQRj
X-Received: by 10.129.91.9 with SMTP id p9mr11521749ywb.465.1515423208476;
        Mon, 08 Jan 2018 06:53:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515423208; cv=none;
        d=google.com; s=arc-20160816;
        b=j4LjMiVinYNy8tB96g+i5i0V1yY2/s57fEoaLRVSci6liGLipW83XvTb3AqPzMKgOA
         9BtSrcWAm1ED9kxGXdEvD2nZbnafeXHfNEv7ZgaAtu+qMuHhaiijbQhiXhxNHitJHd1G
         PIk4OPsguv2J33vS1PX2kReG0fU5TAn4gyURdMTdrIm88W8TMBVg8b1t8xqgJvEhDEa/
         A41OUIrToKFMxhmIx6J0+j/pivFYvLWyDkTcIUhbQz3TlcoKIx3696jcZ2xV1KeJmqnU
         5Hu507IjDLBRgFeDE/1k1ywGLZbDfBRicWE/LYeoOtvz2kZ3PVH8tabdlf/Ka9wMO3N1
         K22A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=7iscxJYnL+Z68cglSXL23/KDGbI2bLkeHKdI7ggBGkA=;
        b=vIz6JXK46KzR5deCe7H868LfvWOIt+HEceVvXPIgGijSaCYdSdVOoxQpScuvPpRBHD
         g7Ptk94ZWug+zkkMcrPd2pFS8gPGRpso6ERgKDa8y2nY26YfKafFJ1elZb419FbB7WRJ
         6JJzCbiZop1xZa7fA28q9uE2PnY3mGAWUrdhuGifOp5MX6mZB6hzMsi4UkNzMq/OQlJx
         ui8TCITFe5vgiZpXLHqp2tYnyKFgJu222bk0Jca7VCWQlwTV3WQ0GM2Z3IOxgbfdPoRR
         eU2inxbeAi0JTh7Jf6qjLHiZdZzvXO9DQsahYwj2sRtViIVaDozkMmM4qKisZOUzeBls
         CIdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ye9ENedB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d202si2498355ywb.516.2018.01.08.06.53.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 06:53:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ye9ENedB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38769 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYYnn-0006MT-Ug
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 09:53:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49541)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYYne-0006M6-FT
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 09:53:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYYnd-0000L8-PN
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 09:53:18 -0500
Received: from mail-ot0-x236.google.com ([2607:f8b0:4003:c0f::236]:37470)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eYYnd-0000Ki-K7
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 09:53:17 -0500
Received: by mail-ot0-x236.google.com with SMTP id p31so9415315ota.4
	for <qemu-arm@nongnu.org>; Mon, 08 Jan 2018 06:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=7iscxJYnL+Z68cglSXL23/KDGbI2bLkeHKdI7ggBGkA=;
	b=Ye9ENedBd8Do8f9Mu19KwHyZDnM05XhKYOT+02CDF/YJeX4dl6DXsO+S3w5oC9H0xW
	CDnF7lqKdtAZ4mL5sw9ZogJESpegqMb5ZozCqVHbW8CG9MX04H3VXgMeYak1KUBzxj62
	Q+HjsPiTOjsc3FliDPoeVGi3WnNeo5frrKpoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=7iscxJYnL+Z68cglSXL23/KDGbI2bLkeHKdI7ggBGkA=;
	b=BYOgXAUbelnt2yViKNaB3TVChIdYCEzsLmjIczvEcZGNzXRvGn9lEI/jYxHN41BTCa
	TcuTqeluBlmeFHo8kank1YxRsERyDoQqaXZYjEMI7C0yt7KpCoz4ztsA0IM7dVQfPOHa
	77pbEQ+h3Krh/U8BAtyJSoqVQwyuvoOgmjZZfgRf1lkYRmTrGGIIVcdQkn9btvYAoO5P
	l9iIyBk0Iu1VmnikbwC/22oDRCCuPqOPwTQjP8PYSbBdO7+CutjWdkGJOKjXmPCRZWh8
	28bJtKCELdtYWWC0UI6Lls1NdDRReRwNaiWmBv29zoknZc7wh4Rt1UyFFtkHY4I8n1eT
	WgFw==
X-Gm-Message-State: AKwxyteWfyzDOmarohzWt6p2hgNco/fggeuTAbH4lwq0OLjvF2tsoJHH
	s4pf2LkCiV5af65woNBE0wkYfjHMEwPvOPTFCBew8A==
X-Received: by 10.157.29.73 with SMTP id m67mr7042456otm.91.1515423196662;
	Mon, 08 Jan 2018 06:53:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Mon, 8 Jan 2018 06:52:56 -0800 (PST)
In-Reply-To: <20180103224208.30291-1-f4bug@amsat.org>
References: <20180103224208.30291-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jan 2018 14:52:56 +0000
Message-ID: <CAFEAcA82rAEcG5RH3LxVTHqKpEVDqL+mnW=NfoW-bQ=_VxoHEQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::236
Subject: Re: [Qemu-arm] [PATCH v2 0/2] pxa2xx_timer: ignore incorrect
 registers access to use U-Boot
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Fam Zheng <famz@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z3L2hK10R6JJ

On 3 January 2018 at 22:42, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> w=
rote:
> since v1:
> - fixed qemu_log_mask() lines indentation (Alistair)
> - added Alistair's R-b
>
> tiny patches that allow to boot a Gumstix Connex board and use U-Boot.

Thanks, applied to target-arm.next. Patch 2 is missing
a #include "qemu/log.h" (hence the patchew warning) -- I'll
just fix that in my tree.

thanks
-- PMM
