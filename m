Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE6A10ED65E
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:27:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65LO-0000Oc-4x; Fri, 27 Mar 2026 07:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mbawa@redhat.com>) id 1w65LI-0008Jv-8v
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:27:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mbawa@redhat.com>) id 1w65LF-0003XZ-Sz
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:27:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1774610824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x26TZNRg43BFa3dggwrpI++2QPL80Q+hZB52X2e3BuU=;
 b=DmP8Ns+br02/647yKDZ9/CdadjjtboOYAvfrJtK5G5hhYPmEre6p9A+not9wNHLj4U7CQE
 3bxMxu5f9lx0nqjcEt8JlilGuE9gdKx21fjIykHHgvMcnO+/ofo1dM6hWpDXP5jdJPUiaZ
 N8nYwp/cfnDbdxfunBfUiVikR9W+n3M=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-jqH0MHWQOlyn45qq_hxOcA-1; Fri, 27 Mar 2026 07:27:03 -0400
X-MC-Unique: jqH0MHWQOlyn45qq_hxOcA-1
X-Mimecast-MFC-AGG-ID: jqH0MHWQOlyn45qq_hxOcA_1774610822
Received: by mail-oo1-f69.google.com with SMTP id
 006d021491bc7-67e1cbc56abso644439eaf.0
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610822; x=1775215622;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=x26TZNRg43BFa3dggwrpI++2QPL80Q+hZB52X2e3BuU=;
 b=NI3m6euyNdVqO1Cvljz3e4mYsrtyQnJT8xEih77R0y4DR7Pqu1b9l3mdlj3oK57cTX
 AnVy349pMJ4ek1mmb15bMIwvzzBtisZsda0oZhZAptZdyHax94rVHdFnabRqwX/cj1ia
 /tboNHGbn74h4Ia+88ppQ1JUOeP548WeNANdT9nNfuuxlmc8SSNVx4u67XWBA/s29+Ew
 B/kmj1/3MeHNA3uo5To3FIBhQOGYzwrRDa2vpjBp2rxDtxR2krUyF34lFHD0YMml5w+7
 nuec77j8ZQ+xf8BjBIAZS/ysLKvnGIKz8q1YDp1TxqvzMk5sVKsEBvBquH5abqlvzEgd
 Vdrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaq82ICIJ8HARt9l9uitKZU3hpkQcLpcBLF+KlbyyknYCk7Hm5DrSyzmFur9VmnTR0cDNtrZ63ZQ==@nongnu.org
X-Gm-Message-State: AOJu0YyRGCVreYizj1JHYs2rJ+GXi9G1zu5DOWJr4PkI0i5AZwaaBeQ9
 BygUGxAD7tDJdiU+GlA5KGiUSlwtKvw0djSeEqHnJQ9ob8MFDerAf0/aCpcT834PCWBtO7UPoKL
 pFrdMw3THNE+pPMjktBvY3C9w/d15rXlNQFo2HB2lz51YTIXGu8oZqCpHaN9IV+2VcvmamRBIbZ
 8dTi/Hu59hs54mjcA7hlrqUgQCTG2i
X-Gm-Gg: ATEYQzwGiw+nVtQcOzfjstMLTAQ9YWoGYLkCS79kFkYOqHnThj44jsiXGiirmW/ga6k
 p1uldjc5QXrKYoPOMPPuBnXr0kdkgyryg8Fk3xwaqp8z5HRrtzcP7hUQNcE9Zq6QpAMDobqes0u
 u3CUwK6DuGZXM5z73aQFkptsYGH91JcoDWydoeBpLass5r0CBWk5BhVAbKj99STV0AG/e++6Wv/
 8EBgDhnqWmnu/PsOQ9ug42RxKzgW+ysfqnaU60=
X-Received: by 2002:a05:6820:c84:b0:67c:f9c:ad29 with SMTP id
 006d021491bc7-67e18708f87mr964102eaf.43.1774610822500; 
 Fri, 27 Mar 2026 04:27:02 -0700 (PDT)
