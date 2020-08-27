Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp634385lfc;
        Thu, 27 Aug 2020 07:57:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3Sul67dGygE/g+npJdHY4dWJjOOh6ymx9gPmABRIB7ZMnkg5b/inUqUE2S7wyRrf03Xgb
X-Received: by 2002:a25:2415:: with SMTP id k21mr29936544ybk.156.1598540223324;
        Thu, 27 Aug 2020 07:57:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598540223; cv=none;
        d=google.com; s=arc-20160816;
        b=ROVZegvVxxRsL90loMdukK8NXZ8OyiV+kRXlKj9NGbXWBm8I6N9TpoT7DoLCntSPOx
         grtfZXpPEAEhwIUomR5DjClcaMWYPX3QRyNyvo6SRh72wqHCO8RPD31E6ChWbnA9YXba
         8KKlnmhYAAbYCPH/OT0FPRH5goyyrKaTLvfK+9PBvq7JvlOKdbUsIC3sVBaPOVmV1WRB
         XCxK4oke9CcVZ5HU8nrgtVsDxEFcYe2thCcBmycO0s5IgLPhDK847flBlsW4/jwT7d1b
         1575kkZIStVR2N7Lbv0sEAKN1gPARrSHvIPA7iAeqheNF7RsLpSElMWmbMbY9qaZyBQ3
         5TEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=wsuZpKXQI/kSu1Qx0/XtWkBt+ZOTYP/BuvKbIRJ0s8c=;
        b=VKk2rQ0jVBBbgFChfpGi/y5UPXz+MuxylRbJ3ZhLQ3FWhrE61XIb8JdLPkVef8fQv2
         7VceyXPj8dyD6af5dJ85MBBBTxZv4chjTcer4pI0pm8qdmix5cYS4ZiOG4Mlp7Wa4Nd6
         im463pM0sPUwSvi6g6xQm2DVWfSi9kArGonk1m8QAw4kDIt8ceI5QygapBQySHfRK2cs
         bMp0WMh3GU1Tmkqzzr/3DFMZ3laVUQwntAzAhmP5ODPNBf4ETGwJhY93heGFU6Sq6UKE
         O13NHPpTFk07abCqJZpujISCEIGohbgI5WMP+JSawS0zSGEctAA13TO97ToRZKYPyOv1
         WNNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Nwx2j+It;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d82si2507173ybd.421.2020.08.27.07.57.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Aug 2020 07:57:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Nwx2j+It;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBJKo-0005nZ-OC
	for alex.bennee@linaro.org; Thu, 27 Aug 2020 10:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1kBJKY-0005lp-SZ
 for qemu-arm@nongnu.org; Thu, 27 Aug 2020 10:56:46 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35434
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1kBJKX-0000Ho-21
 for qemu-arm@nongnu.org; Thu, 27 Aug 2020 10:56:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598540204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wsuZpKXQI/kSu1Qx0/XtWkBt+ZOTYP/BuvKbIRJ0s8c=;
 b=Nwx2j+ItstD8ZzPzCMkPFL30gmAENhSh562IgxxeJ4zsQ57h91bTwJBA4BfPuA7bOvovbm
 kgiumcRGDbUPK1xmgKwYOiXQAx5E0XdK2GCtjyHBL+BzvhecCzKWRR9KGG8ZBbgd2fEnxa
 wl7AqykHAjVBHbu1gWWcOzTMvZsxy60=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-iineSp69Mta0uaMYcSrzrA-1; Thu, 27 Aug 2020 10:56:41 -0400
X-MC-Unique: iineSp69Mta0uaMYcSrzrA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9D4F10ABDA1;
 Thu, 27 Aug 2020 14:56:39 +0000 (UTC)
