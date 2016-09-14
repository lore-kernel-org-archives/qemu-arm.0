Received: by 10.80.163.71 with SMTP id 65csp1418791edn;
        Wed, 14 Sep 2016 01:53:28 -0700 (PDT)
X-Received: by 10.233.222.69 with SMTP id s66mr1532224qkf.102.1473843208235;
        Wed, 14 Sep 2016 01:53:28 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id o2si2403438qkd.59.2016.09.14.01.53.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Sep 2016 01:53:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54366 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bk5wd-0005OJ-Hq
	for alex.bennee@linaro.org; Wed, 14 Sep 2016 04:53:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44349)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bk5wZ-0005M0-37
	for qemu-arm@nongnu.org; Wed, 14 Sep 2016 04:53:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bk5wS-0003D9-TT
	for qemu-arm@nongnu.org; Wed, 14 Sep 2016 04:53:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55392)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bk5wS-0003Cw-JV; Wed, 14 Sep 2016 04:53:16 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9A680BAEF;
	Wed, 14 Sep 2016 08:53:15 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-42.brq.redhat.com [10.40.204.42])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8E8rB5u032125
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 14 Sep 2016 04:53:13 -0400
Date: Wed, 14 Sep 2016 10:53:11 +0200
From: Andrew Jones <drjones@redhat.com>
To: Wei Huang <wei@redhat.com>
Message-ID: <20160914085311.mxoxtfbrnqi4rf2d@hawk.localdomain>
References: <1473833343-31531-1-git-send-email-wei@redhat.com>
	<1473833343-31531-3-git-send-email-wei@redhat.com>
	<20160914083719.u63mw2myf3xza3wf@hawk.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160914083719.u63mw2myf3xza3wf@hawk.localdomain>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 14 Sep 2016 08:53:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V2 2/2] arm: virt: add PMU
 property to machvirt machine type
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
Cc: peter.maydell@linaro.org, shannon.zhao@linaro.org, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, abologna@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zdtOilHUyJ/H

On Wed, Sep 14, 2016 at 10:37:19AM +0200, Andrew Jones wrote:
> On Wed, Sep 14, 2016 at 02:09:03AM -0400, Wei Huang wrote:
> > CPU vPMU is now turned off by default, but it was ON in virt-2.7
> > machine type. To solve this problem, this patch adds a PMU option
> > in machine state, which is used to control CPU's vPMU status. This
> > PMU option is not exposed to command line and is turned on in
> > virt-2.7 machine type to make sure it is backward compatible.
> > 
> > Signed-off-by: Wei Huang <wei@redhat.com>
> > ---
> >  hw/arm/virt.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index a781ad0..83cfea7 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -91,6 +91,7 @@ typedef struct {
> >      bool secure;
> >      bool highmem;
> >      int32_t gic_version;
> > +    bool pmu;
> >  } VirtMachineState;
> 
> The compat bool doesn't need to be in machine state, so it should
> be in the class. See 'disallow_affinity_adjustment' in VirtMachineClass
> for an example of a adding a compat bool for a different reason. Also,
> I'd name it something like pmu_default_on.
> 
> >  
> >  #define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
> > @@ -1317,6 +1318,11 @@ static void machvirt_init(MachineState *machine)
> >              }
> >          }
> >  
> > +        if (vms->pmu) {
> > +            /* Note: the property name is "pmu", not "has_pmu" */
> 
> The comment is unnecessary. Please remove.
> 
> > +            object_property_set_bool(cpuobj, true, "pmu", NULL);
> > +        }
> > +
> >          if (object_property_find(cpuobj, "reset-cbar", NULL)) {
> >              object_property_set_int(cpuobj, vbi->memmap[VIRT_CPUPERIPHS].base,
> >                                      "reset-cbar", &error_abort);
> > @@ -1510,6 +1516,8 @@ static void virt_2_7_instance_init(Object *obj)
> >      object_property_set_description(obj, "gic-version",
> >                                      "Set GIC version. "
> >                                      "Valid values are 2, 3 and host", NULL);
> > +    /* Default PMU is on for 2.7 */
> 
> This comment is unnecessary. Please remove.
> 
> > +    vms->pmu = true;
> >  }
> >  
> >  static void virt_machine_2_7_options(MachineClass *mc)
> > @@ -1522,7 +1530,11 @@ DEFINE_VIRT_MACHINE_AS_LATEST(2, 7)
> >  
> >  static void virt_2_6_instance_init(Object *obj)
> >  {
> > +    VirtMachineState *vms = VIRT_MACHINE(obj);
> > +
> >      virt_2_7_instance_init(obj);
> > +    /* Default PMU is off for 2.6 */
> > +    vms->pmu = false;
> 
> You shouldn't need to touch 2.6 code. The compat bool is false
> by default (BSS init), which is the correct value for every
> machine type, except the 2.7 machine type.

Eh, scratch this last comment. Only 2.8 and later don't have to
touch this bool. I momentarily forgot about our chaining. 2.6 has to
reset 2.7's selection of true back to false, as it modifies 2.7's
choices. It works that way with class state too, so 2.6 will still
need the false setting after that change. In this case, a comment is
warranted; one that says something like "PMU support was first
introduced in 2.7, ensure it is disabled by default for 2.6 and down."

Thanks,
drew

> 
> >  }
> >  
> >  static void virt_machine_2_6_options(MachineClass *mc)
> > -- 
> > 1.8.3.1
> > 
> >
> 
> Thanks,
> drew
