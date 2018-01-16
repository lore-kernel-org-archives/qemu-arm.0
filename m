Received: by 10.28.173.206 with SMTP id w197csp4079783wme;
        Tue, 16 Jan 2018 07:28:41 -0800 (PST)
X-Google-Smtp-Source: ACJfBouSs/BQ5IKN5dwfT9DnykQrvyrho1vaYvfKhsBjScP0amzwRReDMI1ZBhxc+4ymMbnrHgLB
X-Received: by 10.37.52.22 with SMTP id b22mr19251186yba.275.1516116521438;
        Tue, 16 Jan 2018 07:28:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516116521; cv=none;
        d=google.com; s=arc-20160816;
        b=wYpQc68VGbDGifA2ZYWiuL1DnyQMNSl2AwRTbBHxY1SkVCnxfzZ3Lu37R5xYORYitZ
         Dn/NMhodhbniCRjC7X5gAqvyWr7OgRK++d+cAT5Td/2DlkyNIlSP9y61r6YNTwhS5XSA
         gVdiBrFGHwf1vpLZ05iMMPMJworZ5p5TYS/EJFhgSdHS3B5coosMP02a/2D25WUrVC3A
         wb982hYUsNjVZlmp4H+7Y6Hscz9M3Xgllpmlqz66z+D7mXDOKElH1cbyCDkVoH49SnpC
         zu8F7SGcP8E5+WbJoVct57ffTFY0ry6OxEuKbnkXD3KTHno/kIVHxTadPX0Z+Fexwh/v
         2ZhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=lptCz4O5MsWlmuym8VSu5G7RkBF5rkYQy+GrdXszsE4=;
        b=GoEjlWxAFBLJUpX7L8wJgVNcjhhXgTKTWgiLgnx7XcWdg7WNf5UqYoK0XCGMIWliRO
         nXTHvhT2wN5Ro62cGu1QTU8tMMJKdO4ofAKGGh9vyXGPMZ1YVD8UWY84y5WJ6hu8kE8h
         xYLxOz7f2sSqnbEkJhJBNoO3dH8j4xHaPWoN1jMMJQfQVuLbjTDruK5fxPLaiXBZtUt8
         Xd/s+Alj/A1cIlpX3UZuhDHwARiAV/2r26We/wra8LUmGEN2TbcS9taDdaRiivEwjpX8
         HxkpuwBH8apndi6OpJN9aF5B32GjotE9hm1AyftdQqVVzoN/dzajCpp3Ze7G8huWPe7i
         ZwOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UTCGK/3h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i138si586382ybg.523.2018.01.16.07.28.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jan 2018 07:28:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UTCGK/3h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40762 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebTAG-0003ht-On
	for alex.bennee@linaro.org; Tue, 16 Jan 2018 10:28:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ebSQe-0005p9-RC
	for qemu-devel@nongnu.org; Tue, 16 Jan 2018 09:41:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ebSQe-0008C4-6L
	for qemu-devel@nongnu.org; Tue, 16 Jan 2018 09:41:32 -0500
Received: from mail-oi0-x230.google.com ([2607:f8b0:4003:c06::230]:46745)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ebSQe-0008Bq-18
	for qemu-devel@nongnu.org; Tue, 16 Jan 2018 09:41:32 -0500
Received: by mail-oi0-x230.google.com with SMTP id d124so10731778oib.13
	for <qemu-devel@nongnu.org>; Tue, 16 Jan 2018 06:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=lptCz4O5MsWlmuym8VSu5G7RkBF5rkYQy+GrdXszsE4=;
	b=UTCGK/3hZj66KX/1JZfU3nV1Cf3MXk6dvb4+lEAx1M330oORE4xwfj/RuNEUur5VJv
	ik+TwGnEF7iJSLN9h/oJ7ZiEOe1Gpgj3dSl9AHR0Q7E7wmzWKqCrMNPeaYwHPjliOn5f
	EmmvuIURHzTf46EkGBJopLhTVgTx8v5wimdtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=lptCz4O5MsWlmuym8VSu5G7RkBF5rkYQy+GrdXszsE4=;
	b=U/kafWoDM1zQozolaiWyWwV7fDPvcKTrVOsg6UcPILe+OpPtMj96XGuNX+QOQh7Jwp
	zuJenDyt7SzXad0Wao5+15SlrywR5MuHZm0LIesFSP/TdQlarHIa1bYnxugXskr8oA0o
	a15YT7dsWjdgCFqVJFJl8+YDbeSwZMj8r7QjssYoN49gN/EGBYkSumcY3CKP9Fuyrbp3
	xgK9RGtzXyyCM2ba9gErB7oaO238kwaP38FfLD4AkGlH2sc75nij4QxuIkLMy76eCvmX
	53h3u6wAmehe6A4/BC5Dqe0r/Pfl2Z5BnsA5gzesEFeBJ9RWV4mxGhMAv+IG8wosrJEd
	v3FA==
X-Gm-Message-State: AKwxytdCDJRUETohDDfNAOS4NPKyw4TgslZ8NGodTmIYTq+53pI3ykuD
	j0bu9bhRs+LIGG/7onyn9f9cB5XLBosJG6H6O0Y+cGxT
X-Received: by 10.202.244.131 with SMTP id s125mr13757939oih.327.1516113691202;
	Tue, 16 Jan 2018 06:41:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Tue, 16 Jan 2018 06:41:10 -0800 (PST)
In-Reply-To: <b085a18b-84f4-6695-f664-c146ece47eee@amsat.org>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
	<20180116013709.13830-12-andrew.smirnov@gmail.com>
	<b085a18b-84f4-6695-f664-c146ece47eee@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jan 2018 14:41:10 +0000
Message-ID: <CAFEAcA8xN1d-oX2RDqg8go1S6396w6-W46+0TF2d_d3k+cOP7A@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::230
Subject: Re: [Qemu-devel] [PATCH v4 11/14] ARM: Add basic code to emulate
 A7MPCore DAP block
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Jason Wang <jasowang@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: knqmD+biNwH1

On 16 January 2018 at 04:32, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> You can just use add this in fsl_imx7_realize():
>
>   create_unimplemented_device("a7mpcore-dap-container",
>                               FSL_IMX7_A7MPCORE_DAP_ADDR,
>                               0x100000);
>
> to register a background region for the DAP (see "hw/misc/unimp.h")
>
> as a bonus, running with "-d unimp" you can trace the DAP access.
>
> So this model and those files are not necessary.

Yes, I think this is the best approach.

thanks
-- PMM
