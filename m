Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C02606A31B
	for <qemu-arm@archiver.kernel.org>; Tue, 20 Oct 2026 17:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=w8Sc1tC4
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJDco-0000YB-Hj; Tue, 20 Oct 2026 13:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xJDci-0000Sh-Mr
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 13:27:40 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xJDcg-0001By-Az
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 13:27:40 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2e977109392so16584735ad.0
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 10:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792517256; x=1793122056; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=TIuVvUMuRAYl/dxcnqP8vb2VgWML544JX9D0im23wI4=;
 b=w8Sc1tC4rH27JXn6qranqOqBvgRiOfnqRSJjA0Vl/0cFDmSuFVkWGhmivewk0zzeVl
 SneGIAooFhh9500PqOGvBB55CkhcCICO/DerD/F657CBBMFqNg0FRFWCQS9fGMfmOGco
 yFHs0vd3+7DWo4yuuriHpmhffxHNYBnMUXy+mL3ELABFE6lw/OZSCMu1pSj6k4DxbM+N
 P643ei5p4vGITk6qGkmTmSVIYm7nPeXJhGu7Xt+uGythToXB0wNb+kQnTVVOX6S6w3Bo
 vv+QJaOLnGM+zTXbstb5RTfk5C8HdI66Neij9L10nU1CJpWJ0tMv6mT4JzZXA5Nn+GGv
 SXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792517256; x=1793122056;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=TIuVvUMuRAYl/dxcnqP8vb2VgWML544JX9D0im23wI4=;
 b=k0w9QSqwf7oruSLA2IvH79Npkb1cZt8r2i/vLwmNBvFh5uGmmP+rsUqwXicjRFQo3p
 DA4AI64C3Q4k6cpm+FSIgc67qNbm0XsyfBgzjSeHM9qcenUCTsMXutIXgwP9EUBlOzm4
 Um/Tc+xhk2RlseVvkyhSN1fqsOObK6mXQ/csDONxLwayOl/JwL96Pni3zMTwmbKkMJxW
 ATqBt/O75Rc8YjjrPYz2tjh/3BhrOm+NzXOimhBeyvWCb444ZH7/35bvcWyUwIWc/Fpw
 p1aXrd6DgWKqtUvp6sBR/aMUNVwr9PnoMGn/zkGBxUAJQhVXFawC5JCmXEJR3HOeKpMg
 wD6w==
X-Forwarded-Encrypted: i=1;
 AKwUvByvzw0YNmibAAxtvPIIRRbM5KmjZ6g9USKNX1+Ycv30SsdQytdWacfITSXcxzKwNBAflj/8M1mNGQ==@nongnu.org
X-Gm-Message-State: AFq9FYJMdaItl7n9/k56GFok2Q0icuH5oy4HK7QfQLzPOjgcbrG9yBks
 OUunVhoNTEpK7FfcVtsowB07/aHPKnjRuLWQSF4Fz7mygE4dTb3QM6vU2z/goc/VWA8=
X-Gm-Gg: AYBFou3iKQCcw6YO0qi9ZxSq6pRrJrrHt3uUsde0YXt+IjdROYEqmMSF/X8fabdB8w8
 /SLrzXVqLpkiTisWAikt9b0AIIOEQ1209OOSapKGJ2NdG794V0r/phsDStIbzMRhU21qZlFePV3
 BfUXfc9mTfKi2d/PtjVmxGjY43asb6a0n6PmPXiEkSm3XCTYd/D9DdqDeo9Oy0G+B4MMXhYma2T
 IpxU6DHkm8tcPRrcFJrDhlTV9IElcBB2Cav5taavTVicyIuOAlI2NCcy609CMJCJ5QlBjg71Hwa
 42oOhsLrjRkkew7fWU91VDHKj2ijne/Jgx5Y12M+1nl7nYErj8PGsuBAleydEn3NxWGrmmqgKmf
 xaIcadR1l4vBD906s5OF8CQ8uGRCBnzL9sCWMoUhUmjGyvk2PROK+Mufs7qcgESV5E1AiUVyNjS
 7IYzl4bJRmJSj9NdW3krP/ccXgEc6hah0QrAL9DTqinjl252zXvj6d+HUAdS/u7zWPE6St90HuA
 Q==