X-Received: by 2002:a05:6820:c84:b0:67c:f9c:ad29 with SMTP id
 006d021491bc7-67e18708f87mr964086eaf.43.1774610822154; Fri, 27 Mar 2026
 04:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260324-tpm-tis-sysbus-ppi-v1-0-e59175210954@redhat.com>
 <20260324-tpm-tis-sysbus-ppi-v1-1-e59175210954@redhat.com>
 <c6830a19-c275-4a83-bb17-4430680b3d54@linux.ibm.com>
 <A2BD2FA0-6D5F-47DC-BF2B-017ABE5F31AB@unpredictable.fr>
 <07ff064e-bea4-4beb-811a-f5f3485836d6@linux.ibm.com>
 <CAJg9Kky1q=5DFDPkh-i1hyxCKmpuEnR02hrHN-ncewY2VO0LQA@mail.gmail.com>
 <EAD6E043-B77B-478E-91D6-863B0E185CFC@unpredictable.fr>
 <CAJg9KkwznOFSzcme_6A44Er7dd6Ae+szWF+Fwh4dw=Hyv3BWVg@mail.gmail.com>
 <CAFEAcA85B5g0xRExvicBZwW=bADBj+dQFFeA3ihg+=bTYJNZCA@mail.gmail.com>
In-Reply-To: <CAFEAcA85B5g0xRExvicBZwW=bADBj+dQFFeA3ihg+=bTYJNZCA@mail.gmail.com>
From: Mohammadfaiz Bawa <mbawa@redhat.com>
Date: Fri, 27 Mar 2026 16:56:46 +0530
X-Gm-Features: AQROBzAiTh9upMXPgQPDsPlYRixn6GrVkTap4MwT60CKSJpWg8Mmr45JpCEZ7RQ
Message-ID: <CAJg9KkxsqQotGX_0n+ne8LMQB9ckBcuEo56fCapVw2cA60JKGw@mail.gmail.com>
Subject: Re: [PATCH 1/3] docs/specs/tpm: document PPI support on ARM64 virt
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
 Stefan Berger <stefanb@linux.ibm.com>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>, 
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cx-Gqx9rET_oPhT0B9QBCOyoPRMqfuJsnM84LMop7BA_1774610822
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

On Fri, Mar 27, 2026 at 3:56=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Fri, 27 Mar 2026 at 10:08, Mohammadfaiz Bawa <mbawa@redhat.com> wrote:
> > For v2, I see a few options for the docs and wanted to get your take:
> >
> > -Add a note in the PPI section mentioning the FEAT_S2FWB requirement
> > for TPM TIS on ARM64
> > -Add it as a separate general "TPM TIS on ARM64" note since the
> > requirement predates PPI and applies to the TIS MMIO region as a whole
> > -Hold off until the ISV=3D0 syndrome support patches land, since they'd
> > remove the FEAT_S2FWB dependency and make any note we add now outdated
>
> We could in theory have QEMU check for whether the host has
> FEAT_S2FWB and actively warn/error about enabling the TPM
> in that setup. But if we're going to land ISV=3D0 emulation soon
> that might not be worth the effort.
>
> -- PMM
>

Thanks, Peter. Agreed
no point adding a runtime check if ISV=3D0 emulation is around the corner.

I went ahead and tested across a few different ARM64 hosts to get a
clearer picture:

*Nvidia Grace (Neoverse V2, Armv9) - Win11 ARM64 installed cleanly, no
Event ID 15. This one has FEAT_S2FWB.
*Ampere Altra Max (Neoverse N1, Armv8.2) - Also works fine. N1 doesn't
advertise FEAT_S2FWB but has equivalent semantics as Mohamed
mentioned.
*Marvell ThunderX2 (CN9980, Armv8.1) - Hangs in TianoCore as soon as
TPM is enabled. Boots fine without TPM. This is Armv8.1 with no
FEAT_S2FWB at all.

So the ThunderX2 result confirms exactly what Mohamed described - TPM
TIS MMIO needs FEAT_S2FWB (or equivalent) on the host. The PPI patches
don't change that requirement.

Will send v2 shortly with the doc hunk move Stefan asked for.

Thanks,
Faiz


