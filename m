Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp849231njb;
        Fri, 18 Oct 2024 07:19:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVSW+0Zl2cpXJhwzUbsXarideOV+uCdMjwFTvuMuX/ACSVj6LgBMPWzMeTFQGiPQRDqqtsl436Eg3UdBA==@linaro.org
X-Google-Smtp-Source: AGHT+IEMCAgKusv2LCkyjMyZKtfZ6iqQDv5nZdHTaIVLv9tn1Crysb51Fxuvb8ZR+ar7vcS5kW7B
X-Received: by 2002:ad4:5aad:0:b0:6b5:1d2f:1d3 with SMTP id 6a1803df08f44-6cc3769f722mr136362156d6.0.1729261167092;
        Fri, 18 Oct 2024 07:19:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729261167; cv=none;
        d=google.com; s=arc-20240605;
        b=RBAC9/Ty3TOj5o2iGBP5iVpUH79yuwGs2vEfJDaOziuS0Vouh7Rrch3qOFAbqgn+Pb
         zXQ7adGVaDHsoY13qA20hSMhcsCuZlSxGblUvBbGQhQVfdCVW5aXFy5mjqxI4+AIy1NF
         F3XHimiB3KCh+5PhO0SAfNDoQCFXCyonGoLzt0CHgJinZjnpEfoC+wEHZHG7ljA0NdEb
         hDrQEZmXO04ykBCMDHpHB0W2zHPNd/X+NDW6ODdTXAeb+PjcH+2ucb9XWLfhGR7rak8w
         mviyQnamPFYyhHS6jdby1IgN/+2i+6dfDyBm3jLbqjm7Pj5V+u8YmT+dFBnFGDUlE37x
         H/Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=UJOSYBHAZch2hYcvcBohsQccqRoQwkaRO0O84tEZW2M=;
        fh=SFMOwFaBseFqn5B+TFbnDnrq5Ntnt6XQOmv9pna8nJ0=;
        b=lzUYv0Ejt0SMq/hTPals2hTyoB17A+/w1mTOhaVEegmKrn3bm3izK+P/Tl79yQlB6R
         hnb9+YPBKYKalNdpX01lmcbMfoYk9Umn/hV6G0L6r/plpWDqr3l0wYBNTA3heDO+PHEO
         stCHLS66gkAmfierEpMLMTNsn1H0XeKzq1Evsgo2GbGBQ/NA/vMUenq9zMAEDK6EyR77
         5W5JXIqxeF1j24swzsL6pKPoPcicD3z19KupTw9nl35CqLj4euA98wmFn1tBRO4ips4M
         rC1bV2QZhvEWTFMUuySLlObCyCoUvesVX33VsVF2p/jxNW8xPD/mrKSnKiCj6Vl6//nj
         kqRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Y5gvSRh/";
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cde1376cbasi17906226d6.413.2024.10.18.07.19.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 07:19:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Y5gvSRh/";
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729261166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UJOSYBHAZch2hYcvcBohsQccqRoQwkaRO0O84tEZW2M=;
	b=Y5gvSRh/ZxBa3hx/vKbMuXIWc0w4el0idelW/VOHreVNmgYoI1EU7gXAVtTLwPIhsGXyMh
	6FkTX7pgBJAVr96X+et2mVQ7lu9gMcGEweeZa0ggTygxVFhYJBrSfJmIcl5B0UyiVGi9wS
	grPh3YowG5ngvqpvR9mYIH83XrtEfig=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-nrywVPGMMRacSLT_CzI9Iw-1; Fri, 18 Oct 2024 10:19:25 -0400
X-MC-Unique: nrywVPGMMRacSLT_CzI9Iw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43159603c92so13597535e9.2
        for <alex.bennee@linaro.org>; Fri, 18 Oct 2024 07:19:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729261164; x=1729865964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJOSYBHAZch2hYcvcBohsQccqRoQwkaRO0O84tEZW2M=;
        b=avS95feqYDE9jIXdleoQG6QI+r0juMrk2mb8zrcFUTbzHflTsgZsiVsrTDnsG8EABy
         0+IO4f4TTOYa2xAppulFouVAhC8KnSdUc9Jc02D974yF1GCN/2cjkpDNmcnA12s4t/eT
         5X0UKYJvDhClpDPE//Ihc8p7TGZ8vYZaujjAQkIMbrvS47FadCRFzKwJisaK72JpFLlL
         vEx5+byIx1NeCIiXSuck7sIXY2I3CuY2tlneriX1/HoWJvRrz2oXXV6LYqA4oxdS71rT
         x/3OPcZcvenrHavo4R2PvGxoBCorOpszvoMKWXXlt8WHyw3DQBlHeR7lVfrzUnybft7F
         lGzg==
