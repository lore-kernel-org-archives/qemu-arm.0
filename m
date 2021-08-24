Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2787516lfg;
        Tue, 24 Aug 2021 06:08:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQVT0RO50or4+Zpee1XX3wO3ACEG96MOiec4Pu4x0erOsInhrEM+cwPiQfNGlBHlNmsnCK
X-Received: by 2002:a5d:538e:: with SMTP id d14mr19586117wrv.192.1629810537566;
        Tue, 24 Aug 2021 06:08:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629810537; cv=none;
        d=google.com; s=arc-20160816;
        b=N74wttT1KnlvwNGR1G/S1i2IG44sOhyjnjsCaiizh986etLvtVb80FxLqXplO6sKHZ
         NhhM/WqM343OND9hk5zstpfnXQbfokj+y5THYzgMv0EZv39eaU/AwnBgdsXgT5lC8lYU
         NpwjV841DxaQgy28ubEGrvayiCL4IVUtIwW0zmEKrb5cFMMH0Tj8JHi8HX/zamJIKNt2
         iDJT/14UIpcfzUiP8l0bvUJmfsR3CSSUZM+eOk3iGdaNaGn6NalrnfYUG9O/FvoRQ0oD
         fBjbDDT80uTa8AGUX/Br506vQjX5Jt27qvFGuj3U0Bv410/mHnywlbuHZN+pbRP0uCXG
         6kEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=CGT/LvSWKcB1e1xjl1gyoPtGLToeXpWDBqIikUgAWqk=;
        b=OQlxWHp1jMuGN9hq6kXA4UgQ29YNVWpk7tnUpSgBnHp2Al24IKQzoS2DzLljPqzxXy
         laV0ISmnnH68M7I0aAB3iORTmvrkWyjpbjxAv6BP3oHBMPqP75tTyEGdWoIijiX7b/Cd
         umKvkMJZ4cd0aIPLMHxjPirVgkAQahQjHgrRprM4WE7oxhf/SwIUc7MJ+z+Iw9oHKUgi
         zkuLDQFE0ABjCkIT2bmPebX/2YlWcOcoPbDWwAztY9JE/Bnss+JJ/bblKOil+VyCBTGP
         e81RZc1UwpMQ1hVXHI3m1i7kpUJ/SUE3lFBHPOEcRQIRxax6a69myt1z6xRtPeSuJDKh
         yimw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=acZmtTdm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r5si18698473wrl.302.2021.08.24.06.08.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Aug 2021 06:08:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=acZmtTdm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIWAi-0001ex-HP
	for alex.bennee@linaro.org; Tue, 24 Aug 2021 09:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mIWAT-0001ed-7k
 for qemu-arm@nongnu.org; Tue, 24 Aug 2021 09:08:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mIWAR-0003kx-Ko
 for qemu-arm@nongnu.org; Tue, 24 Aug 2021 09:08:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629810518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CGT/LvSWKcB1e1xjl1gyoPtGLToeXpWDBqIikUgAWqk=;
 b=acZmtTdmair0kbUDP8iz79akuYZTXAGkZmjPP+BpeVONN+2xc1gtxWrE/Ex3IwmJsamhM9
 3t1fch6wvhZGFJGUpbBSeravhsYrUzsaUwnY8rd6Tc0mtSpHoxy5gEWaaQEHv6S81g+tIU
 B7QDjB6TVfqhATDcOmYGR5rJkPKxwJM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-IEld2vN1MjqKm4H6SGRplw-1; Tue, 24 Aug 2021 09:08:37 -0400
X-MC-Unique: IEld2vN1MjqKm4H6SGRplw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1CE28799E0;
 Tue, 24 Aug 2021 13:08:35 +0000 (UTC)
Received: from localhost (unknown [10.39.195.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0EA851ACBB;
 Tue, 24 Aug 2021 13:08:26 +0000 (UTC)
Date: Tue, 24 Aug 2021 14:08:26 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH v2 3/5] exec/memattrs: Introduce MemTxAttrs::bus_perm
 field
Message-ID: <YSTvSlU5fk8JuY0u@stefanha-x1.localdomain>
References: <20210823164157.751807-1-philmd@redhat.com>
 <20210823164157.751807-4-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210823164157.751807-4-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2znB2TikHCuLJpQL"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wbCw/TIyPpZ8

--2znB2TikHCuLJpQL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 23, 2021 at 06:41:55PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Add the 'direct_access' bit to the memory attributes to restrict
> bus master access to ROM/RAM.
> Have read/write accessors return MEMTX_BUS_ERROR if an access is
> restricted and the region is not ROM/RAM ('direct').
> Add corresponding trace events.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  include/exec/memattrs.h | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
> index 95f2d20d55b..7a94ee75a88 100644
> --- a/include/exec/memattrs.h
> +++ b/include/exec/memattrs.h
> @@ -14,6 +14,13 @@
>  #ifndef MEMATTRS_H
>  #define MEMATTRS_H
> =20
> +/* Permission to restrict bus memory accesses. See MemTxAttrs::bus_perm =
*/
> +enum {
> +    MEMTXPERM_UNSPECIFIED   =3D 0,
> +    MEMTXPERM_UNRESTRICTED  =3D 1,
> +    MEMTXPERM_RAM_DEVICE    =3D 2,
> +};
> +
>  /* Every memory transaction has associated with it a set of
>   * attributes. Some of these are generic (such as the ID of
>   * the bus master); some are specific to a particular kind of
> @@ -35,6 +42,19 @@ typedef struct MemTxAttrs {
>      unsigned int secure:1;
>      /* Memory access is usermode (unprivileged) */
>      unsigned int user:1;
> +    /*
> +     * Bus memory access permission.
> +     *
> +     * Some devices (such DMA) might be restricted to only access
> +     * some type of device, such RAM devices. By default memory
> +     * accesses are unspecified (MEMTXPERM_UNSPECIFIED), but could be
> +     * unrestricted (MEMTXPERM_UNRESTRICTED, similar to an allow list)
> +     * or restricted to a type of devices (similar to a deny list).
> +     * Currently only RAM devices can be restricted (MEMTXPERM_RAM_DEVIC=
E).

I don't understand these 3 categories.

MEMTXPERM_UNSPECIFIED means any MemoryRegion can be accessed?

What does MEMTXPERM_UNRESTRICTED mean? How does this differ from
MEMTXPERM_UNSPECIFIED?

What exactly does MEMTXPERM_RAM_DEVICE mean? Maybe that only
MemoryRegions where memory_region_is_ram() is true can be accessed?

--2znB2TikHCuLJpQL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEk70kACgkQnKSrs4Gr
c8iFzQf/QvNOLDwGMZGj5xGH6SsxaMp2Yam9JON50BlOXvos2BcXr/L4Cd1XtD63
8aLzGhYdbCkM/IbqYnRzNtICNKr50DjVHIlOYI151GmiZ81hggBzwD7tTRbUrUBM
StHJkIoEKNlupkxzC1VoWBOHvTVm1PSKm+R5zcMQlg4Hgz5Lkd9W1tgPTuq39Wbx
SBmK59kZ3ffNZU1m/fUgiyi9lkhEMsW/9k5V7CC2nm4XWL+Ky2Pp+uQlToh6fJ9F
Cvfc0pH8oHg93RQ0YynY68onJ5sSJnidBXy0TNZCDgq/AmgCCHhq5z+9eb7iEOqe
UWavjh+gCxulN7Va7DzVANi0dw63Lg==
=1zRO
-----END PGP SIGNATURE-----

--2znB2TikHCuLJpQL--

