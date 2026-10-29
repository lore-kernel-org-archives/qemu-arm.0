Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8CD606A320
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 21:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tzzkGzIA
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMXSO-0004wu-St; Thu, 29 Oct 2026 17:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xMXSM-0004wK-33
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 17:14:42 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xMXSJ-0001vm-Dm
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 17:14:41 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-8a058f74a54so1302301b3a.1
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 14:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793308477; x=1793913277; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=/C2hxVyYb+Xpn5/5k51lLA2L8eIYoVycs+0Rffv6qHI=;
 b=tzzkGzIAsrGPky70xQsm2qwxmu03qU9Xihrku9gBfkMufH3/FHRVrMXaTeqA6W2OEk
 gILbzp5wxjButEutYolx3+bnKNagSmwHsFquX4xxyK3CkvKccRu0K267bdtk2hIrSdIr
 dVQm0Dch+qRnXhSYQtowdWrKkT6g4luWsZTNMnpJqYX5y+5cRK9A+U62v0pG1KyDFXM/
 Ku3Enyar02ySUcRGafUgMhaWVUf/hN66nw1M5gYe9I88jxg37sSqzAiY9Th73vdpdgKQ
 FBuxri7Hl8pRPhv7ojUll8Bom05XU5Khpf90bR0zUG6w22G6dJWk4zJf0o7ubxgDqyrm
 kV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793308477; x=1793913277;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=/C2hxVyYb+Xpn5/5k51lLA2L8eIYoVycs+0Rffv6qHI=;
 b=adkxPvNhosYsT+8Atw85F1G9S0bf1n27csFfjnM9AWASyk6p/BlTQG8v9MFz9jWhou
 C59vunlLyjWgoNAWuNs9M7u4Df3EwZ/XxgoYe408TDlD9rKpmvJAZMAleQqMgs2cdXOs
 OydLpBTT3ge+87Z0Tav/A4WANyqtzp5w6fZ4IK4NbV0PtpguxmrZoiTzdtM78tIyjtup
 qx0Yr/MkknopmQdobwjxR2HYkLJLdRkZ53ha8M6kPhF3zesfBosV7nZD5euQ6fIVLGL+
 J3GHHSuV8P3IaH4hDXji8hzQx8WfLr5dE+5NK9nUP5JzS/9f0eZ0sHhMUl+ebIp19Led
 NgDA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwnAkcA4zw+zENLM0uiTIJLRlTK9b7Kw4J4DITZbkMO9FKqgKTg9xbGZAIF17ljZ8KPrDFK1aUqBQ==@nongnu.org
X-Gm-Message-State: AFq9FYJ08zr2Z/u/kTfw8hIsPEWwillel57O0ZQn2BA5/dLr3OQJPrTU
 hBHS8kEpH/uIuDDCxCIU/yLR127X+WRjxkgXFVy8g9zc3iacfcojaJwRGJpjn6kyMcE=
X-Gm-Gg: AYBFou2+/BPN0nNdnxXDZsXrFDNhW1x5o3SYU6T1KfppMOcNbWtxCogfz0v8Z4BEv65
 iQaelAaVQ7PLe4pjynTx1sR4S0Uht9AJ/xhBuBvCll6U2o5D+hJVkIm6q+KhaAeGWHtfmNbUBbZ
 FZBzz7eZefo0ESEacDsnsoxamgfmXu6+h69trE6OWiagn+ocbIKkQiCuQ1azuKtM3ArWpof5zfA
 qeLpNOQgQ7OnRBaxzR+kxi4Iael8P2IxH9SJqT9hKUlWF1J/ft+gbqNquGUDYrCI/6g3ji+y/rx
 S6Bkif21Vcoj3AcyN/4cfnSDZp2jdp0akIXD4yBGYuK5wOjTqscRXO29S6Ceb3uArH18cyXRDww
 J7IZUNMSzQRpjORA7sD8Fe+j9iqcfSKQt13SWPGNeRn/Z5BFYqco4m0xiFN1WEg4jksHCkXMElO
 nX8BSzF9rEh/Q//LuEgL1rs0PhTe1TpsamdNeQI+RwYBak2EgapAKAqf95rpj6VnNuYSY0D5ZLc
 bwchDZf+5grJQsH0csWXKZ+At6D9CitlNG5Wg5fZxkF75NjpQ7biVFgoDOefZ+00zNqxbSpmTMN
 KvwViAFGN+SpdOLBfBkFnVHGN3Zr8sFd
X-Received: by 2002:a05:6a00:10d1:b0:874:32d1:d3d8 with SMTP id
 d2e1a72fcca58-8a9bea671d0mr253355b3a.21.1793308476502; 
 Thu, 29 Oct 2026 14:14:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:97b0:7603:db48:102e])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8a98901aec6sm284640b3a.26.2026.10.29.14.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 14:14:35 -0700 (PDT)
