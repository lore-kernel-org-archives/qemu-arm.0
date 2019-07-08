Received: by 2002:adf:a557:0:0:0:0:0 with SMTP id j23csp2292391wrb;
        Mon, 8 Jul 2019 03:50:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzbYPQScbce5k7i3p2BaVw86V+iVYMzHdtHFb6t5ib+PEHIhWaw07q7c84B391LJri2/dmW
X-Received: by 2002:a17:906:340e:: with SMTP id c14mr12412988ejb.170.1562583000370;
        Mon, 08 Jul 2019 03:50:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562583000; cv=none;
        d=google.com; s=arc-20160816;
        b=dFgG7g6otL2NMEkTb1nk2a3rjdv/fciN13up6E3hovLq31aAqFrJes1++WDZb/4Stc
         Hw6Ds44ZnfFZUvKfZ/d4ubGmAKTe7TdT/oqosczGQYzjldXnwvFC8aDi/95kUr+2/H0P
         lByPDnNI7FpeiDeGsf8GWHZu4PxzYttBhn7UcfFdAuf+g49zmLy3rG6JB2VUhNP1S1Xm
         OOR35Nwf7u3LpT8Uv5g+y+xhy+QYoRtvBlw2P0r/BtVQqaElFVxPI2jVRtC2o9BuetzC
         h06S05p3rG6QV6Kr6wwxcnEpD688YZvC3l7tgM1upmOrhw1NvC3Qb4xHmU5oe44Azw8g
         C0pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Y/qK6wnCYYVhyqInXeWbmnzabQeYOGdFBRU+ssWpyoc=;
        b=PbazRXu2789aZF2xz5ayEJs3WBcb4mDBLthZn5/bn+bQ6o9gFaxxI+LcS9oSuN2xdC
         bkTKxAuWElfrmjlj+cWsUsoQiOx/40dKFzCtRpmx+zZFB3rv7cdH/0JOUtNHLtg85wPu
         MOd1DUOYVo0wQnORoAoyeKimsFB4/JvpTDQM28bwt1nWfMODmNUopk+aCAW6VgiBVE/b
         tb8quBolfzRIRiVDotsd1K5NlMythv4aYoV90v17pZLwdjpLBa+8GwwliRrFmmd54Gqd
         hjw0EyFEavPd0fBVvAaRQntG7AOa8KFAfAqqzmgKlWwRI7QEFIN3AN3AdUh3tjtOU5SJ
         4Lwg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e15si10088633eje.200.2019.07.08.03.50.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jul 2019 03:50:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hkRDb-0004GB-EV
	for alex.bennee@linaro.org; Mon, 08 Jul 2019 06:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39911)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hkRC5-0002vN-0J
 for qemu-arm@nongnu.org; Mon, 08 Jul 2019 06:48:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hkRC3-0006GB-Tr
 for qemu-arm@nongnu.org; Mon, 08 Jul 2019 06:48:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57788)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hkRC3-0006FW-Me; Mon, 08 Jul 2019 06:48:23 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DA1AF3002738;
 Mon,  8 Jul 2019 10:48:17 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-112.brq.redhat.com [10.40.204.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD6CE2E03C;
 Mon,  8 Jul 2019 10:48:13 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  8 Jul 2019 12:47:49 +0200
Message-Id: <20190708104750.1071-3-philmd@redhat.com>
In-Reply-To: <20190708104750.1071-1-philmd@redhat.com>
References: <20190708104750.1071-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Mon, 08 Jul 2019 10:48:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH-for-4.1 v5 2/3] hw/ssi/xilinx_spips: Avoid AXI
 writes to the LQSPI linear memory
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
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-stable@nongnu.org,
 Prasad J Pandit <ppandit@redhat.com>, Lei Sun <slei.casper@gmail.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i193/Oc7/ila

Lei Sun found while auditing the code that a CPU write would
trigger a NULL pointer dereference.

From UG1085 datasheet [*] AXI writes in this region are ignored
and generates an AXI Slave Error (SLVERR).

Fix by implementing the write_with_attrs() handler.
Return MEMTX_ERROR when the region is accessed (this error maps
to an AXI slave error).

[*] https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-=
ultrascale-trm.pdf

Reported-by: Lei Sun <slei.casper@gmail.com>
Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v4: Fix typos (Francisco)
---
 hw/ssi/xilinx_spips.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index b7c7275dbe..3c4e8365ee 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -1220,8 +1220,24 @@ static MemTxResult lqspi_read(void *opaque, hwaddr=
 addr, uint64_t *value,
     return lqspi_read(opaque, addr, value, size, attrs);
 }
=20
+static MemTxResult lqspi_write(void *opaque, hwaddr offset, uint64_t val=
ue,
+                               unsigned size, MemTxAttrs attrs)
+{
+    /*
+     * From UG1085, Chapter 24 (Quad-SPI controllers):
+     * - Writes are ignored
+     * - AXI writes generate an external AXI slave error (SLVERR)
+     */
+    qemu_log_mask(LOG_GUEST_ERROR, "%s Unexpected %u-bit access to 0x%" =
PRIx64
+                                   " (value: 0x%" PRIx64 "\n",
+                  __func__, size << 3, offset, value);
+
+    return MEMTX_ERROR;
+}
+
 static const MemoryRegionOps lqspi_ops =3D {
     .read_with_attrs =3D lqspi_read,
+    .write_with_attrs =3D lqspi_write,
     .endianness =3D DEVICE_NATIVE_ENDIAN,
     .valid =3D {
         .min_access_size =3D 1,
--=20
2.20.1

