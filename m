Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2579011lfo;
        Sun, 31 Jan 2021 03:09:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgkHPv7W6qNUl4ITPfu/KTHenGJlosCgGIgwsWZs8l0XEhSasYKVcUOOl6NhkeNES/c4i1
X-Received: by 2002:a25:4091:: with SMTP id n139mr6665101yba.439.1612091385544;
        Sun, 31 Jan 2021 03:09:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612091385; cv=none;
        d=google.com; s=arc-20160816;
        b=Ex4QJMyWKPZ8KMRrLcBLAUZsdZWk2VyhIiTvdOTavabrIrD4PIkqHJuQdI1jASLc5S
         Bt4yKfjbhMEITKMO5+ltKramQgwkZjoipxH4dFkliD3aVx7u4Bhx1QFEeyoxp5d34LaW
         sn8CYpQV4w+c06pqtUHIks2ReNmBBzJuveeI5njc95D1ZWtPj5d4N4t7ogYhH0wqNtJH
         /3Y+tNngnHMduk+Ot6am+dkezSqrgroRqTqS9eZefwd1JwzNoMuNAQJCIzuoIwKhSe1f
         MBTxK2wmSqUXErKzzfywWFz6Lpa11qObUAGvAhqDDFwTEVQenth2cJ78lmsgR3NfikQy
         RqPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kNgfhjPiw9171QK4YrLx8o/lKUJjzdxMB/0DtTDI5HQ=;
        b=yOY1SeeTjqv5D/njxYZtoEo16rtV2ZZk+8tN9w4W/SHOw41CSSHY4Zj4ySVLOmmXvv
         0JDiJaUSPYpXPV7PliJhFLvk+M9183C9PoWkx/FNItcEX6NwSR82obPJd7iih8nHnXYk
         fiiSDD7Qx5JqYzRHM0IhK1gEXSNvTAm2p0ESSUr2vgGTfcV/MmUXeU1X5tSDVIb1qIRG
         oRJ/bUIcA9GLU0svFn5rdEie5bGEwhC0ZBBy4OKEvbBkFMuFSsmrW2rFAXW/kgZafzvq
         vUV5Txl/+yXLeb4n40Fb12yt5WnJiJBI/6uIz5GN/3V0lkkd0J2xkeXDgehXAFO/P5VB
         XMuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qDjRF+0n;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y2si2546569ybh.135.2021.01.31.03.09.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 Jan 2021 03:09:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qDjRF+0n;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:51328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6Abw-0006LD-Ux
	for alex.bennee@linaro.org; Sun, 31 Jan 2021 06:09:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6ASI-0007H8-Gi; Sun, 31 Jan 2021 05:59:46 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6ASH-0000OS-2n; Sun, 31 Jan 2021 05:59:46 -0500
Received: by mail-wr1-x42b.google.com with SMTP id m13so13424182wro.12;
 Sun, 31 Jan 2021 02:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kNgfhjPiw9171QK4YrLx8o/lKUJjzdxMB/0DtTDI5HQ=;
 b=qDjRF+0ndp85DpCMzIrhPpNfUsERWwiOZI7/uwPu1ErC9b8kl/ykCGgGrxlg4a9Bsl
 r/WmJmM75cJjlvhWXh0UIhpVBgF0oD6uDr58SF2Okr0t66zghYgcVzpgkCF8QHBuA4jO
 Mn7yPQYM0WVm3BdD7T1O62lMHo0xJCJ1Hc2aC+GNc2CBMm/3s22fGi5zasxYyyobf9cR
 JQuMGg+QN6hM+mj8OWkmMOQqYXNkZchvWRFn9CmVPdqkPUixwym8ClHDKAzq0Z/Ji3yP
 jfhKHAT4XbxRuUR0jKfsjrKVR0f3BZOourWAM7IeuFtdhQm5ylugxrb8H/FizUKPFxyV
 dylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kNgfhjPiw9171QK4YrLx8o/lKUJjzdxMB/0DtTDI5HQ=;
 b=i0fYjD3ehY5fslx2YVOuKnZ+Qhr2Fk72fBapSyHayL9RlubW+Upd6z8nZgzVH2l46a
 wJSDEUMyYwTNnraSfxC4a93/hpWDy3i2E3CWS8kNX/Da3AgqxPu3bl4Vf4Bm3OpiF+KC
 zjUDE4QHfuI2W56NXhAKJ/+gZpquSB0DFo2s34gCJslIKB/eFQsi7ROSjxFO7EnMgrfQ
 ism6fZhsv/nWeGPJnqlZjw8WgIciX1oMMrc17PtdoM5yBGxIBOC0nQ1cYqpMl1EXTSZA
 D0BewRuoKnJVRRkTDJ8aYwt8Rc5aj4wav6rTdj3RnfpGT5V8mzBdOT0ztXmFpF34bsAd
 IXZQ==
X-Gm-Message-State: AOAM532eqtGQHnAjlyQv8XJmHz9wiAIBZuOG45spCCiN2pRAG1cTJDg6
 iThSo/HS27sXMK4JLbpBbFZGuhaNZzc=
X-Received: by 2002:adf:d1cb:: with SMTP id b11mr13397588wrd.118.1612090782910; 
 Sun, 31 Jan 2021 02:59:42 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id b4sm22732200wrn.12.2021.01.31.02.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 02:59:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/7] hw/arm/virt: Do not include 64-bit CPUs in 32-bit build
Date: Sun, 31 Jan 2021 11:59:15 +0100
Message-Id: <20210131105918.228787-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131105918.228787-1-f4bug@amsat.org>
References: <20210131105918.228787-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L5rmbYqNzpeb

Similarly to commit 210f47840dd, remove 64-bit CPUs (which have
never been available on 32-bit build, see commit d14d42f19bf),
to fix:

  $ make check-qtest-arm
  ...
  Running test qtest-arm/device-introspect-test
  missing object type 'cortex-a53-arm-cpu'
  Broken pipe
  ../tests/qtest/libqtest.c:181: kill_qemu() detected QEMU death from signal 6 (Aborted) (core dumped)
  ERROR qtest-arm/device-introspect-test - too few tests run (expected 6, got 5)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 399da734548..f0e9d7dd7d8 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -199,9 +199,11 @@ static const int a15irqmap[] = {
 static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a7"),
     ARM_CPU_TYPE_NAME("cortex-a15"),
+#ifdef TARGET_AARCH64
     ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
+#endif /* TARGET_AARCH64 */
     ARM_CPU_TYPE_NAME("host"),
     ARM_CPU_TYPE_NAME("max"),
 };
-- 
2.26.2

