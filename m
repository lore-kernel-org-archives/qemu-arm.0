Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp282452lfm;
        Thu, 27 May 2021 05:04:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYK5OU4Xpv3WrZaw5Var4B5ngbZfyEnp+BrNeoPe+xyxim5U2yv2+69y/Up8zNb3MZpUiD
X-Received: by 2002:aa7:c70d:: with SMTP id i13mr3767816edq.340.1622117071949;
        Thu, 27 May 2021 05:04:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622117071; cv=none;
        d=google.com; s=arc-20160816;
        b=mLt3vfwoDzZmY3jTtcbuBYFZPY5MQEPkXDmeO0wG0oNFfYTacDARzSnP4MW6nv6WiT
         TGt+MSrtj6Ut/VHKaJlZd31a0376yBuKIaCYNG9SZDaPpDf1hU2fqkrrbbgAVwEXBldk
         kpuDLk7gpLEedgpgyqD9WAtW0ZjrXoh7F5pB4HQuURdgysVNAZzI43Aq1IS9BmOySiOO
         WArNr6la9JJ8bxKm0OYstKaLErR6BBd1Vd1GjpzaWYjicK+u8e/Bk7O/KHnGP+vCxonx
         siYlht8LovsJJrPglzE0mVvFRKyMnGjzHp00lrO3Ube4qCkNQ1aLaEP3wtNRKgmtlnjh
         JXyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=2G71iNdPDnnxJ99LNZyrlfpsy3MBTAdwVeIBbYeskNg=;
        b=VP+YrRpr1peO0ZXAli07ps25tFfPqs8DaWSGhvbqfmkjNn7ILSanyp8YtyUbEXiOUI
         TLbc1U3xS47ILzzQBS2Kkr0BI9LzuHsNLiEhGmyIMwmiCXwgwfYoNORKDebwP5N/8Y0M
         TjPGogWxNayrTUFXum+H/Y1wQ1rBzyiIJFq08/QAoKBuKyyIJseXlNSFxn7vppMQ0PQk
         jdxqyD5BXbDBA4wLMwnn++M51+Pulu0qp7HFkJMZJ5gi53u+Zrz+UdezVFTlAUhclqhy
         xPVFIyOg/49Q7vKZl6tXcx1NL414lH88NgxqzsflfsoSk+DlqLaWBgsZ//onP9in8JuA
         Z8BA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZWfGR920;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t18si1789605edr.386.2021.05.27.05.04.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 May 2021 05:04:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZWfGR920;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lmEkY-0004LE-WA
	for alex.bennee@linaro.org; Thu, 27 May 2021 08:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmE65-0007GC-D0
 for qemu-devel@nongnu.org; Thu, 27 May 2021 07:22:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmE62-0003Dm-Rl
 for qemu-devel@nongnu.org; Thu, 27 May 2021 07:22:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622114554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2G71iNdPDnnxJ99LNZyrlfpsy3MBTAdwVeIBbYeskNg=;
 b=ZWfGR920TyCNDH9gT8gSPxU9zSWfacyjjC0piwOyLGjXhvjiya/vFK0vIxwoN7kqiU/hlT
 P+udourjNy8F8a/inPfMIDuCkff+a/+62/uN+u+GW92RgX1I/mavEyXlhgjyIHI7n6CNm4
 s0fy3kF5cBq5dszv1z6XSPgNg++3VGs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-Gd366BCbNF2KD-Yexty4OQ-1; Thu, 27 May 2021 07:22:30 -0400
X-MC-Unique: Gd366BCbNF2KD-Yexty4OQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74EA619251A0;
 Thu, 27 May 2021 11:22:29 +0000 (UTC)
Received: from localhost (unknown [10.33.36.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EAF4B5D9CC;
 Thu, 27 May 2021 11:22:28 +0000 (UTC)
Date: Thu, 27 May 2021 13:22:27 +0200
From: Sergio Lopez <slp@redhat.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v8 19/19] hvf: arm: Handle Windows 10 SMC call
Message-ID: <20210527112227.6l3rgc7vh7z3ytvu@mhamilton>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-20-agraf@csgraf.de>
MIME-Version: 1.0
In-Reply-To: <20210519202253.76782-20-agraf@csgraf.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ukllmniavdx67ftm"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
X-TUID: hh1oqpEVFE6Q

--ukllmniavdx67ftm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 10:22:53PM +0200, Alexander Graf wrote:
> Windows 10 calls an SMCCC call via SMC unconditionally on boot. It lives
> in the trusted application call number space, but its purpose is unknown.
>=20
> In our current SMC implementation, we inject a UDEF for unknown SMC calls=
,
> including this one. However, Windows breaks on boot when we do this. Inst=
ead,
> let's return an error code.
>=20
> With this patch applied I can successfully boot the current Windows 10
> Insider Preview in HVF.
>=20
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>=20
> ---
>=20
> v7 -> v8:
>=20
>   - fix checkpatch
> ---
>  target/arm/hvf/hvf.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Sergio Lopez <slp@redhat.com>
Tested-by: Sergio Lopez <slp@redhat.com>

--ukllmniavdx67ftm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmCvgPMACgkQ9GknjS8M
AjU1vw//TJLbusVSORSbhQZOFSTffwc/6fwyzPTzuvrJdhinQBqEkAKDVn0J2UCT
Ri9JgXeyCFb1VMiJD25Yr9t5gqUlDYDJdVqfYYmYeD2bwVJozEIekkRM4HEhdl3t
EgaTpJTSRTePp7pxEzDQqt7EcGPLevPB9ksieOCYag3XrBpeFPV5mgt7iz+M+I53
mpgot6ugFBt4t19MeShlAlxrS0CRejsAP0Az/ZVw+uNNqfWp6bqOV2+STDAnG+CL
hQkM/w3Lmckq2kUTVzaL3YGiER5CJ9/PxGmVVBK8smh5F8Yo/xwdCTQXUJqWRfpw
Cqre41e0w8J4Yh5KjIui3pFwk8/3p+sKMGkXPdIFjw7LppWzXJ0mFw+U+CIQxtCN
R9hKClohz7aZC7r57uOQfqQmCDu9L0zyLz6kqOT6dqHfT9URl2qBpi4A9Zb35DYv
KecflvdwkOFaigY6gNbh7eID8fxcQiEcKN62PRmfJcV+L3lTClKzO+g3RwJuKjzj
j+goFDUb4xwxHLDAERVSe8FoORvpQcfCfsizUNIUmFOTfq6LpPhXl3Me8pKfTkZ4
yzLhFuX7ScdVZVoTx94A1wetAZVtsZjdk9ApaovtMnOiqYQqiwoVkEmLfx+GGY0U
dyR9s7MkiA88MmqMQ1bFfmPRXUU9tGfbnS4qH3ILdt5f3vA8USM=
=K++j
-----END PGP SIGNATURE-----

--ukllmniavdx67ftm--

