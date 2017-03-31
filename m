Received: by 10.25.15.230 with SMTP id 99csp2978833lfp;
        Fri, 31 Mar 2017 03:11:41 -0700 (PDT)
X-Received: by 10.55.47.69 with SMTP id v66mr1733981qkh.222.1490955101080;
        Fri, 31 Mar 2017 03:11:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t44si4213591qtg.102.2017.03.31.03.11.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 31 Mar 2017 03:11:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39868 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cttWu-0004OW-IS
	for alex.bennee@linaro.org; Fri, 31 Mar 2017 06:11:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cttWX-0004Dt-Lk
	for qemu-arm@nongnu.org; Fri, 31 Mar 2017 06:11:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cttWS-00072e-Ke
	for qemu-arm@nongnu.org; Fri, 31 Mar 2017 06:11:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52926)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1cttWS-00071v-Bs; Fri, 31 Mar 2017 06:11:12 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 23AE061D0C;
	Fri, 31 Mar 2017 10:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 23AE061D0C
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 23AE061D0C
Received: from localhost.localdomain (ovpn-117-27.ams2.redhat.com
	[10.36.117.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C5CA197E2;
	Fri, 31 Mar 2017 10:11:06 +0000 (UTC)
To: quintela@redhat.com
References: <1490608126-22187-1-git-send-email-eric.auger@redhat.com>
	<1490608126-22187-3-git-send-email-eric.auger@redhat.com>
	<877f39p4lv.fsf@secure.mitica>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <6645dafc-5231-a901-7b6a-e28181fc82cb@redhat.com>
Date: Fri, 31 Mar 2017 12:11:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <877f39p4lv.fsf@secure.mitica>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 31 Mar 2017 10:11:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v3 2/3] hw/intc/arm_gicv3_its:
 Implement state save/restore
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, vijay.kilari@gmail.com,
	qemu-devel@nongnu.org, peterx@redhat.com,
	Vijaya.Kumar@cavium.com, qemu-arm@nongnu.org,
	dgilbert@redhat.com, christoffer.dall@linaro.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YAflf4/FyUsj

Hi Juan,

On 28/03/2017 21:45, Juan Quintela wrote:
> Eric Auger <eric.auger@redhat.com> wrote:
>> We need to handle both registers and ITS tables. While
>> register handling is standard, ITS table handling is more
>> challenging since the kernel API is devised so that the
>> tables are flushed into guest RAM and not in vmstate buffers.
>>
>> Flushing the ITS tables on device pre_save() is too late
>> since the guest RAM is already saved at this point.
> 
> We need to put a way to register handlers for this.
> 
>> Table flushing needs to happen when we are sure the vcpus
>> are stopped and before the last dirty page saving. The
>> right point is RUN_STATE_FINISH_MIGRATE but sometimes the
>> VM gets stopped before migration launch so let's simply
>> flush the tables each time the VM gets stopped.
> 
> Just curious, how slow is doing that in all stops?
The flush of the ITS tables takes about 40 microseconds in my use case
(measured with gettimeofday).

Thanks

Eric
> 
> 
> No comments in the rest of the patch
> 
> 
>>  static void kvm_arm_its_init(Object *obj)
>> @@ -102,6 +122,80 @@ static void kvm_arm_its_init(Object *obj)
>>                               &error_abort);
>>  }
>>  
>> +/**
>> + * kvm_arm_its_pre_save - handles the saving of ITS registers.
>> + * ITS tables are flushed into guest RAM separately and earlier,
>> + * through the VM change state handler, since at the moment pre_save()
>> + * is called, the guest RAM has already been saved.
>> + */
>> +static void kvm_arm_its_pre_save(GICv3ITSState *s)
>> +{
> 
> ...
> 
>> +}
>> +
>> +/**
>> + * kvm_arm_its_post_load - Restore both the ITS registers and tables
>> + */
>> +static void kvm_arm_its_post_load(GICv3ITSState *s)
>> +{
> 
> ...
> 
>> +}
>> +
> 
> I assume that two functions are right.  I have no clue about ARM.
> 
>> @@ -109,6 +203,8 @@ static void kvm_arm_its_class_init(ObjectClass *klass, void *data)
>>  
>>      dc->realize = kvm_arm_its_realize;
>>      icc->send_msi = kvm_its_send_msi;
>> +    icc->pre_save = kvm_arm_its_pre_save;
>> +    icc->post_load = kvm_arm_its_post_load;
>>  }
> 
> Let me see if I understood this correctly.
> 
> We have an ARM_GICV3_ITS_COMMON.  And that has some fields.
> In particular:
> 
> struct GICv3ITSState {
>     /* Registers */
>     uint32_t ctlr;
>     uint64_t cbaser;
>     uint64_t cwriter;
>     uint64_t creadr;
>     uint64_t baser[8];
>     /* lots of things removed */
> };
> 
> 
> 
> We have this in arm_gicv3_its_common.c  (it is exactly the same for
> post_load, so we forgot about it by now).
> 
> 
> static void gicv3_its_pre_save(void *opaque)
> {
>     GICv3ITSState *s = (GICv3ITSState *)opaque; (*)
>                                                    /* nitpit: the cast
>                                                    is useless */
>     GICv3ITSCommonClass *c = ARM_GICV3_ITS_COMMON_GET_CLASS(s);
> 
>     if (c->pre_save) {
>         c->pre_save(s);
>     }
> }
> 
> And then we have in the patch:
> 
> 
>> @@ -109,6 +203,8 @@ static void kvm_arm_its_class_init(ObjectClass *klass, void *data)
>>  
>>      dc->realize = kvm_arm_its_realize;
>>      icc->send_msi = kvm_its_send_msi;
>> +    icc->pre_save = kvm_arm_its_pre_save;
>> +    icc->post_load = kvm_arm_its_post_load;
>>  }
> 
> 
> struct GICv3ITSCommonClass {
> ....
>     void (*pre_save)(GICv3ITSState *s);
>     void (*post_load)(GICv3ITSState *s);
> };
> 
> 
> Notice that I have only found one user of this on the tree, so I don't
> know if there is a good reason for this.
> 
> 
> static void gicv3_its_common_class_init(ObjectClass *klass, void *data)
> {
>     DeviceClass *dc = DEVICE_CLASS(klass);
> 
>     dc->reset = gicv3_its_common_reset;
>     dc->vmsd = &vmstate_its;
> }
> 
> So, what if we change:
> 
> const VMSField vmstate_its_fields[] = {
>      VMSTATE_UINT32(ctlr, GICv3ITSState),
>      VMSTATE_UINT32(iidr, GICv3ITSState),
>      VMSTATE_UINT64(cbaser, GICv3ITSState),
>      VMSTATE_UINT64(cwriter, GICv3ITSState),
>      VMSTATE_UINT64(creadr, GICv3ITSState),
>      VMSTATE_UINT64_ARRAY(baser, GICv3ITSState, 8),
>      VMSTATE_END_OF_LIST()
> };
> 
> 
> 
> Remove the dc->vmsd = &vmstate_its; from gicv3_its_common_class_init();
> 
> And we add in arm_gicv3_its_kvm.c
> 
> 
> static const VMStateDescription vmstate_its_kvm = {
>     .name = "arm_gicv3_its",
>     .pre_save = kvm_arm_its_pre_save,
>     .post_load = kvm_arm_its_post_load,
>     .fields = &vmsate_its_fields;
>     },
> };
> 
> And add the:
> 
> dc->vmstate = &vmastet_its_kvm;
> 
> into kvm_arm_its_class_init()?
> 
> And be with it?  Or it is too late by then?
> 
> I am assuming that there is some reason why we want to call
> arm_gicv3_its either for kvm or for anything else.  But IMHO, you are
> making things more complicated that they need to be.
> 
> My understanding:
> - We have GICv3 ITS state
> - We want to have several implementations
> - We want to be able to migration from one to another
> 
> 
> Or have I missed something?
> 
> Notice that I like more this other approach, but as far as I can see,
> yours should also work.
> 
> Thanks, Juan.
> 
> 
> 
> 