Received: from localhost (ovpn-113-131.rdu2.redhat.com [10.10.113.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB2B27A4D2;
 Thu, 27 Aug 2020 14:56:33 +0000 (UTC)
Date: Thu, 27 Aug 2020 16:56:32 +0200
From: Sergio Lopez <slp@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v6 13/20] x86: constify x86_machine_is_*_enabled
Message-ID: <20200827145632.bitfuhk72rfkpjvv@mhamilton>
References: <20200826105254.28496-1-kraxel@redhat.com>
 <20200826105254.28496-14-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200826105254.28496-14-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="753vxnsxshtrvxbw"
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=slp@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 00:13:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2oq00mkAmw7C

--753vxnsxshtrvxbw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2020 at 12:52:47PM +0200, Gerd Hoffmann wrote:
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/hw/i386/x86.h | 4 ++--
>  hw/i386/x86.c         | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Sergio Lopez <slp@redhat.com>


> diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
> index b79f24e28545..a350ea3609f5 100644
> --- a/include/hw/i386/x86.h
> +++ b/include/hw/i386/x86.h
> @@ -110,8 +110,8 @@ void x86_load_linux(X86MachineState *x86ms,
>                      bool pvh_enabled,
>                      bool linuxboot_dma_enabled);
> =20
> -bool x86_machine_is_smm_enabled(X86MachineState *x86ms);
> -bool x86_machine_is_acpi_enabled(X86MachineState *x86ms);
> +bool x86_machine_is_smm_enabled(const X86MachineState *x86ms);
> +bool x86_machine_is_acpi_enabled(const X86MachineState *x86ms);
> =20
>  /* Global System Interrupts */
> =20
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index cf384b974318..31a82885d735 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -845,7 +845,7 @@ void x86_bios_rom_init(MemoryRegion *rom_memory, bool=
 isapc_ram_fw)
>                                  bios);
>  }
> =20
> -bool x86_machine_is_smm_enabled(X86MachineState *x86ms)
> +bool x86_machine_is_smm_enabled(const X86MachineState *x86ms)
>  {
>      bool smm_available =3D false;
> =20
> @@ -887,7 +887,7 @@ static void x86_machine_set_smm(Object *obj, Visitor =
*v, const char *name,
>      visit_type_OnOffAuto(v, name, &x86ms->smm, errp);
>  }
> =20
> -bool x86_machine_is_acpi_enabled(X86MachineState *x86ms)
> +bool x86_machine_is_acpi_enabled(const X86MachineState *x86ms)
>  {
>      if (x86ms->acpi =3D=3D ON_OFF_AUTO_OFF) {
>          return false;
> --=20
> 2.27.0
>=20

--753vxnsxshtrvxbw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAl9HyZ8ACgkQ9GknjS8M
AjWcYBAArqdaF/J6ySxkRoQT2NMqtfI3CTHkQ7/H3Yo+dgvBSzJWxy9Br6WcBZEr
l5KXNsenUaTA2MUX2yQ4n6Lf4SSOhBQeCC6zoPC1mWp6UH6zeljDsL/Np13esMAL
yxTqZPjZXqaJfB0xgoGmNbsBL99XBnOYWKeoo+ZcV5p4UWm/F1glQOJd4Ocd51p4
6pFM4uz7laY8+G+9lhOBOjEx9K2S04W7cWGeKxIjN49aJp7TOLD3jbj4sguGBrHJ
xzhS4njeNAFvPe1ttZp+SDUEjbNyqRchEjbByjpavoSIJkRP5qgJiN0hMU+JGC38
LsNfNU1VPSdqFzVMkTc/DPMon0OR00Ns2Qaozp+DgksGSft7ZDqGnwGGYkSTMpZh
ggXIJ9oNDoGy5Cufr/lGJCKTl14imz/ktyT7+9j4AL6AH+aeCe8kKbLE4QD0kwf7
LendbGwcDwopBywNJ27ddsEJMN7L/50C387aO0W8kagZetYun0tc+kSi4Tdl0DmZ
wKA/NKaVk/ytm2OYYvd6nVPP2aTlMvtL7hE3U70psMLMekNDwTvlj9E6HCzzQxie
f5LnpQiOZXBLfIEaVnc6bx2UVUijfZwBz8vONlg3Kv0BXMoE849VKA3zjU77UX5w
Z/vgjmtzkDQU5mLLcjPlBLHR2rG8R3aK6bj/8JoG1jgREGokTRw=
=2VtS
-----END PGP SIGNATURE-----

--753vxnsxshtrvxbw--

