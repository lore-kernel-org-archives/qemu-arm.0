Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp199266lfm;
        Thu, 27 May 2021 03:09:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkgoqxdI45KrGmuVskeR8OfDyaDOSWt7LEvAPxSfnbSZURKmdh4e1ysSXsiVXDD+lRDmAd
X-Received: by 2002:a02:688:: with SMTP id 130mr2807675jav.48.1622110185746;
        Thu, 27 May 2021 03:09:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622110185; cv=none;
        d=google.com; s=arc-20160816;
        b=AAxwLeKNnLHoUAkRx8GfWeUBnYLS+8IDzI4NjGxe1kq/HIi+Nn7EfKxF7tSmiNTjLC
         88+H65QrcpcuGG8e05dZ/8WxQcuPr38U6GNxf+UmEnOud2PTA6YoGLrDbfPXag9uoG4g
         hfPupxlrbcm4bjlt6TqDA7bwLj2npKhMmdcmoEsNYC1uT++Ymj0HWZCQg4YOfywrsio5
         moAKbJA7aCB0MrWeJl5pWQDWCmYpY0OJjUMZMMB1TjaYz8mc+CrV0CaI5jIkYtuLTQ4q
         VnRaqQP3FH6pVQGMHXgy31+WQQAnhWValushxV5yijoHcPH4Gz9048VyXnPgU3PXD6tw
         SdoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=ZwsqPxCdRlhU7queBFk8L5WZ/Aztq8lsUpB8L7GkDZo=;
        b=EcgsExBl/Al8SpKjAPrzbdvFcMAhu2B7XsDKrB4aBFAQ3h4XxYbROOvb8EaKtoWJ6m
         8cTPDcB1ieY0R25zCUZUwVvZkuh1G8IxEYz1CHCF6rbHfDfHuxsiaM8b8v+HIqlqX/OH
         KCzqf+e9UHtUqiP32zH3HpdDWxJnIsiJ3bYBJ91tmWXb26kSlggIiThbPtJw0VEoMehz
         38Lzw/SAnhyfa2H5txqXU9axb0aJeuEaquAkhiUViDdh8Pa+SjuygjZcUzlY9VriUYLM
         l85dn7OkvpXsyya3J1CPUtcwYDYOnkowu6X/SK/M20BbPkSTRQKYB5v0QpNIjCfxq0ED
         2E9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="MbZ/vuEc";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h17si2063058jas.28.2021.05.27.03.09.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 May 2021 03:09:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="MbZ/vuEc";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lmCxV-0006UH-1n
	for alex.bennee@linaro.org; Thu, 27 May 2021 06:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmCsJ-0004jb-8j
 for qemu-devel@nongnu.org; Thu, 27 May 2021 06:04:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmCsA-00024V-28
 for qemu-devel@nongnu.org; Thu, 27 May 2021 06:04:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622109852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZwsqPxCdRlhU7queBFk8L5WZ/Aztq8lsUpB8L7GkDZo=;
 b=MbZ/vuEc6t5BjI0ws/Lr88DVbY4uoSeZVhn1rgfpFoqwgPB0wyF3wmDL8v6+8bhnZwTKaf
 TbtESmFvdr0+cKFbwfqzZYhSdfxv0voOzhUgd3+F3bm4EMCFrdZb2RGcX5f3k2U9N7CDEr
 HRbvVjQWfovK+LguG6/GP0IpTrK5Lvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-BtmYOO1lMhSil1QTDnK7rA-1; Thu, 27 May 2021 06:04:08 -0400
X-MC-Unique: BtmYOO1lMhSil1QTDnK7rA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D75AB801817;
 Thu, 27 May 2021 10:04:06 +0000 (UTC)
Received: from localhost (unknown [10.33.36.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FD6B10023B0;
 Thu, 27 May 2021 10:04:06 +0000 (UTC)
Date: Thu, 27 May 2021 12:04:05 +0200
From: Sergio Lopez <slp@redhat.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v8 04/19] hvf: Move hvf internal definitions into common
 header
Message-ID: <20210527100405.ryobfe4fqyzgm2uo@mhamilton>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-5-agraf@csgraf.de>
MIME-Version: 1.0
In-Reply-To: <20210519202253.76782-5-agraf@csgraf.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wxpz6xsz23jv4pmk"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6cMovHp7gyEC

--wxpz6xsz23jv4pmk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 10:22:38PM +0200, Alexander Graf wrote:
> Until now, Hypervisor.framework has only been available on x86_64 systems=
.
> With Apple Silicon shipping now, it extends its reach to aarch64. To
> prepare for support for multiple architectures, let's start moving common
> code out into its own accel directory.
>=20
> This patch moves a few internal struct and constant defines over.
>=20
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  include/sysemu/hvf_int.h   | 30 ++++++++++++++++++++++++++++++
>  target/i386/hvf/hvf-i386.h | 31 +------------------------------
>  2 files changed, 31 insertions(+), 30 deletions(-)

Reviewed-by: Sergio Lopez <slp@redhat.com>

--wxpz6xsz23jv4pmk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmCvbpQACgkQ9GknjS8M
AjUA4A//dQHi+yXydRQ/hTuXrYHcAQ35utY+TsqU1mAcTPKaxKSBDwx358sGh18G
CKa6jlvQwq72lzrY6bVY5OjT3LCmxPJtCZ7bqUz0t3Ib4NDKAMk58E7DqB4+RwCP
2x0nFNvnQNm+WAHQyIpwhxEaqOaBOulJySn4wyAtNghkbV7yWNeAAe+rCVSbbYDf
IN48KklF2G9jE3wm4tFT9wcFHRWCTMpm+/iINN+MQaboCu6ZHW+GtF2a/cR9zu0P
8UNuezxHGT4nfHF26DErtQN2kqLHM33ND1htVM/oxl7icB6WC1ERzJdahqOuVnBt
WcwV25EIEZ2xpMDeJQKQYhAgQ9XZ1uk+OrxEcr/aSsCjpGIbm6h0CGHZfOLaOh0D
v0deD70rI62mIm5AEXGZAJtpw6GqFSxueKdVdw/R01PvTIirmzoJuAsqcSpwrK49
7aAMoqDCpFlsi03nwiz9QzMive5erjn4QPAJN3DjRBrWwrLpz72yaeYXv0oTwDHN
+kFOHIVYNBirpatxsHPSAbmhGNEUyKoiIiKy7qEU74LZRo3gGW96NtC43ANfQTAk
p1T8I/XzSuWMc1SmHbuuRHx61zPXO0XeiSV5PKike8j2n/j18OzNA9cp+Ji2NpjZ
RQjXiFRV5db9I2l3TAA8DJXRzxFbTdAolAMkzeSwZBEWBm+9AeA=
=4O7u
-----END PGP SIGNATURE-----

--wxpz6xsz23jv4pmk--

