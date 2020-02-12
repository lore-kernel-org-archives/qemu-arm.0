Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5999195lfp;
        Tue, 11 Feb 2020 22:33:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqyRxYu7Fkn/YCv+inYbnpk0EgeUIHvXojEpffZjIwn+h6X4iRg2bwM6lkbSvzJ7IbhqnnMo
X-Received: by 2002:ac8:1ae5:: with SMTP id h34mr1861585qtk.323.1581489216814;
        Tue, 11 Feb 2020 22:33:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581489216; cv=none;
        d=google.com; s=arc-20160816;
        b=SiH7SB7tEzDVElZ1RTcRba/n9FJo4SzTrElcf9OsVR6GnluaI29xAi+ta0UF0j4TTI
         TaQhJFnCxx8BptpmiHRyEHxUXPoBb6NlyGDn5CRifJu97faPgldPgtyo+E3h5h/Z8Xwz
         gblhe2Orw3KBi6TH9u6Wb4FG6HJ7mGnIKx905G3selEYmFtWoQqSjYswftRhJ7AHP0nF
         5DMeC2iDor8ZrA3GaehUJ4cstgpXPeux4g5uE9/SP5XvQ6XzZJBIqULZZMBID0iWxcdM
         QpI1Q/ASWOSBheeeIKg2MoOaxWPEeEk9y1HhFps3UrS7T3kqcKpCT2usC5waeNj/1g3F
         FS+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=xiaSrhNJ3DDevNHnbuwF56IB49ZF1yXJIt6WnQQuxMo=;
        b=jF4jPiwyDHd5i7weDLkG0NBZw+ReBdsUgeY1FfVzBttUDUXi67DbeaLWngqQGRKoc4
         wcwkWxqtT2+LeTkmdQVYUU9g2SU8Z7Mk+TEhVzrFTzVILxgO8dz6C9lhmqdtPiAvHK1y
         909IQMBkcA+yc916kXbV7YJX2QfNR8yH3euJVvIeYg1ZzJIngHDTjQg0ZZ7904mRokYI
         p/sugBljlOzpmkBoDrCiwbsVqrivmznfapdPyua5BEVXcCEh3+F6vEb1upsYsOk3TW06
         cWe/0WPb2mk0ggNIrXjggnGj2CN1to8bjzDGy0vN9Tv1vGbskQPF1+W7lgGCoH816EEh
         scvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QoWW2GIC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y82si3411662qkb.103.2020.02.11.22.33.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 22:33:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QoWW2GIC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1laa-0003di-9E
	for alex.bennee@linaro.org; Wed, 12 Feb 2020 01:33:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47909)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j1laT-0003dW-3V
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 01:33:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j1laR-0003rM-BH
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 01:33:28 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:36111
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j1laR-0003qj-3B
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 01:33:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581489206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xiaSrhNJ3DDevNHnbuwF56IB49ZF1yXJIt6WnQQuxMo=;
 b=QoWW2GICKp+mMld+CU9UY6WDteS8V4E82p0QZPLM6UD+ufqMQ72Haaylmwdm45T2AJ2eBQ
 IB3LcBNIRWVBkgv0PVMg91RC7+hJDaM0n6kVSMiapyOV7cLCcIINVIQj2JBLZG3kC3gZZz
 6eB94cdsMJNPM7cVe1qAre6AzEZyX+c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-JmH3ho9AMmu7KiuajI55og-1; Wed, 12 Feb 2020 01:33:24 -0500
Received: by mail-wr1-f72.google.com with SMTP id v17so392691wrm.17
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 22:33:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1tk/rnk8CV/dPmL1ve+WJvChj3DZRsf45islRpAC5B8=;
 b=B1geAipVsUBNVPw7kcrgNqyFSsxkuRBYhZQlw8/zMo49mWfJqdKJzmSRpaCkwWI/ak
 ci/uK4EmTiO3PTUdjphUEm57yeNMNkre+E40pQnM3OWHMVv4W/IKvtvEHngiBo8f0CcR
 rIx7GOMIMo/4Yg7NJdJEStkUFn2ousfS/5ENgh5ekeViMyzusIaERmLiPruMCVapevSI
 yzOqZPCCuxf927qInvOTFzQPieMmDb9nvVTHqqQWW5dOseQUlPmu+iX4QbezNCFJUv1l
 JMSTk07xy/PLGZ8KrReU8AdM0BYMKG5pkUKcMSeL8qa7hwSEoLwTiTljl4VixhpLAtIy
 xkZQ==
