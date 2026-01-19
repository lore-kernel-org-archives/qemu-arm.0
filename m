Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C18D29C2A
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Jan 2026 13:59:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vhpmD-0000rU-Bj; Mon, 19 Jan 2026 08:58:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vhpmB-0000od-5F
 for qemu-arm@nongnu.org; Mon, 19 Jan 2026 08:58:39 -0500
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vhpm9-0004x3-5l
 for qemu-arm@nongnu.org; Mon, 19 Jan 2026 08:58:38 -0500
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-793fdbb8d3aso3594237b3.3
 for <qemu-arm@nongnu.org>; Mon, 19 Jan 2026 05:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768831116; x=1769435916; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NDLX2BM8G/U+yncKv7tdQvnINQrdgAQxw1e7Em7BkHw=;
 b=tf6DvbNP/67dvGircTgPf/LZL4J37jkcTQTHL/D25NP/kPlCODTQmBGZ8UPUBVX1o8
 aEU2pa3ToKWR5ib3/qRICGJLew6agrEvTJ+rHteQICuEX7VoKejgH6tF+aziSfTDh3+B
 YYdiQ7Y9f864Qh7sXV6K06TAhpT9RZJoStyH8Wdz9iTf2AXz4JugY/lalAEbBihahKqF
 4M13W5vJSNJeBFz13TRVX778eSYusrFnlLairUaFdTsV0YYZ9cyKTR6ef2xzawwyZTwo
 OasSoe+jmm0O3yveMfosehAimAkQPnYcyZPT3aVKsw1or4SPQwYePg/QbJEUtXd+RtVT
 UaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768831116; x=1769435916;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NDLX2BM8G/U+yncKv7tdQvnINQrdgAQxw1e7Em7BkHw=;
 b=GezRwQiBGAQAgQ24ptZ1AReD3Q4hL7iHo225jtPUZrYCEwqaE/l3Zr1uFReBrEF7jw
 Q2bIsBJ/f0BxWmz8Xm+AchjkB4wSvHOjpXAxmugSxtu7ajDvdBuDwxs8K24wTVd1D43K
 F5JVkE/O2YRyqlcrHtrXgJNKCmyHOsalzHmsYytEJmvJ6catNyrJupOUwP29318Lhf0+
 /eNpM+9NSzMtlZ63yo4p5FeDdXNkL7qIZstskuNNr9ujGtBhCouAjgNuWKg3kW8VRzwT
 dl+Rz7pGl/1thtjlSumITyNZHS0QAuZnPWvyi5pTl0NxDDfHR7n0M9lC36BXeMY0HVcX
 0qiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTryKR02ADnjMptv1TZJW3h3/8Hp1AIeZVmC2rmKE10otS2BEUHn6M3H106dUIlFi0TiTonJCMjA==@nongnu.org
X-Gm-Message-State: AOJu0YyPjpYO1HMNsLXOLFCqb0Bi/YXfr6gmm7zk4S956GsPvVWj/PjT
 pEl0Mly8gnGL8M9V9tJIqdUaofJ8+Ivm0zyhm8isAV7C2AFFnNSMnvKDGmExxkAIFQ0cs1pMG0n
 KxPpq/7UfdAVYE8qNq+rwvE/DKuJROkdetd0irM8BdA==
X-Gm-Gg: AZuq6aJCAsvKrEpk04jJ/4+byPPi5/gBWCWC/CyJ/xYCT7IRKZpZGw8nASvUyf42AlH
 YWjDy4ceCH3CQWzEdOcGnshwiMC0IQBp1A3V5Hyeps4oNzoy7z82zVWYQnCvt0y8v/HFZq7Jz1D
 cZ7s7KJse8OErRUUFEGTg9vgGK9brNLVw1f4cXC5W2OKO0Y2YGzs7LQe/I/yiXBCOuUF0dQRr+v
 XoxBPCZjWPAPKZ50HlxNTDpgIFdI7BRBHeeUmd5F+krgP1QugkBr9pVIPSts/z0Zb7ONQ==
X-Received: by 2002:a05:690c:6912:b0:78c:6a6a:123b with SMTP id
 00721157ae682-793c5406a17mr87136407b3.63.1768831115883; Mon, 19 Jan 2026
 05:58:35 -0800 (PST)
MIME-Version: 1.0
References: <20260119120030.2593993-1-alex.bennee@linaro.org>
 <2d379a95-d3ec-4f6b-8b21-188540656019@linaro.org>
 <87o6mpsp3i.fsf@draig.linaro.org>
