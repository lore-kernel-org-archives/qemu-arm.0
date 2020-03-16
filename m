Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp322255lfe;
        Mon, 16 Mar 2020 10:12:34 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtoSUQ64SpqksnPfAXp4O4uVdwS5FJ5UcFF6yrl3Z8e7wd+1/4B10NJAR+VyxbDS93o6ShF
X-Received: by 2002:ad4:5288:: with SMTP id v8mr856934qvr.120.1584378753928;
        Mon, 16 Mar 2020 10:12:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584378753; cv=none;
        d=google.com; s=arc-20160816;
        b=d59Rprr8ZtELpG3K86PtTZ5Mn8DKg6k9XiKyNxlQD3GvzBqIOOT62pIfo1yK97c5EV
         /GmQUTg/U4nqsE5/cTZU/c6T9C1AMaIpl/W+CeluYohJCxHW7OtQ/Nz/FWFM6eScSruw
         LrAlyw/zyWdS/judOMZMkaZIqQb75m2mGHUnlp0gshNKlAfE1YB37ocZfIWyrKJGI+V8
         dcQ+W99cfdFJLVsA4OwRi+2Bomq62LqHUvvVf5hDdPSiKUlFoQTxiyb4z6kx5cbjdPBE
         WnXfAJz6T4D9lP2KnHaYRncrNwmfCeEJwQ37bt4DOLOqv99AFmEWX66aHuyFQncLQncN
         eelA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=1t7FGpmu+p7rJZSQuRsOLxDzhRORXyV08+TeZNjvzgY=;
        b=yRCLjeauuWvqkQH8nwcGEv9bHrKSLBJrY67cKowahed85j79c8H+TQdq+uC9HEE3Sj
         dITt6HyC1b/UdvI5dG+qSyUFBZF3z2jv6cWRvk35Fs0dBBT3VYrn9ABcTHM7FBUUpu7H
         l0BUlCSGLfuwNsthy1AMlqma7X6nI6/Wh8lU7W/AwXDyxomw19yo1eG/qOsEmQBaMp/P
         CceqyFaWkrr/vmsUITJWNa3aAfz/ymxDQngWDImVSe1V0n1UFC4Vx3LEb9efTO0fpjBq
         PwuPkKbOpReYD3conH6IrrEE8g+HzdihXEz9k+aJ//99LzoJtV33bx2SCX1+7ipCKL1h
         BM4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KPcvXVxM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m5si190978qvz.208.2020.03.16.10.12.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Mar 2020 10:12:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KPcvXVxM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jDtI1-0001bB-9r
	for alex.bennee@linaro.org; Mon, 16 Mar 2020 13:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59815)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jDrCd-0002sf-EG
 for qemu-arm@nongnu.org; Mon, 16 Mar 2020 10:58:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jDrCc-0004tj-8Y
 for qemu-arm@nongnu.org; Mon, 16 Mar 2020 10:58:51 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:33760)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jDrCc-0004lE-1Y
 for qemu-arm@nongnu.org; Mon, 16 Mar 2020 10:58:50 -0400
Received: by mail-ot1-x343.google.com with SMTP id x26so1092945otk.0
 for <qemu-arm@nongnu.org>; Mon, 16 Mar 2020 07:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1t7FGpmu+p7rJZSQuRsOLxDzhRORXyV08+TeZNjvzgY=;
 b=KPcvXVxMA4PkHX0fQ6Y1xdHW4cpr1dTbcISO1f1q6R51RxHUd2aX1J248Pm85+zLtO
 5bwMEuwN8fO/fsoOfavClT8zS3e7fJ/iCLSgMSFBl+xexpEimJbJaZerlX1upBY13G20
 gvx1vdxrrwztGxonXK7HzCDyWoPcm4r2qMyGIyThSr4+u7Pep0YxE3jGh7dKS7bxwdRq
 u+yv5xO+q7Ds7XRpozXJfjhA1VQz3jIiD4sen4VNBlcpUZpX62Wuv4HcvyG7yX3/xWno
 hsMjXbze4td8zzUOxHwTErmQ6xgs3Chfp923AlIJuKGmqIGpg/Ci49IFyc/maNLvlWwg
 jVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1t7FGpmu+p7rJZSQuRsOLxDzhRORXyV08+TeZNjvzgY=;
 b=RQBzPEHUMFN5PlA17MsdQEcalEio1JVXGAW+/sFkIw0VCHsyUXFSW6DQSS8IDWACS6
 idChDtaRVqHZUp43WZIos7RJEGE64WoesRzt88k5PMg50+9mT23pHtHYqSHMtWieiyVo
 VFi8kug1KvojNv5cjvCX1zt6PT6Y7+2beh6yZMnK2S6WcqQiakSFNSalijw+PhNGqfpU
 CY0wwgmDUBWAc4gRRGfM3lyuV1IM255/0zU9qvnVBZtEHfrbAlZh42l1N8iLgEf2zJaQ
 95ykDS5OiHpVhrS09/6E5eF1IsikdK1RJM1dlIqktoW1vxlcnG7BvmiIlCqmttTfONZJ
 VlDw==
X-Gm-Message-State: ANhLgQ0zQgxptLRgThZORzllRc2Ak+TgkNTpUZUOW0/2EpOiFWnhiIyz
 9v0pBuWbCA3uegtrc05owoK1rmx/F1LzIq1CU3+zVw==
X-Received: by 2002:a9d:1920:: with SMTP id j32mr21686367ota.221.1584370728237; 
 Mon, 16 Mar 2020 07:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200206183219.3756-1-linux@roeck-us.net>
 <488b3355-4467-e01e-d6a0-a2d5bc959428@kaod.org>
 <5589b5ce-1ff3-bf1e-ceae-fe82e1e1265c@kaod.org>
In-Reply-To: <5589b5ce-1ff3-bf1e-ceae-fe82e1e1265c@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Mar 2020 14:58:36 +0000
Message-ID: <CAFEAcA_Zg65ebyTH+7i8ZGf4jzmf1tRPYdVz590UP0rQoz86pg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] m25p80: Convert to support tracing
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wLuhWrXuaphu

On Mon, 16 Mar 2020 at 14:14, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hello,
>
> On 2/17/20 4:47 PM, C=C3=A9dric Le Goater wrote:
> > Hello all,
> >
> > On 2/6/20 7:32 PM, Guenter Roeck wrote:
> >> While at it, add some trace messages to help debug problems
> >> seen when running the latest Linux kernel.
> >
> > Through which tree do you think it is best to merge this patchset ?
> > block or arm ?
>
> It would be nice to have these 4 patches for 5.0. All are reviewed and
> tested.

Do you have a pointer to the cover letter? Not sure
which platforms (and so which tree) they're aiming for...

thanks
-- PMM
