Received: by 10.28.91.67 with SMTP id p64csp1669866wmb;
        Thu, 15 Mar 2018 10:13:36 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvKZataC9ztLWqYkQn5lwxgBkKIBavqL7Zot5ZDrU7QPLfXdZaD82ptY1I7WRqBROv5Gc2O
X-Received: by 10.55.4.132 with SMTP id 126mr13852584qke.277.1521134016621;
        Thu, 15 Mar 2018 10:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521134016; cv=none;
        d=google.com; s=arc-20160816;
        b=oiSx/16+03Xr0ZlhNmxg23haRLjm5aLpPoRN38T9RIVsNyTZd/D5Tu+C2fcxpRPHGg
         dfoSNnBLH2OSBLeHcOO82Jh1Fx4kb3H410Iy7Zj5so5tDyYczhGtd6qqsfQotTZxtM3X
         Uspnepcg2rValO9teCDMzS/nk8WBiccG6GQfc6ENbkzO3VZZHwHOxSMBx6B3ka+aKE5f
         1Gr0oszLH5qc7oNsGnQyxuM9q4W6X5gd3DcTUjTlBJ7qWwb5AwEMMGP7FjCYz85vGyhZ
         Ud8aErrsoWHYc54VFTMlGxMZyXW1s9HRlAqy5L9CNfQMbmknFulrt2v1+ixEgN/iWSqw
         CSQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=5U/rTgHkOSa6uNIlCcOQd9SNMOOkVyAh0ay896ouWLk=;
        b=IIUaNnXtIBfxrTQvxlk23mF05aEi7Ra7M7o8Nm9juDYokSbB1QgVOs0NwWPyxRSBv5
         X80rLGg1TuKWHCPyGHfsiRahBC9iJol5PrjQintu2/oOwf3s4Eb/m6bvdkafj8dSLJ/v
         KifD2sa77uq1Toq+6rB2uT6wKKSnRrp9cJWfthri/gp+awnNPQT/hN7kTIPSlgKgsPPM
         PWqNk+A6e6wZJAls2xzlcPIba9SK622mnotB+RODwOQ0GDe5AHoBj/zSTru6tDnVLIlJ
         pR2Jo7otpyTdjEmr/ULJdRW/bDdA/LKWEgMBx4bMXvKbQcKyno5qG/w4p87gg95UmGXu
         QmAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LpZzd/nn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h32si3091730qtk.57.2018.03.15.10.13.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Mar 2018 10:13:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LpZzd/nn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52640 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ewWRc-0001sZ-2c
	for alex.bennee@linaro.org; Thu, 15 Mar 2018 13:13:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54276)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ewWRS-0001s5-0U
	for qemu-arm@nongnu.org; Thu, 15 Mar 2018 13:13:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ewWRR-0002WO-2p
	for qemu-arm@nongnu.org; Thu, 15 Mar 2018 13:13:25 -0400
Received: from mail-oi0-x22d.google.com ([2607:f8b0:4003:c06::22d]:34581)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ewWRQ-0002W3-SI
	for qemu-arm@nongnu.org; Thu, 15 Mar 2018 13:13:24 -0400
Received: by mail-oi0-x22d.google.com with SMTP id e79so2372573oih.1
	for <qemu-arm@nongnu.org>; Thu, 15 Mar 2018 10:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5U/rTgHkOSa6uNIlCcOQd9SNMOOkVyAh0ay896ouWLk=;
	b=LpZzd/nnJ/pt3l3naP7FOZKmi4wIWNiSUoCcRHMHyGekKXdvJS4xSFE+hp2Kt5A/68
	7xUhHtAZURLA+HErGrUlOW/TSDPNmdYK+lF6hS7WVa7nLv3hnRQ5g+IOOlw5EorOJsy7
	oMhRlLVycsovD5li9wVREaQZx88iQmQij4LXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5U/rTgHkOSa6uNIlCcOQd9SNMOOkVyAh0ay896ouWLk=;
	b=g+hmHMZuoeXHKv0XGCkpdnjyT5ufSKZPOoIuc/PDY/cGbzptFGwsvr3+1N/XTECLuM
	EYvVvwXj3td6IjSwDbvvnpGlRctZYkOTtoOiaTnogXa6YN0aeTV8o9a5FF7vyaLys/4/
	5kuETxF/K3ui94ZBiJHtcRV8481V+96n6LpBXw+dIJAQqtLagTBK8at5eWIXQmIMcjm3
	dALfEGjU61sRCBdTkGOgHUmXDWR3XpWt6lqOXvjoiJnAVEIjcE9P5gQxahgcMKgLu5ZK
	Kf8MPtZZog7DPmPEBili4bsFeUeMxqtnyJT6esaok+DwoCSezqAlo3BxYL+pNNtvUJ3h
	QTFQ==
X-Gm-Message-State: AElRT7G8JzO37tm3QEyrFRWZcmZs2CO41XnCbiNSzzIj0Q0pWaLO9hHn
	JETEbDJZYQrOys8pxG3PVBVokKBAETtUa/jsm+29hA==
X-Received: by 10.202.17.13 with SMTP id 13mr5413914oir.164.1521134004112;
	Thu, 15 Mar 2018 10:13:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2164:0:0:0:0:0 with HTTP; Thu, 15 Mar 2018 10:13:03
	-0700 (PDT)
In-Reply-To: <MWHPR21MB018983B74A652443B70680F19ED20@MWHPR21MB0189.namprd21.prod.outlook.com>
References: <20180313153458.26822-1-peter.maydell@linaro.org>
	<20180313153458.26822-9-peter.maydell@linaro.org>
	<MWHPR21MB018983B74A652443B70680F19ED20@MWHPR21MB0189.namprd21.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Mar 2018 17:13:03 +0000
Message-ID: <CAFEAcA_9YQ4bSzHgM8yLAPtPZ2C70u13kTCLf4rHGPCBUgNiZA@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22d
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 8/9] hw/arm/bcm2836: Hardcode
 correct CPU type
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
Cc: "patches@linaro.org" <patches@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Pekka Enberg <penberg@iki.fi>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g+7SsAavYid2

On 13 March 2018 at 16:55, Andrew Baumann <Andrew.Baumann@microsoft.com> wrote:
>> From: Qemu-devel <qemu-devel-
>> bounces+andrew.baumann=microsoft.com@nongnu.org> On Behalf Of Peter
>> Maydell
>> Sent: Tuesday, 13 March 2018 08:35
>>
>> Now we have separate types for BCM2386 and BCM2387, we might as well
>> just hard-code the CPU type they use rather than having it passed
>> through as an object property. This then lets us put the initialization
>> of the CPU object in init rather than realize.

> What about the default_cpu_type field of MachineClass set in
> raspi[23]_machine_init? That seems irrelevant now...

Igor, can you help with this question? For a board that always
has one CPU type (because the real hardware only ever has
one SoC, and that SoC QOM object hard codes the CPU type)
does it still need to set the mc->default_cpu_type field in
its MachineClass, or does that become pointless ?

thanks
-- PMM
