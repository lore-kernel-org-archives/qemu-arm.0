Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2827232wro;
        Mon, 5 Nov 2018 09:05:18 -0800 (PST)
X-Google-Smtp-Source: AJdET5eJmxrDrIxqyFVUSHkTXEplegP84+mfGE+rXMeGgaXI7/Bm6fcOIibNtuOR0L6XwnY9MH2X
X-Received: by 2002:a37:b543:: with SMTP id e64-v6mr22345602qkf.80.1541437518881;
        Mon, 05 Nov 2018 09:05:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541437518; cv=none;
        d=google.com; s=arc-20160816;
        b=WgXDJW1EDh/BveHPM/ScTcdyBgAjKjRsKRU0gn85cs92p+SKPQloWk1tmBHzCEH62C
         eOCk2+dAr+ypZmwSoMw4QBGOXY7az1vDXi+a8o9riDanokY/0n96XVGcMjNN3C+x04b8
         uolueXpYJhoej5kFYGORaeNZg8CdFlRvOVBcm7zxDzu/S2LFf7CVsxYApt+2D1zZKGII
         wxYCjgPK94vvBN1x4vdUTFH9fiwZJUrn6mPXqWznxlDaKYvGA2nY3OiBc0/AfGeGtauW
         uIhDewKhyhw8W5fFFYtLf1CXucs3/5cBxqUT0AAR31Vh2yCBTS5QsGh8WXTBbkSiyMsI
         6WfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=tScSvMikgV47z6F4wno0cvEp6s2o7pU51+XXNXL9Zjs=;
        b=CBDtwC0KNP97XkCWYsYHs5XeUCRmkX1guzfmZP72NEg37UZBFLLE0iH5/JF5xG6eTp
         kTjeYS2Nw0Y/mkor6j0EWgwOmV3Mn2M/1Bn55p5Esd/CvGKCHFbz/igKkcq1yQ6MO1mv
         gwkxKpu7Ykd8Qe1A9IdnQyhf3Tv8eJaEvrIsgkPQ6UUvLJ4Q/943/nEfq7PUZEyI8j4r
         XdF4sYuba9xilsfVTpvCS1BJNb6LH55LgdhTrxXMGY2fgpK7hTWuMwOzKgRqBVWklmXn
         l9tGaogquRFAVsbpqoyrMxEDE8S9rADK5kL/Zai4HMvoIiqr84yk249VIMvTQWP5lB64
         zKfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="fGA7Sx/t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y13si7786342qti.151.2018.11.05.09.05.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 09:05:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="fGA7Sx/t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36333 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJiJS-0006ca-9x
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 12:05:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54984)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gJi3K-0004oE-Df
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 11:48:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gJi3E-0005mc-Sz
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 11:48:36 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:37514)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gJi39-0005jA-Uu
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 11:48:28 -0500
Received: by mail-ot1-x343.google.com with SMTP id 40so8370368oth.4
	for <qemu-arm@nongnu.org>; Mon, 05 Nov 2018 08:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=tScSvMikgV47z6F4wno0cvEp6s2o7pU51+XXNXL9Zjs=;
	b=fGA7Sx/tyJFWsV+/aXZWn6I9tZffme4ZRwKhANKau/3AnLEMUiakFg77IZwT7e1ba1
	3/wCRYU/BJeHvCTOEfd770Txh66J8JIDmCZG3fxs6L8wfEHfHzMHkGsAYWETukcHhBqD
	pztW+Sb0vshjqiuQjSkOgMZuPy892AkleCt+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=tScSvMikgV47z6F4wno0cvEp6s2o7pU51+XXNXL9Zjs=;
	b=mhlgMDS+/n+h26ejnjtSssVHuFRCNsFhNsCHzCrTkvP6OFtwEXrWqG1Jfaxnz5HQCY
	UlpOLZCaC1ZXUIEEhpDLttzJ+FOp7AIrsjFMQ3KJ1JxZfdhU+Txfn2qLxN6IA++5ei0J
	2LGdXSnLP8NR5yuBVMq+1KlUw8v+QD3oQOuLAOQYVvBD3/lSNoJxppF4nQdaMNtEygoV
	KB7S9/asOEKSOKSPfTjqurat4UTLc3IepViCf+Tr9fSoCycto22hLAfFBSQd7KQH70RD
	ZWoD4Fjt5p9w8Tb/TyisMilh9R+M8tDG6AAbE9kMBgHLPrJVUwmrbJSKzH9gQqN7UqMp
	8XtA==
X-Gm-Message-State: AGRZ1gJPaXLa+cSbJPejS740qQSoExaaaFbQm6nv/Qhusfediwgr1AFP
	avrifK5GeGppu3VUEH2ap3nw+TIJo4fL5JPao05Jwg==
X-Received: by 2002:a9d:582e:: with SMTP id r46mr9224140oth.238.1541436498123; 
	Mon, 05 Nov 2018 08:48:18 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP;
	Mon, 5 Nov 2018 08:47:57 -0800 (PST)
In-Reply-To: <20181102170730.12432-3-contrib@steffen-goertz.de>
References: <20181102170730.12432-1-contrib@steffen-goertz.de>
	<20181102170730.12432-3-contrib@steffen-goertz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Nov 2018 16:47:57 +0000
Message-ID: <CAFEAcA-2Hn8as=A+1a6=Qxv6u0VRJViDm9J7PXKB609ysxoWug@mail.gmail.com>
To: =?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH v4 02/13] arm: Add header to host common
 definition for nRF51 SOC peripherals
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
X-TUID: soJEIixVwbA8

On 2 November 2018 at 17:07, Steffen G=C3=B6rtz <contrib@steffen-goertz.de>=
 wrote:
> Adds a header that provides definitions that are used
> across nRF51 peripherals
>
> Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
