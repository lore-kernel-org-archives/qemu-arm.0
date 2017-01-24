Received: by 10.25.77.65 with SMTP id a62csp1819687lfb;
        Tue, 24 Jan 2017 07:51:03 -0800 (PST)
X-Received: by 10.200.46.123 with SMTP id s56mr30841495qta.8.1485273063321;
        Tue, 24 Jan 2017 07:51:03 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o34si13442395qtd.104.2017.01.24.07.51.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Jan 2017 07:51:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50869 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cW3N6-0002zV-Ld
	for alex.bennee@linaro.org; Tue, 24 Jan 2017 10:51:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1cW3My-0002zL-2T
	for qemu-arm@nongnu.org; Tue, 24 Jan 2017 10:50:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1cW3Mv-0000WW-1s
	for qemu-arm@nongnu.org; Tue, 24 Jan 2017 10:50:52 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33716)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1cW3Mu-0000WH-SV; Tue, 24 Jan 2017 10:50:48 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6FC29C04BD36;
	Tue, 24 Jan 2017 15:50:48 +0000 (UTC)
Received: from [10.36.116.246] (ovpn-116-246.ams2.redhat.com [10.36.116.246])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id v0OFojT1010950
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 24 Jan 2017 10:50:46 -0500
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1485132904-17632-1-git-send-email-zhaoshenglong@huawei.com>
	<20170123180247-mutt-send-email-mst@kernel.org>
	<49fcc1e0-f439-9212-25f1-9b8dce6462cc@redhat.com>
	<20170123190257-mutt-send-email-mst@kernel.org>
	<5760ee8c-f567-0dfd-456f-65f8957b22e2@redhat.com>
	<20170124164204-mutt-send-email-mst@kernel.org>
	<9a61e616-9bf8-b4ff-43b9-68f1c908b910@redhat.com>
	<20170124170514-mutt-send-email-mst@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f5af901b-d355-94e7-fdf1-ad1b88223bd7@redhat.com>
Date: Tue, 24 Jan 2017 16:50:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20170124170514-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 24 Jan 2017 15:50:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH V2] virtio: Fix no interrupt when not
 creating msi controller
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	christoffer.dall@linaro.org, Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c3KcQoFcJXV4



On 24/01/2017 16:05, Michael S. Tsirkin wrote:
>>
>> So we have four cases:
>>
>> - assign with emulated irqfd + ISR
>> - assign with emulated irqfd
>> - assign with irqfd
>> - deassign
>>
>> Currently we don't distinguish the first two, so (which I don't like)
>> Shannon's patch ends up setting ISR twice.
> 
> I don't see this yet - where is it set twice?

Once in virtio_notify_irqfd, once in virtio_queue_guest_notifier_read.

Unfortunately, for virtio-blk + MSI + KVM + old Windows drivers we need
the one in virtio_notify_irqfd.  For virtio-net + vhost + INTx we need
the one in virtio_queue_guest_notifier_read.
