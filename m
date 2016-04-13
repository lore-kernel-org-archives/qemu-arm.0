Received: by 10.25.208.194 with SMTP id h185csp291265lfg;
        Wed, 13 Apr 2016 02:59:38 -0700 (PDT)
X-Received: by 10.140.220.207 with SMTP id q198mr10281933qhb.103.1460541578572;
        Wed, 13 Apr 2016 02:59:38 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j9si2603699qhj.65.2016.04.13.02.59.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Apr 2016 02:59:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40412 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aqHaE-0006TX-8D
	for alex.bennee@linaro.org; Wed, 13 Apr 2016 05:59:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58979)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Suzuki.Poulose@arm.com>) id 1aqHZp-0005wx-KX
	for qemu-devel@nongnu.org; Wed, 13 Apr 2016 05:59:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Suzuki.Poulose@arm.com>) id 1aqHZo-0005uD-Kj
	for qemu-devel@nongnu.org; Wed, 13 Apr 2016 05:59:13 -0400
Received: from foss.arm.com ([217.140.101.70]:60093)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Suzuki.Poulose@arm.com>)
	id 1aqHZk-0005tK-Af; Wed, 13 Apr 2016 05:59:08 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD53B28;
	Wed, 13 Apr 2016 02:57:52 -0700 (PDT)
Received: from [10.1.209.136] (e106634-lin.cambridge.arm.com [10.1.209.136])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 681493F25E;
	Wed, 13 Apr 2016 02:59:04 -0700 (PDT)
To: Vijay Kilari <vijay.kilari@gmail.com>
References: <1460023087-31509-1-git-send-email-vijayak@caviumnetworks.com>
	<1460023087-31509-3-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA_0ssT32oNrgTHChKsAJNkjUfCHFGg2vPtk8-AWsRjVqw@mail.gmail.com>
	<CALicx6tM6__TWjVPLdNzMMpoyQYHZOnArFwz4E+QyyxN7TLruQ@mail.gmail.com>
	<CAFEAcA8T-90NFw_fMWRZ7JuQ4UpxRGfwsbHLi9cigsiD=zXupA@mail.gmail.com>
	<CALicx6ubAgfGJhGX5wRTeHfmj_RHX__hkJxAnBA8v=e8n=HgZg@mail.gmail.com>
	<CAFEAcA8pboFpZynTny60JRQYL0S1+HH6KoBy+de6iHOGOGBFCg@mail.gmail.com>
	<CALicx6vnEGxXA3yyzBg8VSHNns5kqvhFfVT23w_Hx7LLSkEq3w@mail.gmail.com>
	<570B7048.5010501@arm.com>
	<CALicx6u-LOA2gAc2f33a=VY0duHhtiHSZ=2+269daeE3YZ1xiA@mail.gmail.com>
From: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Message-ID: <570E1866.9010201@arm.com>
Date: Wed, 13 Apr 2016 10:59:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CALicx6u-LOA2gAc2f33a=VY0duHhtiHSZ=2+269daeE3YZ1xiA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.140.101.70
Subject: Re: [Qemu-devel] [RFC PATCH v2 2/3] utils: Add cpuinfo helper to
 fetch /proc/cpuinfo
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Vijaya Kumar K <vijayak@caviumnetworks.com>,
	suresh knv <knv.suresh2009@gmail.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	Will Deacon <Will.Deacon@arm.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, Catalin Marinas <Catalin.Marinas@arm.com>,
	Suresh <ksuresh@caviumnetworks.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8pl9CJd8yeW4

On 13/04/16 10:54, Vijay Kilari wrote:
> On Mon, Apr 11, 2016 at 3:07 PM, Suzuki K Poulose
> <Suzuki.Poulose@arm.com> wrote:
>> On 11/04/16 07:52, Vijay Kilari wrote:

>
> Hi Suzuki,
>
>   The last 5 patches are not compiling on v4.4. Looks like your patch
> series is not merged completely. Can you please
> rebase your patches and let me know.
>

Could you please give the tree below a try ?

git://linux-arm.org/linux-skp.git cpu-ftr/v3-4.3-rc4

Cheers
Suzuki