X-Received: by 2002:a17:90b:3b86:b0:3ab:2737:3396 with SMTP id
 98e67ed59e1d1-3acef5f1d2dmr10291676a91.65.1792517256200; 
 Tue, 20 Oct 2026 10:27:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1567:1f94:7104:b613])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ad80303567sm467989a91.14.2026.10.20.10.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 10:27:35 -0700 (PDT)
Date: Tue, 20 Oct 2026 11:27:33 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Kohei Enju <enju.kohei@fujitsu.com>, gshan@redhat.com,
 michael.roth@amd.com, berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, lorenzo.pieralisi@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: Re: [RFC v4 03/24] target/arm: Add confidential guest support
Message-ID: <atekhR1Wz03nUCHB@p14s>
References: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
 <20260903193611.1058589-4-mathieu.poirier@linaro.org>
 <dhrvydsmaw22xqx5d5i5s7fdyjxupz27yxp6trv2tesysp4npj@quvzrxjvfipz>
 <arI197vJkW75p50c@lpieralisi>
 <arSTQQ5uB6oR-vFe@FCCLS0092175.localdomain> <ataBkrIvULJXj4v6@p14s>
 <atdKSwvu_uldqwlz@red-moon>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atdKSwvu_uldqwlz@red-moon>
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pl1-x636.google.com
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

