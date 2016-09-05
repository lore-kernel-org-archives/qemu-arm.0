Received: by 10.25.87.130 with SMTP id l124csp299528lfb;
        Mon, 5 Sep 2016 14:52:17 -0700 (PDT)
X-Received: by 10.55.123.197 with SMTP id w188mr40806538qkc.60.1473112337842;
        Mon, 05 Sep 2016 14:52:17 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e125si19022346qkc.283.2016.09.05.14.52.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Sep 2016 14:52:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57224 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bh1oP-0008CG-CI
	for alex.bennee@linaro.org; Mon, 05 Sep 2016 17:52:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bh1oM-0008Bq-7F
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 17:52:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bh1oJ-0000oW-1o
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 17:52:14 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:34920)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bh1oI-0000oI-Pw; Mon, 05 Sep 2016 17:52:10 -0400
Received: by mail-lf0-x243.google.com with SMTP id s64so12374lfs.2;
	Mon, 05 Sep 2016 14:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=N+yhN7wn5YXOrUtKO/rirraYUg/QvUSqXB8Oopr8YAQ=;
	b=L3ICvrEKuZBx2oqz4DxoZYOyHGJke4PEWTvHondTpJZZqlg3ySxTIga4wfPQPA/V41
	HfxoLFHZRk9BWREzWfJwaD/141QKvqZmLtSw1QjmtE09jVBYkQlEME0swlIz9jXBjms1
	61Fvu7kNVTzLdNNmrg1mvMQMfr6cg/vB869SHMlXWq2q/VfE2DxQWwUbwqzG0WCk3Pz4
	qxzZMaYxAokLnPx5DskOKdc3ucV+LWUU07L0UF9ljRhkwplD25KeZAs0YI3dxpr67Iy7
	1hDLxfV7waecLUF2dZZh0KqXzbC/pwQ0UxD82E7oZ0BpbYvdnJDaRPqH8VwS9U0j56Yv
	cvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=N+yhN7wn5YXOrUtKO/rirraYUg/QvUSqXB8Oopr8YAQ=;
	b=nNY+bB7g4YLQaBZ1xHODMqGIv290Ev9HA63QrvsJtf0tTJDpCfCqYg/Fk9zS09wr3U
	1/RzAgLhE7z1hNWU0t8OIhFaA3XF9wwPNz1WHR/lE6n778BHcLgltTYyHU/uB2tvF9Vo
	tW8ILO5a3j0PFITKAWord7MFdL+Z+QU4hJdjH+id2lcaveDvQZzPPQp4WLprfUM0T3vR
	F45xKV6PN9KhbKsZ6u6AWAwWtnqk7uggRFJYX5WlCs3vOt8GNMDa5TCGiPHYTdXyIiRR
	FZEgyv04HzegkEspVEYfdXAlCf4lLOlPNgLYo/TdLMmGzVBrFu5ZZ5vn6jKagnjH/4XT
	Zg+Q==
X-Gm-Message-State: AE9vXwPh78OmHJH2Q/L0AIz0LuZO5op5ir93yHEDfqLh/2iS4uQb4suiG+vjNlEB/zZLGQ==
X-Received: by 10.25.18.20 with SMTP id h20mr5281730lfi.148.1473112328325;
	Mon, 05 Sep 2016 14:52:08 -0700 (PDT)
Received: from [192.168.1.145] (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17]) by smtp.googlemail.com with ESMTPSA id
	w15sm635615lfi.16.2016.09.05.14.52.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Sep 2016 14:52:07 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <cover.1469110137.git.digetx@gmail.com>
	<CAFEAcA-vNVToZ1gONUhUxa-2zwEVmd_sVSJOTLzH6ry+OnxS_A@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <034e2688-83f6-23df-4e4f-da68ef1f580a@gmail.com>
Date: Tue, 6 Sep 2016 00:52:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-vNVToZ1gONUhUxa-2zwEVmd_sVSJOTLzH6ry+OnxS_A@mail.gmail.com>
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
X-TUID: P3HlqMIFWOSH

On 05.09.2016 21:14, Peter Maydell wrote:
> On 21 July 2016 at 15:31, Dmitry Osipenko <digetx@gmail.com> wrote:
>> Hello,
>>
>> Currently, QEMU ARM MPTimer device model provides only a certain subset of
>> the emulation behavior. This patch series is supposed to add missing parts by
>> converting the MPTimer to use generic ptimer helper. It fixes some important
>> ptimer bugs and provides new features that are required for the ARM MPTimer.
>>
[snip]
> 
> I tried "check this compiles and passes the tests for each commit",
> and what I found was that you get a lot of new warnings running
> 'make check' about "Timer with period zero, disabling", which were
> not there before. Could you look into this and fix it, please?
> 
> thanks
> -- PMM
> 

Sure, I'll silence those ptimer error messages by making them conditional of
qtest_enabled(). The messages are actually harmless, however not very useful in
the context of testing. Thanks a lot for returning to that series, I appreciate it.

-- 
Dmitry
