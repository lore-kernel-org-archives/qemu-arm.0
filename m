Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp38918lfb;
        Mon, 11 May 2020 02:51:22 -0700 (PDT)
X-Google-Smtp-Source: APiQypLYypkFzf+qTeV7CQ3ekEt6dv2ahWhokGEW3byNPo0hmjgVt9VAk84GqwmoZXfMXwccYgQ5
X-Received: by 2002:a37:84c5:: with SMTP id g188mr5447514qkd.344.1589190682108;
        Mon, 11 May 2020 02:51:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589190682; cv=none;
        d=google.com; s=arc-20160816;
        b=tyt3LqiRXP5VfMk8bH5QuCL68w7OIE1LZe2tDd6ucjqfPuX6aF/wRCC5GPFkNbG/xd
         93Re+OnTI86bSQTTkqpScz4fFkQpnURAAiha0CFMyi+TB0ahgvB8dbWdNzOYzIFGPgR+
         2brsQCDufl/EQOldV8EOO12XVLUIIMdC4QJzMhn990AYaBNRh+F+WhpAKTEpGtuZS0Nr
         3SixnuloFMacfg2pELhi2OegulE9qdEFNmlqGIFygtBQZtofXNHpz51GvfH2gbtCbCg/
         o6QUD41rjI7xR5OaTjATKws5R7bUw9+Hrh+v2ARDdxv4gXMFRwhG/sAsaufZCiPo8kpZ
         snBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=5nn4+ebUEGjP12SLduyrxAK7er7p9DMP21wNjR3eT3M=;
        b=pZycmZKsqKlaOCsQzUM8a0mOr1TXodbcQODTDPfnmCzDOiwwBSe9YOKDTyhrSRiK/Z
         tv62zTeERgJ+cYHXd/hCYOgf+ki4dYQbTpSQfYIZ0SlPU9Sp0gRQxMU6MyJmLnQuTrkG
         W/Mz6f2lmpmDFvQiD5Vy/fMeBCA1/3Iz9e0exrzG5vZjLPEujSnBFEA6LMk6U+pw+5Md
         94+7EutjR5nTSGqVUaPkwEfvQczodsPwNeHdX5jvFgq0kU8lPEnt1h5gliguboGgq3ki
         RUNieLxCPoKU8AFj4TOY6ymN9oUFGlu0Xo8h61ugjwh2TBzG9z4wq7fMdyCHby+l1Vzx
         8ACw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UPd8FYj1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y40si665428qvf.197.2020.05.11.02.51.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 May 2020 02:51:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UPd8FYj1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jY55l-0005oQ-Dh
	for alex.bennee@linaro.org; Mon, 11 May 2020 05:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jY55c-0005ll-5q
 for qemu-arm@nongnu.org; Mon, 11 May 2020 05:51:12 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33898
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jY55a-0004eU-Ej
 for qemu-arm@nongnu.org; Mon, 11 May 2020 05:51:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589190668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5nn4+ebUEGjP12SLduyrxAK7er7p9DMP21wNjR3eT3M=;
 b=UPd8FYj1/UpDxcaZrZ8+k3QOHoZBrzc122p+mF/Fvatg/qZHmJcoPG5H4c/Jtua5DdLY80
 3tQRCEWPKyoz/6UjKkeYKqejsL3TorxLmOZQJEpmtxPPchH8j+N5Wm4MrFo0NnODPH2ANP
 oh4A2HTdeae79GQZNrFpzWrgBbZElDk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362--CLs1YARNcS8YLgkDqlpXQ-1; Mon, 11 May 2020 05:50:34 -0400
X-MC-Unique: -CLs1YARNcS8YLgkDqlpXQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A69441054F8F;
 Mon, 11 May 2020 09:50:32 +0000 (UTC)
