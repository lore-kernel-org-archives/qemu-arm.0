Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp198493lfm;
        Thu, 27 May 2021 03:08:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIekolB2STlveVDNUKuVMKZV1W0TrPXap4qRN1DdGSsbqUHa+l83pgCOM82im+nbT6yaAr
X-Received: by 2002:a05:6122:1799:: with SMTP id o25mr1214090vkf.23.1622110124235;
        Thu, 27 May 2021 03:08:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622110124; cv=none;
        d=google.com; s=arc-20160816;
        b=XNA+mlWle36bJf14sX22HwEk4h0MX/9VUAfVeQNx6Rj6T5xEkeBXhmkKI841RVjopp
         PR5joWESEfSNZkCLQOGHm/HdR3GDHOln9jb1bSC8bVTrUp+8LQ33qnQUnDwgJ8dJPglM
         hcevWfq147c7MX62ua0h351d8Eb0Qfa7Hp+657Wq7q8AP18UbAIq8cgfrot83NnTZFct
         qJY1fs88udexCTO6/tYJivgtUyeF9h/AB3mJCKPvVejoQbkO9Slg1yryluxg2FreFSy9
         s7i2c1DrhlARBjCdpS54MR5IjMWyAT7M2/zThZEJSUdR4gGytOo8iypp7/8aqTn1r53A
         uEyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=uvg7nXCISc4I3faI0JMKo0LIlkbj6d9b0aMjA5pXJy8=;
        b=z43mqgEZAXu84rIOJgvLYXee8MDaBAa405d0lc2vYKZm1fPGisLrZgGq+nafur6xk9
         ItW/EQV26LjWCOwu+CwgO6WjRlScXIjrD4YSl86xiElP/+7h3q+XmYj2h+K2VoB0J52e
         Ho3hK7IzjREHfGaSNpk3yI7gVbvcloZsdLu4uK9iFLtNa0FF0COCyiM6LSmwT2yTyHX/
         X7+VUhKCxl/IvNYPKThhxidryo1xfQ8PlNtlWRfskQvO5icFzJ6CVzYOK7c83puT6TcI
         VWE4jtgAV7JMnxixvDrs4Kls8QgN7tTngLHpdGh0MHA+EXFDwu2Yzhg8ZVdL1HGz2ZJn
         +QRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aWZLi2PV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15si582443vsl.130.2021.05.27.03.08.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 May 2021 03:08:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aWZLi2PV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lmCwV-0006j0-Fb
	for alex.bennee@linaro.org; Thu, 27 May 2021 06:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmCvr-0006fb-EF
 for qemu-arm@nongnu.org; Thu, 27 May 2021 06:08:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmCvn-000439-PR
 for qemu-arm@nongnu.org; Thu, 27 May 2021 06:08:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622110074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uvg7nXCISc4I3faI0JMKo0LIlkbj6d9b0aMjA5pXJy8=;
 b=aWZLi2PVPEXpluoO6FQemYfVMTMpCdXgrwHYEKhz71wmE3Di23NW3ySYApcMeAS97eRJvZ
 pzVkTc/Y2kRGeDgObM03uWKqitDTXG7sL2AoLCDCWtk1a+vIymtboVJqjWaTj2UQhYvZec
 XyEs2IDOaWndQdj1TRPD1p/v9x5Lbvw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-DfBMSZATPYen5L4mnssQLw-1; Thu, 27 May 2021 06:07:52 -0400
X-MC-Unique: DfBMSZATPYen5L4mnssQLw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 079FD8042CF;
 Thu, 27 May 2021 10:07:51 +0000 (UTC)
Received: from localhost (unknown [10.33.36.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85E6C1037EB6;
 Thu, 27 May 2021 10:07:50 +0000 (UTC)
Date: Thu, 27 May 2021 12:07:49 +0200
From: Sergio Lopez <slp@redhat.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v8 06/19] hvf: Remove use of hv_uvaddr_t and hv_gpaddr_t
Message-ID: <20210527100749.mqzejpk3ar6kad54@mhamilton>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-7-agraf@csgraf.de>
MIME-Version: 1.0
In-Reply-To: <20210519202253.76782-7-agraf@csgraf.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qdyrzhgcu3pmbal6"
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
 Eduardo Habkost <ehabkost@redhat.com>, Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wPxYGZEhUV1g

--qdyrzhgcu3pmbal6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 10:22:40PM +0200, Alexander Graf wrote:
> The ARM version of Hypervisor.framework no longer defines these two
> types, so let's just revert to standard ones.
>=20
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  accel/hvf/hvf-accel-ops.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Sergio Lopez <slp@redhat.com>

--qdyrzhgcu3pmbal6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmCvb3QACgkQ9GknjS8M
AjUMaxAAr8487g2/PBA0hY4ICDMgefgbO6E1uDGEUEpwACsMCV+taQnCcG7pDH/f
MYKnWX+aQtYNhnKVAcSxBHZZhzbvW8aSIN4zGBgFJGEGzXhEPiL5DogIEKhPAyff
LPBpYYUQKT4HS1kZYJXgQgGvv9NYnUPLoCQNm5Yxjpdp3sqO1ukX3ynHGVTEhuwZ
kfKuQCfRvcdxxPVTwZzFlNlBCgpGdG2bCkZizy7v5fkiaB6ZOsCi9RF1YcUG3kQ5
lz/PfSv04Fa+yhJTiWMM+p23AAC4eO9EAhjATnKWiIO3iPqXWMVdsQEdzxLZGqgv
nuy7jUZR7BBqVoISoNobil9SlzPPTpj132yGDI2NCfUieY+ycUg2AOl+72TutnqD
rEdmBqTG4e4nA9EU6bD2az2W9Cah+QzfQ46qPnfNMaZAxBdS9P912Cr185W2E8M6
Rd0kdp8SBXW5XXrcQdTwjsXUQUylxmVSJ7y6LDRxkYUAjuwZQPgJD7zBch0rwajc
qZtxhmo6HUz3wv4P+a28hT4ZZrH6F2BgKPGSZqre2S4pCaLjDIjYDE53yIS1FDjn
GcOc+JsKl43SODsAu9EHSHm3BY8zpKVsP5UNmwZwpdLqm41lYNq1wk8lx8RF23r6
btIvE11SmD1ex9ALZasy1/dzereqZQsK0A+I7Vgvx/NGYeiJ9Gc=
=t1J9
-----END PGP SIGNATURE-----

--qdyrzhgcu3pmbal6--