In-Reply-To: <87o6mpsp3i.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jan 2026 13:58:22 +0000
X-Gm-Features: AZwV_QggNc3OPJ6UvUjKS_Bx_uGL40sL09uzkNSy99RmJNaxKtmkyZRmggzskVA
Message-ID: <CAFEAcA_=B=X+_fM68qhUqPsogw=GNOHdE_jqEEGvQDU-cOzLhA@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/intc: avoid byte swap fiddling in gicv3 its path
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, "open list:ARM cores" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 19 Jan 2026 at 13:34, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>
> > On 19/1/26 13:00, Alex Benn=C3=A9e wrote:
> >> The GIC should always be a little-endian device as big-endian
> >> behaviour is a function of the current CPU configuration not the
> >> system as a whole. This allows us to keep the MSI data in plain host
> >> order rather then potentially truncating with multiple byte swaps of
> >> different sizes.
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> ---
> >>   hw/intc/arm_gicv3_its_common.c | 4 ++--
> >>   hw/intc/arm_gicv3_its_kvm.c    | 2 +-
> >>   2 files changed, 3 insertions(+), 3 deletions(-)
> >> diff --git a/hw/intc/arm_gicv3_its_common.c
> >> b/hw/intc/arm_gicv3_its_common.c
> >> index e946e3fb87b..60a5abd8d3e 100644
> >> --- a/hw/intc/arm_gicv3_its_common.c
> >> +++ b/hw/intc/arm_gicv3_its_common.c
> >> @@ -81,7 +81,7 @@ static MemTxResult gicv3_its_trans_write(void *opaqu=
e, hwaddr offset,
> >>       if (offset =3D=3D 0x0040 && ((size =3D=3D 2) || (size =3D=3D 4))=
) {
> >>           GICv3ITSState *s =3D ARM_GICV3_ITS_COMMON(opaque);
> >>           GICv3ITSCommonClass *c =3D ARM_GICV3_ITS_COMMON_GET_CLASS(s)=
;
> >> -        int ret =3D c->send_msi(s, le64_to_cpu(value), attrs.requeste=
r_id);
> >> +        int ret =3D c->send_msi(s, value, attrs.requester_id);
> >>             if (ret <=3D 0) {
> >>               qemu_log_mask(LOG_GUEST_ERROR,
> >> @@ -97,7 +97,7 @@ static MemTxResult gicv3_its_trans_write(void *opaqu=
e, hwaddr offset,
> >>   static const MemoryRegionOps gicv3_its_trans_ops =3D {
> >>       .read_with_attrs =3D gicv3_its_trans_read,
> >>       .write_with_attrs =3D gicv3_its_trans_write,
> >> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> >> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> >>   };
> >>     void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps
> >> *ops,
> >> diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
> >> index ae12d41eee1..a8d6d4fb540 100644
> >> --- a/hw/intc/arm_gicv3_its_kvm.c
> >> +++ b/hw/intc/arm_gicv3_its_kvm.c
> >> @@ -58,7 +58,7 @@ static int kvm_its_send_msi(GICv3ITSState *s, uint32=
_t value, uint16_t devid)
> >>         msi.address_lo =3D extract64(s->gits_translater_gpa, 0, 32);
> >>       msi.address_hi =3D extract64(s->gits_translater_gpa, 32, 32);
> >> -    msi.data =3D le32_to_cpu(value);
> >> +    msi.data =3D value;
> >>       msi.flags =3D KVM_MSI_VALID_DEVID;
> >>       msi.devid =3D devid;
> >>       memset(msi.pad, 0, sizeof(msi.pad));
> >
> > Could we also clean the other GIC uses in the same patch?
> >
> > $ git grep DEVICE_NATIVE_ENDIAN hw/intc/arm_gic*
> > hw/intc/arm_gic.c:2065:        .endianness =3D DEVICE_NATIVE_ENDIAN,
> > hw/intc/arm_gic.c:2070:        .endianness =3D DEVICE_NATIVE_ENDIAN,
> > hw/intc/arm_gic.c:2077:    .endianness =3D DEVICE_NATIVE_ENDIAN,
> > hw/intc/arm_gic.c:2084:        .endianness =3D DEVICE_NATIVE_ENDIAN,
> > hw/intc/arm_gic.c:2089:        .endianness =3D DEVICE_NATIVE_ENDIAN,
> > hw/intc/arm_gic.c:2096:    .endianness =3D DEVICE_NATIVE_ENDIAN,
> > hw/intc/arm_gicv3.c:420:        .endianness =3D DEVICE_NATIVE_ENDIAN,
> > hw/intc/arm_gicv3.c:429:        .endianness =3D DEVICE_NATIVE_ENDIAN,
> > hw/intc/arm_gicv3_its.c:1909:    .endianness =3D DEVICE_NATIVE_ENDIAN,
> > hw/intc/arm_gicv3_its.c:1919:    .endianness =3D DEVICE_NATIVE_ENDIAN,
> > hw/intc/arm_gicv3_its_common.c:100:    .endianness =3D DEVICE_NATIVE_EN=
DIAN,
>
> I did look to see if we where doing any byte swaps but I forgot to check
> the .endianness fields. I can re-spin.

I think we should separate fixing up MemoryRegionOps
endianness fields (clearly safe no-behaviour-change commit)
from the le32_to_cpu/le64_to_cpu change (probably a bug fix
to be cc'd to stable, needs explanation of what it's doing).

thanks
-- PMM

