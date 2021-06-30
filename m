Received: by 2002:ac2:593b:0:0:0:0:0 with SMTP id v27csp478698lfi;
        Wed, 30 Jun 2021 08:33:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7sPSrlSK/0scyxV5Ge1opPaWXLB4a00OuJJYpP9lGIJXb1j9VGmEaAkZPdC5nXFmHB3V8
X-Received: by 2002:a17:907:1b06:: with SMTP id mp6mr6310345ejc.188.1625067186752;
        Wed, 30 Jun 2021 08:33:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625067186; cv=none;
        d=google.com; s=arc-20160816;
        b=W4COCaKL11A6+OrOjRnYMAQp0uIPXRdqpwmGBigIImBVWk6UG+JA+avgRYuTNiJYAv
         34rSvU1Yz8F8RAd9TLkGz7h46aGQDviByMQjt5VEY6OsGSauK4lqY147VDkGfziiMVcP
         FTYxOvz4OqsBP8bEdER8WaxeeHDiq9XPkByWe8rq4yibZxqzQO9wK38UfmEPVE1HRUgi
         EX0x/VvP8cNgAMFHbSKOTbhQ/ogNo7hPWmeJhX7v9IrJis3mcC3nEa1asKjsgNH5JCE0
         sgHmieM/bWUV/USU5wXBq8Bd65f5daZYWHqXrm6C9SGgzfxLLLe6OzZwTsACBfLEUU50
         a8vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=orJerE+sAGar3RteiqHorORXurc9lV+yj7IQakLWvZE=;
        b=Z9Qlyp7OES1jCJrWLC20dS6aeTKJZujqFOi9eA6g5de1DY4cXX2pEHtQBtFx1vvJKG
         oY2W691dYX5LEjxdh00BPaZaXQZDsHxWD4UkerYTFh5isgaF44LUjEL69rk7FU7YahXx
         TzFWyVczPmYgZDW1ILRVTQcnQIhrpHUr7PP/hNtUI3VXNfJzHXAherNezJ7J++47rWen
         j91iHnpPDMkKT5NY68siax812PsnqBo5S4/37xoo2Uh1gIEZdMFEGFF9p9W+ecq2UtlJ
         fiwXMWPpNw2voW8CcZ4b6y/J3TCndKsS64S2mk5recpR5VvvBEkeiYmrJcq/cAskejKL
         ir0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gm8p9+fm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n8si19449693edy.1.2021.06.30.08.33.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Jun 2021 08:33:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gm8p9+fm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lycD3-0005tS-RQ
	for alex.bennee@linaro.org; Wed, 30 Jun 2021 11:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lycCM-00058R-36
 for qemu-arm@nongnu.org; Wed, 30 Jun 2021 11:32:22 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:41486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lycC7-00059G-FB
 for qemu-arm@nongnu.org; Wed, 30 Jun 2021 11:32:21 -0400
Received: by mail-qv1-xf29.google.com with SMTP id f5so1283410qvu.8
 for <qemu-arm@nongnu.org>; Wed, 30 Jun 2021 08:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=orJerE+sAGar3RteiqHorORXurc9lV+yj7IQakLWvZE=;
 b=gm8p9+fmur2D5hz591KVhwDaMRMiB25LcdsMR31WdkJ2DPvuMVuLp5MTIZAItAKHiV
 gHy63Rr+X0jeWA5x5hZHc6Ym9gX/1UL25cqltPnz85MSnkGL+eOZmUVO6F5Vd4GvPoUW
 RcDB/R6YzfOhxtDW1FX0agl+SHgoJeLjqMGA/tvxa+FwwLcJhesAG7V3Wot0XYokULnm
 kgW2fdj97P1uPttxXBuWP6T5ro+dn33Ze0aDsqDUL2HHpg6IZH7wIxPqSXN3LaQUmIh1
 zd8aNpplK/hwN3DFH69s1ps7W2VmwnpoR79s66MEoLVm7H+x2LrUmluHe1c1DwrS5eNc
 TxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=orJerE+sAGar3RteiqHorORXurc9lV+yj7IQakLWvZE=;
 b=RH4JcHJClNikYH/pYVBzlT91+9zGn2orZJAn4EJi4wSxecC/Gq7Nhi9S3mIVxFVhVj
 ToByYpL0uzRCHcsr21HHJYdAO6svNdNV0RhW7ZKFU9l4fKWjmX+xwSBa7VAaQ2+Q164C
 IM0swkaQ9374xNk+zdLDpLSVjhlqVPddZ4a+XfTNYERGVhXZD0JAnCg4Jg4mEGjwI4y+
 V8amFXqiD2Dg0MpFNlIxxbxyK9K+8QlO8vj/QZzkHdyx1FKHpYg+OW14a9+UU7UR3bog
 odlQGcpqxrCeB21BBB96AJuvPK3iEU/Bji7saTXVFSmDoVxBK9CelloPqfvplyQ2kJ1H
 7cLw==
X-Gm-Message-State: AOAM531R6Qr5phTGdZHtivuzRSOPeCQ+5ycYqdcbQMy6SR84XwX3E/+e
 nhI7IO3dWpl1hV+/NdPLAlM9lA==
X-Received: by 2002:ad4:408a:: with SMTP id l10mr22881018qvp.31.1625067126608; 
 Wed, 30 Jun 2021 08:32:06 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id 4sm836131qkm.100.2021.06.30.08.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 08:32:06 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v5 10/10] tests/data/acpi/virt: Update IORT files for ITS
Date: Wed, 30 Jun 2021 11:31:56 -0400
Message-Id: <20210630153156.9421-11-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210630153156.9421-1-shashi.mallela@linaro.org>
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MCFKYregO7a4

Updated expected IORT files applicable with latest GICv3
ITS changes.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 tests/data/acpi/virt/IORT                   | Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.memhp             | Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.numamem           | Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.pxb               | Bin 0 -> 124 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
 5 files changed, 4 deletions(-)

diff --git a/tests/data/acpi/virt/IORT b/tests/data/acpi/virt/IORT
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..521acefe9ba66706c5607321a82d330586f3f280 100644
GIT binary patch
literal 124
zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
QRGb+i3L*dhhtM#y0PN=p0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/IORT.memhp b/tests/data/acpi/virt/IORT.memhp
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..521acefe9ba66706c5607321a82d330586f3f280 100644
GIT binary patch
literal 124
zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
QRGb+i3L*dhhtM#y0PN=p0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/IORT.numamem b/tests/data/acpi/virt/IORT.numamem
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..521acefe9ba66706c5607321a82d330586f3f280 100644
GIT binary patch
literal 124
zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
QRGb+i3L*dhhtM#y0PN=p0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/IORT.pxb b/tests/data/acpi/virt/IORT.pxb
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..521acefe9ba66706c5607321a82d330586f3f280 100644
GIT binary patch
literal 124
zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
QRGb+i3L*dhhtM#y0PN=p0RR91

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 2ef211df59..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,5 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/IORT",
-"tests/data/acpi/virt/IORT.memhp",
-"tests/data/acpi/virt/IORT.numamem",
-"tests/data/acpi/virt/IORT.pxb",
-- 
2.27.0

