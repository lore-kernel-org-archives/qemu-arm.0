Received: by 10.28.91.67 with SMTP id p64csp4290345wmb;
        Tue, 20 Mar 2018 13:46:42 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsadyjeiiOpSJ4CzYxy4F9eM+JAywof5CVZOyH63Nj8EEylYyEyT8zO+GD1lAJ/qAcR/fjb
X-Received: by 10.200.12.6 with SMTP id k6mr26842717qti.234.1521578802368;
        Tue, 20 Mar 2018 13:46:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521578802; cv=none;
        d=google.com; s=arc-20160816;
        b=cm5ZRe9DODlBWaHzNkW1dbLNc5pqnwsJfmZhNAMXGERq+jZ6W3uZ+B/oEws5BfvHnI
         58PDEqq0Om9mF28XR+Q2yfFnbeNZB+j7L+pTm5hvhjjqInAi5J6vRn+Dpr68nvUBlIsx
         ZzCBnHS2bR0UhGVbsYAqJszaD97jkjmYPnctGFppzUwaM4uav6ADEH2P1/GH0vn4S7NL
         LQJv0x6GsLsiyR8EATBfE2yQjt0vrx/XDD3LDsPrMlXKPzOUfYpq0IjO4bqVhPdelA7q
         DFpuGLZavJXtDly73EG17X6DmFeFmIkr/3sdv6blYcuF+gYLfH6rm95imajjV9p5WOuo
         j4RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=srx7mVgAneSpDGlPvnIyf/fktysv63EDawJ+2E1jPaI=;
        b=vGOtEaiSJX9WnZzSd9Pt7EFaDjV5VNoqgmf8WhbWeCNHPF78a0lBd6vh4g4YbqB+V1
         QXInSchQfWVMITu12lpFyT7k3VWloOITocLvuEwkaUj0b5n8NUWeyXT+ePqclHEdL8nE
         SVORCumwnF4p8e0Pe0vmK9C3BThGgh0yQcTHrlpnPQEUF4e2p685MYdg1NzFcQl2EOqq
         wTT6Z17FUK2q6pZtxZ+71i6tQ0w5rx8etiYat6eo05dMB4HLlxi5MM/sFuWwATUxCAgg
         sF10i047yR8KDxMARHswXY/cnmbFG5Evl5/jZMExQOqr8NXCfFmHCznJciMMBu8BeRTs
         0c9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@codeaurora.org header.s=default header.b=SwvslQIk;
       dkim=neutral (body hash did not verify) header.i=@codeaurora.org header.s=default header.b=SwvslQIk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h23si2848993qta.114.2018.03.20.13.46.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 13:46:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@codeaurora.org header.s=default header.b=SwvslQIk;
       dkim=neutral (body hash did not verify) header.i=@codeaurora.org header.s=default header.b=SwvslQIk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51661 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyO9Z-0005Ke-Qb
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 16:46:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eyO8S-0004R6-G0
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 16:45:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eyO8P-00059u-9w
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 16:45:32 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:50290)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1eyO8O-00059F-VA; Tue, 20 Mar 2018 16:45:29 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id CB3D860246; Tue, 20 Mar 2018 20:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521578726;
	bh=sR+0SVC9eDlwaaTFZHjUvTeVBZ7CIO3VbBLb5F8jBJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SwvslQIk9GnvzgUNCqDkGJPbzhQHBsT5H5XxYyyXnmwq/B4goKARSRG6PRbM/PM2O
	f5YWgUBFzSZfCX0T1QZBpmmuofvcddF/DkMuxmd/tu2NlYgeLuaFSByIfdPW+99XgX
	VF2hsRxkM0vBmHkaby8wNeUFHqAM+3gYtX0F0/Qg=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 1B499607E5;
	Tue, 20 Mar 2018 20:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521578726;
	bh=sR+0SVC9eDlwaaTFZHjUvTeVBZ7CIO3VbBLb5F8jBJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SwvslQIk9GnvzgUNCqDkGJPbzhQHBsT5H5XxYyyXnmwq/B4goKARSRG6PRbM/PM2O
	f5YWgUBFzSZfCX0T1QZBpmmuofvcddF/DkMuxmd/tu2NlYgeLuaFSByIfdPW+99XgX
	VF2hsRxkM0vBmHkaby8wNeUFHqAM+3gYtX0F0/Qg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1B499607E5
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Tue, 20 Mar 2018 16:45:23 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20180320204523.GE24561@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-9-git-send-email-alindsay@codeaurora.org>
	<9c99641e-af00-e229-02a1-7d396b5132d1@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <9c99641e-af00-e229-02a1-7d396b5132d1@amsat.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: Re: [Qemu-arm] [PATCH v3 08/22] target/arm: Support multiple EL
 change hooks
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
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kljDtgfVCenE

On Mar 18 23:41, Philippe Mathieu-Daud=E9 wrote:
> On 03/16/2018 09:31 PM, Aaron Lindsay wrote:
> > Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> > ---
> >  target/arm/cpu.c       | 15 ++++++++++-----
> >  target/arm/cpu.h       | 23 ++++++++++++-----------
> >  target/arm/internals.h |  7 ++++---
> >  3 files changed, 26 insertions(+), 19 deletions(-)
> >=20
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index 072cbbf..5f782bf 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -55,13 +55,16 @@ static bool arm_cpu_has_work(CPUState *cs)
> >           | CPU_INTERRUPT_EXITTB);
> >  }
> > =20
> > -void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHook *hook,
> > +void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hoo=
k,
> >                                   void *opaque)
> >  {
> > -    /* We currently only support registering a single hook function =
*/
> > -    assert(!cpu->el_change_hook);
> > -    cpu->el_change_hook =3D hook;
> > -    cpu->el_change_hook_opaque =3D opaque;
> > +    ARMELChangeHook *entry;
> > +    entry =3D g_malloc0(sizeof (*entry));
>=20
> imho g_malloc() is enough.

It seems like the only difference is between initializing it to zero
(g_malloc0) and making it as uninitialized (g_malloc) for coverity. Are
there coding standards for when we should choose which?

>=20
> > +
> > +    entry->hook =3D hook;
> > +    entry->opaque =3D opaque;
> > +
> > +    QLIST_INSERT_HEAD(&cpu->el_change_hooks, entry, node);
> >  }
> > =20
> >  static void cp_reg_reset(gpointer key, gpointer value, gpointer opaq=
ue)
> > @@ -744,6 +747,8 @@ static void arm_cpu_realizefn(DeviceState *dev, E=
rror **errp)
> >          return;
> >      }
> > =20
> > +    QLIST_INIT(&cpu->el_change_hooks);
> > +
>=20
> You missed to fill arm_cpu_unrealizefn() with:
>=20
>     QLIST_FOREACH(...) {
>         QLIST_REMOVE(...);
>         g_free(...);
>     }

Do you mean arm_cpu_finalizefn()?

-Aaron

--=20
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies=
, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