Date: Thu, 29 Oct 2026 15:14:32 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Kohei Enju <enju.kohei@fujitsu.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Gavin Shan <gshan@redhat.com>, michael.roth@amd.com,
 berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, lorenzo.pieralisi@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: Re: [RFC v4 03/24] target/arm: Add confidential guest support
Message-ID: <auO3OKQGWiqtTcWU@p14s>
References: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
 <20260903193611.1058589-4-mathieu.poirier@linaro.org>
 <dhrvydsmaw22xqx5d5i5s7fdyjxupz27yxp6trv2tesysp4npj@quvzrxjvfipz>
 <arI197vJkW75p50c@lpieralisi>
 <arSTQQ5uB6oR-vFe@FCCLS0092175.localdomain> <ataBkrIvULJXj4v6@p14s>
 <784dfea3-24cb-4e70-ab46-b96b4b9a1831@redhat.com>
 <at-Wkw7a3Tn3Oh3M@red-moon>
 <auF8rstVcvsDUO6C@FCCLS0092175.localdomain>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auF8rstVcvsDUO6C@FCCLS0092175.localdomain>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 01:51:29PM +0900, Kohei Enju wrote:
> On 10/26 19:06, Lorenzo Pieralisi wrote:
> > On Wed, Oct 21, 2026 at 11:42:14PM +1000, Gavin Shan wrote:
> > > On 10/20/26 6:46 AM, Mathieu Poirier wrote:
> > > > On Thu, Sep 24, 2026 at 12:12:35PM +0900, Kohei Enju wrote:
> > > > > On 09/22 10:01, Lorenzo Pieralisi wrote:
> > > > > > On Tue, Sep 15, 2026 at 04:27:21PM -0500, Michael Roth wrote:
> > > > > > > On Thu, Sep 03, 2026 at 01:35:50PM -0600, Mathieu Poirier wrote:
> > > > > > > > From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > > > > > > > 
> > > > > > > > Add a new RmeGuest object, inheriting from ConfidentialGuestSupport, to
> > > > > > > > support the Arm Realm Management Extension (RME). It is instantiated by
> > > > > > > > passing on the command-line:
> > > > > > > > 
> > > > > > > >    -M virt,confidential-guest-support=<id>
> > > > > > > >    -object rme-guest,id=<id>
> > > > > > > > 
> > > > > > > > This is only the skeleton. Support will be added in following patches.
> > > > > > > > 
> > > > > > > > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > > > > > > > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > > > > > > ---
> > > > > > > >   docs/system/confidential-guest-support.rst |  1 +
> > > > > > > >   qapi/qom.json                              | 13 +++++++
> > > > > > > >   target/arm/kvm-rme.c                       | 42 ++++++++++++++++++++++
> > > > > > > >   target/arm/meson.build                     |  5 ++-
> > > > > > > >   4 files changed, 60 insertions(+), 1 deletion(-)
> > > > > > > >   create mode 100644 target/arm/kvm-rme.c
> > > > > > > > 
> > > > > > > > diff --git a/docs/system/confidential-guest-support.rst b/docs/system/confidential-guest-support.rst
> > > > > > > > index 562a7c3c2852..abb56923ad13 100644
> > > > > > > > --- a/docs/system/confidential-guest-support.rst
> > > > > > > > +++ b/docs/system/confidential-guest-support.rst
> > > > > > > > @@ -42,5 +42,6 @@ Currently supported confidential guest mechanisms are:
> > > > > > > >   * POWER Protected Execution Facility (PEF) (see :ref:`power-papr-protected-execution-facility-pef`)
> > > > > > > >   * s390x Protected Virtualization (PV) (see :doc:`s390x/protvirt`)
> > > > > > > >   * AWS Nitro Enclaves (see :doc:`nitro`)
> > > > > > > > +* Arm Realm Management Extension (RME)
> > > > > > > >   Other mechanisms may be supported in future.
> > > > > > > > diff --git a/qapi/qom.json b/qapi/qom.json
> > > > > > > > index 776b13027fd8..52997c29a32d 100644
> > > > > > > > --- a/qapi/qom.json
> > > > > > > > +++ b/qapi/qom.json
> > > > > > > > @@ -1288,6 +1288,17 @@
> > > > > > > >     'data': { '*pretty': 'bool',
> > > > > > > >               '*close-action': 'MonitorQMPCloseAction' } }
> > > > > > > > +##
> > > > > > > > +# @RmeGuestProperties:
> > > > > > > > +#
> > > > > > > > +# Properties for rme-guest objects.
> > > > > > > > +#
> > > > > > > > +# Since: 11.1
> > > > > > > > +##
> > > > > > > > +{ 'struct': 'RmeGuestProperties',
> > > > > > > > +  'base': 'ConfidentialGuestSupportProperties',
> > > > > > > 
> > > > > > > Just FYI, based on input from Markus I'm planning to drop this
> > > > > > > ConfidentialGuestSupportProperties base type from my series
> > > > > > > since it's probably only SNP/TDX that need to be able to switch
> > > > > > > it on/off, whereas this series appears to use/require it from
> > > > > > > the start.
> > > > > > > 
> > > > > > > I'm not exactly sure what it will look like for v3 yet, but if you
> > > > > > > were based on v2 you'd instead probably just do the following in the
> > > > > > > instance_init function for your rme-guest instance:
> > > > > > > 
> > > > > > >    cgs->allow_convert_in_place = true;
> > > > > > >    cgs->convert_in_place = true;
> > > > > > > 
> > > > > > > rather than exposing it as a cmdline option.
> > > > > > 
> > > > > > Yep, it won't be an option for CCA Realms anyway since that will be
> > > > > > the baseline.
> > > > > 
> > > > > IIUC, in-place conversion requires RAM backed by a shared/mappable
> > > > > guest_memfd. If in-place conversion is always enabled for CCA Realms,
> > > > > could QEMU also select the equivalent of
> > > > > 
> > > > >    -object memory-backend-guest-memfd,id=ram0,size=...,share=on
> > > > > 
> > > > > automatically for the default RAM, so that specifying the RAM size with
> > > > > `-m` is sufficient?
> > > > 
> > > > Are you suggesting that on Arm, we completely get rid of
> > > > 
> > > >      -object memory-backend-guest-memfd,id=ram0,size=$(RAMSIZE),share=on
> > > > 
> > > > or simply to get rid of "size=$(RAMSIZE)" in the above because it is redundant
> > > > with "-m $(RAMSIZE)"?
> > > > 
> > > > Gavin and Michael, what is your take on that suggestion?
> > > > 
> > > 
> > > I don't think that's what Kohei meant. He actually suggested the memory backend
> > > shall be pinned to memory-backend-guest-memfd and its in-place conversion shall
> > > be enabled when the memory backend isn't explicitly specified by users through
> > > "-object memory-backend-xxxx". For this inexplicit case, where the memory backend
> > > is determined by '-mem-path', the memory backend is either TYPE_MEMORY_BACKEND_FILE
> > > or TYPE_MEMORY_BACKEND_RAM. Please refer to create_default_memdev().
> > > 
> > > I think Kohei's suggestion makes sense. Besides, I think '-mem-path' should be
> > > disallowed for CCA Realms as TYPE_MEMORY_BACKEND_FILE isn't what we want.
> > 
> > Kohei, what were you suggesting then please ? I think TYPE_MEMORY_BACKEND_FILE
> > would not pass the checks required by Michael's v3 [0] on CCA - I will test this
> > and report back but the only backend allowed, rightly, is memfd,share=on, so it
> > _is_ disallowed.
> 
> Sorry for the late response.
> 
> To clarify, I meant the latter: when rme-guest is selected and the user
> has not explicitly provided a memory backend, QEMU could automatically
> create the default RAM as a shared guest-memfd backend.
> 
> In other words, rather than only rejecting the default file/RAM backend,
> the Realm configuration could select the equivalent of
> 
>   -object memory-backend-guest-memfd,id=<default-ram-id>,size=<RAMSIZE>,share=on
> 
> by default. Explicitly specified memory backends would still need to be
> validated against the Realm requirements.
> 
> My intention was that, if in-place conversion is the baseline for CCA
> Realms, `-m <size>` should be sufficient for the common Realm case,
> while preserving an explicit memory-backend option for users who need to
> control it.

Many thanks for the clarification, it is very helpful.  I will look into
implementing something along those lines for V6 and we can reconsider how to
move forward at that time.  

Thanks,
Mathieu

> 
> That said, I do not have a strong preference for deciding the default
> `-m` behavior at this stage. If it is premature to make that decision
> before the memory-backend and conversion interfaces have settled, I am
> happy to keep the explicit guest-memfd backend requirement for now and
> revisit the default behavior later.
> 
> Thanks,
> Kohei
> 
> > 
> > Lorenzo
> > 
> > [0] https://lore.kernel.org/kvm/20261007134323.1606088-1-michael.roth@amd.com/
> > 
> > > Thanks,
> > > Gavin
> > > 
> > > > Thanks,
> > > > Mathieu
> > > > 
> > > > > 
> > > > > Thanks,
> > > > > Kohei
> > > > > 
> > > > > > 
> > > > > > Thanks,
> > > > > > Lorenzo
> > > > > > 
> > > > > > > Thanks,
> > > > > > > 
> > > > > > > Mike
> > > > > > > 
> > > > > > > > +  'data': {} }
> > > > > > > > +
> > > > > > > >   ##
> > > > > > > >   # @ObjectType:
> > > > > > > >   #
> > > > > > > > @@ -1346,6 +1357,7 @@
> > > > > > > >       { 'name': 'pr-manager-helper',
> > > > > > > >         'if': 'CONFIG_LINUX' },
> > > > > > > >       'qtest',
> > > > > > > > +    'rme-guest',
> > > > > > > >       'rng-builtin',
> > > > > > > >       'rng-egd',
> > > > > > > >       { 'name': 'rng-random',
> > > > > > > > @@ -1427,6 +1439,7 @@
> > > > > > > >         'pr-manager-helper':          { 'type': 'PrManagerHelperProperties',
> > > > > > > >                                         'if': 'CONFIG_LINUX' },
> > > > > > > >         'qtest':                      'QtestProperties',
> > > > > > > > +      'rme-guest':                  'RmeGuestProperties',
> > > > > > > >         'rng-builtin':                'RngProperties',
> > > > > > > >         'rng-egd':                    'RngEgdProperties',
> > > > > > > >         'rng-random':                 { 'type': 'RngRandomProperties',
> > > > > > > > diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
> > > > > > > > new file mode 100644
> > > > > > > > index 000000000000..42e1d1e7b859
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/target/arm/kvm-rme.c
> > > > > > > > @@ -0,0 +1,42 @@
> > > > > > > > +/*
> > > > > > > > + * QEMU Arm RME support
> > > > > > > > + *
> > > > > > > > + * SPDX-License-Identifier: GPL-2.0-or-later
> > > > > > > > + *
> > > > > > > > + * Copyright Linaro 2026
> > > > > > > > + */
> > > > > > > > +
> > > > > > > > +#include "qemu/osdep.h"
> > > > > > > > +
> > > > > > > > +#include "hw/core/boards.h"
> > > > > > > > +#include "hw/core/cpu.h"
> > > > > > > > +#include "kvm_arm.h"
> > > > > > > > +#include "migration/blocker.h"
> > > > > > > > +#include "qapi/error.h"
> > > > > > > > +#include "qom/object_interfaces.h"
> > > > > > > > +#include "system/confidential-guest-support.h"
> > > > > > > > +#include "system/kvm.h"
> > > > > > > > +#include "system/runstate.h"
> > > > > > > > +
> > > > > > > > +#define TYPE_RME_GUEST "rme-guest"
> > > > > > > > +OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
> > > > > > > > +
> > > > > > > > +struct RmeGuest {
> > > > > > > > +    ConfidentialGuestSupport parent_obj;
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES(RmeGuest, rme_guest, RME_GUEST,
> > > > > > > > +                                          CONFIDENTIAL_GUEST_SUPPORT,
> > > > > > > > +                                          { TYPE_USER_CREATABLE }, { })
> > > > > > > > +
> > > > > > > > +static void rme_guest_class_init(ObjectClass *oc, const void *data)
> > > > > > > > +{
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +static void rme_guest_init(Object *obj)
> > > > > > > > +{
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +static void rme_guest_finalize(Object *obj)
> > > > > > > > +{
> > > > > > > > +}
> > > > > > > > diff --git a/target/arm/meson.build b/target/arm/meson.build
> > > > > > > > index 0369f96b4cc6..9d322a7aad28 100644
> > > > > > > > --- a/target/arm/meson.build
> > > > > > > > +++ b/target/arm/meson.build
> > > > > > > > @@ -31,7 +31,10 @@ arm_common_user_system_ss.add(when: 'TARGET_AARCH64', if_true: files(
> > > > > > > >   arm_common_system_ss.add(files(
> > > > > > > >     'arm-qmp-cmds.c',
> > > > > > > >   ))
> > > > > > > > -arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'))
> > > > > > > > +arm_system_ss.add(when: 'CONFIG_KVM', if_true: files(
> > > > > > > > +  'hyp_gdbstub.c',
> > > > > > > > +  'kvm.c',
> > > > > > > > +  'kvm-rme.c'))
> > > > > > > >   arm_system_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
> > > > > > > >   arm_user_ss.add(files('cpu.c'))
> > > > > > > > -- 
> > > > > > > > 2.43.0
> > > > > > > > 
> > > > > > > > 
> > > > 
> > > 

