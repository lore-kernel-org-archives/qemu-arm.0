Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CD2109C047
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Mar 2026 07:28:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w5f8Y-0006Yo-Oa; Thu, 26 Mar 2026 03:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mbawa@redhat.com>) id 1w5f8X-0006YX-U9
 for qemu-arm@nongnu.org; Thu, 26 Mar 2026 03:28:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mbawa@redhat.com>) id 1w5f8W-0005CN-7J
 for qemu-arm@nongnu.org; Thu, 26 Mar 2026 03:28:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1774510088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=skfkRrlJIzl/sVe+1N8j0cWXw5Ey1N8CqF/FoAstlRc=;
 b=gXin9px3LBbMh3bxpl4webnvyz9ypcI3FyMnbgVWok14ruZpxT5jUZ3TuvS5SeHqIkzO/Y
 OZBN1EFLDGdcgxDYPre7iOBlR2qpTjwMVvWJ/FSivjM1clp/KJjSMNkf1DjpMi+XwUhxGl
 Y8AIeJoyA7neoNQynBw/HqX+PINaJaQ=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-bf_UvI7UO8-hKCoWfYgoqg-1; Thu, 26 Mar 2026 03:28:06 -0400
X-MC-Unique: bf_UvI7UO8-hKCoWfYgoqg-1
X-Mimecast-MFC-AGG-ID: bf_UvI7UO8-hKCoWfYgoqg_1774510086
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-7d7e0787438so781040a34.2
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2026 00:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774510086; x=1775114886;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=skfkRrlJIzl/sVe+1N8j0cWXw5Ey1N8CqF/FoAstlRc=;
 b=N5Ci8cqL8PZR28s7C8XsELpoyj9YkX8nPcbzDzIfd1yj3xRLPeq7pUKHR/cwDgA+lr
 d+0wQkBVE9nH6RMkVUWi00RLW6BIPVA2/IL34i4xSuVZScFkv1FPC/inD5850r136WIU
 lbP2m7Xst2hxrU7Fx2vFFxMdLdwDleQLwiMiBH0u2f//e/cOth9PpzrqkEZVAGrmjm62
 /Sk8mFbvVKnY+v4N3OGuZZ5pjdA6bpEQz9ExPvz5gc7AtUxYRMZPhKYlxqbnT6ikLDVF
 zzeQA+cxvLfQfLAOlld3XSNBTemiFLbB3JgBFRc1PMRYm6KQeXegvGjHSsK7z5lbvQ+H
 DL2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5O3E6lZJDxDOT2wFtTF7fBxwkYeOx5Rfjsdx9kBcX0bwG/fZAvmxtIibt3z2fpxS8gKpuZ8FnjQ==@nongnu.org
X-Gm-Message-State: AOJu0YwtbMo1XfGRfVgzi71sGhaz3nKUGgBA5YEABFI7bO3jId4u0rky
 S6XHm2/Oxf1DQsrY3ymixomQWsa/Z397CZL174kTmtNaQSc8VennawQ+lVM4ljEytrS0b0klr83
 jlQ39WK94LDHix4n64gO9Hz5KIFzo9iOL2f1GWogxDEfmCfGIJch4G9TDz/5NNVM5g6OCMmvdAs
 +8h3CEWxSWHoQh7hgTK3wVeot9gKUa
X-Gm-Gg: ATEYQzxT0XTHz0S/1K7jPSphXIPQhvL4PJHDnsf6PP4jVjq+N6JSce0RmpneF3W1swK
 bjn+nFoHxV57fnH4G/zJohMC+4v7Sd+aensE07LoNkAm3Oi6AAeZ6xvEcPXvCxDTWvlhGZJuwSl
 6vWCNWi4nSuyfkH/atu0ipJJ38myKx8AY8Yh8IfcgxuWSK6dHZXVepVOJS6T2YoyMyI4GzUVp1l
 xrhR0ZP6a8Zhf5LT34javy9wwZ//9OiDgM19nU=
X-Received: by 2002:a05:6820:16a4:b0:67d:2cb:207a with SMTP id
 006d021491bc7-67dff5701c6mr3252392eaf.55.1774510085676; 
 Thu, 26 Mar 2026 00:28:05 -0700 (PDT)
