Received: by 10.25.208.211 with SMTP id h202csp1333216lfg;
        Mon, 11 Apr 2016 02:59:47 -0700 (PDT)
X-Received: by 10.55.23.68 with SMTP id i65mr26719016qkh.74.1460368787428;
        Mon, 11 Apr 2016 02:59:47 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g81si19683635qkb.56.2016.04.11.02.59.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Apr 2016 02:59:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51624 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1apYdH-0001EO-1v
	for alex.bennee@linaro.org; Mon, 11 Apr 2016 05:59:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58665)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Suzuki.Poulose@arm.com>) id 1apYPn-0001Jr-Ds
	for qemu-arm@nongnu.org; Mon, 11 Apr 2016 05:45:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Suzuki.Poulose@arm.com>) id 1apYPh-0004co-RU
	for qemu-arm@nongnu.org; Mon, 11 Apr 2016 05:45:51 -0400
Received: from foss.arm.com ([217.140.101.70]:46885)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Suzuki.Poulose@arm.com>)
	id 1apYPh-0004ci-M0; Mon, 11 Apr 2016 05:45:45 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7270B28;
	Mon, 11 Apr 2016 02:36:03 -0700 (PDT)
Received: from [10.1.209.136] (e106634-lin.cambridge.arm.com [10.1.209.136])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4AC953F25F;
	Mon, 11 Apr 2016 02:37:14 -0700 (PDT)
To: Vijay Kilari <vijay.kilari@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1460023087-31509-1-git-send-email-vijayak@caviumnetworks.com>
	<1460023087-31509-3-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA_0ssT32oNrgTHChKsAJNkjUfCHFGg2vPtk8-AWsRjVqw@mail.gmail.com>
	<CALicx6tM6__TWjVPLdNzMMpoyQYHZOnArFwz4E+QyyxN7TLruQ@mail.gmail.com>
	<CAFEAcA8T-90NFw_fMWRZ7JuQ4UpxRGfwsbHLi9cigsiD=zXupA@mail.gmail.com>
	<CALicx6ubAgfGJhGX5wRTeHfmj_RHX__hkJxAnBA8v=e8n=HgZg@mail.gmail.com>
	<CAFEAcA8pboFpZynTny60JRQYL0S1+HH6KoBy+de6iHOGOGBFCg@mail.gmail.com>
	<CALicx6vnEGxXA3yyzBg8VSHNns5kqvhFfVT23w_Hx7LLSkEq3w@mail.gmail.com>
From: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Message-ID: <570B7048.5010501@arm.com>
Date: Mon, 11 Apr 2016 10:37:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CALicx6vnEGxXA3yyzBg8VSHNns5kqvhFfVT23w_Hx7LLSkEq3w@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.140.101.70
X-Mailman-Approved-At: Mon, 11 Apr 2016 05:59:45 -0400
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
	Will Deacon <Will.Deacon@arm.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, Catalin Marinas <Catalin.Marinas@arm.com>,
	Suresh <ksuresh@caviumnetworks.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rW5cGy3YXdmC

On 11/04/16 07:52, Vijay Kilari wrote:
> Adding Suzuki Poulose.
>
> Hi Suzuki,
>
> On Fri, Apr 8, 2016 at 3:13 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 8 April 2016 at 07:21, Vijay Kilari <vijay.kilari@gmail.com> wrote:
>>> On Thu, Apr 7, 2016 at 5:15 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>> I'm told there are kernel patches in progress to get this sort
>>>> of information in a maintainable way to userspace, which are
>>>> currently somewhat stalled due to lack of anybody who wants to
>>>> consume it. If you have a use case then you should probably
>>>> flag it up with the kernel devs.
>>>
>>> Can you please give references to those patches/discussion?
>>
>> I'm told the most recent thread is https://lkml.org/lkml/2015/10/5/517
>> (and that most of the patches in that series have gone in, except
>> for the last 4 or 5 which implement the ABI).
>
> Can you please throw some light on what is the status of ABI to
> read cpu information in user space.
> I wanted to know cpu implementer, part number in QEMU utils
> to add prefetches to speed up live migration for Thunderx platform.
>

As for the patch series, except for that last 5 patches (which actually implements
the ABI), the infrastructure patches have been merged in v4.4.

We are awaiting feedback from possible consumers like toolchain (gcc, glibc).
If you think this will be suitable for you, thats good to know. There is
documentation available in the last patch in the above series. Could you please
try the series (on v4.4, which would be easier, by simply picking up the last
5 patches) and let us know if that works for you ?

Cheers
Suzuki

