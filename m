Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1598492njc;
        Tue, 10 Jun 2025 09:08:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXs33SoWQXJj0M9Bw1PZLgoCRptrP7NzJSKSPn5KChdiz682JlM1wAX9k8aCBuvFZgKKPhl5+hAbJS31g==@linaro.org
X-Google-Smtp-Source: AGHT+IFi39CLtkgk9G5cwR8YzeabLUND9JRU4H8vqBthQ9aDlyIOj42rwDKt2ISaMnzxThZP4wP/
X-Received: by 2002:a05:6902:1681:b0:e7d:c8eb:92f4 with SMTP id 3f1490d57ef6-e81fd96639cmr290664276.22.1749571694685;
        Tue, 10 Jun 2025 09:08:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749571694; cv=none;
        d=google.com; s=arc-20240605;
        b=XBZTGad3X0nzya+fqNRt4ZCxC/P9FAoh53l3HU76an7PlTYLLmbpsYQ2PirV77sYR1
         9zVuOSp7fnS8V61jVZ9jtzOybd+i1QeF34X4WsiJveaQtseYVOv+zGy21fy1gStQYA24
         DkXAGA3y/tSnCTbKzOjSecDOI17/M33w8OOf4x0H6moRkkp7BAcBS+EG4NOIqNj/uHkk
         nXNqpbfsJTv3Py/Vru/5p4FG8XwBzKuxsqqL72M7oxAdQ8XfasvQGbRqZETA1pT2uzH9
         f82cjrCZv+vO0758zw08oz/HyxVck2DP+Rtbki56gJ32iiGk2n8v5Koa2bZ7rGbtJCoB
         M50A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :cc:to:from:date:dkim-signature;
        bh=Dp64+H62dto2vYWHN2pdtS9nRn/63AVOPtYCyVP++rg=;
        fh=TU9UUNLbojTYXqTaRyuKz127Ek8qoJcYV16ENImoJoM=;
        b=KGDNyr2kT5/2WsgkycsYjg+lXaIDDAjV8YtUXPPUv6T18HikGD8YMU3HYriDHxpn8S
         WK8YH0edhxGAtGjOn4aL9Cyyu72rmF/dyye2XHFTq78kZzSeN6z0s/N+pFRy4UwW4qN0
         aKXZFY1Uu4ywWyaM+WMnFcrArv31MIJifIvgdBxWK4LBEeehVeccLFmvI3FAvJWlK2vL
         rmX/KyVnf5CBIZZm3pBY5wyYsy+A1cVE2oiKhUUVOV4M/GOt1uMxTlV+3KRKvADSXl9p
         ai4IZiCNuH2meLPN2Cc0XIpBgRxwsiEqP/Rdnc2LbdaAfGCp0DXmdpZjgpf6fT1frncX
         jSvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Apq7XWXO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-53113bf0bc5si745434e0c.98.2025.06.10.09.08.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Jun 2025 09:08:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Apq7XWXO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uP1WA-0002ik-BP; Tue, 10 Jun 2025 12:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1uP1PH-0005Ti-JJ
 for qemu-arm@nongnu.org; Tue, 10 Jun 2025 12:01:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1uP1PD-0000DX-1u
 for qemu-arm@nongnu.org; Tue, 10 Jun 2025 12:00:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749571251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dp64+H62dto2vYWHN2pdtS9nRn/63AVOPtYCyVP++rg=;
 b=Apq7XWXO07ylwc6h+0+86EPlemLpufyAspTvZA29x5BZjzSc2pO6eIpD7UgWXrZYQogJ1Q
 jilkF8D7R1N3FNTLILxbsHI7+gozHmPHKswzwcSoSGL9BuvvCYj4g3cZtagz56AWxkKQtW
 FbJU88EwlQg4iBH24eEDZBExZXnOeMw=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-303-zf0rrAJoMlC2F4aKzmjvig-1; Tue, 10 Jun 2025 12:00:50 -0400
X-MC-Unique: zf0rrAJoMlC2F4aKzmjvig-1
X-Mimecast-MFC-AGG-ID: zf0rrAJoMlC2F4aKzmjvig_1749571249
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3dde762b351so3799285ab.3
 for <qemu-arm@nongnu.org>; Tue, 10 Jun 2025 09:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749571249; x=1750176049;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Dp64+H62dto2vYWHN2pdtS9nRn/63AVOPtYCyVP++rg=;
 b=RUsP860RkLCXmMi5EZ6q/bKD6o5nquczEpNhNYvUZHGL8y+xgGWyVLk0fmdZpcFX2C
 vW48DPkuI/C1Pt2m1laYC7xamDAyw1Sa61PZiNtdSjbCr35Y3yQWjLO6NfbjhXzlAIQU
 h7Z+U1+zjOnFfb1HFMTPzlHU8d76oLETxXpgt2aCey0EPdmFJQQXDcxWCddxeK71pA0d
 1aCznjiXDTdaOBaPbkRQ+GYl8Pc44TFGFdp7R0UEBlEhSVn81LtvPNStoQFLBjnPITeB
 E/tCpVD/EnFKqTdC68VGJ1CVvEKCVLDh5n+u8mSvr0EVPcyoYkEami+ABNrJquOWktGC
 UawQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWO16tG/W65jHx1gPyrffjsB1KL3Com0eyZsmfriUDB2+DTr3ldkgMl5aqaT/+qM60ZySiovr6y6A==@nongnu.org
