Received: by 10.223.159.82 with SMTP id f18csp2226430wrg;
        Fri, 24 Nov 2017 07:15:31 -0800 (PST)
X-Google-Smtp-Source: AGs4zMasdqkVTbWxyO5FYR2n/HQSozdkzt5dVkAbzmHFKSyQiH7CP1pVAo2JyPK4yET5ZHfIUhQR
X-Received: by 10.37.126.7 with SMTP id z7mr18346832ybc.250.1511536531317;
        Fri, 24 Nov 2017 07:15:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511536531; cv=none;
        d=google.com; s=arc-20160816;
        b=BnzvKeoJ/EwwJLPCRbjrUjrQmICqK7qK40/OSqBjyygZPR22KnOLjCCEEcGI1/IrDm
         m6m+Is9aOQUDExbj/PjgddWBZZoJVmzsSCzxrtonjeTiPtkibAcUwn5elEjG2BLTOXAn
         tiymMF7zRHoiwVyGBC+UcQ91vZn955usSZxOz418IEo905Im9mSiL5qy/AdiCbciZr+s
         iVdoHykTsoetfBoDVFFSAGf6GBipY7rwUBaiVhlTCR3h7U3GY39YJqd6skDj9tEg/wfI
         89y2zRbM1WoYdnWZpeI4EEYzyRQNHheoh7dQJLyah25FNUlxRy6B/zqnViwe0uCH5kQq
         pgSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=cZpR5Z6UOv9HXykEu2lbwKJEibxOmoJ2FnDR/C59HXU=;
        b=ptQBBo6pdEGlO+fyYoI8JA271aqvwy0vxATe3jjODuz7wDotHzHSPGvxAKYxGVXdbR
         YaVKC0FEIh46/SaEACE2NiAkcYMO6uAC+Upy+ymBxGQV0AVXLbSiuVMkJL3GRNu3HK37
         1TZCsadl/vR8GsSY4leamYkYqk2G4S5hor5RH+cX8EYPnApC8jEY9OTctnatnvPa0Not
         9yDMDO5Do+LH8gZcMRirlMJBZ4MunAJtSMDGZcRLVcE7PAlnzATn6q7gFgUZBTORBNt2
         F/+IEk8KWPJV/P5cu1QLxZi1X352c3xRaLZL5CJZke6RLb95eqhP279+cMkN60qfnUFS
         YV8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=O0/5Rrdj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e203si4746052ywe.583.2017.11.24.07.15.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Nov 2017 07:15:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=O0/5Rrdj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49771 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eIFhS-00036J-Or
	for alex.bennee@linaro.org; Fri, 24 Nov 2017 10:15:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43421)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eIFg7-0002Tg-Us
	for qemu-devel@nongnu.org; Fri, 24 Nov 2017 10:14:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eIFg7-0008VT-5m
	for qemu-devel@nongnu.org; Fri, 24 Nov 2017 10:14:07 -0500
Received: from mail-oi0-x231.google.com ([2607:f8b0:4003:c06::231]:33230)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eIFg7-0008Uz-1h
	for qemu-devel@nongnu.org; Fri, 24 Nov 2017 10:14:07 -0500
Received: by mail-oi0-x231.google.com with SMTP id f135so15276432oib.0
	for <qemu-devel@nongnu.org>; Fri, 24 Nov 2017 07:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cZpR5Z6UOv9HXykEu2lbwKJEibxOmoJ2FnDR/C59HXU=;
	b=O0/5RrdjhztK3z2Z8NpYgJs7SY/8nipEvKyDDxA0dfzzseWneo9GnxL4q2UE104Dhc
	AgNTabTrFcI9Z94vTOIYS8fdpsaaumF2H61+WHBLOl/dup+TnQ+etYPcKs481TcZm4QH
	njY+SzDXeJfnI1+hOGpqIkMkVfTkKBa3yZJm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cZpR5Z6UOv9HXykEu2lbwKJEibxOmoJ2FnDR/C59HXU=;
	b=NHSeDI3tfCM445MpV+zq6W3iuevgMgvCvYYBFjaRJkTk8JO3C/0iKsZ4FIeFYGr15V
	d3ZuB6lYTuY1ehU4zbVURB3wpTaEqMO+kX1Qpd223ZH+v9Zu7i/w5P/QtzVqEeKjFXhb
	8hTMTZkKMMWPgHpbGdAvstk+S6KVCO4I4gyUfEpWaMLEDuGhYQboB/qz6mGOapWFu2Wh
	k8J1wMl5cx5y3YBGHL/iWu1M3F06xDQ2repxJFFMWB+YcFCSSVVBl2b44VRxdAtUQ3G4
	2zY+gtGWhWVOcasxfYfCdWATsAEXu/dmnxZyUj7bHsl2wUg1vV1WhuW+8/aog+F7ZjZt
	8HIQ==
X-Gm-Message-State: AJaThX73DZBLYqD6PNYfz0Qpq/HOkreF1TAIOmjqB+K2kJeNzg2fKC0b
	3aA56jq9GHhuhjmASVWwS85Ma2HZOyJYFaBp1uGFPw==
X-Received: by 10.202.199.134 with SMTP id x128mr19114312oif.63.1511536446452; 
	Fri, 24 Nov 2017 07:14:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Fri, 24 Nov 2017 07:13:46 -0800 (PST)
In-Reply-To: <20a7f496-5f85-f3c9-646e-aab32bdfad0f@redhat.com>
References: <1511516626-21178-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA-Fjpg+KC4eUzupLFf7fAco2GDmZG8nWNqSARnn9vypxA@mail.gmail.com>
	<20a7f496-5f85-f3c9-646e-aab32bdfad0f@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Nov 2017 15:13:46 +0000
Message-ID: <CAFEAcA_4GcxNkWzZ=P1znV9Vv+ssnUo0hO9dqUHaKqkWLP6naA@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::231
Subject: Re: [Qemu-devel] [PATCH for 2.11] hw/arm/virt: Add 2.11 machine type
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FYruiCkbcZeH

On 24 November 2017 at 10:16, Auger Eric <eric.auger@redhat.com> wrote:
> Hi Peter,
>
> On 24/11/17 11:11, Peter Maydell wrote:
>> On 24 November 2017 at 09:43, Eric Auger <eric.auger@redhat.com> wrote:
>>> Add virt-2.11 machine type.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>
>>> ---
>>
>> Argh, did we forget this again?
>
> Yes we did, please apologize for that.

Sorry :-)

I've now applied this to master.

-- PMM
