Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp205852lfm;
        Thu, 27 May 2021 03:18:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrnMNl1I5PqM3rmJ6Hcgun1CCq3PzRfeiZfrhhmkPF5H+Smh0RIM1ZlnW6eiyVh30ZHvLf
X-Received: by 2002:a05:6102:6d1:: with SMTP id m17mr1662629vsg.8.1622110737023;
        Thu, 27 May 2021 03:18:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622110737; cv=none;
        d=google.com; s=arc-20160816;
        b=JE7oAthIVs6izP+vK4HmCiEeA33LLx49C+IquR+ztAv30UXVh2L130bRw/vQ6X0VT0
         gXxuN0uTMpqe0y3lxGznx1mhZC1qZrkKW7BwuHqI8h/PTPcOasECXAGFzBdCdAYI4D7w
         6Piza5ZebE75QxeQiTuEtTlTRL8muTxWPFrOHBo3ZwvdrZ9rrpKtUkzUYh+ZnL/CQIvH
         0/PzdCA0noYuJf0vhrDZdRIAiJEVZn1TpghOutZd8bm3bARHJxoFQdgr/L5yKXdUlo+k
         DGlndz2hk+KYobk6F2oRyvp+7pnSzaZDNHh9kjou09/vTnbOT7X0VsYzL35OTHC8gvVU
         btqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=VJDRk2N4mE5R9aPqte1yrrWhIUZbH44lsuFY9hcJ7k0=;
        b=o/zwbLgur/an9XoZOiEi1CsuBI3SluGIE+LjXAr+gcjVkH8PxTORB9BDfSyewMdyLE
         XD4+DUxgO+Wl6umHpY5sK5FVqdc2Gq/TKA1QufVLYJLwM0qLRSvW16YC1cbzPf1Zc0I7
         dTS/5tV8KORIbeqZ7tSWJhzvKHla5kO8uePITGIZDaePnWSw96mFo4awmDv0FXQIys9B
         nU4NBd3McqR/YE28yJjVSJm81/aX1oVf/Nr5ZM2D4bVp8s4UZG4yE8cBZr2JmZBr82wv
         a+1I4c2oDneOEFWlnwiL7tqWISKYskIV8Wia5PimDfpKv8lmT//f/7BGQWUQyGasOiXU
         4H1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RvjdpiUt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8si665137vsp.400.2021.05.27.03.18.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 May 2021 03:18:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RvjdpiUt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lmD6K-0003aA-FW
	for alex.bennee@linaro.org; Thu, 27 May 2021 06:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmD3h-0002uS-Ci
 for qemu-arm@nongnu.org; Thu, 27 May 2021 06:16:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmD3S-00006q-QG
 for qemu-arm@nongnu.org; Thu, 27 May 2021 06:16:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622110553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VJDRk2N4mE5R9aPqte1yrrWhIUZbH44lsuFY9hcJ7k0=;
 b=RvjdpiUt2nvekRV8rOwZ6j70e0X665VTJWh1boraPEKB+HX23xANq31Xy6M6L+dA+xP6uj
 RpTvp++pw/n7D/Ve7hSdXnag8baBS4WFcoFfRAi8xg5x0EpjeoWiWvGCvBh7/LcPkSdDi1
 coFTepTsi3F1+nf9UpL1ypEYHqfMS18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-hL6Opg6JPX6HChgvfsVOzA-1; Thu, 27 May 2021 06:15:49 -0400
X-MC-Unique: hL6Opg6JPX6HChgvfsVOzA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AE1A1007467;
 Thu, 27 May 2021 10:15:48 +0000 (UTC)
Received: from localhost (unknown [10.33.36.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 252E15D9C6;
 Thu, 27 May 2021 10:15:47 +0000 (UTC)
Date: Thu, 27 May 2021 12:15:47 +0200
From: Sergio Lopez <slp@redhat.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v8 09/19] hvf: Make synchronize functions static
Message-ID: <20210527101547.xbznrg5qqs3rwdwt@mhamilton>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-10-agraf@csgraf.de>
MIME-Version: 1.0
In-Reply-To: <20210519202253.76782-10-agraf@csgraf.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oz4exlm4isl3fxo2"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
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
X-TUID: tJCJMQcZ/+8D

--oz4exlm4isl3fxo2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 10:22:43PM +0200, Alexander Graf wrote:
> The hvf accel synchronize functions are only used as input for local
> callback functions, so we can make them static.
>=20
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  accel/hvf/hvf-accel-ops.c | 6 +++---
>  accel/hvf/hvf-accel-ops.h | 3 ---
>  2 files changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Sergio Lopez <slp@redhat.com>

--oz4exlm4isl3fxo2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmCvcVIACgkQ9GknjS8M
AjX0TRAAp4BoSwjdCcDqR4jHMuiXiwDRVW+ygDu+ybk/hhxwdCPSPlNv9Fzoq6Zx
FEJtPup++EF/QV8ocrSBbwodfPMFdzQNmqrPBjEDogYP7pBJveh6N0nX/nWbQMR+
6M4yK4cSK2yyi8UnMMqiBjMeXumn+Oyw3TgOlH3reJWnGVEY43sG3zQTCXVxUNZv
e75K/njtRVyB6JnF0XTC+Wp+P6z+9DA6Yxbg0EbMOrd09wIPfiW6/4c91XYE0RmS
qtpyavn5navv98aGJfRz1IebYrOxf9S/s5SQW00EPGDYwvUXVbAhQ8SOADF67Wo1
XUozdrOuGN0ONIl6yW6kZ99laxyitsPJ1LxZaarKOoS00Hhe4jAE3Wi0bpfZv5Pz
RxS9rWMpHMeTn3FnyEqcQFSwYSF/YFz558muj1/D2uM9JLCxwMNdu/oVLJVlv9Gc
UCXEcnZOdmzrqsDS0F8GhqX7i4VtoDn6Ghr539j6g0iH+lljmzDmY14oPx5UXpQU
ojY2bNRmc1W9l+L2zWW4wnChC85Gbxf0T/HNMt1gQnmrQqqROOyEtUQcwPHNTRSD
hB/WGjkWwZdU+cM8ahknnC+pPpXCL/KkDZ6Axo8pOjUx8tITVbpWpMItDtuccOhj
LfzSm1xHHO67pcGYvZaO4yeIuHlGKBVT8S1cTe48739YFCQj1p0=
=ZpBD
-----END PGP SIGNATURE-----

--oz4exlm4isl3fxo2--

