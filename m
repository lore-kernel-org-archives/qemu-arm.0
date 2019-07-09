Received: by 2002:adf:a557:0:0:0:0:0 with SMTP id j23csp3632574wrb;
        Tue, 9 Jul 2019 05:33:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxqVUOR7LkTCyhv+9Eh0W719DZ3sMAtI6hyTCRX5X51nKotrealqhcMpduXRoAa6uNp/3Hs
X-Received: by 2002:a17:906:e91:: with SMTP id p17mr21414162ejf.217.1562675614039;
        Tue, 09 Jul 2019 05:33:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562675614; cv=none;
        d=google.com; s=arc-20160816;
        b=NwLEWuh283wZrY6ASufygFa3sGca3SwRujjHm7KlkRIc25Y2aGaa952ZohUIfGvt/p
         cdooXwm9zzlf+0kTtZtEcN3kSF5dKAIAZuKrTnuTl3y0H/Tj3bbIt5aTpT8tK/rBndia
         Gun3B5Bp71+Fuv7ZmgPNJtrPFW6gGdODieciPRacgtegMr3x8eNFLYG5GTbuYVUEy7SS
         f+7qXrhJ0tikLWLVtn3FrwAdERJENxspnOpwWm7NZFYNnTAbrgBch1MmLnejz0LQmeyS
         a+veri6E3fVXlVC61PUhMVgHbTvfUWKKHIcty6wneGKYRpsjhLqHwY9GeEaXCSvY2loB
         rgGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=viUiS2FSc5/NZvlD2g9bsnbkcUHysQf/24txu07mB0U=;
        b=VHp9ivsBK1yxudttxlod7kaNIHhETs+XmHHCzsLlCWKFdx2570wWOhQu91ZaBhKlTx
         oVLv0jFeN3VsLQu77tXX5YvvhTTmvInJQMwDe0fRusib2m0al99GrqJMdaaF34V61sq0
         xj0Lrd0ELIgvfw3YhUT7Uzs3DaUzVTYC3bFJ+OKXG7XHfqmMN4tbv2gtaqCtxKI/S///
         KRmljJT6i3pLadQ71hE/wisokiOaeQ4bsy1QkIR5IG102PWznOGv7Jh/0jFsjmHkDsBp
         wFr5UIh3b5j43T/emov0rQKaV4b4izkhkbY3OF0twDWMw6FNUGivCyGnR7zlHH7DCxS6
         ++gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k25si12747526ejz.54.2019.07.09.05.33.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2019 05:33:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hkpJM-0002hP-3j
	for alex.bennee@linaro.org; Tue, 09 Jul 2019 08:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59413)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hkpIu-0002eY-7V
 for qemu-arm@nongnu.org; Tue, 09 Jul 2019 08:33:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hkpIt-0004Wc-8G
 for qemu-arm@nongnu.org; Tue, 09 Jul 2019 08:33:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38568)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hkpIt-0004Rv-2g; Tue, 09 Jul 2019 08:33:03 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 292EDA3EAF;
 Tue,  9 Jul 2019 12:32:54 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-166.brq.redhat.com [10.40.204.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FAE71001B37;
 Tue,  9 Jul 2019 12:32:51 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  9 Jul 2019 14:32:38 +0200
Message-Id: <20190709123240.16298-2-philmd@redhat.com>
In-Reply-To: <20190709123240.16298-1-philmd@redhat.com>
References: <20190709123240.16298-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Tue, 09 Jul 2019 12:32:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH-for-4.1 v6 1/3] hw/ssi/xilinx_spips: Convert
 lqspi_read() to read_with_attrs
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
X-TUID: RhKOl3qboVnM

In the next commit we will implement the write_with_attrs()
handler. To avoid using different APIs, convert the read()
handler first.

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Tested-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v4: Do not ignore lqspi_read() return value (Francisco)
---
 hw/ssi/xilinx_spips.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index 8115bb6d46..b7c7275dbe 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -1202,27 +1202,26 @@ static void lqspi_load_cache(void *opaque, hwaddr=
 addr)
     }
 }
=20
-static uint64_t
-lqspi_read(void *opaque, hwaddr addr, unsigned int size)
+static MemTxResult lqspi_read(void *opaque, hwaddr addr, uint64_t *value=
,
+                              unsigned size, MemTxAttrs attrs)
 {
-    XilinxQSPIPS *q =3D opaque;
-    uint32_t ret;
+    XilinxQSPIPS *q =3D XILINX_QSPIPS(opaque);
=20
     if (addr >=3D q->lqspi_cached_addr &&
             addr <=3D q->lqspi_cached_addr + LQSPI_CACHE_SIZE - 4) {
         uint8_t *retp =3D &q->lqspi_buf[addr - q->lqspi_cached_addr];
-        ret =3D cpu_to_le32(*(uint32_t *)retp);
-        DB_PRINT_L(1, "addr: %08x, data: %08x\n", (unsigned)addr,
-                   (unsigned)ret);
-        return ret;
-    } else {
-        lqspi_load_cache(opaque, addr);
-        return lqspi_read(opaque, addr, size);
+        *value =3D cpu_to_le32(*(uint32_t *)retp);
+        DB_PRINT_L(1, "addr: %08" HWADDR_PRIx ", data: %08" PRIx64 "\n",
+                   addr, *value);
+        return MEMTX_OK;
     }
+
+    lqspi_load_cache(opaque, addr);
+    return lqspi_read(opaque, addr, value, size, attrs);
 }
=20
 static const MemoryRegionOps lqspi_ops =3D {
-    .read =3D lqspi_read,
+    .read_with_attrs =3D lqspi_read,
     .endianness =3D DEVICE_NATIVE_ENDIAN,
     .valid =3D {
         .min_access_size =3D 1,
--=20
2.20.1

