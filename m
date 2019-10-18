Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1099076wrm;
        Fri, 18 Oct 2019 08:54:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx8FwV6Ta90JRCZAbx/i6gBdfDsdz+KMihQc8lNdnT6fukLso3ctxwzRFQdtsRe4dKF+bYX
X-Received: by 2002:ac8:6686:: with SMTP id d6mr10099546qtp.332.1571414060630;
        Fri, 18 Oct 2019 08:54:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571414060; cv=none;
        d=google.com; s=arc-20160816;
        b=sJxB7tg2KiHA+RbfTiPdpW00qrQn/Dlpiu9POkGofO8mR3EfsBayDyg0TsMIBlMVHb
         xsw91tbIkjZxLXVe+mJXfjmZ5IrCMe8yEeYaI++Oa/Kr9NRRObW2dMuCJkhmnycIz42i
         h8WFmHluU4RElvNpRpn1McjFwIydiUlMOu8ATrE/KUpE5LRwRgb4WUG1sv8Q2EIhsVYa
         ++zFoOVc2SNDpa+Hv64djIfPpZEl47uWJ/5G3xZlASuaLd37NBY5VDO1yidwwYuVA27k
         YVLZJfv8X2wtMB2C1R1OUYoW/0OOdGgD3kIKw1SVeeCSrgZBqvIjGbbWQC2ZTSTxH8vq
         gwRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=CTiG1KaZfjDaygHMNC6FC+JNEMyLebW0Olscx6Md7TQ=;
        b=ROyxmX+n2n8lYXDsEHmx/VhPkwknGRowJ9rYvQCLDgXgQaY97dYnb+WACI13fYpLz4
         rxYhNv7bnZX2SeFRHJFxq2s/LQhg6bzaZAHc4oVDhTsIdn4Wis/LY7UlxCGeXFa2B2V4
         F+u8x7rlwMIQNbrlAswtD9SYO8sf6Rs0k/AowJ7iai2Ix1JkwYNyWzf4k4g/A07EVbl9
         ehQ3qpSGZLmn613TLzsj1brhgajk4ro1GNRI8AqOWQl+5SFe2qUzmy22eyTrV55NldPu
         bZDy/coakbzvnoV3p2ypewo1KZcqruChomGRgLtOmq93aA+b1lhDZNZrCfx6zNRev7Sa
         5rCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a5si6245790qtm.220.2019.10.18.08.54.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 08:54:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLUa3-00054v-Kk
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 11:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44722)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iLUQ6-0001sf-CF
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 11:44:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iLUQ5-0007kn-Bl
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 11:44:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47740)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iLUQ5-0007kJ-6I; Fri, 18 Oct 2019 11:44:01 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 395AE3071D9E;
 Fri, 18 Oct 2019 15:44:00 +0000 (UTC)
Received: from localhost (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDF7160BF4;
 Fri, 18 Oct 2019 15:43:54 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/14] qdev: remove PROP_MEMORY_REGION
Date: Fri, 18 Oct 2019 17:42:11 +0200
Message-Id: <20191018154212.13458-14-marcandre.lureau@redhat.com>
In-Reply-To: <20191018154212.13458-1-marcandre.lureau@redhat.com>
References: <20191018154212.13458-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Fri, 18 Oct 2019 15:44:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K19eF+wjpMKG

PROP_MEMORY_REGION was a derivative of PROP_PTR, added in commit
ed03d749f3f513b8fb0287757cfda2cb6825f063 (qdev: add MemoryRegion
property) and thankfully no longer needed since commit
3eff40dbf44896a8180c86c84dbdefb2eb173fbe (hw/misc: Remove
mmio_interface device).

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 include/hw/qdev-properties.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index c6a8cb5516..16837ab5dd 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -216,8 +216,6 @@ extern const PropertyInfo qdev_prop_pcie_link_width;
     DEFINE_PROP_UNSIGNED(_n, _s, _f, 0, qdev_prop_blocksize, uint16_t)
 #define DEFINE_PROP_PCI_HOST_DEVADDR(_n, _s, _f) \
     DEFINE_PROP(_n, _s, _f, qdev_prop_pci_host_devaddr, PCIHostDeviceAdd=
ress)
-#define DEFINE_PROP_MEMORY_REGION(_n, _s, _f)             \
-    DEFINE_PROP(_n, _s, _f, qdev_prop_ptr, MemoryRegion *)
 #define DEFINE_PROP_OFF_AUTO_PCIBAR(_n, _s, _f, _d) \
     DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_off_auto_pcibar, \
                         OffAutoPCIBAR)
--=20
2.23.0.606.g08da6496b6

