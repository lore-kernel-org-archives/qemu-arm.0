Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183E3606A320
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 22:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ue2ikHCN
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMYK6-0000ZL-Js; Thu, 29 Oct 2026 18:10:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xMYJz-0000T7-BZ
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 18:10:08 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xMYJu-0007H9-IG
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 18:10:06 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-3ac77270fbfso27300a91.2
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 15:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793311801; x=1793916601; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=iWxGzUiL9af49cd3f3h7Wfqs2xiIj0zeQzBJaUAAk5Y=;
 b=Ue2ikHCNT5ny9jR5dWIgRgJMagRM7z3JtnFzK8nDYHlju2dDwJSfyxSZUP2MMevwDt
 QJMqLg3VwZVPIuaZD3VSzOzY0ESdL4JFB6M/wwc86bMyOJHvwh9dYnHPCyB14FXWw1Xc
 weAjqCHH/TGyhDb1lUBVOQBOtC6M5s+K9d/exzLMG5HguX1JOcw7zmjFExtu7KzeKD/3
 wwzf2gWwwlTUzofS227liT7FCMJ4PHrOKbek5JnEVEeFU33JtkUQiu1dWyjU6zG1P1m/
 XiURDSS4XbxoHwdivRFzaR/5A2jfYTu9bPokk1ANm0fPshE06pKAm04qKopsESKso/SV
 Z8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793311801; x=1793916601;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=iWxGzUiL9af49cd3f3h7Wfqs2xiIj0zeQzBJaUAAk5Y=;
 b=1W5fbgXDhtddl+TyUa/c5cTSv2l1A22UnRS+0illeIcOKliGDrZKf6CkvG1OC1o/M9
 LyKFxQJAHeBf4+KCImH0XjId9W0Ge3FjJc5Dn8HaFtm92ksG+k/OL6Z+vIn7Zh6fz7uT
 K+vkU/shDqXCBKBhc0LWbncrCpcIouDoE7fzrAXeBbYPMoMEbUD6LBG2Amc1SrGl7YEe
 JW93JxkTJra9eZOQx7E+LIJXtQtl8YHVsM10vTvp6jPuxEy54hvNqIm0iH2HgmMaMvZS
 VntIpm/ymyq40h0ZhiD70YyG+ULXWmTfHK7uFE3axrGip/R47rSr9UoLUH9FN9Nr0fhB
 Bgmg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzDt2d2ejIAcnbmhsc0fWI5XtQFNxr+BJ9zP5tStSp4iS3Vx1wJkGuXoXMC91jIXuNaxNWZeYSv1w==@nongnu.org
X-Gm-Message-State: AFq9FYKvVYHDsGVR3hMmEYoScc3UsfotXLSvr5yiV5LFbPLkHqNyjliE
 iI/8XInTLK2vG51dSNR+LeQRDPERj2IyJlRgaC0azW6ILV/iMYvAbF4h3/S9PBQ8p+E=
X-Gm-Gg: AYBFou0dyyRL88yUBTp8D4p36gwdHu5gHTXFNNdrEdKnvUuXTowAqgn50twJ3afjfXL
 6H7pF1vk3SdapwaGXoWfuVXrbRP+a+IVWu01W/QZfr6qVSBW/RfjMHvbMfm7yaakKM4njeO47Wz
 INwXw0GlLo6jvwsQLSMv5UPL6MN1Ac7vcMH2aMZWu/LmZZyO9C7ajWgCLzTffq8qvTSwFbFOoWC
 pm9MoE7d1ZT5HjVSm/aZqDbzNnDeFNEYGPToMKePEDOP8TSoj+lMlIC92CFkGE0keo17ZweIE8e
 IMAOTmOANHoUM879axnc65G/gupuCoPfARExsc4RPji4J8rSG0iRpHTRPekKuzdMkOeJfQLJdRh
 SrUNvnTUyj7zRSxUR/kqDLsXlsYB9sRUorA90O3RolaVrL01plOPMS4iDbOWvuX/aA/k1kNRe/l
 psK2YHPkp/zu0OWzOYT6mMfhGqjnEX+AhZQuhgd2FWyR9uDIGm1BhwatkjC3YujHOnsD6GmIQFM
 +UaZ2h2iWvc58MPyG1/+L27Fj/oREOa0XxUREs318vVgnDkQLqamsyqNl7Vvt0Lfrt55Gor+gCn
 EpKQIa9zpEWukA5PPqE1MJ+S1og5iL35