X-Gm-Message-State: APjAAAWViw8ng8Jz8QqHe6GMkuyFaJx5xCWbpcKdU2UXVjzKoKqyCC1l
 VKb9lOR6+kfTy5E8uPn9JsJGiIRMmnkqQBUYrYhSyOo+EY05YnMfrO2d2/mAPIOBmWVRbc13XFE
 nXvfF4PW0QTdV
X-Received: by 2002:a5d:4ac8:: with SMTP id y8mr13083120wrs.272.1581489202942; 
 Tue, 11 Feb 2020 22:33:22 -0800 (PST)
X-Received: by 2002:a5d:4ac8:: with SMTP id y8mr13083087wrs.272.1581489202648; 
 Tue, 11 Feb 2020 22:33:22 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id v15sm8671191wrf.7.2020.02.11.22.33.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 22:33:22 -0800 (PST)
Subject: Re: [PATCH] target/arm: Implement ARMv8.1-VMID16 extension
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200210120146.17631-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <679ea0df-0aed-6268-9b28-b377ba51a1dc@redhat.com>
Date: Wed, 12 Feb 2020 07:33:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200210120146.17631-1-peter.maydell@linaro.org>
Content-Language: en-US
X-MC-Unique: JmH3ho9AMmu7KiuajI55og-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F+monPs0lMN3

On 2/10/20 1:01 PM, Peter Maydell wrote:
> The ARMv8.1-VMID16 extension extends the VMID from 8 bits to 16 bits:
>=20
>   * the ID_AA64MMFR1_EL1.VMIDBits field specifies whether the VMID is
>     8 or 16 bits
>   * the VMID field in VTTBR_EL2 is extended to 16 bits
>   * VTCR_EL2.VS lets the guest specify whether to use the full 16 bits,
>     or use the backwards-compatible 8 bits
>=20
> For QEMU implementing this is trivial:
>   * we do not track VMIDs in TLB entries, so we never use the VMID field
>   * we treat any write to VTTBR_EL2, not just a change to the VMID field
>     bits, as a "possible VMID change" that causes us to throw away TLB
>     entries, so that code doesn't need changing
>   * we allow the guest to read/write the VTCR_EL2.VS bit already
>=20
> So all that's missing is the ID register part: report that we support
> VMID16 in our 'max' CPU.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Not something anybody's been asking for, but worthwhile as
> a step towards finishing off support for all the v8.1 extensions.
>=20
>   target/arm/cpu64.c | 1 +
>   1 file changed, 1 insertion(+)
>=20
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 2d97bf45e1e..bf2cf278c03 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -672,6 +672,7 @@ static void aarch64_max_initfn(Object *obj)
>           t =3D cpu->isar.id_aa64mmfr1;
>           t =3D FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1); /* HPD */
>           t =3D FIELD_DP64(t, ID_AA64MMFR1, LO, 1);
> +        t =3D FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* VMID16 */
>           cpu->isar.id_aa64mmfr1 =3D t;
>  =20
>           /* Replicate the same data to the 32-bit id registers.  */
>=20

Trivial conflict with:

commit cd3f80aba0c559a6291f7c3e686422b15381f6b7
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Fri Feb 7 14:04:27 2020 +0000

     target/arm: Enable ARMv8.1-VHE in -cpu max

     Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
     Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
     Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
     Message-id: 20200206105448.4726-38-richard.henderson@linaro.org
     Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 2d97bf45e1..c80fb5fd43 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -672,6 +672,7 @@ static void aarch64_max_initfn(Object *obj)
          t =3D cpu->isar.id_aa64mmfr1;
          t =3D FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1); /* HPD */
          t =3D FIELD_DP64(t, ID_AA64MMFR1, LO, 1);
+        t =3D FIELD_DP64(t, ID_AA64MMFR1, VH, 1);
          cpu->isar.id_aa64mmfr1 =3D t;

          /* Replicate the same data to the 32-bit id registers.  */

