Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2045470lfg;
        Fri, 21 Feb 2020 09:31:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqy9qll+ZAf36s6fOS4ir+aYEaGsHcBLCzPUcMQmQY/8GGn3ogLRPx7GEiuLSc085hjH0miS
X-Received: by 2002:ad4:4e91:: with SMTP id dy17mr32116375qvb.83.1582306273706;
        Fri, 21 Feb 2020 09:31:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582306273; cv=none;
        d=google.com; s=arc-20160816;
        b=kmNUBsH7fCtCY1GCMfOYStYAHbGzcAXttFnY4C1SaMawpur8gX+zAHxy0v78inN5Ed
         DfDza6VQtSc7Z/qJT0owdLvU4AFBCOpXn0Mas8JfgGQgGkDUzQGmh9dwM5reJxcq+ct3
         stZbh3gz9Kb2IPxBNkwpDso/I6ic+R2l1ttO/HFojITNjtH19P7FT9f+pV+mfZA3N85a
         KtOkHf707Gn9HU8CmgHQNoJ7LZJ72CLbPx1EvbxYzobKPPLYxhcLtOp9EztGvK64ew8J
         r7ss0tSLex3GGSEBQhdKPPUK+oKWEVfUyBthEAlSDZEvx6u/hmi7k/6pAnfbDeTteC2A
         6cgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=iIJbNClAaopu3XcwBy22eUj/Xx5fmW+fWgqNqWuWF1g=;
        b=DWkn8aG6aOLqzU7ZpxitoJ5T29lTfE/w24cq9RZ3lpiW20b2lSXWW1wLSmNk5wx1/u
         R1vv6+raEQd0nUyxeZwP1DadWNxYJbzY5IR2XCKo5DAiRqbjPn20+yr1Ypjo8ScSqY0y
         /b+hQwwjR6Gi2kIxCziGk9DPS/K7ppdmDm1gIBDpmPES9scGad0T0g0bOI1iZgwLRAZs
         /1kBe8BA25vdNaG35fhmgeOidVKbOTQYvtsiU3J6Rr93bpyO17j+Vl/uuQJjfy3vc4Kl
         5v9uQlWsd5n+gtD+4TVNYyGUQPjL+PpY4cVO36ZlCuXe+YycUdvbkXfNMO7icCThUSVk
         ZmiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AcdKK1yS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d17si1587794qtg.313.2020.02.21.09.31.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2020 09:31:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AcdKK1yS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j5C8v-00063N-0H
	for alex.bennee@linaro.org; Fri, 21 Feb 2020 12:31:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37986)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j5C8j-0005zI-Gi
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 12:31:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j5C8i-0007wG-B2
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 12:31:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59833
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j5C8i-0007w9-7h
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 12:31:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582306259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iIJbNClAaopu3XcwBy22eUj/Xx5fmW+fWgqNqWuWF1g=;
 b=AcdKK1ySoDG78zgeWUBjWgIX9pXeYGtU+Z3AAeRnAkEAx6tgZD+2dEcA5GVgeYLVt6nXz+
 2/9/J7yTk+6iSydbCJxFZOkdrdkYS00wBwVy3htL11RndQ8sD9Jj6IwNRVv7uKYpY7cVmM
 c7f86RoyFd4FD208WB9S3ICdkao+rfA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-j7Zl6s1AO0aIE62r04zHGg-1; Fri, 21 Feb 2020 12:30:56 -0500
X-MC-Unique: j7Zl6s1AO0aIE62r04zHGg-1
Received: by mail-wr1-f70.google.com with SMTP id o6so1313135wrp.8
 for <qemu-arm@nongnu.org>; Fri, 21 Feb 2020 09:30:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WhcONAkiFDeuSeZsi9vQPsSpTSVQ47zvNIPLgZ1YRDk=;
 b=GoDVFLITVW1RWleDLng6+NdNVCUOLJTHlGJ+v73IHx3fbQC1AK8rOgDDK50cL+wfyK
 NoMO55I559FZWZyDQ1kN3voUY2PfN/QIUVOdjzEgbY8tI8EEuTttXr+20VLreqId/UZD
 q7DKJDNSiUFtlGedRvKhJ4fUQIYZ60Ph+MMwfV3ftfvEdOJtfu9JjG/SnDcD6dBhRaBK
 xIhhFrwtI+EQ0mSx2C+XnISX2tDVaCbcjYhr86h/sD+o3jk+0dgBgshV3lXJt67JOEgE
 d9X0a1NOb/Qu50KqFxi7P99vrosJiczz3ine9FVI1UKuWwc+ducI7CePecv8GBaJzx2Z
 V4RQ==
X-Gm-Message-State: APjAAAXdUwFZ0lhaqcrgmbhh/S7/hH7v+LEhJKSoGHPZzjqT7m9szL3/
 5O1UteSQZjBJS0vizwGzL1oRFZwUlcInx6eYc1gElSXtgfqA7n1YAeX6kpGYu8fQNkiZE0iS4/H
 wBYzpDarYYyEF
X-Received: by 2002:a5d:4a06:: with SMTP id m6mr50053538wrq.155.1582306254964; 
 Fri, 21 Feb 2020 09:30:54 -0800 (PST)
