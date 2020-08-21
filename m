Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp491529lfy;
        Fri, 21 Aug 2020 10:37:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4sGdPhQOzKZTvbU3yWy9h9O9BbuUsOn1aArbQqiGaD3jAea6Il6CXnKfF6pa+/yKoztDr
X-Received: by 2002:a25:e0b:: with SMTP id 11mr4822930ybo.201.1598031422217;
        Fri, 21 Aug 2020 10:37:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598031422; cv=none;
        d=google.com; s=arc-20160816;
        b=MHdVWTl4x9JgatmiPtk7crG8oHUF09zj1KGRkdb325hTZB5PfAbsAMeB1E9ys6s2+z
         rhiP2EUSeYgUHx/+Ym7Yndoosw5eWf9ujPVIVMjYxU2Sko7oIP04SsEVonjAZUaY0kTJ
         yA2VnPXZuCoG0JnnPZlIcxGWtUL1pYK47qJaHjv7jfIK3Nnm7oR9gkl6fIS5imlwr64g
         1UA0awYtlHFpqsbcnqF3GqdQytX4n0tYrsAjtoYR8yJ+9958OTGDaTO1fSA1I+rhQpK9
         91cnIhPqyjdI5fTvoybfrUJ/qAQI8oZHT++C4z9OildO/CzQ7TTnyoCBvwBQIiK9RnIU
         yMGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=b4Xxm8p6lEZCoBxrAS8NOpJ/hwlUtUBCvYH8v2IUDTk=;
        b=t8HSZyrxM0HBQo55Hx0CyUTNCyZg8Jxd6po8X4YAPTuiqTo0lKzQI144rte5Wqo9ti
         bLWX2seHkcOJ3ck+knXpiSUbK49NkkZ30DmdlSQp5AftsmWrUdHr1cavA5oRgDuhJmxO
         mItTIe+9mgnsg4yUQljFWNVuyneNCdVug6cPLgxY5MUHDWdW4kFcMbtnqcIxWW+LKh+7
         YZhDewtZNMF/WtQIxOZl1e/pts52xeMopGLhTRZef9Jph3KX4yXoACFiyIzWT0xO6Qp8
         rLntUJ3RNg+QMkkSS6fI9VhlUd70WwCENs2wsDYcUW9qdQMC/NHzpA5wTVLMCei6ReeF
         /Gkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iLhyi117;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v71si2898779ybi.413.2020.08.21.10.37.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Aug 2020 10:37:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iLhyi117;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k9AyL-0007kX-Ip
	for alex.bennee@linaro.org; Fri, 21 Aug 2020 13:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k9ArN-0001ig-4o
 for qemu-arm@nongnu.org; Fri, 21 Aug 2020 13:29:49 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:54508
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k9ArK-0001Eb-MY
 for qemu-arm@nongnu.org; Fri, 21 Aug 2020 13:29:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598030985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b4Xxm8p6lEZCoBxrAS8NOpJ/hwlUtUBCvYH8v2IUDTk=;
 b=iLhyi1178xtCFKBtxjWpXKUo10VNCZhUQ0Uxuv9sCwqOkvyOVQ72eS4iwqS6tdFWcOjGr2
 ShIKXVonEz2uqd+RcsQsP7hL9S8cV/Sr5SEzf0o/vrOmc2hBMgO0250rQbO6cnjVSfYQld
 yjLzOcqlGyIcBmqWKxQ0wUzMitiLT4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-LbqOqPDuNp2NFh-tep-Z1A-1; Fri, 21 Aug 2020 13:29:41 -0400
X-MC-Unique: LbqOqPDuNp2NFh-tep-Z1A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6239480F055;
 Fri, 21 Aug 2020 17:29:38 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C81B17AECB;
 Fri, 21 Aug 2020 17:29:27 +0000 (UTC)
