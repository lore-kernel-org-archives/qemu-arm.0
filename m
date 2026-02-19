Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7EEE9A03B
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 10:35:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt1ME-000720-Tr; Thu, 19 Feb 2026 05:34:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mbawa@redhat.com>) id 1vt1Ln-0006zv-Dy
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 05:33:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mbawa@redhat.com>) id 1vt1Lj-0005z4-7c
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 05:33:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771497213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GRCVPpgeeHHMPPQFmT5zXeVEj5NtVQ0fYgZWek8b+0Q=;
 b=AWleGMUNBQQhQjeCe6nNJIIlsnaxn1ljGz8yc8I6wOgacM3gKnLKiOg37ts51p1PXgQkbM
 KbYxXDQ/PMQjShxkSRO4mXRtlHirTcP2h9KO8hBaIaGZD6DfFi4X8lDdjXTCvtK+QxAxwr
 aQ5ZAvpC8uRtIyTvG2PJ4g1V2L4QyPc=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-KsIRQidKPdm0684-9io7XQ-1; Thu, 19 Feb 2026 05:33:32 -0500
X-MC-Unique: KsIRQidKPdm0684-9io7XQ-1
X-Mimecast-MFC-AGG-ID: KsIRQidKPdm0684-9io7XQ_1771497211
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-678f3fef828so11999203eaf.1
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 02:33:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771497211; x=1772102011;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GRCVPpgeeHHMPPQFmT5zXeVEj5NtVQ0fYgZWek8b+0Q=;
 b=e/PQsv7eS/UXEUTItLx4Hu45wQBqTw1JO7KXekZrod6EmtGTyW5u/bpTJ+GuXVObfK
 Ki4s2y+t1UR6f4BUgJQR3LL27FgPKrY/HxetSs2vpfkFdHsTIOc+g619JNWJzTKCw+af
 2/K9vdzcJd0f0p04rT5McKxKJdG+jKO5ZCV8CsSZKGMhaDn7RSycr02ArLRK1VL53QfW
 bnS0b0ZZ+nDci+9iPcUNfwhgOyGCM8HZ+H2NchDbHeGh5MM6EHCMRXoQgBvP/1/bBFtD
 Wcntbe7QETATPxdcPCdcefAjv13B2fk5AkaCQSejZiLrz+p051u18pmwokPxUSd/w5yY
 WFMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXrBcKJTVTxdWKx69yX9N10c9DJvx12vijIU1ilPbYy8OC7/YcF0iK6+dJtYxhTasDlZjvQ+VjjA==@nongnu.org
X-Gm-Message-State: AOJu0YxIc1m2beKz68KGn4DloiBKLUe5lpgHFP0O3lXOGyayyjeSbbCD
 33WYIyxJauNNoQ7irLysMnranAUAySJzYL9K9D7xmuajOJBFW7HN/omRT7Xm5+Xvbz7UaB+xl8Y
 mz8pWytZYmL6StHTBCke70IguTx7i0hquFqF5N6PXmVm1EELOMMixcCIOhCKm0Kws+hv1Vc3wXU
 nqgbXBKIG/H9iJAwVGUEPEtTYAzexY
X-Gm-Gg: AZuq6aKPdOMr0vFYS6IsJWIEgIYzEyYs4lRPajC0TNWGDxBA57TGbcRdnDAn12Y0pAR
 WkKDhOQSu+C3F7YvmeIGhRPIc5r1GrfgtLXqIA6Krr3XkjotXyJqIVtuu3evY3rd92UjfildZGc
 MBT7kMDLsQhyyof3CTXGrKQUCbfqY3rjBH/ITkMfrFRcrP9dq3RHHsgEBi65aONCd1RHFUpEmH5
 wBN4XgU
X-Received: by 2002:a05:6820:1795:b0:659:9a49:904d with SMTP id
 006d021491bc7-679a71e01f9mr2829523eaf.24.1771497211415; 
 Thu, 19 Feb 2026 02:33:31 -0800 (PST)
X-Received: by 2002:a05:6820:1795:b0:659:9a49:904d with SMTP id
 006d021491bc7-679a71e01f9mr2829510eaf.24.1771497210947; Thu, 19 Feb 2026
 02:33:30 -0800 (PST)
