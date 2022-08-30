Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp2293271ejh;
        Tue, 30 Aug 2022 04:44:40 -0700 (PDT)
X-Google-Smtp-Source: AA6agR559XVGBXC/LZDL0Y1wKwzKUzt2dOYpPN9+8kQ7swaCzVZ2Yvw/LDOlq7ogd+svCms4qQgC
X-Received: by 2002:a05:620a:2710:b0:6b8:d418:f495 with SMTP id b16-20020a05620a271000b006b8d418f495mr11202239qkp.675.1661859880201;
        Tue, 30 Aug 2022 04:44:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661859880; cv=none;
        d=google.com; s=arc-20160816;
        b=kIILDtgIoWjLGFmOgOrKNsDb3nzEH/A5xCevsTOR/Ilvja1oGBRyf7ZkESLakqjeN4
         WM3ReO6/8cwTRW54TIv6JZxUPEDPSmTPsqOfD2aTOGw0ZEnd3UhJNPtbJtBXPlIcgY3w
         2F497uK77Dta7Ocizgu0/x2FQJ6M/w5J8X5dZLH3CdA+BPBdYQRznx1MVUjpdJK0IaJY
         t32+qyXOxljSJ6xahfO1U7PDGQVS00dppikKJOnhdh/b58t5G+x0S/xULJwlfCWvA5ZN
         6PTG7UAWpqmogM1A/PZvagfYewUx+bMTngzVacMa8E6kufb4GtKtBQBNyQ7bXzw/Lu2l
         zNhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=XKTBtapNYa5ji30vui2o9sdMgeMYZqor8sp2WLq3XkQ=;
        b=mLW4Ds0NPHPiqGnkzgy/ATxlliXjhBNIzMR4CpUg1URbNBLKQEDi9DHJ35B+BrtaTu
         pQmXYH7Ow0y86O1hYL6q96w8EmF9ROMlWhtJgbIWBl7S/SuhF2GEYYkstIOKJnA0YuH3
         4o4EcBXT1qGpOxWzhbOQ6fkR9P1gvHLahDgvvMlwDrLt9UDbWGsFbveGZtJYx3gW3oAS
         mepjihFPkSH7usq0Xyw13ycyVR1WqrPDih0S7lMSx35JNLogMM9BHx7W+qAUc75vJ/rz
         3O4g0mWoQxT2qM5NVOR5K5BkNWwvIKJSo0d5rMwCmpeXlTK+766CkA61EKXah1hlX8Dp
         FHoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J1SmyDPC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cj17-20020a05622a259100b003437ebef89csi5794267qtb.174.2022.08.30.04.44.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Aug 2022 04:44:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J1SmyDPC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oSzfb-0005pd-Gr
	for alex.bennee@linaro.org; Tue, 30 Aug 2022 07:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oSzYv-0003oc-Ge
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 07:37:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oSzYs-00008u-FY
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 07:37:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661859462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XKTBtapNYa5ji30vui2o9sdMgeMYZqor8sp2WLq3XkQ=;
 b=J1SmyDPCutd5qEEM2xmk9m4INi0rFEnleVqmL48bT/1AazjmqqgvmKT2aLBLOUjYsH9haw
 4F5HNNmU9gMDUiHwsZhLdN1mJpU1j3XaX1bKJ4QvPg73PJRiNi0+3gvWbm4rx6Y3m2Z/jO
 wgbjJ1OpB6l1a3OjLTsIpNmyHo8cs44=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440-T1_R3lIdNKmm6QgF6towlw-1; Tue, 30 Aug 2022 07:37:37 -0400
X-MC-Unique: T1_R3lIdNKmm6QgF6towlw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B9F8811E81;
 Tue, 30 Aug 2022 11:37:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CA422026D4C;
 Tue, 30 Aug 2022 11:37:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0A8E921E6900; Tue, 30 Aug 2022 13:37:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?B?5bCP55Sw5Zac6Zm95b2m?= <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Gerd Hoffmann <kraxel@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>,  Dmitry Fleytman
 <dmitry.fleytman@gmail.com>,  Jason Wang <jasowang@redhat.com>,  Stefan
 Weil <sw@weilnetz.de>,  Keith Busch <kbusch@kernel.org>,  Klaus Jensen
 <its@irrelevant.dk>,  Peter Maydell <peter.maydell@linaro.org>,  Andrey
 Smirnov <andrew.smirnov@gmail.com>,  Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,  Alex Williamson
 <alex.williamson@redhat.com>
