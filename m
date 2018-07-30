Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4035203wru;
        Mon, 30 Jul 2018 10:38:38 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcyYWO8PEkaP1Px8X8MhQOwG1axxz4R4lLso+0MZrjxV/Rgeg298el2DLN24s3w0FKLgLby
X-Received: by 2002:a0c:d60f:: with SMTP id c15-v6mr16059263qvj.70.1532972318529;
        Mon, 30 Jul 2018 10:38:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532972318; cv=none;
        d=google.com; s=arc-20160816;
        b=H4b712JmAQSrn47xi6uWLu3ljm4+V2/CRH57NaAn+Xj/WI9a1IwnJ42Ai7R9+ANMXx
         Tl6So5wC+IyNYecSzZAQZGlgQyT0/Ykc5BWfywzh1GdtDM8ksb9oTMkNQGqsiZullv3u
         h4MMFRzYKsals11B/lh1ikTzs7lEJoucjJYhQpgXbYUncYZ9eMd98FNlY2s0gHiGotai
         nyPxTwGkycvnr1qBbcC2PJOiU6FuXZi13bQafOnTLxak2ZBWjDHOWy7f/XsKr4++ev4G
         EuScxlO9wuX4W1RJqv31RVDNEHO9QcrbQOB0h4qHofaIwR0xPs2im7mWtRlhxPxlxKI4
         XVkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=d3jObgrOaynkKEEa9djdEzqBz0M7OowsqKYFCTlZgDA=;
        b=hqXl3oTfwjJVy0FIY4anil10SD3+mgstVaFZqCRMDQZrUSoa3XGPPeo/+5WILf29WA
         ePaM8BK8a4Z1p1lt+8zpFtuv2hIEijRWnCXraGEFbXei8HIhRDopfGmH8eu9wkh+ssLR
         /0Yjj14j/qRdDtnYRdjC4jDUy4xGxZj9nnyf69bJH0tDSQ6w3lMxajlVB13AfhKUj/5s
         SjxbOHf106NozQpEpSnY+qDguPIqQYt78YIe5K7zbbkwKWtzl2RYPA1dGVbsisrHYz7+
         XWTMhQP6Udfz3hLu2s3j6D7MwEyuhRA8pFQc4VyriumZxPLZVoevVKcZSE561EUNm3JV
         Zbkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cyoRWVLZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r124-v6si1996059qkc.191.2018.07.30.10.38.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Jul 2018 10:38:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cyoRWVLZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54335 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkC7x-0005UN-SA
	for alex.bennee@linaro.org; Mon, 30 Jul 2018 13:38:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33694)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fkC2z-0001hy-8O
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 13:33:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fkC2y-0007lF-E9
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 13:33:29 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:36237)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fkC2y-0007l3-94
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 13:33:28 -0400
Received: by mail-oi0-x242.google.com with SMTP id n21-v6so22776826oig.3
	for <qemu-arm@nongnu.org>; Mon, 30 Jul 2018 10:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=d3jObgrOaynkKEEa9djdEzqBz0M7OowsqKYFCTlZgDA=;
	b=cyoRWVLZuAoDasJeZhs4LksreoAQrES3PSqfV9Xk51TjVg3wEaQ3yxPctLz/dwQ4j+
	veTYPI+zd9f2Z5V0grBWwSUA2l2XSkImj5b+gXrR20D0sONDdqEMMl66dsrn3nB9apyn
	SD+8UVcJwq7FDJW658CAW/I0VgLmVUeG9FBsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=d3jObgrOaynkKEEa9djdEzqBz0M7OowsqKYFCTlZgDA=;
	b=q5Pdk5EWZASpJc6XVSlpIMcyGb7CFFKXt1kHqmf+OCKif3LHGoaOwQkUGunm+Ha68Q
	7fp9vuCgJSX7Ogz0Wbmrt0iQDobuFiBNMkMY+FW6JxsGSXzIKfa3oiZ4BQsWv1XKxGFd
	+cOfX6aYaRQx5XaVAT2x1L6vpbwMTbGbJJO5GeUb7DFlUHNPN4G4AG4g0Se3PoNbQqH4
	f75u36ELX02dbHkkussanSqmbXFRuNMjX6DjehwALW3mLwmvsPrsitkVik0MLC2S5THp
	Y0c7nXC9s9XnXmi8iSDKszo2LxeMbt1+wA0Msdi5YpCVNZX2ijaVijeBOrfcBhtg28JT
	EG7g==
X-Gm-Message-State: AOUpUlEESsohhNipNjnC0WcMxfe2h0t9McyHzmO6nUZt5yasdmTM/AYo
	XRKDVuuOHnEb/J8sAjh461c+NtIHTLbdxso6Id3/tg==
X-Received: by 2002:aca:4a49:: with SMTP id
	x70-v6mr16981046oia.11.1532972007620; 
	Mon, 30 Jul 2018 10:33:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Mon, 30 Jul 2018 10:33:07
	-0700 (PDT)
In-Reply-To: <20180725085944.11856-4-stefanha@redhat.com>
References: <20180725085944.11856-1-stefanha@redhat.com>
	<20180725085944.11856-4-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Jul 2018 18:33:07 +0100
Message-ID: <CAFEAcA9N370ujtaJ-jHy==sOqwq42sOYw3PWt6oATYMha=QW=Q@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH v3 3/7] hw/arm: make bitbanded IO optional on
 ARM M Profile
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
	Su Hang <suhang16@mails.ucas.ac.cn>, Liviu Ionescu <ilg@livius.net>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iz5tZxbIRZZi

On 25 July 2018 at 09:59, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> Some ARM CPUs have bitbanded IO, a memory region that allows convenient
> bit access via 32-bit memory loads/stores.  This eliminates the need for
> read-modify-update instruction sequences.
>
> This patch makes this optional feature a ARMMProfile qdev property,
> allowing boards to choose whether they want bitbanding or not.
>
> Status of boards:
>  * iotkit (Cortex M33), no bitband
>  * mps2 (Cortex M3), bitband
>  * msf2 (Cortex M3), bitband
>  * stellaris (Cortex M3), bitband
>  * stm32f205 (Cortex M3), bitband
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
