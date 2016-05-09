Received: by 10.25.208.137 with SMTP id h131csp1500220lfg;
        Mon, 9 May 2016 04:00:36 -0700 (PDT)
X-Received: by 10.55.33.167 with SMTP id f39mr17233664qki.156.1462791635988;
        Mon, 09 May 2016 04:00:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z126si18270788qkb.145.2016.05.09.04.00.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 May 2016 04:00:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40588 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1azivT-0002Rb-KS
	for alex.bennee@linaro.org; Mon, 09 May 2016 07:00:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Suzuki.Poulose@arm.com>) id 1aziuu-0001O1-9i
	for qemu-arm@nongnu.org; Mon, 09 May 2016 07:00:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Suzuki.Poulose@arm.com>) id 1aziur-00085P-0c
	for qemu-arm@nongnu.org; Mon, 09 May 2016 07:00:00 -0400
Received: from foss.arm.com ([217.140.101.70]:35830)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Suzuki.Poulose@arm.com>)
	id 1aziuq-00084N-Oz; Mon, 09 May 2016 06:59:56 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFFFF3C;
	Mon,  9 May 2016 04:00:04 -0700 (PDT)
Received: from [10.1.209.136] (e106634-lin.cambridge.arm.com [10.1.209.136])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E7A93F218;
	Mon,  9 May 2016 03:59:52 -0700 (PDT)
To: Vijay Kilari <vijay.kilari@gmail.com>,
	Catalin Marinas <Catalin.Marinas@arm.com>,
	Will Deacon <Will.Deacon@arm.com>
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
	<570E1866.9010201@arm.com>
	<CALicx6saTB9giRqubF=kUkBihvZRoCVq6XVNxvi2a+nkmzMKXA@mail.gmail.com>
From: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Message-ID: <57306DA7.4010002@arm.com>
Date: Mon, 9 May 2016 11:59:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CALicx6saTB9giRqubF=kUkBihvZRoCVq6XVNxvi2a+nkmzMKXA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.140.101.70
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Vijaya Kumar K <vijayak@caviumnetworks.com>,
	suresh knv <knv.suresh2009@gmail.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, Suresh <ksuresh@caviumnetworks.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5gweNWfnnIL8

On 09/05/16 04:30, Vijay Kilari wrote:
>>> Hi Suzuki,
>>>
>>>    The last 5 patches are not compiling on v4.4. Looks like your patch
>>> series is not merged completely. Can you please
>>> rebase your patches and let me know.
>>>
>>
>> Could you please give the tree below a try ?
>>
>> git://linux-arm.org/linux-skp.git cpu-ftr/v3-4.3-rc4
>
> This works.
> Now the question is, Are your patches getting merged anytime soon?.

Well, we have been waiting for a use case, like this, before we merge
the series.

Will, Catalin,

Now that we have some real users of the infrastructure, what do you think ?
I can post an updated/rebased series, if you would like.


Suzuki



> If not, I prefer to go with /proc/cpuinfo.
>
> Another solution is look for /sys/devices/system/cpu/cpu$ID/identification/midr
> if not available then fall back on /proc/cpuinfo.
>
> Regards
> Vijay
>

