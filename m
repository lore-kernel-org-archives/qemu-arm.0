Received: by 10.25.77.65 with SMTP id a62csp1366651lfb;
        Mon, 30 Jan 2017 02:47:22 -0800 (PST)
X-Received: by 10.55.221.5 with SMTP id n5mr19812116qki.58.1485773242808;
        Mon, 30 Jan 2017 02:47:22 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z65si4555438qke.324.2017.01.30.02.47.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Jan 2017 02:47:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59565 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cY9UW-00046n-4N
	for alex.bennee@linaro.org; Mon, 30 Jan 2017 05:47:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cY9T5-0003B8-TW
	for qemu-devel@nongnu.org; Mon, 30 Jan 2017 05:45:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cY9T4-00020h-Mb
	for qemu-devel@nongnu.org; Mon, 30 Jan 2017 05:45:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52852)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1cY9Sz-0001pN-9N; Mon, 30 Jan 2017 05:45:45 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 38A7FC056793;
	Mon, 30 Jan 2017 10:45:44 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-36.ams2.redhat.com
	[10.36.116.36])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0UAjd8o008201
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 30 Jan 2017 05:45:41 -0500
To: quintela@redhat.com
References: <1485422381-29019-1-git-send-email-eric.auger@redhat.com>
	<1485422381-29019-4-git-send-email-eric.auger@redhat.com>
	<87vasw29jy.fsf@emacs.mitica>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <21a261aa-15ac-d24f-8318-ec1a659fc293@redhat.com>
Date: Mon, 30 Jan 2017 11:45:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <87vasw29jy.fsf@emacs.mitica>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 30 Jan 2017 10:45:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC 3/4] hw/intc/arm_gicv3_its: Implement state
 save/restore
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, vijay.kilari@gmail.com,
	christoffer.dall@linaro.org, qemu-devel@nongnu.org,
	peterx@redhat.com, Vijaya.Kumar@cavium.com, qemu-arm@nongnu.org,
	shannon.zhao@linaro.org, dgilbert@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FCFec7j95fm7

Hi Juan,

On 30/01/2017 10:15, Juan Quintela wrote:
> Eric Auger <eric.auger@redhat.com> wrote:
>> We need to handle both registers and ITS tables. While
>> register handling is standard, ITS table handling is more
>> challenging since the kernel API is devised so that the
>> tables are flushed into guest RAM and not in vmstate buffers.
>>
>> Flushing the ITS tables on device pre_save() is too late
>> since the guest RAM had already been saved at this point.
>>
>> Table flushing needs to happen when we are sure the vcpus
>> are stopped and before the last dirty page saving. The
>> right point is RUN_STATE_FINISH_MIGRATE but sometimes the
>> VM gets stopped before migration launch so let's simply
>> flush the tables each time the VM gets stopped.
>>
>> For regular ITS registers we just can use vmstate pre_save
>> and post_load callbacks.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> Hi
> 
> 
>> + * vm_change_state_handler - VM change state callback aiming at flushing
>> + * ITS tables into guest RAM
>> + *
>> + * The tables get flushed to guest RAM whenever the VM gets stopped.
>> + */
>> +static void vm_change_state_handler(void *opaque, int running,
>> +                                    RunState state)
>> +{
>> +    GICv3ITSState *s = (GICv3ITSState *)opaque;
> 
> Cast is unneeded.
> 
>> +
>> +    if (running) {
>> +        return;
>> +    }
>> +    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_TABLES,
>> +                      0, NULL, false);
> 
> As you are adding it to do everytime that we stop the guest, how
> expensive/slow is that?

This is highly dependent on the number of devices using MSIs and number
of allocated MSIs on guest. The number of bytes to transfer basically is:

(#nb_vcpus + #nb_devices_using_MSI_on_guest  +  2 *
nb_allocated_guest_MSIs bytes ) * 8 bytes

So I would say < 10 kB in real life case. In my virtio-pci test case it
is just 440 Bytes.

For live migration I could hook a callback at RUN_STATE_FINISH_MIGRATE.
However this does not work with virsh save/restore use case since the
notifier is not called (the VM being already paused), hence that choice.

Thanks

Eric

> 
> Thanks, Juan.
> 
