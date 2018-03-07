Received: by 10.28.91.67 with SMTP id p64csp291900wmb;
        Wed, 7 Mar 2018 10:04:20 -0800 (PST)
X-Google-Smtp-Source: AG47ELs1oXcfsScv4RKatnrCb+Jwp85TzSYrrl+Xc7rbMuVjf2/wmFSILQ/6oSkXxDnasmzLEvX/
X-Received: by 2002:a25:f608:: with SMTP id t8-v6mr14338555ybd.403.1520445860732;
        Wed, 07 Mar 2018 10:04:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520445860; cv=none;
        d=google.com; s=arc-20160816;
        b=x8otp6qxhnm3dxykIPFO4HWLvQj5J9cUu3fzpkp62Od4kOkeHOtZMQ4jWkYoKiRKBC
         wb1qx1aPpXuff6douOQjgbg+cUpARRV+R+Dr/4vYPbLYFbUU+bIRPlVO7mZGDDlVODsT
         0Jvtu8UEhz3wcRhVukaDImzRFJqHsUgy/mA4SVwE5aBYHD3+6j2mtWo1WlpV7SJEDgKw
         HXyorhr0nKrU8ZJ3m0frct7e6b36TM2jwGKii1eodyYXKoJ+tbGVArVoPvMOJgBRKOje
         BHdA/8NbgL9ITYBSxg0/yHFdoMQiNIzY7A3J4NUnHTt8fHP70OuDiOu+mrxKu9vLeqFC
         W3IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=igGGbdeMrkLa+047hULwiLkDi6aMILdbnyTgea84ZkA=;
        b=S9yzitT2WVQN2tWsRLBm/DQx48H1D42LUZQPup6PDm+5445AsSSQfrql75YIg3rrRe
         vEXt9oCLTGdKAKnaoLeDByFUTjU5oIPnxYln5xt2HL6k7AeploAzai11QmlH8pzFQLwQ
         JeZ8/IDMY41WqrR5XkLII7qpNB+4ImS4u6DEZ8O97YnqBmgyqwcqg+delGgoWhgiw32w
         uSDi2BDAzvVtcozalZWxppRa7BK40Tc+qipq56RbstZovbzXYWksXtlq8HwndyIPjPFq
         HUWKT38dURb2wsnh0CRzr5WbFmNA6OUcN6Y0LOEUPMA+xA8Hd/nOhCwf+qzG/Ue6SCMY
         GRTw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y9-v6si1640819ybm.156.2018.03.07.10.04.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Mar 2018 10:04:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34831 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1etdQK-000524-58
	for alex.bennee@linaro.org; Wed, 07 Mar 2018 13:04:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1etdQB-00051q-LK
	for qemu-arm@nongnu.org; Wed, 07 Mar 2018 13:04:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1etdQ8-0004Z3-GI
	for qemu-arm@nongnu.org; Wed, 07 Mar 2018 13:04:11 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58204 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1etdQ8-0004Yt-BU; Wed, 07 Mar 2018 13:04:08 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DCF5EC33F;
	Wed,  7 Mar 2018 18:04:07 +0000 (UTC)
Received: from localhost (ovpn-112-24.ams2.redhat.com [10.36.112.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 82F082026980;
	Wed,  7 Mar 2018 18:04:07 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  7 Mar 2018 19:03:57 +0100
Message-Id: <20180307180358.30393-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 07 Mar 2018 18:04:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 07 Mar 2018 18:04:07 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'marcandre.lureau@redhat.com'
	RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 1/2] arm: fix load ELF error leak
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
X-TUID: F0XDJ9MMXMOV

Spotted by ASAN:
QTEST_QEMU_BINARY=3Daarch64-softmmu/qemu-system-aarch64 tests/boot-serial=
-test

Direct leak of 48 byte(s) in 1 object(s) allocated from:
    #0 0x7ff8a9b0ca38 in __interceptor_calloc (/lib64/libasan.so.4+0xdea3=
8)
    #1 0x7ff8a8ea7f75 in g_malloc0 ../glib/gmem.c:124
    #2 0x55fef3d99129 in error_setv /home/elmarco/src/qemu/util/error.c:5=
9
    #3 0x55fef3d99738 in error_setg_internal /home/elmarco/src/qemu/util/=
error.c:95
    #4 0x55fef323acb2 in load_elf_hdr /home/elmarco/src/qemu/hw/core/load=
er.c:393
    #5 0x55fef2d15776 in arm_load_elf /home/elmarco/src/qemu/hw/arm/boot.=
c:830
    #6 0x55fef2d16d39 in arm_load_kernel_notify /home/elmarco/src/qemu/hw=
/arm/boot.c:1022
    #7 0x55fef3dc634d in notifier_list_notify /home/elmarco/src/qemu/util=
/notify.c:40
    #8 0x55fef2fc3182 in qemu_run_machine_init_done_notifiers /home/elmar=
co/src/qemu/vl.c:2716
    #9 0x55fef2fcbbd1 in main /home/elmarco/src/qemu/vl.c:4679
    #10 0x7ff89dfed009 in __libc_start_main (/lib64/libc.so.6+0x21009)

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/arm/boot.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 6d0c92ab88..784d301683 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -829,6 +829,7 @@ static uint64_t arm_load_elf(struct arm_boot_info *in=
fo, uint64_t *pentry,
=20
     load_elf_hdr(info->kernel_filename, &elf_header, &elf_is64, &err);
     if (err) {
+        error_free(err);
         return ret;
     }
=20
--=20
2.16.2.346.g9779355e34

