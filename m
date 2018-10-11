Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2729344wrt;
        Thu, 11 Oct 2018 09:23:59 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62cSAF5L+NnxG+iwHL3l3uNk4oRvnxf9IxQvrPkEDYg+gzujPXaq23j95KvPbs/bVL8NESb
X-Received: by 2002:a0c:ea8c:: with SMTP id d12-v6mr2288372qvp.100.1539275039117;
        Thu, 11 Oct 2018 09:23:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539275039; cv=none;
        d=google.com; s=arc-20160816;
        b=j3N5B+MGsTS/WjUnbuILTtw+9fRWKbJ+zckWycQHyrRp6B2ocYTniwDfntO0UeLCiK
         CaSR2vr8nqo0ff71ISa3hQpBnTunZsU4/CQwNr9Aj/flP38/OzpweuXZ2lSrQUgHNfdx
         ZWOvBJ575BD/O3raeCU7e+zclJZq5gXRZ8eNjyI0ltuQBgn3aQ3CeZ4E88HDqOemb1aO
         CvCPt5lM89ihVgA71yhdu3kSqrqyzf5uOJRkfynBYHOltO4JGf3VX90TFDzuNLNY+hay
         I4DwbaxDr912fQtHVzb1CNqP/Ncpc59UKZ6gmVVQdZ74xJ6rPYvPacjcGAzhu9HneJXY
         0x5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=gimnkCYNLVB14HAnV7eSWYMT+/M2HNaJdrUcOkdUySI=;
        b=bJxITo5ONYIkXZTjRCg5dMQwCKIxcAQdI/Si0rqj8+IT4sTkhOxUM+79psmkX9+UZx
         ON69WMl6+tR20kChVuruppySVzoXYWJdi1F6JSJfa3rH6zNyuNo5XUkHZch/KW1whO2Y
         J/IeeHGwoaB5HbOsAShlDBwgmWfAFdavz/pyX0muHqyBgI9GF+firnNqtbSQV2+HSLJM
         UHOaQglb0CySZqjMWpP5067k9KXXnn/IXYBpbp1wD00WsO4ibLPaSv1RGW8HYINdUHeg
         rOy/8iehepJ/e6AkNlN9xXj2GYQ4p76lsorr0TA/aFEHrWui0UcrmUUgEI0TaoAowhRw
         ZHeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="QqdGb/hH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e131-v6si372072qkb.207.2018.10.11.09.23.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Oct 2018 09:23:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="QqdGb/hH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35442 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAdkk-0007kM-Kv
	for alex.bennee@linaro.org; Thu, 11 Oct 2018 12:23:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gAdkZ-0007jy-9m
	for qemu-arm@nongnu.org; Thu, 11 Oct 2018 12:23:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gAdkV-0007en-Sn
	for qemu-arm@nongnu.org; Thu, 11 Oct 2018 12:23:45 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:44427)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gAdkT-0007dP-TX
	for qemu-arm@nongnu.org; Thu, 11 Oct 2018 12:23:43 -0400
Received: by mail-ot1-x341.google.com with SMTP id p23so9484994otf.11
	for <qemu-arm@nongnu.org>; Thu, 11 Oct 2018 09:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=gimnkCYNLVB14HAnV7eSWYMT+/M2HNaJdrUcOkdUySI=;
	b=QqdGb/hH2yftOh0aPnynUuR6FCpat8MM1HMueKfVaCoYZqXIF7CPNc627i6Xb3w3aJ
	XqVSEdZdm0MZ0zKYCpgcNA/L0grB2CGaaGAvEytOrcA7Xv05rhPHDrMXRaPWYip/sFSa
	0sQsqNYQG8t05bjxvE+OV2aDdqKu9zpiDjbNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=gimnkCYNLVB14HAnV7eSWYMT+/M2HNaJdrUcOkdUySI=;
	b=dyRySCEP9eUGrVvkgIzKv/aUBhy6asrY8LV3bd/ZA6+jrSBktNdoNMR10lTTW525bq
	liSZcxFyiYmX1C0NSRWkZ1KnDvGUucgGlvZrMuklSI7scA8xxVWe/S7itqg34FiTK8Di
	3k0FWbQM8Xmr+2poxIgAufZ7D//UQ6WDqZtVUOe2eN56+vAgspVmYyDkgVQxtq6z3z/l
	gSHocarr4ygpQ4sQX6Yk/re3xCOnEfCKGk/6P3jZwRuIJIjfRmYF/Xgljge+1Q41Mi95
	67ubyMUktSuYYO93GIcuoT3SwBuLJX9tDck11na5q0rgH3UCxHtXFr9K2Hr63LWLRBJl
	eRSw==
X-Gm-Message-State: ABuFfojRW42uW73LqgT3pg1B8/lZfuZGNv0BpfeysAGVbrh3WGCjtWvc
	rMBn6Ki9K6z9p+YMM+SFxvZinoOZYJJYtgRcMKAehA==
X-Received: by 2002:a9d:2377:: with SMTP id k52mr1498025otd.238.1539275020710; 
	Thu, 11 Oct 2018 09:23:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Thu, 11 Oct 2018 09:23:20
	-0700 (PDT)
In-Reply-To: <2dddf6d3-4362-9ed1-18b5-f927e850c10f@greensocs.com>
References: <20181002142443.30976-1-damien.hedde@greensocs.com>
	<08d9d1e0-3c37-4b69-bb68-bf993b91289a@redhat.com>
	<2dddf6d3-4362-9ed1-18b5-f927e850c10f@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Oct 2018 17:23:20 +0100
Message-ID: <CAFEAcA-mv2k=fe_QoBpdow4afm6QR2BPAAaD+aC3hdxEfvcPAw@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 0/9] Clock framework API.
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, konrad@adacore.com,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pMg9Ff04w+6y

On 11 October 2018 at 17:20, Damien Hedde <damien.hedde@greensocs.com> wrot=
e:
>
> Hi Philippe,
>
> On 10/4/18 6:13 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>> Hi Damien,
>>
>> On 02/10/2018 16:24, Damien Hedde wrote:
>>> This series aims to add a way to model clocks in qemu between devices.
>>> This allows to model the clock tree of a platform allowing us to inspec=
t clock
>>> configuration and detect problems such as disabled clock or bad configu=
red
>>> pll.
>>>
>>> [...]
>>>
>>> Any comments and suggestion are welcomed.
>>
>> How would you instanciate devices and connect their clocks from the
>> command line (with the -device option)?
> I didn't not thought about that. I'm not sure to understand how this is
> done for a gpio for example. Is this done by setting the link property
> manually ?

You can't wire up GPIOs on the command line. I don't think we
really need to be able to wire up clocks on the command line either,
do we?

> Should clocked devices have DeviceClass::user_creatable =3D false by defa=
ult?

How many devices have a clock and nothing else that would cause
them to be non-user-creatable (ie no GPIOs, no IRQ lines, no
memory-mapped memory regions) ?

thanks
-- PMM
