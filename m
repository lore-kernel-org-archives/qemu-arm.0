Received: by 10.28.91.67 with SMTP id p64csp2689586wmb;
        Mon, 5 Mar 2018 07:50:36 -0800 (PST)
X-Google-Smtp-Source: AG47ELuVr+uGN9OYOm0TlG0nXBOMYyfhuWWQuBwr7Bg6Ink+AUcVd1YQLq5L6q1lQlPcUCbrUMLe
X-Received: by 2002:a25:a229:: with SMTP id b38-v6mr9560362ybi.64.1520265036272;
        Mon, 05 Mar 2018 07:50:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520265036; cv=none;
        d=google.com; s=arc-20160816;
        b=tkIpXcH3Ui4oeKDIikGSrl/v/+TAeu0z+ZEDWVlOlLQCHysCMworD3OTCIqfygN5WS
         vL4+Fl0HfwpJzhnUXjYXOQ8+Dz6npo9Memy/r2weFCDEwuAAtM38ronBHzjhhG4Eb1vm
         5oDG5jINy7xaoqBBVD24TeKjaVSjne0xGJqSiWVJMwE0EDlTGAvNmn3ksW3FacZloXQq
         rgHahlNyo7e9cqUgBrJb1B4qZEDYwf4WI6dr7E7VTjmSDqWauq5kuIM5YQjNtiSI6X7F
         5+7oOq87KqO+6vvJ0Fp7Y4DpGinFQedlFxZWRhrjTo1LvbTOgVN0mkbYx6Ub1anpTx1+
         0iwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=BjLuo/7S/5ETmpq/tlXa5JYCaTkYqLUZnx80F1sagEw=;
        b=Zm+jOYkICcRvhkhMoKYrRF51c6J4bwDY9ZEGEmI9Mx14liYKpVC+EiLZX7ldXLE7dK
         92XqTGvWvlxCwhgNDXRL6eHCribDuXwNlfAyv73AswTyMqr62Uf3Hh5fAhyJ7sboF8FJ
         RoiOxDYT0JS9oT+zkyoDFVi4DZqw7bTxhroX6n+MG/2beGz8rJyDSeTKJfEWnXVwmT6m
         xvYvFqKN0M3qCcaBERyjwSla3f9JjFmt+nYdxYR+sMH/MOBCsljP2Y3SCS6CVrfjMRfn
         1H7aKB5ewknR9SAH8JiQ8hCPVF+1KFZFhAB74vQXfTuBjmqO3/rJjNi8gZMaZGAktYCo
         PUsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nShyfxkP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e203si2209517ywa.802.2018.03.05.07.50.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Mar 2018 07:50:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nShyfxkP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50086 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1essNn-0004tH-PA
	for alex.bennee@linaro.org; Mon, 05 Mar 2018 10:50:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1essNf-0004sn-9N
	for qemu-arm@nongnu.org; Mon, 05 Mar 2018 10:50:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1essNd-0002gr-J4
	for qemu-arm@nongnu.org; Mon, 05 Mar 2018 10:50:27 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:40592)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1essNd-0002gM-01; Mon, 05 Mar 2018 10:50:25 -0500
Received: by mail-qt0-x243.google.com with SMTP id y6so20826381qtm.7;
	Mon, 05 Mar 2018 07:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BjLuo/7S/5ETmpq/tlXa5JYCaTkYqLUZnx80F1sagEw=;
	b=nShyfxkPq5ziyV70jS/Qti/6v87tXh8p3bbus7MlCLwEpIP7q2CzORh3tXclT8Kkav
	dbUuPkd16AtnasLbg7Q8w48yDVLrSOLH+6kgjpcWE5KHuh/UqHpQrbLRsbhgzODx6co4
	jzCapQVIQjw1FHBC2FuHf7KuwkhWJ1ZoL9XVK8TdybYFc3gpoUV7L4llmHBnbQ2qIR34
	qbQ0WUw1IjCR5Ne2Adwqb4OJ0Bhl7gtJKn8U0nwtVoJmWeHOw6ulXIOKybJXOBn4LEAz
	Det1rm7dzev2Nk80ySu9ii4t9LCmRRYvTr/PLnoyKDmmQGg3GIU9+vtgP7TW+tQnfd34
	uvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BjLuo/7S/5ETmpq/tlXa5JYCaTkYqLUZnx80F1sagEw=;
	b=GypShb/Siq1G9WqMFVwbXTFb18cnt4PUcnCim6aOg8iweyKPYOoPwyVFDWi7YS9SsC
	3vO79gzPsodxIZfsipqQudUUawOe+yrEX2yI4pLoKAh3DXOUHfRii4o/edoawXl3mBC5
	6D+77y38Pb26CtrdyKk9tD54ySDjNj3iZLab3/Y+S7NqN1fau1CKRgZO5KHQmKsKFU4o
	TJaul7Wat10bMtW/WE+WZto6ZAwU0KD738iXUJCMqKauORt/ZjIyiI09iCjRCvVoZEXy
	ildIGbDiZjMa826DiAFw5QJjHw2VkeWjOEd9lwFiJi4ShzuQahOq9ThSmp9S9LWRRPaD
	ABWg==
X-Gm-Message-State: AElRT7G3sP07COv9vDSSLU+QBW3Ieay+ReZuO8WSDFbGrllCb4qHCK4Q
	kZzY5T4sUofmdyc9Z3BMCMMn92leXkQqmI3kn7s=
X-Received: by 10.237.50.66 with SMTP id y60mr24159951qtd.179.1520265024119;
	Mon, 05 Mar 2018 07:50:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.80.146 with HTTP; Mon, 5 Mar 2018 07:50:23 -0800 (PST)
In-Reply-To: <CAFEAcA_Y3oY0w3Xmrs0BTfhXw1s7S-8pESZ-rB2HgXzZ_5Vxmw@mail.gmail.com>
References: <20180305061237.21484-1-andrew.smirnov@gmail.com>
	<CAFEAcA_Y3oY0w3Xmrs0BTfhXw1s7S-8pESZ-rB2HgXzZ_5Vxmw@mail.gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 5 Mar 2018 07:50:23 -0800
Message-ID: <CAHQ1cqFrb3eryu9Dvi2=8aV_=K-MX9bqPHNAH4Fc4p402Sm0Bw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-arm] [RESEND PATCH v7 0/3] Initial i.MX7 support
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4cc5/KTlZxkS

On Mon, Mar 5, 2018 at 7:31 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 5 March 2018 at 06:12, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>> RESEND due to botched original v7 submission (patch 1/3 broken)
>>
>> Hi everyone,
>>
>> This v7 of the patch series containing the work that I've done in
>> order to enable support for i.MX7 emulation in QEMU.
>
> Thanks; applied to target-arm.next.
>
> By the way there were a couple of i.MX bug reports this weekend:
> https://bugs.launchpad.net/qemu/+bug/1753314  (about the UART)

Sure, might not be able to look at it immediately but I'll give it a
spin by the end of this week.

> https://bugs.launchpad.net/qemu/+bug/1753309  (about ethernet)
>

Peter:

Ha! This is a rather amusing coincidence since I was just talking
about this exact bug with Guenter Roeck (added to this thread), who
was going to submit a patch to fix it.

Guenter:

Sorry for just randomly pulling you into this seemingly random
discussion, but I though this additional context would be helpful to
you.

Thanks,
Andrey Smirnov
