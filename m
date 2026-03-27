Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1899210F284B
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 16:06:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w69hM-0007sj-Fe; Fri, 27 Mar 2026 12:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mbawa@redhat.com>) id 1w69hG-0007qb-18
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:06:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mbawa@redhat.com>) id 1w69hC-0007Ry-Ps
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:06:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1774627562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d5BlG7VXayB4NIxCld9UAV+2pWD0xsl1hbPrvmQC20c=;
 b=PDXUHhKUC9OnE84Rf8i/a4wxZ0UHvCmLiZIUF8CBJQUN5u5DJHhHTrij6ruObwQunRj1DV
 Z6S9pY1Ndxga+DTj6Ebe7DtmmII7uM+1Ti4sEtjJpsRi3O2XJdwgcinJdOJ8pngj09b3Y+
 kj4114zzbF80KnZr7X/0BQRFY3i6w+M=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-YLeQ-viVMmOWQjDNkQppYQ-1; Fri, 27 Mar 2026 12:06:00 -0400
X-MC-Unique: YLeQ-viVMmOWQjDNkQppYQ-1
X-Mimecast-MFC-AGG-ID: YLeQ-viVMmOWQjDNkQppYQ_1774627560
Received: by mail-oo1-f71.google.com with SMTP id
 006d021491bc7-67e16691e2dso2694309eaf.3
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 09:06:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774627560; x=1775232360;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=d5BlG7VXayB4NIxCld9UAV+2pWD0xsl1hbPrvmQC20c=;
 b=oGnzN7ih8qqEwtAeO6E5mFr9JUwNWyRkVQi3YUCRIzolYe9WRDE0AYahrY1Sf66n/v
 p2zD6FdhFe4pGu05W8rvTV9VkibC1xmDO/3MwqH7d24BzJWB9n7ibrUwvqOEtZXB01AV
 Xn8LpAFaJYrHaQ05hpvkCJhR2Ce8Ak6eLoDubHi1uNzm3pGDtZILoKPRM/5Pg7jVCq0o
 ZG9hVb16VdIarn+ijhvOisHe9x5KGPnofImgowZES5skpLpEypQsBo502OYOqnB16/lR
 k3aZl5jjjBlwnwMsZNtvK4+/OEv0SYdo1gqzmHCkztg+76UZup+sZo3qbN2IkmeY8WXo
 bLGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+WeJZ4LBT/cUKNzsQCEaZrje3DHu2QSYLzoemQgFqRLa/2mGfVBM1z4nJv8VT5+OfAQfqs5xkCg==@nongnu.org
X-Gm-Message-State: AOJu0YwV2EQnwK1siTTfK0921GdhFtEfZxnmNGfZUBfXaMgEJunX4kCh
 wbxC4borxb8beC5evogNcfVpH2yL8LErgRfs1eTTGZuR+CKntrQXR0VspkdsJXkR3rsxIFVw+X0
 Ig5dju4wFj0JPw2Ks+riVK8pQkFE7un5zlM9n0Khm3hqICSMvm3b0qFd73hUL8Qo2/0KlkcDX5z
 cx3lbykXOPWjMDD2EVuQLQaSp3b6yv
X-Gm-Gg: ATEYQzwkpkgd+sLZGjPvTIM7tRdYFJerlI2PONZVMan+YvXAjxliymIrUrNOQXziM3L
 LiIjtfDXj3hlDug3pfqKLUAtGHC6W4yI1CEqsPFSXMdg0gtGhTksteYl9lLdysLQxGCz9yk3OCN
 BLxvdYCAgz7IgrXVrbMPw55nXL7dJwuCutWRSwV6QZanERbTYWt7Sao4BWpfawuJFvgkDAi6aSB
 s77XxVteWAO7HwnWUttL8lQhgfYr6F6UrKXCLg=
X-Received: by 2002:a05:6820:2290:b0:67e:212:8254 with SMTP id
 006d021491bc7-67e1870131amr1465138eaf.46.1774627559849; 
 Fri, 27 Mar 2026 09:05:59 -0700 (PDT)
X-Received: by 2002:a05:6820:2290:b0:67e:212:8254 with SMTP id
 006d021491bc7-67e1870131amr1465110eaf.46.1774627559427; Fri, 27 Mar 2026
 09:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260327-tpm-tis-sysbus-ppi-v2-0-d8ec84d25dbc@redhat.com>
 <d7f6f5e3-678a-4a63-8031-1af2cfd2c7a2@linux.ibm.com>
