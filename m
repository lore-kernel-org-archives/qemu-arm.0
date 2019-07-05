Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3271621wru;
        Fri, 5 Jul 2019 08:11:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwGgylyzqbyr7TXuR+NTogHEVD+GPBDUdKqFlG505c4YdFJLzSzYe6oKIFgPNTRDeMAaR83
X-Received: by 2002:a05:6402:3d5:: with SMTP id t21mr4547822edw.13.1562339472063;
        Fri, 05 Jul 2019 08:11:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562339472; cv=none;
        d=google.com; s=arc-20160816;
        b=UxreJurFTT6TutAZEbt604jk5kkZrGPlr7btbP5wDUsjck+2DZtfXPamUzSP6+Zp6z
         lPiiYoEj68WoNu37EQqCA8vSowNSv1mRphLCGP5hKwged3gINwdtw0Xm2abJwgxU8RLG
         T5zCBJb5i/W0tVspvmVxlNSBEUcqVThVVOhUGKXPGiD+T5FqIXras2nNNG+CKcaeh4gv
         oqV1hLTvRBycbvDKoOC6N1hKP0PamOaTnD7E3kUgLxjnE5bjRU8C5SilTh7QmadSxoXo
         ZIRbGnATC7nX4+LkUyI/f5XnVFbISaQ9H54FBXlrp9kZ19r8dkA7PWhPsZWot0gUQazf
         k4fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=le02QQeEVEF5rJTTmwDlzeS3qsIsXZdgfF98qn67wks=;
        b=RQRA4fDpk2YZ4/m6nHzy1LE5KqJwZ1Y6hwQKE4YiOzVg8Ed1iTy//kSr9BYuOb0IQ1
         Z/m56n8bxxw3waURuW46UFaPRJhnsl42cPo74xWXYDhC2z51qaETHrWi4r+N0fQujnrz
         JBfbyxIU23lfaMgGi4o5qmF+kMPEI903ekwbeGhZgVLB2i207lO1Q/BHOrE57cRC2e6f
         ZmyYbW86eEoznSxSGh2/uxZarPOfxMAWuZP4gdQz2jCOLMxh9iVKhuHqe9ViuuEwQXC9
         5P3KP0bDkUVuXsk1KdkFm8NPwlWJGeXhZrEO+mUNJmAVDulb+Z+m6kI4R/Glz+FgCAQg
         5D8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e15si5541002eje.200.2019.07.05.08.11.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jul 2019 08:11:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hjPrh-0002JA-4V
	for alex.bennee@linaro.org; Fri, 05 Jul 2019 11:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57767)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hjPpt-0001kq-QC
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 11:09:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hjPpj-0000IY-BX
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 11:09:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34268)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hjPpj-0000AC-4C; Fri, 05 Jul 2019 11:09:07 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6233E8763B;
 Fri,  5 Jul 2019 15:09:05 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-45.brq.redhat.com [10.40.204.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9B5118000;
 Fri,  5 Jul 2019 15:09:00 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  5 Jul 2019 17:08:50 +0200
Message-Id: <20190705150850.4967-3-philmd@redhat.com>
In-Reply-To: <20190705150850.4967-1-philmd@redhat.com>
References: <20190705150850.4967-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Fri, 05 Jul 2019 15:09:05 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 2/2] hw/ssi/xilinx_spips: Avoid AXI writes to
 the LQSPI linear memory
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
 Alistair Francis <alistair@alistair23.me>,
 Prasad J Pandit <ppandit@redhat.com>, Lei Sun <slei.casper@gmail.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AfAfb7zP8eaa

Lei Sun found while auditing the code than a CPU write would
trigger a NULL pointer deference.

From UG1085 datasheet [*] AXI writes in this region are ignored
and generates an External Slave Error (SLVERR).

Fix by implementing the write_with_attrs() handler.
Return MEMTX_ERROR  when the region is accessed  (this error maps
to an AXI slave error).

[*] https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-=
ultrascale-trm.pdf

Reported-by: Lei Sun <slei.casper@gmail.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/ssi/xilinx_spips.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index e80619aece..4c0b0aa3c9 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -1221,8 +1221,24 @@ static MemTxResult lqspi_read(void *opaque, hwaddr=
 addr, uint64_t *value,
     return MEMTX_OK;
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

