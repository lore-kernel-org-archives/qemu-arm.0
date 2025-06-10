Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1665660njc;
        Tue, 10 Jun 2025 13:42:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWVoRBYl/B13iMkHKQ1fF0u/v9lIbV9yV7KtxcsArxdc3SiJ4/lOVL+1DT0hONw99Rb73i5BGO6UqktSA==@linaro.org
X-Google-Smtp-Source: AGHT+IEk4uN/kE1ExssrPzJGg5qrZKqY0XWSIluTw8hg39o3k1e2T6yz5PKtAvKbuMmPqcIBNAkY
X-Received: by 2002:a05:620a:1a21:b0:7cd:2857:331c with SMTP id af79cd13be357-7d3a893a2demr108070985a.42.1749588134120;
        Tue, 10 Jun 2025 13:42:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749588134; cv=none;
        d=google.com; s=arc-20240605;
        b=h9Tt5wijSqxEfKC7GnNAoY5Oq2P1ZQTmyKXAWg63ks+SNzVG1zHNgRZVrvcbq1LeIp
         AnM6JA6pzLpH0MqhZ8Q2JBz5nWkHKxxtSWQ9eqGpmHNS/XRRxZHHQee6VKm/W5sx3C9z
         4eL6iehrl2iXewuuwUyj/z3jAEvUdqOoJZxqJ5RrIutKLWdRvvwQv8HmPTnhqCSTNoiU
         6Wr4OlTm2uEfvi0XBAepzL5O/HBunSXmjEp9Rq9u6rI535mosBRTNun+4u6j+zj/BQCc
         rCLdaa4v1WWXe2gqR/P8TZEFjQqi+Vhcj0mHrM4aqMoPb+BaMe4e3VxIgScClT2yZTBT
         oBwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=QZzAerTSiSj2iP/yiVo1pLCMeUgucyrx0qc66O/SPas=;
        fh=70DlgAbl4ZQ08l1JxEcab2FELPbWI/jcKyko5ywgOko=;
        b=FJLnioYYEZq/Xrnle4SVIU0tdYVHcqCLSk1SN2/qHlv13zWzJvnHE0eK7fhJV65jOs
         ZhKsV4DGKtuXa25TKNr/aDq3Dv2DPZ70pHSWXtuy5cy2OWb4T/RyoDANfglTRS3JHQSd
         XrpwMSCcpOIwUGe2m6J+8nV7BvpREn8/OLpGDuDybJDdEDTSHbcMPJn0SKM+v51TpMXt
         rpse9aAs7hBcorJnWw1Ul7XXzCFHLuqMC04WL+v6CcmvJrXCFx/Vat+lrHZ+cXBbleoF
         oQu5GLwiWF+tl0JSNh24ys9IyXPskfR4tspMz4dQcSreshzLF5asbGluwLdne8T9UicG
         ruBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=nqhBFcIm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d25a5f0fa7si1079719685a.266.2025.06.10.13.42.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Jun 2025 13:42:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=nqhBFcIm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uP5n5-000613-To; Tue, 10 Jun 2025 16:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1uP5my-0005oe-Ey; Tue, 10 Jun 2025 16:41:44 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1uP5mw-0003Qx-1u; Tue, 10 Jun 2025 16:41:44 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-606ddbda275so10805944a12.1; 
 Tue, 10 Jun 2025 13:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749588099; x=1750192899; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QZzAerTSiSj2iP/yiVo1pLCMeUgucyrx0qc66O/SPas=;
 b=nqhBFcImZY+dnyVa+NMlibD3BqX1SC2+T6FeIDDG1dg+v8Og/9cS1lZv8PVcgd5AXD
 xM4t7RUdB1behKIqLSomY/OJcfpFj5JTgcSlbmVUgQsEOOEVyC5R3SU+dgxHVmPow3Q1
 m4u1x1QuqE1P0/luNKwBxj6NXs0hFq6wDZxryIES0eS76VOpdWTg1uY4n+HbOQUpNY9c
 NFAfWd71pb5OZg4Q1m0PrkSjUD6fvvHD6LB2EAa/juQPWjK64+mK6/k2l72Poo7xERs9
 pjGp8piuLTeGNXXZbPb5DV6jVMyHj7a/W2rdSlpccMqQ/ezvS0BMa3Mv/FTVTU5rcKQO
 ApMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749588099; x=1750192899;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QZzAerTSiSj2iP/yiVo1pLCMeUgucyrx0qc66O/SPas=;
 b=P0rOwcb/Rm9/Jw25s5EKuF1P1UqO/vbZdldAu3xatZLC3w+uQeO6b/GqbME/TaLHdm
 OfxuXbCG3mnQwqCf3xuGn4jBiwtrdgO/TbHZRQRwsH/IDNQp/N1ciIdky2TOcETLnzgB
 LwYzWk+wKDv/fkoO6u8bcMsSTAvjAa1zrbvEodAfhSz3UZfftQeFQr2HVLLBZErE8mY3
 7G90NSDwsaeZtK7NVPCU/y0e1SDpNyP0zn51CHp3GV+lZXv2farvQBegWQ1TvWT6CHBE
 2pPdI/eyQT596r9unWpP/MMmipsePKR7AZcniPgg4AwNCWOg/dP/i55P+Gcw6OrQuff3
 3HfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAPcJB445KeHIxPg2F4l2tsDoRRmeNHztwR+vGumU9c25pFOwbPE3h1SOJGHO++QnuYZ1MeeJFRg==@nongnu.org
