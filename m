Received: by 10.25.21.96 with SMTP id l93csp1777209lfi;
        Tue, 28 Jun 2016 11:15:18 -0700 (PDT)
X-Received: by 10.200.52.197 with SMTP id x5mr1627894qtb.41.1467137718572;
        Tue, 28 Jun 2016 11:15:18 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s86si5065377qks.197.2016.06.28.11.15.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Jun 2016 11:15:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38648 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHxXa-0002iS-0D
	for alex.bennee@linaro.org; Tue, 28 Jun 2016 14:15:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bHxSy-00047T-Tv
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 14:10:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bHxSq-0005GU-Sw
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 14:10:28 -0400
Received: from 8.mo3.mail-out.ovh.net ([87.98.172.249]:58618)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bHxSq-0005Fs-MB
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 14:10:24 -0400
Received: from player772.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id ADA54FF910C
	for <qemu-arm@nongnu.org>; Tue, 28 Jun 2016 20:10:22 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player772.ha.ovh.net (Postfix) with ESMTPSA id 49C6F4C0069;
	Tue, 28 Jun 2016 20:10:17 +0200 (CEST)
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1467122287-24974-1-git-send-email-peter.maydell@linaro.org>
	<312978165.2723879.1467136420274.JavaMail.zimbra@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <46813d30-63b5-4144-5c20-dfea1c3f401d@kaod.org>
Date: Tue, 28 Jun 2016 20:10:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <312978165.2723879.1467136420274.JavaMail.zimbra@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 13658854720529271555
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrudefgdduudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 87.98.172.249
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.7 0/3] Add
 memory_region_init_rom() and use to fix imx board crashes
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org,
	Jean-Christophe DUBOIS <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XXhnVjh/Qscj

On 06/28/2016 07:53 PM, Paolo Bonzini wrote:
> 
>> We can then add an assert() in memory_region_init_rom_device()
>> to prevent further misuse. (Passing NULL was documented as
>> "I/O space is not supposed to be handled by QEMU itself", but this
>> doesn't make much sense (who would be handling the writes?) and
>> isn't used by any of the callers.)
>>
>> This is for-2.7 because it fixes a crash in the imx boards
>> if the guest misbehaves:
>> https://bugs.launchpad.net/qemu/+bug/1596160
> 
> Go ahead and include this in target-arm (and since we're at it,
> it would be great if you handled Cedric's m25p80 series when he
> sends out the rebase).

Quick question, who is handling this one :

	https://lists.gnu.org/archive/html/qemu-devel/2016-06/msg04339.html

Shall I include it also in the patchset ? 

Thanks,

C. 

