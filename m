Received: by 10.25.77.65 with SMTP id a62csp1649910lfb;
        Tue, 24 Jan 2017 01:25:36 -0800 (PST)
X-Received: by 10.55.15.231 with SMTP id 100mr27672161qkp.244.1485249936148;
        Tue, 24 Jan 2017 01:25:36 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s85si12722679qke.158.2017.01.24.01.25.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Jan 2017 01:25:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47079 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cVxM5-0002P3-JY
	for alex.bennee@linaro.org; Tue, 24 Jan 2017 04:25:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36895)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1cVxLf-00025G-FY
	for qemu-arm@nongnu.org; Tue, 24 Jan 2017 04:25:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1cVxLc-000567-94
	for qemu-arm@nongnu.org; Tue, 24 Jan 2017 04:25:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43686)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1cVxLc-00055z-2s; Tue, 24 Jan 2017 04:25:04 -0500
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
	[10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3FEBB80B22;
	Tue, 24 Jan 2017 09:25:04 +0000 (UTC)
Received: from [10.36.116.246] (ovpn-116-246.ams2.redhat.com [10.36.116.246])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E62FBBEDA5;
	Tue, 24 Jan 2017 09:25:01 +0000 (UTC)
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1485132904-17632-1-git-send-email-zhaoshenglong@huawei.com>
	<20170123180247-mutt-send-email-mst@kernel.org>
	<49fcc1e0-f439-9212-25f1-9b8dce6462cc@redhat.com>
	<20170123190257-mutt-send-email-mst@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5760ee8c-f567-0dfd-456f-65f8957b22e2@redhat.com>
Date: Tue, 24 Jan 2017 10:25:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20170123190257-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 24 Jan 2017 09:25:04 +0000 (UTC)
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
X-TUID: c3O2psJuhja9



On 23/01/2017 18:04, Michael S. Tsirkin wrote:
>> For virtio-blk, my patch moved the setting of ISR from
>> virtio_queue_guest_notifier_read to virtio_notify_irqfd.  This is
>> because the irqfd emulation only needs to trigger the interrupt.
>> Setting the ISR should have been done elsewhere.
>>
>> Can vhost set ISR (I thought it couldn't)?  If so, it seems like ARM was
>> relying on QEMU's irqfd emulation, as a work around for vhost not
>> setting ISR.  But this only works if irqfd is directed to QEMU and not
>> to KVM.  So if vhost cannot set ISR, I think vhost should be disabled
>> unless MSI is active.
>>
>> Am I missing something?
>
> vhost doesn't set ISR ATM.  Without MSI we are always bouncing
> interrupts through QEMU in particular in order to set ISR.

Where is the code that disables KVM irqfd?

Paolo

> Disabling vhost when user requested it was what we did
> at some point but this just confused people.
> 
> 
