Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2054061lfq;
        Mon, 14 Sep 2020 01:03:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJye0uIoUs9/fUy9htKYtMyNyWZxBea4/hOGiL3ulOAUEjUA+AXLWQU7OaOq4EwCiyNy3lHK
X-Received: by 2002:a25:2315:: with SMTP id j21mr18031900ybj.58.1600070624333;
        Mon, 14 Sep 2020 01:03:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600070624; cv=none;
        d=google.com; s=arc-20160816;
        b=JFPnzIXdOZdicyzqgETz2RnKs3AR+Sh48nW9vzCVQXXzjd84Ch7sVY+At5MQlYaBSe
         MAR1gzwXmUECILA2dm1NnZdN0v03CDZGlPwOLLRj8urXofefdYe10LOhAKxolYIswBQJ
         puoXBL9hnr+CbjvHRzwK4dMGKKJe8uWodBExaizTlNiho9zfrsSn+alssUaBpeqSE2e9
         E2Sjbxdy6VZZhgT+onru7Zc95U4HzvdMGKHP7Dh59o33ESGOxfuf5+JG2N/jHNzaYup2
         kWaF8mrvHIzEnXa1aeqpxQ0cZhd06lNky7l2xsnzQ20gozvZ+d8JkJjKRhUbkFpwAbHy
         8tPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=aiDZgeNbyclc5yUuS6lA1n4VxDbGBZGk1YIBfRGsC00=;
        b=yxzosYxpyC9NiewoyUJ7Yf2eOszZ/BRIVyDDrJ5dYEfWuLG30hoJkhTFx+2AAUn6yt
         /dQZHOgXGKyBORSLY5iRJ6yEwbZIcDUg++JylvpiAi5oWEOAI6W7qEYKcs4wTZQ0QKuQ
         JGiyCwTqTZp74/hyq4T5Mrzzj9S5GK4WtYcurQEknTn0yI44A3qWi6nSCBPEICUk+Ccy
         DjhbLKEM5zwmRQ6aWrbO0s4scVVhl5E8mKFS4iaRgkhnvoByW13CudQNSlifJLs6FMFf
         +W3x6OQof5fLBHRB0UxRiwhPipcIcL25aRQnlZKhocPXRtEMGlaxNsFCp/2nSicBnk48
         dyaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Kgj9fCQc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 132si10017103ybd.436.2020.09.14.01.03.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Sep 2020 01:03:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Kgj9fCQc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kHjSh-0006K5-No
	for alex.bennee@linaro.org; Mon, 14 Sep 2020 04:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kHjSa-0006Js-Hi
 for qemu-arm@nongnu.org; Mon, 14 Sep 2020 04:03:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kHjSX-0007fm-Sf
 for qemu-arm@nongnu.org; Mon, 14 Sep 2020 04:03:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600070612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aiDZgeNbyclc5yUuS6lA1n4VxDbGBZGk1YIBfRGsC00=;
 b=Kgj9fCQcsaq54DLDxG/cLEJ00FFGyiFkgI5Q0I/zD2yM9ZTVzcaSyDqZp2KQWlR8Ea1hpE
 m4zzP0CRyuW8UDEa8FGmi5j2gxnqXKERpUsT7GNZhuaZYP/ASZ6DgzOfK65iQWNwzWYQph
 2Pk++13PruYySewVBM82b8jRFdnsZ40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-GgoTZMe2MC2insgCAihLNw-1; Mon, 14 Sep 2020 04:03:30 -0400
X-MC-Unique: GgoTZMe2MC2insgCAihLNw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 057C180F057;
 Mon, 14 Sep 2020 08:03:29 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A4966E70B;
 Mon, 14 Sep 2020 08:03:04 +0000 (UTC)
Date: Mon, 14 Sep 2020 10:02:52 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 2/5] hw/smbios: report error if table size is too large
Message-ID: <20200914100252.25b2fa79@redhat.com>
In-Reply-To: <20200908165438.1008942-3-berrange@redhat.com>
References: <20200908165438.1008942-1-berrange@redhat.com>
 <20200908165438.1008942-3-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 02:10:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.695,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aYqVeHmYuJdd

On Tue,  8 Sep 2020 17:54:35 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> The SMBIOS 2.1 entry point uses a uint16 data type for reporting the
> total length of the tables. If the user passes -smbios configuration to
> QEMU that causes the table size to exceed this limit then various bad
> behaviours result, including
>=20
>  - firmware hangs in an infinite loop
>  - firmware triggers a KVM crash on bad memory access
>  - firmware silently discards user's SMBIOS data replacing it with
>    a generic data set.
>=20
> Limiting the size to 0xffff in QEMU avoids triggering most of these
> problems. There is a remaining bug in SeaBIOS which tries to prepend its
> own data for table 0, and does not check whether there is sufficient
> space before attempting this.
>=20
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>


Reviewed-by: Igor Mammedov <imammedo@redhat.com>

even if we not going to add support for large entries,
this patch is good on it's own, so others won't have to
deal with debugging misconfiguration, and get a clear
error instead.

Michael,
Can you take this patch via your tree?


> ---
>  hw/smbios/smbios.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 8450fad285..3c87be6c91 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -365,6 +365,13 @@ static void smbios_register_config(void)
> =20
>  opts_init(smbios_register_config);
> =20
> +/*
> + * The SMBIOS 2.1 "structure table length" field in the
> + * entry point uses a 16-bit integer, so we're limited
> + * in total table size
> + */
> +#define SMBIOS_21_MAX_TABLES_LEN 0xffff
> +
>  static void smbios_validate_table(MachineState *ms)
>  {
>      uint32_t expect_t4_count =3D smbios_legacy ?
> @@ -375,6 +382,13 @@ static void smbios_validate_table(MachineState *ms)
>                       expect_t4_count, smbios_type4_count);
>          exit(1);
>      }
> +
> +    if (smbios_ep_type =3D=3D SMBIOS_ENTRY_POINT_21 &&
> +        smbios_tables_len > SMBIOS_21_MAX_TABLES_LEN) {
> +        error_report("SMBIOS 2.1 table length %zu exceeds %d",
> +                     smbios_tables_len, SMBIOS_21_MAX_TABLES_LEN);
> +        exit(1);
> +    }
>  }
> =20
> =20

