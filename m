Received: by 10.28.71.27 with SMTP id u27csp4352388wma;
        Mon, 12 Feb 2018 05:00:20 -0800 (PST)
X-Google-Smtp-Source: AH8x227wHD7L5aOh/tR1kkfZLpBx0FNI5d24bQ2g/FVX32q7t8qGo3Gd21OGB7o6XbqJ5zqxmYny
X-Received: by 10.13.255.193 with SMTP id p184mr3073165ywf.360.1518440420029;
        Mon, 12 Feb 2018 05:00:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518440420; cv=none;
        d=google.com; s=arc-20160816;
        b=mvkcqE+gInUmebzDxxtL4lA72wb6ECB8afMvHOvc6DmQL+gHAjhfdxkJDioVCGfvTh
         fMnl65iNc0sreWzC6jcPoLCCRg2EDIwKhqs3KWAEiQpLFi6ob3xUgp+PSIuV2jpmTOOY
         z5dxlShiJzyX3iozwQOGtgvZaJf7rV5mK1YUOfvkhnT6hN4JfAoLhRQ4IFmV3Y7Fuliu
         f0E4Ykcc7dnjEt6GLuzx0GSwy8IL3EwoIC25/b+hROIMYAwHsokvaG4qWuA03NfbWEyc
         QUMhH7FC9+0wLk0ZkMbUmfsmJdVkPx5V/uLWHFt3SPZ0E9VL4/R1+grbBGbObTOtNg57
         WjEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=OEtEqh26PO1LKdCEIX0XA2YG6tLpoaF1xBbaxb38M70=;
        b=knmOv+i5GlNiqoKTlRBbse0r+dN99V3CP09g4+K2ciIGVfP/Oo+U8vsRaUvv0Drwa3
         ckO4pZN+QDKCT7NELH3EEnJOFTtEDF4FpYQ1eJtkrZZriUkO3BKIczQ3B0tAZMkJbxCI
         zl1OWWiw+hCTD7fau0egIYqdcoqMZw7jU6NMwTtPP3JgL45Fh2OS4+7WXQOrsF0Dm/Gk
         KU9T/4CrZ6IAHxrbCK2xQFL1gwPA1vgQsd4Fw2Ek4XNwnqsRsZ4X1qWtJnTAm9ibwz7X
         l5LIE1QZnWODrBxkssTCafH/JFy5QXX901gcj8c2dUZLPn3Jn3BpzQqce2aUzS7GpE5D
         3PqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aNuFwRRU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e9si1488024ybk.558.2018.02.12.05.00.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Feb 2018 05:00:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aNuFwRRU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55949 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elDiV-0003Oe-EQ
	for alex.bennee@linaro.org; Mon, 12 Feb 2018 08:00:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37262)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1elDi3-0003CP-RC
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 07:59:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1elDi2-00074P-Ji
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 07:59:51 -0500
Received: from mail-oi0-x229.google.com ([2607:f8b0:4003:c06::229]:42130)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1elDi2-000733-EO
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 07:59:50 -0500
Received: by mail-oi0-x229.google.com with SMTP id u6so11089223oiv.9
	for <qemu-arm@nongnu.org>; Mon, 12 Feb 2018 04:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OEtEqh26PO1LKdCEIX0XA2YG6tLpoaF1xBbaxb38M70=;
	b=aNuFwRRUwjfLdc6K0UM783ld6vv/elIayCkJBcnm2IzuUPOpaYprINCp020Lq3Ow5p
	k5yG+rp0+GryxxXNNL1vBef0AlNpGtMNnntDxQQCxGc8X3b+3cbQG/xzyXdO7++l0+hX
	ZvsENXVwXFuA3IqO64daZDqPsIPVpL6Tdf38Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OEtEqh26PO1LKdCEIX0XA2YG6tLpoaF1xBbaxb38M70=;
	b=KJYBmRq+ELmbQdd3VTdyCP/NJRRnPQZU4c4RflrkqEDVFr8N9Rnk+sTEoD3wuDMEXT
	odvrKC17/9hXKifF6FmavL4Cx2IXdKDzkIcsZHQelvP9Ye1IYeLTvEdoB3zV4VuyTcof
	90r69EAIXZVJwUlubVy/GBwsQM6tUHboVFFFB4zTgtDYPjcfVXstO9qnZRLXN0ahkRcI
	9UgHL7tmD0bB5guTxgpvRqrSqG2g4Coa69DIl01YR2h8sB7G6rHekNrbSQS1FcCsAm1O
	pvjLTaQ0dFUiYTn8KWOipAHTFsBQvtqbSXGSv6s0TaDfYiwedwrv3C1i+YI5Y3rQmTzW
	v0TA==
X-Gm-Message-State: APf1xPAGn5Xp67DanwvqB3YZb6oMXJ92HoBgJKkLFxorAkvT4ssg6hPf
	nwGtarBfjRRYLFi11vyoyYGYLRSy1jSan6cknQW0vA==
X-Received: by 10.202.180.136 with SMTP id d130mr7991781oif.328.1518440389585; 
	Mon, 12 Feb 2018 04:59:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.34.163 with HTTP; Mon, 12 Feb 2018 04:59:29 -0800 (PST)
In-Reply-To: <5f127fa6-170c-1bdc-17e5-7c41cbe6ebca@lauterbach.com>
References: <d23a2730-a103-6336-0658-e12fa9b0193f@lauterbach.com>
	<54f41a72-7b70-e5a6-d65f-ccce8a93f948@lauterbach.com>
	<5f127fa6-170c-1bdc-17e5-7c41cbe6ebca@lauterbach.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Feb 2018 12:59:29 +0000
Message-ID: <CAFEAcA8dYZUDS6xwtfN=yBCKgyfOSRz6tQVx6HeLMYkcC5S37g@mail.gmail.com>
To: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::229
Subject: Re: [Qemu-arm] ping Re: [PATCH V2] target-arm:Add a dynamic
 XML-description of the cp-registers to GDB
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
Cc: Khaled Jmal <khaled.jmal@lauterbach.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5AmMFM0O5CVV

On 12 February 2018 at 12:07, Abdallah Bouassida
<abdallah.bouassida@lauterbach.com> wrote:
> ping
> http://patchwork.ozlabs.org/patch/867467/
>
>
> ping
> http://patchwork.ozlabs.org/patch/867467/

Hi -- thanks for the ping. I've been a bit busy recently but this
is in my queue to look at and I'm hoping to get to it this week.

-- PMM
