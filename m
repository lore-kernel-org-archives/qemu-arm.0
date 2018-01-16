Received: by 10.28.173.206 with SMTP id w197csp3750435wme;
        Tue, 16 Jan 2018 01:57:25 -0800 (PST)
X-Google-Smtp-Source: ACJfBosYbl667JZdCmkkkwnS2+JtC4rK4isdgf9riY1meIZlCm0YNshbw+RwiOziv9d+sOAUpHwd
X-Received: by 10.37.61.194 with SMTP id k185mr11688552yba.301.1516096645138;
        Tue, 16 Jan 2018 01:57:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516096645; cv=none;
        d=google.com; s=arc-20160816;
        b=AusOheO/P5v7s7Q8LXtTrUJvwglWubpsVedg+MrhWjcPjKNxGrb0KNHuXMmbeI6rUN
         +Efv3Pb/BepKqYUp8GZoUKorstY63u1seLjF6ZqEGsHXh6ijO35o2Mn7F+ad1PJDJGFE
         o4anBAW/aIRyvijpfrhnwz4im3cok2gnmB1kjonD0OJHhsHaBm9XO5LF694RTdK1xVWI
         cfdyOQJYoaBWBlV4zzSUEFAyaC5E2Y9V01oUch+lLy+VBSAJ3EEJfd8bxPBZZbchqNSm
         TrLxLjRwIytH7F2Zujh7uRQbCVa/B/eFX7kmfLraIW6HWPK/J4eHkPhgbSe7Djpn8dpX
         26dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=fmCAeBfJrZO4ESzT6kN3JOMrOCR6urjTTLhtybIymEw=;
        b=Em92ykbQY77/oY/rz7bIG/ud8FjHjy87uXOqcntGK9b8Wwog6QJgBdc54OQ7AaT53e
         TqHCmH83i+nEXA0pHVYbaamtHA0nboEpupQ0W1nKZwfhJfZ8qrJWW/+k+kvOGhVP+3Vd
         Mng3j9N7gYZegHCdU+fFOrKBMAw78rs1BT5fpBmBTTTzpGQpH98UbRtQkpAY8lU8DeAR
         acin6UmTPjmGcjGHBXUlI9Kx5FngxE4hMk7SGZcdnrIIYonZ0oEfmaiykvQgHxBwv5i5
         3qC1zoDASkTxWGRknxSDKYUt02KE5CF7+dNhcgmxjL2rCWYXSVI2IzmGN3fr4pRMdCc/
         R9RA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OiI0h2It;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n10si416769ybd.271.2018.01.16.01.57.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jan 2018 01:57:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OiI0h2It;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52643 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebNzg-0007dR-Kx
	for alex.bennee@linaro.org; Tue, 16 Jan 2018 04:57:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ebNzZ-0007d2-Kl
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 04:57:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ebNzY-00006m-Re
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 04:57:17 -0500
Received: from mail-ot0-x236.google.com ([2607:f8b0:4003:c0f::236]:35127)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ebNzY-00006K-MW
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 04:57:16 -0500
Received: by mail-ot0-x236.google.com with SMTP id 53so13104205otj.2
	for <qemu-arm@nongnu.org>; Tue, 16 Jan 2018 01:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=fmCAeBfJrZO4ESzT6kN3JOMrOCR6urjTTLhtybIymEw=;
	b=OiI0h2Itiou8NohsklIVXw3nyoeEGU3cewErkPyS2CMR1mwsLn+bLH9UyOJrAjmJt5
	rOib1Qfks9Jm15yg8avyikxkUzEosOusDjFLFnbB26Cx1wKyYZJJ73ZnlNYyJYQ77/Ii
	pa8JfMjGsqJdCgRlw+ioFfzehk630CQy5dTZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=fmCAeBfJrZO4ESzT6kN3JOMrOCR6urjTTLhtybIymEw=;
	b=lM77hnaKC3sEvw4l0vegGu3HmFQk5Yk4w1LQxCDaHFo6zfy5lqOuIsx/wD/ZWnLKpD
	Efb8e5iQAk42WuDzoDXPXktLo5Xp+ZaMhLLlF/0XMZ0qW7B3sn4i3xSabCYsaJGnZjo6
	aZmOB2wcr2aMXKXvtyXypA+iFjRFc00Vg71WoD/JqEDTKscBMcl7/mD6dvKwFmGYie+N
	b561f8Y9aQqE5OKxWkeYjSHH6VNRVtg/VrU1C0Mkj+bccHG/8vchxKoPys/7TAevJS0X
	RXwq4a0yoZOEXbrj9GmQZINzQyL9HSUmlVKcKPkrBR2vx1f45NdBqbWCtLwVVPibmFC/
	x7KA==
X-Gm-Message-State: AKwxyte8MoMEYthSAn7veMZ7Iz+qmI/efqjcM9Gn6NUkLBjeOcj9rlFY
	t3i/wDo8gsaJS07bkf78v88G6me8BKKA/koASJ0fMQ==
X-Received: by 10.157.29.229 with SMTP id w34mr516256otw.24.1516096635623;
	Tue, 16 Jan 2018 01:57:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Tue, 16 Jan 2018 01:56:55 -0800 (PST)
In-Reply-To: <8bc803bf-c062-6ee0-d7c2-74262ffe12dc@amsat.org>
References: <20171214151934.3647-1-andrew.smirnov@gmail.com>
	<CAKmqyKOV7kYBTDmjLaFTtKAF7KyZQ56F2LiwE5D+Hzzh9nvmxA@mail.gmail.com>
	<CAHQ1cqFhHRVNOT4Fo+AbF9CXYn77Npy2g6hzWJ+Lh90aRxT=0A@mail.gmail.com>
	<8bc803bf-c062-6ee0-d7c2-74262ffe12dc@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jan 2018 09:56:55 +0000
Message-ID: <CAFEAcA-MaS_y-kroAZuX48-bh6YrN8-ULoQUqJD_cM2K7jmonw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::236
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/misc: Add code to emulate
 Xilinx Slave Serial port
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CJDD6zU0B7no

On 16 January 2018 at 05:04, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> If devices have qtests for code coverage, I think we should accept them
> upstream, even if they are not yet plugged into a board.
>
> The other way, there are motivated contributors who start sending
> patches but then never finish due to changes in life and reduced spare
> time, or lack of motivation due to the high quality asked by some
> maintainer or daily paid reviewers, which is a shame IMHO.

The other side of this argument is that every new board and
device we accept upstream is increased maintenance workload
for us as upstream maintainers. If there's no board model
that uses the device then it is completely useless to us and
to our users, and so it's all downside.

thanks
-- PMM
