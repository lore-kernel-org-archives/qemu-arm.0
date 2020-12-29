Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp11077040lfq;
        Tue, 29 Dec 2020 05:20:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybq+iT6JUKYnY97uRG9apd+MlV8eAy63lka1D661OIOaBZpjqmtEbWCZBfSGhkhc4BQ1iq
X-Received: by 2002:a25:880a:: with SMTP id c10mr13383709ybl.456.1609248030127;
        Tue, 29 Dec 2020 05:20:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609248030; cv=none;
        d=google.com; s=arc-20160816;
        b=0khs3pWv0N+VeMuMAprINGb+1uGWHyHt6U9Spz447W++YlHDAaceICaTqYmx0kUxUp
         RGNsgYT+/bAfmsiLnSpxn1QaMUkRSk2XIc0nOSEtFzdZMsXAQ74GgY56JJI41A7osTJ1
         oA1/NyMXLz2Pn3Dz3lG1yZOtxlJ+ZM0/CdyXTY+a/EfmAhRHsF3uNyD7SRtGe+PzbUdK
         Hea+DQHNrnXyERMqA+6ekd8GKt9eh2nvTkadP5sAj9p/4Iv1vy8bWQhtFMsmDoHPKuie
         wRSjfz51fuQRuFQ2h3trfx1m91+TTFjvpDpM5TKODP6rFQl6THVBBD2jUQ86EYvHFu+v
         sR+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=Xc2QnPvaMIA4l+6Smu7mnjddpYRMr/RirnZalYyGHfQ=;
        b=hF83KAduUZVbdz3HsYQTFvKL0Yo1HnzhtPW7StX66t66y4epNaR7BR2GCWVzuCVq+F
         WMFlMdrjM3p9lk/5MWTIWNCnO+Y97Gy7ZFiVG5sLx8HvVGHw9NnNP6aW8FLY/3UOH/5D
         cg7/jfkTWv0PokJS1+eILTC2Cy9/WLFFoeL2VjHwpTgM+j7j22dsZThbBe/UGKB95+3Q
         VEpcFczCZzF3m3Ysjg8dix2JWzyeQFpjbyVwyM8w6iPfl78uqWFx/8ST14YFQFD8Iw8b
         99pqQsIWGt0RUM4ZrmBgzpCVNh2HaN08vWxNTn0M7hFvLwIjMgwr6QtHVDGzDL/Tp0ft
         lUQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=i5CMbEmg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9si22984531ybj.237.2020.12.29.05.20.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Dec 2020 05:20:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=i5CMbEmg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kuEvN-0005ol-Gk
	for alex.bennee@linaro.org; Tue, 29 Dec 2020 08:20:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kuEvE-0005oc-VN
 for qemu-arm@nongnu.org; Tue, 29 Dec 2020 08:20:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kuEvB-0000ym-Fx
 for qemu-arm@nongnu.org; Tue, 29 Dec 2020 08:20:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609248016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xc2QnPvaMIA4l+6Smu7mnjddpYRMr/RirnZalYyGHfQ=;
 b=i5CMbEmgh17N7fWl3uuEwc1o7as5SDf9V9NN4YwtZeNAuZ2wJQE0l0dCo6LU7HZP3Gluq9
 tun7in1iXxFZNZWiyA+To+Qjb2SvLRozhZ/cU/NS4gfi9kGG8T2Eh2GYu9onW1120oBxvQ
 w/3xoTo3qAEpbQYA/An55NiiDgcbEMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-RxoaunwjMEq4voijxgo4Bw-1; Tue, 29 Dec 2020 08:20:14 -0500
X-MC-Unique: RxoaunwjMEq4voijxgo4Bw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B26E2879500;
 Tue, 29 Dec 2020 13:20:12 +0000 (UTC)
Received: from localhost (unknown [10.40.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5AA16B8DA;
 Tue, 29 Dec 2020 13:20:03 +0000 (UTC)
Date: Tue, 29 Dec 2020 14:20:01 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v2 0/3] pc: Support configuration of SMBIOS entry point
 type
Message-ID: <20201229142001.3b28fdf2@redhat.com>
In-Reply-To: <20201214205029.2991222-1-ehabkost@redhat.com>
References: <20201214205029.2991222-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, "Daniel
 P. Berrange" <berrange@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6x3W56IhicNf

On Mon, 14 Dec 2020 15:50:26 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> This includes code previously submitted[1] by Daniel P. Berrang=C3=A9
> to add a "smbios-ep" machine property on PC.
>=20
> SMBIOS 3.0 is necessary to support more than ~720 VCPUs, as a
> large number of VCPUs can easily hit the table size limit of
> SMBIOS 2.1 entry points.

Eduardo,
do you plan to submit Seabios patches for SMBIOS 3.0?
will OVMF pick up new tables automatically?

>=20
> [1] https://lore.kernel.org/qemu-devel/20200908165438.1008942-5-berrange@=
redhat.com
>     https://lore.kernel.org/qemu-devel/20200908165438.1008942-6-berrange@=
redhat.com
>=20
> Daniel P. Berrang=C3=A9 (1):
>   hw/i386: expose a "smbios-ep" PC machine property
>=20
> Eduardo Habkost (2):
>   smbios: Rename SMBIOS_ENTRY_POINT_* enums
>   hw/smbios: Use qapi for SmbiosEntryPointType
>=20
>  qapi/qapi-schema.json        |  1 +
>  qapi/smbios.json             | 11 +++++++++++
>  include/hw/firmware/smbios.h | 10 ++--------
>  include/hw/i386/pc.h         |  3 +++
>  hw/arm/virt.c                |  2 +-
>  hw/i386/pc.c                 | 26 ++++++++++++++++++++++++++
>  hw/i386/pc_piix.c            |  2 +-
>  hw/i386/pc_q35.c             |  2 +-
>  hw/smbios/smbios.c           |  8 ++++----
>  qapi/meson.build             |  1 +
>  10 files changed, 51 insertions(+), 15 deletions(-)
>  create mode 100644 qapi/smbios.json
>=20

