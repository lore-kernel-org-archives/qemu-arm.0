Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2533046wrd;
        Mon, 24 Sep 2018 06:31:53 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61vr6O+9ZIg5WLemr/Gz0qpNQjHO9IroQ1JZjDFdjrVEzxkdeZREGC/IO1Ps/aUFEHICWx2
X-Received: by 2002:a37:7286:: with SMTP id n128-v6mr4783862qkc.124.1537795913247;
        Mon, 24 Sep 2018 06:31:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537795913; cv=none;
        d=google.com; s=arc-20160816;
        b=hUwp9KOHBgRrOlNpbA2dKvwXEZxC8XH4z9pSWz31JfoZllGHkRjZrd6241sl3YwAND
         TvIInagX/6msE3ZyJo/mwH66WHpsflRhu/EftGwGVLNooKl9bdk6MldYu274XMB5WSo+
         6pq2C3W9xCjACH1bioWiWOJsylUnxTUdSDzq9oO5r7ELeEljbMLj5cCEIxKNQP7mLsqo
         L/gT8eVkY5wjj+MfoQd20z/Lx7SNSo3d+QuYNRQVfi6crYLrfBLAV/IZ4GZCod/m/RKX
         6rO9NQPa19VhrB+vLcRP5yrmxRbzl/DZgV1FZF3n3KQG3o0HzUFMIYrJit7kn80NFnws
         fadw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=QNxnyfiDn+bd/2VfWu3OgshXc7XDVCbmQ11eUfv7E+0=;
        b=d87t9enOCTSXVVMM+QGu87ASy1WDaubPeZwokZ3f10048Q30wYg4s8V2NI1sPnLbIn
         oED85pBAWNcGL92nusqC4jiEZpFiUhiqDgs4eeQ8B75srtVXtOkduSDPq5lTotHmAbzX
         0oflUUo8s+BwMiagTCTU5dbx2wp+0guLqUb3sqqq8FwEd+CHBTwzjpWOFAqnttCI4ZXu
         KxOJ9OQM2xP8dGKm3R2kSiOozkqIwLfhgw118qWDYuo/vOhAMtA3iNTdTS9dtaRyfG4+
         +hR62IAoLEqtm9Ux1mmWsDudrLp/NOUVQnYmSeG0LkOAdlSEVRbQ3qAGk+JhPFMn0hj+
         rZKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A2lDUrEl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p71-v6si523681qkp.259.2018.09.24.06.31.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Sep 2018 06:31:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A2lDUrEl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45265 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4Qxs-0007Wu-RC
	for alex.bennee@linaro.org; Mon, 24 Sep 2018 09:31:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4Qxm-0007Wc-Eu
	for qemu-arm@nongnu.org; Mon, 24 Sep 2018 09:31:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4Qxl-0008Be-IO
	for qemu-arm@nongnu.org; Mon, 24 Sep 2018 09:31:46 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:41502)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g4Qxl-00087U-C5
	for qemu-arm@nongnu.org; Mon, 24 Sep 2018 09:31:45 -0400
