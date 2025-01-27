Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2672496njk;
        Mon, 27 Jan 2025 11:43:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUDG4jD2MMp/3zKyaa8xNM+S5+MQWQncrCob3crEu0w6ldYbDXaOINjsk5Y/KE2tniH3RVQ4u6tX6Yvrg==@linaro.org
X-Google-Smtp-Source: AGHT+IEfDL2wMN32ASqAC6I8yWc7LjimHW3G3wBwp4qmj3QPvBZgy+lIpdvdEvZmTt3PXrmuEFd9
X-Received: by 2002:a05:6214:48b:b0:6d8:9872:adc1 with SMTP id 6a1803df08f44-6e1b2234c6amr710051166d6.38.1738006985437;
        Mon, 27 Jan 2025 11:43:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738006985; cv=none;
        d=google.com; s=arc-20240605;
        b=HxQAmWTjpT3B2dWp7NrrCkwdllrsrm1AZLZFoqYYZxF78dD5uPkezxu9yFnftjBbf7
         db5gZBdcS2cVpF94W60AXAx1m1IjybjXjNwZ0CyIck4FeEcWLCwIPP3tvaNSh02Wwegj
         LcGmCsutMvFbR/gxIPVWnYuwUvhTIPFW66Ou0PZfSwS5sSQKtivv+17yV7AHX8xaQ5lA
         DljSoTD2R1ipbQY0l6V1A/a9T5122NsN7pAQNfYWT61akqm0dpl57DImAGcZs5xDBVcN
         aRCOvXR3MC1AtYVDdvNgms6PaeWf3ncBdG8tkn1vfJr+AtoWKEama6IIByTQAVh2G/Jp
         k6hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=jbFpEmHZcsF2z21tixjEGxHcXLsMehq8qscy4oPSfwk=;
        fh=9T4YSpaK/rxjmZDsTWbgbb2dmlUmE7wRLhZE68qq/Wk=;
        b=GQluzqFiBUw8sJ2HtJO5eTKuREBrQsHYXVCFvYUvR6boSocXszdCfRwqLgA+2UaNCs
         xwAt2+/De7+oKsOjb6DC86z0F5paET8jnSKEap6SaGNDAOJsN+XhTJHdchnfS+2DLlas
         APfRiX6HNk7RNTAcvxUpaQE/7UYG+jGM2FrPrD5D4l98bsodEKihLraJu1lsbrmt9Ism
         REq6J7GaAKqVnC1+nwH+iNxtQ+5gqj3a6g46CRlldBQetoiKU4GVobZHrEg0hNUi7d54
         CTdej/MtpfSyb1Y1EYS2FTcxjx8nvm4rfuAO08raZmkQsX2fsV0hWBQ9y0A1X1VxiEDu
         WV6g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X6AAvaoU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66ba581csi98236201cf.491.2025.01.27.11.43.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 11:43:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X6AAvaoU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcV04-0004OM-Rd; Mon, 27 Jan 2025 14:42:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1tcUzw-0004MJ-Le
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 14:42:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1tcUzv-0003cZ-3v
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 14:42:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738006933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jbFpEmHZcsF2z21tixjEGxHcXLsMehq8qscy4oPSfwk=;
 b=X6AAvaoUWDrZjCT8g2V2gzzjD3pdhx0s+ScRiJXWDR+xNC3kO7BVcA43PL3ry2r8Diu4E0
 lEJW0DO31WbBt+yB5ub73YJz8F846cK58quDJfUgvFZz+kQ5IOv/GPeU4ZrMLjNjKRS/6t
 fD3AD8R0Q/jBXHJxLuJxfJSdyRg+iB4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-354-avOa4RhIOieJY8jsHCkTFw-1; Mon,
 27 Jan 2025 14:42:10 -0500
X-MC-Unique: avOa4RhIOieJY8jsHCkTFw-1
X-Mimecast-MFC-AGG-ID: avOa4RhIOieJY8jsHCkTFw
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 150A019560B8; Mon, 27 Jan 2025 19:42:09 +0000 (UTC)
Received: from localhost (unknown [10.2.17.47])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 97D921800348; Mon, 27 Jan 2025 19:42:08 +0000 (UTC)
Date: Mon, 27 Jan 2025 14:42:07 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>
Subject: Re: [PULL 00/12] aspeed queue
Message-ID: <20250127194207.GA39648@fedora>
References: <20250127094239.636526-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IOS1aer3GtsRQS2r"
Content-Disposition: inline
In-Reply-To: <20250127094239.636526-1-clg@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RduNmifV1F2C


--IOS1aer3GtsRQS2r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/10.0 for any user-visible changes.

--IOS1aer3GtsRQS2r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmeX4Y4ACgkQnKSrs4Gr
c8i5ywf/VLRa5WiHzuRi9UUlQPkaL79T2IZ2RbtEAfagVzdWbGE4+EZhD/eqB30r
HtVZYbvjgahzcyoDN+qYqnoVXz8NU2RBThmGs7JVpNprZvKoT4RsaldJm5WfugS4
HMmPYyRzxZ/9OB8De4vlKasrSVO25fcQOAkoHP8fnngw2TXhbtNbachN9N8ustyJ
SBdgVqGMrC6OlkoX5rrHPsdPSdPl44/gh4B/MLYCUZVvSEJ/ebzrF/nga4SPoDjB
xuObpXOCJP2vFOl7r8z+zZe2xc51XTk8RFRFma0XdNNuWCPazjXAKQ6AuaEuCzda
roBr3KuX0sfPWUijjU3u3rrkgK8RjQ==
=zAsu
-----END PGP SIGNATURE-----

--IOS1aer3GtsRQS2r--

