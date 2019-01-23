Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1170117wrt;
        Wed, 23 Jan 2019 13:25:37 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7obbW93bZXDoCng/WFLvmhMuUCmNX88kqmdbOANmxI3r+pwDy5EgmH0fH+QyhBjDM7iW/J
X-Received: by 2002:a1c:1902:: with SMTP id 2mr4306922wmz.150.1548278737197;
        Wed, 23 Jan 2019 13:25:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548278737; cv=none;
        d=google.com; s=arc-20160816;
        b=mlKhH2kS6YHkZ2+GL0pxNg9wHsuqh7XmR2255kjL6HPfWbPuk/HEIVF3gWayjSeZw2
         +NsBp8tpZXoc5onHaVgefPRbYIU9LbFgHn9qjGFSDqSYMn+VEFA/5ZiPItjXXjrqQE8g
         eMUeKkfrllN7hM+i4GjpnIgWnxM9+BiFCQPo1zJaUVCvZAfy46EL2RqTwyd162btWehe
         SCzVlKCtuL1oLPngf7F7OoFj4Dl1Sh+bbVcbpxDVha/b9KosuW8xEgltMAmFAedseNwv
         WxhsRAAmKs098OueZMud9fZq52U07gvmFRIxs0Cr61vgDeng8zzxRN1/RZ1lBBU6mvyq
         OkEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=Ca/oRF85FC6AmeZY6edx3xWK3BSTTs2zhwoipgCBJb0=;
        b=QxNc0SB8UI/u2QNtSzqsh0SWMDKQZJ/tXs6VZCPtu/K5kDDxPsaQnWBXgJORQ/7wOm
         0y6U0WJP7oEd7BFeEm5+TX7GT9dNZfijjD+6P1CgXI0EGIIVSIHrb+Fvms4BYeAxPYZ2
         I5DViXI05KMgIS5pcZKPOsYq+a3TOqic+fvsGlDGF1RccRHN8epNVld10sQC+ua43OgW
         CTnYqF+9lEyuae0CFui0jz+P2VyHTSgCJ3XSWG6PlPAnz6RQvyi8AOWG1HNQw5i+hSrn
         n0pLveEB2C+hyobrGv0huaxEg7RVXvJp1Pau5pcFFAaczRung8LYk163e8JuSV7jnwpS
         O/Zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sqNLgAm+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f85si37777530wmf.78.2019.01.23.13.25.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 13:25:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sqNLgAm+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:42031 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmQ1e-0007xa-G7
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 16:25:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1gmPyP-0005FR-Vl
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 16:22:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1gmPkJ-0003lU-Mv
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 16:07:41 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:53191)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1gmPkB-0003fz-Rf; Wed, 23 Jan 2019 16:07:32 -0500
Received: by mail-wm1-x344.google.com with SMTP id m1so881071wml.2;
	Wed, 23 Jan 2019 13:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Ca/oRF85FC6AmeZY6edx3xWK3BSTTs2zhwoipgCBJb0=;
	b=sqNLgAm+cM/iw7nP9HIsUsuXV5IenrBv8Q+2ZQf3yIQsVIQGyGe65ttxocugexfVZg
	5qxTzi2hLdT+Qh54qlG5GpNXeINt+3INF7iHixlu5EIOLSJDoOIS2erjy5Afm3RldBBt
	EdWa65Nogo1OPjfhn8ZnibdbN0tLVuEU3qlaOXKlbeeqwCFFkaQlbEZivzmDVO93AtXW
	KPZXMjnwqID5eUh6TXTLruEyCsHRscb4w+yuehoUJ0NsJveYb0ijnct0iELQZAT7ZAs6
	5ToY6jK2P3L7IRSNIpQc2f7uU4hkKXOmQIOX+UmuzeO/LTaggPlBdd1qNPMlww3cMSMN
	WOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Ca/oRF85FC6AmeZY6edx3xWK3BSTTs2zhwoipgCBJb0=;
	b=ooBJzxXyeJqkBD9+dMv4UR5Kl10tRc7xRzb86O9fEVYBN1RF3VMX8/FsiwzXJc8li/
	aCrVHBcjuTNsAfq/lAfsjZDlLq8B4hZhRLbXtETD2Lb6S6XrgbEYyJpGWqWsstheYFdM
	gxQFixxgxjWsQjBDfGAtAugVi3YV0F6PPSvUY2u0PDiQVzdH4b4hqbWfAosxmQ2+07ab
	2FnyHY148sphXzq+BUR83+G3ZOcr533E37hOv9/RsDBDkW5CVWKg+eOWGmwjEoPFrzpg
	m1bQVIsJkiNyrUG1nWjEBnLXimGwalXj0E9sZO27V3myZcsFEdfwYn/GOdaV7qcco2Ce
	kkQA==
X-Gm-Message-State: AJcUukfpoXXk7uz8MTi7XJ8KVmHVRAiYFJ8NZ+XJNSHmgCNOmBfJKvBx
	yQ1Ug/Q1zo0eRwT1hEErJnE=
