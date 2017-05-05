Received: by 10.25.0.198 with SMTP id 189csp366112lfa;
        Fri, 5 May 2017 13:36:50 -0700 (PDT)
X-Received: by 10.55.3.10 with SMTP id 10mr15899786qkd.65.1494016610260;
        Fri, 05 May 2017 13:36:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f66si5629898qke.18.2017.05.05.13.36.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 May 2017 13:36:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48935 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d6jy3-0007sP-OA
	for alex.bennee@linaro.org; Fri, 05 May 2017 16:36:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d6jxw-0007sG-SI
	for qemu-arm@nongnu.org; Fri, 05 May 2017 16:36:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d6jxt-0006Z6-Pq
	for qemu-arm@nongnu.org; Fri, 05 May 2017 16:36:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34280)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1d6jxt-0006YY-Gv; Fri, 05 May 2017 16:36:37 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BF3404E4D9;
	Fri,  5 May 2017 20:36:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com BF3404E4D9
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com BF3404E4D9
Received: from localhost (ovpn-116-28.gru2.redhat.com [10.97.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ADCC67A419;
	Fri,  5 May 2017 20:36:26 +0000 (UTC)
Date: Fri, 5 May 2017 17:36:20 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Cornelia Huck <cornelia.huck@de.ibm.com>
Message-ID: <20170505203620.GN3482@thinpad.lan.raisama.net>
References: <20170503203604.31462-1-ehabkost@redhat.com>
	<20170503203604.31462-3-ehabkost@redhat.com>
	<20170505093622.37902dea.cornelia.huck@de.ibm.com>
	<20170505165419.GF3482@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170505165419.GF3482@thinpad.lan.raisama.net>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 05 May 2017 20:36:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] fixup! sysbus: Set user_creatable=false by
 default on TYPE_SYS_BUS_DEVICE
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
X-TUID: FfGYSuW5lh5e


On Fri, May 05, 2017 at 01:54:19PM -0300, Eduardo Habkost wrote:
> On Fri, May 05, 2017 at 09:36:22AM +0200, Cornelia Huck wrote:
> [...]
> > > diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
> > > index c0f560b289..6a2eec8dd0 100644
> > > --- a/hw/core/sysbus.c
> > > +++ b/hw/core/sysbus.c
> > > @@ -326,6 +326,17 @@ static void sysbus_device_class_init(ObjectClass *klass, void *data)
> > >      DeviceClass *k = DEVICE_CLASS(klass);
> > >      k->init = sysbus_device_init;
> > >      k->bus_type = TYPE_SYSTEM_BUS;
> > > +    /*
> > > +     * device_add plugs devices into suitable bus.  For "real" buses,
> > 
> > s/suitable/a suitable/
> 
> Thanks, I will fix it.
> 
> > 
> > > +     * that actually connects the device.  For sysbus, the connections
> > > +     * need to be made separately, and device_add can't do that.  The
> > > +     * device would be left unconnected, and will probably not work
> > > +     *
> > > +     * However, a few machines and a few devices can handle a few sysbus
> > > +     * devices. In this case, the device subclass needs to override
> > 
> > Should that rather be "a few machines can handle a few specific sysbus
> > devices"?
> 
> I will extend it to "a few machines can handle device_add for a
> few specific sysbus devices". Thanks for spotting it.

Fixup will be included in v3, or can be applied by maintainer:

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/core/sysbus.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 6a2eec8dd0..5d0887f499 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -327,14 +327,14 @@ static void sysbus_device_class_init(ObjectClass *klass, void *data)
     k->init = sysbus_device_init;
     k->bus_type = TYPE_SYSTEM_BUS;
     /*
-     * device_add plugs devices into suitable bus.  For "real" buses,
+     * device_add plugs devices into a suitable bus.  For "real" buses,
      * that actually connects the device.  For sysbus, the connections
      * need to be made separately, and device_add can't do that.  The
      * device would be left unconnected, and will probably not work
      *
-     * However, a few machines and a few devices can handle a few sysbus
-     * devices. In this case, the device subclass needs to override
-     * it and set user_creatable=true.
+     * However, a few machines can handle device_add/-device with
+     * a few specific sysbus devices. In those cases, the device
+     * subclass needs to override it and set user_creatable=true.
      */
     k->user_creatable = false;
 }
-- 
2.11.0.259.g40922b1