On Tue, Oct 20, 2026 at 01:02:35PM +0200, Lorenzo Pieralisi wrote:
> On Mon, Oct 19, 2026 at 02:46:10PM -0600, Mathieu Poirier wrote:
> > On Thu, Sep 24, 2026 at 12:12:35PM +0900, Kohei Enju wrote:
> > > On 09/22 10:01, Lorenzo Pieralisi wrote:
> > > > On Tue, Sep 15, 2026 at 04:27:21PM -0500, Michael Roth wrote:
> > > > > On Thu, Sep 03, 2026 at 01:35:50PM -0600, Mathieu Poirier wrote:
> > > > > > From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > > > > > 
> > > > > > Add a new RmeGuest object, inheriting from ConfidentialGuestSupport, to
> > > > > > support the Arm Realm Management Extension (RME). It is instantiated by
> > > > > > passing on the command-line:
> > > > > > 
> > > > > >   -M virt,confidential-guest-support=<id>
> > > > > >   -object rme-guest,id=<id>
> > > > > > 
> > > > > > This is only the skeleton. Support will be added in following patches.
> > > > > > 
> > > > > > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > > > > > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > > > > ---
> > > > > >  docs/system/confidential-guest-support.rst |  1 +
> > > > > >  qapi/qom.json                              | 13 +++++++
> > > > > >  target/arm/kvm-rme.c                       | 42 ++++++++++++++++++++++
> > > > > >  target/arm/meson.build                     |  5 ++-
> > > > > >  4 files changed, 60 insertions(+), 1 deletion(-)
> > > > > >  create mode 100644 target/arm/kvm-rme.c
> > > > > > 
> > > > > > diff --git a/docs/system/confidential-guest-support.rst b/docs/system/confidential-guest-support.rst
> > > > > > index 562a7c3c2852..abb56923ad13 100644
> > > > > > --- a/docs/system/confidential-guest-support.rst
> > > > > > +++ b/docs/system/confidential-guest-support.rst
> > > > > > @@ -42,5 +42,6 @@ Currently supported confidential guest mechanisms are:
> > > > > >  * POWER Protected Execution Facility (PEF) (see :ref:`power-papr-protected-execution-facility-pef`)
> > > > > >  * s390x Protected Virtualization (PV) (see :doc:`s390x/protvirt`)
> > > > > >  * AWS Nitro Enclaves (see :doc:`nitro`)
> > > > > > +* Arm Realm Management Extension (RME)
> > > > > >  
> > > > > >  Other mechanisms may be supported in future.
> > > > > > diff --git a/qapi/qom.json b/qapi/qom.json
> > > > > > index 776b13027fd8..52997c29a32d 100644
> > > > > > --- a/qapi/qom.json
> > > > > > +++ b/qapi/qom.json
> > > > > > @@ -1288,6 +1288,17 @@
> > > > > >    'data': { '*pretty': 'bool',
> > > > > >              '*close-action': 'MonitorQMPCloseAction' } }
> > > > > >  
> > > > > > +##
> > > > > > +# @RmeGuestProperties:
> > > > > > +#
> > > > > > +# Properties for rme-guest objects.
> > > > > > +#
> > > > > > +# Since: 11.1
> > > > > > +##
> > > > > > +{ 'struct': 'RmeGuestProperties',
> > > > > > +  'base': 'ConfidentialGuestSupportProperties',
> > > > > 
> > > > > Just FYI, based on input from Markus I'm planning to drop this
> > > > > ConfidentialGuestSupportProperties base type from my series
> > > > > since it's probably only SNP/TDX that need to be able to switch
> > > > > it on/off, whereas this series appears to use/require it from
> > > > > the start.
> > > > > 
> > > > > I'm not exactly sure what it will look like for v3 yet, but if you
> > > > > were based on v2 you'd instead probably just do the following in the
> > > > > instance_init function for your rme-guest instance:
> > > > > 
> > > > >   cgs->allow_convert_in_place = true;
> > > > >   cgs->convert_in_place = true;
> > > > > 
> > > > > rather than exposing it as a cmdline option.
> > > > 
> > > > Yep, it won't be an option for CCA Realms anyway since that will be
> > > > the baseline.
> > > 
> > > IIUC, in-place conversion requires RAM backed by a shared/mappable
> > > guest_memfd. If in-place conversion is always enabled for CCA Realms,
> > > could QEMU also select the equivalent of
> > > 
> > >   -object memory-backend-guest-memfd,id=ram0,size=...,share=on
> > > 
> > > automatically for the default RAM, so that specifying the RAM size with
> > > `-m` is sufficient?
> > 
> > Are you suggesting that on Arm, we completely get rid of 
> 
> Nit: obviously on Arm rme-guest configs.

Indeed.

> 
> >     -object memory-backend-guest-memfd,id=ram0,size=$(RAMSIZE),share=on
> 
> If that's what we want to make a default, I guess we ought to override
> create_default_memdev for arm machines + rme-guest configs ?
> 
> Pros and cons ? I am not sure how well received is setting implicit defaults
> for specific machine configs and what that really buys us eventually.

I agree, this entails a fair amount of changes for cosmetic gains only.

> 
> > or simply to get rid of "size=$(RAMSIZE)" in the above because it is redundant
> > with "-m $(RAMSIZE)"?
> > 
> > Gavin and Michael, what is your take on that suggestion?
> 
> Yes please any feedback on this is welcome.
> 
> Thanks,
> Lorenzo
> 
> > Thanks,
> > Mathieu
> > 
> > > 
> > > Thanks,
> > > Kohei
> > > 
> > > > 
> > > > Thanks,
> > > > Lorenzo
> > > > 
> > > > > Thanks,
> > > > > 
> > > > > Mike
> > > > > 
> > > > > > +  'data': {} }
> > > > > > +
> > > > > >  ##
> > > > > >  # @ObjectType:
> > > > > >  #
> > > > > > @@ -1346,6 +1357,7 @@
> > > > > >      { 'name': 'pr-manager-helper',
> > > > > >        'if': 'CONFIG_LINUX' },
> > > > > >      'qtest',
> > > > > > +    'rme-guest',
> > > > > >      'rng-builtin',
> > > > > >      'rng-egd',
> > > > > >      { 'name': 'rng-random',
> > > > > > @@ -1427,6 +1439,7 @@
> > > > > >        'pr-manager-helper':          { 'type': 'PrManagerHelperProperties',
> > > > > >                                        'if': 'CONFIG_LINUX' },
> > > > > >        'qtest':                      'QtestProperties',
> > > > > > +      'rme-guest':                  'RmeGuestProperties',
> > > > > >        'rng-builtin':                'RngProperties',
> > > > > >        'rng-egd':                    'RngEgdProperties',
> > > > > >        'rng-random':                 { 'type': 'RngRandomProperties',
> > > > > > diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
> > > > > > new file mode 100644
> > > > > > index 000000000000..42e1d1e7b859
> > > > > > --- /dev/null
> > > > > > +++ b/target/arm/kvm-rme.c
> > > > > > @@ -0,0 +1,42 @@
> > > > > > +/*
> > > > > > + * QEMU Arm RME support
> > > > > > + *
> > > > > > + * SPDX-License-Identifier: GPL-2.0-or-later
> > > > > > + *
> > > > > > + * Copyright Linaro 2026
> > > > > > + */
> > > > > > +
> > > > > > +#include "qemu/osdep.h"
> > > > > > +
> > > > > > +#include "hw/core/boards.h"
> > > > > > +#include "hw/core/cpu.h"
> > > > > > +#include "kvm_arm.h"
> > > > > > +#include "migration/blocker.h"
> > > > > > +#include "qapi/error.h"
> > > > > > +#include "qom/object_interfaces.h"
> > > > > > +#include "system/confidential-guest-support.h"
> > > > > > +#include "system/kvm.h"
> > > > > > +#include "system/runstate.h"
> > > > > > +
> > > > > > +#define TYPE_RME_GUEST "rme-guest"
> > > > > > +OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
> > > > > > +
> > > > > > +struct RmeGuest {
> > > > > > +    ConfidentialGuestSupport parent_obj;
> > > > > > +};
> > > > > > +
> > > > > > +OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES(RmeGuest, rme_guest, RME_GUEST,
> > > > > > +                                          CONFIDENTIAL_GUEST_SUPPORT,
> > > > > > +                                          { TYPE_USER_CREATABLE }, { })
> > > > > > +
> > > > > > +static void rme_guest_class_init(ObjectClass *oc, const void *data)
> > > > > > +{
> > > > > > +}
> > > > > > +
> > > > > > +static void rme_guest_init(Object *obj)
> > > > > > +{
> > > > > > +}
> > > > > > +
> > > > > > +static void rme_guest_finalize(Object *obj)
> > > > > > +{
> > > > > > +}
> > > > > > diff --git a/target/arm/meson.build b/target/arm/meson.build
> > > > > > index 0369f96b4cc6..9d322a7aad28 100644
> > > > > > --- a/target/arm/meson.build
> > > > > > +++ b/target/arm/meson.build
> > > > > > @@ -31,7 +31,10 @@ arm_common_user_system_ss.add(when: 'TARGET_AARCH64', if_true: files(
> > > > > >  arm_common_system_ss.add(files(
> > > > > >    'arm-qmp-cmds.c',
> > > > > >  ))
> > > > > > -arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'))
> > > > > > +arm_system_ss.add(when: 'CONFIG_KVM', if_true: files(
> > > > > > +  'hyp_gdbstub.c',
> > > > > > +  'kvm.c',
> > > > > > +  'kvm-rme.c'))
> > > > > >  arm_system_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
> > > > > >  
> > > > > >  arm_user_ss.add(files('cpu.c'))
> > > > > > -- 
> > > > > > 2.43.0
> > > > > > 
> > > > > > 

