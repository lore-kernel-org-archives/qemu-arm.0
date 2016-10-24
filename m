Received: by 10.80.166.35 with SMTP id d32csp2555617edc;
        Mon, 24 Oct 2016 03:20:49 -0700 (PDT)
X-Received: by 10.237.39.71 with SMTP id n65mr14645101qtd.9.1477304449503;
        Mon, 24 Oct 2016 03:20:49 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b6si10495883qkd.165.2016.10.24.03.20.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Oct 2016 03:20:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45697 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bycN6-0006AP-Cg
	for alex.bennee@linaro.org; Mon, 24 Oct 2016 06:20:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56424)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bycN0-00069d-Nn
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 06:20:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bycMz-0005gA-PP
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 06:20:42 -0400
Received: from mail-vk0-x243.google.com ([2607:f8b0:400c:c05::243]:32773)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1bycMz-0005fm-Bf; Mon, 24 Oct 2016 06:20:41 -0400
Received: by mail-vk0-x243.google.com with SMTP id 83so7323833vkd.0;
	Mon, 24 Oct 2016 03:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Of/xFenrRgh9MzIaCWLSX1R+2j/C3EzJ8dCxS2nXqQ0=;
	b=ldmxqLtpPcOMPgMWcRLaGX/G1tCt9D+RWyVzQyK5fk58UmLdzPZar+eajS1kI7FyOF
	zV5OCcysihm+bBGngXhGMz2E/lOCMXnqgs3I52f08rZOMy5d2Am8WhhzA7j1aLTfA9Vn
	PS/97OYY4mMaJS2DDgXSHvs8SNsxFgfJdXsjkxUV5gbofZ+ib1Xz/KdBhs5oSQzyC6zP
	GY9Vt4bwUifypU4I39j9GErk4Bvs2GwqTgSPbb4wn9GpNO4h6BxOBgAA2ifLwsCCuOLj
	We5rn/XqYvv92YTDz3XPHbRn6T8XG609ASwjdNs/79sDnpq5ToMTS4GLARnJ9+16NciN
	RbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Of/xFenrRgh9MzIaCWLSX1R+2j/C3EzJ8dCxS2nXqQ0=;
	b=f/OG1nyih9Tegk0IvQ4OtluAEkuot8ZGuVlO4nUJswIGMMAGcXInKuvodhHc+5NOc5
	hGvZpAxmJLwNJht+7+DFFZjxflkdbby7hME0TrAFlZffXeVCe7Pe5xG/ac/9bCxRsPTY
	ZWROxv0Jyob6NEdiDvToATijTZqxDU6FzqgX6YdVeqMchE/JlKTybExOQdGmysC671dL
	qmyZCT/xBz5u7EaMGA1C24ZNgM0DY9ubw716vjUqYsmXaKQ7BCnzlWtmFXOvz2xhMWUN
	KpnV7lPaPEWjWka+VzyFJe2NSp4anvKjrBmCqwlaKy72Bqjc8hfZ0pNayWCAs6klxc38
	7r1Q==
X-Gm-Message-State: ABUngvepl8M+IhlDKYSgQ2UAjjHFh/IzbvNJF371rss1i4Ztv03tLUCxJ4lPtSuYWNxhhZIH9Mcr78NXE4+z3Q==
X-Received: by 10.31.3.155 with SMTP id f27mr7292240vki.64.1477304440210; Mon,
	24 Oct 2016 03:20:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.93.135 with HTTP; Mon, 24 Oct 2016 03:20:39 -0700 (PDT)
In-Reply-To: <20161024093943.GC2190@work-vm>
References: <1477288523-10819-1-git-send-email-vijay.kilari@gmail.com>
	<1477288523-10819-3-git-send-email-vijay.kilari@gmail.com>
	<20161024093943.GC2190@work-vm>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Mon, 24 Oct 2016 15:50:39 +0530
Message-ID: <CALicx6sh+uMYoUPCbSxVY-LogdLW_aak3MuueeYu1mkK5vyu2A@mail.gmail.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 2/3] utils: Add helper to
 read arm MIDR_EL1 register
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BMgTkT+ui99p

On Mon, Oct 24, 2016 at 3:09 PM, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
> * vijay.kilari@gmail.com (vijay.kilari@gmail.com) wrote:
>> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>>
>> Add helper API to read MIDR_EL1 registers to fetch
>> cpu identification information. This helps in
>> adding errata's and architecture specific features.
>>
>> This is implemented only for arm architecture.
>>
>> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>> ---
>>  include/qemu/aarch64-cpuid.h |  9 +++++
>>  util/Makefile.objs           |  1 +
>>  util/aarch64-cpuid.c         | 87 ++++++++++++++++++++++++++++++++++++++++++++
>
> It feels like there should be somewhere else to put this very ARM specific thing
> that in util/ - not sure where though.

  IRC, I tried it. But libutil is built before arch code compilation.
So cannot put
outside of util folder
