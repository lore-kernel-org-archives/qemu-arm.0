Received: by 10.28.91.67 with SMTP id p64csp292082wmb;
        Wed, 7 Mar 2018 10:04:31 -0800 (PST)
X-Google-Smtp-Source: AG47ELuQyzi+YRyCCVSl1E4ENk+TnW1zCiwfg5bRYlC4+YYl8/Tdm75jY75FCG6OC5I1xcGCx9BS
X-Received: by 10.13.198.197 with SMTP id i188mr715097ywd.284.1520445871454;
        Wed, 07 Mar 2018 10:04:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520445871; cv=none;
        d=google.com; s=arc-20160816;
        b=kHca7CRAQeJ/cRCqUdblJQDffBl76NbBOcbjK9ZWogREQWoWhhtiWX762pgL7iL5kx
         4HTAZcQ3V3Xt7U7T+n2L43sJNiu+TemJjwm8BUzf1Ie5GXCg4q3Qf3nZyCx/rDVnGLk0
         9fMhYsVnKDCdk0vBBVS8VFZsEBWnh24+TrlW52f5BBNmjuRsWBuQHPlq+sBM1Fp34fiK
         ESfM3slyCKE+ybOpKYRMfuzelOYIC7oqc54yVX2GG/9SAy45wyFHiRSlUsAXlq68USkH
         Dg2QN6G+InR/96lu+eRWVobgR7/zGcgIXb2vXAqzFhNTE+IFkRd7qvzZyGKoxOO1mhEU
         LbBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=PBAvii1TXh5U2JhCej9x2E4aR3wwp0+gqmuGNrTcuVA=;
        b=XzaPiCmFD9MXWiHuwaDY/6GVC+yE7Y9BUfB8klYRaLtqeUMMdD+nLa6KqCAtW4o/Fp
         iQIRmx4DyaeFUfQZ1VcJXTIlnISallbvLlaP4C+yVeRm2YFowoYNRP1daeSqhzM5EMIY
         1rINQwCiZLz6uM5gx3GKP1lWU23Nt6AVd3ECReQ7aydYf5mMbZ/lldcnF5CVCrRu00md
         0LG5e0mk4tFu9rQAvhBduzoA2NkAzA7VBXG+Si3cVAMQRW4x+72xXlwlBQPhi8fRxvHD
         Go47PhqY+qwKvsuwKMGwrwbfkKOSfu9SGZaZg4BRr9NesLq8vGBco7BxDGECGSvOSC9b
         VGuA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t14-v6si3044024ybk.650.2018.03.07.10.04.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Mar 2018 10:04:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34834 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1etdQU-00058u-Vf
	for alex.bennee@linaro.org; Wed, 07 Mar 2018 13:04:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42471)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1etdQE-00053C-Jy
	for qemu-arm@nongnu.org; Wed, 07 Mar 2018 13:04:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1etdQD-0004aY-Mo
	for qemu-arm@nongnu.org; Wed, 07 Mar 2018 13:04:14 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55846 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1etdQD-0004aJ-Hz; Wed, 07 Mar 2018 13:04:13 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2586440252F0;
	Wed,  7 Mar 2018 18:04:13 +0000 (UTC)
Received: from localhost (ovpn-112-24.ams2.redhat.com [10.36.112.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CE041215CDA7;
	Wed,  7 Mar 2018 18:04:12 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  7 Mar 2018 19:03:58 +0100
Message-Id: <20180307180358.30393-2-marcandre.lureau@redhat.com>
In-Reply-To: <20180307180358.30393-1-marcandre.lureau@redhat.com>
References: <20180307180358.30393-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 07 Mar 2018 18:04:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 07 Mar 2018 18:04:13 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'marcandre.lureau@redhat.com'
	RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 2/2] arm: avoid heap-buffer-overflow in
 load_aarch64_image
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +y5HxmmO8G+9

Spotted by ASAN:

elmarco@boraha:~/src/qemu/build (master *%)$ QTEST_QEMU_BINARY=3Daarch64-=
softmmu/qemu-system-aarch64 tests/boot-serial-test
/aarch64/boot-serial/virt: ** (process:19740): DEBUG: 18:39:30.275: foo /=
tmp/qtest-boot-serial-cXaS94D
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D19740=3D=3DERROR: AddressSanitizer: heap-buffer-overflow on address=
 0x603000069648 at pc 0x7f1d2201cc54 bp 0x7fff331f6a40 sp 0x7fff331f61e8
READ of size 4 at 0x603000069648 thread T0
    #0 0x7f1d2201cc53  (/lib64/libasan.so.4+0xafc53)
    #1 0x55bc86685ee3 in load_aarch64_image /home/elmarco/src/qemu/hw/arm=
/boot.c:894
    #2 0x55bc86687217 in arm_load_kernel_notify /home/elmarco/src/qemu/hw=
/arm/boot.c:1047
    #3 0x55bc877363b5 in notifier_list_notify /home/elmarco/src/qemu/util=
/notify.c:40
    #4 0x55bc869331ea in qemu_run_machine_init_done_notifiers /home/elmar=
co/src/qemu/vl.c:2716
    #5 0x55bc8693bc39 in main /home/elmarco/src/qemu/vl.c:4679
    #6 0x7f1d1652c009 in __libc_start_main (/lib64/libc.so.6+0x21009)
    #7 0x55bc86255cc9 in _start (/home/elmarco/src/qemu/build/aarch64-sof=
tmmu/qemu-system-aarch64+0x1ae5cc9)

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/arm/boot.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 784d301683..196c7fb242 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -891,7 +891,8 @@ static uint64_t load_aarch64_image(const char *filena=
me, hwaddr mem_base,
     }
=20
     /* check the arm64 magic header value -- very old kernels may not ha=
ve it */
-    if (memcmp(buffer + ARM64_MAGIC_OFFSET, "ARM\x64", 4) =3D=3D 0) {
+    if (size > ARM64_MAGIC_OFFSET + 4 &&
+        memcmp(buffer + ARM64_MAGIC_OFFSET, "ARM\x64", 4) =3D=3D 0) {
         uint64_t hdrvals[2];
=20
         /* The arm64 Image header has text_offset and image_size fields =
at 8 and
--=20
2.16.2.346.g9779355e34

