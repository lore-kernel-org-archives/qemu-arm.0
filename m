Received: by 10.103.98.197 with SMTP id w188csp399785vsb;
        Tue, 21 Feb 2017 06:04:14 -0800 (PST)
X-Received: by 10.55.48.143 with SMTP id w137mr3155345qkw.156.1487685854652;
        Tue, 21 Feb 2017 06:04:14 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e126si15134979qkd.333.2017.02.21.06.04.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Feb 2017 06:04:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45654 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgB38-0007Sw-4N
	for alex.bennee@linaro.org; Tue, 21 Feb 2017 09:04:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51188)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cgB1r-0006fx-OI
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 09:02:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cgB1r-0006Tw-0n
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 09:02:55 -0500
Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229]:34721)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cgB1q-0006T3-Q3
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 09:02:54 -0500
Received: by mail-wr0-x229.google.com with SMTP id z61so82459535wrc.1
	for <qemu-arm@nongnu.org>; Tue, 21 Feb 2017 06:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cYOMrx/YbIiJ4aIEY9EF42sq0+nJjKmmlR6rQHd3cAA=;
	b=AVO9WdhJ1qzhngZU+pDpI3ax9N5PbYQDxG29CV4eLkz9ZqioOv75VIi6jbEAmf5H22
	VkJc9vvKlmDsd5Zt+FmuF/BiRfvHmaTZqE+E5N4IixidtCrYiYnIvD/s9WpdLZHO625V
	Cs0wfC/Mil3w2L+NvwWdN9NCn0bfnC4p/E53w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cYOMrx/YbIiJ4aIEY9EF42sq0+nJjKmmlR6rQHd3cAA=;
	b=GVUHDDoT6ujJTUjxWVNsSkXv51H6WdVhpv67gVo9hc+mVceW66nd/sYq7kahZxaVIL
	HcZ2tHv/XN6us1YYiWQSgMj1kDHGwD+tds6sRtPlljHs/vUasflu5FkoxYt0M0cARzoh
	+x/YzFDoz3eXOCUTithBKUBiko7FfeuIL6T5jLWXBQCqdl/3BTU9hwzCLOppVAx2gsl/
	COPExBcOGXDHuzJIbY2GDIRWZui1fEYQhF6v6dyg8Jif1ECVUgbThzugRUxylYo3KK0f
	npUYjolec7N2oyqqVr8RRO7rq4Q2dXqZIWmRTl02O+Ig8yfdaZGhmc/5CEvRqNP09ykr
	0mhA==
X-Gm-Message-State: AMke39kHpuEQPtuQMWzin/4Wtc3gAvr3qfg7DPRTCjSU5/8rYREdL41HGu1fsBdQmXNDr1mmemRaWEmo3hQvFVRC
X-Received: by 10.223.152.241 with SMTP id w104mr10235657wrb.151.1487685773428;
	Tue, 21 Feb 2017 06:02:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Tue, 21 Feb 2017 06:02:32 -0800 (PST)
In-Reply-To: <1487681108-14452-1-git-send-email-eric.auger@redhat.com>
References: <1487681108-14452-1-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2017 14:02:32 +0000
Message-ID: <CAFEAcA_MYmGBwPtVXFvywjp5DQ-R+opo2nvVJbHfASwdY9Do-A@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c0c::229
Subject: Re: [Qemu-arm] [PATCH v3] hw/arm/virt: Add a user option to
 disallow ITS instantiation
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijay Kilari <vijay.kilari@gmail.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jwau/v2COZRV

On 21 February 2017 at 12:45, Eric Auger <eric.auger@redhat.com> wrote:
> In 2.9 ITS will block save/restore and migration use cases. As such,
> let's introduce a user option that allows to turn its instantiation
> off, along with GICv3. With the "its" option turned false, migration
> will be possible, obviously at the expense of MSI support (with GICv3).
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>



Applied to target-arm.next, thanks.

-- PMM
