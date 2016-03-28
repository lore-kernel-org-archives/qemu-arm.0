Received: by 10.25.208.211 with SMTP id h202csp1442470lfg;
        Mon, 28 Mar 2016 06:22:16 -0700 (PDT)
X-Received: by 10.140.144.132 with SMTP id 126mr37253036qhq.102.1459171336637;
        Mon, 28 Mar 2016 06:22:16 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g60si4000579qge.120.2016.03.28.06.22.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Mar 2016 06:22:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40961 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1akX7Y-0001Xi-5j
	for alex.bennee@linaro.org; Mon, 28 Mar 2016 09:22:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47757)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1akX7W-0001Ws-9x
	for qemu-arm@nongnu.org; Mon, 28 Mar 2016 09:22:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1akX7P-0007dP-Pq
	for qemu-arm@nongnu.org; Mon, 28 Mar 2016 09:22:14 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:33138)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1akX7P-0007cK-Gt; Mon, 28 Mar 2016 09:22:07 -0400
Received: by mail-lf0-x243.google.com with SMTP id s192so3264358lfs.0;
	Mon, 28 Mar 2016 06:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=fvErUHG70JHhO8Y6u5VTNfOZtApOS+s6JGuOimLDwnU=;
	b=IYJxCnzgkWkaHHD+17KLKNcUD1dm4gWvgMQ3DW6/dsr3gCMdLCf3WkTb4F52sjzyfZ
	rXiQdKvkvFRIw+CAHirCYlA96wObOn7hIEaytbacURTqIwthvay6eeMUtN6YOHeL2KIP
	Haf41/F/tuaip6nIh5b8GkcnN9qVRaJxihBu71bQI+F1Mlf4SZ80LL+/PE0nqQY7UXj9
	pDUNCGoLxPuBSmcqcTrPODZyK3AwEnOT6tohjQEv5ZQYjGtGO8xisbLhRzLnTnNhvJ0c
	ZRtrmQxlch6Z5hm961BjZBapj/bcjhP46YTqONwzkE1wdVWr8Pfsnp1yxs+RY4LG71G9
	UArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=fvErUHG70JHhO8Y6u5VTNfOZtApOS+s6JGuOimLDwnU=;
	b=TkwfW+XVeWfg+XMMMc88nP1lZ+XjcZPrHBGOWJ4SfrPlqyC2IXv/wDnElZpxsq3M4a
	qdHD+4eGzkxb+v6X4WUIwRG5bxFKiB2Xvj7DAU3ocAkO69Xx5+SkVse8omXWrvPeFGT0
	oWZMxhevF5PeAn8wCJdipiVZ5QBYWJa4RR8PnX4BnKZyVbPwL/U3yGyeACTvwH9v4DFh
	rfCNd/K4q8H7F9Ut1NVqbd1EuRpmsVW0tHPgtGLY1BepaX7qaB2lRM+Yy50VpQRlqDUy
	N9y6aWxm10SRvaGk3J+dVOdsk3EQJBbqMYqNZPqJTd3cFinOWIcbfLUqsiKRTB5sfn9+
	Q0Tw==
X-Gm-Message-State: AD7BkJKig4xDvYBalZ7WJwVKwCRn5hWP1mK5sVLhWg/dcoHjIb/eSCWjav8JOsIjnW5tWA==
X-Received: by 10.25.211.75 with SMTP id k72mr10071187lfg.45.1459171326106;
	Mon, 28 Mar 2016 06:22:06 -0700 (PDT)
Received: from [192.168.1.145] (ppp91-77-168-72.pppoe.mtu-net.ru.
	[91.77.168.72]) by smtp.googlemail.com with ESMTPSA id
	s193sm4656944lfe.29.2016.03.28.06.22.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Mar 2016 06:22:05 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <cover.1454169735.git.digetx@gmail.com>
	<CAFEAcA8ozt0SdmfgzKVSr+2Y7ou2u29g=Y35u-jmi5O8ZgH7qg@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <56F92FFC.4020805@gmail.com>
Date: Mon, 28 Mar 2016 16:22:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8ozt0SdmfgzKVSr+2Y7ou2u29g=Y35u-jmi5O8ZgH7qg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v12 0/9] PTimer fixes/features and ARM
	MPTimer conversion
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: y35fEmXXv3Mx

Hello Peter,

16.03.2016 17:36, Peter Maydell пишет:
> On 30 January 2016 at 16:43, Dmitry Osipenko <digetx@gmail.com> wrote:
>> Changelog for ARM MPTimer QEMUTimer to ptimer conversion:
>
> So, where are we with this series? It looked from the mailing list
> threads as if there were still a few things Peter C hadn't got
> closure on, but we're rapidly running out of time before hard
> freeze :-(  I'd really rather not have to push it out by yet
> another release, especially since it got posted back in January..
>
> thanks
> -- PMM
>

It still pending for the review and the due date is tomorrow, maybe you would 
want to pick some of the PTimer patches for 2.6.

PTimer fixes ready for submission:
[PATCH v12 1/9] hw/ptimer: Fix issues caused by the adjusted timer limit value
[PATCH v12 2/9] hw/ptimer: Perform counter wrap around if timer already expired
[PATCH v12 3/9] hw/ptimer: Update .delta on period/freq change

The rest of the patches are either prerequisites for the ARM MPtimer conversion 
or pending for the review, we will work them out once Peter Crosthwaite would 
get some spare time.

-- 
Dmitry
