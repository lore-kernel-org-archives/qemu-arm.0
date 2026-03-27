Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A5F10ED64F
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 10:09:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w647f-0003zz-1u; Fri, 27 Mar 2026 06:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mbawa@redhat.com>) id 1w647c-0003zJ-7o
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 06:08:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mbawa@redhat.com>) id 1w647a-000775-Bs
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 06:08:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1774606133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4sl/ucF0z92wYCfZMh5MMcZ9XqzhtmdFwlz4nBSYCgs=;
 b=hh8Fl9XJz6mFKB6/x4fAZyUTETXRFUe3gg3j208BHhfSko7mmnBgsNVI2AZO6gpLPgaD7Y
 3gzrsNrbjY0ocx3dNjl4h1kmp9BD61BxfmTS7SVwA40x0WbOmL3lJS6KvvW+MWUMsC7wMl
 4Ty7Fio7iKaXzowrnzj6R8UdeHvKkJM=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-Ir_JWOkEOrWLazInaiTxsw-1; Fri, 27 Mar 2026 06:08:49 -0400
X-MC-Unique: Ir_JWOkEOrWLazInaiTxsw-1
X-Mimecast-MFC-AGG-ID: Ir_JWOkEOrWLazInaiTxsw_1774606129
Received: by mail-oo1-f69.google.com with SMTP id
 006d021491bc7-67de56b5bd4so5831284eaf.0
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 03:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774606129; x=1775210929;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4sl/ucF0z92wYCfZMh5MMcZ9XqzhtmdFwlz4nBSYCgs=;
 b=UjK2TAtzzzwYTTibtK4SqvOkxTouZudPj/07ppYIydsq2Q8rBVjN7WxCgDmarZgzcB
 XbZyqgH7mHtIdF87Gg+JVWy2Jnpv/kCH6UB7/ZVnIVax0TuT5ocgdDiNJgTekGm2ekql
 BNH9LeyV9BafvfZKCWcAhYKG5SsBpVggU/zoKuZvrYLvhTZSjbMuwUGTUBi+twyJKitm
 JD8HFSEHgLgueGCxZzJLYZu1DrmgkmHAyrKOC5udK9UvT4bTkC/m19jwH63ka0WPOhmX
 zExBqhVk1oq01vl2rD+5/eJGfK5dbNnyknObMg2O5OuvWiloViFw/AI0NlWu3ongVzsY
 deJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjT0VVQSY6ejv81PkrfflBDaPkFiKMOB3R2v3yTZH0dItWBrEdgJSZ/6qRRAPXR0Rla0ij0P7zrQ==@nongnu.org
X-Gm-Message-State: AOJu0YygFqixXQs+L1GJpjbZlnzufik5A1PRvgARRFiip0lkiRar4TZY
 58+RpauACm+wV4OFJhyql8RTB3Oqs9IizJKuBSTaM5nt6k/YYWFunCfrve4VfbOVrlQyAPDNSK3
 X5/4bBD1SjyLKPhnjqwMCPxbH87+BG1iw2Q61bwU3nVX37eeaulLwisT5PRgVemzqpwTpItBa0M
 M6BPKJtm8+11AmmXLWTqbPfx1XrFBQ
X-Gm-Gg: ATEYQzzxgc6zDTNJLYi/9lHKs0TnYCHShTwCN4uEYkbDDxfzC3z82DD3v1NbfqGy0JF
 jjcgKQohTWjeth8atgPBhi4D+Dz+2uJeT4CyfC5tDbjDu7KNvKK5gJRuYWbWL0FIIiZOXMFC1kH
 N/+RAHpFSLX8cv9JUrRQURpLZOkmlAwsx2uZ6XxrF3caRk8Y2xJ7jYcQTKfcDVvMG/mp5lHsf3k
 b8BULASBScPc/Hf/2Ofmak/F6x7J9C/fhO/Vd0=
X-Received: by 2002:a05:6820:1b19:b0:67e:10a0:8267 with SMTP id
 006d021491bc7-67e1863c3e4mr994119eaf.22.1774606128849; 
 Fri, 27 Mar 2026 03:08:48 -0700 (PDT)
X-Received: by 2002:a05:6820:1b19:b0:67e:10a0:8267 with SMTP id
 006d021491bc7-67e1863c3e4mr994098eaf.22.1774606128430; Fri, 27 Mar 2026
 03:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260324-tpm-tis-sysbus-ppi-v1-0-e59175210954@redhat.com>
 <20260324-tpm-tis-sysbus-ppi-v1-1-e59175210954@redhat.com>
 <c6830a19-c275-4a83-bb17-4430680b3d54@linux.ibm.com>
 <A2BD2FA0-6D5F-47DC-BF2B-017ABE5F31AB@unpredictable.fr>
 <07ff064e-bea4-4beb-811a-f5f3485836d6@linux.ibm.com>
 <CAJg9Kky1q=5DFDPkh-i1hyxCKmpuEnR02hrHN-ncewY2VO0LQA@mail.gmail.com>
 <EAD6E043-B77B-478E-91D6-863B0E185CFC@unpredictable.fr>
