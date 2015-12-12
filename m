Received: by 10.182.158.201 with SMTP id ww9csp855298obb;
        Sat, 12 Dec 2015 12:02:13 -0800 (PST)
X-Received: by 10.140.233.67 with SMTP id e64mr24337220qhc.42.1449950533046;
        Sat, 12 Dec 2015 12:02:13 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p53si26610451qge.106.2015.12.12.12.02.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 12 Dec 2015 12:02:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52875 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a7qMu-0005kC-OA
	for alex.bennee@linaro.org; Sat, 12 Dec 2015 15:02:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47541)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1a7qMr-0005gF-R6
	for qemu-arm@nongnu.org; Sat, 12 Dec 2015 15:02:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1a7qMr-0003vO-1E
	for qemu-arm@nongnu.org; Sat, 12 Dec 2015 15:02:09 -0500
Received: from mail-lf0-x229.google.com ([2a00:1450:4010:c07::229]:35810)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1a7qMm-0003nR-Jy; Sat, 12 Dec 2015 15:02:04 -0500
Received: by lfdl133 with SMTP id l133so97679487lfd.2;
	Sat, 12 Dec 2015 12:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=r1QPhePKU/EytXdHOvl/2X442vof8MpKNEiLTWmU17U=;
	b=imx5QK2Y2HpcLWEq5SpHP+2efXVQA8q09mwDR1gyw4UthD1V9R2t2vR78f6jTovdY/
	WHIE2cipt0uygohHqCF5J8ohv2UmlJ8sQNVKnW1sSwuAuJbpBpoyY8Ohl7e5P4ZeeAN5
	HU0wX7JeHMDvyaogky9k6NDsQLLEFPvct5IKjLSTue6m25Cyhj/IbQhLWAMcnQ5hDAyG
	Xq2/qzyJw3/XWNcMAyFLgRWRJBWeMJJxEOf60NHGnxd0dC2+PyvhhCNUaDmghiOMeAw+
	A0UNJ2tyuIdMaV1oLxq6/rcjF2h76nd0Ez4/rManf8+2CYmzbnHPwoRvouTkD2lrp1Ac
	WWUw==
X-Received: by 10.25.89.193 with SMTP id n184mr5237238lfb.28.1449950523191;
	Sat, 12 Dec 2015 12:02:03 -0800 (PST)
Received: from [192.168.0.65] (broadband-46-188-121-155.2com.net.
	[46.188.121.155])
	by smtp.gmail.com with ESMTPSA id y15sm2624178lfd.3.2015.12.12.12.02.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Dec 2015 12:02:01 -0800 (PST)
To: Richard Henderson <rth@twiddle.net>, qemu-devel@nongnu.org
References: <1449773244-17078-1-git-send-email-serge.fdrv@gmail.com>
	<566B5E9E.8040108@twiddle.net>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <566C7D38.4040609@gmail.com>
Date: Sat, 12 Dec 2015 23:02:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <566B5E9E.8040108@twiddle.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::229
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Anthony Green <green@moxielogic.com>, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Leon Alrae <leon.alrae@imgtec.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Jia Liu <proljc@gmail.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target-*: Get rid of "PC
	advancement" trick
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
X-TUID: OWhRhdRXwC1W

On 12/12/15 02:39, Richard Henderson wrote:
> On 12/10/2015 10:47 AM, Sergey Fedorov wrote:
>> The "PC advancement" trick was used just after recognizing that a
>> breakpoint exception was going to be generated. This trick has had two
>> points:
>>   1. Guarantee that tb->size isn't zero: there are many places where 
>> it's
>>      expected to be non-zero. In fact, that is even stated in the 
>> comment
>>      for this field.
>>   2. Try to satisfy disassembler's check for instruction length. To this
>>      end, PC advancement was done for estimated instruction length, but
>>      actually, didn't work properly in variable-instruction-length 
>> cases.
>>
>> Substitute this trick with checking for TB size at the end of
>> translation. If we get an empty TB then just set tb->size to 1 and skip
>> disassembling. Setting tb->size to 1 is enough to get correct behaviour,
>> whereas an empty TB doesn't obviously need to be disassembled.
>
> This doesn't help when the TB already has instructions, the TB would 
> ordinarily cross a page boundary, and the breakpoint is at the page 
> boundary.

I see your point. But I am wondering why most architectures stop 
translating on a page boundary whereas i386 and m86k don't. There are 
some comments which say that's to ensure instruction fetch aborts occur 
at the right place. Isn't it necessary for all architectures?

At least for those architectures which do stop translating on a page 
boundary, I think this patch is applicable. Certainly, it would be 
better to have a single solution for all architectures.

Thanks,
Sergey
