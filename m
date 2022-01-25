Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2540991lfk;
        Tue, 25 Jan 2022 03:53:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLPUXGv5mbQjkIisf8+HEUsd21PdfBTo4Ww8lqe1Fs/+WUd1QEQd25JQkNeknAQOWcisaH
X-Received: by 2002:a25:710b:: with SMTP id m11mr29928113ybc.627.1643111600582;
        Tue, 25 Jan 2022 03:53:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643111600; cv=none;
        d=google.com; s=arc-20160816;
        b=PPKw64PTj5U2ix4ujNBOMvxinLwMD5ao9tlZv3K8+nrs7yawBTtJbYYkeALb3hJtDC
         j9SRrkxJGuXl5aD/uAihLyvZk3fAK3wy1g7267NnxSsg79om9dSK8hq2BB882USrHBU6
         Sxb+DcsCtLRKeAQKV39sydUPO3MTabSpkLLktYlUQ+uiOveyNsyqKgATNkZr8zzCh+vY
         77sWT/wzb7gwXxngMe+iuEdBUSGyA7g0ABetiwAx4uY/T9PaN9vt4psMOustXrl1drrj
         nAcg5EgyxnDaAKj+WCUnW2kiWRyr9FhlhQEKmSTPzHhBdzajRRykTb3kGCwOw5mMq+WI
         mJOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=U+eIfyh/ewtqEjai6gYYYRDZfrqWamP2Pxi2GmvL2JY=;
        b=HREY8UvSVudvbb5klgYTdWWyjgR+wUqBYfn/NF4JVYvScRFNG8qzk8EKtDD8cOlYLP
         D0U6Y59Us/tFgF8wjRe5ap6sgCgOM4vXuGaELnUAx9+bmURpkLtgEzdyz9tApLTyTa90
         b3YAXMIVmNa5e/66RkBGWso1EGe3JclINeCf4kJlf3is0CX6aiwUsrucjg1AHt+IdPNv
         nM86ObQ/yrVJRG4U3pIFt1pDac9aFHAotJZlutsnj0JljMczHHCU1hrh9YquM/aIKFpc
         fx54mO/tEIIhQk5FYo8ZwJjEyM7NuN+PKzh8sR5DIKOHfIH3zdHDQsJ9HRt6+uOcnX30
         8EGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZhCE06J0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b14si13976896ybr.230.2022.01.25.03.53.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jan 2022 03:53:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZhCE06J0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nCKNz-00075J-RO
	for alex.bennee@linaro.org; Tue, 25 Jan 2022 06:53:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCKMs-00071D-Tg
 for qemu-arm@nongnu.org; Tue, 25 Jan 2022 06:52:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCKMq-0005zh-5J
 for qemu-arm@nongnu.org; Tue, 25 Jan 2022 06:52:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643111526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U+eIfyh/ewtqEjai6gYYYRDZfrqWamP2Pxi2GmvL2JY=;
 b=ZhCE06J0uIQUk/DqBrmsseENA/ZwPo9ZLPV+EJrVIa19wu5/zVVRpgtyX5KXa5+kmMwJWM
 wkpMPpQIPb+ZJNrX8q7ZPrrhgSF2gduaCjvVL+Mdj8hf1ELbMDE2o5tXCeFu3s7Xf2zWo0
 p9xw6J2LFb+KZ7smDsoa9BPoBVIwa4w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-QEPe34kyOmGfFdR21ApBJA-1; Tue, 25 Jan 2022 06:52:03 -0500
X-MC-Unique: QEPe34kyOmGfFdR21ApBJA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D14358143FD;
 Tue, 25 Jan 2022 11:52:01 +0000 (UTC)
