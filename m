Received: by 10.25.227.6 with SMTP id a6csp4508478lfh;
        Thu, 29 Jun 2017 08:38:29 -0700 (PDT)
X-Received: by 10.55.18.225 with SMTP id 94mr18790750qks.251.1498750709494;
        Thu, 29 Jun 2017 08:38:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498750709; cv=none;
        d=google.com; s=arc-20160816;
        b=uf/G7ixqMeOkHCBJqSffi0+ogA+JHEMrTZuhBZd8AqSlWqKlvlxChuf3nHYTUMddop
         y/xG1q3iFvb9ZpA5G3orlUdh7zXLGBAWmalXz8jox2iRNc9ZyYCVEP0GKBRTw+GDp18I
         OsH9j0Nz+w0kWiPusvgKVhAz7qYFgpjbiNf0VR7Tr+joKR4phIyBA3tTUIahAWYZTY/9
         kgvrONpR0O5HL7TAlrxpkyrdh69SBEeWU9HykTzLSHG7O61ik1Bzht/D8ShbkRidBV/b
         Bmj7A8SVZ1rDee9WQphkaI/0DpZOmGBpqkKaXEhsbZyRW9yg70miUkNnCkOKPvWXtskp
         zXXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=cKn5kIndG4htqMVI+kF4W7hDrL1K0xIcsDCu/zjU0g4=;
        b=r8v9TNrb5kP7q5i6kon/AkKoTuhpbH746x9ofzkSQ0qLtUCPXazzOxQKtmpvY1AORM
         jahAvcmcVXVf37hjdgukmXTeDZ7c6dVP9kyS6NL29lz2p1H2Am+80U+it0w7adOmPtsv
         tobUZdNeGD4OkMTV55dqic2r8wwgGQzdh/aNerogd1zD9TfpIfo5NWZzpbcu/aBNAmgK
         1/fsp9m2C3YFYBfh1hdLVlmnZSqzgFpQGPNPM+UucxnnJSwgIIIExkZ+fhGAJIhf55UW
         BiPpiqQhXSvdrQk2Z79edqctjAW46rTySZh2mRf0mlKGgSoQ+j59RhEXrtquO/o8NFBT
         E4RQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d191si5004881qkb.226.2017.06.29.08.38.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Jun 2017 08:38:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40001 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dQbWU-0006iF-QW
	for alex.bennee@linaro.org; Thu, 29 Jun 2017 11:38:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42664)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dQbWM-0006i9-Ap
	for qemu-arm@nongnu.org; Thu, 29 Jun 2017 11:38:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dQbWJ-00069d-1r
	for qemu-arm@nongnu.org; Thu, 29 Jun 2017 11:38:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43848)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dQbWI-00069F-O0; Thu, 29 Jun 2017 11:38:14 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5D6EDABBBC;
	Thu, 29 Jun 2017 15:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5D6EDABBBC
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 5D6EDABBBC
Received: from nial.brq.redhat.com (unknown [10.43.2.249])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 38B048D558;
	Thu, 29 Jun 2017 15:38:04 +0000 (UTC)
Date: Thu, 29 Jun 2017 17:38:02 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20170629173802.09ff23a0@nial.brq.redhat.com>
In-Reply-To: <b6193c2f-a358-b871-34f7-7f8d6784f4b8@redhat.com>
References: <1498734863-164338-1-git-send-email-imammedo@redhat.com>
	<b6193c2f-a358-b871-34f7-7f8d6784f4b8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 29 Jun 2017 15:38:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] qom: enforce readonly nature of
 link's check callback
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
Cc: famz@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
	alistair.francis@xilinx.com, qemu-arm@nongnu.org, afaerber@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qGhAxtciGn2s