Date: Fri, 21 Aug 2020 13:29:27 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Roman Bolshakov <r.bolshakov@yadro.com>
Subject: Re: Suspicious QOM types without instance/class size
Message-ID: <20200821172927.GJ642093@habkost.net>
References: <20200820215529.GH642093@habkost.net>
 <20200821105352.GA89922@SPB-NB-133.local>
MIME-Version: 1.0
In-Reply-To: <20200821105352.GA89922@SPB-NB-133.local>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 01:00:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Cameron Esfahani <dirty@apple.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kx5ZCUzo72QF

On Fri, Aug 21, 2020 at 01:53:52PM +0300, Roman Bolshakov wrote:
> On Thu, Aug 20, 2020 at 05:55:29PM -0400, Eduardo Habkost wrote:
> > While trying to convert TypeInfo declarations to the new
> > OBJECT_DECLARE* macros, I've stumbled on a few suspicious cases
> > where instance_size or class_size is not set, despite having type
> > checker macros that use a specific type.
> > 
> > The ones with "WARNING" are abstract types (maybe not serious if
> > subclasses set the appropriate sizes).  The ones with "ERROR"
> > don't seem to be abstract types.
> > 
> 
> > ERROR: target/i386/hvf/hvf.c:908:1: instance_size should be set to sizeof(HVFState)?
> 
> Hi Eduardo,
> 
> How do you get the error?

My script looks for corresponding type checking macros, and check
if instance_size is set to sizeof(T) with the right type from the
type checking macro.

The code is here:
https://github.com/ehabkost/qemu-hacks/blob/920b2c521ad2a29fa663256854e24ed2059ba9cd/scripts/codeconverter/codeconverter/qom_type_info.py#L136


> 
> Given your changes, instance size should really be sizeof(HVFState).
> 

The changes I've made shouldn't make any difference (if there's
an issue, it is there before or after my series).

> BTW, the object definition for hvf seems different from KVM (and perhaps
> wrong?), e.g. HVFState is allocated within init_machine handler and then
> assigned to a global variable:

Interesting.  It looks like hvf_state is _not_ the actual QOM
object instance.  The actual TYPE_HVF_ACCEL instance is created
by do_configure_accelerator().  That would explain why the lack
of instance_init never caused any problems.

Luckily, no code ever used the HVF_STATE macro.  If
HVF_STATE(hvf_state) got called, it would crash because of
uninitialized object instance data.  If HVF_STATE(machine->accel)
got called, it would return an invalid HVFState pointer (not
hvf_state).

I believe the simplest short term solution here is to just delete
the HVF_STATE macro and HVFState::parent field.  We can worry
about actually moving hvf_state to the machine->accel QOM object
later.

> 
> static int hvf_accel_init(MachineState *ms)
> {
>     int x;
>     hv_return_t ret;
>     HVFState *s;
> 
>     ret = hv_vm_create(HV_VM_DEFAULT);
>     assert_hvf_ok(ret);
> 
>     s = g_new0(HVFState, 1);
>  
>     s->num_slots = 32;
>     for (x = 0; x < s->num_slots; ++x) {
>         s->slots[x].size = 0;
>         s->slots[x].slot_id = x;
>     }
>   
>     hvf_state = s;
>     cpu_interrupt_handler = hvf_handle_interrupt;
>     memory_listener_register(&hvf_memory_listener, &address_space_memory);
>     return 0;
> }
> 
> static void hvf_accel_class_init(ObjectClass *oc, void *data)
> {
>     AccelClass *ac = ACCEL_CLASS(oc);
>     ac->name = "HVF";
>     ac->init_machine = hvf_accel_init;
>     ac->allowed = &hvf_allowed;
> }
> 
> static const TypeInfo hvf_accel_type = {
>     .name = TYPE_HVF_ACCEL,
>     .parent = TYPE_ACCEL,
>     .class_init = hvf_accel_class_init,
> };
> 
> Thanks,
> Roman
> 

-- 
Eduardo

