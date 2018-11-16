Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp584910wrw;
        Fri, 16 Nov 2018 08:27:22 -0800 (PST)
X-Google-Smtp-Source: AJdET5dZ7mUcq53aDApANcz8/L1wV2nrq030mRZ5QCIfnxsciTFV/KJokuArVh7gaiS9HxRORo5Y
X-Received: by 2002:a0c:bc03:: with SMTP id j3mr11109188qvg.223.1542385642625;
        Fri, 16 Nov 2018 08:27:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542385642; cv=none;
        d=google.com; s=arc-20160816;
        b=TBIyklVA+YvxF3TCZw6AdVagAcXHpLggKXSSd1OcPMlFEd2pZzg/q+YmMIcGNqo9an
         MLrFmHm4yJEb/sP/zGuFPVkyJ41rUdGzhG7wbgHUbhwbnxXAsDUdrmS0b+ife7dGapGP
         MiZn5koqMDZ1rjdMyqpFCXOpiAJPx6yCeByi7UFe+qH9nINIkfuF9dZM5Klh6T25A4hV
         yGYTbg2R5FRl2m6w7Sh0a9mjC7XLmjniUuuzwbeWyKZXMy+19pWdGacgHZZlfU6mqhmh
         mxOY18isiFtgMJE3w/+G7c3krv5aPz6w+wVCD8TaSxGgDMbW53iB7ZGLgjJa53CHnZaE
         cfnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=EGciUxHBOW2XlObEC4XcveQlJjNzIL0Hmn+E2Uzn9os=;
        b=TQQ8dPRtm37mVjfBhiAp1BnuZf6N2A67m85/yxWLX8cB0q0N47Oh17QqXlLJ9ZROt+
         VtMPBfPGab61KNDrBnI3dGDz5OGhdX7HdEXs+pI63ZMto/dxiIav8vR4M9zz7GVNedFM
         KDUFewoL8fF2VpNb5kVS0QstHt7fg+AK23ToXfclBPnwekkBX881ZIg3YEyUZtjZqXLJ
         KJX/lVaHf6FkEHgWEG0pVsJ32Xitc43278dL7pMEL/vunKaSCqqldNjFQw3TExdlR8b2
         x9vN8+aIgjLw9oEitWJaJlJArNMyBwDmfi3lF09nekjqtxkgQXsaSqnn99RDzCuguqK1
         5hVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bpiiVTpA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x24si16777812qkh.97.2018.11.16.08.27.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 08:27:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bpiiVTpA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45618 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNgxm-000840-3N
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 11:27:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36297)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNgvw-00073l-TS
	for qemu-devel@nongnu.org; Fri, 16 Nov 2018 11:25:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNgvs-0001fT-Ol
	for qemu-devel@nongnu.org; Fri, 16 Nov 2018 11:25:26 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:43121)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gNgvq-0001ej-RY
	for qemu-devel@nongnu.org; Fri, 16 Nov 2018 11:25:23 -0500
Received: by mail-oi1-x244.google.com with SMTP id u18so1896490oie.10
	for <qemu-devel@nongnu.org>; Fri, 16 Nov 2018 08:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=EGciUxHBOW2XlObEC4XcveQlJjNzIL0Hmn+E2Uzn9os=;
	b=bpiiVTpAOrv6rcxSi2Tg32K77Ck98PxadfXEv2qtFFjPcPzRJPtKCe7kUGA1DEgDXz
	Da8YL8ScYxzE1n9pehME+e4FKN4FcgPr3/KsjnMJnLakrpG31N5ZwJB60D4aRRNtvhyV
	8DEB9ePLUv/9xH5I09rJGpkZJ2MTTvW+5fQl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=EGciUxHBOW2XlObEC4XcveQlJjNzIL0Hmn+E2Uzn9os=;
	b=EQcs/4v3/zYbhCTTE+uAgVfE5hWOcmz+PhItT35iyuB49M9Z+QSW6qK5kTXl+18INZ
	xv2fAPwY3pJsha05pQKnF7Ps9sA4xxWSrU74TdH9eFhWHCS2fXcQ5HiJ0KqRX22nDl+T
	wguCVt8fqEgkesoOt19YunkRbRXhz6G5l9DKqo9XEXGDWzR6lK8JNvecH1QbDS2V/Cro
	amEtqRtN9XXJZmF+hKajG57GrH6vr2XDH/jJJGKNFSIqzC9DIWd3lrBSXeeJZstPpCvf
	mqi4pH+PhXK/qBclBJ8+Ign1w+haVuDHQPNs/QlNPcwe24smm1JXgPPYPiRGRY1JfXns
	vIyg==
X-Gm-Message-State: AGRZ1gImliIUCSt8/4RKHUVTKGa0XtUnqHU/3jOfnLKL5EcbWSKsDWGi
	1vAJQpNrjVD8nz92TFpTaJ8emfubXH3R7lgdab7b/w==
X-Received: by 2002:aca:fd12:: with SMTP id
	b18-v6mr1354727oii.337.1542385522007; 
	Fri, 16 Nov 2018 08:25:22 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Fri, 16 Nov 2018 08:25:01
	-0800 (PST)
In-Reply-To: <20181112214224.31560-7-contrib@steffen-goertz.de>
References: <20181112214224.31560-1-contrib@steffen-goertz.de>
	<20181112214224.31560-7-contrib@steffen-goertz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Nov 2018 16:25:01 +0000
Message-ID: <CAFEAcA8sz-QpvR039dC0fEuRC4qkxTEwY-=3LpoXG27aFO1S9g@mail.gmail.com>
To: =?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-devel] [PATCH v5 06/14] arm: Instantiate NRF51 special
 NVM's and NVMC
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Stefan Hajnoczi <stefanha@gmail.com>, Jim Mussared <jim@groklearning.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"open list:NRF51" <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iVFnvyEHvf99

On 12 November 2018 at 21:42, Steffen G=C3=B6rtz <contrib@steffen-goertz.de=
> wrote:
> Instantiates UICR, FICR, FLASH and NVMC in nRF51 SOC.
>
> Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
