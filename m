Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp689849wrh;
        Fri, 3 May 2019 08:24:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyAZ2R5q2ZrZ2cS/OWe2gOMbwgWWm+tkexPbl17B1rN8Ob3oTbcgWOQGp++OV5jTtBRZOlQ
X-Received: by 2002:a7b:c3da:: with SMTP id t26mr7042426wmj.40.1556897087952;
        Fri, 03 May 2019 08:24:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556897087; cv=none;
        d=google.com; s=arc-20160816;
        b=N6Xg17WYFFUBuKO08yRcj1PWD05yQOH98J5OKG9Q4/PNDgTfLIdbi7jbuXZrzj7j96
         WfuNnHzJBu0aoiBAI+WP8xZtYJjfnzrXzuC0pm0cO1A7lOBIGEfcbxJJ5EfvRwymrJMt
         gCWyX7EJkRM1/LLK8t3W6MHRgt5aERbiITL5MAroU4sw4yubvJTfhKywKmMzBGuX0YI7
         adf9P4qLGSKktc6M+V9c1nbnN8jJovHILP3aYi2kySec8ubYzkGiHTaDiUqfzeT1QZb3
         iEtt6sgIKlzWIb95X92FDyUSR5yPyuhLIY9RZrSug2tMomGmXNa5eAFCZeavXRGsA2Lk
         9zfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=R5EUZbX0veMkQ/tTDrUkgxg/WxlZ4V6jrgweu1aHHFw=;
        b=NPF1PNnd8pneO7oMjtQWb4I9Q2IRdx5arGh5fRNfN3uHJIdDuzykT4dUqRiuWG8yo0
         Uc+VOziynRHgTUTcyVKD5R3QhqHPmW8uCULIN0oUOXf5BjQXyUvV1N8EBqSsTXqMhMt9
         B+bUll+xEycUVAZ5EEI5ersiK+4g0Png7VJHG1bQPpeI30lYGRFKUACI9m6j1zLiQ/uc
         hFzpbHM+kVuRyFeKK8i+kC/tuDXj53VNNN2xuaiNFiqAh808Y43JJ2dNPs+82uGbBbDk
         U+oJWCIhj/4XCLTY08MrPHczdWp32qp2/p3us4pXC/UQ6iddRUfi+GU8LACK/nETlNf+
         ZAqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Fq1HxMDl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n26si1433580wmk.128.2019.05.03.08.24.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 May 2019 08:24:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Fq1HxMDl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42187 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hMa3L-0006oX-2E
	for alex.bennee@linaro.org; Fri, 03 May 2019 11:24:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59608)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMa37-0006nS-7p
	for qemu-arm@nongnu.org; Fri, 03 May 2019 11:24:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMa36-0003ka-6f
	for qemu-arm@nongnu.org; Fri, 03 May 2019 11:24:33 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:44613)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hMa36-0003jn-0b
	for qemu-arm@nongnu.org; Fri, 03 May 2019 11:24:32 -0400
Received: by mail-oi1-x241.google.com with SMTP id t184so4636567oie.11
	for <qemu-arm@nongnu.org>; Fri, 03 May 2019 08:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=R5EUZbX0veMkQ/tTDrUkgxg/WxlZ4V6jrgweu1aHHFw=;
	b=Fq1HxMDl3UVPQyCHs5kCf6vjjb1ebXAjXa1FKW8v+hYo7c1U5Unp5Zeouy99OC6QpT
	jNU4xWyQC3pwVzjhYGd895HmygtCN87GV/9uoddyCYUbP2Qjz/NXaxIkIDrzJbas5tCa
	DMAg7Yn360+LT0DAmGO+5UkMbAPIIY+DtNMselXoBkgXQ73SuJ+friUM2v29jdBqCQ5q
	iZ0yrZEugXdriHNXQz6jFTQltygfccVUoVMDY31DdTYDxwzjF+RFrEwygM3tR7YpJCN3
	5Ht3t75tTU0LmzKiMPISd2JtMiNrhyvjhpJFcezIBhNfDwSjyN1DJpNxX2TReKjjcvUu
	COBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=R5EUZbX0veMkQ/tTDrUkgxg/WxlZ4V6jrgweu1aHHFw=;
	b=jPH3pA9Z+EYFG7ACZvJsnVlDQE+uSHsrZEtn30RtVh3i5Znedc4UOHqhorbcamlzCx
	rdA+PonP2zCuT5Uy7tPsqeE/49igDPiH/p+EQNkFkYP8E4Jem87qsLvQUfvykHSmepP8
	e7PZfhD4YVNk2mMXzKU5/Lg3KH+9kwkib51/P+A/HBb81/2SGmOcOaJ+n9tGY5sF1dfz
	szKMGRsmCPmFI5ksBsNacxhO4H8SWuoTa9CPFMGk8Hfev2CiusMd4AixCOpcs41AKkbX
	785WYqxImS20GPM1ACkQ3rIfgYT+Lq0t2Gpjv877CBHIQaM6kEt9V0zHOAKrXFuwCyuX
	9eCg==
X-Gm-Message-State: APjAAAVgcH1vmp+alX64ZZqAgcu7tt83zQC7M+YBp+9pcuuGzub5FBR7
	E2jt8GV/J4InQ/Y9LePYBVgC63ulO0FVcZW/ZD/Fsg==
X-Received: by 2002:aca:b3c2:: with SMTP id c185mr6601892oif.98.1556897071133; 
	Fri, 03 May 2019 08:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190430071405.16714-1-thuth@redhat.com>
	<3619e259-7256-9199-2cdb-53f980f64c34@redhat.com>
In-Reply-To: <3619e259-7256-9199-2cdb-53f980f64c34@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 May 2019 16:24:20 +0100
Message-ID: <CAFEAcA_70xU7_Z7vEs+NHuG6L9jZTp7_r2yORn91caqV4LknPQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 00/30] Kconfig dependencies
 for ARM machines
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
Cc: Qemu-block <qemu-block@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	Philippe Mathieu-Daude <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /RAYMKEVLFwU

On Fri, 3 May 2019 at 16:15, Thomas Huth <thuth@redhat.com> wrote:
>
> On 30/04/2019 09.13, Thomas Huth wrote:
> > This series reworks the default-configs/arm-softmmu.mak and
> > default-configs/aarch64-softmmu.mak files to use the new Kconfig-style
> > dependencies instead.
> >
> > Some of the patches are slightly based on the work by =C3=81kos Kov=C3=
=A1cs:
> >
> >  https://lists.nongnu.org/archive/html/qemu-devel/2013-08/msg03730.html
> >
> > The other patches have been created by looking at the sources and findi=
ng
> > out the dependencies the hard way via trial-and-error (i.e. by enabling
> > only one machine at a time and checking whether it can be compiled and
> > started).
>
>  Hi Peter,
>
> the two usb-ohci patches have now been merged to master via Gerd's tree
> already, the pci patch has an Ack from Michael and the AHCI patch one
> from John. All patches have been reviewed and/or tested ... so I think
> this series should now be good to go. Could you take it through your Arm
> tree? Or shall I send a separate PULL request for this?

I think it will be easier for me if you just send a pullreq for it.

thanks
-- PMM
