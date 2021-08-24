Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2784883lfg;
        Tue, 24 Aug 2021 06:06:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzneZKS6X0SIRS9OGkqHgV3E6e7BudfOydNopsHNflsrMaTFVHjUqfpFecp28cfjdwht9Ag
X-Received: by 2002:a2e:2f0c:: with SMTP id v12mr31885526ljv.381.1629810370382;
        Tue, 24 Aug 2021 06:06:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629810370; cv=none;
        d=google.com; s=arc-20160816;
        b=LE6cSw2Bed3WOYu8OqsKKFPuZhR33Asn6amZlwO8eSY9y4c5FCq1JgAlYqTSYicOyA
         aSygGYUnm6LTtCPwe+mLSh9as0hlMhFYj21Koay6ewUiqJ5D88GkzeV9G6RgtScgj/5T
         5iF3O3pR/kypHf33EhW6SKRhMtzgvkzX040dmWacxjgEJ7vBf+8qmo+ijso1pXEJL3Ty
         IJ7/ajlrL58Btnkg40zU5BQ5v110BnzAcBbFzVF8XcLUP3Li/Jwr+qXHu1eNaZ5aP15M
         BC8pdOgdOVI/1r4FcPcjt7MFMZQPyAKhFze/yrSZt0k2CCyQtyNeSNwY7KZut6ZY2pGA
         Yw1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=4PrmFL1ihtrUHDlNhmX11i5TS/sP6IrUrgIDk+ny6Jg=;
        b=JC3EHPZE74u8QOS8k8Nn0vI7SZj1PYeL0pT0pCaoRX0V1o27bhTk8XKcPwWdYFwjed
         cfJUUkHLEL4KK/I1ITSu7gx/7JBpj2Udgp1yYjvAKsVX966UnvEDcoC2VnBMtSQyjkOH
         aw+kr56AspZKNnaNKhHbEdVb4dh6GrWdJW7OZhtuByiQLlBLoHugLNWsD2GtPrAgIEso
         k5EzfZa1YgXr44WWu2q8YqGDyETFQKJo33p8JwUqPulNEIq5s4yXVFWWRw6opVaT1UpB
         bYPlFjsYNcpt1SgZlFaYhki2/gFbjq7rT+CFlL75ZzzVH2LqxjP6IZj2BaQUIYsLJg76
         KKxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ViBkGBaN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z17si16883020edb.229.2021.08.24.06.06.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Aug 2021 06:06:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ViBkGBaN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIW81-00080r-9d
	for alex.bennee@linaro.org; Tue, 24 Aug 2021 09:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mIW75-0006aa-QD
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 09:05:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mIW72-0001j9-3m
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 09:05:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629810306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4PrmFL1ihtrUHDlNhmX11i5TS/sP6IrUrgIDk+ny6Jg=;
 b=ViBkGBaNMe4SyuabjBZZIqNl5RZEYkO1T3bkr8hUHaADk6YJBVKvQ2zggHGyGnOUGvFV+O
 KMeoRP3j5VYlONjOuk1ljpu+fnvTBUSkifgdpSbDn/ba74wrmB2yfcF4vFoGmNn8FdUNev
 LNvs28cBsH9LYTzJVs+DNoi2QeCd7GI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-YHM5V6VqMLuv9reWaJn60w-1; Tue, 24 Aug 2021 09:05:05 -0400
X-MC-Unique: YHM5V6VqMLuv9reWaJn60w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07B661853024;
 Tue, 24 Aug 2021 13:05:04 +0000 (UTC)
Received: from localhost (unknown [10.39.195.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 558A269CBA;
 Tue, 24 Aug 2021 13:04:52 +0000 (UTC)
Date: Tue, 24 Aug 2021 14:04:51 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH v2 2/5] hw/intc/arm_gicv3: Check for !MEMTX_OK
 instead of MEMTX_ERROR
Message-ID: <YSTuc6l8WX5/goDz@stefanha-x1.localdomain>
References: <20210823164157.751807-1-philmd@redhat.com>
 <20210823164157.751807-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210823164157.751807-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KF9luxG1PvGKumvT"
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
X-TUID: 7rlSzxC5C1d9

--KF9luxG1PvGKumvT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 23, 2021 at 06:41:54PM +0200, Philippe Mathieu-Daud=E9 wrote:
> We are going to introduce more MemTxResult bits, so it is
> safer to check for !MEMTX_OK rather than MEMTX_ERROR.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  hw/intc/arm_gicv3_dist.c   | 4 ++--
>  hw/intc/arm_gicv3_redist.c | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--KF9luxG1PvGKumvT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEk7nMACgkQnKSrs4Gr
c8h7JQf+LsHSuJ3o7bIqDNYhSTquzMJ2yHcK5qaVw7I30ICPao7joYWcdwAhCUoT
HyEhGEqCDX20oqxowUFYBqZ9jQHtLxO5A9Mrky6OXPLBbKvDDwLuWX2NROqV9EHZ
xVvwy77bQR+i710WzCKkp1xE2f59pUjgYzzbNhsjfbMdxYDPO4VKAPJi0jYl4srf
Ku4LPABx6GGIIwRYQE1eAAv9GSvFEMaynQGCzYOSdCFNZ+9fR7pDsuXGyZwsE5uV
jfUZYTXX0KkWtkH+zDQyaO82y3yg/kos1ayZKVJf+vyhu9Q7JQVIqwtaV/6WzkHW
FO1MA9KsO29M9L/0PmXJO7wlJ1j+RA==
=sPOy
-----END PGP SIGNATURE-----

--KF9luxG1PvGKumvT--

