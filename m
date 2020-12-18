Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2126072lfq;
        Fri, 18 Dec 2020 01:45:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhwCdgLZRKu35RjLSDgvxybyuHYi/lY3fLqWJ2AMl4prVJIvgZFx1M2gNm6PFsbxxO3mbH
X-Received: by 2002:a5d:6cd4:: with SMTP id c20mr2475444wrc.57.1608284721011;
        Fri, 18 Dec 2020 01:45:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608284721; cv=none;
        d=google.com; s=arc-20160816;
        b=iw1loRL5wIpq7PBeDDegQHGHNqfdulqks1hcdbEq0drWF8CGlb/duU+hRnDlbP3zAO
         seelB+ddgKB2PJwRA+ySKw26kQSb9NaD9WF5khGs80YiDRUt4c4Yw77NG3EX5m3sztnT
         bnspa9yfL9jWjFcHonPBiMK1lFjae0YpM7PoIsr6gZ5RVH4bAyNFpGCB6R/d33KEh/WC
         JLn/OtSeQ9C31i1elpWxsHhOIKBIeVD/3G5JP2aaT2SMyEs8emxxuGHx3GKiJklJrfQT
         0I4CnctJX36CbTD00ZsGvJO/EfsCeyuvB9OsWp3xiMxHq1rSAQRXPKqHq0614SUW4owu
         ZhVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :organization:message-id:date:subject:cc:to:from;
        bh=bUQrql1ubGsDGL0WxIam+hzPK434UIpMBojD10jdX5Q=;
        b=W2Sf77w973vNsG+6xLIX0wNyVesE3qk8j+Ot0yuZ1YuIHm85pYPOdOEhCx7fmQPKvb
         TBIN0NCrSK6gdZpVBiXs95P+N8Rn9aSJEFbfktechDM0dXddQY8KQA5vGSNl2JFjX0VK
         987siBz2D1mf3Hs4pxYhM8kK5Vlmu5RUo83y4OzQPozJyL8KvEgC1EMn024oWnAYevfi
         b+mz6alVGtmBAoAIssWbgkFc4mqIEB3dM6K6uYmpBOEYZODVCYe5JPIf7BiWEcyuh9GR
         XuTwKVuT9AhF4qnlGPoObhho0KIeSazlA5yamcyplYgI0Yz1RbWnwSHUc5a6ruTBaDbx
         hoaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of remi@remlab.net designates 2001:41d0:2:5a1a:: as permitted sender) smtp.mailfrom=remi@remlab.net
Return-Path: <remi@remlab.net>
Received: from ns207790.ip-94-23-215.eu (poy.remlab.net. [2001:41d0:2:5a1a::])
        by mx.google.com with ESMTP id m22si7302273wmg.122.2020.12.18.01.45.20;
        Fri, 18 Dec 2020 01:45:20 -0800 (PST)
Received-SPF: pass (google.com: domain of remi@remlab.net designates 2001:41d0:2:5a1a:: as permitted sender) client-ip=2001:41d0:2:5a1a::;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of remi@remlab.net designates 2001:41d0:2:5a1a:: as permitted sender) smtp.mailfrom=remi@remlab.net
Received: from basile.remlab.net (dzyqn8ypzhx7l91mxjsvy-3.rev.dnainternet.fi [IPv6:2001:14ba:a01a:be01:9434:f69e:d553:3be2])
	(Authenticated sender: remi)
	by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id 06F375FA93;
	Fri, 18 Dec 2020 10:45:19 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi.denis.courmont@huawei.com>
To: qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>, Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>, Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCHv3 00/17] ARMv8.4 Secure EL2
Date: Fri, 18 Dec 2020 11:45:19 +0200
Message-ID: <1841243.PYKUYFuaPT@basile.remlab.net>
Organization: Huawei Technologies, Finland
In-Reply-To: <874kkwgzbe.fsf@linaro.org>
References: <3333301.iIbC2pHGDl@basile.remlab.net> <2120950.iZASKD2KPV@basile.remlab.net> <874kkwgzbe.fsf@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-TUID: E/D2OCYPfdkA

Le tiistaina 8. joulukuuta 2020, 16.11.15 EET Alex Benn=C3=A9e a =C3=A9crit=
 :
> > Wiki implies that dependencies are automatically installed, but I
> > guess not?
>=20
> They should be in the venv that is built when you run the test the first
> time. Running the above command without the -V which it doesn't
> recognise gives me a list:
>=20
>   14:12:25 [alex@zen:~/l/q/b/all]
> xen/guest-loader-and-arm-build-cleanups-v2|=E2=9C=9A3=E2=80=A6(+5/-5) +
> ./tests/venv/bin/avocado list tests/acceptance/ | head -n 10 INSTRUMENTED
> tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_i440fx_tcg
> INSTRUMENTED
> tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_i440fx_kvm
> INSTRUMENTED tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_q35_tcg
> INSTRUMENTED tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_q35_kvm
> INSTRUMENTED tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg
> INSTRUMENTED
> tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv2
> INSTRUMENTED
> tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv3
> INSTRUMENTED tests/acceptance/boot_linux.py:BootLinuxPPC64.test_pseries_t=
cg
> INSTRUMENTED
> tests/acceptance/boot_linux.py:BootLinuxS390X.test_s390_ccw_virtio_tcg
> INSTRUMENTED
> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_x86_64_pc
> Exception ignored in: <_io.TextIOWrapper name=3D'<stdout>' mode=3D'w'
> encoding=3D'UTF-8'> BrokenPipeError: [Errno 32] Broken pipe
>=20
> I wonder are you running an in-tree build?

Yes. I suppose somebody fixed something because I can run the test cases no=
w=20
and pinpoint the failing change, though I've yet to debug it succesfully.

=2D-=20
R=C3=A9mi Denis-Courmont