X-Gm-Message-State: AOJu0Yydnp3siXQd2M1r3zjjfhbfs0EJeRT4l32ze6hIVQDr5ZkDJ0H0
 mFhsPq39qy7+4KU+o4RNMztj3jXGtYEGze0Vu/MKVR0loCwgSpJPmBIZWR6szD7dt9moVslfD78
 71WzT2pYcwDdGwBCxTAg/8CqqHVsBnUh7R9+cUaY42DyALdJKsk4lZQ==
X-Gm-Gg: ASbGncsA7x4Vxn59slBQDQ1kD7/EVYFHsSucP7F9G4cEcArr2hVHqRybKmEuT1U7oPO
 f2J/OxVnoJRE/ptrhCkYuTe0DfESxI9zccacKOv+QSIBzVEMZMXT4ZkPyJE1U5OA4p2Fl+THbgy
 3KqyDKJ0WP9g84nn+eGtCS2witpCXl+HDTEKarNcbeV+JS3piqQClTTMkPsBolf7v1pDdR29xWe
 LTReW0Jcaiep03jludajvv6yRbhBShe/bfKVstDLEU3J9aY7odePKrCw07KLtyzT/AzJ47e2/JW
 cPaP3fGXBPsSd4/JqX+GS2xOIA==
X-Received: by 2002:a05:6e02:b48:b0:3dc:7c9e:c3d6 with SMTP id
 e9e14a558f8ab-3ddcfd32d99mr43155725ab.5.1749571249264; 
 Tue, 10 Jun 2025 09:00:49 -0700 (PDT)
X-Received: by 2002:a05:6e02:b48:b0:3dc:7c9e:c3d6 with SMTP id
 e9e14a558f8ab-3ddcfd32d99mr43155245ab.5.1749571248051; 
 Tue, 10 Jun 2025 09:00:48 -0700 (PDT)
Received: from redhat.com ([38.15.36.11]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-500df3f606asm2397415173.24.2025.06.10.09.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 09:00:47 -0700 (PDT)
Date: Tue, 10 Jun 2025 10:00:46 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Shaoqin Huang <shahuang@redhat.com>
Cc: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>, "Daniel P.
 =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, qemu-arm@nongnu.org, Eric
 Auger <eauger@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Gerd
 Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2] ramfb: Add property to control if load the romfile
Message-ID: <20250610100046.3577ee29.alex.williamson@redhat.com>
In-Reply-To: <c2e0ece0-1ee1-4867-b01c-20e847ef6af3@redhat.com>
References: <20250606070234.2063451-1-shahuang@redhat.com>
 <aEKeNSc8mAZ8vhGj@redhat.com>
 <cf34f5b2-d422-453f-85d4-15938ae59e9f@redhat.com>
 <c373ee81-d094-4b40-93c9-5ece6e24e520@redhat.com>
 <c2e0ece0-1ee1-4867-b01c-20e847ef6af3@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dBeQScv4VA19MWlksTj0pzBZw1AdTp4WUfVJyK6pAk0_1749571249
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sHmvK6RfswQJ

On Mon, 9 Jun 2025 13:16:14 +0800
Shaoqin Huang <shahuang@redhat.com> wrote:

> On 6/6/25 4:07 PM, C=C3=A9dric Le Goater wrote:
> > On 6/6/25 10:06, C=C3=A9dric Le Goater wrote: =20
> >> On 6/6/25 09:52, Daniel P. Berrang=C3=A9 wrote: =20
> >>> On Fri, Jun 06, 2025 at 03:02:34AM -0400, Shaoqin Huang wrote: =20
> >>>> Now the ramfb will load the vgabios-ramfb.bin unconditionally, but o=
nly
> >>>> the x86 need the vgabios-ramfb.bin, this can cause that when use the
> >>>> release package on arm64 it can't find the vgabios-ramfb.bin.
> >>>>
> >>>> Because only seabios will use the vgabios-ramfb.bin, load the rom lo=
gic
> >>>> is x86-specific. For other !x86 platforms, the edk2 ships an EFI dri=
ver
> >>>> for ramfb, so they don't need to load the romfile.
> >>>>
> >>>> So add a new property use_legacy_x86_rom in both ramfb and vfio_pci
> >>>> device, because the vfio display also use the ramfb_setup() to load
> >>>> the vgabios-ramfb.bin file.
> >>>>
> >>>> After have this property, the machine type can set the compatibility=
 to
> >>>> not load the vgabios-ramfb.bin if the arch doesn't need it. =20
> >>>
> >>> Can you make this a series, with an additional patch that updates the
> >>> current in-dev machine types to use this new property, so we're clear
> >>> about the proposed usage. =20
> >>
> >> yes. And please change the vfio-pci property name to use underscores. =
=20
> >=20
> > Sorry, to *not* use underscores : use-legacy-x86-rom =20
>=20
> Thanks for pointing out it. Will fix it.

It's also not evident from the property that this is restricted to
ramfb behavior.  Should the option on the vfio-pci device be prefixed
with ramfb?  Thanks,

Alex

