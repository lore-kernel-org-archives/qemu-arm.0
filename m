Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5097087lfg;
        Tue, 16 Mar 2021 19:05:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKDit/iaFnUL0Bf8VESAGUID/rLDn6UAZ3aalWpitzVXh/eUVgSiIljid2MRy67oZZEDwz
X-Received: by 2002:a25:7d04:: with SMTP id y4mr1999045ybc.402.1615946730654;
        Tue, 16 Mar 2021 19:05:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615946730; cv=none;
        d=google.com; s=arc-20160816;
        b=eTybcVAdsini8PGkmFsnF0WkDGAjp+aR4PR2qEKL7jFVooiEJNYe2xYox/4U1/tcg2
         2hIviMOAa3Sdl2QxIMrWdgK2+HWdRtv192JF3YyI3pNBbiwdrNUl0SeKkeXW0TdY57ld
         pxnUWs0fTLK9ZMmbYFZfgUlo8gVEp7lcQp8o4sOnxG8QSNX6rSpqJu6rO4126x+5Az2T
         caz58Bks4LtSRz3u0FAvwomYp57MkKfup+/ZFowUA5oECnxTGMx9c+VxhYHbDb5oodpr
         db7SWflPtVeMpa7/gZwrqhBWOK/3Y1+f6DRa2aE6DGmOeVxLKw1+yH5sECO4zC+2nz2H
         YCsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=bgrIk/Dff7bIAxN/4yFOY5v6QHWPW5HJiV736mIknHs=;
        b=zQaa9HSr1A4qY8x1M+FcNfOGhdakp2BvWi6nmysm9VrAPzCIL1JD3wv9HjdG4O9WRy
         +TKc00fMd27USgf6c83qpY5uWvdgOUuM2e4J4CRoMZQNT4zM92LaQ7NGGVT/oKq/lxMR
         BvSVRaohPt9f21tj5DchWJHzTmEbPExo0wXuMBCdwpZNqUCp3bKpSSQg48hxS8fvq394
         0GBvFOAeDjTtrm1CxZ4MzQNnJ+t8VvMBTkEuK4CFwQViNVMRtZlBCAbTAfiJ8LsUWsdA
         BCFBBx6ETLtUpLhejaBZEL0FGQlytbUy5SUiI0hyMKAeAeo7+JQH/7Kw3f4NbkWQFDgv
         N/pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OyY2n1Df;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w191si21483159ybe.183.2021.03.16.19.05.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Mar 2021 19:05:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OyY2n1Df;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMLYw-00075U-1G
	for alex.bennee@linaro.org; Tue, 16 Mar 2021 22:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lMLYj-00074E-Hk
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 22:05:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lMLYb-0000Wq-1w
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 22:05:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615946707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bgrIk/Dff7bIAxN/4yFOY5v6QHWPW5HJiV736mIknHs=;
 b=OyY2n1DfSyCGRCoQt5MF0l9DlCZNIM2nF3FYZgJlw74Fv4DFs3yNZlrjfYujp+CfPlQpxe
 OOMjyrxEeBrQMip3NXOcI9gJDLwnymOR+Eb+vc6hT5ZeTYXbl0u1J1UmNa+mMivSO4eKBD
 JNx//BfUiR3K5gETS5RzIQnHhSgb8HU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-npakodA0OOa1GhM1ultIEA-1; Tue, 16 Mar 2021 22:05:02 -0400
X-MC-Unique: npakodA0OOa1GhM1ultIEA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD4731074659;
 Wed, 17 Mar 2021 02:05:00 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-107.rdu2.redhat.com
 [10.10.113.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7042860C13;
 Wed, 17 Mar 2021 02:04:56 +0000 (UTC)
Date: Tue, 16 Mar 2021 22:04:54 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2 1/2] tests/acceptance: Test ast2400 and ast2500 machines
Message-ID: <YFFjxg3MNd9oJ0vu@localhost.localdomain>
References: <20210304123951.163411-1-joel@jms.id.au>
 <20210304123951.163411-2-joel@jms.id.au>
MIME-Version: 1.0
In-Reply-To: <20210304123951.163411-2-joel@jms.id.au>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pk2IiuFRYfvGL2eL"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A6SxRPP4m+mV