X-Received: by 2002:a17:90b:5847:b0:3ac:17c:6e89 with SMTP id
 98e67ed59e1d1-3ae89773f17mr244310a91.19.1793311800386; 
 Thu, 29 Oct 2026 15:10:00 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:97b0:7603:db48:102e])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ae85f662basm344514a91.1.2026.10.29.15.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 15:09:59 -0700 (PDT)
Date: Thu, 29 Oct 2026 16:09:57 -0600
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
Message-ID: <auPENXGj6cVN1lSt@p14s>
References: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
 <20260903193611.1058589-4-mathieu.poirier@linaro.org>
 <dhrvydsmaw22xqx5d5i5s7fdyjxupz27yxp6trv2tesysp4npj@quvzrxjvfipz>
 <arI197vJkW75p50c@lpieralisi>
 <arSTQQ5uB6oR-vFe@FCCLS0092175.localdomain> <ataBkrIvULJXj4v6@p14s>
 <784dfea3-24cb-4e70-ab46-b96b4b9a1831@redhat.com>
 <at-Wkw7a3Tn3Oh3M@red-moon>
 <auF8rstVcvsDUO6C@FCCLS0092175.localdomain> <auO3OKQGWiqtTcWU@p14s>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auO3OKQGWiqtTcWU@p14s>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x1033.google.com
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
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 03:14:32PM -0600, Mathieu Poirier wrote:
> On Wed, Oct 28, 2026 at 01:51:29PM +0900, Kohei Enju wrote:
> > On 10/26 19:06, Lorenzo Pieralisi wrote:
> > > On Wed, Oct 21, 2026 at 11:42:14PM +1000, Gavin Shan wrote:
> > > > On 10/20/26 6:46 AM, Mathieu Poirier wrote:
> > > > > On Thu, Sep 24, 2026 at 12:12:35PM +0900, Kohei Enju wrote:
> > > > > > On 09/22 10:01, Lorenzo Pieralisi wrote:
> > > > > > > On Tue, Sep 15, 2026 at 04:27:21PM -0500, Michael Roth wrote:
> > > > > > > > On Thu, Sep 03, 2026 at 01:35:50PM -0600, Mathieu Poirier wrote:
> > > > > > > > > From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > > > > > > > > 
> > > > > > > > > Add a new RmeGuest object, inheriting from ConfidentialGuestSupport, to
> > > > > > > > > support the Arm Realm Management Extension (RME). It is instantiated by
> > > > > > > > > passing on the command-line:
> > > > > > > > > 
> > > > > > > > >    -M virt,confidential-guest-support=<id>
> > > > > > > > >    -object rme-guest,id=<id>
> > > > > > > > > 
> > > > > > > > > This is only the skeleton. Support will be added in following patches.
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > > > > > > > > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > > > > > > > ---
> > > > > > > > >   docs/system/confidential-guest-support.rst |  1 +
> > > > > > > > >   qapi/qom.json                              | 13 +++++++
> > > > > > > > >   target/arm/kvm-rme.c                       | 42 ++++++++++++++++++++++
> > > > > > > > >   target/arm/meson.build                     |  5 ++-
> > > > > > > > >   4 files changed, 60 insertions(+), 1 deletion(-)
> > > > > > > > >   create mode 100644 target/arm/kvm-rme.c
> > > > > > > > > 
> > > > > > > > > diff --git a/docs/system/confidential-guest-support.rst b/docs/system/confidential-guest-support.rst
> > > > > > > > > index 562a7c3c2852..abb56923ad13 100644
> > > > > > > > > --- a/docs/system/confidential-guest-support.rst
> > > > > > > > > +++ b/docs/system/confidential-guest-support.rst
> > > > > > > > > @@ -42,5 +42,6 @@ Currently supported confidential guest mechanisms are:
> > > > > > > > >   * POWER Protected Execution Facility (PEF) (see :ref:`power-papr-protected-execution-facility-pef`)
> > > > > > > > >   * s390x Protected Virtualization (PV) (see :doc:`s390x/protvirt`)
> > > > > > > > >   * AWS Nitro Enclaves (see :doc:`nitro`)
> > > > > > > > > +* Arm Realm Management Extension (RME)
> > > > > > > > >   Other mechanisms may be supported in future.
> > > > > > > > > diff --git a/qapi/qom.json b/qapi/qom.json
> > > > > > > > > index 776b13027fd8..52997c29a32d 100644
> > > > > > > > > --- a/qapi/qom.json
> > > > > > > > > +++ b/qapi/qom.json
> > > > > > > > > @@ -1288,6 +1288,17 @@
> > > > > > > > >     'data': { '*pretty': 'bool',
> > > > > > > > >               '*close-action': 'MonitorQMPCloseAction' } }
> > > > > > > > > +##
> > > > > > > > > +# @RmeGuestProperties:
> > > > > > > > > +#
> > > > > > > > > +# Properties for rme-guest objects.
> > > > > > > > > +#
> > > > > > > > > +# Since: 11.1
> > > > > > > > > +##
> > > > > > > > > +{ 'struct': 'RmeGuestProperties',
> > > > > > > > > +  'base': 'ConfidentialGuestSupportProperties',
> > > > > > > > 
> > > > > > > > Just FYI, based on input from Markus I'm planning to drop this
> > > > > > > > ConfidentialGuestSupportProperties base type from my series
> > > > > > > > since it's probably only SNP/TDX that need to be able to switch
> > > > > > > > it on/off, whereas this series appears to use/require it from
> > > > > > > > the start.
> > > > > > > > 
> > > > > > > > I'm not exactly sure what it will look like for v3 yet, but if you
> > > > > > > > were based on v2 you'd instead probably just do the following in the
> > > > > > > > instance_init function for your rme-guest instance:
> > > > > > > > 
> > > > > > > >    cgs->allow_convert_in_place = true;
> > > > > > > >    cgs->convert_in_place = true;
> > > > > > > > 
> > > > > > > > rather than exposing it as a cmdline option.
> > > > > > > 
> > > > > > > Yep, it won't be an option for CCA Realms anyway since that will be
> > > > > > > the baseline.
> > > > > > 
> > > > > > IIUC, in-place conversion requires RAM backed by a shared/mappable
> > > > > > guest_memfd. If in-place conversion is always enabled for CCA Realms,
> > > > > > could QEMU also select the equivalent of
> > > > > > 
> > > > > >    -object memory-backend-guest-memfd,id=ram0,size=...,share=on
> > > > > > 
> > > > > > automatically for the default RAM, so that specifying the RAM size with
> > > > > > `-m` is sufficient?
> > > > > 
> > > > > Are you suggesting that on Arm, we completely get rid of
> > > > > 
> > > > >      -object memory-backend-guest-memfd,id=ram0,size=$(RAMSIZE),share=on
> > > > > 
> > > > > or simply to get rid of "size=$(RAMSIZE)" in the above because it is redundant
> > > > > with "-m $(RAMSIZE)"?
> > > > > 
> > > > > Gavin and Michael, what is your take on that suggestion?
> > > > > 
> > > > 
> > > > I don't think that's what Kohei meant. He actually suggested the memory backend
> > > > shall be pinned to memory-backend-guest-memfd and its in-place conversion shall
> > > > be enabled when the memory backend isn't explicitly specified by users through
> > > > "-object memory-backend-xxxx". For this inexplicit case, where the memory backend
> > > > is determined by '-mem-path', the memory backend is either TYPE_MEMORY_BACKEND_FILE
> > > > or TYPE_MEMORY_BACKEND_RAM. Please refer to create_default_memdev().
> > > > 
> > > > I think Kohei's suggestion makes sense. Besides, I think '-mem-path' should be
> > > > disallowed for CCA Realms as TYPE_MEMORY_BACKEND_FILE isn't what we want.
> > > 
> > > Kohei, what were you suggesting then please ? I think TYPE_MEMORY_BACKEND_FILE
> > > would not pass the checks required by Michael's v3 [0] on CCA - I will test this
> > > and report back but the only backend allowed, rightly, is memfd,share=on, so it
> > > _is_ disallowed.
> > 
> > Sorry for the late response.
> > 
> > To clarify, I meant the latter: when rme-guest is selected and the user
> > has not explicitly provided a memory backend, QEMU could automatically
> > create the default RAM as a shared guest-memfd backend.
> > 
> > In other words, rather than only rejecting the default file/RAM backend,
> > the Realm configuration could select the equivalent of
> > 
> >   -object memory-backend-guest-memfd,id=<default-ram-id>,size=<RAMSIZE>,share=on
> > 
> > by default. Explicitly specified memory backends would still need to be
> > validated against the Realm requirements.
> > 
> > My intention was that, if in-place conversion is the baseline for CCA
> > Realms, `-m <size>` should be sufficient for the common Realm case,
> > while preserving an explicit memory-backend option for users who need to
> > control it.
> 
> Many thanks for the clarification, it is very helpful.  I will look into
> implementing something along those lines for V6 and we can reconsider how to
> move forward at that time.  

And then I read Michael's comment again, and again and again...

> 
> Thanks,
> Mathieu
> 
> > 
> > That said, I do not have a strong preference for deciding the default
> > `-m` behavior at this stage. If it is premature to make that decision
> > before the memory-backend and conversion interfaces have settled, I am
> > happy to keep the explicit guest-memfd backend requirement for now and
> > revisit the default behavior later.
> > 

For the time being I will hold back on moving forward with this request.  Let's
revisit at some point in the future.

> > Thanks,
> > Kohei
> > 
> > > 
> > > Lorenzo
> > > 
> > > [0] https://lore.kernel.org/kvm/20261007134323.1606088-1-michael.roth@amd.com/
> > > 
> > > > Thanks,
> > > > Gavin
> > > > 
> > > > > Thanks,
> > > > > Mathieu
> > > > > 
> > > > > > 
> > > > > > Thanks,
> > > > > > Kohei
> > > > > > 
> > > > > > > 
> > > > > > > Thanks,
> > > > > > > Lorenzo
> > > > > > > 
> > > > > > > > Thanks,
> > > > > > > > 
> > > > > > > > Mike
> > > > > > > > 
> > > > > > > > > +  'data': {} }
> > > > > > > > > +
> > > > > > > > >   ##
> > > > > > > > >   # @ObjectType:
> > > > > > > > >   #
> > > > > > > > > @@ -1346,6 +1357,7 @@
> > > > > > > > >       { 'name': 'pr-manager-helper',
> > > > > > > > >         'if': 'CONFIG_LINUX' },
> > > > > > > > >       'qtest',
> > > > > > > > > +    'rme-guest',
> > > > > > > > >       'rng-builtin',
> > > > > > > > >       'rng-egd',
> > > > > > > > >       { 'name': 'rng-random',
> > > > > > > > > @@ -1427,6 +1439,7 @@
> > > > > > > > >         'pr-manager-helper':          { 'type': 'PrManagerHelperProperties',
> > > > > > > > >                                         'if': 'CONFIG_LINUX' },
> > > > > > > > >         'qtest':                      'QtestProperties',
> > > > > > > > > +      'rme-guest':                  'RmeGuestProperties',
> > > > > > > > >         'rng-builtin':                'RngProperties',
> > > > > > > > >         'rng-egd':                    'RngEgdProperties',
> > > > > > > > >         'rng-random':                 { 'type': 'RngRandomProperties',
> > > > > > > > > diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
> > > > > > > > > new file mode 100644
> > > > > > > > > index 000000000000..42e1d1e7b859
> > > > > > > > > --- /dev/null
> > > > > > > > > +++ b/target/arm/kvm-rme.c
> > > > > > > > > @@ -0,0 +1,42 @@
> > > > > > > > > +/*
> > > > > > > > > + * QEMU Arm RME support
> > > > > > > > > + *
> > > > > > > > > + * SPDX-License-Identifier: GPL-2.0-or-later
> > > > > > > > > + *
> > > > > > > > > + * Copyright Linaro 2026
> > > > > > > > > + */
> > > > > > > > > +
> > > > > > > > > +#include "qemu/osdep.h"
> > > > > > > > > +
> > > > > > > > > +#include "hw/core/boards.h"
> > > > > > > > > +#include "hw/core/cpu.h"
> > > > > > > > > +#include "kvm_arm.h"
> > > > > > > > > +#include "migration/blocker.h"
> > > > > > > > > +#include "qapi/error.h"
> > > > > > > > > +#include "qom/object_interfaces.h"
> > > > > > > > > +#include "system/confidential-guest-support.h"
> > > > > > > > > +#include "system/kvm.h"
> > > > > > > > > +#include "system/runstate.h"
> > > > > > > > > +
> > > > > > > > > +#define TYPE_RME_GUEST "rme-guest"
> > > > > > > > > +OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
> > > > > > > > > +
> > > > > > > > > +struct RmeGuest {
> > > > > > > > > +    ConfidentialGuestSupport parent_obj;
> > > > > > > > > +};
> > > > > > > > > +
> > > > > > > > > +OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES(RmeGuest, rme_guest, RME_GUEST,
> > > > > > > > > +                                          CONFIDENTIAL_GUEST_SUPPORT,
> > > > > > > > > +                                          { TYPE_USER_CREATABLE }, { })
> > > > > > > > > +
> > > > > > > > > +static void rme_guest_class_init(ObjectClass *oc, const void *data)
> > > > > > > > > +{
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +static void rme_guest_init(Object *obj)
> > > > > > > > > +{
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +static void rme_guest_finalize(Object *obj)
> > > > > > > > > +{
> > > > > > > > > +}
> > > > > > > > > diff --git a/target/arm/meson.build b/target/arm/meson.build
> > > > > > > > > index 0369f96b4cc6..9d322a7aad28 100644
> > > > > > > > > --- a/target/arm/meson.build
> > > > > > > > > +++ b/target/arm/meson.build
> > > > > > > > > @@ -31,7 +31,10 @@ arm_common_user_system_ss.add(when: 'TARGET_AARCH64', if_true: files(
> > > > > > > > >   arm_common_system_ss.add(files(
> > > > > > > > >     'arm-qmp-cmds.c',
> > > > > > > > >   ))
> > > > > > > > > -arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'))
> > > > > > > > > +arm_system_ss.add(when: 'CONFIG_KVM', if_true: files(
> > > > > > > > > +  'hyp_gdbstub.c',
> > > > > > > > > +  'kvm.c',
> > > > > > > > > +  'kvm-rme.c'))
> > > > > > > > >   arm_system_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
> > > > > > > > >   arm_user_ss.add(files('cpu.c'))
> > > > > > > > > -- 
> > > > > > > > > 2.43.0
> > > > > > > > > 
> > > > > > > > > 
> > > > > 
> > > > 