Subject: Re: [PATCH] pci: Abort if pci_add_capability fails
References: <20220829084417.144739-1-akihiko.odaki@daynix.com>
Date: Tue, 30 Aug 2022 13:37:35 +0200
In-Reply-To: <20220829084417.144739-1-akihiko.odaki@daynix.com>
 (=?utf-8?B?IuWwj+eUsOWWnOmZveW9pg==?=
 "'s message of "Mon, 29 Aug 2022 17:44:17 +0900")
Message-ID: <874jxuhshs.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cpBnsvOXpOpm

Alex, got a question for you below.

=E5=B0=8F=E7=94=B0=E5=96=9C=E9=99=BD=E5=BD=A6 <akihiko.odaki@daynix.com> wr=
ites:

> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>
> pci_add_capability appears most PCI devices. The error handling required
> lots of code, and led to inconsistent behaviors such as:
> - passing error_abort
> - passing error_fatal
> - asserting the returned value
> - propagating the error to the caller
> - skipping the rest of the function
> - just ignoring
>
> pci_add_capability fails if the new capability overlaps with an existing
> one. It happens only if the device implementation is wrong so
> pci_add_capability can just abort instead of returning to the caller in
> the case, fixing inconsistencies and removing extra code.

It already abort()s when passed a zero @offset and there is not enough
config space left.

> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

[...]

> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 2f450f6a72..5831dfc742 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -2513,14 +2513,11 @@ static void pci_del_option_rom(PCIDevice *pdev)
>  }
>=20=20
>  /*
> - * On success, pci_add_capability() returns a positive value
> - * that the offset of the pci capability.
> - * On failure, it sets an error and returns a negative error
> - * code.
> + * pci_add_capability() returns a positive value that the offset of the =
pci
> + * capability.

Suggest "returns the (positive) offset of the PCI capability".

>   */
> -int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
> -                       uint8_t offset, uint8_t size,
> -                       Error **errp)
> +uint8_t pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
> +                           uint8_t offset, uint8_t size)
>  {
>      uint8_t *config;
>      int i, overlapping_cap;
> @@ -2537,13 +2534,12 @@ int pci_add_capability(PCIDevice *pdev, uint8_t c=
ap_id,
       if (!offset) {
           offset =3D pci_find_space(pdev, size);
           /* out of PCI config space is programming error */
           assert(offset);
       } else {
           /* Verify that capabilities don't overlap.  Note: device assignm=
ent
            * depends on this check to verify that the device is not broken.
            * Should never trigger for emulated devices, but it's helpful
            * for debugging these. */

The comment makes me suspect that device assignment of a broken device
could trigger the error.  It goes back to

commit c9abe111209abca1b910e35c6ca9888aced5f183
Author: Jan Kiszka <jan.kiszka@siemens.com>
Date:   Wed Aug 24 14:29:30 2011 +0200

    pci: Error on PCI capability collisions
=20=20=20=20
    Nothing good can happen when we overlap capabilities. This may happen
    when plugging in assigned devices or when devices models contain bugs.
    Detect the overlap and report it.
=20=20=20=20
    Based on qemu-kvm commit by Alex Williamson.
=20=20=20=20
    Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
    Acked-by: Don Dutile <ddutile@redhat.com>
    Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

If this is still correct, then your patch is a regression: QEMU is no
longer able to gracefully handle assignment of a broken device.  Does
this matter?  Alex, maybe?

Even if we must avoid this regression, you still make a compelling
argument for *virtual* devices, where pci_add_capability() failure is
always a programming error.  Simplest solution: change them all to pass
&error_abort.

Alternatively, add a wrapper that does, then call that.  Not sure that's
worth the bother.

>          for (i =3D offset; i < offset + size; i++) {
>              overlapping_cap =3D pci_find_capability_at_offset(pdev, i);
>              if (overlapping_cap) {
> -                error_setg(errp, "%s:%02x:%02x.%x "
> +                error_setg(&error_abort, "%s:%02x:%02x.%x "
>                             "Attempt to add PCI capability %x at offset "
>                             "%x overlaps existing capability %x at offset=
 %x",
>                             pci_root_bus_path(pdev), pci_dev_bus_num(pdev=
),
>                             PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn),
>                             cap_id, offset, overlapping_cap, i);

error.h advises:

 * Please don't error_setg(&error_fatal, ...), use error_report() and
 * exit(), because that's more obvious.
 * Likewise, don't error_setg(&error_abort, ...), use assert().

Thus

               assert(!overlapping_cap);

or even

               assert(!pci_find_capability_at_offset(pdev, i);

> -                return -EINVAL;
>              }
>          }
>      }

[...]

