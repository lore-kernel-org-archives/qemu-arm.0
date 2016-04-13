Received: by 10.25.208.194 with SMTP id h185csp289489lfg;
        Wed, 13 Apr 2016 02:54:43 -0700 (PDT)
X-Received: by 10.140.168.85 with SMTP id o82mr10140047qho.16.1460541283609;
        Wed, 13 Apr 2016 02:54:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y105si4207503qge.70.2016.04.13.02.54.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Apr 2016 02:54:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40312 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aqHVT-00009u-6Y
	for alex.bennee@linaro.org; Wed, 13 Apr 2016 05:54:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57791)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1aqHVP-00006T-KD
	for qemu-arm@nongnu.org; Wed, 13 Apr 2016 05:54:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1aqHVO-0004as-L1
	for qemu-arm@nongnu.org; Wed, 13 Apr 2016 05:54:39 -0400
Received: from mail-oi0-x22c.google.com ([2607:f8b0:4003:c06::22c]:33315)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1aqHVO-0004aP-GY; Wed, 13 Apr 2016 05:54:38 -0400
Received: by mail-oi0-x22c.google.com with SMTP id w85so57028330oiw.0;
	Wed, 13 Apr 2016 02:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=juUHTpxsrf26XwmZeC/m0RflqS/T0LUwgBgnwjj7iA8=;
	b=B87HfTPiWGJhm/tCHnRs5dvGa5o+/G3DrUaZvSjpVCLcdbqybyvAoDHKekI7n8TOCL
	mCS8AUhmYB1kA4SM2QRnr+Vc7L17vCZ726LPGncMFeQzoP8JP/v3MGXyj239jaTHAxhv
	0yGmrFWmOUxyAXv4qgR3O7wzVOokgVyxYUqKyQU8YN57MXw3t7a40Hq6OvTE1lvq2K1K
	ELh+1FuFWLYxTroIUCEkKDc6gFmTf50bztOik2UEJbd1bd+yRjcVoEO0IE8UPU1U93On
	H7wxhkKhR1xzDn0AUrB8qMBtJNBoDIahuI+wRJc8reYTLrHUJ6cK5JVx8xwpq3JWkOGj
	Qlvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=juUHTpxsrf26XwmZeC/m0RflqS/T0LUwgBgnwjj7iA8=;
	b=dm1wshDYdHHLNm+szhBingf93AwHX4f7w76H26n4Y1dolzkxeuNun8ZXMWfnhpfCWt
	B3zri0ye43DcRTvq+yBqQYSNB4WZSAolynb0QihRSEwDb4k9w1saIsQJ6CP3z0duLvKz
	uCU9WO/3T2T4hQ4rO6/gUnnzwNDb6rfq6azLYk5YHsJ2NwTHb2ow0c7uf4FJcwvNKtHp
	E0Nsx0DQP7AhBbwxCY0vlbbol669kWgvr7HnHNBggGSU0A70p1HntoKRB8LHMb6IL46G
	gYY0Qf0KTq5tJ7q3l/0npNPfv1vGCqYImmhpoXh4mOYaVKvNItqQ9taaxXHWSKXi47ru
	uAuA==
X-Gm-Message-State: AOPr4FV/+Z2Srr9d9VIp5IxR7tERUXi8u92Iegzpm1d23l1yYQL1NmQkx1BJWvevjIIM3o/Ug40oEC3s/oSIOQ==
MIME-Version: 1.0
X-Received: by 10.202.79.194 with SMTP id d185mr3771984oib.69.1460541277667;
	Wed, 13 Apr 2016 02:54:37 -0700 (PDT)
Received: by 10.157.54.2 with HTTP; Wed, 13 Apr 2016 02:54:37 -0700 (PDT)
In-Reply-To: <570B7048.5010501@arm.com>
References: <1460023087-31509-1-git-send-email-vijayak@caviumnetworks.com>
	<1460023087-31509-3-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA_0ssT32oNrgTHChKsAJNkjUfCHFGg2vPtk8-AWsRjVqw@mail.gmail.com>
	<CALicx6tM6__TWjVPLdNzMMpoyQYHZOnArFwz4E+QyyxN7TLruQ@mail.gmail.com>
	<CAFEAcA8T-90NFw_fMWRZ7JuQ4UpxRGfwsbHLi9cigsiD=zXupA@mail.gmail.com>
	<CALicx6ubAgfGJhGX5wRTeHfmj_RHX__hkJxAnBA8v=e8n=HgZg@mail.gmail.com>
	<CAFEAcA8pboFpZynTny60JRQYL0S1+HH6KoBy+de6iHOGOGBFCg@mail.gmail.com>
	<CALicx6vnEGxXA3yyzBg8VSHNns5kqvhFfVT23w_Hx7LLSkEq3w@mail.gmail.com>
	<570B7048.5010501@arm.com>
Date: Wed, 13 Apr 2016 15:24:37 +0530
Message-ID: <CALicx6u-LOA2gAc2f33a=VY0duHhtiHSZ=2+269daeE3YZ1xiA@mail.gmail.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
To: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::22c
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
	Will Deacon <Will.Deacon@arm.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, Catalin Marinas <Catalin.Marinas@arm.com>,
	Suresh <ksuresh@caviumnetworks.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OoZUTJWOIkgD

On Mon, Apr 11, 2016 at 3:07 PM, Suzuki K Poulose
<Suzuki.Poulose@arm.com> wrote:
> On 11/04/16 07:52, Vijay Kilari wrote:
>>
>> Adding Suzuki Poulose.
>>
>> Hi Suzuki,
>>
>> On Fri, Apr 8, 2016 at 3:13 PM, Peter Maydell <peter.maydell@linaro.org>
>> wrote:
>>>
>>> On 8 April 2016 at 07:21, Vijay Kilari <vijay.kilari@gmail.com> wrote:
>>>>
>>>> On Thu, Apr 7, 2016 at 5:15 PM, Peter Maydell <peter.maydell@linaro.org>
>>>> wrote:
>>>>>
>>>>> I'm told there are kernel patches in progress to get this sort
>>>>> of information in a maintainable way to userspace, which are
>>>>> currently somewhat stalled due to lack of anybody who wants to
>>>>> consume it. If you have a use case then you should probably
>>>>> flag it up with the kernel devs

Hi Peter,

   Looks like getting Suzuki's patches merged might take some time.
I propose to use /proc/cpuinfo for now and later I can move to using
Suzuki's way.


>>>>
>>>>
>>>> Can you please give references to those patches/discussion?
>>>
>>>
>>> I'm told the most recent thread is https://lkml.org/lkml/2015/10/5/517
>>> (and that most of the patches in that series have gone in, except
>>> for the last 4 or 5 which implement the ABI).
>>
>>
>> Can you please throw some light on what is the status of ABI to
>> read cpu information in user space.
>> I wanted to know cpu implementer, part number in QEMU utils
>> to add prefetches to speed up live migration for Thunderx platform.
>>
>
> As for the patch series, except for that last 5 patches (which actually
> implements
> the ABI), the infrastructure patches have been merged in v4.4.
>
> We are awaiting feedback from possible consumers like toolchain (gcc,
> glibc).
> If you think this will be suitable for you, thats good to know. There is
> documentation available in the last patch in the above series. Could you
> please
> try the series (on v4.4, which would be easier, by simply picking up the
> last
> 5 patches) and let us know if that works for you ?

Hi Suzuki,

 The last 5 patches are not compiling on v4.4. Looks like your patch
series is not merged completely. Can you please
rebase your patches and let me know.
