Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2515494lfk;
        Tue, 6 Jul 2021 14:15:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyW4TgWx+DR8smI5PoYGNtcR17BS5VwQV77Qv8n1UZXMt5p0mRSWiYNrY5RQ2zq6mMUlqoD
X-Received: by 2002:a67:fd09:: with SMTP id f9mr9694634vsr.15.1625606100730;
        Tue, 06 Jul 2021 14:15:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625606100; cv=none;
        d=google.com; s=arc-20160816;
        b=yGEznSCnDSJxCSD0cs9wke91zsjCRUp23PDUh49aPteDQHmQNCiEESWA8pqFaicgRN
         9JyCM6enZ2wV1Sj7qqFw9nWMcVR/4wS4Mmy1pI40Q0dWB/jUwtKJwsfpmSbrz3t80r4l
         kRdZWvnMM+E6Ud/WEeXHsbN6Hk8XZDEtwk1SMiSSr+yvLqx3fZ1pJRb+V0YgvK5Y7gd4
         HWJh43J4XCnYyVhukSYJWn162RFIrPlkOBB74ekaedgXzRUQKASM9c/7/EX6uO8ht9Vf
         Uki9rsKv5soSwMLOQY6KipC9lyxTO8XXkdAGF+f4wH4bEkj0RlSsu0pgIMPvcgyCMl62
         Tegw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=wExOrkbXE+k9ZzW4PHpFswTvMVslLSEWrRVPqGpkEPQ=;
        b=hJLMgi2dhOH1CnaJp/UfifBW6xHiR2GNOHcJBxA6yLc0iFzxgmZARfC/A5vtuzj9kr
         HzQ9fhqceWh5vtDPNHYkMHNIUTAw1s0HvNoXPYzPtHhb2sizcELcl3h9WEOHv6IyVnA+
         4RCLMF+B3iTicaZi3GQ7K1rY4TOxMXxPm0qhM0qAxHUMfaMl4+mMz4OWZJCk+vgvv9Fk
         0BEufiXG6yBMrejF6Er0tR1e+5iXMVdg/e9FYEnZmhNlg1CKBHS7kVMF3xX/e7p5sFlW
         d6fjvjFqWFrtJIx5CNS5G2WNXiTp9S7D4D6oeHlHvARTVVVo3kzNtyb/s0fmwcPhIcsn
         j38w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=OoQqHtKY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v191si11492705vkv.58.2021.07.06.14.15.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jul 2021 14:15:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=OoQqHtKY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0sPD-0000TU-V9
	for alex.bennee@linaro.org; Tue, 06 Jul 2021 17:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1m0sOy-0000TD-Bh
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 17:14:44 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:46769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1m0sOw-0004Rd-7S
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 17:14:44 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 b5-20020a17090a9905b029016fc06f6c5bso251517pjp.5
 for <qemu-arm@nongnu.org>; Tue, 06 Jul 2021 14:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wExOrkbXE+k9ZzW4PHpFswTvMVslLSEWrRVPqGpkEPQ=;
 b=OoQqHtKYy4y8XnAq4xz+KE0h5kIUCasmhylHledcVzh5NLJjPC8BUcQFK9l+2lIvEY
 1WffRJEIMB0YV31GJkvLOo28qLKf1MKQA9UywbgGRhGF49B5lBoGdDO6Fn3klxqVKoso
 lvJF9jobLQrDFyRXu70SlD9Nwejo2sMzSU0Vh69h3OJDIABNC1sKoG7+AlaIg3WND0DD
 PlPPnArg/DbcUVw0esJO650rDgX45YNq55vLS+j8jzguAzjASmjtqQdKvKlO7rwBmq6N
 bAaTQE+7/fgvds9QpCGclLxPbGd/oZWgNi6n0gpdg2fj2k1VYlj0D3uNbjrvkURFe+j+
 /CZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wExOrkbXE+k9ZzW4PHpFswTvMVslLSEWrRVPqGpkEPQ=;
 b=GpnDehSI87nQwjfihgYMMB62PFfFf+62B0lYmhnVzeIH1oIFsdScLoN+Pqfo88XKeO
 ktxF9NtUR6LMniNZCtlIy2YinyuEEpnOYH0+56FloRA/0fQY0z+dFCByuIHtnmyJLRUg
 +RvbKVJH7aBpvVADR/GLt850n0DQu1Ev/qZRXwB2jNpLztc4zKzidDqIySJ3r0OjUoeD
 Lgi1y/rsIPoPW+uEE/eY+iQcQFDqPCO6eVK4PqMuRH9zzH2f6YR3wuVv0mt85datszs9
 aXY1j9xvWtlnLK/yhbEg14jdl+K/1iFLbQB93hwiHUSpNFcJtuv5itoesN/YFT8D3scb
 YgNw==
X-Gm-Message-State: AOAM531x90dY4obQ4+yfI8+KZ90NooW4INuPUbCDNF27oNuXORdXXxBB
 bDhTizjw4bIDkrUTBvTxUQUN+Q==
X-Received: by 2002:a17:90b:2512:: with SMTP id
 ns18mr22460568pjb.215.1625606080012; 
 Tue, 06 Jul 2021 14:14:40 -0700 (PDT)
Received: from linbox.int.bluestop.org.com
 (c-174-52-16-57.hsd1.ut.comcast.net. [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id e2sm20606290pgh.5.2021.07.06.14.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 14:14:39 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Subject: [trivial PATCH 1/1] hw/intc: Improve formatting of MEMTX_ERROR guest
 error message
Date: Tue,  6 Jul 2021 15:14:32 -0600
Message-Id: <20210706211432.31902-1-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=rebecca@nuviainc.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PQimDvEXPbhV

Add a space in the message printed when gicr_read*/gicr_write* returns
MEMTX_ERROR in arm_gicv3_redist.c.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 hw/intc/arm_gicv3_redist.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 8645220d6183..53da703ed843 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -453,7 +453,7 @@ MemTxResult gicv3_redist_read(void *opaque, hwaddr offset, uint64_t *data,
     if (r == MEMTX_ERROR) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest read at offset " TARGET_FMT_plx
-                      "size %u\n", __func__, offset, size);
+                      " size %u\n", __func__, offset, size);
         trace_gicv3_redist_badread(gicv3_redist_affid(cs), offset,
                                    size, attrs.secure);
         /* The spec requires that reserved registers are RAZ/WI;
@@ -510,7 +510,7 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
     if (r == MEMTX_ERROR) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest write at offset " TARGET_FMT_plx
-                      "size %u\n", __func__, offset, size);
+                      " size %u\n", __func__, offset, size);
         trace_gicv3_redist_badwrite(gicv3_redist_affid(cs), offset, data,
                                     size, attrs.secure);
         /* The spec requires that reserved registers are RAZ/WI;
-- 
2.26.2

