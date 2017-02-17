Received: by 10.25.77.65 with SMTP id a62csp220811lfb;
        Fri, 17 Feb 2017 07:19:06 -0800 (PST)
X-Received: by 10.55.42.1 with SMTP id q1mr8620267qkh.239.1487344746790;
        Fri, 17 Feb 2017 07:19:06 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x4si7672652qtx.329.2017.02.17.07.19.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Feb 2017 07:19:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54262 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cekJO-0005Zt-9N
	for alex.bennee@linaro.org; Fri, 17 Feb 2017 10:19:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cekJ2-0005Ox-65
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 10:18:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cekIy-0002TH-RO
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 10:18:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57208)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1cekIy-0002PD-Iz; Fri, 17 Feb 2017 10:18:40 -0500
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
	[10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BEB9F62647;
	Fri, 17 Feb 2017 15:18:39 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A9E3016A54;
	Fri, 17 Feb 2017 15:18:38 +0000 (UTC)
Date: Fri, 17 Feb 2017 16:18:34 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170217161834.4f9c556c@nial.brq.redhat.com>
In-Reply-To: <CAFEAcA-aaEPxhYK2ePq2QXW6UVe2A=NxP=V7cokURkurPzLRGg@mail.gmail.com>
References: <1487253461-269218-1-git-send-email-imammedo@redhat.com>
	<CAFEAcA_NgmdDCfbPy+DnHQBmNGmQ4tj1z4ci+OP7+x4tHLLCxg@mail.gmail.com>
	<20170216161114.220260cf@nial.brq.redhat.com>
	<CAFEAcA-aaEPxhYK2ePq2QXW6UVe2A=NxP=V7cokURkurPzLRGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 17 Feb 2017 15:18:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/virt: fix cpu object
 reference leak
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XY01y9ZKETXc

On Fri, 17 Feb 2017 13:32:15 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On 16 February 2017 at 15:11, Igor Mammedov <imammedo@redhat.com> wrote:
> > On Thu, 16 Feb 2017 14:18:05 +0000
> > Peter Maydell <peter.maydell@linaro.org> wrote:  
> >> I've always found the object reference semantics somewhat
> >> confusing (why does realizing a device add a reference,
> >> for instance?). Do we document them anywhere?  
> > I'm not aware of a place where it's documented.
> >
> > currently device_realize() sets parent thus increasing
> > ref counter only if device creator haven't set parent
> > explicitly.  
> 
> It doesn't seem to:
> 
> static void device_realize(DeviceState *dev, Error **errp)
> {
>     DeviceClass *dc = DEVICE_GET_CLASS(dev);
> 
>     if (dc->init) {
>         int rc = dc->init(dev);
>         if (rc < 0) {
>             error_setg(errp, "Device initialization failed.");
>             return;
>         }
>     }
> }
static void device_set_realized(Object *obj, bool value, Error **errp)
{
...
    if (value && !dev->realized) {                                               
        if (!obj->parent) {                                                      
            gchar *name = g_strdup_printf("device[%d]", unattached_count++);     
                                                                                 
            object_property_add_child(container_get(qdev_get_machine(),          
                                                    "/unattached"),              
                                      name, obj, &error_abort);                  
            unattached_parent = true;                                            
            g_free(name);                                                        
        }

 
> ...it just calls the device's init function if it has one.
> 
> It's also pretty confusing that qdev_try_create()
> and qdev_create() return a pointer to an object
> that has been put into a bus and had unref called
> (so the caller doesn't need to manually unref),
qdev_try_create() when puts device on bus,
it creates QOM link property to device which increases refcnt
qdev_try_create() -> qdev_set_parent_bus() -> bus_add_child()

link is not really usable at that time as device doesn't have
parent (in QOM terms) and attempt to resolve it to path would
assert, so it does set link manually by hack
bus_add_child()
    kid->child = child;                                                          
    object_ref(OBJECT(kid->child)); 

and then as bus holds reference, device won't disappear 
until it's attached to bus, it unrefs original
(qdev_try_create owned) pointer and returns pointer
owned by qdev framework.

later device creator calls
 qdev_init_nofail() ->
   object_property_set_bool(true, "realized");

which sets QOM parent for device to "/machine/unattached"
if caller hasn't set it manually,

like
 qdev_device_add() ->
    qdev_set_id() ->
       object_property_add_child("/peripheral" | "/peripheral-anon")

or
 ioapic_init_gsi() ->
     qdev_create()
     object_property_add_child(...)
     qdev_init_nofail()

> but plain object_new() returns a pointer to an
> object that hasn't been put into a bus, yet
it's like malloc/new and used for all objects including
ones without realize which is Device concept.
So naturally caller hold/owns the first reference
and should take care of it.

> realizing does put it into a bus but doesn't do the
> corresponding unref.
it might add extra reference so successfully created device
won't disappear once original owner 'frees' pointer that
goes out of scope.


> I'd be a lot happier if we had clear documentation that
> described how our object model, plugging things into buses,
> etc handled reference counting and what the expected
> "correct" code patterns are for using it.
I see 2 APIs in use:
 1: legacy qdev_create() + qdev_init_nofail()
     for hardwired on board devices bus attached oriented
 2: object_new() (+ device.realize() in case if object is Device)
     used by device_add() used for both bus/bus-less device
     post machine_init time.
    

> That said, I guess this patch is correct so I'm applying
> it to target-arm.next.
> 
> thanks
> -- PMM

