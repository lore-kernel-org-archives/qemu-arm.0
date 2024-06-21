Received: by 2002:a17:505:2e08:b0:1bd8:8c49:4f6d with SMTP id ya8csp151519njc;
        Fri, 21 Jun 2024 05:03:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWV5LQYfCNxpB1lmUMlspNytSN58Rv69OX45ZtlMZQxwRZTiHBb889alNjjiry+XHzIbVMdZRV2mBifoXhE1keBAELamhI8
X-Google-Smtp-Source: AGHT+IFZCN8yFmFLMMDbLPC4l/6hIJ80r6zzWW3uWzr1dW/gTT+bIRcWt5SyGYJbcTFrgyyh8DZi
X-Received: by 2002:a05:6830:1e72:b0:6f9:78f1:eb52 with SMTP id 46e09a7af769-700748c94damr8188813a34.12.1718971426164;
        Fri, 21 Jun 2024 05:03:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718971426; cv=none;
        d=google.com; s=arc-20160816;
        b=PrAfJ4UYxLtPjSq78fg0RjHTfPmiAVIRUFB6clgVF1YO258KH+pQLiqGTeTdLXethz
         Kl6Pekl/vg3Nl+rrZuCLlTChAYefBhVOWEpQ9c1yMLqYHFnY6PHhijJqBvOVZqfkZfXv
         beaZarb7nnkCpRw01It/W+VQJsD7w3B41K9MmxYTjIfcivqq01jEyQ9hjdHfeyG1AJFo
         GYRiKvCoinzhh5cWtDeZu5Q6Q5DxNphVceIOYdAVL0NQkKHJp6AHaivvaZw2tneskkjm
         7+xSV3re8UeOQ64eO8muthWCy3zjDpB4q0WJphzzzAtBqMa/LtxJCuTefRhLR+PgXSey
         6KYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SPyOu1IwMNogunIuIjBkDIc9zx4X6xTuQJ4OgT7GMUM=;
        fh=gZqsKo5EbTATTgC/MAbkS23yq5CRLeoEzofPwhlLI3c=;
        b=kwY9X6o9EOEuHKYPnunXEQuOoqiUFZUmbsCLXaX8jhSYoK2wPggDlviQ1LShqKGalm
         Ap8QcuppdeMJDtM+uf/yjS9p8gwRoRSA9kv9APgUA3ARFg1ZQAPJyWhju9hAHxxb/KlY
         hfXbZpg/GYK3aiATLgCjPCeWf1hw+PjH+fg7CrkKGUNp6qhAvIBccKqdsBQWJxjxMxvm
         m3JuxrFTnsCxxkxDHhJ2TZcWnFpMf9naRL7RUaGPSEWTv1qVk8jj8DsRlMPlv1s5eVlD
         ncfZomKOhOIBjAQHu9JhsJnVVFL8XW8kX5p1Vhe1xMqGwEyX/O9q6dE7KTSgktXa3+Np
         86aw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=oQj6p6je;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce941f20si172837985a.570.2024.06.21.05.03.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2024 05:03:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=oQj6p6je;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sKcwh-0005v2-Oz; Fri, 21 Jun 2024 08:00:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sKcwJ-0005cV-H8
 for qemu-devel@nongnu.org; Fri, 21 Jun 2024 08:00:24 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sKcwG-0003Pz-96
 for qemu-devel@nongnu.org; Fri, 21 Jun 2024 08:00:23 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1f480624d10so15599635ad.1
 for <qemu-devel@nongnu.org>; Fri, 21 Jun 2024 05:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1718971217; x=1719576017; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SPyOu1IwMNogunIuIjBkDIc9zx4X6xTuQJ4OgT7GMUM=;
 b=oQj6p6je9QJ9DXadZHlsPVIwM+o62JfxPCf03J8vYfceq6vVai3RuEOiPsDthteX7z
 Kyar6MS7LZUKELlO4GAdSNuJ5SjyJLbkQ8fcJolJGyc/0EdzwxkpBaV6j4iV7T6a0nH4
 IB8uIxXa7x8DoOF4dhZ5tTgYTtSF8NygmiGvFDAeqDX8K/GypBO3ZFRGOc+bC0Jk0TWi
 T8B3dY0tN3359aBVaXCEXJRobmV/Rmos9bLsQX8tq/xC63cb0BQAmTesC8qgnD0a1v/C
 1G6zG74rwiSSkHVkeXfwM2QqY2hKmeIFkA+AZ3NW9zcywhQLrj732Grj1il2J+XEGcCK
 L+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718971217; x=1719576017;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SPyOu1IwMNogunIuIjBkDIc9zx4X6xTuQJ4OgT7GMUM=;
 b=w8r8isNzOWXhzsOmpBLDa4cvEr8RkM4GFicT//mAXVuvZiakYmCj5Fp44/cGc2YIph
 6/AMy3Lov8xBx7/n+c/0rKaIwkWjJ5o+eMpgmq38uCWmCTbru2Lrrj7RtqOQv0cMxzBE
 /cufFHg4H4oNmQACGmK7dOpgmp19OWLckhBmwgkd+uYQLUapJNTZz9TPGS2mlkniR36B
 U5fQMnLRK1J2tOf4nvZT1P5ZVF7OQ9MBadjldDNA5i1q3GWXez7d3Ks77//XDAuAkcGF
 shkq76vdNHe7LI2uy+YMWMrL6faAroQDwsvzyz+wSE9wvSFhZcne4K5cDpYPc/+XY2jE
 z6lg==
X-Gm-Message-State: AOJu0YwpQXJ+Zg2B4QiPsXG2FI5MaRy4jUYKMI4b3VgqsKg9sv2/K0lU
 cypPx+1RMSUQLAGdr35zK+Ff6FAY7eOh1NFRQ3tqVxQUg84YLAyWdS2xkQZKC1vxbZNh6JYNOu1
 P
X-Received: by 2002:a17:902:e885:b0:1f9:c8cc:9e2d with SMTP id
 d9443c01a7336-1f9c8cca31fmr60315195ad.28.1718971217126; 
 Fri, 21 Jun 2024 05:00:17 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9ebbb606dsm12422995ad.270.2024.06.21.05.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 05:00:16 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 11/15] pc-bios/meson.build: Add support for RISC-V in
 unpack_edk2_blobs
Date: Fri, 21 Jun 2024 17:29:02 +0530
Message-Id: <20240621115906.1049832-12-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
References: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5XROtVgz9IoU

Update list of images supported in unpack_edk2_blobs to enable RISC-V
ACPI table testing.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 pc-bios/meson.build     | 2 ++
 tests/qtest/meson.build | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index 0760612bea..8602b45b9b 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -4,6 +4,8 @@ if unpack_edk2_blobs
     'edk2-aarch64-code.fd',
     'edk2-arm-code.fd',
     'edk2-arm-vars.fd',
+    'edk2-riscv-code.fd',
+    'edk2-riscv-vars.fd',
     'edk2-i386-code.fd',
     'edk2-i386-secure-code.fd',
     'edk2-i386-vars.fd',
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 12792948ff..6508bfb1a2 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -259,6 +259,9 @@ qtests_s390x = \
 qtests_riscv32 = \
   (config_all_devices.has_key('CONFIG_SIFIVE_E_AON') ? ['sifive-e-aon-watchdog-test'] : [])
 
+qtests_riscv64 = \
+  (unpack_edk2_blobs ? ['bios-tables-test'] : [])
+
 qos_test_ss = ss.source_set()
 qos_test_ss.add(
   'ac97-test.c',
-- 
2.40.1