X-Received: by 2002:a05:6820:16a4:b0:67d:2cb:207a with SMTP id
 006d021491bc7-67dff5701c6mr3252380eaf.55.1774510085219; Thu, 26 Mar 2026
 00:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260324-tpm-tis-sysbus-ppi-v1-0-e59175210954@redhat.com>
 <20260324-tpm-tis-sysbus-ppi-v1-1-e59175210954@redhat.com>
 <c6830a19-c275-4a83-bb17-4430680b3d54@linux.ibm.com>
 <A2BD2FA0-6D5F-47DC-BF2B-017ABE5F31AB@unpredictable.fr>
 <07ff064e-bea4-4beb-811a-f5f3485836d6@linux.ibm.com>
In-Reply-To: <07ff064e-bea4-4beb-811a-f5f3485836d6@linux.ibm.com>
From: Mohammadfaiz Bawa <mbawa@redhat.com>
Date: Thu, 26 Mar 2026 12:57:48 +0530
X-Gm-Features: AQROBzByYSjBQi1uP80mfH_YCddiU-SfdoGBt0CPDqgyTHCes9HpLFg4hc9MXuk
Message-ID: <CAJg9Kky1q=5DFDPkh-i1hyxCKmpuEnR02hrHN-ncewY2VO0LQA@mail.gmail.com>
Subject: Re: [PATCH 1/3] docs/specs/tpm: document PPI support on ARM64 virt
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 064rmgw0zw0Y_MUtCYoZCWLgIFw6Q02bJMrDpOy63Y4_1774510086
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Mar 26, 2026 at 2:01=E2=80=AFAM Stefan Berger <stefanb@linux.ibm.co=
m> wrote:
>
>
>
> On 3/25/26 4:22 PM, Mohamed Mediouni wrote:
> >
> >> On 25. Mar 2026, at 20:31, Stefan Berger <stefanb@linux.ibm.com> wrote=
:
> >>
> >>
> >> I remember having played around with TPM for QEMU on ARM64 (Raspberry =
5(?)) a while ago and had the impression that there was something related t=
o caching that prevented the MMIO interface from working correctly and Pete=
r may have confirmed this back then on IRC .. I am not sure what exactly it=
 was that didn't work correctly when run natively on ARM hardware. It worke=
d well when run in CPU emulation on x86_64 for example. So I am wondering w=
hether there is a minimum requirement for an ARM CPU or ARM CPU features re=
lated to caching that someone needs to know about to be able to use TPM TIS=
 successfully? If so, it would probably be good to mention it here as well.=
 If you know.
> >>
> >> Otherwise this looks good to me.
> >
> > Hi,
> >
> > There are two things here:
> >
> > - For Windows guests it=E2=80=99s a bit complicated
> >
> > Windows guests LDP accesses on the TPM register range which doesn=E2=80=
=99t match ISV=3D1
>
> oh, yes, right ldp instruction.
>
> > syndrome requirements and needs a workaround in current QEMU.
> >
> > I _think_ the QEMU-side workaround described below went in, which is:
> >
> > If we map the TPM register range as read directly, trap on write to wor=
karound
> > usage of LDP then we hit...
> >
> > - FEAT_S2FWB
> >
> > This is part of Armv8.4 onwards officially* and allows KVM to force a d=
evice
> > memory type read to be promoted to write-back.
>  > > That allows the (easiest) workaround for (1) to work.
> >
> > However that=E2=80=99s not the _only_ workaround, you can remove it and=
 include
> > https://patchew.org/QEMU/20260317174740.31674-1-lucaaamaral@gmail.com/ =
instead.
> >
> > That works fine and removes reliance on FEAT_S2FWB.
> >
> > * some older Arm chips implement equivalent semantics without signallin=
g it, but
> > that might depend on SoC-level integration.
>
>
> It would be good to mention in the docs what the user needs to know
> about CPU requirements, if anything, so that it can actually work. If
> these recent modifications/patches make the TIS work on any processor,
> then there's nothing to mention...
>
> >
> > Thanks,
> > -Mohamed
> >

Thanks Stefan, Mohamed

I wasn't aware of the LDP / S2FWB angle, appreciate the context.

Looking into it, the FEAT_S2FWB requirement is for TPM TIS MMIO access
in general on ARM64 and predates this series. The PPI region we're
adding is RAM-backed (memory_region_init_ram_device_ptr), so it
shouldn't be affected by that issue.
and for our testing we used an Ampere Altra Max M128-30 (Neoverse N1
r3p1, MIDR 0x413fd0c1). TPM TIS works correctly with Windows 11 ARM64
guests with this fix.

Regards,
Faiz


