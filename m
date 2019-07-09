Received: by 2002:adf:a557:0:0:0:0:0 with SMTP id j23csp3632600wrb;
        Tue, 9 Jul 2019 05:33:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxNuQ7UZ5h5ZRShlmcFoEJ2sGj5kkZBW7Ya9ib+LL3s9wdGL7k2jLLMG5YwLOspXKc+a2zW
X-Received: by 2002:a50:bd8b:: with SMTP id y11mr25477641edh.202.1562675615267;
        Tue, 09 Jul 2019 05:33:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562675615; cv=none;
        d=google.com; s=arc-20160816;
        b=okhilfQnEoxy43Y8LUll3dxrxgn7kUOm67v2aT0qW9g4u99ZuvLtXIQ75Tt/X3Su3U
         c+VB0jqFzoM0Tgn9JkLAKASiQNdEAoyosuslg5Lrr4lbnExuwqvgUJGOQdCbLW9iAXSK
         EurkZ0vKR+pcDBH1fJVeDKfVEsV1B26FGqX+HqZNCeqDZfZJiQJIWBt59NQwAkTAYuGp
         f7Ftr4i7g7THpinjd1bPlJwv3LvlClXicuLAoWb32KJ0WDbFy/bKL3h7g/F4Kg2Hlk0s
         pfBE7BgqsbAwoYu0nACfY9hMjXGBBnEtXKkTfY67wOqj1cER2tG05AGBELcoLdnyNewT
         ZvKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=IvNYs7K1upMzHvhWJFVspRY7686Z6zCzwt2vt0+An90=;
        b=vVPwVKe0jZll1WgNY01qTldJMsrBRS3N3MBUdjGduu/R+1Qpup/c+uc2w187jlQmdo
         ISyEBI7ZGnVJ3F9XtiI3O07cQVcwKM1J50pBnHb+bDRo2+dJD/JXExrDfzicEEVssxKA
         MoCQSXWVqivfZBMRPm+GSrv1bbOTeTAOkpj/d5nTB0YViMyWD5VYU5caM+7GkQ8/aD5Q
         gvVjzqNjtziLZ+SN6vMsmcQW9fE9AerrsObkqqdoAerzl5KqGGYmHaXTzAYu0kTWRpxS
         4mlEiMsWniWO+v0bnEEoxFyIkSbL4+btO5e8i3XgKBRKveK5QfA6L1LzK8kOzW9cxgFS
         zYpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j26si17052724ede.86.2019.07.09.05.33.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2019 05:33:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hkpJO-0002mq-9m
	for alex.bennee@linaro.org; Tue, 09 Jul 2019 08:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59431)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hkpIv-0002fq-5F
 for qemu-arm@nongnu.org; Tue, 09 Jul 2019 08:33:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hkpIu-0004XD-0g
 for qemu-arm@nongnu.org; Tue, 09 Jul 2019 08:33:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60514)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hkpIt-0004WJ-Qs; Tue, 09 Jul 2019 08:33:03 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6A4BD3179B62;
 Tue,  9 Jul 2019 12:32:57 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-166.brq.redhat.com [10.40.204.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3CF21001B0F;
 Tue,  9 Jul 2019 12:32:54 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  9 Jul 2019 14:32:39 +0200
Message-Id: <20190709123240.16298-3-philmd@redhat.com>
In-Reply-To: <20190709123240.16298-1-philmd@redhat.com>
References: <20190709123240.16298-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Tue, 09 Jul 2019 12:32:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH-for-4.1 v6 2/3] hw/ssi/xilinx_spips: Avoid AXI
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
X-TUID: VfralfT9NW0d

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
Tested-by: Francisco Iglesias <frasse.iglesias@gmail.com>
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

