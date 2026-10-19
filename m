Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B9D606A319
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Oct 2026 20:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CjECWg31
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIuFe-00047d-1f; Mon, 19 Oct 2026 16:46:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xIuFP-00046d-Rl
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 16:46:26 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xIuFN-0002hv-FA
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 16:46:19 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2e8fe8e343fso13214095ad.2
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2026 13:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792442775; x=1793047575; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=+cmecehZeDnyFMhm4HGeZeN/t9Uyu8M4slmgu4/aZVg=;
 b=CjECWg31IaaK5ZXEwnq+YwfYaMOJizIdsYYtNp8g8nzFCAge/cnCC3InzuLkp6JA0h
 z8IFHKyAlxf/CDwz/vlJO6rk6Ezvlin30MN7iKZknBSr4qoTRXxXmrbMpfrV0KgMTmsf
 YvTBed9kkt7uzNpn3Jb7KeBqYJMWvkq2hiKm9lYLYNgf8Muwy5DkcYYI1VuP+fODhoYt
 kcJwKSqW+pkx+Ae3/9ASohZXUwfN1xRP+OjUvbkcEJ47ubqhzMSTCU6D8+6kRP7sJfWZ
 M2KH0xVPPgHkgNt8lFNZKhhKLP9j9VQvLqg5gvr9ktdBWM+Ey2yVDSkM0R6baBntVQhE
 rUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792442775; x=1793047575;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=+cmecehZeDnyFMhm4HGeZeN/t9Uyu8M4slmgu4/aZVg=;
 b=EGu3Cu41cCWZTYxDurcRVQKCZpmxhX8nziuYTY9sXtU73t0qXRyorLy9nSijsYfivk
 p6ksUZ1FzvxvGcIquyi/HllzigMltRgOI0NEjBEkvXaYH2u4OJ8mnVAKcTrUzkrkwVAi
 8v68PqnV4bfRQWc50IMFW3RxNMpfaFsnaK4s7Qrpw19JlHLWiBblMlTRAXsvtl2w5uho
 nZVajzzHGko/XP7iGip0SF2783EC+TwR0UO2/cxDlqQHHkAkWCzqUx3grq1GeeSBK3vx
 GWvHyWT+smsr2vY5tsMacF1g+fG2HzWFN3S7MHW5e2D5VzdKj1CP2F2FH7t4ybpshvm7
 nwCg==
X-Forwarded-Encrypted: i=1;
 AKwUvBySX3/rugFPaubZ37H4q6WbMWPX+P2DUgKWbRenkpM9TwgcvDR4fdozh2jngNOALiX0jNByRPe0qQ==@nongnu.org
X-Gm-Message-State: AFq9FYJCQy4bHXa1TryEU6jPn2o3XdTYbPhzIDhYGbNnrflHNmAnxGZH
 7NbPiNL/OBQu9qIucRS5k3vcIeG5YlbAQVfKmU2hT6fxQr08bkIPjkgTexFwrR8tSlA=
X-Gm-Gg: AYBFou2rlyV8E665maWM8I91E3KdJX40gRq51Z9ujxKF5aa/OP4qLszkWGUcsIC0wx3
 Tp952k/LSEXa9EJdNNkyGTMg3A0LHOC3oyiba2e0hVRgx8kjGfyurAHl1rd8RiSm+VdBOtRVskL
 IVneJHKyx1Btd/CGI93/EHhVBIT+2VNzYQt41PxkzBdu9/auQKU8zWe70klV7RpqmFGleSJnRYH
 CvLV6zmzgXF/mWg58nXK63RDe8sdhTMxNjSosOwbnki5EHo1hjIUtotUMiT954++aQyaAeg714g
 SDjjQhsZhx4hkES4Kbhncg5uaqC5Qti2Ahhu6XVOerS2UZ6ChQ2CaI18H3egb/VRoNtxlUleXl3
 LFc0PkfpjoUAq11CJzBLw35jAYK+g4s7UnbjkDBJVoXDR6xSIVAJbreZxbbrK9CpuvUG7jtSiYP
 0az2oFjcWnvyGQouErS2FPOOcsq81y7Msbdn6K6doCr475Bw2+/lRKuLf+auLAJSbKOpMmvonO3
 SHx/M0ITcEL91PdbtSUx8j/uV5cYHmYawz4qzVJT0xCDzQcRPzbSayX6Zg=
