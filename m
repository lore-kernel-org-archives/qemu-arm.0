Received: by 10.25.87.130 with SMTP id l124csp515877lfb;
        Tue, 6 Sep 2016 03:32:17 -0700 (PDT)
X-Received: by 10.200.50.199 with SMTP id a7mr4566756qtb.87.1473157937443;
        Tue, 06 Sep 2016 03:32:17 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a24si8550991qkj.335.2016.09.06.03.32.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Sep 2016 03:32:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60525 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bhDfs-0004av-Rv
	for alex.bennee@linaro.org; Tue, 06 Sep 2016 06:32:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46541)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhDfo-0004ZO-HG
	for qemu-arm@nongnu.org; Tue, 06 Sep 2016 06:32:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhDfj-0003v5-Gx
	for qemu-arm@nongnu.org; Tue, 06 Sep 2016 06:32:12 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:33210)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bhDfj-0003uy-95; Tue, 06 Sep 2016 06:32:07 -0400
Received: by mail-lf0-x243.google.com with SMTP id l131so4346849lfl.0;
	Tue, 06 Sep 2016 03:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=Vnnikm1CUQXj5WA56TtSgrbGFiBLwF9FKcbHuR0/sO0=;
	b=Tsa+RxZHVv4UitWIo3Xs5CuiPctePlAa5CFY4cUanaP6ikgd+oCe/0UAusQQ1QoFya
	9Rby1uHYMI0DWDE9weCGsg+Ecp1mrgHeSxIp3NpVRTPpd/Jsbkpbzx4Nvn/kgqPMfoD/
	wTKX5k60x8SvYP0bmoB8cRsmzBqa8PMSurmjaGOol+n2k20F6zuYSRvVOt7moEx31FO2
	jgWUULIUvwCtFIfAk9ggBz2buZT3yOe2hWkolTiV3SMN/QxHHWPzqltPSInbdhKbnyDA
	k7ha1/xwezwtU2nQ60261ekvBIdSYb8lwCuthZ67CWUei0YRbLajRFCXOVcmDacN1mTR
	JmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Vnnikm1CUQXj5WA56TtSgrbGFiBLwF9FKcbHuR0/sO0=;
	b=INp5gftSgc7G8E6QwpTSbwgcoS7DduWMR0S/m4/W9s5hVgIJXbaZhkimJz3EczPRk0
	3AT0N2bX5RMkPzOqRruwXbvIA7SzT0XT/lJQpdgiG7ga2wB/KT9GM3MUVbNVx7yxQi0K
	RFspsDPOgqt5LmqoJOObAfxhmAMufKdHYaWX9EOwVYSxk90iQs2LQfCxDZIb3jcDjrqE
	XMdP0SeaVdQ2D0/oXznyPbxvU6H8D14N9UoW0xXX/iK1EeTBkY/UiSGUZD2EPceOnpI+
	Vg3/wsa0Nc7HgjIp+W0jbXz3aTXQ4MwHryRngeFixQebvNQAdGgk8RYxC6mzJFfhC0Sq
	DnPQ==
X-Gm-Message-State: AE9vXwPM48iuBVSh7xGaVpSOCisYFeu9kSR2dY7JYsTvuPxJ90VfD0JlhRHdW/5uaI9aWw==
X-Received: by 10.25.217.90 with SMTP id q87mr12744355lfg.16.1473157926288;
	Tue, 06 Sep 2016 03:32:06 -0700 (PDT)
Received: from [192.168.1.145] (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17]) by smtp.googlemail.com with ESMTPSA id
	h29sm1289808lfi.18.2016.09.06.03.32.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Sep 2016 03:32:05 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <cover.1469110137.git.digetx@gmail.com>
	<CAFEAcA-vNVToZ1gONUhUxa-2zwEVmd_sVSJOTLzH6ry+OnxS_A@mail.gmail.com>
	<034e2688-83f6-23df-4e4f-da68ef1f580a@gmail.com>
	<CAFEAcA9_ihKX0N4J02+yqkqAYU_h6EsHNzK-2dYubrVxBaoNEQ@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d954c190-79a1-d413-c4d2-2f425fad9ee4@gmail.com>
Date: Tue, 6 Sep 2016 13:32:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9_ihKX0N4J02+yqkqAYU_h6EsHNzK-2dYubrVxBaoNEQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Subject: Re: [Qemu-arm] [PATCH v15 00/15] PTimer fixes/features and ARM
 MPTimer conversion
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c3Da9U1Jo+pc

On 06.09.2016 01:12, Peter Maydell wrote:
> On 5 September 2016 at 22:52, Dmitry Osipenko <digetx@gmail.com> wrote:
>> On 05.09.2016 21:14, Peter Maydell wrote:
>>> I tried "check this compiles and passes the tests for each commit",
>>> and what I found was that you get a lot of new warnings running
>>> 'make check' about "Timer with period zero, disabling", which were
>>> not there before. Could you look into this and fix it, please?
> 
>> Sure, I'll silence those ptimer error messages by making them conditional of
>> qtest_enabled(). The messages are actually harmless, however not very useful in
>> the context of testing. Thanks a lot for returning to that series, I appreciate it.
> 
> I had a look at the rest of the patches, but to be honest I found
> it very difficult to figure out whether any of the changes were
> making the right changes or the wrong changes. So it's not clear
> to me that "silence the warning if running under qtest" is right:
> why is the warning being produced at all?
>  

The ptimer tests cover all ptimer behaviour cases, including the cases where
ptimer stops because of the error condition. This helps to ensure that further
applied ptimer patches (like new policies) are not affecting old ptimer (policy)
behaviour, including those error cases. So the warning message is being emitted
each time some of the ptimer tests checks the error condition behaviour.

If you have any thoughts on how to make review of this series easier for you,
please tell. I'm open to suggestions.

BTW, I'm going to turn "Fix counter - 1 returned by ptimer_get_count for the
active timer" patch into a ptimer policy. The patch is correct for all of the
current ptimer users, however that "counter - 1" feature could be useful for
some of the future added timers, like nios2 timer [0], and could be already used
by some of the QEMU forks. So it might be better to retain old behaviour for the
default policy.

[0] https://lists.nongnu.org/archive/html/qemu-devel/2016-07/msg06423.html

-- 
Dmitry