On Thu, 29 Jun 2017 15:45:04 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 29/06/2017 13:14, Igor Mammedov wrote:
> > link's check callback is supposed to verify/permit setting it,
> > however currently nothing restricts it from misusing it
> > and modifying target object from within.
> > Make sure that readonly semantics are checked by compiler
> > to prevent callback's misuse.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > Fam,
> >  it probably conflicts with yours DEFINE_PROP_LINK series,
> >  feel free to include this patch if you'll have to respin
> > 
> > ---
> >  include/hw/qdev-properties.h | 3 ++-
> >  include/qom/object.h         | 6 +++---
> >  hw/core/qdev-properties.c    | 3 ++-
> >  hw/display/xlnx_dp.c         | 2 +-
> >  hw/ipmi/ipmi.c               | 2 +-
> >  hw/mem/pc-dimm.c             | 2 +-
> >  hw/misc/ivshmem.c            | 2 +-
> >  qom/object.c                 | 8 ++++----
> >  8 files changed, 15 insertions(+), 13 deletions(-)
> > 
> > diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
> > index 306bbab..6dfe16e 100644
> > --- a/include/hw/qdev-properties.h
> > +++ b/include/hw/qdev-properties.h
> > @@ -234,7 +234,8 @@ void qdev_prop_set_after_realize(DeviceState *dev, const char *name,
> >   * This function should be used as the check() argument to
> >   * object_property_add_link().
> >   */
> > -void qdev_prop_allow_set_link_before_realize(Object *obj, const char *name,
> > +void qdev_prop_allow_set_link_before_realize(const Object *obj,
> > +                                             const char *name,
> >                                               Object *val, Error **errp);
> >  
> >  #endif
> > diff --git a/include/qom/object.h b/include/qom/object.h
> > index 5ecc2d1..5223692 100644
> > --- a/include/qom/object.h
> > +++ b/include/qom/object.h
> > @@ -788,7 +788,7 @@ ObjectClass *object_get_class(Object *obj);
> >   *
> >   * Returns: The QOM typename of @obj.
> >   */
> > -const char *object_get_typename(Object *obj);
> > +const char *object_get_typename(const Object *obj);
> >  
> >  /**
> >   * type_register_static:
> > @@ -1320,7 +1320,7 @@ typedef enum {
> >   * callback function.  It allows the link property to be set and never returns
> >   * an error.
> >   */
> > -void object_property_allow_set_link(Object *, const char *,
> > +void object_property_allow_set_link(const Object *, const char *,
> >                                      Object *, Error **);
> >  
> >  /**
> > @@ -1353,7 +1353,7 @@ void object_property_allow_set_link(Object *, const char *,
> >   */
> >  void object_property_add_link(Object *obj, const char *name,
> >                                const char *type, Object **child,
> > -                              void (*check)(Object *obj, const char *name,
> > +                              void (*check)(const Object *obj, const char *name,
> >                                              Object *val, Error **errp),
> >                                ObjectPropertyLinkFlags flags,
> >                                Error **errp);
> > diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> > index 2a82768..95e5fdb 100644
> > --- a/hw/core/qdev-properties.c
> > +++ b/hw/core/qdev-properties.c
> > @@ -25,7 +25,8 @@ void qdev_prop_set_after_realize(DeviceState *dev, const char *name,
> >      }
> >  }
> >  
> > -void qdev_prop_allow_set_link_before_realize(Object *obj, const char *name,
> > +void qdev_prop_allow_set_link_before_realize(const Object *obj,
> > +                                             const char *name,
> >                                               Object *val, Error **errp)
> >  {
> >      DeviceState *dev = DEVICE(obj);
> > diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> > index f43eb09..3ed81ff 100644
> > --- a/hw/display/xlnx_dp.c
> > +++ b/hw/display/xlnx_dp.c
> > @@ -515,7 +515,7 @@ static void xlnx_dp_aux_set_command(XlnxDPState *s, uint32_t value)
> >      s->core_registers[DP_INTERRUPT_SIGNAL_STATE] |= 0x04;
> >  }
> >  
> > -static void xlnx_dp_set_dpdma(Object *obj, const char *name, Object *val,
> > +static void xlnx_dp_set_dpdma(const Object *obj, const char *name, Object *val,
> >                                Error **errp)
> >  {
> >      XlnxDPState *s = XLNX_DP(obj);
> > diff --git a/hw/ipmi/ipmi.c b/hw/ipmi/ipmi.c
> > index 5cf1caa..a2fd1eb 100644
> > --- a/hw/ipmi/ipmi.c
> > +++ b/hw/ipmi/ipmi.c
> > @@ -90,7 +90,7 @@ static TypeInfo ipmi_interface_type_info = {
> >      .class_init = ipmi_interface_class_init,
> >  };
> >  
> > -static void isa_ipmi_bmc_check(Object *obj, const char *name,
> > +static void isa_ipmi_bmc_check(const Object *obj, const char *name,
> >                                 Object *val, Error **errp)
> >  {
> >      IPMIBmc *bmc = IPMI_BMC(val);
> > diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
> > index 9e8dab0..380cb30 100644
> > --- a/hw/mem/pc-dimm.c
> > +++ b/hw/mem/pc-dimm.c
> > @@ -366,7 +366,7 @@ static void pc_dimm_get_size(Object *obj, Visitor *v, const char *name,
> >      visit_type_int(v, name, &value, errp);
> >  }
> >  
> > -static void pc_dimm_check_memdev_is_busy(Object *obj, const char *name,
> > +static void pc_dimm_check_memdev_is_busy(const Object *obj, const char *name,
> >                                        Object *val, Error **errp)
> >  {
> >      Error *local_err = NULL;
> > diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
> > index abeaf3d..e25016c 100644
> > --- a/hw/misc/ivshmem.c
> > +++ b/hw/misc/ivshmem.c
> > @@ -1005,7 +1005,7 @@ static const TypeInfo ivshmem_common_info = {
> >      .class_init    = ivshmem_common_class_init,
> >  };
> >  
> > -static void ivshmem_check_memdev_is_busy(Object *obj, const char *name,
> > +static void ivshmem_check_memdev_is_busy(const Object *obj, const char *name,
> >                                           Object *val, Error **errp)
> >  {
> >      if (host_memory_backend_is_mapped(MEMORY_BACKEND(val))) {
> > diff --git a/qom/object.c b/qom/object.c
> > index 7a05e35..a429e64 100644
> > --- a/qom/object.c
> > +++ b/qom/object.c
> > @@ -735,7 +735,7 @@ out:
> >      return ret;
> >  }
> >  
> > -const char *object_get_typename(Object *obj)
> > +const char *object_get_typename(const Object *obj)
> >  {
> >      return obj->class->type->name;
> >  }
> > @@ -1395,7 +1395,7 @@ out:
> >      g_free(type);
> >  }
> >  
> > -void object_property_allow_set_link(Object *obj, const char *name,
> > +void object_property_allow_set_link(const Object *obj, const char *name,
> >                                      Object *val, Error **errp)
> >  {
> >      /* Allow the link to be set, always */
> > @@ -1403,7 +1403,7 @@ void object_property_allow_set_link(Object *obj, const char *name,
> >  
> >  typedef struct {
> >      Object **child;
> > -    void (*check)(Object *, const char *, Object *, Error **);
> > +    void (*check)(const Object *, const char *, Object *, Error **);
> >      ObjectPropertyLinkFlags flags;
> >  } LinkProperty;
> >  
> > @@ -1519,7 +1519,7 @@ static void object_release_link_property(Object *obj, const char *name,
> >  
> >  void object_property_add_link(Object *obj, const char *name,
> >                                const char *type, Object **child,
> > -                              void (*check)(Object *, const char *,
> > +                              void (*check)(const Object *, const char *,
> >                                              Object *, Error **),
> >                                ObjectPropertyLinkFlags flags,
> >                                Error **errp)
> >   
> 
> 
> Good idea.  I think it's okay to wait for Fam's series.

yep, there is only one checker that's with does something suspicious:
 xlnx_dp_set_dpdma() which is with side-effects that modify source (val)
 argument but making target const is fine there (patch compiles :))

not sure what to do with it, checker shouldn't be used this way even for source,
as it creates bad precedent that could be copied later.

> 
> Paolo
> 

