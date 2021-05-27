Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp207770lfm;
        Thu, 27 May 2021 03:21:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJFaRE2MQguNzmajF1kSDxPwNiUR48RRlHSWn9j3PcAu5K4UHYXOf4rBxCS5PX0VmSdkEU
X-Received: by 2002:a9f:37e2:: with SMTP id q89mr1455703uaq.24.1622110900778;
        Thu, 27 May 2021 03:21:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622110900; cv=none;
        d=google.com; s=arc-20160816;
        b=JzgIMVLLU5ZY40/YbW7edOt/CveL2OHymD4sHzgGPSiZK8lWF2tcl0WBoa/xz+uEMF
         zfeFT9qRpsJbMnAhThvho/Up8vxexTTGVoUWan65Rnt9Etf6uCzcYk7F1mF4672d4Iz1
         /SEqAPUqdXpgK2gA3T64oO8GssGX57FsvDJPQwxdaAm1aVJSTuQwtgO7r0LURgqbTqXN
         y7spP9A6Ohe5SX/TnneGGkKgoO82fZdAia1nfctVbMLmfh9QqysAA5nsYzKLl/p69C+n
         3HM1iZo/sWPJSljz/Nml2HdTh9DOcP91229ZolLNlHnuRAaSYE9/iAdcXjvV78q757yP
         Grzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=KjwB92f2CMT8BZES5oGOzNTRPaGE4H/yaBX699nCcJo=;
        b=TBlu+XFIcl0j1pjFjbIInI+e4f6WUFl9cObrbcDBK6ly5qsbK4R0uNXrNwKHNKiXJp
         idJQlAqaorvCvcmOGab2axJmzUGXY6CoIYzjVGuowRC3crNOoGp/oo7kHxEgel4KaVVX
         3rDYf/GTYoc5PZOF7XrJA1ImInqU8PNasUOv+Nm6FnrQP2qoHFUcelFHf2GFykq8XAyt
         ruTFMkMOyaBILndPL/lEKCm/Tk0yGsJDlX/rzsnWxYsGb4iYleQXrJpU6DUBCL4rcFr2
         vYcL+3w/kMSBl06Xsaw+Cc8KOttjZa3CB4JS9smeDvjbCUApEdsRzOcetBz5eDQuWtQK
         8nEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gaxgHD5f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5si613515vsl.391.2021.05.27.03.21.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 May 2021 03:21:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gaxgHD5f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lmD90-0005zP-L3
	for alex.bennee@linaro.org; Thu, 27 May 2021 06:21:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmD2k-0002PZ-D1
 for qemu-arm@nongnu.org; Thu, 27 May 2021 06:15:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmD2h-00088J-TZ
 for qemu-arm@nongnu.org; Thu, 27 May 2021 06:15:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622110507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KjwB92f2CMT8BZES5oGOzNTRPaGE4H/yaBX699nCcJo=;
 b=gaxgHD5fs0RLe9kQlwYbLdQDhsKp94wkIpQ4PwGezpvjhehvayIXzAfpJgVmZ2BjqsfkGM
 Plztx+cVzyuwY+ojamA9Ll1UUsNhSKjU9ETvOdXnPr0Ijqk0b5wwYK8mVH9Dz4hCV2C4xn
 g7kSPfG+06orXFyE58vw/bLgI4A+fyM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-sTlFy-m1PNavsurmYufgPw-1; Thu, 27 May 2021 06:15:03 -0400
X-MC-Unique: sTlFy-m1PNavsurmYufgPw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE6761007477;
 Thu, 27 May 2021 10:15:01 +0000 (UTC)
Received: from localhost (unknown [10.33.36.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60FFD69FB5;
 Thu, 27 May 2021 10:15:01 +0000 (UTC)
Date: Thu, 27 May 2021 12:15:00 +0200
From: Sergio Lopez <slp@redhat.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v8 08/19] hvf: Use cpu_synchronize_state()
Message-ID: <20210527101500.l4nhdpysi25coxqi@mhamilton>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-9-agraf@csgraf.de>
MIME-Version: 1.0
In-Reply-To: <20210519202253.76782-9-agraf@csgraf.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tmhoscrdbp4qigij"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: iqDcbOdZzHGz

--tmhoscrdbp4qigij
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 10:22:42PM +0200, Alexander Graf wrote:
> There is no reason to call the hvf specific hvf_cpu_synchronize_state()
> when we can just use the generic cpu_synchronize_state() instead. This
> allows us to have less dependency on internal function definitions and
> allows us to make hvf_cpu_synchronize_state() static.
>=20
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  accel/hvf/hvf-accel-ops.c | 2 +-
>  accel/hvf/hvf-accel-ops.h | 1 -
>  target/i386/hvf/x86hvf.c  | 9 ++++-----
>  3 files changed, 5 insertions(+), 7 deletions(-)

Reviewed-by: Sergio Lopez <slp@redhat.com>

--tmhoscrdbp4qigij
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmCvcSMACgkQ9GknjS8M
AjXAOA/8D5VjT2dHpL3EHeHPTifUpcVaO4UaAMRI92wMAXdez5hZ8EL5Qvy1jvc8
Kf38tqQKcoFE80UKBoBIBRLH7LnU+6yJ3SoyD6irsZo7/zjQZFfY5Riiv44kNx0k
0UekwrpM8ZyBY6WRErL+N6JOq43PxOC7qrWRJHIA/HuSlkt67bwjcdUy0O9F1LWf
F+TCPmpfUEJTWsPOLGf1QkhmajFSehv7b+PZyRn9EO1Q4MxHAW/Agi4gAJK3CuZU
AbMcIhFvA19LveWJDrBs2ADvCVefPa79ccs+DvgW3td0rbNTnDrdNXKNIJe22Ydk
FW2541PdOnX9+IBpOWK9a1Kk05GQRHcBAqSY8qanR8zMw0Dd4X3Rp19E/Or/nd2E
uk9vIszKeJSaaCqOs6aQtMvE2z9mJYUcHtjVZje+qjJod2v0EPacRdJfoYyOHWOF
53S7261XC0DjXeI1iOFkb9ThGjc2avnA9Ily4v32UEYqubp1ddWSSU/8y2BCKpkX
ipg2nVWjU1ngKfur9F+uTVfLb6g0C+QvXniWDgGlaGXOGnpkw9hXP1FXQrl3MiyD
qFy3YZtQMsmX9dFPSMzAPP/TfiSIKRzhfGVyaCbHwJyDMHyUEzxOOSNfD3lG6Naf
XwhLEZxXqvJs2LHkKkcChMTS9gIcS3FFEJrRPO6ng7LMXdJb2qY=
=mfm7
-----END PGP SIGNATURE-----

--tmhoscrdbp4qigij--

