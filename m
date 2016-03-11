Received: by 10.25.208.211 with SMTP id h202csp977136lfg;
        Fri, 11 Mar 2016 04:12:46 -0800 (PST)
X-Received: by 10.140.195.203 with SMTP id q194mr735297qha.45.1457698366429;
        Fri, 11 Mar 2016 04:12:46 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o40si8291676qge.54.2016.03.11.04.12.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Mar 2016 04:12:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54442 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aeLvx-00029f-Ta
	for alex.bennee@linaro.org; Fri, 11 Mar 2016 07:12:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1aeLvv-00028Z-5A
	for qemu-arm@nongnu.org; Fri, 11 Mar 2016 07:12:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1aeLvr-0001Id-KG
	for qemu-arm@nongnu.org; Fri, 11 Mar 2016 07:12:43 -0500
Received: from e06smtp14.uk.ibm.com ([195.75.94.110]:49529)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1aeLvr-0001Hi-9u
	for qemu-arm@nongnu.org; Fri, 11 Mar 2016 07:12:39 -0500
Received: from localhost
	by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <borntraeger@de.ibm.com>;
	Fri, 11 Mar 2016 12:12:37 -0000
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
	by e06smtp14.uk.ibm.com (192.168.101.144) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 11 Mar 2016 12:12:33 -0000
X-IBM-Helo: d06dlp01.portsmouth.uk.ibm.com
X-IBM-MailFrom: borntraeger@de.ibm.com
X-IBM-RcptTo: qemu-arm@nongnu.org; qemu-block@nongnu.org; qemu-devel@nongnu.org;
	qemu-ppc@nongnu.org
Received: from b06cxnps3074.portsmouth.uk.ibm.com
	(d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id 579C317D805A; 
	Fri, 11 Mar 2016 12:13:02 +0000 (GMT)
Received: from d06av03.portsmouth.uk.ibm.com (d06av03.portsmouth.uk.ibm.com
	[9.149.37.213])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u2BCCXBr6357306; Fri, 11 Mar 2016 12:12:33 GMT
Received: from d06av03.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av03.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u2BCCUjo021670; Fri, 11 Mar 2016 05:12:32 -0700
Received: from oc1450873852.ibm.com (sig-9-83-187-232.evts.uk.ibm.com
	[9.83.187.232])
	by d06av03.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u2BCCQbL021523; Fri, 11 Mar 2016 05:12:26 -0700
To: Paolo Bonzini <pbonzini@redhat.com>, rutu.shah.26@gmail.com,
	qemu-devel@nongnu.org
References: <1457638209-14218-1-git-send-email-rutu.shah.26@gmail.com>
	<56E2AFA1.5010201@de.ibm.com> <56E2B4EA.4050305@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <56E2B629.7080405@de.ibm.com>
Date: Fri, 11 Mar 2016 13:12:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56E2B4EA.4050305@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16031112-0017-0000-0000-000007926DFD
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.110
Cc: peter.maydell@linaro.org, kvm@vger.kernel.org, mst@redhat.com,
	jasowang@redhat.com, mark.cave-ayland@ilande.co.uk,
	lcapitulino@redhat.com, kraxel@redhat.com, qemu-block@nongnu.org,
	agraf@suse.de, samuel.thibault@ens-lyon.org, balrogg@gmail.com,
	alistair.francis@xilinx.com, qemu-arm@nongnu.org,
	stefanha@redhat.com, cornelia.huck@de.ibm.com, jsnow@redhat.com,
	rth@twiddle.net, kwolf@redhat.com, armbru@redhat.com,
	blauwirbel@gmail.co, qemu-ppc@nongnu.org, imammedo@redhat.com
Subject: Re: [Qemu-arm] [PATCH] Replacing (and removing) get_ticks_per_sec()
 function with NANOSECONDS_PER_SECOND Signed-off-by: Rutuja Shah
 <rutu.shah.26@gmail.com>
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
X-TUID: UyL5TuJt9YmD

On 03/11/2016 01:07 PM, Paolo Bonzini wrote:
> 
> 
> On 11/03/2016 12:44, Christian Borntraeger wrote:
>>> -    s->tick_offset_vmstate = s->tick_offset + delta / get_ticks_per_sec();
>>>> +    s->tick_offset_vmstate = s->tick_offset + delta / NANOSECONDS_PER_SECOND;
>> [...]
>>
>> While technically correct, I do not like these changes. The interfaces expect "ticks",
>> and the fact that this happens to be a nanosecond does not help regarding 
>> readability.
> 
> Actually, I think usage of "tick" in this file is just for historical
> reasons.


So in essence the patch is ok and we should try to get rid of the "tick" word in future
patches?

Christian

