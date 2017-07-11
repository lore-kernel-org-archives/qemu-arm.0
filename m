Received: by 10.25.44.15 with SMTP id s15csp4801910lfs;
        Tue, 11 Jul 2017 06:00:45 -0700 (PDT)
X-Received: by 10.237.63.141 with SMTP id s13mr11054998qth.61.1499778045728;
        Tue, 11 Jul 2017 06:00:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499778045; cv=none;
        d=google.com; s=arc-20160816;
        b=N+S3+2TS9x0EV2+bAk2t2azNQdyYZZS1FxVCvPmCXxM95Yr6AVyWNXh3n41QLaD9pY
         Yk9sLFKFFFeV8vFq0W+8wDBwGvKB/EMOMlre3pBj3k2Xca6fCsDuMv1NslBU5MOHvShs
         36NnZtMGE5GocvqdKqI21db/lI0u3l244XA8+8IGN2d7CKPeNdEZfQ7sdb/JYEKAYccR
         8j36D3pP3BcFuWBX17f/wMEecKIbhtxsWpGgap4nhLTeBQTnJUDbtBoyLshJ0pfgq2sj
         AHkqjHcCY4+zHXmM5NzEwsboWv5zv9P+65r73PJnawrUu3IHpaSDBbV7yHkXgOf3QIpp
         D/Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=gPR7TOo0k0Pnvezt2l1Nrj2yMttJZZv0bpfUfinxiJw=;
        b=IJXQfxCoQ931Z5OhZbdL36NULBV8BvHYHe5CNLw1Lj8ycAX4A7X7VZLdd7Kfvs6DBW
         SuvihC8cC9eaHqgEt7+47Sj2XJUah5raIIJTcxLkum+Rj27+MkSNkUkgXv2/4xKJJth3
         DMh7qqSvbr4sLxSbQmLxdf0NiYL/2tkKxiikcbb0yIzuDrNLqBykH6mAOFbKg4sz0Xmx
         a4ub3fwAK7v77J4vuE46dcg8yWHPjk+Rvsv99TKoaBSuJw10GrWDM3nYujBoVUMPwOqc
         rBaVvetPspcu+X5G/0QSOxp+zjPNVZ6Icp3Mz59y9JEXCDQNRfNBdH0h4hflEOiNce1A
         i5Nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=bCiPIqU7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id h42si13291737qta.179.2017.07.11.06.00.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 06:00:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=bCiPIqU7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46238 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUumR-000239-1j
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 09:00:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dUuf9-0004vR-4F
	for qemu-devel@nongnu.org; Tue, 11 Jul 2017 08:53:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dUuf6-0000o1-0y
	for qemu-devel@nongnu.org; Tue, 11 Jul 2017 08:53:11 -0400
Received: from mail-wr0-f177.google.com ([209.85.128.177]:34626)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dUuf5-0000nr-Qq
	for qemu-devel@nongnu.org; Tue, 11 Jul 2017 08:53:07 -0400
Received: by mail-wr0-f177.google.com with SMTP id 77so182180932wrb.1
	for <qemu-devel@nongnu.org>; Tue, 11 Jul 2017 05:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=gPR7TOo0k0Pnvezt2l1Nrj2yMttJZZv0bpfUfinxiJw=;
	b=bCiPIqU70WherPD4VU/a+Wp8D+obUbq/aC1iImdXxOOZoiuZ2B6bF+K1zJew3wLdyR
	uh5IOqK2rOcfHZh9JNiFx8jYRmcH4tidhYxQbbUw6wGkqmmE2sjoSQ5NevPUikEPdmQc
	22waWtFbltedYMt5Eve7GojWtL1pI73S1Qnbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=gPR7TOo0k0Pnvezt2l1Nrj2yMttJZZv0bpfUfinxiJw=;
	b=FIi/KOCrrZROdqPsmsnf9CpW1+wOrYn2dZz8JjwzQR7hJTS4j6PDie+DXksbUckT8U
	ij0uJMThtsuMU+lAKUbKYbGkrf76N/GYXUKlEYYI2YjWaWPAnWlEUyuVy2mTh4gI0yJx
	47/Ik3XgeLpuY0YymNUaPWKpNQhzvqeskSj62IPKM31riwz8yTE5B3Pg8XxMJIFF+4pU
	iw5UYNsx2oz8HdqYFrAXJLvLjMptVZ+keCDlm1XZoc3ip2Ouy6CZl83B0bbPYImGtzHx
	6b1ac2/2H5ZKeCdyDrTRX04ye3LrYcSuEFxNHQqGg+52ShrffpypG5TSkSW9k4HRDF4F
	73lg==
X-Gm-Message-State: AIVw112x6qn3hUt8kq5NJRo1WPBw8kjIqkWvOr8p7dUs3bVztSe6GYJX
	btmBKEBb5PhYIhAulMYPR4t2ThWcJSMsbh0=
X-Received: by 10.28.129.203 with SMTP id c194mr6134964wmd.120.1499777526566; 
	Tue, 11 Jul 2017 05:52:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Tue, 11 Jul 2017 05:51:46 -0700 (PDT)
In-Reply-To: <149977720815.27.5500531494767534688@5d477a5b5989>
References: <1499771839-32518-1-git-send-email-peter.maydell@linaro.org>
	<149977720815.27.5500531494767534688@5d477a5b5989>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jul 2017 13:51:46 +0100
Message-ID: <CAFEAcA8MC3goto_HyKQ1wHbg6H-Ly+rscuw-qOvPM3t4qde=Lg@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.177
Subject: Re: [Qemu-devel] [PATCH 0/7] ARM: implement MPS2 board (with 2 FPGA
 flavours)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Fam Zheng <famz@redhat.com>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NAnMZ/qTZ+sG

On 11 July 2017 at 13:46,  <no-reply@patchew.org> wrote:
> /var/tmp/patchew-tester-tmp-e38by36j/src/hw/char/cmsdk-apb-uart.c: In fun=
ction =E2=80=98uart_read=E2=80=99:
> /var/tmp/patchew-tester-tmp-e38by36j/src/hw/char/cmsdk-apb-uart.c:164:20:=
 error: array subscript is above array bounds [-Werror=3Darray-bounds]
>          r =3D uart_id[offset / 4 - A_PID4];
>              ~~~~~~~^~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> /var/tmp/patchew-tester-tmp-e38by36j/src/rules.mak:66: recipe for target =
'hw/char/cmsdk-apb-uart.o' failed
> make: *** [hw/char/cmsdk-apb-uart.o] Error 1
> make: *** Waiting for unfinished jobs....

The compiler is correct here -- should be (offset - A_PID4) / 4,
since the A_* values are the register offsets and all multiples of 4.

thanks
-- PMM