Received: from localhost (unknown [10.39.196.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C530A752B4;
 Tue, 25 Jan 2022 11:51:35 +0000 (UTC)
Date: Tue, 25 Jan 2022 11:51:34 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alexander Bulekov <alxndr@bu.edu>
Subject: Re: [RFC PATCH v3 0/3] physmem: Have flaview API check bus
 permission from MemTxAttrs argument
Message-ID: <Ye/kRldjGk4gWX9g@stefanha-x1.localdomain>
References: <20211215182421.418374-1-philmd@redhat.com>
 <Ye7UKJTY0D2rbJN2@stefanha-x1.localdomain>
 <20220124165010.jn3lrwk64i56u7cd@mozz.bu.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="h61V0AktlnMDhPh1"
Content-Disposition: inline
In-Reply-To: <20220124165010.jn3lrwk64i56u7cd@mozz.bu.edu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PMtXOUHcOatm


--h61V0AktlnMDhPh1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 24, 2022 at 11:50:10AM -0500, Alexander Bulekov wrote:
> On 220124 1630, Stefan Hajnoczi wrote:
> > On Wed, Dec 15, 2021 at 07:24:18PM +0100, Philippe Mathieu-Daud=E9 wrot=
e:
> > > This series aim to kill a recent class of bug, the infamous
> > > "DMA reentrancy" issues found by Alexander while fuzzing.
> >=20
> > I took a look at how to protect DMA transactions in VIRTIO devices. It
> > will require setting the MemTxAttrs for address_space_ld/st_le/be_cached
> > calls. Errors on write (store) can be ignored. Errors on read (load) are
> > a bit more questionable since the device performs some operation based
> > on the loaded value, but at this point the driver has already caused the
> > device to do something no correct driver does (as of today, it could
> > change in the future...) so undefined device behavior might be okay.
> >=20
> > It would be easier to be confident if there was a single place to
> > disable DMA re-entrancy for a device. The currently proposed API
> > requires per-device code audits and fixes. It leaves decisions to the
> > developer of each device. This will be a lot of work to fix and we
> > cannot be confident that everything has been covered since this is an
> > opt-in mechanism.
> >=20
> > For these reasons it seems likely that DMA re-entrancy issues will
> > continue to creep in. I think the only way to rule out this class of
> > bugs is to implement a centralized change that doesn't involve fixing
> > every DMA access in QEMU.
> >=20
> > Thoughts?
>=20
> Hi Stefan,
> Do you have some ideas about how to do this centrally?
> There were at least two attempts to do this in a centralized way, but it
> seems there is some worry that edge cases will break. However, I'm
> not sure there were any concrete examples of such breakages.
>=20
> [1] https://lore.kernel.org/all/20210824120153.altqys6jjiuxh35p@sirius.ho=
me.kraxel.org/
> [2] https://lore.kernel.org/all/20211217030858.834822-1-alxndr@bu.edu/
> (AFAIK Neither handles the BH->DMA->MMIO case, at the moment)

Regressions are the problem with defaulting to RAM-only DMA. There's no
way to avoid the risk if we change the default. On the other hand, it's
the only way to squash this class of bugs - most existing devices just
aren't written to cope with DMA re-entrancy.

The approach in your patch sounds good to me, but I haven't followed the
discussions so maybe there were valid reasons to look for alternatives.

Stefan

--h61V0AktlnMDhPh1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHv5EYACgkQnKSrs4Gr
c8j6vwf/Yzl44BQvpaqslpY93nKMgjVYkogi6WI/zK4YZCKUvxJrVUqbDT5lUe46
UapqAJ4J4OFfzf5+siuV8k4l9prrH9g7U/bn1qPdcXiQeT2bZHKdxUPzPih1g5o2
K8dvVxQ4AeLVSkj+pM1VuLzF08v+3Nkr967UabEDoVAaCPgfy6MOb7J0TNMrPnW+
YcLqd4H6pv9tuF0Th9ubQ3KWkLiiPbOozKspdvnZ5mPhhlY8uWbvFVpzq3fUNAaF
UUa68SOXM5hIIl7fgQxe/Qya87Elx1wXEzLe/zMPYLBl/2nU2d0qnDxLy4/wjMKD
b82N+fNcyFshrBbBG33V2eIiPbo3/Q==
=xMUR
-----END PGP SIGNATURE-----

--h61V0AktlnMDhPh1--

