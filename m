Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2622097lfg;
        Tue, 24 Aug 2021 02:07:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzb4kbfwSyAXE2PEI+CeALDEKgUcchcQYdQgjtyDDGdZVkd+ZiLGRA6E4SgKHHmVv9brksB
X-Received: by 2002:a05:6e02:506:: with SMTP id d6mr8449501ils.141.1629796061956;
        Tue, 24 Aug 2021 02:07:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629796061; cv=none;
        d=google.com; s=arc-20160816;
        b=uUFuMkdPy9UXtHHSOG8yuo7DHlANkNSwo35y+6JdcauQfcZmD3NI4Up9BWD1ZA+77j
         bqNgWshVzJ8HZfp+YnB1imy+ElRVB45KG2auyDb5d2wGTk5NuMb0Q5T7k9BxogeRh2cj
         XsYd02sFT/iS9PAFAUJ3U6BusvbYMgHaceSS1DyoE/mq0BJY5SvYP67iRPFg3MN9922R
         +JyOvaha33gvgWdmutvnn5mvRlmN7sbAqxdVlutbGg/XUwQtw/HCioBomSgdMRPNCwCR
         YB81R/RCPKtGWWIWJN7J7vMGAcz9716tbkKvE60RT2d3v+7wo0t+2nkpMqAnvdajRjNr
         P5Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=NoGIbR8U2U+cUauL95m1is6dX01YvdXa9n9bJMVPXDk=;
        b=ffD6tpTujk1Z0TcATRawIpY1+J5PSiCLRPIR8qqJa3fU9yMN4THok39fMStNwteimD
         9nIfACNTs6KVvZVgJB2XH8dhvRjAPLjUNF0q0+6jsNQRC7GpCXYqUSgUs6NQLlBa7qNq
         cxO1Bi8ooCIPnrqsxHJar9UjALpe1o4rhuAwwkxvxQ01tuOThNZjBcJnNJ5sizrfDCVE
         wKrFF65IfS80YHzp7ZUI1/0IB2ltdp9Kf/5YXFDDxZ1zUniBdeltW07YwvenNgffkzwC
         Bk+0P814gPkPUyDjibTCEAlcec10ZleLIu1qbt26vcpg7q6fgb4ijYXopCbUzOpDOXYs
         S1Iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=K6V3Q8z0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j12si13754888ils.66.2021.08.24.02.07.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Aug 2021 02:07:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=K6V3Q8z0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mISPF-0007GH-A2
	for alex.bennee@linaro.org; Tue, 24 Aug 2021 05:07:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mISGS-00014g-Hj
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 04:58:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mISGQ-0002vu-MF
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 04:58:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629795513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NoGIbR8U2U+cUauL95m1is6dX01YvdXa9n9bJMVPXDk=;
 b=K6V3Q8z0Zc6dDP2ISqIn1YB9DEYr6Q+UbV9r10H5hbGSTQy387U+W87VZhkSclPKVI2ndI
 r05K1zMBotUJHZA3qX8s4Xodv+ASE17ZMHjHXeqXDBYS/AVgQhfrivtfKoAjzrLc/oHmhH
 r89A4nkN1Vp/tJ8xilEDnInbz7Dv10U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-IPocm7q_MM6Pm4a-swnSgQ-1; Tue, 24 Aug 2021 04:58:32 -0400
X-MC-Unique: IPocm7q_MM6Pm4a-swnSgQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2F9E190A7A1;
 Tue, 24 Aug 2021 08:58:30 +0000 (UTC)
Received: from localhost (unknown [10.39.195.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6672617D4E;
 Tue, 24 Aug 2021 08:58:19 +0000 (UTC)
Date: Tue, 24 Aug 2021 09:58:13 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH v2 0/5] physmem: Have flaview API check bus
 permission from MemTxAttrs argument
Message-ID: <YSS0pW4TRyBD+kS0@stefanha-x1.localdomain>
References: <20210823164157.751807-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210823164157.751807-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5OhWnXO8jyPE8m0L"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S8p3cTXjVmYL

--5OhWnXO8jyPE8m0L
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 23, 2021 at 06:41:52PM +0200, Philippe Mathieu-Daud=E9 wrote:
> This series aim to kill a recent class of bug, the infamous
> "DMA reentrancy" issues found by Alexander while fuzzing.
>=20
> Introduce the 'bus_perm' field in MemTxAttrs, defining 3 bits:
>=20
> - MEMTXPERM_UNSPECIFIED (current default, unchanged behavior)
> - MEMTXPERM_UNRESTRICTED (allow list approach)
> - MEMTXPERM_RAM_DEVICE (example of deny list approach)

These names don't hint at their descriptions. I wouldn't be able to tell
what they do based on the name. I'll think more about naming after
reviewing the patches.

--5OhWnXO8jyPE8m0L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEktKQACgkQnKSrs4Gr
c8iPLQf/dmL4T7uYshHaitF8R62w+xCEOOpgV1b6NUkPwyhi2e+TUfF8N+Jct5kU
xh3wCad8GCjuGNz5WLuzAAXctQ/0XoJII3xuSxanVPNJ05kox1zHsF5uSp3bir5N
VIoA6JTr2Wh1CM3rONvLCVsPnJe1HiinCsOjnlUSpvWv3rIg3KHpxg6/IozMLbL/
Pq4TabfS7eOI4UN0hvEmKFwypdYxhs4TcwX4HgmkBqfk2nowSQhRD4xdNv2+0WTE
AzPawP7DCM63kiVJOmXVOIGnLKMb2Oym+hdnMtHG+NLy5GW5kV7ZTkHVkvV2di1F
MK/GizlAFQ+dZH4XzhRAru5NiY0hkA==
=OZQ6
-----END PGP SIGNATURE-----

--5OhWnXO8jyPE8m0L--