X-Received: by 2002:a5d:4a06:: with SMTP id m6mr50053522wrq.155.1582306254743; 
 Fri, 21 Feb 2020 09:30:54 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id h18sm5000871wrv.78.2020.02.21.09.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 09:30:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] scripts/coccinelle: Add a script to let devices own their
 MemoryRegions
Date: Fri, 21 Feb 2020 18:30:43 +0100
Message-Id: <20200221173049.18134-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200221173049.18134-1-philmd@redhat.com>
References: <20200221173049.18134-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>, qemu-riscv@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I34eYGgWZjng

When a device creates a MemoryRegion without setting its ownership,
the MemoryRegion is added to the machine "/unattached" container in
the QOM tree.

Example with the Samsung SMDKC210 board:

  $ arm-softmmu/qemu-system-arm -M smdkc210 -S -monitor stdio
  (qemu) info qom-tree
  /machine (smdkc210-machine)
    /unattached (container)
      /io[0] (qemu:memory-region)
      /exynos4210.dram0[0] (qemu:memory-region)
      /exynos4210.irom[0] (qemu:memory-region)
      /exynos4210.iram[0] (qemu:memory-region)
      /exynos4210.chipid[0] (qemu:memory-region)
      ...
      /device[26] (exynos4210.uart)
        /exynos4210.uart[0] (qemu:memory-region)
    /soc (exynos4210)
      ^
       \__ [*]

The irom/iram/chipid regions should go under 'soc' at [*].

Add a coccinelle script to do automatic semantic patching.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 .../memory_region_owner_nonnull.cocci         | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 scripts/coccinelle/memory_region_owner_nonnull.cocci

diff --git a/scripts/coccinelle/memory_region_owner_nonnull.cocci b/scripts=
/coccinelle/memory_region_owner_nonnull.cocci
new file mode 100644
index 0000000000..6748a200b2
--- /dev/null
+++ b/scripts/coccinelle/memory_region_owner_nonnull.cocci
@@ -0,0 +1,80 @@
+/*
+  Usage:
+
+    spatch \
+        --macro-file scripts/cocci-macro-file.h \
+        --sp-file scripts/coccinelle/memory_region_owner_nonnull.cocci \
+        --keep-comments \
+        --in-place \
+        --dir .
+
+*/
+
+// Device is owner
+@@
+typedef DeviceState;
+identifier device_fn, dev, obj;
+expression E1, E2, E3, E4, E5;
+@@
+static void device_fn(DeviceState *dev, ...)
+{
+  ...
+  Object *obj =3D OBJECT(dev);
+  <+...
+(
+- memory_region_init(E1, NULL, E2, E3);
++ memory_region_init(E1, obj, E2, E3);
+|
+- memory_region_init_io(E1, NULL, E2, E3, E4, E5);
++ memory_region_init_io(E1, obj, E2, E3, E4, E5);
+|
+- memory_region_init_alias(E1, NULL, E2, E3, E4, E5);
++ memory_region_init_alias(E1, obj, E2, E3, E4, E5);
+|
+- memory_region_init_rom(E1, NULL, E2, E3, E4);
++ memory_region_init_rom(E1, obj, E2, E3, E4);
+|
+- memory_region_init_ram(E1, NULL, E2, E3, E4);
++ memory_region_init_ram(E1, obj, E2, E3, E4);
+|
+- memory_region_init_ram_ptr(E1, NULL, E2, E3, E4);
++ memory_region_init_ram_ptr(E1, obj, E2, E3, E4);
+|
+- memory_region_init_ram_shared_nomigrate(E1, NULL, E2, E3, E4, E5);
++ memory_region_init_ram_shared_nomigrate(E1, obj, E2, E3, E4, E5);
+)
+  ...+>
+}
+
+// Device is owner
+@@
+identifier device_fn, dev;
+expression E1, E2, E3, E4, E5;
+@@
+static void device_fn(DeviceState *dev, ...)
+{
+  <+...
+(
+- memory_region_init(E1, NULL, E2, E3);
++ memory_region_init(E1, OBJECT(dev), E2, E3);
+|
+- memory_region_init_io(E1, NULL, E2, E3, E4, E5);
++ memory_region_init_io(E1, OBJECT(dev), E2, E3, E4, E5);
+|
+- memory_region_init_alias(E1, NULL, E2, E3, E4, E5);
++ memory_region_init_alias(E1, OBJECT(dev), E2, E3, E4, E5);
+|
+- memory_region_init_rom(E1, NULL, E2, E3, E4);
++ memory_region_init_rom(E1, OBJECT(dev), E2, E3, E4);
+|
+- memory_region_init_ram(E1, NULL, E2, E3, E4);
++ memory_region_init_ram(E1, OBJECT(dev), E2, E3, E4);
+|
+- memory_region_init_ram_ptr(E1, NULL, E2, E3, E4);
++ memory_region_init_ram_ptr(E1, OBJECT(dev), E2, E3, E4);
+|
+- memory_region_init_ram_shared_nomigrate(E1, NULL, E2, E3, E4, E5);
++ memory_region_init_ram_shared_nomigrate(E1, OBJECT(dev), E2, E3, E4, E5)=
;
+)
+  ...+>
+}
--=20
2.21.1