Received: by mail-ot1-x341.google.com with SMTP id e18-v6so19828702oti.8
	for <qemu-arm@nongnu.org>; Mon, 24 Sep 2018 06:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=QNxnyfiDn+bd/2VfWu3OgshXc7XDVCbmQ11eUfv7E+0=;
	b=A2lDUrElO1Xw1NogHwfR7HBFvoHHuJAubOZX6bAsnEuk5GaZLOgUA3wpP7CmQG/pY0
	BsiJU2sA3CuFUrodIJ1XC/K5oPbK7ZO6rPMc9NkmLf64ZW59OLf9jt33auIo0gHvPVIf
	I3Lo/txyM7Bi6uAjMNdG5xlMnjJH57Dqt79eY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=QNxnyfiDn+bd/2VfWu3OgshXc7XDVCbmQ11eUfv7E+0=;
	b=kXTwBrwTPz/hNRKPASDxNa/TdmAWCtUMhOpdkMMB5Sv253sdcTEx/7uD2zoa0t35eB
	Zq/8RpdaINdgCfmCCi/qfkzmXb3s79+iVuoZFeYpfFzIOpvDgAW2vcEM3hnMVpto+ov6
	lhPvFM8NM7UYo7E7acI4TmIYDBTKGt3lsRGfrmPNdVUhdYA+wfNqMZuHWeET4RG+BfXa
	8NdXj5lFO46Gbn00iZ2BbnAiPUD+qgqA6i52CQ87EdXdblKhhZ82Qjo+NWCda4OyYSbk
	HeT9TzBjk6goADnuAdR0C1EzzjIKxEm8XZCSoAB6pn4KFQSqf+UxwZMw/XEcAvphjDGd
	m17w==
X-Gm-Message-State: APzg51CWrfqlfJajXAbjdhLGoWPnoU7jbvIN2fI0I0nOw7WOsAKsj1eZ
	pbWZZI0Hfr8IfalpUsE7MXeY82N46yL7IrIdHH2gwg==
X-Received: by 2002:a9d:730d:: with SMTP id
	e13-v6mr6955609otk.203.1537795904398; 
	Mon, 24 Sep 2018 06:31:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Mon, 24 Sep 2018 06:31:23
	-0700 (PDT)
In-Reply-To: <9cac65c1-5e5f-ccf7-072f-c8a0ac5c024e@kaod.org>
References: <20180831103816.13479-1-clg@kaod.org>
	<20180831103816.13479-5-clg@kaod.org>
	<CAFEAcA-C05P6dBwSr1QBJX9-B+QCy3LCvqKM+uZnx5NP-7BU6g@mail.gmail.com>
	<ce8fb63b-50d8-2d05-67a1-c89bb2e06e9a@kaod.org>
	<2d4a3e71-89d4-ccb0-59e1-a61503569667@kaod.org>
	<CAFEAcA_LsjvJGi8v1Wo0g9GfTFVVo8mzy_WcdkcHb=duwHQ9OA@mail.gmail.com>
	<9cac65c1-5e5f-ccf7-072f-c8a0ac5c024e@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Sep 2018 14:31:23 +0100
Message-ID: <CAFEAcA-0ik-TxyNpFp9-pfYGhnz7sjRH9ykY6ytQ2h16QjMEbQ@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH 04/11] hw/arm/aspeed: add a 'mmio-exec'
 property to boot from the FMC flash module
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r/qzgsLN4Csf

On 24 September 2018 at 14:28, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 09/24/2018 01:41 PM, Peter Maydell wrote:
>> On 19 September 2018 at 11:19, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
>>> These are the number of read operations done on the flash memory region=
 :
>>>
>>>     922478 ~ 3.5 MBytes   OpenBMC U-Boot
>>>   20569977 ~ 80  MBytes   Mainline U-Boot
>>>
>>>
>>> So we are trashing the TBs I would say. Is there a way to increase the
>>> TB size ? or some other TB parameter ? Is that directly linked to the
>>> instruction cache size ?
>>
>> Well, execution direct from MMIO means we read each instruction
>> as we execute it -- there's no caching of TBs. (We generate a
>> temporary TB with a single insn and throw it away after executing
>> from it.) This is because we can't be sure that we would get the
>> same data value the next time we read from the address.
>
> In our case, we should have the same data. So may be I can introduce
> a read-only region with a cache to speed up the accesses. A bit like
> this was done with the previous mmio inteface.

Yes, this is in theory possible, but we dropped the old
mmio-exec interface because it had some nasty race conditions:
the problem is being able to be sure you've properly dropped
the cached TBs when the device contents change.

Which flash device is this? For pflash typically the 'romd mode'
stuff suffices to allow execution as-if-from-ram most of the time.

thanks
-- PMM
