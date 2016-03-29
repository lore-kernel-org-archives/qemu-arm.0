Received: by 10.25.208.211 with SMTP id h202csp2263956lfg;
        Tue, 29 Mar 2016 13:17:53 -0700 (PDT)
X-Received: by 10.140.40.37 with SMTP id w34mr5323881qgw.85.1459282672573;
        Tue, 29 Mar 2016 13:17:52 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o10si390830qhb.108.2016.03.29.13.17.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Mar 2016 13:17:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49792 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1al05I-0003gu-2F
	for alex.bennee@linaro.org; Tue, 29 Mar 2016 16:17:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32788)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1al04t-0003ML-MV
	for qemu-devel@nongnu.org; Tue, 29 Mar 2016 16:17:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1al04q-0007fZ-Tg
	for qemu-devel@nongnu.org; Tue, 29 Mar 2016 16:17:27 -0400
Received: from mail-lb0-x244.google.com ([2a00:1450:4010:c04::244]:35070)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1al04q-0007ee-Mp; Tue, 29 Mar 2016 16:17:24 -0400
Received: by mail-lb0-x244.google.com with SMTP id gk8so223997lbc.2;
	Tue, 29 Mar 2016 13:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=KK8iR3jaQbABM7XTlUYNa2Bey5aK/N/rhkeYf8pia7E=;
	b=EjCrWkTJPvjWPdchhEikyybDt1pzKE7oDyWBUi3AgS+0ELEyhEihbiaSCLD2ly64gO
	NIzua/urnDuOp3xZoe8/1CK3jrD46C5imVKvEoqtmSl7owIZKiA6ZYdrg6AseGEzBn5G
	glYqri55EAnpL5BbeG+eF4Bj7lAyI/AlIB+4p/PbAgkviGYs5AAGLr9zGK8WnE8NMpAM
	0MLz1UEEKLtx49esYIH8DuerdVYtNZG9UF+Wq1h3JMVLAIC/97z1daa0b0V56pFYWrx8
	TAhy4i3a32wmZithkiWXMsOdJsCTc1/Qnp6asEkL8eEKXp81+gjk5MvR0qw45vGZ0bAk
	so6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=KK8iR3jaQbABM7XTlUYNa2Bey5aK/N/rhkeYf8pia7E=;
	b=DeSp2OfQi8GM1KYRsITKiz6wWex6jKyqXhREnnTDOwUAgHIgbHIUDDwHW4y/uHk21G
	eqLHqUQpGw3QZ1n1MBSTLvNDI7aHYJIJ+vYEKJniab9Sav/4y3X5z1J3u4RPfdU37Odv
	mezxY6THZMBKdB9pkzbn4vDAlIJbQaU74FF20EuCQumC+87f/hgl3ULsvbCDvWuIP41Y
	lpR/65vYAsfydgLWV1GWZueDqTsqBgZxYgxBT7qWmstVJQqTUR7XR4yUVY2I5sJB0UrN
	IBhY2nFz8VUerWNdkUxiHNxit+mYifsUqDEIQLvhdq2uHRIQxQBnq/56L9HdDikn5KMn
	b/dg==
X-Gm-Message-State: AD7BkJLmy4l5v/H/6kUGIesvDuRXD9IRLHcesVQzbRJ+ArAM0q2Kyn6V4l6a7wehdo+Qjg==
X-Received: by 10.112.126.36 with SMTP id mv4mr2032506lbb.97.1459282643674;
	Tue, 29 Mar 2016 13:17:23 -0700 (PDT)
Received: from [192.168.1.145] (ppp91-77-168-72.pppoe.mtu-net.ru.
	[91.77.168.72]) by smtp.googlemail.com with ESMTPSA id
	zk4sm65634lbb.15.2016.03.29.13.17.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Mar 2016 13:17:23 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <cover.1454169735.git.digetx@gmail.com>
	<CAFEAcA8ozt0SdmfgzKVSr+2Y7ou2u29g=Y35u-jmi5O8ZgH7qg@mail.gmail.com>
	<56F92FFC.4020805@gmail.com>
	<CAFEAcA_SCnc_C_LteDMRwSXFa80gKOt0Gimc_R8vjVURWx8pSg@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <56FAE2D2.6090307@gmail.com>
Date: Tue, 29 Mar 2016 23:17:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_SCnc_C_LteDMRwSXFa80gKOt0Gimc_R8vjVURWx8pSg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::244
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH v12 0/9] PTimer fixes/features and ARM
 MPTimer conversion
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pl6SHa78Xik4

29.03.2016 22:00, Peter Maydell пишет:
> On 28 March 2016 at 14:22, Dmitry Osipenko <digetx@gmail.com> wrote:
>> Hello Peter,
>>
>> 16.03.2016 17:36, Peter Maydell пишет:
>>>
>>> On 30 January 2016 at 16:43, Dmitry Osipenko <digetx@gmail.com> wrote:
>>>
>>>> Changelog for ARM MPTimer QEMUTimer to ptimer conversion:
>>>
>>>
>>> So, where are we with this series? It looked from the mailing list
>>> threads as if there were still a few things Peter C hadn't got
>>> closure on, but we're rapidly running out of time before hard
>>> freeze :-(  I'd really rather not have to push it out by yet
>>> another release, especially since it got posted back in January..
>
>> It still pending for the review and the due date is tomorrow, maybe you
>> would want to pick some of the PTimer patches for 2.6.
>>
>> PTimer fixes ready for submission:
>> [PATCH v12 1/9] hw/ptimer: Fix issues caused by the adjusted timer limit
>> value
>> [PATCH v12 2/9] hw/ptimer: Perform counter wrap around if timer already
>> expired
>> [PATCH v12 3/9] hw/ptimer: Update .delta on period/freq change
>
> I'm afraid at this point I really don't want to apply changes
> to code like ptimer that affects multiple platforms; this will
> have to go to 2.7 :-(

Okay, this is fine too :)

-- 
Dmitry
