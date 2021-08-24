Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2802388lfg;
        Tue, 24 Aug 2021 06:26:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqs/Xwm5/PJcgPtDodHImA0MFpXf4t59pw920i0Zp1yhpQPgP+77UU8DmSWRAT0GHD89tK
X-Received: by 2002:a92:c841:: with SMTP id b1mr27237153ilq.300.1629811602194;
        Tue, 24 Aug 2021 06:26:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629811602; cv=none;
        d=google.com; s=arc-20160816;
        b=y7WgHickR2JZnWo3g69MZTubENsB6Ece5zkWH/4eRA2+EZ/Up8Gc5bvrOBGbz1HgJo
         H6RB/V3bUIMeouAYnh+Ex3PbmLs8+o1DqWUKh90kMTjBO4qjzUvnnsvmjsYk4bQ7Iu+m
         C8tcVGuDu68zO05ba8ZxXbxNuWa77cbaxb/fdDxpsYjSlBeqv9FnLYd9rUPifhAJTWnA
         GBju8SezhVcetSxWWk/sPeIidVJzOqdLjssBT+3PnCwnPtlY4FZJw/eva4jNI964gLSF
         NLV8Ycq1YjByRUgPPt9uwGiTITAeUccPMmZX09zVJXABPgNAJLS1A7QJnqGVOgn7+QNp
         SVTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=69FTIuPOz3bcduqd9RNtUiDlBnmr7FEoMJmCHTIVecA=;
        b=IkRssE8XXJBLJv+DQDabyC0/7cKRXV52APT4Pi3xddZdkxg5BTLWwWJpWf2UqSuVh3
         Oj7OqqXOSlRAKOR25muCMFItKKpI3eLwOGLoRJBHN9QXJP7cLqxicTfqmN+sap1joGbr
         4op6eqWvoxC9X/VF+mmvCw6E4fE0lMZlUWISO7yB+M9nPK5Bewm8Mzbtbkfytq0YxI0X
         yg8tEVr47Jha4RZrgjviGN2LQZOODhohEseWWA6kXdZgClqd9UUXcms8fDAO7/CNgDQP
         NAVPG34CdmQNaBRAtHCBpQSxF7Y2uuU8A36wblef4a64dxejVppFXqTwWXxRYOU4c0lh
         XiVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PrC7NFHL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e11si16944337iot.82.2021.08.24.06.26.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Aug 2021 06:26:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PrC7NFHL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIWRt-0004wa-Iz
	for alex.bennee@linaro.org; Tue, 24 Aug 2021 09:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mIWRl-0004w4-O2
 for qemu-arm@nongnu.org; Tue, 24 Aug 2021 09:26:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mIWRi-0007JP-Qc
 for qemu-arm@nongnu.org; Tue, 24 Aug 2021 09:26:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629811590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=69FTIuPOz3bcduqd9RNtUiDlBnmr7FEoMJmCHTIVecA=;
 b=PrC7NFHLKsaWznarDQw18YmLEv7fDpqb30/R4Eg+voWayZEFmvAtgehY1WPDGBeYZ54nuA
 qzWVfYwm4yqKnZeOvmdfoZv7vxXyYFpJY1bg8CQdQJsPvJI/rEzvgG2D7Y9KS6/CfEQOGJ
 C8nFFbFbyUwXJBcexj3u3RY1jzQY2x8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-UufE8c1jPbi7dIfmpZpq6w-1; Tue, 24 Aug 2021 09:26:26 -0400
X-MC-Unique: UufE8c1jPbi7dIfmpZpq6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F9F98799E0;
 Tue, 24 Aug 2021 13:26:25 +0000 (UTC)
Received: from localhost (unknown [10.39.195.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E9E960854;
 Tue, 24 Aug 2021 13:26:13 +0000 (UTC)
Date: Tue, 24 Aug 2021 14:26:12 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH v2 0/5] physmem: Have flaview API check bus
 permission from MemTxAttrs argument
Message-ID: <YSTzdP19h08bamT+@stefanha-x1.localdomain>
References: <20210823164157.751807-1-philmd@redhat.com>
 <CAFEAcA9_=6n4w86gD3MHhiLeCiui9_+ePT7E2sSHdSRufUJdyA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9_=6n4w86gD3MHhiLeCiui9_+ePT7E2sSHdSRufUJdyA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pXjqXqLeBadI5u8Q"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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
Cc: David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +oBsrQr9oyHz

--pXjqXqLeBadI5u8Q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 23, 2021 at 08:10:50PM +0100, Peter Maydell wrote:
> On Mon, 23 Aug 2021 at 17:42, Philippe Mathieu-Daud=E9 <philmd@redhat.com=
> wrote:
> >
> > This series aim to kill a recent class of bug, the infamous
> > "DMA reentrancy" issues found by Alexander while fuzzing.
> >
> > Introduce the 'bus_perm' field in MemTxAttrs, defining 3 bits:
> >
> > - MEMTXPERM_UNSPECIFIED (current default, unchanged behavior)
> > - MEMTXPERM_UNRESTRICTED (allow list approach)
> > - MEMTXPERM_RAM_DEVICE (example of deny list approach)
> >
> > If a transaction permission is not allowed (for example access
> > to non-RAM device), we return the specific MEMTX_BUS_ERROR.
> >
> > Permissions are checked in after the flatview is resolved, and
> > before the access is done, in a new function: flatview_access_allowed()=
.
>=20
> So I'm not going to say 'no' to this, because we have a real
> recursive-device-handling problem and I don't have a better
> idea to hand, but the thing about this is that we end up with
> behaviour which is not what the real hardware does. I'm not
> aware of any DMA device which has this kind of "can only DMA
> to/from RAM, and aborts on access to a device" behaviour...

Points that have come up in previous discussions on this topic:

- We probably won't be able to find out the actual hardware behavior for
  all device models in QEMU. Strict RAM-only DMA restrictions can be
  merged early in the QEMU 6.2 development cycle so there's plenty of
  time to identify regressions. The benefit of a strict policy is that
  we eliminate this class of bugs for most devices now and in the
  future.

- If the risk of regressions is too high, then this API can be used on a
  case-by-case basis to fix bugs such as those identified by Alexander's
  fuzzer. We'll be plagued with this class of bugs in the future though,
  so I prefer a strict policy.

- DMA capabilities depend on the host bus adapter/controller. In order
  to faithfully emulate real hardware we need to know how it behaves.
  That needs to be done for each host bus adapter (e.g. PCI
  controllers).

- SysBus devices each have their own behavior wrt device-to-device DMA.

Stefan

--pXjqXqLeBadI5u8Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEk83QACgkQnKSrs4Gr
c8hd7Af9F81o80rbVdusZu81LGkcxEOeyDWM1B89uLqZwVSyTbRnLsFnrDK9U54A
z8kxAUey0AKLdGorw4fqgOMVmQnCnzWKqbQ3XwDog/QafD0bnJkj1hx1v2nynRAU
svCLRvNwQCnGROVZKzI+nZXKb0uHUStxXmaM8uyyV88IqI65bFNGh0NdBDErGHv0
rjxYIqiqP219Fluy4GzDLBI7/QpPMuTEVPcYkN3+OrHppLyO0pUhpx22AuEZQBoI
yVB3UECkGl4F4VaEQijgl99prz3cUEeGMGiunoKUSZ9YUwRPofpBRDmWdkdVdXB3
toNVmjshLD64LfOMXl8KMg9lvwI8yw==
=Il8t
-----END PGP SIGNATURE-----

--pXjqXqLeBadI5u8Q--

