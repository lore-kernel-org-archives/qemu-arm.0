Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp277293lfg;
        Wed, 5 May 2021 06:04:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiXInmwdjDmDTyJ+TrIvRhb//GczrSkuY7vQArjX7te4v19GRHQBqI9kZrs4TUS0Odn/Sr
X-Received: by 2002:a05:6512:1090:: with SMTP id j16mr9712539lfg.627.1620219849583;
        Wed, 05 May 2021 06:04:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620219849; cv=none;
        d=google.com; s=arc-20160816;
        b=IK4I0chf4dhk2FHZNeKGn5OeUGdbsuRoBx/KDEj8Zq79OIfg8WIUrmhiBuAfC6XcEI
         bS647J5O2Hp6/8mAW0jWNAzgzy5cgF/3E9zf+ZhcEQRT47Ig51ug8ha/jHnccClz9kVj
         QE13BW9oSBbi4RA0X197f0lIlTj4buutVt8Rpyig99sdTW+B6IAw/7JsGJiShZUQRnUE
         R0XgfUkUTxQFGfOzpc6rqkapVQGB0Udec+RORNim7QbPuipxfb2bTqcUZzBQeIlKp8c7
         xeium0O6vqKExpVN+70fHEwiMOWmGKtX8noB8zeT/W8gmeLCNHeawe5L6IG76rHHbceI
         pf+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=YehgD+pwIASgfyI6UW3yYF6cBlvBBc5sxTbCmRi5woA=;
        b=IrEVjt4rxhFLjVzZ6lN0fmseZ32mFqBFbecjldvhfeyS99LqkP/3/UzWA2yf3SVvzD
         262pp7d4hYF7t4QmbCMaj5tsa7L0Lxs7XoYXSXuMmISJnSeAF80O8aTnMGgWC32HrdoH
         CTPR7YBLoHV1/r8Kc75pq7/vPNaFH6pGmhznpppLYPOCHQIcJUZqJesB+a+9lGdWWUVS
         O8/9pu4+Iobk9SV+DPXv5L9NXlTBg2U57ohKpTrrAUuA0F5EiYavYMKPuCsXsu+7mgMJ
         FOEbbPbWeyITeh8a0qxcGRS9QLfXhF7anjKtt4rWHi4Nd1vDVHilvuZ8tixQF450AHaT
         76pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DVyhIzTx;
       spf=pass (google.com: domain of imammedo@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id r2si5231422eju.410.2021.05.05.06.04.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 May 2021 06:04:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DVyhIzTx;
       spf=pass (google.com: domain of imammedo@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620219848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YehgD+pwIASgfyI6UW3yYF6cBlvBBc5sxTbCmRi5woA=;
	b=DVyhIzTxnTTGy4MJuZVx06/nb58uii3S2nBpRcnBTh/3pmxPallHBIhL8hOwb7vZ6GwTiQ
	5WBBlo+mEeQcoLaqog6RbRMVOrDNdg7r0n9R5v22cL2xSgr6gyogtQafM0fAoGIiCz2aoR
	rkib4pHv+GggKEGEAjhcXsORSzClPFg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-pJxdpgG0OW6qIC7A94m9Xg-1; Wed, 05 May 2021 09:04:06 -0400
X-MC-Unique: pJxdpgG0OW6qIC7A94m9Xg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF9C0107ACC7;
	Wed,  5 May 2021 13:04:05 +0000 (UTC)
Received: from localhost (unknown [10.40.208.61])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D5352DACE;
	Wed,  5 May 2021 13:03:56 +0000 (UTC)
Date: Wed, 5 May 2021 15:03:50 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, Thomas Huth
 <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>, qemu-arm@nongnu.org, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: Re: [PATCH v6 12/12] qtest: Do not restrict bios-tables-test to
 Aarch64 hosts anymore
Message-ID: <20210505150350.2e416d9d@redhat.com>
In-Reply-To: <20210503211020.894589-13-philmd@redhat.com>
References: <20210503211020.894589-1-philmd@redhat.com>
	<20210503211020.894589-13-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: yowCqLSxYA7I

On Mon,  3 May 2021 23:10:20 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Since commit 82bf7ae84ce ("target/arm: Remove KVM support for
> 32-bit Arm hosts") we can remove the comment / check added in
> commit ab6b6a77774 and directly run the bios-tables-test.

However I no longer recall what exactly was wrong with TCG,
the later commit adds comment about broken TCG, so I'm not sure
how it's tied to the first commit

=20
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  tests/qtest/meson.build | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 0c767389217..46de073d155 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -175,14 +175,13 @@
>     'boot-serial-test',
>     'hexloader-test']
> =20
> -# TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-t=
est unconditional
>  qtests_aarch64 =3D \
> -  (cpu !=3D 'arm' ? ['bios-tables-test'] : []) +                        =
                          \
>    (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-devic=
e-test'] : []) +        \
>    (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-devic=
e-swtpm-test'] : []) +  \
>    ['arm-cpu-features',
>     'numa-test',
>     'boot-serial-test',
> +   'bios-tables-test',
>     'xlnx-can-test',
>     'migration-test']
> =20