In-Reply-To: <EAD6E043-B77B-478E-91D6-863B0E185CFC@unpredictable.fr>
From: Mohammadfaiz Bawa <mbawa@redhat.com>
Date: Fri, 27 Mar 2026 15:38:32 +0530
X-Gm-Features: AQROBzDrLMiyVVPf09jCChXIjpZB8bJHYGMQRB2k0QDCjS1ynthDpgeoOgxA6aE
Message-ID: <CAJg9KkwznOFSzcme_6A44Er7dd6Ae+szWF+Fwh4dw=Hyv3BWVg@mail.gmail.com>
Subject: Re: [PATCH 1/3] docs/specs/tpm: document PPI support on ARM64 virt
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6fI0HaR7jFSHGu4K06XQfMVb1cWFu_1NdcPgLis4gV0_1774606129
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mbawa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, Mar 26, 2026 at 4:59=E2=80=AFPM Mohamed Mediouni
<mohamed@unpredictable.fr> wrote:
>
>
> > On 26. Mar 2026, at 08:27, Mohammadfaiz Bawa <mbawa@redhat.com> wrote:
> >
> > On Thu, Mar 26, 2026 at 2:01=E2=80=AFAM Stefan Berger <stefanb@linux.ib=
m.com> wrote:
> >>
> >>
> >>
> >> On 3/25/26 4:22 PM, Mohamed Mediouni wrote:
> >>>
> >>>> On 25. Mar 2026, at 20:31, Stefan Berger <stefanb@linux.ibm.com> wro=
te:
> >>>>
> >>>>
> >>>> I remember having played around with TPM for QEMU on ARM64 (Raspberr=
y 5(?)) a while ago and had the impression that there was something related=
 to caching that prevented the MMIO interface from working correctly and Pe=
ter may have confirmed this back then on IRC .. I am not sure what exactly =
it was that didn't work correctly when run natively on ARM hardware. It wor=
ked well when run in CPU emulation on x86_64 for example. So I am wondering=
 whether there is a minimum requirement for an ARM CPU or ARM CPU features =
related to caching that someone needs to know about to be able to use TPM T=
IS successfully? If so, it would probably be good to mention it here as wel=
l. If you know.
> >>>>
> >>>> Otherwise this looks good to me.
> >>>
> >>> Hi,
> >>>
> >>> There are two things here:
> >>>
> >>> - For Windows guests it=E2=80=99s a bit complicated
> >>>
> >>> Windows guests LDP accesses on the TPM register range which doesn=E2=
=80=99t match ISV=3D1
> >>
> >> oh, yes, right ldp instruction.
> >>
> >>> syndrome requirements and needs a workaround in current QEMU.
> >>>
> >>> I _think_ the QEMU-side workaround described below went in, which is:
> >>>
> >>> If we map the TPM register range as read directly, trap on write to w=
orkaround
> >>> usage of LDP then we hit...
> >>>
> >>> - FEAT_S2FWB
> >>>
> >>> This is part of Armv8.4 onwards officially* and allows KVM to force a=
 device
> >>> memory type read to be promoted to write-back.
> >>>> That allows the (easiest) workaround for (1) to work.
> >>>
> >>> However that=E2=80=99s not the _only_ workaround, you can remove it a=
nd include
> >>> https://patchew.org/QEMU/20260317174740.31674-1-lucaaamaral@gmail.com=
/ instead.
> >>>
> >>> That works fine and removes reliance on FEAT_S2FWB.
> >>>
> >>> * some older Arm chips implement equivalent semantics without signall=
ing it, but
> >>> that might depend on SoC-level integration.
> >>
> >>
> >> It would be good to mention in the docs what the user needs to know
> >> about CPU requirements, if anything, so that it can actually work. If
> >> these recent modifications/patches make the TIS work on any processor,
> >> then there's nothing to mention...
> >>
> >>>
> >>> Thanks,
> >>> -Mohamed
> >>>
> >
> > Thanks Stefan, Mohamed
> >
> > I wasn't aware of the LDP / S2FWB angle, appreciate the context.
> >
> Hello,
>
> > Looking into it, the FEAT_S2FWB requirement is for TPM TIS MMIO access
> > in general on ARM64 and predates this series.
>
> Yes, it was added as a workaround for baseline Windows support.
>
> > The PPI region we're
> > adding is RAM-backed (memory_region_init_ram_device_ptr), so it
> > shouldn't be affected by that issue.
>
> FEAT_S2FWB is for the case where the guest tries to access as MMIO
> while the memory region is RAM-backed.
>
> From a quick look at the Linux kernel driver it does a
> devm_ioremap_resource which assumes MMIO in drivers/char/tpm/tpm_tis.c
>
> Hence relying (further) on FEAT_S2FWB.
>

that makes sense I was thinking about it from the host side.

> > and for our testing we used an Ampere Altra Max M128-30 (Neoverse N1
> > r3p1, MIDR 0x413fd0c1).
>
> Neoverse N1 systems with the Arm CMN fabric aren=E2=80=99t exactly the ri=
ght
> system to test this. They don=E2=80=99t advertise FEAT_S2FWB but technica=
lly
> have equivalent semantics.
>
> Once the ISV =3D 0 syndrome support patches get in, there=E2=80=99ll be a=
 nicer
> way than relying on undocumented support for those semantics or relying
> on FEAT_S2FWB without querying it, by switching those away from RAM-backe=
d
> to an MMIO trap.
>
> Thanks,
> -Mohamed
>
>

For v2, I see a few options for the docs and wanted to get your take:

-Add a note in the PPI section mentioning the FEAT_S2FWB requirement
for TPM TIS on ARM64
-Add it as a separate general "TPM TIS on ARM64" note since the
requirement predates PPI and applies to the TIS MMIO region as a whole
-Hold off until the ISV=3D0 syndrome support patches land, since they'd
remove the FEAT_S2FWB dependency and make any note we add now outdated

I'm also testing on additional hardware - Marvell ThunderX2 (Armv8.1,
no FEAT_S2FWB) and Nvidia Grace (Neoverse V2, Armv9, has FEAT_S2FWB)
-- to get proper coverage across the spectrum. Happy to report
results.