X-Received: by 2002:a17:902:ebc6:b0:2dd:c053:82f1 with SMTP id
 d9443c01a7336-2e9a69f292amr71216945ad.40.1792442775447; 
 Mon, 19 Oct 2026 13:46:15 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:5410:6440:73bf:119f])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ea1517e4a3sm5328535ad.59.2026.10.19.13.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 13:46:14 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:46:10 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Kohei Enju <enju.kohei@fujitsu.com>, gshan@redhat.com, michael.roth@amd.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Michael Roth <michael.roth@amd.com>, berrange@redhat.com,
 kchamart@redhat.com, pierrick.bouvier@oss.qualcomm.com,
 peter.maydell@linaro.org, mst@redhat.com, cohuck@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com, armbru@redhat.com,
 lorenzo.pieralisi@linaro.org, gshan@redhat.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: Re: [RFC v4 03/24] target/arm: Add confidential guest support
Message-ID: <ataBkrIvULJXj4v6@p14s>
References: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
 <20260903193611.1058589-4-mathieu.poirier@linaro.org>
 <dhrvydsmaw22xqx5d5i5s7fdyjxupz27yxp6trv2tesysp4npj@quvzrxjvfipz>
 <arI197vJkW75p50c@lpieralisi>
 <arSTQQ5uB6oR-vFe@FCCLS0092175.localdomain>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arSTQQ5uB6oR-vFe@FCCLS0092175.localdomain>
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Sep 24, 2026 at 12:12:35PM +0900, Kohei Enju wrote:
> On 09/22 10:01, Lorenzo Pieralisi wrote:
> > On Tue, Sep 15, 2026 at 04:27:21PM -0500, Michael Roth wrote:
> > > On Thu, Sep 03, 2026 at 01:35:50PM -0600, Mathieu Poirier wrote:
> > > > From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > > > 
> > > > Add a new RmeGuest object, inheriting from ConfidentialGuestSupport, to
> > > > support the Arm Realm Management Extension (RME). It is instantiated by
> > > > passing on the command-line:
> > > > 
> > > >   -M virt,confidential-guest-support=<id>
> > > >   -object rme-guest,id=<id>
> > > > 
> > > > This is only the skeleton. Support will be added in following patches.
> > > > 
> > > > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > > > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > > ---
> > > >  docs/system/confidential-guest-support.rst |  1 +
> > > >  qapi/qom.json                              | 13 +++++++
> > > >  target/arm/kvm-rme.c                       | 42 ++++++++++++++++++++++
> > > >  target/arm/meson.build                     |  5 ++-
> > > >  4 files changed, 60 insertions(+), 1 deletion(-)
> > > >  create mode 100644 target/arm/kvm-rme.c
> > > > 
> > > > diff --git a/docs/system/confidential-guest-support.rst b/docs/system/confidential-guest-support.rst
> > > > index 562a7c3c2852..abb56923ad13 100644
> > > > --- a/docs/system/confidential-guest-support.rst
> > > > +++ b/docs/system/confidential-guest-support.rst
> > > > @@ -42,5 +42,6 @@ Currently supported confidential guest mechanisms are:
> > > >  * POWER Protected Execution Facility (PEF) (see :ref:`power-papr-protected-execution-facility-pef`)
> > > >  * s390x Protected Virtualization (PV) (see :doc:`s390x/protvirt`)
> > > >  * AWS Nitro Enclaves (see :doc:`nitro`)
> > > > +* Arm Realm Management Extension (RME)
> > > >  
> > > >  Other mechanisms may be supported in future.
> > > > diff --git a/qapi/qom.json b/qapi/qom.json
> > > > index 776b13027fd8..52997c29a32d 100644
> > > > --- a/qapi/qom.json
> > > > +++ b/qapi/qom.json
> > > > @@ -1288,6 +1288,17 @@
> > > >    'data': { '*pretty': 'bool',
> > > >              '*close-action': 'MonitorQMPCloseAction' } }
> > > >  
> > > > +##
> > > > +# @RmeGuestProperties:
> > > > +#
> > > > +# Properties for rme-guest objects.
> > > > +#
> > > > +# Since: 11.1
> > > > +##
> > > > +{ 'struct': 'RmeGuestProperties',
> > > > +  'base': 'ConfidentialGuestSupportProperties',
> > > 
> > > Just FYI, based on input from Markus I'm planning to drop this
> > > ConfidentialGuestSupportProperties base type from my series
> > > since it's probably only SNP/TDX that need to be able to switch
> > > it on/off, whereas this series appears to use/require it from
> > > the start.
> > > 
> > > I'm not exactly sure what it will look like for v3 yet, but if you
> > > were based on v2 you'd instead probably just do the following in the
> > > instance_init function for your rme-guest instance:
> > > 
> > >   cgs->allow_convert_in_place = true;
> > >   cgs->convert_in_place = true;
> > > 
> > > rather than exposing it as a cmdline option.
> > 
> > Yep, it won't be an option for CCA Realms anyway since that will be
> > the baseline.
> 
> IIUC, in-place conversion requires RAM backed by a shared/mappable
> guest_memfd. If in-place conversion is always enabled for CCA Realms,
> could QEMU also select the equivalent of
> 
>   -object memory-backend-guest-memfd,id=ram0,size=...,share=on
> 
> automatically for the default RAM, so that specifying the RAM size with
> `-m` is sufficient?

Are you suggesting that on Arm, we completely get rid of 

    -object memory-backend-guest-memfd,id=ram0,size=$(RAMSIZE),share=on

or simply to get rid of "size=$(RAMSIZE)" in the above because it is redundant
with "-m $(RAMSIZE)"?

Gavin and Michael, what is your take on that suggestion?

Thanks,
Mathieu

> 
> Thanks,
> Kohei
> 
> > 
> > Thanks,
> > Lorenzo
> > 
> > > Thanks,
> > > 
> > > Mike
> > > 
> > > > +  'data': {} }
> > > > +
> > > >  ##
> > > >  # @ObjectType:
> > > >  #
> > > > @@ -1346,6 +1357,7 @@
> > > >      { 'name': 'pr-manager-helper',
> > > >        'if': 'CONFIG_LINUX' },
> > > >      'qtest',
> > > > +    'rme-guest',
> > > >      'rng-builtin',
> > > >      'rng-egd',
> > > >      { 'name': 'rng-random',
> > > > @@ -1427,6 +1439,7 @@
> > > >        'pr-manager-helper':          { 'type': 'PrManagerHelperProperties',
> > > >                                        'if': 'CONFIG_LINUX' },
> > > >        'qtest':                      'QtestProperties',
> > > > +      'rme-guest':                  'RmeGuestProperties',
> > > >        'rng-builtin':                'RngProperties',
> > > >        'rng-egd':                    'RngEgdProperties',
> > > >        'rng-random':                 { 'type': 'RngRandomProperties',
> > > > diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
> > > > new file mode 100644
> > > > index 000000000000..42e1d1e7b859
> > > > --- /dev/null
> > > > +++ b/target/arm/kvm-rme.c
> > > > @@ -0,0 +1,42 @@
> > > > +/*
> > > > + * QEMU Arm RME support
> > > > + *
> > > > + * SPDX-License-Identifier: GPL-2.0-or-later
> > > > + *
> > > > + * Copyright Linaro 2026
> > > > + */
> > > > +
> > > > +#include "qemu/osdep.h"
> > > > +
> > > > +#include "hw/core/boards.h"
> > > > +#include "hw/core/cpu.h"
> > > > +#include "kvm_arm.h"
> > > > +#include "migration/blocker.h"
> > > > +#include "qapi/error.h"
> > > > +#include "qom/object_interfaces.h"
> > > > +#include "system/confidential-guest-support.h"
> > > > +#include "system/kvm.h"
> > > > +#include "system/runstate.h"
> > > > +
> > > > +#define TYPE_RME_GUEST "rme-guest"
> > > > +OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
> > > > +
> > > > +struct RmeGuest {
> > > > +    ConfidentialGuestSupport parent_obj;
> > > > +};
> > > > +
> > > > +OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES(RmeGuest, rme_guest, RME_GUEST,
> > > > +                                          CONFIDENTIAL_GUEST_SUPPORT,
> > > > +                                          { TYPE_USER_CREATABLE }, { })
> > > > +
> > > > +static void rme_guest_class_init(ObjectClass *oc, const void *data)
> > > > +{
> > > > +}
> > > > +
> > > > +static void rme_guest_init(Object *obj)
> > > > +{
> > > > +}
> > > > +
> > > > +static void rme_guest_finalize(Object *obj)
> > > > +{
> > > > +}
> > > > diff --git a/target/arm/meson.build b/target/arm/meson.build
> > > > index 0369f96b4cc6..9d322a7aad28 100644
> > > > --- a/target/arm/meson.build
> > > > +++ b/target/arm/meson.build
> > > > @@ -31,7 +31,10 @@ arm_common_user_system_ss.add(when: 'TARGET_AARCH64', if_true: files(
> > > >  arm_common_system_ss.add(files(
> > > >    'arm-qmp-cmds.c',
> > > >  ))
> > > > -arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'))
> > > > +arm_system_ss.add(when: 'CONFIG_KVM', if_true: files(
> > > > +  'hyp_gdbstub.c',
> > > > +  'kvm.c',
> > > > +  'kvm-rme.c'))
> > > >  arm_system_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
> > > >  
> > > >  arm_user_ss.add(files('cpu.c'))
> > > > -- 
> > > > 2.43.0
> > > > 
> > > > 

