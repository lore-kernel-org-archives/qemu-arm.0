Received: by 10.25.205.13 with SMTP id d13csp312150lfg;
        Tue, 10 Jan 2017 08:30:54 -0800 (PST)
X-Received: by 10.237.36.129 with SMTP id t1mr3542027qtc.202.1484065854694;
        Tue, 10 Jan 2017 08:30:54 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 44si1668967qtt.208.2017.01.10.08.30.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jan 2017 08:30:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48286 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cQzK2-0001PS-2q
	for alex.bennee@linaro.org; Tue, 10 Jan 2017 11:30:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1cQzJT-000147-MA
	for qemu-arm@nongnu.org; Tue, 10 Jan 2017 11:30:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1cQzJQ-0004Zu-AR
	for qemu-arm@nongnu.org; Tue, 10 Jan 2017 11:30:19 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59808)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1cQzJQ-0004ZB-28; Tue, 10 Jan 2017 11:30:16 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F32AA8FCE8;
	Tue, 10 Jan 2017 16:30:15 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-126.phx2.redhat.com
	[10.3.116.126])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0AGUCLh020849; Tue, 10 Jan 2017 11:30:13 -0500
To: Igor Mammedov <imammedo@redhat.com>
References: <20161201170624.26496-1-lersek@redhat.com>
	<20170110170453-mutt-send-email-mst@kernel.org>
	<26322db9-c82b-405f-b2a8-f2d16b0d69b0@redhat.com>
	<20170110172112.550e4e4b@Igors-MacBook-Pro.local>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <bebcfae9-c60a-3f44-8f45-bd152e77a2b1@redhat.com>
Date: Tue, 10 Jan 2017 17:30:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170110172112.550e4e4b@Igors-MacBook-Pro.local>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 10 Jan 2017 16:30:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 0/7] q35: add negotiable
 broadcast SMI
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
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, "Gabriel L. Somlo" <somlo@cmu.edu>,
	qemu devel list <qemu-devel@nongnu.org>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9GLEAkMysagb

On 01/10/17 17:21, Igor Mammedov wrote:
> On Tue, 10 Jan 2017 16:23:41 +0100
> Laszlo Ersek <lersek@redhat.com> wrote:
> 
>> On 01/10/17 16:06, Michael S. Tsirkin wrote:
>>> On Thu, Dec 01, 2016 at 06:06:17PM +0100, Laszlo Ersek wrote:
>>>> * This is version 4 of the series; the last version was at
>>>>   <http://lists.nongnu.org/archive/html/qemu-devel/2016-11/msg03582.html>.
>>>>
>>>>   This version is practically a rewrite from scratch, seeking to address
>>>>   the v3 feedback. Here's what the individual patches do:
>>>>
>>>>   - Patch #1 rebases and extends Michael's "writeable fw_cfg blobs"
>>>>     patch from Feb/March 2016. The changes relative to the original
>>>>     patch are documented in the commit message (the code changes are
>>>>     minimal).
>>>>
>>>>   - Patches #2 and #3 turn the FW_CFG_FILE_SLOTS constant into a device
>>>>     property, and expose the desired number of fw_cfg file slots to
>>>>     board code. This is meant to address a concern raised by Paolo in
>>>>     the v2 review
>>>>     <http://lists.nongnu.org/archive/html/qemu-devel/2016-11/msg03125.html>,
>>>>     namely that we're about to run out of FW_CFG_FILE_SLOTS.
>>>>
>>>>   - Patch #4 introduces the "pc-q35-2.9" and "pc-i440fx-2.9" machine
>>>>     types, which are allowed to take advantage of the new default for
>>>>     fw_cfg file slots (0x20 rather than 0x10).
>>>>
>>>>   - Patch #5 introduces SMI feature negotiation via fw_cfg, with the
>>>>     following new files:
>>>>
>>>>     - etc/smi/host-features
>>>>     - etc/smi/guest-features
>>>>     - etc/smi/features-ok
>>>>
>>>>     This is supposed to follow Michael's recommendation re: imitating
>>>>     virtio
>>>>     <http://lists.nongnu.org/archive/html/qemu-devel/2016-11/msg03218.html>.
>>>>
>>>>     The guest-features file is freely writeable by the guest (no write
>>>>     callbacks in fw_cfg), and the feature validation & lockdown occurs
>>>>     when the guest selects the features-ok file (for reading).
>>>>
>>>>     Board code is allowed to choose the host feature bitmap to
>>>>     advertise.
>>>>
>>>>     This patch doesn't add any specific SMI features yet.
>>>>
>>>>   - Patch #6 adds the ICH9_LPC_SMI_F_BROADCAST feature.
>>>>
>>>>   - Patch #7 introduces the PCMachineClass.get_smi_host_features method,
>>>>     and implements it for "pc-q35-2.9" and later. The idea is to tie the
>>>>     SMI host features to machine types, and let the machine types
>>>>     calculate their host features with code (i.e., not just a constant).
>>>>
>>>>     In this patch, the "pc-q35-2.9" machine type exposes the
>>>>     ICH9_LPC_SMI_F_BROADCAST feature iff (smp_cpus == max_cpus), that
>>>>     is, when VCPU hotplug is not possible. (Also from Paolo's v3
>>>>     feedback, in
>>>>     <http://lists.nongnu.org/archive/html/qemu-devel/2016-11/msg04919.html>.)
>>>>
>>>> * I've written the OVMF side patches too and tested them together
>>>>   (including gdb / debug messages for "white box" testing).
>>>>
>>>> * Note that this version depends on the following PULL req from Michael:
>>>>
>>>>   [Qemu-devel] [PULL 0/5] virtio, vhost, pc: fixes
>>>>   http://lists.nongnu.org/archive/html/qemu-devel/2016-11/msg05503.html
>>>>
>>>>   In particular on the following patch:
>>>>   "loader: fix handling of custom address spaces when adding ROM blobs"
>>>>
>>>> Cc: "Gabriel L. Somlo" <somlo@cmu.edu>
>>>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>>>> Cc: Eduardo Habkost <ehabkost@redhat.com>
>>>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>>>> Cc: Igor Mammedov <imammedo@redhat.com>
>>>> Cc: Michael Walle <michael@walle.cc>
>>>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>>>> Cc: Peter Maydell <peter.maydell@linaro.org>
>>>> Cc: Shannon Zhao <zhaoshenglong@huawei.com>
>>>> Cc: qemu-arm@nongnu.org
>>>>
>>>> Thanks
>>>> Laszlo
>>>
>>> So I reviewed fw cfg stuff, looks good to me.
>>
>> Thank you.
>>
>> I should note that Igor suggested / requested changes for patches #2 and
>> #3; the sub-threads start at
>>
>> http://lists.nongnu.org/archive/html/qemu-devel/2016-12/msg00695.html
>> msg-id: <20161206115038.4495a217@nial.brq.redhat.com>
>>
>> http://lists.nongnu.org/archive/html/qemu-devel/2016-12/msg00706.html
>> msg-id: <20161206124906.76a41896@nial.brq.redhat.com>
>>
>> I was about to rework the patches based on his feedback. Should we
>> resume those discussions?
>>
>>> I'd prefer Paolo to review
>>> and merge broadcast SMI stuff as appropriate.  Paolo, makes sense?
>>
>> If it helps, I can split the series into two "waves", and deal only with
>> fw_cfg first.
> 2 waves looks better as vmgeneration stuff would depend on fw_cfg patches
> so it would be good to first. And SMI could be follow up.

Makes sense.
Laszlo

