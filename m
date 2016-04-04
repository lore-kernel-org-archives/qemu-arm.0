Received: by 10.25.208.211 with SMTP id h202csp1183833lfg;
        Mon, 4 Apr 2016 08:01:42 -0700 (PDT)
X-Received: by 10.140.147.134 with SMTP id 128mr22677500qht.54.1459782102660;
        Mon, 04 Apr 2016 08:01:42 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v186si22518100qhc.17.2016.04.04.08.01.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Apr 2016 08:01:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59186 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1an60c-0008Fi-9P
	for alex.bennee@linaro.org; Mon, 04 Apr 2016 11:01:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50151)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1an60T-00085d-JU
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 11:01:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1an60P-00021w-Ou
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 11:01:33 -0400
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:34617)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1an60P-00021o-Ef
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 11:01:29 -0400
Received: by mail-vk0-x22e.google.com with SMTP id e185so183009846vkb.1
	for <qemu-arm@nongnu.org>; Mon, 04 Apr 2016 08:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sND8/iVRfBB0MP6YUotvVeUT7xAWyNJMLNJxjg1abYI=;
	b=HZDfE93PaMzJ+4Bo9Rn1cihjEw7Ko6EDIFxLwblvWIT5ARfNTkR6CxvfYYU6DgbEbN
	/64d2j6FdWJboRj06WYLZCm3kAm4spKMoSOiOHTKYLj4H/Hzc7Le1Tct2CUxuZaOKH0R
	NQtvg2h6mNyqvaKbZ7Hb6p4HV6bJTXv9D06Nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sND8/iVRfBB0MP6YUotvVeUT7xAWyNJMLNJxjg1abYI=;
	b=XFK6anuQMD34mzn6gs0QKo4n9LL1C0cMk2ZWWdUP6ZEZUp4UFMy7b1yP9CH++fpawe
	9T3kAeWhWj61LABtAmY1haHZe8l+1BTzKD0MPa4UwNpEXDtsgWL2PVEpBM4kczn3KY87
	kl7F6SVBnrBlYHoctMvJMTB2hi2vlkVGnsZBBEn2kAgIelYqL7YqyB4QzGoFZEDIsDii
	gTPe4DgWal5WQRhDlZOZLv1ECqgwgwA9lYxp/Zsc/mKifbgbBycKtg5usUZuA5p0y5RT
	GthsO69OuXYSycOoZCCXrcRE2TsZO3ewEDMG9AdqzP3UyEDqZJeW56g1KwHBaxElNVas
	dlig==
X-Gm-Message-State: AD7BkJLYr5pHCXXiPQ/t0VdSRjbXp7A8KJ866KodwGuJQbYpa/O755CZJFPYoxEAG2PZJwNGHmBXwFaPL2xIRXwl
X-Received: by 10.176.0.212 with SMTP id 78mr7069334uaj.4.1459782088873; Mon,
	04 Apr 2016 08:01:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Mon, 4 Apr 2016 08:01:09 -0700 (PDT)
In-Reply-To: <57028117.5090008@linaro.org>
References: <1459435778-5526-1-git-send-email-peter.maydell@linaro.org>
	<1459435778-5526-5-git-send-email-peter.maydell@linaro.org>
	<57028117.5090008@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Apr 2016 16:01:09 +0100
Message-ID: <CAFEAcA9w9b0xdHYT31mwYxcxw+cBKb3WJum0qqaJNdJhZ53gJQ@mail.gmail.com>
To: Sergey Fedorov <sergey.fedorov@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 4/4] target-arm: Avoid unnecessary TLB flush
	on TCR_EL2 writes
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
X-TUID: p6XnMHV7JE7L

On 4 April 2016 at 15:58, Sergey Fedorov <sergey.fedorov@linaro.org> wrote:
> On 31/03/16 17:49, Peter Maydell wrote:
>> The TCR_EL2 regdef was incorrectly using the vmsa_tcr_el1_write
>> function for writes. Since TCR_EL2 doesn't have the A1 bit that
>> TCR_EL1 does, we don't need to do a tlb_flush() when it is written.
>> Remove the unnecessary .writefn and also the harmless but unneeded
>> .raw_writefn and .resetfn definitions.
>
> How about TCR_EL3 which doesn't have A1 bit as well?

Yes, that should have this change too I think.

I'll put patches 1-3 into target-arm.next, and respin this one
(which then probably doesn't need to go into 2.6.)

thanks
-- PMM