X-Forwarded-Encrypted: i=1; AJvYcCXzEiPBGlFXAdj30cP5VI+PvJnXBAituE5fvCaEnLr3P0bs78okr53XrUGxs06Zp7qHH9n4shrxhqFDBg==@linaro.org
X-Gm-Message-State: AOJu0YxziXY711V50nzU8gLSi78YbZd68gappBviKL9KznGDcRyGM6y5
	9ai3YjaHydF/E1D79A5vlHXgc7N/RqssYcEVANiJK/TOtd4GItMWfNyrR166jjqd5XoUtML2Jzw
	Zvn1EIID8P0Vdc7QCe+pCjgk44hxbiNFVkyF0coZNyAwh5lw0YiTznQ==
X-Received: by 2002:a05:600c:4fd4:b0:431:5f1b:a7c4 with SMTP id 5b1f17b1804b1-431616ad74cmr19220345e9.34.1729261164378;
        Fri, 18 Oct 2024 07:19:24 -0700 (PDT)
X-Received: by 2002:a05:600c:4fd4:b0:431:5f1b:a7c4 with SMTP id 5b1f17b1804b1-431616ad74cmr19219985e9.34.1729261163960;
        Fri, 18 Oct 2024 07:19:23 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e11425sm25668095e9.28.2024.10.18.07.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 07:19:23 -0700 (PDT)
Date: Fri, 18 Oct 2024 16:19:20 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, maz@kernel.org,
 jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, andrew.jones@linux.dev, david@redhat.com,
 philmd@linaro.org, eric.auger@redhat.com, will@kernel.org, ardb@kernel.org,
 oliver.upton@linux.dev, pbonzini@redhat.com, gshan@redhat.com,
 rafael@kernel.org, borntraeger@linux.ibm.com, alex.bennee@linaro.org,
 npiggin@gmail.com, harshpb@linux.ibm.com, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, shahuang@redhat.com,
 linuxarm@huawei.com, gustavo.romero@linaro.org
Subject: Re: [PATCH V1 3/4] hw/acpi: Reflect ACPI vCPU {present,enabled}
 states in ACPI _STA.{PRES,ENA} Bits
Message-ID: <20241018161920.20524a97@imammedo.users.ipa.redhat.com>
In-Reply-To: <ZxHuVC0uDL7kEB2i@intel.com>
References: <20241014192205.253479-1-salil.mehta@huawei.com>
	<20241014192205.253479-4-salil.mehta@huawei.com>
	<ZxHuVC0uDL7kEB2i@intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: XjZUKi+8CHe+

On Fri, 18 Oct 2024 13:12:52 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> Hi Salil,
>=20
> On Mon, Oct 14, 2024 at 08:22:04PM +0100, Salil Mehta wrote:
> > Date: Mon, 14 Oct 2024 20:22:04 +0100
> > From: Salil Mehta <salil.mehta@huawei.com>
> > Subject: [PATCH V1 3/4] hw/acpi: Reflect ACPI vCPU {present,enabled} st=
ates
> >  in ACPI _STA.{PRES,ENA} Bits
> > X-Mailer: git-send-email 2.34.1
> >=20
> > Reflect the ACPI CPU hotplug `is_{present, enabled}` states in the `_ST=
A.PRES`
> > (presence) and `_STA.ENA` (enabled) bits when the guest kernel evaluate=
s the
> > ACPI `_STA` method during initialization, as well as when vCPUs are hot=
-plugged
> > or hot-unplugged. The presence of unplugged vCPUs may need to be delibe=
rately
> > *simulated* at the ACPI level to maintain a *persistent* view of vCPUs =
for the
> > guest kernel.
> >=20
> > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> > ---
> >  hw/acpi/cpu.c | 26 ++++++++++++++++++++++----
> >  1 file changed, 22 insertions(+), 4 deletions(-)
> >  =20
>=20
> It seems this patch changes ACPI table layout and then breaks current
> ACPI table qtest. I'm not sure how to do such modifications. Maybe you
> should first disable the related checks, then modify the code, update
> the qtest, and finally re-enable the checks for qtest. This can help
> to avoid any qtest failure due to this patch?

see comment at the top of tests/qtest/bios-tables-test.c

