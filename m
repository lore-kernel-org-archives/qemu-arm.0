Received: by 10.25.0.144 with SMTP id 138csp627475lfa;
        Wed, 26 Apr 2017 23:59:11 -0700 (PDT)
X-Received: by 10.200.35.59 with SMTP id a56mr3384244qta.81.1493276351678;
        Wed, 26 Apr 2017 23:59:11 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j134si1876786qke.235.2017.04.26.23.59.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Apr 2017 23:59:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59060 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d3dOR-0006SU-6V
	for alex.bennee@linaro.org; Thu, 27 Apr 2017 02:59:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44119)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1d3dOH-0006SO-HD
	for qemu-arm@nongnu.org; Thu, 27 Apr 2017 02:59:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1d3dOD-0002dX-G6
	for qemu-arm@nongnu.org; Thu, 27 Apr 2017 02:59:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55704)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1d3dOD-0002bC-6Y; Thu, 27 Apr 2017 02:58:57 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BA14C80470;
	Thu, 27 Apr 2017 06:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com BA14C80470
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com BA14C80470
Received: from localhost.localdomain (ovpn-116-214.ams2.redhat.com
	[10.36.116.214])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DF4D871CB;
	Thu, 27 Apr 2017 06:58:53 +0000 (UTC)
To: Prakash B <bjsprakash.linux@gmail.com>
References: <1492173995-14140-1-git-send-email-eric.auger@redhat.com>
	<CACJhumcMAtJgnRVctCLE5XJ0eo0vpQ35zjjB8twMTkbVphfB8g@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <fe5d76da-6fe5-65b2-af35-7673601ff1b8@redhat.com>
Date: Thu, 27 Apr 2017 08:58:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CACJhumcMAtJgnRVctCLE5XJ0eo0vpQ35zjjB8twMTkbVphfB8g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 27 Apr 2017 06:58:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v5 0/4] vITS save/restore
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
Cc: Peter Maydell <peter.maydell@linaro.org>, drjones@redhat.com,
	Vijay Kilari <vijay.kilari@gmail.com>, quintela@redhat.com,
	dgilbert@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Vijaya.Kumar@cavium.com, Christoffer Dall <christoffer.dall@linaro.org>,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qGWzkKFd/6Ur

Hi Brahmajyosyula,

On 26/04/2017 13:18, Prakash B wrote:
> Verified on Cavium ThunderX platform
> Continousily migrated Guest more than 500 times b/w different  hosts.
> Please feel free to add  Tested-by: Prakash, Brahmajyosyula
> <Brahmajyosyula.Prakash@cavium.com>


Many thanks for your testing efforts!

Best Regards

Eric
> 
> On Fri, Apr 14, 2017 at 6:16 PM, Eric Auger <eric.auger@redhat.com> wrote:
>> This series allows ITS save/restore and migration use cases.
>> It relies on not upstreamed kernel series [1].
>>
>> ITS tables are flushed into guest RAM on VM stop while registers
>> are save on pre_save() callback. Tables and registers are restored
>> on ITS post_load().
>>
>> Redistributor pending tables also are flushed on VM stop, independently
>> on ITS tables.
>>
>> That work was tested on Cavium ThunderX using virsh save/restore and
>> virt-manager live migration.
>>
>> Best Regards
>>
>> Eric
>>
>> Host Kernel dependencies:
>> - [1] [PATCH v5 00/22] vITS save/restore
>>
>> History:
>> v4 -> v5:
>> - adapt to the new user API
>> - new patch "hw/intc/arm_gicv3_kvm: Implement pending table save"
>>   as the pending table save now is handled on GICV3 side.
>>
>> v3 -> v4:
>> - oversight in v3, missed a last minute correction related to
>>   reg useless declaration in kvm_arm_its_pre_save
>>
>> v2 -> v3:
>> - GITS_IIDR is now saved and restored to check ABI revision.
>> - get/put functions renamed into pre_save/post_load
>> - unmigratable = false removed
>> - changed the migration blocker message
>> - remove the extract64 round s->ctlr
>> - reword some comments
>>
>> v1 -> v2:
>> - rebase on 2.9 soft release code
>> - handle case where migrate_add_blocker fails
>> - add comments along with ITS and GICv3 migration priorities
>>
>>
>> Eric Auger (4):
>>   linux-headers: Update for vITS save/restore
>>   hw/intc/arm_gicv3_its: Implement state save/restore
>>   hw/intc/arm_gicv3_kvm: Implement pending table save
>>   hw/intc/arm_gicv3_its: Allow save/restore
>>
>>  hw/intc/arm_gicv3_common.c             |   1 +
>>  hw/intc/arm_gicv3_its_common.c         |  11 ++-
>>  hw/intc/arm_gicv3_its_kvm.c            | 120 +++++++++++++++++++++++++++++----
>>  hw/intc/arm_gicv3_kvm.c                |  25 +++++++
>>  include/hw/intc/arm_gicv3_its_common.h |   8 +++
>>  include/migration/vmstate.h            |   2 +
>>  linux-headers/asm-arm/kvm.h            |   6 +-
>>  linux-headers/asm-arm64/kvm.h          |   6 +-
>>  8 files changed, 164 insertions(+), 15 deletions(-)
>>
>> --
>> 2.5.5
>>
>>
> 
