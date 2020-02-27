Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4142267lfg;
        Thu, 27 Feb 2020 00:32:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqw70YF51LKm+kWAsfhhw/za/oSjfejD4Ltgb2jooiasBUJB1L6+Pf93h/mBYsCwAnI/QIRf
X-Received: by 2002:a0c:fe10:: with SMTP id x16mr3799615qvr.188.1582792325538;
        Thu, 27 Feb 2020 00:32:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582792325; cv=none;
        d=google.com; s=arc-20160816;
        b=m2R5JTdy6Zpbrv59INGKvA+K4sowHC8YxROOl2G0KZhaQoa4DaqRIFjRedNsYK80m+
         iDcUjofoyMtJSDq9ArXOUO+JkyzeLX/elgNaZVSDUXUR9nRNg0aKGpsWyKxf7eL6qwjm
         6scvxszLzZ4BQzsPRif/aWCoa5a6mqbnzz7vqc/OYPkY66UE3qrBl5If2QGIKRtMK3GC
         E/iZGeCwZoh5e/DlVMWg6d4ZYmceCkXMG7HMSA3Z+9x+KYipRXlNtvBP7EzkkYESdJGU
         ks/orUMzC4CdOd3YLqO3dZfo5bbIv7s2TZYGmVoaBKiF0f4ojcdxzIAoptIOv83U3JmD
         abgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=QmQY4eabl3QdJOcsL6pGL1m4HP0v2CQwawqKSckWrXs=;
        b=dDFiPo/ERFbNrYA+TXIin8XH2WPvMGgna5WuKNGZltCuoiw2ZLlOyassenbEVQ1gkX
         l2GCAvxe78aPf0z1p2NwIMeZScfZifmInQZ+6J/ZcqOjmOGaNRFeGSOoXfzys/kU6fUB
         I3tf/LCRTTX6GbluYfqT3UDLZfmZerClNtyXUbhhjszBlhkDqbXRkFKA+w6hUUmU5IZF
         cr37CSl9Vls5+NuRDtk+K5M2PvImOy/XUvuPOleOTz4DNQWPCbOj+8csGja3BXpgvlZR
         IWkhBZONf3KjK0AYV7lEFXY9rA/1o0e4ZFE2e3uhZwuTrkmMW1o+t6+j/wTeEhPvizQI
         8Gqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XJNPGXev;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y3si1070016qtb.234.2020.02.27.00.32.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2020 00:32:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XJNPGXev;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7EaT-0006wl-0H
	for alex.bennee@linaro.org; Thu, 27 Feb 2020 03:32:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47076)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j7EaL-0006wV-UL
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 03:31:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j7EaK-0006jH-NM
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 03:31:57 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:33276
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j7EaK-0006fe-K7
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 03:31:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582792315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QmQY4eabl3QdJOcsL6pGL1m4HP0v2CQwawqKSckWrXs=;
 b=XJNPGXev3l9lorZr15fOB0+pdVazQ2XA/v6oGo5Ir5y2ASbfEOezz0bLf0HvL04WCR/68K
 G0ThnQzjWXO9i7LEPnVPP2RnnBiXUz45BLKnmoflnyWQ0BA3mZ/go2Anq7ncOy8ImH/dSe
 ISq7c3w+7AP1mY1OF6VQesXOnFKSQYY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-ZlBmv2EAPHel2BP6om_Z_Q-1; Thu, 27 Feb 2020 03:31:54 -0500
X-MC-Unique: ZlBmv2EAPHel2BP6om_Z_Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17CE51005514;
 Thu, 27 Feb 2020 08:31:53 +0000 (UTC)
Received: from [10.36.116.59] (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3685F60BE1;
 Thu, 27 Feb 2020 08:31:49 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] hw/arm/smmu-common: Simplify
 smmu_find_smmu_pcibus() logic
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200227075111.15275-1-philmd@redhat.com>
 <20200227075111.15275-3-philmd@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <7ba75891-33c2-fb50-a57d-6f23e9e656d5@redhat.com>
Date: Thu, 27 Feb 2020 09:31:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200227075111.15275-3-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qBh6fjF2IL3q

Hi Philippe,
On 2/27/20 8:51 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> The smmu_find_smmu_pcibus() function was introduced (in commit
> cac994ef43b) in a code format that could return an incorrect
> pointer, which was then fixed by the previous commit.
> We could have avoid this by writing the if() statement differently.
nit: avoided
> Do it now, in case this function is re-used. The code is easier to
> review (harder to miss bugs).
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> This patch is easier to review with 'git-diff -w' (--ignore-all-space)
> ---
>  hw/arm/smmu-common.c | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)
>=20
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 67d7b2d0fd..e13a5f4a7c 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -290,20 +290,21 @@ inline int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t i=
ova, IOMMUAccessFlags perm,
>  SMMUPciBus *smmu_find_smmu_pcibus(SMMUState *s, uint8_t bus_num)
>  {
>      SMMUPciBus *smmu_pci_bus =3D s->smmu_pcibus_by_bus_num[bus_num];
> +    GHashTableIter iter;
> =20
> -    if (!smmu_pci_bus) {
> -        GHashTableIter iter;
> -
> -        g_hash_table_iter_init(&iter, s->smmu_pcibus_by_busptr);
> -        while (g_hash_table_iter_next(&iter, NULL, (void **)&smmu_pci_bu=
s)) {
> -            if (pci_bus_num(smmu_pci_bus->bus) =3D=3D bus_num) {
> -                s->smmu_pcibus_by_bus_num[bus_num] =3D smmu_pci_bus;
> -                return smmu_pci_bus;
> -            }
> -        }
> -        smmu_pci_bus =3D NULL;
> +    if (smmu_pci_bus) {
> +        return smmu_pci_bus;
>      }
> -    return smmu_pci_bus;
> +
> +    g_hash_table_iter_init(&iter, s->smmu_pcibus_by_busptr);
> +    while (g_hash_table_iter_next(&iter, NULL, (void **)&smmu_pci_bus)) =
{
> +        if (pci_bus_num(smmu_pci_bus->bus) =3D=3D bus_num) {
> +            s->smmu_pcibus_by_bus_num[bus_num] =3D smmu_pci_bus;
> +            return smmu_pci_bus;
> +        }
> +    }
> +
> +    return NULL;
>  }
> =20
>  static AddressSpace *smmu_find_add_as(PCIBus *bus, void *opaque, int dev=
fn)
>=20
Acked-by: Eric Auger <eric.auger@redhat.com>

Thanks!

Eric