X-Gm-Message-State: AOJu0YwprnKQ/2jx6yxyQRa8S7FFy87XPU/l05BEbRgPqd9/oVgbeQa+
 IHHpPW7hp+sROU3L9b2psvCa1X6ViAFFUUba6nMVwABnwREJAQEYg/jkznH8Pg==
X-Gm-Gg: ASbGncuSx45CXGMEkX7N5nTbOZhEwzutyUFTiHpYgwgk22Lp/nNVyY61kKr1sY6s07p
 oxuI2B6FeTw6ickEvr1GMycSAQloy9tCay64e0izsGklB2X3eAbrs+dmunN77QZCgtj4wxjaDDB
 P4TrSKBPgqU9qUKDGRtgXDMAih9sZ1Qp4tzK9W6N2+Buh87+L3wjdixMY52sgXI9EsMXWqrAClm
 v0Uf8wdFENXTQevnDGfxMg1gLOOSj3VIjc8vPQdL3KJn9XnvcSS+kILYf1o2nH9UIVR2UPkqjtY
 g98Tjo/c56cCzjAyOIicD02j8C838BgHzFXWUN/woXanIxkn2Q39ATz0Dxug78Bx87tCEEQZHTj
 GcJ5JNzAlG8I4QxNyN5nbOKXy0Wd2nU4gVoa5i2tRjpq4VIzZ6GpN98744iG5GrYP3Lq24EmO/y
 hM3QiIeg==
X-Received: by 2002:a05:6402:2745:b0:608:3f9c:c69d with SMTP id
 4fb4d7f45d1cf-60846d2e9efmr506657a12.33.1749588098882; 
 Tue, 10 Jun 2025 13:41:38 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-2a02-3100-2cbf-5d00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:2cbf:5d00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-607783de2bcsm6521847a12.68.2025.06.10.13.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 13:41:38 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 0/5] DTB build housekeeping
Date: Tue, 10 Jun 2025 22:41:26 +0200
Message-ID: <20250610204131.2862-1-shentey@gmail.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: TelrceTNOZnA

This series removes the bundled device tree blobs from the repository which are
redundant to the bundled device tree sources. To make this work, the device tree
compiler 'dtc' is now required for the boards which rely on these device trees.
Building these board can be enforced with a 'dtc' build option which should
help packagers. For simplicity, 'dtc' is searched for in the system only rather
than also considering the 'dtc' submodule.

I also tried unsing Meson's source_set::add(when: ...) for building only the
needed DTBs but eventually found it to be too over-engineered.

Last but not least two inconsistencies regarding QEMU_FILE_TYPE_DTB are fixed
which seem to be latent bugs (one of which materializes in my e500-fdt branch).

Bernhard Beschow (5):
  hw: Fix type constant for DTB files
  pc-bios/dtb/meson: Prefer target name to be outfile, not infile
  scripts/meson-buildoptions: Sort coroutine_backend choices
    lexicographically
  configure: Add dtc option
  configure: Require dtc for boards with bundled device trees

 MAINTAINERS                          |   2 +-
 meson.build                          |  12 ++++++++++++
 hw/arm/boot.c                        |   2 +-
 hw/ppc/e500.c                        |   2 +-
 Kconfig.host                         |   3 +++
 hw/microblaze/Kconfig                |   4 ++--
 hw/ppc/Kconfig                       |   4 ++--
 meson_options.txt                    |   3 +++
 pc-bios/dtb/bamboo.dtb               | Bin 3211 -> 0 bytes
 pc-bios/dtb/canyonlands.dtb          | Bin 9779 -> 0 bytes
 pc-bios/dtb/meson.build              |  19 ++++++++-----------
 pc-bios/dtb/petalogix-ml605.dtb      | Bin 9882 -> 0 bytes
 pc-bios/dtb/petalogix-s3adsp1800.dtb | Bin 8161 -> 0 bytes
 scripts/meson-buildoptions.sh        |   5 ++++-
 14 files changed, 37 insertions(+), 19 deletions(-)
 delete mode 100644 pc-bios/dtb/bamboo.dtb
 delete mode 100644 pc-bios/dtb/canyonlands.dtb
 delete mode 100644 pc-bios/dtb/petalogix-ml605.dtb
 delete mode 100644 pc-bios/dtb/petalogix-s3adsp1800.dtb

-- 
2.49.0

