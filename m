Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp494684lfb;
        Mon, 4 May 2020 07:21:56 -0700 (PDT)
X-Google-Smtp-Source: APiQypLkvWN3a38iZ9bXKZ1fNKn2rKpZFQLy6Y8Dsd7hC7B1OjVaqlrkT5p6pvplJei2ArAFaFw9
X-Received: by 2002:a37:94d:: with SMTP id 74mr15505008qkj.479.1588602115675;
        Mon, 04 May 2020 07:21:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588602115; cv=none;
        d=google.com; s=arc-20160816;
        b=mbjBtWu5oHX3D+OvBCBLS9qJ/ZfxgQm3g2UR3yXxF922Sz+IjHqPhgUAvQ4JWLwWMH
         KaUEDYkpujDelmUUVyTSqLnL6ftKm/oRhe47Dk3hYeuvdOw4TKP7HbAirgRheP6CUnnt
         gSlMeI+raVhbCz3gHqE4SzpCpIB0VNpdKGfX7qTJ3nhYCaztqjjXr85LkVTRpMDiCkyg
         IOxbVI+OgNPCMN+5HbOQMBauLGbkIW612tY0XKhFw9yozYSqHzcECBNHnhc1m3ABjURq
         ahIhiVLfM1LKMldZBK5moEES4A4ViQE8Bn0FG0wkLuIONBzQG+pN08Mm5s6p1ptiL5KT
         jdqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=75cONDOaQkbsVh6jRzCDmz9QdfFPLVRVK63225nho3c=;
        b=tydy0dvj7A/5bTevnvAH8pKD112er18NrRRegvrl5uS8ZNQDhReB2lWmORdyE3zlNy
         T0iyJDWWyjkFbSPvHOzHRO4jbsIf8GeSujZirzz0n6j1y1NLy4xhNinMKEIdQcSyWMOe
         O/EFLlBkWR8fuPpzQZdlBt7ziEEY9rK/VLQ+bloVmoZ4P1b7KaY2uVz4SGpG3WswM1Zd
         FkjhH3jAVq/cWMF0XHdc1FF6wEzrzuUTtEuzinsYDvegOz6daMmeu4Jtiek+HJSsaiS/
         qPX6A9ttk7T/rosRHiCfL4XUxwzVfU1D380oBcmM0TiKvgc0andr8ejHchv/JL/iLQJe
         34Sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="bW0I/tJi";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id 11si2676994qkl.257.2020.05.04.07.21.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 07:21:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="bW0I/tJi";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVbyl-0001zL-3p
	for alex.bennee@linaro.org; Mon, 04 May 2020 10:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jVbyO-0001hu-AE; Mon, 04 May 2020 10:21:32 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:37863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jVbyN-00039Y-JX; Mon, 04 May 2020 10:21:31 -0400
Received: by mail-lf1-x144.google.com with SMTP id t11so9879677lfe.4;
 Mon, 04 May 2020 07:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=75cONDOaQkbsVh6jRzCDmz9QdfFPLVRVK63225nho3c=;
 b=bW0I/tJi8uI7YFhQ4NrmvKV499My143g0sTDo6aNFAC6I3YwDD3vG1EYzH/DMhQD1I
 Fx5p26rpCS7NGHyYL4QHwjGm6QDebaSn/v/85bqaksSIjh+fcmGHpoZa0/1Nt4nEtdqe
 mF4cBjLC5M28GFRLuRwWhmdE5Tx1A5y+QUOy7gnLhgofyqeTewxg8bBu4ZgJi6IyaFbW
 Kt9qRGbD/NZ047PIyLFuY17eUj3ZbT8QqL6IW4BmEYJf4AHumgwWl/pmYT3iErfKdFgi
 HANkVtzog15EceqW8vGisYj76iNhYL3KCd5gzFx4c9vVG2wS8gjo6hZCqX2zxEudZZ9e
 PU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=75cONDOaQkbsVh6jRzCDmz9QdfFPLVRVK63225nho3c=;
 b=kgLjO/pry2APxktFOJTD4kvf7+Q/2UbTQM1zQPdKQc7l9hIgWqqPsRAV4fHH9b88qI
 eRfR0v9D1ngVx5euQpoQ3YQVTe+gcYBED7ON7pPrHvb+XrqcZZ7B5Mv5FL79E6FfE7S0
 VxKJY+suVTS8FsmLyFHBQF3kPeP2LPUti1TXbqJjKQ5OQNBKXLZJuEyCFFkCHIQRpREs
 JbnWJDW7sDluQqr/x4SP3k3k+z7DxubtBy9Eof/b2FBf0SkBotG9ABz0khEaBSbu35L3
 2dbF2wnFeoDzWP+b/NGdzt+9UV65+QrURw+FDllfGr7CJpf7OufmW4yDdD5mn3pRD9Qd
 9QbA==
X-Gm-Message-State: AGi0PubjwPFAy7eYR0CfSmvjOOO/be0pTngqgI2P6Ww6OCxMiz1dn8q5
 hjOFQeQco49dz6fq9WM5uPg77GOol8I=
X-Received: by 2002:a19:ee19:: with SMTP id g25mr8072898lfb.124.1588602087897; 
 Mon, 04 May 2020 07:21:27 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id p3sm6578241lfj.48.2020.05.04.07.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 07:21:26 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/1] target/arm: Remove access_el3_aa32ns()
Date: Mon,  4 May 2020 16:21:24 +0200
Message-Id: <20200504142125.31180-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::144;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_FAKE=3.399, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, edgar.iglesias@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: otchYTi7jhb4

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Hi,

Laurent reported hitting the assert in access_el3_aa32ns()
when accessing 32-bit versions of some of the virtualization
regs when EL3 is 64-bit.

I think we got this wrong back then and it seems to me like
we should remove direct usage of access_el3_aa32ns() and
always call access_el3_aa32ns_aa64_any() to handle both
the aa32-only cases and the mixed aa32/aa64.

Cheers,
Edgar

ChangeLog:

v1 -> v2:
* Keep access_el3_aa32ns in favor of access_el3_aa32ns_aa64any
* Simplify description of access_el3_aa32ns
* Tweak secure aa32-el3 check in access_el3_aa32ns as suggested by Peter


Edgar E. Iglesias (1):
  target/arm: Drop access_el3_aa32ns()

 target/arm/helper.c | 30 +++++++-----------------------
 1 file changed, 7 insertions(+), 23 deletions(-)

-- 
2.20.1