>=20
> I think it should get Igor's advice on this. :)
>=20
> Attach the error I met:
>=20
> =E2=96=B6   2/920 ERROR:../tests/qtest/bios-tables-test.c:553:test_acpi_a=
sl: assertion failed: (all_tables_match) ERROR
> =E2=96=B6   3/920 ERROR:../tests/qtest/bios-tables-test.c:553:test_acpi_a=
sl: assertion failed: (all_tables_match) ERROR
>   2/920 qemu:qtest+qtest-i386 / qtest-i386/bios-tables-test              =
                  ERROR            1.24s   killed by signal 6 SIGABRT
> >>> G_TEST_DBUS_DAEMON=3D/media/liuzhao/data/qemu-cook/tests/dbus-vmstate=
-daemon.sh ASAN_OPTIONS=3Dhalt_on_error=3D1:abort_on_error=3D1:print_summar=
y=3D1 MESON_TEST_ITERATION=3D1 UBSAN_OPTIONS=3Dhalt_on_error=3D1:abort_on_e=
rror=3D1:print_summary=3D1:print_stacktrace=3D1 QTEST_QEMU_BINARY=3D./qemu-=
system-i386 MALLOC_PERTURB_=3D142 MSAN_OPTIONS=3Dhalt_on_error=3D1:abort_on=
_error=3D1:print_summary=3D1:print_stacktrace=3D1 QTEST_QEMU_STORAGE_DAEMON=
_BINARY=3D./storage-daemon/qemu-storage-daemon QTEST_QEMU_IMG=3D./qemu-img =
PYTHON=3D/media/liuzhao/data/qemu-cook/build/pyvenv/bin/python3 /media/liuz=
hao/data/qemu-cook/build/tests/qtest/bios-tables-test --tap -k =20
> =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80  =E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
> stderr:
> acpi-test: Warning! DSDT binary file mismatch. Actual [aml:/tmp/aml-VRT5V=
2], Expected [aml:tests/data/acpi/x86/pc/DSDT].
> See source file tests/qtest/bios-tables-test.c for instructions on how to=
 update expected files.
> acpi-test: Warning! DSDT mismatch. Actual [asl:/tmp/asl-TTT5V2.dsl, aml:/=
tmp/aml-VRT5V2], Expected [asl:/tmp/asl-XXM5V2.dsl, aml:tests/data/acpi/x86=
/pc/DSDT].
> **
> ERROR:../tests/qtest/bios-tables-test.c:553:test_acpi_asl: assertion fail=
ed: (all_tables_match)
>=20
> (test program exited with status code -6)
> =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95
>=20
>   3/920 qemu:qtest+qtest-x86_64 / qtest-x86_64/bios-tables-test          =
                  ERROR            1.25s   killed by signal 6 SIGABRT
> >>> G_TEST_DBUS_DAEMON=3D/media/liuzhao/data/qemu-cook/tests/dbus-vmstate=
-daemon.sh ASAN_OPTIONS=3Dhalt_on_error=3D1:abort_on_error=3D1:print_summar=
y=3D1 MESON_TEST_ITERATION=3D1 UBSAN_OPTIONS=3Dhalt_on_error=3D1:abort_on_e=
rror=3D1:print_summary=3D1:print_stacktrace=3D1 MSAN_OPTIONS=3Dhalt_on_erro=
r=3D1:abort_on_error=3D1:print_summary=3D1:print_stacktrace=3D1 QTEST_QEMU_=
STORAGE_DAEMON_BINARY=3D./storage-daemon/qemu-storage-daemon QTEST_QEMU_IMG=
=3D./qemu-img PYTHON=3D/media/liuzhao/data/qemu-cook/build/pyvenv/bin/pytho=
n3 MALLOC_PERTURB_=3D41 QTEST_QEMU_BINARY=3D./qemu-system-x86_64 /media/liu=
zhao/data/qemu-cook/build/tests/qtest/bios-tables-test --tap -k =20
> =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80  =E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
> stderr:
> acpi-test: Warning! DSDT binary file mismatch. Actual [aml:/tmp/aml-D5K5V=
2], Expected [aml:tests/data/acpi/x86/pc/DSDT].
> See source file tests/qtest/bios-tables-test.c for instructions on how to=
 update expected files.
> acpi-test: Warning! DSDT mismatch. Actual [asl:/tmp/asl-G6K5V2.dsl, aml:/=
tmp/aml-D5K5V2], Expected [asl:/tmp/asl-AQD5V2.dsl, aml:tests/data/acpi/x86=
/pc/DSDT].
> **
> ERROR:../tests/qtest/bios-tables-test.c:553:test_acpi_asl: assertion fail=
ed: (all_tables_match)
>=20
> (test program exited with status code -6)
>=20
>=20
> Regards,
> Zhao
>=20
>=20
