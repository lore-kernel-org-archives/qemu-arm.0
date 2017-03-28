Received: by 10.25.15.230 with SMTP id 99csp1774173lfp;
        Tue, 28 Mar 2017 12:46:03 -0700 (PDT)
X-Received: by 10.55.23.94 with SMTP id i91mr25847532qkh.267.1490730363312;
        Tue, 28 Mar 2017 12:46:03 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f50si4274904qte.12.2017.03.28.12.46.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Mar 2017 12:46:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54968 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1csx46-0000nn-SY
	for alex.bennee@linaro.org; Tue, 28 Mar 2017 15:46:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50724)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1csx43-0000nW-Be
	for qemu-arm@nongnu.org; Tue, 28 Mar 2017 15:46:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1csx40-0006fg-74
	for qemu-arm@nongnu.org; Tue, 28 Mar 2017 15:45:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34978)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <quintela@redhat.com>)
	id 1csx3z-0006eP-OM; Tue, 28 Mar 2017 15:45:56 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A1B07624BE;
	Tue, 28 Mar 2017 19:45:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A1B07624BE
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=quintela@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com A1B07624BE
Received: from localhost (ovpn-116-230.ams2.redhat.com [10.36.116.230])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 123EAA09CD;
	Tue, 28 Mar 2017 19:45:49 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <1490608126-22187-3-git-send-email-eric.auger@redhat.com> (Eric
	Auger's message of "Mon, 27 Mar 2017 11:48:45 +0200")
References: <1490608126-22187-1-git-send-email-eric.auger@redhat.com>
	<1490608126-22187-3-git-send-email-eric.auger@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
Date: Tue, 28 Mar 2017 21:45:48 +0200
Message-ID: <877f39p4lv.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 28 Mar 2017 19:45:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC v3 2/3] hw/intc/arm_gicv3_its: Implement state
 save/restore
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
Reply-To: quintela@redhat.com
Cc: peter.maydell@linaro.org, drjones@redhat.com, vijay.kilari@gmail.com,
	qemu-devel@nongnu.org, peterx@redhat.com,
	Vijaya.Kumar@cavium.com, qemu-arm@nongnu.org,
	christoffer.dall@linaro.org, dgilbert@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KIbHoIQLSgJt

Eric Auger <eric.auger@redhat.com> wrote:
> We need to handle both registers and ITS tables. While
> register handling is standard, ITS table handling is more
> challenging since the kernel API is devised so that the
> tables are flushed into guest RAM and not in vmstate buffers.
>
> Flushing the ITS tables on device pre_save() is too late
> since the guest RAM is already saved at this point.

We need to put a way to register handlers for this.

> Table flushing needs to happen when we are sure the vcpus
> are stopped and before the last dirty page saving. The
> right point is RUN_STATE_FINISH_MIGRATE but sometimes the
> VM gets stopped before migration launch so let's simply
> flush the tables each time the VM gets stopped.

Just curious, how slow is doing that in all stops?


No comments in the rest of the patch


>  static void kvm_arm_its_init(Object *obj)
> @@ -102,6 +122,80 @@ static void kvm_arm_its_init(Object *obj)
>                               &error_abort);
>  }
>  
> +/**
> + * kvm_arm_its_pre_save - handles the saving of ITS registers.
> + * ITS tables are flushed into guest RAM separately and earlier,
> + * through the VM change state handler, since at the moment pre_save()
> + * is called, the guest RAM has already been saved.
> + */
> +static void kvm_arm_its_pre_save(GICv3ITSState *s)
> +{

...

> +}
> +
> +/**
> + * kvm_arm_its_post_load - Restore both the ITS registers and tables
> + */
> +static void kvm_arm_its_post_load(GICv3ITSState *s)
> +{

...

> +}
> +

I assume that two functions are right.  I have no clue about ARM.

> @@ -109,6 +203,8 @@ static void kvm_arm_its_class_init(ObjectClass *klass, void *data)
>  
>      dc->realize = kvm_arm_its_realize;
>      icc->send_msi = kvm_its_send_msi;
> +    icc->pre_save = kvm_arm_its_pre_save;
> +    icc->post_load = kvm_arm_its_post_load;
>  }

Let me see if I understood this correctly.

We have an ARM_GICV3_ITS_COMMON.  And that has some fields.
In particular:

struct GICv3ITSState {
    /* Registers */
    uint32_t ctlr;
    uint64_t cbaser;
    uint64_t cwriter;
    uint64_t creadr;
    uint64_t baser[8];
    /* lots of things removed */
};



We have this in arm_gicv3_its_common.c  (it is exactly the same for
post_load, so we forgot about it by now).


static void gicv3_its_pre_save(void *opaque)
{
    GICv3ITSState *s = (GICv3ITSState *)opaque; (*)
                                                   /* nitpit: the cast
                                                   is useless */
    GICv3ITSCommonClass *c = ARM_GICV3_ITS_COMMON_GET_CLASS(s);

    if (c->pre_save) {
        c->pre_save(s);
    }
}

And then we have in the patch:


> @@ -109,6 +203,8 @@ static void kvm_arm_its_class_init(ObjectClass *klass, void *data)
>  
>      dc->realize = kvm_arm_its_realize;
>      icc->send_msi = kvm_its_send_msi;
> +    icc->pre_save = kvm_arm_its_pre_save;
> +    icc->post_load = kvm_arm_its_post_load;
>  }


struct GICv3ITSCommonClass {
....
    void (*pre_save)(GICv3ITSState *s);
    void (*post_load)(GICv3ITSState *s);
};


Notice that I have only found one user of this on the tree, so I don't
know if there is a good reason for this.


static void gicv3_its_common_class_init(ObjectClass *klass, void *data)
{
    DeviceClass *dc = DEVICE_CLASS(klass);

    dc->reset = gicv3_its_common_reset;
    dc->vmsd = &vmstate_its;
}

So, what if we change:

const VMSField vmstate_its_fields[] = {
     VMSTATE_UINT32(ctlr, GICv3ITSState),
     VMSTATE_UINT32(iidr, GICv3ITSState),
     VMSTATE_UINT64(cbaser, GICv3ITSState),
     VMSTATE_UINT64(cwriter, GICv3ITSState),
     VMSTATE_UINT64(creadr, GICv3ITSState),
     VMSTATE_UINT64_ARRAY(baser, GICv3ITSState, 8),
     VMSTATE_END_OF_LIST()
};



Remove the dc->vmsd = &vmstate_its; from gicv3_its_common_class_init();

And we add in arm_gicv3_its_kvm.c


static const VMStateDescription vmstate_its_kvm = {
    .name = "arm_gicv3_its",
    .pre_save = kvm_arm_its_pre_save,
    .post_load = kvm_arm_its_post_load,
    .fields = &vmsate_its_fields;
    },
};

And add the:

dc->vmstate = &vmastet_its_kvm;

into kvm_arm_its_class_init()?

And be with it?  Or it is too late by then?

I am assuming that there is some reason why we want to call
arm_gicv3_its either for kvm or for anything else.  But IMHO, you are
making things more complicated that they need to be.

My understanding:
- We have GICv3 ITS state
- We want to have several implementations
- We want to be able to migration from one to another


Or have I missed something?

Notice that I like more this other approach, but as far as I can see,
yours should also work.

Thanks, Juan.



