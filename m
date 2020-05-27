Received: by 2002:a05:6214:92e:0:0:0:0 with SMTP id dk14csp662956qvb;
        Wed, 27 May 2020 05:50:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxgPqJRRit9QGtw40bk2F81Ic3vcfcn0GsXNTyqqtb2KuyDcPtJmZz2Tzu34wbzK+LObAF
X-Received: by 2002:a37:9c55:: with SMTP id f82mr3783777qke.225.1590583832847;
        Wed, 27 May 2020 05:50:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590583832; cv=none;
        d=google.com; s=arc-20160816;
        b=T2nKNhsUzhOnesk/BlhDeLQ//xs8NbcwuuprTk9XIgAonTPqr4MEYkpnYr12QPBnRO
         Hq8zHFZ2K6nXUe3FENYza8He9EV+nPeXGG2gJJU2i2lsXew6D6zRSIAaRQq1LWhsSokG
         QFjnYcZ7msme0Mz0ENZ7CpQR0BuWUNTFEC1OuGq/rYATk8EgNbphXbqjV/mtrG6pVPnX
         o2uewbOaJPalV8E/FrXqtZR/maGufHV5sP0kMYtnlFLryPqo0ejOiihEwS0VDuVqMPcV
         6EBHG7nj7+iwl0ShRpt1I0MrnbGdhmo2TiRdO3b92cu2V9EZR6HNVhz+RgUbTCkHTbMW
         +Stg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=cdrcJ4tWIfsVuxC8hlUvY3Vp2ojYRkqC5WIJtimHwTU=;
        b=dIRFrekgR+QgOEs+4Kx52NaMGQUvybFhrDIpapLl90MUpUpcvEw2HVv1I7CWeWU3nj
         pTkFQUxIZVf8c/Z4zyjaL7lNyZ/HMoN9E/mWeHdSrmJl1P5nD1RWgrCRdz51GPohzXIB
         ND1Vq2KL3DVFtJAMWzG76fT92BUSSJ1NS/YrrwWhxRvA2FI58Zko8Bx8adEQw6LccSyC
         JWQDHe6f6Zbt/e1HE/TSnME+sFHOeoo/sonn/cX9yG7kE4xVbjVvKEiawp+08hdJ8IeV
         ipmyx0F3s7tAauqPqjI10tXyJdgY0bK/mD0PPGJpV6HhOGDuTP64CfpiITomGomSyt3E
         ilug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Qb/9EV1S";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9si1747388qke.12.2020.05.27.05.50.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 May 2020 05:50:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Qb/9EV1S";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jdvVw-0008H1-Cm
	for alex.bennee@linaro.org; Wed, 27 May 2020 08:50:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1jdvVp-0008Gp-Ly; Wed, 27 May 2020 08:50:25 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:53845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1jdvVo-0003bv-KA; Wed, 27 May 2020 08:50:25 -0400
Received: by mail-wm1-x344.google.com with SMTP id l26so2922266wme.3;
 Wed, 27 May 2020 05:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cdrcJ4tWIfsVuxC8hlUvY3Vp2ojYRkqC5WIJtimHwTU=;
 b=Qb/9EV1SoXRumIdt451LiMfrP3palf0o3pCbV9EJDh3oixF08Q02mkpTauewUEiulH
 ck+dIphz4ZcchcqM92LxsSkr06BwJitG8uPFcRkXohnZTV8fzTtR4zBLs1WxSnYVdpb2
 y0vSjBImfDl24Rd3++BlCvQMJXJw5+2L+vv2XTu9VBTt2VsEbrXEYbw8tcswNWlNNZ1Z
 7BJKC5H9d1z9ektCQxwTuLCWYxuCdRKTdh+5wQWCLesRoBtkn1NuDBsY+7mpRYmS6KjL
 IiPPPOTIMKf1dnaM5T5IN+I4xu5PgxPID4WARUl6KvPhv7bqbcZa9JzH6ieZNBVgnvsk
 uoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cdrcJ4tWIfsVuxC8hlUvY3Vp2ojYRkqC5WIJtimHwTU=;
 b=sh04wcIT0jMpTn9AYGtQyN/ObWlK0jSP48wzB8qsSSXD0JC+mzATfTiVlwOEaeYq3u
 UjuFKmMwPFBlNSTSiH6+ZaCgm0fxW51rFkPKyAzwRNFmkpeDmshZsis5+e+QquiNaWn7
 SQb7ZCyu8NrradIkmBqUMBsyEeMxfo5vQPRXrhAlqd7lcvFuUOMfcRofLrNy/d+TKvNX
 7zOVtSgivC86lIhHAhckhi9SRhZOEaccVhUXXmP9HR+4LCMzpUz7rxt0RDAqrB8rzOBl
 QmdT9T5deESXKqxT8R2FtQsIpMeBikv3140WxK3jioL+2TNRcBfTn0OzGzRNWY6JANLm
 lYrQ==