Received: from localhost (ovpn-114-247.ams2.redhat.com [10.36.114.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2701D9CB9;
 Mon, 11 May 2020 09:50:31 +0000 (UTC)
Date: Mon, 11 May 2020 10:50:30 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 4/4] exec: Rename qemu_ram_writeback() as
 qemu_ram_msync()
Message-ID: <20200511095030.GA162792@stefanha-x1.localdomain>
References: <20200511081719.31641-1-philmd@redhat.com>
 <20200511081719.31641-5-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200511081719.31641-5-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 03:10:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beata Michalska <beata.michalska@linaro.org>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BE+TjTVKWlDV

--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2020 at 10:17:19AM +0200, Philippe Mathieu-Daud=E9 wrote:
> Rename qemu_ram_writeback() as qemu_ram_msync() to better
> match what it does.

Based on Juan's comment in the other email thread I think this commit
description could be expanded. Let's explain the rationale for this
change:

  qemu_ram_writeback() and memory_region_do_writeback() have similar names
  but perform different functions. qemu_ram_writeback() is concerned with
  syncing changes to the underlying memory device (NVDIMM or file-backed
  RAM). memory_region_do_writeback() is concerned with dirty memory
  logging.

  Rename qemu_ram_writeback() to prevent confusion with
  memory_region_do_writeback().

>=20
> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  include/exec/ram_addr.h | 4 ++--
>  exec.c                  | 2 +-
>  memory.c                | 3 +--
>  3 files changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
> index a94809f89b..84817e19fa 100644
> --- a/include/exec/ram_addr.h
> +++ b/include/exec/ram_addr.h
> @@ -136,12 +136,12 @@ void qemu_ram_free(RAMBlock *block);
> =20
>  int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp);
> =20
> -void qemu_ram_writeback(RAMBlock *block, ram_addr_t start, ram_addr_t le=
ngth);
> +void qemu_ram_msync(RAMBlock *block, ram_addr_t start, ram_addr_t length=
);
> =20
>  /* Clear whole block of mem */
>  static inline void qemu_ram_block_writeback(RAMBlock *block)
>  {
> -    qemu_ram_writeback(block, 0, block->used_length);
> +    qemu_ram_msync(block, 0, block->used_length);
>  }
> =20
>  #define DIRTY_CLIENTS_ALL     ((1 << DIRTY_MEMORY_NUM) - 1)
> diff --git a/exec.c b/exec.c
> index 2874bb5088..f5a8cdf370 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -2127,7 +2127,7 @@ int qemu_ram_resize(RAMBlock *block, ram_addr_t new=
size, Error **errp)
>   * Otherwise no-op.
>   * @Note: this is supposed to be a synchronous op.
>   */
> -void qemu_ram_writeback(RAMBlock *block, ram_addr_t start, ram_addr_t le=
ngth)
> +void qemu_ram_msync(RAMBlock *block, ram_addr_t start, ram_addr_t length=
)
>  {
>      /* The requested range should fit in within the block range */
>      g_assert((start + length) <=3D block->used_length);
> diff --git a/memory.c b/memory.c
> index 73534b26f4..5bfa1429df 100644
> --- a/memory.c
> +++ b/memory.c
> @@ -2197,7 +2197,6 @@ void memory_region_ram_resize(MemoryRegion *mr, ram=
_addr_t newsize, Error **errp
>      qemu_ram_resize(mr->ram_block, newsize, errp);
>  }
> =20
> -
>  void memory_region_sync(MemoryRegion *mr, hwaddr addr, hwaddr size)
>  {
>      /*
> @@ -2205,7 +2204,7 @@ void memory_region_sync(MemoryRegion *mr, hwaddr ad=
dr, hwaddr size)
>       * different types of memory regions
>       */
>      if (mr->ram_block) {
> -        qemu_ram_writeback(mr->ram_block, addr, size);
> +        qemu_ram_msync(mr->ram_block, addr, size);
>      }
>  }
> =20
> --=20
> 2.21.3
>=20

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl65H+QACgkQnKSrs4Gr
c8jv2Qf9FdFxat/l9/fF9kJ7noztTBcqr4GVwlKgemqW7WpSryJVfQVw0BiZmcx9
OzB6ETcwue2jKQYa61llIrRsb6Fb96IozHAKAfVsjeP2EZlf00thrg8NfDRPtF7h
freqnBSPC7ufszU/sVJ5Vb/AzbiWaajKdJ9UYU8h9s0Pq+8dvx+g0E1K8jmJUKZt
bucl0HVRn2vgn6QZC3UzNMgErx2qaf4opKY7aTdSfQQEr2aRWf38CoDCTK+6k5Lb
2xTTxCmDip+Doav33NcXMa1/3iBaPIEMQ1eGeRn1auweApyaL1ZXaPT4rvfMyH5b
MkgPygxBzdu6fGMFvvBWyYLkn3gYTg==
=aXLF
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--

