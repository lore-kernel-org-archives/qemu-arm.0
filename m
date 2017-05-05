Received: by 10.25.0.198 with SMTP id 189csp281087lfa;
        Fri, 5 May 2017 09:54:44 -0700 (PDT)
X-Received: by 10.55.89.196 with SMTP id n187mr13191134qkb.322.1494003284715;
        Fri, 05 May 2017 09:54:44 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g190si5090063qkf.118.2017.05.05.09.54.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 May 2017 09:54:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48139 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d6gV8-0003it-3K
	for alex.bennee@linaro.org; Fri, 05 May 2017 12:54:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36045)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d6gV3-0003in-AA
	for qemu-arm@nongnu.org; Fri, 05 May 2017 12:54:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d6gUy-00056S-FU
	for qemu-arm@nongnu.org; Fri, 05 May 2017 12:54:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59300)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1d6gUy-00056L-67; Fri, 05 May 2017 12:54:32 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E964201FB;
	Fri,  5 May 2017 16:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4E964201FB
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 4E964201FB
Received: from localhost (ovpn-116-28.gru2.redhat.com [10.97.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A228762932;
	Fri,  5 May 2017 16:54:20 +0000 (UTC)
Date: Fri, 5 May 2017 13:54:19 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Cornelia Huck <cornelia.huck@de.ibm.com>
Message-ID: <20170505165419.GF3482@thinpad.lan.raisama.net>
References: <20170503203604.31462-1-ehabkost@redhat.com>
	<20170503203604.31462-3-ehabkost@redhat.com>
	<20170505093622.37902dea.cornelia.huck@de.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170505093622.37902dea.cornelia.huck@de.ibm.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 05 May 2017 16:54:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH RESEND v2 02/21] sysbus: Set
 user_creatable=false by default on TYPE_SYS_BUS_DEVICE
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
	Yi Min Zhao <zyimin@linux.vnet.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Pierre Morel <pmorel@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Rob Herring <robh@kernel.org>,
	sstabellini@kernel.org, qemu-block@nongnu.org,
	Alexander Graf <agraf@suse.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Marcel Apfelbaum <marcel@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Laszlo Ersek <lersek@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Thomas Huth <thuth@redhat.com>, "Gabriel L . Somlo" <somlo@cmu.edu>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
	Juergen Gross <jgross@suse.com>,
	Frank Blaschka <frank.blaschka@de.ibm.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o/irCgw+1W5f

On Fri, May 05, 2017 at 09:36:22AM +0200, Cornelia Huck wrote:
[...]
> > diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
> > index c0f560b289..6a2eec8dd0 100644
> > --- a/hw/core/sysbus.c
> > +++ b/hw/core/sysbus.c
> > @@ -326,6 +326,17 @@ static void sysbus_device_class_init(ObjectClass *klass, void *data)
> >      DeviceClass *k = DEVICE_CLASS(klass);
> >      k->init = sysbus_device_init;
> >      k->bus_type = TYPE_SYSTEM_BUS;
> > +    /*
> > +     * device_add plugs devices into suitable bus.  For "real" buses,
> 
> s/suitable/a suitable/

Thanks, I will fix it.

> 
> > +     * that actually connects the device.  For sysbus, the connections
> > +     * need to be made separately, and device_add can't do that.  The
> > +     * device would be left unconnected, and will probably not work
> > +     *
> > +     * However, a few machines and a few devices can handle a few sysbus
> > +     * devices. In this case, the device subclass needs to override
> 
> Should that rather be "a few machines can handle a few specific sysbus
> devices"?

I will extend it to "a few machines can handle device_add for a
few specific sysbus devices". Thanks for spotting it.

> 
> > +     * it and set user_creatable=true.
> > +     */
> > +    k->user_creatable = false;
> >  }
> > 
> >  static const TypeInfo sysbus_device_type_info = {
> 

-- 
Eduardo