--pk2IiuFRYfvGL2eL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 04, 2021 at 11:09:50PM +1030, Joel Stanley wrote:
> Test MTD images from the OpenBMC project on AST2400 and AST2500 SoCs
> from ASPEED, by booting Palmetto and Romulus BMC machines.
>=20
> The images are fetched from OpenBMC's release directory on github.
>=20
> Co-developed-by: C=E9dric Le Goater <clg@kaod.org>
> Reviewed-by: C=E9dric Le Goater <clg@kaod.org>
> Tested-by: C=E9dric Le Goater <clg@kaod.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  tests/acceptance/boot_linux_console.py | 46 ++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)

These seem quite stable, as not as slow as the comment on the seems to
indicate.  On a reasonbly low powered machine:

JOB ID     : 01fb73b0f5f4612e95f9f2c2a791df9c11d226ca
JOB LOG    : /home/cleber/avocado/job-results/job-2021-03-16T21.58-01fb73b/=
job.log
 (1/6) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ast=
2400_palmetto_openbmc_v2_9_0: STARTED
 (2/6) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ast=
2500_romulus_openbmc_v2_9_0: STARTED
 (3/6) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ast=
2400_palmetto_openbmc_v2_9_0: STARTED
 (4/6) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ast=
2500_romulus_openbmc_v2_9_0: STARTED
 (1/6) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ast=
2400_palmetto_openbmc_v2_9_0: PASS (32.70 s)
 (3/6) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ast=
2400_palmetto_openbmc_v2_9_0: PASS (32.86 s)
 (5/6) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ast=
2400_palmetto_openbmc_v2_9_0: STARTED
 (6/6) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ast=
2500_romulus_openbmc_v2_9_0: STARTED
 (4/6) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ast=
2500_romulus_openbmc_v2_9_0: PASS (42.46 s)
 (2/6) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ast=
2500_romulus_openbmc_v2_9_0: PASS (42.64 s)
 (5/6) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ast=
2400_palmetto_openbmc_v2_9_0: PASS (21.78 s)
 (6/6) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ast=
2500_romulus_openbmc_v2_9_0: PASS (26.11 s)
RESULTS    : PASS 6 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CA=
NCEL 0
JOB HTML   : /home/cleber/avocado/job-results/job-2021-03-16T21.58-01fb73b/=
results.html
JOB TIME   : 61.04 s

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

--pk2IiuFRYfvGL2eL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmBRY8MACgkQZX6NM6Xy
CfO3nQ//ffz90W2lO+oEo2bKrb6Es4BxviE+1+11bpvR3DptXAx4gbd0xfhsePr2
P8ySGkPyrsKpjQsI2c1Q8NAl77sUK0TY0t9V6vlNddgCvG4IS1MFt6h6FOimZlF3
RRknr+e9v3EjDcsxd9cQ9XJW0YMlg7PRgQhATZtUdeUcmy8RvsU9CcGYBWTBXgDK
8AtVH/crbxY8DvMLT1rErCi6hfNq8oE8ZW1x2t7h4MfGLmq0ZCIY5EttzQJfoFnL
rIK0rgzAlF6YptPdk/96HpQ+jbfhHz7stdjMVUyKieCFQmcw0zhuHV6gR2TFvzZk
I4ynKuvtUOQpRdZWpP3rWR2tdbycl3I2gIklaHouVu9RUBYaI2c4K+LnLFMN9RRk
503LEFbqm1RCJr7PxkZm2xHXa2BAyarS0vcxuMXJATq8QYdsNtp+rTIux8p19TzG
+KpfiYlu0dto6ijeLCG8qQubDYFgSvFYKURbrs2LFHTtiMKeRMyOLhrsivsdAvPK
MSrJXWcaWjNjCk9xw+bK/ZPWFq5a26hY42qKg1BY8gmWN4LLXzm6C/pgWY/uZnWv
2wv+QdXZ6AIZBT9mVVuM0ugMj85ZJOKdqJAtd2WV9l2+RD9I6bgqEKkypIIThlv8
VIaZhjZnRnazTwkR0Kojq4WSRKG483EDFj59n1xs9fD3KwmQbMw=
=abaJ
-----END PGP SIGNATURE-----

--pk2IiuFRYfvGL2eL--

