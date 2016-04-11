Received: by 10.25.208.211 with SMTP id h202csp1265443lfg;
        Sun, 10 Apr 2016 23:52:36 -0700 (PDT)
X-Received: by 10.140.152.78 with SMTP id 75mr26900906qhy.22.1460357555913;
        Sun, 10 Apr 2016 23:52:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t3si584277qha.16.2016.04.10.23.52.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Apr 2016 23:52:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48496 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1apVi7-0004rC-G3
	for alex.bennee@linaro.org; Mon, 11 Apr 2016 02:52:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44787)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1apVi4-0004mW-PV
	for qemu-arm@nongnu.org; Mon, 11 Apr 2016 02:52:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1apVi3-00010E-PE
	for qemu-arm@nongnu.org; Mon, 11 Apr 2016 02:52:32 -0400
Received: from mail-oi0-x234.google.com ([2607:f8b0:4003:c06::234]:34844)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1apVi3-000109-LR; Mon, 11 Apr 2016 02:52:31 -0400
Received: by mail-oi0-x234.google.com with SMTP id p188so196477037oih.2;
	Sun, 10 Apr 2016 23:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=QVWHRLtfGuoRRWgLPW6oGV1OpODXWMsI9SW4sJE0WYc=;
	b=AuHk4lV0tFfuSyyRBtHpUwi/P8wLSKe0+BQhEp2aumDTE65F+Pk8RdP0zyNWhPuYH2
	6wTAAccKtj0YBXDEngLrrcQJfXs2yKKMwD9tLbSontRWF8J8xcOI7i9pGdpm0qfl4Ffe
	NMRMWcOiUvvQCMiTPTxX2Us75VS+urYUbItYfqUAYuojpxD6KpLTka8cz0cWJYPipPRZ
	IgbRXcRu513qHGAsXfiFP4Xf9mhzKPsVbHt71saQWoD5S7SPvid6kxiD1tb5Jberhq2m
	RwGA3gZStPbmbToIhLsHbV883kqIAg35oyKxkq2QgUY7tDinklxZPY2y8PFxCyKv/vHU
	xbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=QVWHRLtfGuoRRWgLPW6oGV1OpODXWMsI9SW4sJE0WYc=;
	b=KbxZEm5aD1Yo0V0CLa9K3ErbczUYhlPwwZDxK8/muaPfHBNXpozxln3sqAqysQZ2EF
	U5oVM4/bobnh0ysL+vmEizTkCiZQKn5EGyYeJX9NPAKrkn5175WSsB00p/fda1cwLUkK
	fJBMgLZKb0sxYZ4JFVUmfq8eiMSHjlSkEsMMctYCXlz7dX3AbP4iM+1AkG2xvK2UGaRr
	lInAe76kToKmJy/BVCMOFSlFBCQNAUQqNicPTjN5zs+jwQk3Ylgey0RnlIuwgfxbgOB/
	R6Ks0FPxnlktifbowHyfbZ4dS1kkA17a6VD9Mjjx43YKxGPspbwKyGoOYLWWfhBHlhqp
	5tnQ==
X-Gm-Message-State: AD7BkJKpY9CkHZ34yFMozXUFK8cclFSiufzmvHoxX8gnqFS0qUeU9moqkcV3G9epw8rXsQj4sR5uBQVsVdNwrg==
MIME-Version: 1.0
X-Received: by 10.157.44.139 with SMTP id p11mr9994450otb.124.1460357550697;
	Sun, 10 Apr 2016 23:52:30 -0700 (PDT)
Received: by 10.157.54.2 with HTTP; Sun, 10 Apr 2016 23:52:30 -0700 (PDT)
In-Reply-To: <CAFEAcA8pboFpZynTny60JRQYL0S1+HH6KoBy+de6iHOGOGBFCg@mail.gmail.com>
References: <1460023087-31509-1-git-send-email-vijayak@caviumnetworks.com>
	<1460023087-31509-3-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA_0ssT32oNrgTHChKsAJNkjUfCHFGg2vPtk8-AWsRjVqw@mail.gmail.com>
	<CALicx6tM6__TWjVPLdNzMMpoyQYHZOnArFwz4E+QyyxN7TLruQ@mail.gmail.com>
	<CAFEAcA8T-90NFw_fMWRZ7JuQ4UpxRGfwsbHLi9cigsiD=zXupA@mail.gmail.com>
	<CALicx6ubAgfGJhGX5wRTeHfmj_RHX__hkJxAnBA8v=e8n=HgZg@mail.gmail.com>
	<CAFEAcA8pboFpZynTny60JRQYL0S1+HH6KoBy+de6iHOGOGBFCg@mail.gmail.com>
Date: Mon, 11 Apr 2016 12:22:30 +0530
Message-ID: <CALicx6vnEGxXA3yyzBg8VSHNns5kqvhFfVT23w_Hx7LLSkEq3w@mail.gmail.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, suzuki.poulose@arm.com
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::234
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
X-TUID: OIM3+Q+78o6C

Adding Suzuki Poulose.

Hi Suzuki,

On Fri, Apr 8, 2016 at 3:13 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 8 April 2016 at 07:21, Vijay Kilari <vijay.kilari@gmail.com> wrote:
>> On Thu, Apr 7, 2016 at 5:15 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> I'm told there are kernel patches in progress to get this sort
>>> of information in a maintainable way to userspace, which are
>>> currently somewhat stalled due to lack of anybody who wants to
>>> consume it. If you have a use case then you should probably
>>> flag it up with the kernel devs.
>>
>> Can you please give references to those patches/discussion?
>
> I'm told the most recent thread is https://lkml.org/lkml/2015/10/5/517
> (and that most of the patches in that series have gone in, except
> for the last 4 or 5 which implement the ABI).

Can you please throw some light on what is the status of ABI to
read cpu information in user space.
I wanted to know cpu implementer, part number in QEMU utils
to add prefetches to speed up live migration for Thunderx platform.
