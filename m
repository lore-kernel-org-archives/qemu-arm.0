Received: by 10.80.163.71 with SMTP id 65csp4070057edn;
        Fri, 7 Oct 2016 21:26:29 -0700 (PDT)
X-Received: by 10.200.47.68 with SMTP id k4mr15233426qta.127.1475900789311;
        Fri, 07 Oct 2016 21:26:29 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d4si11571089qkf.184.2016.10.07.21.26.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Oct 2016 21:26:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39257 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bsjDQ-0004iE-Uf
	for alex.bennee@linaro.org; Sat, 08 Oct 2016 00:26:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34853)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bsjDM-0004gK-I3
	for qemu-arm@nongnu.org; Sat, 08 Oct 2016 00:26:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bsjDK-0003Ly-E9
	for qemu-arm@nongnu.org; Sat, 08 Oct 2016 00:26:23 -0400
Received: from mail-vk0-x242.google.com ([2607:f8b0:400c:c05::242]:35101)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bsjDK-0003LA-8n; Sat, 08 Oct 2016 00:26:22 -0400
Received: by mail-vk0-x242.google.com with SMTP id 192so2546039vkl.2;
	Fri, 07 Oct 2016 21:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=f2SNIQXqH/9W029gVsOaZ7uR4Z/Z70reRiXvduvc02E=;
	b=DxCGxJ+Ei4TNtV0MENRYRsPin40rOZ5yXiwyJGkP8zH62HusbbPWlk32nHA3uRIwcE
	j1whnZHPE2cwh9Y8+iTKCe6cRj5kqJDRE3xk8wzDUYjQJdi8azdwC/zCpbjjHjoPAXMV
	Y2eCbcHl9J1/P7L3VW3BmywE7EF3sPv0tr6nw30LQRhSdBlHXtjCLFW/oz3CBI01xAuc
	6d2V+BXSj5ax8zmcu4UrrJKQ1SvJ2oIL7eVaIT621tG+m3qx6Q8VCo7dUhVS7q6x3z6a
	Rmnm00/n653z1ccZZnV/0vBWkoOmKsqUApCcIYTrNQc5c4CSvfA8bANxajEsFhbm/pNK
	s6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=f2SNIQXqH/9W029gVsOaZ7uR4Z/Z70reRiXvduvc02E=;
	b=HYl+U6j6OIy2ETZMSPJbJU/RjrYhgle+HkGszZFN5PuYNXU4xpgwxzxJOU5QJZAb3T
	EL8n0L42w4s8Lce2tPA0l1a98Mkpc/8MA05weM2gp1E7KDLsaPWX9Bfi74IDKN4vh1Mh
	fb1X8pIqXwi9ECJTPwvhwEt2E8M59kMpM2EHNxXwaJ2bs6fbjYEiWD+rG6kYIjw1FAl0
	8RG4ywifoRrIkN51Dlt+oQitrNFgTAK88qnGSnb+LV7YbwBZnEIdRP65+Ss+43trYsmh
	zF+VuaAqQDpl/Zwcq6fQ/PvHhFCMeh9GpRi3AGs7JBTvUUqU4B06MHXGTfQ95EdxhBhZ
	0t5A==
X-Gm-Message-State: AA6/9Rnpad0GKM10HwdCowI1hSIHQIDmk1xnndIXIHhIvJAaEUQnhegKFL13/zQ7KJ68VEhRiDHhQd+CnIcX5A==
X-Received: by 10.31.3.155 with SMTP id f27mr15178846vki.64.1475900780608;
	Fri, 07 Oct 2016 21:26:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.93.135 with HTTP; Fri, 7 Oct 2016 21:26:20 -0700 (PDT)
In-Reply-To: <CAFEAcA8+zb4BAQ4FFrY89U5SnuLnmzSOXZMRMXeX5F3zTLZFEw@mail.gmail.com>
References: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA8iPStWP4Pcf6Bxmn8gL5SnBDFyrPNDUpi8syc7PC_QiQ@mail.gmail.com>
	<BLUPR0701MB1684CF1920D922BD00E93EE6F2230@BLUPR0701MB1684.namprd07.prod.outlook.com>
	<CALicx6tbpSZDBYYzA0Uk5dHGoW-4_CTFuUnUDDe+NGieakts+g@mail.gmail.com>
	<CALicx6tk2xkVf=Rz9KG-v-0xLb5=Tz1VidjuBDiqP0j-p+x=Pw@mail.gmail.com>
	<CAFEAcA9wNtFSmoJD2jHOy2LWPNBa_f1WyG1VBO2d5pSD0LQjgA@mail.gmail.com>
	<CAFEAcA8+zb4BAQ4FFrY89U5SnuLnmzSOXZMRMXeX5F3zTLZFEw@mail.gmail.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Sat, 8 Oct 2016 09:56:20 +0530
Message-ID: <CALicx6s-C=BAWw2MFkwduOKZmz-qCF_4OOQ=92jTo7nOiNC5fA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::242
Subject: Re: [Qemu-arm] Fw:  [PATCH v2 0/6] Runtime pagesize computation
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
Cc: "prasun.kapoor" <prasun.kapoor@cavium.com>,
	Patch Tracking <patches@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, "Kumar,
	Vijaya" <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XqjEnTfV2r8m

Hi Peter,

On Fri, Oct 7, 2016 at 7:50 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 19 July 2016 at 12:04, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 19 July 2016 at 12:01, Vijay Kilari <vijay.kilari@gmail.com> wrote:
>>> Hi Peter,
>>>
>>>   Any update on this patch set. Is it merged?
>>
>> No. It's an RFC patchset really, and it was posted during softfreeze,
>> so I never expected or intended it to be merged before the 2.7
>> release. It also needs a respin to address some of the review comments
>> I got on it.
>>
>> What would be useful in getting it further forward would be
>> some good performance benchmarking of more than just migration.
>> In particular whether it improves the speed in TCG emulation
>> mode of aarch64 guests and whether that assert in the definition
>> of TARGET_PAGE_BITS is particularly performance-draining.
>
> If I do a respin of this patchset is anybody willing to do
> the actual perf benchmarking of the TCG emulation?
> Otherwise this is unlikely to go into 2.8.

 I can help you. Let me know details on benchmarkings to be done.
Also, a reference/details about running arm64 guests in TCG mode
would be helpful.

Regards
Vijay
