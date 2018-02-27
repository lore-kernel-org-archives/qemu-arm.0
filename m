Received: by 10.28.71.27 with SMTP id u27csp5372720wma;
        Tue, 27 Feb 2018 15:18:16 -0800 (PST)
X-Google-Smtp-Source: AH8x226wkPy0cJrt8nwRIffuAuwTHplXKCQjA2SCZLDp641BBnVqpto8Ngi25VFDCXtUkTWE6m+i
X-Received: by 10.129.85.4 with SMTP id j4mr10284638ywb.301.1519773496417;
        Tue, 27 Feb 2018 15:18:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519773496; cv=none;
        d=google.com; s=arc-20160816;
        b=YPnWP+tRscBPKcXd2H7xyHRqY1gp6DJy5Q6O6UobIz5acsol8pJK4eNBbJ8Xo6WbYG
         boQM6kGdP+KR3zD/EKVt6RVNXGJ1YYh0VXTIQ6ObcCe2ijesQV9bVZqXIuDh/SuZFe9o
         Way24fEp9JDlZzGjAIUpWxtD0bdmSn+gEypuUAIt1b1u8aOfNWcwbDdUNWlRGCdabqPY
         LCIBtu45js0JLZwIz+yYEVha2rx1kix+kTMiGShckHJfyY+b5R1Hr3AOW+Rk/Qkza890
         zuKbAimAop6Eak3rer9AT5mGK4mJ1XFY9cl7pp4IGP0loeJYEQjNuvz2I+H8gJzWIC1t
         yVCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=pKoeYekIxg28rc9rVsdj3U/K+iAtlj3pAhB7pPTo3xA=;
        b=1B6WLBddPCtmY2WQUsgp73AeJxU415B4urmCbZLsOEGK+b7fIz5ITNDmodI8i/JmPk
         BV2V///MnS11qm20GV99GBGRXQnD86GffMOs20SEVZECBkfNy2LzRe3GyH0lH017SVgT
         j6gVS3zspMGNYqDiFg1VjdDV4tA3h/k6IM1byYyWM2XHogu8+1uKXLMwqAwmPFzF6ZOc
         WkocWh67FZbJkpOSbcYlaL65ikxK3sVKo1WJtzQc9Jp0xdX02BVBHWrrxaCFPibun0LZ
         P9ZisaFdJoUt2ZOJQn5BwW5eSDJD3s9ijDKDI+3B+apbGcDN+5adWk9ZNMCNOOKw1JJ+
         Cmig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LYLT2nKq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v201-v6si45290ybe.780.2018.02.27.15.18.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 15:18:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LYLT2nKq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40634 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqoVj-0004nC-Ri
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 18:18:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60362)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eqoVb-0004mt-CI
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 18:18:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eqoVX-0007RE-CQ
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 18:18:07 -0500
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:34129)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eqoVX-0007Qg-5M; Tue, 27 Feb 2018 18:18:03 -0500
Received: by mail-wr0-x243.google.com with SMTP id m5so501861wrg.1;
	Tue, 27 Feb 2018 15:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=pKoeYekIxg28rc9rVsdj3U/K+iAtlj3pAhB7pPTo3xA=;
	b=LYLT2nKqpUIR0JWESwqQr7XLKm+xOZIrqYfadmstfUTz1Gb5er98s32JKdfbM/iKxp
	a6Gs24UGC+eIDSKPe3jAXadEUyJES04QyrSe6xiubk8G6DG/eMX4QJVkhjwmTSJRR3a1
	GtqKOsaBxHsmELBnBaoT33x1hIJEfCdoo1amWnH7XlqE19slOq8lOACRKXGZFMfj5ivb
	t+FpPW5T4a8MmKSXbbw5/FnR6ch1y27pP9Y9xi1JPsyufMDm7aecoP5zheQxq+sOC6mv
	ZZkaQFdVzbwbMV+h6MP6In/MyRrfWeR9JApH1mtFkZLxLoxyAyKKQYwUYMBuml86SCHO
	w5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=pKoeYekIxg28rc9rVsdj3U/K+iAtlj3pAhB7pPTo3xA=;
	b=gRj8Yl2JcfmWW3ocoyfOdwXggvVt63K00mDbRxpDiKHLZo6z1InSFHxn6rOk/rQ2rC
	m0QhCaNxuepQtproSOLoBKH6vt8zHjQ0O3kt02WYA+bVKNZnvGOeAz5ggVUsxQ+o2CUt
	0A4QO3/tF+roJa8tnMViI2C6y8T5tG+hejLkYaj/SWZlQlXi66EwdDalMU9EqdnYorNa
	M6ASjQlkdeqiVyPZH1HAq6HArPq93kmVWMGMvUN0zEd+FATahgvmr91rMchyXeRkQDXs
	XQAUEYtLXHSZ6mwkBRA6EGdV4WlRzGU6/iENaKliye9QGCThnV1Qf1tS3Km+kk+0ipCs
	KCjQ==
