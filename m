Received: by 10.28.173.206 with SMTP id w197csp4065795wme;
        Tue, 16 Jan 2018 07:15:29 -0800 (PST)
X-Google-Smtp-Source: ACJfBot3328D+Q3LWuFcu/PvJ36zCuFlbLRIbjhiPAD1HROedXiVjVvW3NNHvkgYGNb1yEdr1NaP
X-Received: by 10.37.60.65 with SMTP id j62mr35980599yba.384.1516115728938;
        Tue, 16 Jan 2018 07:15:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516115728; cv=none;
        d=google.com; s=arc-20160816;
        b=TXDIIdRElHTlob205vlcajERgHL9yPDh1TGNU6SvoEU5Ht81EwKUV/xZmjTEPhA7vV
         Boxbqt58AxA4+5sNsBsyRQZijIsEXEwbktA77tunCxysrKhRTNzZu27zbZutvpyThUHD
         UlTqeMxeXMePcozrF43+UCZhQqRp4P1KwwuvVXuGJ8veBcrMEYufkaS6n7W7aRQwcCFb
         mV1DGyI2WhMU6KrNWGmcEz2nvX7iXICNHBOJMlexNpu4r6AmTrpnY1koFsIhpNoxavre
         BcoH8wTpcfLsmMAJxDw47d5vk0VnR/EC9z76W808wCp69ruZ7FB3WntrehifgOc7GeKP
         sj7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=yGxvn7pul+oSoatdNpezamW/1OOG6eHRZ5ZhF4PVFss=;
        b=D44UppiKUYY4zA7yQflFUNaP9kcgcdTu+wUoTvdVBvWuugmBqD56Lrlh9b1nBkWd+q
         jp/NFS8dgr0nWysTMA5zTZY4+K8mgwmh1mizamMzvgejy6v+nfbxRRKMRACSwjKtGCVr
         Hp61K+/tuERSs7L4Z5hibyO+RYCtuIAijpZrzK8/hedduVNPLy9wxWS2qpNhDh6PgEfr
         jJvDANutmwDfHqjoimF1rX2B8b9jOfPETVt8PpJOBbfM9M4Zn7/AsUSwzZroLCiRxWsT
         0SVwUuypSUk/VwVQBnDPviZ8ubfBEwrJ9pLpZTs/YdC/fSua7g1CDgAVnEk64+5eFXkW
         JpiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Yx/tPgg+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s15si636380ybc.24.2018.01.16.07.15.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jan 2018 07:15:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Yx/tPgg+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39955 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebSxU-00011E-AM
	for alex.bennee@linaro.org; Tue, 16 Jan 2018 10:15:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ebSQ4-0005Lq-6l
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 09:40:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ebSPy-0007uX-CJ
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 09:40:56 -0500
Received: from mail-ot0-x22d.google.com ([2607:f8b0:4003:c0f::22d]:40887)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ebSPy-0007ts-82
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 09:40:50 -0500
Received: by mail-ot0-x22d.google.com with SMTP id d10so13774707oti.7
	for <qemu-arm@nongnu.org>; Tue, 16 Jan 2018 06:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=yGxvn7pul+oSoatdNpezamW/1OOG6eHRZ5ZhF4PVFss=;
	b=Yx/tPgg+J2j38D/YuOPKaSAopuTrCQtLCMoeohK4IhIEJBoIvQxKZQC//BasoIJoDX
	eCYTDk62oNTAHV51f6jWRmDWikqsS7SYi/VnBIKSvwZYnPWWsH5fqsqHOlgJLm/Tk7Xh
	H6VHo6oSTWfec3zev7idWOlCXu1EZVxct+IAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=yGxvn7pul+oSoatdNpezamW/1OOG6eHRZ5ZhF4PVFss=;
	b=GyUUEgqvGGNrpa4r3iKbC1L1DW4uFbLd+OCkN+RfwHZE3us2YltUoxdnAeCpQF7Ns4
	aiP3RPFuE/TF+KYdhud/PeBMU8nA01ylwzM7UI3jGSswidstUbD9xis/sUI7KhvWcyhD
	wZWlvXVqxETgXrzVFXhqiANc22lARqtS9fIpH9+dh4W22RmIetFZw2Aet9Sobg1sl6yA
	x7qXJtBZ/YZtVDkHZ7vCwfwkH0IKeIeLErq7bUuo1z/ctHUr6PObbOkc9PIjREohKvpd
	zuShnF/Qs/je6jOPwUYQ6nTyo50h+hCWzAs6iZ+saFpwyDxBtLlpfJos4pQAh2hPZiN7
	BWKw==
X-Gm-Message-State: AKwxyteWZN/QaSiXuK7WYvHKEYrJLVmCufulJqMloOQ/TycjYyY8+WSI
	S75ILs8IJa/ck4C0q6a4tJEPbqTmcOpqlLSLwPs7bA==
X-Received: by 10.157.29.229 with SMTP id w34mr1004549otw.24.1516113649541;
	Tue, 16 Jan 2018 06:40:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Tue, 16 Jan 2018 06:40:29 -0800 (PST)
In-Reply-To: <20180116013709.13830-11-andrew.smirnov@gmail.com>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
	<20180116013709.13830-11-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jan 2018 14:40:29 +0000
Message-ID: <CAFEAcA_jtRZdDhOtGnL3aK6WGfBwTyq_QLKVWvGrXf9Wv5LuYw@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22d
Subject: Re: [Qemu-arm] [PATCH v4 10/14] usb: Add basic code to emulate
 Chipidea USB IP
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0Vce3wmBshq3

On 16 January 2018 at 01:37, Andrey Smirnov <andrew.smirnov@gmail.com> wrot=
e:
> Add code to emulate Chipidea USB IP (used in i.MX SoCs). Tested to
> work against:
>
> -usb -drive if=3Dnone,id=3Dstick,file=3Dusb.img,format=3Draw -device \
>  usb-storage,bus=3Dusb-bus.0,drive=3Dstick
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---

This looked a little odd at first but I see it's how we're
implementing TYPE_FUSBH200_EHCI, so I guess it's ok.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
