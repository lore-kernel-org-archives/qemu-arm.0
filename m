Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4213088wro;
        Mon, 29 Oct 2018 06:25:13 -0700 (PDT)
X-Google-Smtp-Source: AJdET5e3YtanQSKInDhg4CP/Ex2NoPQQpnLvMMzpPSXFalfHKGzqnQDc/FutSVA4ZZwNWxjZa2If
X-Received: by 2002:a37:12a1:: with SMTP id 33mr11572355qks.189.1540819513486;
        Mon, 29 Oct 2018 06:25:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540819513; cv=none;
        d=google.com; s=arc-20160816;
        b=GfCGwi5H49yvmd6lhk2P9bgFs1/EbljKbFM7Ua+ghb3sNUMHuUKRU+j79nz1GuL4KK
         KRdMKEG/bQybcBIaZWWLzm+Kb7712hyCGJR5UUhgykGZmvx45FKHUJUsgBX4yWwgvJSN
         h9R2kXmQJfjKVop4ZZA18rG++Oig+XywKUwpiNC68mjNjgpxa1IX5cBP9Cl+0DHucamh
         rQoRP8QGfD0+VVR/pjkqzhpWrMEz/olcFQcct83iiYLNrLjpCj+7EJXbPSmMVavg8SRu
         CYjqTzVEHzllbuvOu94FMv3QZ3S/qtpmZH/F983zAkl7kwjD7tza5jSurYziOXxNOILb
         Xg4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=XI7846LV+74G9lGTdm+pUHKXEFq+9A5OBB4vMRQrSNU=;
        b=xV19MolDYZ1QPzgYDcGiPuaN29WYhvD+3dqP1+6dOklFsClBLcMkEOvPlkqiwIk6Du
         RNhJMoe4pp1EafYKJK1KIFiLY2xEGM08708BdBhWV/mbv0tv0NwRncDHa4PzcxV7epXV
         6Q/O6uiG+w+NcG/XXNEtIRpIwRW+IkRS96Z2HJYnzsmiVmdANdyhozicUuEJqVbWrnxB
         2faNPaU9r0YYCL9YvrNQRcXtdNKoH+yb0IcvVEFXZ53uQDfCsLuJsHYAbFkHQduy+av2
         iPnVnJPBfvAmU9PlAXD+h3RfTzQTxpIKM+FXzbuyxUR1fkcM9znKZuzHkXrPg7EAJWhq
         rrsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h4yeAUyX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k26-v6si170158qtk.49.2018.10.29.06.25.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 06:25:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h4yeAUyX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45574 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gH7Xd-0004Ig-1g
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 09:25:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gH7XS-0004C5-9A
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 09:25:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gH7XR-0003En-G9
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 09:25:02 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:42838)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gH7XR-0003DD-8X
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 09:25:01 -0400
Received: by mail-ot1-x341.google.com with SMTP id j3so1675154otl.9
	for <qemu-arm@nongnu.org>; Mon, 29 Oct 2018 06:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XI7846LV+74G9lGTdm+pUHKXEFq+9A5OBB4vMRQrSNU=;
	b=h4yeAUyXncqzba/Qt49VXT0pzCMTjl3h3qxKca1kg9PeSu0pp3/WahLS1lcQ7d03D1
	k9JY9fKVnY8hb6COwikhdyywW2bznqfxs+fO7qcRPeq6BwSMYHsO9SGjh0qlZ2jSrUFb
	6cUwvYxVQIMG7HYUjhj/7jakGONN0/2cSErwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XI7846LV+74G9lGTdm+pUHKXEFq+9A5OBB4vMRQrSNU=;
	b=ceh6q1bZY3SM+7eq5smwHgfC0jIbxkdAtexiJzo8w6XU2NR5jjdthB2tZ4xO+Qnvn6
	xcztYJJpEG8N3svpYEAlxU9sAFesNoWsfWmhrMJ0rH+9BHIzpK+lHGUu6vznSrlbk/Tq
	Fv6eAdqyV+OkSxHraj+R8L/e9nfzChK9uktQwy6/8pJdbZdmy3fe0mG/QQmVB+1O4WlM
	Cw378iw0KCJVg0kWqlM1l4FPG+/n9UGwt5CGi+mhE0ja5sEdV4IpcGwnH76amOlgTbql
	xYrJmL/ZnN6o592ryftixyAoNhHZl/heNufdxRKtrrSvuy+HOHHinpPLKFL7b4F4cpJV
	V2Sg==
X-Gm-Message-State: AGRZ1gLaGNidCp3gVecLlia29XXXktXrj1GV5nMWVvsfxSdUxLyzLMeN
	iX4IBJGRj9J0/8dg24aBcvvQrSdAskLCh7yxWUswOQ==
X-Received: by 2002:a9d:217a:: with SMTP id l55mr4800384otd.316.1540819498088; 
	Mon, 29 Oct 2018 06:24:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Mon, 29 Oct 2018 06:24:37
	-0700 (PDT)
In-Reply-To: <7fc49925-36ff-bd9a-0cd7-e5f8d4bb3672@roeck-us.net>
References: <1540548409-22560-1-git-send-email-thuth@redhat.com>
	<CAFEAcA8EubWya8ey9VxhaCw4m2U=KA+i2C-R9P-p+P6oEBBLew@mail.gmail.com>
	<7fc49925-36ff-bd9a-0cd7-e5f8d4bb3672@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Oct 2018 13:24:37 +0000
Message-ID: <CAFEAcA-UF+SyXvcU+NGZsbqBF2qg+s_x4HPU7yvf7B2G-=HPOg@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH 0/2] Deprecate the "collie" machine and
 Strongarm devices
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x2xJ0dvybCDt

On 27 October 2018 at 12:04, Guenter Roeck <linux@roeck-us.net> wrote:
> On 10/26/18 3:12 AM, Peter Maydell wrote:
>> Hi Guenter; there's a proposal here to deprecate (and eventually
>> remove) the 'collie' board (strongarm) from QEMU. Is that one of
>> the ones you're currently using in your automated testing of Linux
>> kernels on QEMU?
>>
>
> Yes. I can run the test with older versions of qemu, so it is ok for me
> if it is removed (as long as that removal is not backported).

Mmm, but if we have an active user who's testing them then they
probably shouldn't be in the frontline of boards to remove.
Which other boards do you test with mainline QEMU?

thanks
-- PMM