In-Reply-To: <d7f6f5e3-678a-4a63-8031-1af2cfd2c7a2@linux.ibm.com>
From: Mohammadfaiz Bawa <mbawa@redhat.com>
Date: Fri, 27 Mar 2026 21:35:42 +0530
X-Gm-Features: AQROBzCJ7aPI5R8wBaxsA1oD7h8LWSIvKZ5ln1LCWmDPfCVVjP5Gux2sgypXn7k
Message-ID: <CAJg9Kky+TJO_gDoYs_+sOGqQ0j7Gw4tWrboAooby3F_sWPYOKA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] hw/tpm: add PPI support to tpm-tis-device on ARM64
 virt
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: qemu-devel@nongnu.org, stefanb@linux.vnet.ibm.com, 
 pierrick.bouvier@linaro.org, "Michael S . Tsirkin" <mst@redhat.com>,
 imammedo@redhat.com, 
 anisinha@redhat.com, peter.maydell@linaro.org, shannon.zhaosl@gmail.com, 
 qemu-arm@nongnu.org, mohamed@unpredictable.fr
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ygDspIb0urg6yFea9rDFsCTBNk8g5vocRqDiMn83chE_1774627560
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mbawa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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

On Fri, Mar 27, 2026 at 9:15=E2=80=AFPM Stefan Berger <stefanb@linux.ibm.co=
m> wrote:
>
>
>
> On 3/27/26 7:48 AM, Mohammadfaiz Bawa wrote:
> > The ARM virt machine's tpm-tis-device lacks Physical Presence Interface
> > (PPI) support - no _DSM, _STA, or PPI operation regions in the ACPI
> > namespace. This causes Windows 11 ARM64 guests to log Event ID 15
> > (tpm.sys) errors per boot.
> >
> > This series documents the change, refactors tpm_build_ppi_acpi() to
> > accept a dynamic PPI base address, then wires up PPI MMIO and ACPI
> > on tpm-tis-sysbus via the platform bus.
> >
> > Tested: aarch64 KVM, upstream QEMU, Win11 ARM64 25H2, swtpm.
> > Event ID 15 eliminated.
> >
> > Changes in v2:
> > - Moved tpm.rst documentation hunk from patch 3 into patch 1 (Stefan)
> > - Added Reviewed-by tags
> >
> > Signed-off-by: Mohammadfaiz Bawa <mbawa@redhat.com>
> > ---
> > Mohammadfaiz Bawa (3):
> >        docs/specs/tpm: document PPI support on ARM64 virt
> >        hw/acpi/tpm: parameterize PPI base address in tpm_build_ppi_acpi
> >        hw/tpm: add PPI support to tpm-tis-device for ARM64 virt
> >
> >   docs/specs/tpm.rst       | 24 ++++++++++++++++++++++++
> >   hw/acpi/tpm.c            |  8 ++++----
> >   hw/arm/virt-acpi-build.c |  9 ++++++++-
> >   hw/tpm/tpm_tis_isa.c     |  2 +-
> >   hw/tpm/tpm_tis_sysbus.c  | 11 +++++++++++
> >   include/hw/acpi/tpm.h    |  3 ++-
> >   6 files changed, 50 insertions(+), 7 deletions(-)
> > ---
> > base-commit: 8e711856d7639cbffa51405f2cc2366e3d9e3a23
> > change-id: 20260324-tpm-tis-sysbus-ppi-ef31a7d71753
>
> Does this branch contain this series here:
>
> https://lore.kernel.org/qemu-devel/20260317120241.16320-1-philmd@linaro.o=
rg/
>
> A patch in this series changed TPMState to not have ppi_enabled anymore:
>
> diff --git a/hw/tpm/tpm_tis.h b/hw/tpm/tpm_tis.h
> index 184632ff66..1531620bf9 100644
> --- a/hw/tpm/tpm_tis.h
> +++ b/hw/tpm/tpm_tis.h
> @@ -75,7 +75,6 @@ typedef struct TPMState {
>
>       size_t be_buffer_size;
>
> -    bool ppi_enabled;
>       TPMPPI ppi;
>   } TPMState;
>

No, my branch doesn't include this series. Looking at it, the only thing
I'd need to adjust is a small change in patch 3, the ppi_enabled
property wiring in
tpm_tis_sysbus.c. The rest should apply cleanly on top.

Happy to rebase and send v3 on top once it's ready, or however
you'd like to handle it.


>
> >
> > Best regards,
>