X-Gm-Message-State: APf1xPClvxhZp4TWE9PZx4t/wCF9llwlpXnd/3QSJlVI6Gip2LlwPDJq
	mBFQkLMYNcIKeKLdrDmMl3Fj7RGp
X-Received: by 10.223.145.67 with SMTP id j61mr14764057wrj.152.1519773481992; 
	Tue, 27 Feb 2018 15:18:01 -0800 (PST)
Received: from ?IPv6:2a01:cb1d:8526:ac00:37c8:9a2b:1b7e:2ba7?
	([2a01:cb1d:8526:ac00:37c8:9a2b:1b7e:2ba7])
	by smtp.gmail.com with ESMTPSA id r98sm591833wrb.70.2018.02.27.15.18.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 15:18:01 -0800 (PST)
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20170922171323.10348-1-f4bug@amsat.org>
	<20171009132112.GA5553@toto>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <4b2297e8-3db9-2ddc-dbaa-16c9e372a571@amsat.org>
Date: Tue, 27 Feb 2018 20:18:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20171009132112.GA5553@toto>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: Re: [Qemu-arm] [PATCH v5 0/7] Generalize MDIO framework
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org, Alistair Francis <alistair.francis@xilinx.com>,
	Grant Likely <grant.likely@arm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XvfdaTkD2sWu

Hi Edgar,

On 10/09/2017 10:21 AM, Edgar E. Iglesias wrote:
> On Fri, Sep 22, 2017 at 02:13:16PM -0300, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> I have a follow up series using multiples PHY on the MDIO bus based on this
>> series.
> 
> Hi Philippe!
> 
> I think this is a good improvement compared to todays state.
> It may make sense to have the generic mdio bus functions in mdio.c
> and specific phy models in separate files, thoughts?

I'm sorry I missed your mail and noticed it today since this thread got
awakened with Alistair's reviews.

I'll raise this series priority in my TODO and respin with Grant correct
S-o-b, Alistair comments addressed and split MDIO/PHY as you suggested.

After spending 2 months with the SD bus, I now fill more confident to
rework the MDIO bus and think of unit testing and tracing.

Regards,

Phil.

>>
>> Grant's previous work:
>> http://lists.nongnu.org/archive/html/qemu-devel/2013-02/msg00257.html
>>
>> "There is more work to be done, particularly in moving to the common GPIO api,
>>  but that work can be done as a follow on patch series."
>>
>> Grant Likely (7):
>>   hw/mdio: Generalize etraxfs MDIO bitbanging emulation
>>   hw/mdio: Add PHY register definition
>>   hw/mdio: Generalize phy initialization routine
>>   hw/mdio: Mask out read-only bits.
>>   hw/mdio: Refactor bitbanging state machine
>>   hw/mdio: Add VMState support
>>   hw/mdio: Use bitbang core for smc91c111 network device
>>
>>  include/hw/net/mdio.h   | 124 +++++++++++++++++++++
>>  hw/net/etraxfs_eth.c    | 291 +-----------------------------------------------
>>  hw/net/mdio.c           | 280 ++++++++++++++++++++++++++++++++++++++++++++++
>>  hw/net/smc91c111.c      |  27 ++++-
>>  hw/net/xilinx_axienet.c | 189 +------------------------------
>>  hw/net/Makefile.objs    |   2 +
>>  6 files changed, 438 insertions(+), 475 deletions(-)
>>  create mode 100644 include/hw/net/mdio.h
>>  create mode 100644 hw/net/mdio.c
>>
>> -- 
>> 2.14.1
>>