X-Received: by 2002:a1c:1a43:: with SMTP id a64mr3982164wma.136.1548277646880; 
	Wed, 23 Jan 2019 13:07:26 -0800 (PST)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	o15sm77042817wrp.12.2019.01.23.13.07.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 23 Jan 2019 13:07:26 -0800 (PST)
Date: Wed, 23 Jan 2019 21:07:25 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190123210725.GA13509@stefanha-x1.localdomain>
References: <20190120143452.21683-1-stefanha@redhat.com>
	<20190120143452.21683-2-stefanha@redhat.com>
	<CAFEAcA9KkYC7MHquASjoghuDrvkkE_brnM6teLknj1H-waM_0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline
In-Reply-To: <CAFEAcA9KkYC7MHquASjoghuDrvkkE_brnM6teLknj1H-waM_0A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/4] memory: add
 memory_region_flush_rom_device()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Jim Mussared <jim@groklearning.com>,
	Steffen =?iso-8859-1?Q?G=F6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bPPO/oI80Wsz


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 22, 2019 at 04:36:36PM +0000, Peter Maydell wrote:
> On Sun, 20 Jan 2019 at 14:35, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > ROM devices go via MemoryRegionOps->write() callbacks for write
> > operations and do not dirty/invalidate that memory.  Device emulation
> > must be able to mark memory ranges that have been modified internally
> > (e.g. using memory_region_get_ram_ptr()).
> >
> > Introduce the memory_region_flush_rom_device() API for this purpose.
> >
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  include/exec/memory.h | 18 ++++++++++++++++++
> >  exec.c                | 12 ++++++++++++
> >  2 files changed, 30 insertions(+)
> >
> > diff --git a/include/exec/memory.h b/include/exec/memory.h
> > index cd2f209b64..abe9cc79c0 100644
> > --- a/include/exec/memory.h
> > +++ b/include/exec/memory.h
> > @@ -1344,6 +1344,24 @@ bool memory_region_snapshot_get_dirty(MemoryRegi=
on *mr,
> >  void memory_region_reset_dirty(MemoryRegion *mr, hwaddr addr,
> >                                 hwaddr size, unsigned client);
> >
> > +/**
> > + * memory_region_flush_rom_device: Mark a range of pages dirty and inv=
alidate
> > + *                                 TBs (for self-modifying code).
> > + *
> > + * The MemoryRegionOps->write() callback of a ROM device must use this=
 function
> > + * to mark byte ranges that have been modified internally, such as by =
directly
> > + * accessing the memory returned by memory_region_get_ram_ptr().
> > + *
> > + * This function marks the range dirty and invalidates TBs so that TCG=
 can
> > + * detect self-modifying code.
> > + *
> > + * @mr: the region being flushed.
> > + * @addr: the start, relative to the start of the region, of the range=
 being
> > + *        flushed.
> > + * @size: the size, in bytes, of the range being flushed.
> > + */
> > +void memory_region_flush_rom_device(MemoryRegion *mr, hwaddr addr, hwa=
ddr size);
> > +
> >  /**
> >   * memory_region_set_readonly: Turn a memory region read-only (or read=
-write)
> >   *
> > diff --git a/exec.c b/exec.c
> > index 895449f926..105ff21e74 100644
> > --- a/exec.c
> > +++ b/exec.c
> > @@ -3162,6 +3162,18 @@ static void invalidate_and_set_dirty(MemoryRegio=
n *mr, hwaddr addr,
> >      cpu_physical_memory_set_dirty_range(addr, length, dirty_log_mask);
> >  }
> >
> > +void memory_region_flush_rom_device(MemoryRegion *mr, hwaddr addr, hwa=
ddr size)
> > +{
> > +    /* In principle this function would work on other memory region ty=
pes too,
> > +     * but the ROM device use case is the only one where this operatio=
n is
> > +     * necessary.  Other memory regions should use the
> > +     * address_space_read/write() APIs.
> > +     */
> > +    assert(memory_region_is_romd(mr));
> > +
> > +    invalidate_and_set_dirty(mr, addr, size);
> > +}
> > +
> >  static int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr add=
r)
> >  {
> >      unsigned access_size_max =3D mr->ops->valid.max_access_size;
>=20
> API and implementation make sense to me, but better that Paolo reviews
> this I think. I guess we should add calls to this to the pflash device
> models too...

Okay, will cover pflash in the next revision.

Stefan

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcSNeMAAoJEJykq7OBq3PIYmYH/15i/DuXt2chEkJw81hGkwvI
3vNBDf9cw5eBSmNKK3avGgKM06FcmEaaDQ4rY9p3b+geNEGGDsk7mGeIK0pxEsxW
MaztayQfKkp157zhZJD53vYmLS7aazFi8woTzIcVAQHw7biUHlLSNwqeKurgj+Tf
3DsivU1ElOCUGX8qVvCmjxyECebUKvJtuT7d/CyW+Gwhm5r1PxWqyf5zH8rc5zRO
VJY07TxiRM1mWsneeQHwcYj+nQKqKGu1OSc5I9DfuRocsPbZpq8AKuWG5fguH1yQ
XOOhB568fGJyfhI/lVaAM/k/wYerm2KeYJD9zMF6th8OQnXxogb9GeYZv1imxew=
=0WTz
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--
