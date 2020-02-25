Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1530195lfg;
        Tue, 25 Feb 2020 03:06:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqyRg0CSW9MVeLfuqmp+3st/ORmWrrUxlZ5vRlYsaqLZhrFBpIl53OOsvyAY3ookserH0ns+
X-Received: by 2002:ac8:540f:: with SMTP id b15mr54356480qtq.237.1582628773265;
        Tue, 25 Feb 2020 03:06:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582628773; cv=none;
        d=google.com; s=arc-20160816;
        b=yCvhkWmqmVvO8dRHx/7yfWgjfKLBaz1SeiyEbDKkocKCVbYlu/wjc+4hUFta/hPjE5
         KWktR7LYW6ZFTvVRbhQ8NJPGYw7LEofROiXbzD9/NgskEUj7u4j/JzwH5MN1SzNIDXyf
         JfViPmyyylqy6MyL0n834MdCCLFPtwW7Y9semHulldv7aVtmGPBqfIvCRKz9xVCd4C1u
         2z8/NuRhrxlQSm0cncQq++JKU4WHzpziUSgQF7dZMsQaahP0i5c7wtmIViH3Hx2S6ImN
         RYNFS1PvR2ogJizdA+BW7GCxGwxnLG2pykDrPdQjVzN2zp2Znvi5YNCDhkm6l8WhU5+p
         8zxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=sPMT5lLww8sn6KQXdmK5RG0zQHooqw/FzKY9qovBDZU=;
        b=YElFxyjOsrELQYXILZ7YdL784ObUjdL7plms3zFEcqWc8/N1akV6AUzYNPAdm01oCs
         0MYzLn7AxMS5ivfLzFcZnx/sFOVIeZL/UnfHLnw041IF+TeorCX80qhFjbwb9PtFBUY5
         I/SnzouIccZc0M5rRhI4DiiFFDdy+uu69v5BGrfxWtJwTZW8gjCZAm7Q0/SEPI0ZYQl6
         dpQFHoHq/ukoy0U1Iofe6rl/mQjvMajfo4FuNZhp8SVQ4ncYxsdjuFGhvVKJ5UG5w7E6
         TROLxYCjE9+oslKcSKHaMdl2SleN5GFUbqEI9kLdvwbxXc7sJxpraOQ+oX5pDRrgQVYP
         sGbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oNMk5GPH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fb19si6601003qvb.115.2020.02.25.03.06.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 03:06:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oNMk5GPH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6Y2W-0000vt-No
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 06:06:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39358)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6Y2N-0000tY-RS
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 06:06:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6Y2K-00017r-7q
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 06:06:03 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:37848)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6Y2K-00013p-3S
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 06:06:00 -0500
Received: by mail-oi1-x242.google.com with SMTP id q84so12163160oic.4
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2020 03:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sPMT5lLww8sn6KQXdmK5RG0zQHooqw/FzKY9qovBDZU=;
 b=oNMk5GPHwq8J27CefX297ad2c2zlknEFrS9FuhE3zX4OL6isFjJi8piRQPeR4vYO07
 rHvtvhm9M5MZwW6nEG60vNM9NBwOOpqjQj4ELwp7wPSNKO82I6MS63qqHjO4ltb0w43c
 85+qFdsUmHtY0NakWcPZZkg1TMQuSo5g0LPtmkA5tYeVSs1zg/7JzbMfsTjisUpCbpL4
 jvHccrQxF+eSNmu4J8hLB3HThV4HiQr8nFXlGQ+zKVDcYE39/nvPuQEOHEomJCIwZ6Rq
 7u43KibmujBr50m2CUQI3UZz7ndUWEyfbMEilXAk5fn9MoEyOe1KFHlM6i9/TK9OYJ/l
 OfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sPMT5lLww8sn6KQXdmK5RG0zQHooqw/FzKY9qovBDZU=;
 b=io5zIZS7Kx6vhYblJb+1/fnRxfY5/cyCGNPFoXpe5NZmWB5qGqFM4UYAUfbYk3CK6k
 We2qr9NStqwP6hXI5S/F0K844T2t1v0bAsFS7tWNcXV6Eub3e08/lC60WbCi1RhYxUSm
 j5qJ4XR9yw1FdkNut9o4xfF053j5w+incMgi/tYbLqU2rdHZpPd/z9pViSKaNjuHeKLZ
 dUUlhXTt3n/Z9JBwB6wu4kCCRQ/Yd7tdMRHW7jB63sJCE9bmxGduLD0poLKSWSIA6PO/
 pUaFrgmc2omloyklTlyDWRHcQyzQj+K87rW31CapBtRVhVpGXoOTkkMcBtj4/QkdAMDu
 EBlA==
X-Gm-Message-State: APjAAAWX/BFaJesFd3ewCJm+e30V+ctJ3c6dX91ldvzUF/WkiS4dQGZG
 2BoGaDt4C8T4pONAoIplkWi3GOQj42cEt0E2Fup63g==
X-Received: by 2002:aca:3d7:: with SMTP id 206mr3013715oid.98.1582628758956;
 Tue, 25 Feb 2020 03:05:58 -0800 (PST)
MIME-Version: 1.0
References: <20200224222223.4128-1-gshan@redhat.com>
In-Reply-To: <20200224222223.4128-1-gshan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2020 11:05:47 +0000
Message-ID: <CAFEAcA9+xfBZRqaO1KTaP6JAYBMighs=RnuGug_brROtXr4s+A@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm: Use TYPE_PL011 to create serial port
To: Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Shan Gavin <shan.gavin@gmail.com>, leif@nuviainc.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AhLpsQDrvnNl

On Mon, 24 Feb 2020 at 22:22, Gavin Shan <gshan@redhat.com> wrote:
>
> This uses TYPE_PL011 when creating the serial port so that the code
> looks cleaner.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> v2: Improved changelog suggested by Phil



Applied to target-arm.next, thanks.

-- PMM
