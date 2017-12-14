Received: by 10.223.159.74 with SMTP id f10csp6706224wrg;
        Thu, 14 Dec 2017 11:34:32 -0800 (PST)
X-Google-Smtp-Source: ACJfBouNQs8oKOiEGaisfJ5oipQ7p4N/sOCFPoD4AGKIMQD4gadsqWEDmhUAR0RVZD4NidV5DF2s
X-Received: by 10.37.43.10 with SMTP id r10mr5161034ybr.74.1513280072608;
        Thu, 14 Dec 2017 11:34:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513280072; cv=none;
        d=google.com; s=arc-20160816;
        b=MlYq1ab99S3KS6OSzPHR4r9/ZVf8pOlX6JS/7KLoFKOkoouUNqsnBSIE/4koWulhu8
         QnqIZWCc9WEo6YBnbCn5a4RODrohRxJMvTAc3MfX6yUj0/FvfcL7X6gDHQroI+gCAhsz
         sYMRsiHQAU3JHvKHTSs05klCWRRVMeuMt8ud/lIF6O7MFY2lcfj/x0AiiN0iXx6QnT+9
         5MEMAEEKLLlaqWeWGuJ4ZDWIWIYRQT6QFYRSt6iNJ97w6ANvs/UXlr2VPOj4x9rbXiza
         6ZcY/lFaRD4Rts8xM/sAPpZNb/g107gtg2PGPbzTm2MS+v/jewONN2o7F7OWemT3KMZi
         hu1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=LZm7VvRnoVX35uUkeqHoVova5Q/Vwj0t61ewOmTfKHw=;
        b=0Fsmma5nciC2hH+Pu8geDX1SunO7ji1Ok4a9+wucARO/Hzfvr87MWVx4TxD2yj1N2b
         Y57klfL+AuGBapJhMCo/E4wDQpZ9pAuN9SWJB/krdO/ma7kLDQJx7njVrLWXaK6rKEjM
         zDuBN+ir+xMI+JLOdh5ftEG56m5SVlNtu+r1R4wVZPX6S/B11botgmFoi5CUZzJotsAp
         7z892AtqlR1T6XZnDFPVeKLOqJo+Vasjm0TAPnYGPg3cIK0FI1MjoppublYUybBrvjJu
         BxRgN2xSBGI3faUCkqnNx20WD0rTYZcCoORousUXI3Oq6IKrx6NwuZrESe9zVU9NZFDA
         0tSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=F8JIglu+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e185si938182ybe.737.2017.12.14.11.34.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 11:34:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=F8JIglu+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42802 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePZH6-00053X-1s
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 14:34:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55743)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ePZGv-00051e-RQ
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 14:34:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ePZGv-0005Gd-0T
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 14:34:21 -0500
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231]:37832)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ePZGs-0005E0-Nq; Thu, 14 Dec 2017 14:34:18 -0500
Received: by mail-wm0-x231.google.com with SMTP id f140so13516807wmd.2;
	Thu, 14 Dec 2017 11:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=LZm7VvRnoVX35uUkeqHoVova5Q/Vwj0t61ewOmTfKHw=;
	b=F8JIglu+LEZumW+V7dv5TBsNBALoPyO10coLKaztcNu5ZZ5TrdmHuRcXvcPcHurT/D
	vlOywwFmLRqITFeHFe9YQhW9CkHMGk6BErLcG2n+Pq4ueD4LpyBKFWh/WoCIQedfS+hB
	K9fzOBfNTyO5YzHS98fAftiCER/slUIBqt8STXRIk6eG1PY5twKjBR76ZKmHGjh/t9dt
	I6XAHff0HW0wQzVXXLuj9DG9OO/gH5AXm1IcEGLDMRj4NZY8s89o3Xf95jlvwdSH45hG
	dINBFuLD4yi1ytALl7jdDSKFP/nV8bB2XMZ/nh4p/dZjyiMR3OZTv9xd/5COh27W6GBz
	mpFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=LZm7VvRnoVX35uUkeqHoVova5Q/Vwj0t61ewOmTfKHw=;
	b=ezLXh9AITpti018yYLva4jGZIgPFfHm7HBpM9K7N6X7GFzgNuaDzuISTcuESuyeXCF
	TwbHJwWoWd42YNa28/T51Xb3uwtxMWHvkJshSi7XpNYQ3G88+7URKz+SnxWQkmO96aYW
	4Hy4Wm6kI+DEUgUMHuIjtWdEWgElrao3n6JND/NUYpmV/Nu4PkJiAeWGX6C0HU+0GQNu
	q2RTA+n1AUUV1eN3YVMpo+zpEIFFM3GlXY7KYOV/N133Vvw8kQ/PurlDSFL+rFHra+GN
	SB4wEjG+PfmbyZO9ZVGU9eRU8jaXNC7JJxDWM8zsSHeqge9kiUOMzsosEo3t2r0XmdP8
	Fe3w==
X-Gm-Message-State: AKGB3mKLoOZ/gy9OzE9JWkHUV7wWC1nHcKIFpvs6Gg3GKz/h8qkMTseT
	HT0Jn6TdyGoAOJ1lZHjVJg6MGSEtyv295HCvwVw=
X-Received: by 10.28.136.66 with SMTP id k63mr3337487wmd.50.1513280057714;
	Thu, 14 Dec 2017 11:34:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Thu, 14 Dec 2017 11:33:47 -0800 (PST)
In-Reply-To: <CAAdtpL4gPTyMo-a0sNDN0F71wBca3gTfU0NBOr7ZHkmWDXwJow@mail.gmail.com>
References: <20171213195852.30439-1-f4bug@amsat.org>
	<20171213195852.30439-2-f4bug@amsat.org>
	<CAKmqyKNSGCndaHmpGPOYGX7jrVbse-ahT=dEdY9XQVm43=AYZg@mail.gmail.com>
	<CAAdtpL4gPTyMo-a0sNDN0F71wBca3gTfU0NBOr7ZHkmWDXwJow@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 14 Dec 2017 11:33:47 -0800
X-Google-Sender-Auth: 4nk_1-N2JTeAYL6UG6zaVX7Z7xk
Message-ID: <CAKmqyKPPC4Q1+ccPKw0fYxpXTrT+ui5DE-bVxiRanRhLpYof9A@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::231
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 01/14] sd: split "sd-internal.h"
 of "hw/sd/sd.h"
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aG0lDtpxAbXm

On Thu, Dec 14, 2017 at 9:59 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> On Thu, Dec 14, 2017 at 2:50 PM, Alistair Francis
> <alistair.francis@xilinx.com> wrote:
>> On Wed, Dec 13, 2017 at 11:58 AM, Philippe Mathieu-Daud=C3=A9
>> <f4bug@amsat.org> wrote:
>>> Now only SD 'producers' are able to use the "sd-internal.h" API,
>>> while SD 'consumers' are restricted to the "hw/sd/sd.h" 'public' API.
>>>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>
>> I don't see what this gets us. Why bother moving this code into an
>> internal header?
>
> This helped me to sort out the QOM design, however it is indeed not neces=
sary.

If it makes development easier that is a good reason. I just don't see
in this series how it helps.

>
> I later use the registerfields API to add a bunch of other registers
> and bitfields, so I prefer to still move the register #defines in
> another internal header, else this API header get pretty unreadable.

Ah, that makes some more sense.

Alistair

> I'll respin this series without this split.
>