X-Gm-Message-State: AOAM533ZdJEtor3ABTyJcD58+3BryujQjNcSYxIowggKvTI+2jQtkAKT
 Akk1e0eT3nNs0o4ZOmSl8EA=
X-Received: by 2002:a1c:bb05:: with SMTP id l5mr3989327wmf.141.1590583819233; 
 Wed, 27 May 2020 05:50:19 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id m23sm2612038wmg.45.2020.05.27.05.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 05:50:17 -0700 (PDT)
Date: Wed, 27 May 2020 13:50:16 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 0/4] memory: Add memory_region_msync() & make NVMe
 emulated device generic
Message-ID: <20200527125016.GF29137@stefanha-x1.localdomain>
References: <20200508062456.23344-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vKFfOv5t3oGVpiF+"
Content-Disposition: inline
In-Reply-To: <20200508062456.23344-1-philmd@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=stefanha@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9n10P05L1gN0


--vKFfOv5t3oGVpiF+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 08, 2020 at 08:24:52AM +0200, Philippe Mathieu-Daud=E9 wrote:
> Let the NVMe emulated device be target-agnostic.
>=20
> It is not clear if dccvap_writefn() really needs
> memory_region_writeback() or could use memory_region_msync().
>=20
> Philippe Mathieu-Daud=E9 (4):
>   memory: Rename memory_region_do_writeback -> memory_region_writeback
>   memory: Extract memory_region_msync() from memory_region_writeback()
>   hw/block: Let the NVMe emulated device be target-agnostic
>   exec: Rename qemu_ram_writeback() as qemu_ram_msync()
>=20
>  include/exec/memory.h   | 15 +++++++++++++--
>  include/exec/ram_addr.h |  4 ++--
>  exec.c                  |  2 +-
>  hw/block/nvme.c         |  6 ++----
>  memory.c                | 12 +++++++++---
>  target/arm/helper.c     |  2 +-
>  hw/block/Makefile.objs  |  2 +-
>  7 files changed, 29 insertions(+), 14 deletions(-)

Thanks, applied to my block tree with Paolo's Acked-by:
https://github.com/stefanha/qemu/commits/block

Stefan

--vKFfOv5t3oGVpiF+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl7OYggACgkQnKSrs4Gr
c8hgRgf8CC2QMO6EXSDjEInBPXt7ihx86t6J0HKkhspJOMYpMapcV0JSSx1/IWQd
AAUbxr9JbVNgZGImgJkSkBzeZ0JernnPpuQSPs/S1AaoeNUZp0TunXbfFFy2zoL+
oF1R8KackG02+SktcfQ7vWvyG0NbuGam172T182qI31MQkNJ+TBBwfR9rludjfBo
0+QkP5KmYcg/k53ryHGkmguFoZJ+VtGk4q89PH+A0lKTIEqvY6sXBGXb5EVWJYA3
igazLJGMqQhcFF6voi1Vwn+292geGb4IVHyE1qE4pewEFoMTj0SojvRAUx0c+XSc
oHyMC0td5UotWyrVS/CPChcovByAYw==
=ZKmE
-----END PGP SIGNATURE-----

--vKFfOv5t3oGVpiF+--