MIME-Version: 1.0
References: <20260211122759.125094-1-mbawa@redhat.com>
 <CAFEAcA_+eqfTy+7U9igTscue5SMURm3C9yUXvdFTon+ZgSJfAA@mail.gmail.com>
 <CAFEAcA_fR8gQc-f1qhcNb7tD0_EfqfNJEhS_tSg354Rhpb=fQw@mail.gmail.com>
In-Reply-To: <CAFEAcA_fR8gQc-f1qhcNb7tD0_EfqfNJEhS_tSg354Rhpb=fQw@mail.gmail.com>
From: Mohammadfaiz Bawa <mbawa@redhat.com>
Date: Thu, 19 Feb 2026 16:03:15 +0530
X-Gm-Features: AaiRm51d3jCQRdJLBGchRk917SaOMN8Wes2GY1GN2FwGaEDp0LP5cI4DXPxS3f0
Message-ID: <CAJg9KkzORMAeQUiEm6ue9k5yfhw3KTtJkS_Bk=U1roTMsk_CZg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Add virtio-transports property
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org, 
 philmd@linaro.org, cohuck@redhat.com, eric.auger@redhat.com, 
 sebott@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gQZEpIWFTN3P2JURbdb0YB5zdN_xBWlQVWmaz2f5uYQ_1771497211
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mbawa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.043,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Thu, Feb 19, 2026 at 3:43=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Wed, 18 Feb 2026 at 19:01, Peter Maydell <peter.maydell@linaro.org> wr=
ote:
> >
> > On Wed, 11 Feb 2026 at 12:28, Mohammadfaiz Bawa <mbawa@redhat.com> wrot=
e:
> > >
> > > Windows ARM64 guests detect virtio-mmio devices declared in ACPI
> > > tables even when no backend is attached. This causes "Unknown
> > > devices" (ACPI\LNRO0005) to appear in Device Manager.
> > >
> > > Until Windows fixes that by supporting, adding a new machine
> > > property 'virtio-transports' to control the number of
> > > virtio-mmio transports instantiated. The default remains
> > > NUM_VIRTIO_TRANSPORTS (32) for backward compatibility.
> > > Setting it to 0 allows users to disable virtio-mmio entirely.
> > >
> > > Usage: -machine virt,virtio-transports=3D0
> > >
> > > Signed-off-by: Mohammadfaiz Bawa <mbawa@redhat.com>
> >
> > Applied to target-arm.next, thanks -- but please could you check
> > up with the ACPI spec about whether it says anything about what
> > to report for empty transports? If it says we should or if it's
> > just vague we should probably match the x86 microvm behaviour
> > of not showing empty transports, since they can never be
> > hotplugged after startup. (This might need to be tied to
> > a machine-version, not sure.) Maybe we should also not report
> > them in the dtb?
>
> Looking again at this patch, I had a couple of niggles, so
> I've dropped this patch from target-arm.next for the moment.
>
> (1) we need to document the new property in
>     docs/system/arm/virt.rst. Something like

Right, sorry about missing that , I'll add the suggested documentation.

>
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -226,6 +226,11 @@ dtb-randomness
>  dtb-kaslr-seed
>    A deprecated synonym for dtb-randomness.
>
> +virtio-transports
> +  Set the number of virtio-mmio transports to create (between 0 and 32;
> +  the default is 32).  Unused transports are harmless, but you can
> +  use this property to avoid exposing them to the guest if you wish.
> +
>  x-oem-id
>    Set string (up to 6 bytes) to override the default value of field
> OEMID in ACPI
>    table header.
>
> would do.
>
> (2) I think we should call the property virtio-mmio-transports,
> to make it clearer to the user that this is MMIO-specific and
> nothing to do with the much more commonly used PCI virtio.
> What do you think?

Yes, virtio-mmio-transports was my initial pick for the property, but I dro=
pped
it thinking it was too long.But, I think the clarity here is needed.
I'll rename it.

Will send v2 with both changes shortly.

Thanks,
Faiz

>
> thanks
> -- PMM
>


