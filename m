Received: by 10.25.208.211 with SMTP id h202csp6296lfg;
        Fri, 8 Apr 2016 02:44:03 -0700 (PDT)
X-Received: by 10.55.27.199 with SMTP id m68mr9866629qkh.109.1460108643270;
        Fri, 08 Apr 2016 02:44:03 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id v18si9132490qhb.128.2016.04.08.02.44.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Apr 2016 02:44:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55197 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aoSxO-000707-Un
	for alex.bennee@linaro.org; Fri, 08 Apr 2016 05:44:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aoSxM-0006xP-Cp
	for qemu-arm@nongnu.org; Fri, 08 Apr 2016 05:44:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aoSxL-0005nI-Bg
	for qemu-arm@nongnu.org; Fri, 08 Apr 2016 05:44:00 -0400
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:34613)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aoSxH-0005md-FX
	for qemu-arm@nongnu.org; Fri, 08 Apr 2016 05:43:59 -0400
Received: by mail-vk0-x22e.google.com with SMTP id e185so131675242vkb.1
	for <qemu-arm@nongnu.org>; Fri, 08 Apr 2016 02:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=i5dJ7rv4FqmWX8I3cMaFC353wV6oM7FUTsLqDOW6lRo=;
	b=O4IjRst9L7Vs7q3GRSnZjrwFZDJjT6Inwxk5GchYic73v1Cy8lhfLVOUJhwIYHjJuz
	xbRkSNrvedU1+y3Ezq26HOF5FjDb3mMojljsE7bct3otpCNU1JgOTxEp2a3xChf06zOO
	xf5XGpk6LPiFnvUaz6IJzBLwDs0Psw9aBGQxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=i5dJ7rv4FqmWX8I3cMaFC353wV6oM7FUTsLqDOW6lRo=;
	b=mLXLMss0no50YASFgDWB7hmFMmQax0qprUyEt1euObdg2nIBOT1xM+UDjGpR6OGtu5
	k5RaFj9sIaLmZhf+JPGH7hT2XxXl+B8Wpj/SqcWmv/dFKZl3yvGO4VyD6D1fqtiSRt9+
	Zb8kknsJ2qU8JvACaWL4Ab0ds/IC+05MNau3T/2D4kv1JpyVAzBYiTLI5O6moRGV92We
	DkYqlVEmIIZCv9m1zMP3CLAdCOtk6XuVXBCfCBRn+Fjsdh4aVWPGQRnu1zibCNQzn8zJ
	sFPbItNtQ0O9FEZPIczz+h/DmWERz55/IxlPrFSw/L/zpZIQXRhiefxl54doKTF9cunS
	qmHQ==
X-Gm-Message-State: AD7BkJKallv7CnFAJ6A1w0CtaTpU0eT+Y0t5bz/WiiKyop8a+u8O8FEDC/thDvB3y0HRc3pQGsp9PYtJa2CsXTSM
X-Received: by 10.176.7.97 with SMTP id h88mr3606552uah.125.1460108633806;
	Fri, 08 Apr 2016 02:43:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Fri, 8 Apr 2016 02:43:34 -0700 (PDT)
In-Reply-To: <CALicx6ubAgfGJhGX5wRTeHfmj_RHX__hkJxAnBA8v=e8n=HgZg@mail.gmail.com>
References: <1460023087-31509-1-git-send-email-vijayak@caviumnetworks.com>
	<1460023087-31509-3-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA_0ssT32oNrgTHChKsAJNkjUfCHFGg2vPtk8-AWsRjVqw@mail.gmail.com>
	<CALicx6tM6__TWjVPLdNzMMpoyQYHZOnArFwz4E+QyyxN7TLruQ@mail.gmail.com>
	<CAFEAcA8T-90NFw_fMWRZ7JuQ4UpxRGfwsbHLi9cigsiD=zXupA@mail.gmail.com>
	<CALicx6ubAgfGJhGX5wRTeHfmj_RHX__hkJxAnBA8v=e8n=HgZg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Apr 2016 10:43:34 +0100
Message-ID: <CAFEAcA8pboFpZynTny60JRQYL0S1+HH6KoBy+de6iHOGOGBFCg@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Subject: Re: [Qemu-arm] [RFC PATCH v2 2/3] utils: Add cpuinfo helper to
 fetch /proc/cpuinfo
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
Cc: Vijaya Kumar K <vijayak@caviumnetworks.com>,
	suresh knv <knv.suresh2009@gmail.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, Suresh <ksuresh@caviumnetworks.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /AEF28nkedNv

On 8 April 2016 at 07:21, Vijay Kilari <vijay.kilari@gmail.com> wrote:
> On Thu, Apr 7, 2016 at 5:15 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> I'm told there are kernel patches in progress to get this sort
>> of information in a maintainable way to userspace, which are
>> currently somewhat stalled due to lack of anybody who wants to
>> consume it. If you have a use case then you should probably
>> flag it up with the kernel devs.
>
> Can you please give references to those patches/discussion?

I'm told the most recent thread is https://lkml.org/lkml/2015/10/5/517
(and that most of the patches in that series have gone in, except
for the last 4 or 5 which implement the ABI).

thanks
-- PMM
