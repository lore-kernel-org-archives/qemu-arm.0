Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp416584njc;
        Fri, 21 Mar 2025 08:59:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXNAeNdkkQM60xhPmBMfGOl1pCxbSShBUzu+Fj8d0J3GPqi/KEFO7y0tTXG5K0RHZo99ZxVuDZmEpnQ3g==@linaro.org
X-Google-Smtp-Source: AGHT+IHfW0G+kVbeDxiFYgJ9dIX5aC6RB4MhJksmxdlv1mSNPS4vva+Z7sPke6/tiADvxCfNOc7H
X-Received: by 2002:a05:620a:c53:b0:7c5:55be:7bff with SMTP id af79cd13be357-7c5ba1e8768mr537183185a.43.1742572740272;
        Fri, 21 Mar 2025 08:59:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742572740; cv=none;
        d=google.com; s=arc-20240605;
        b=JQiFFnV5PdxYt/ca8rm88tnDNZzqX5iV/dZn3jbKOrHy/fkCw5LVBGLUZq2Pnf/azf
         WSYeD+su8zDyLCV8qky1RADjCRTFdn1MW3DMentkOEDJbS9LOw2Pz9gYn10UMY3aoIeu
         8kM++yMBrzj07FTvN9Tb/+f3kto6zhYkVyAh1XYk4kZe48G1NohOfA7g0jUt8eYm7wxq
         BagMwg30G1xUB/zm2fYJ7b6yg1PMXeru6CynkcBItlGIHo4yiXV+MkrTesK7bppPJV96
         odOFpyKyra+9SqhsIQFoCCuztHIp7gTgVsAmT6sPZ+mlxeSYN/E+g8HeQLdgVIkBD+HW
         M6TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=zJIKqcqwKhfvCB2m7BH5xanx5S5b/Y8o9jvPbTHs/+M=;
        fh=6ygh8lbf+XvspWpGPd8xbHB0rPIUJcrgvR9vA5/qhQM=;
        b=iBl28a4Q50zaX6069tE9TSDdm84mEbnPSIVfuZL44YfYxjdwbXP5Q5RUa4NuUU9R7L
         YpCImyT6p0KPvxqUVPamzWGaTdWyN6YAQv9/WtLXTVEC9pwcfKSRNQxz+bhIdBjFgdDe
         OrAJ4S7QMmbCMRVQoa+Eaza5VhdMPcOtWGVdKaeHYF0nzTTkzkPIjrAqa+PQDV143kpt
         68GQjnFlAv7StnUrL02N6y5oMxb4DQZIwDL45zYJrfhHxa8ymOtA7V3ww49vZc6zB2DW
         WMbcGar9oBqYPlxYW9qSt5BdhoBxVQCd/HI3dXsydLWfKyotULsJfr2jSVhocLBwnT8H
         R6fA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AQp9HN+L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5b9348215si210133785a.238.2025.03.21.08.59.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Mar 2025 08:59:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AQp9HN+L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tvelQ-0008Q2-Lv; Fri, 21 Mar 2025 11:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tvelB-0008LZ-Q2
 for qemu-arm@nongnu.org; Fri, 21 Mar 2025 11:58:16 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tvel9-000439-1O
 for qemu-arm@nongnu.org; Fri, 21 Mar 2025 11:58:12 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-390cf7458f5so1606200f8f.2
 for <qemu-arm@nongnu.org>; Fri, 21 Mar 2025 08:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742572688; x=1743177488; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zJIKqcqwKhfvCB2m7BH5xanx5S5b/Y8o9jvPbTHs/+M=;
 b=AQp9HN+LxU1J/wd2mqjsy0zHI9/4Ss8sGicfMzIFtbgK6fWeR8TTWtsl9PrPF60QeS
 Rbp3OjvY8pswE8ep63ApRg6/kueWtQ5XHYK+fSIc5Sz9FahcamvMtiXIeY8T3iEUuGHU
 s2ZSgDSWr00L0Vyu6S8qmWpTY73gnyaneXalsu1EiAS0HZmaWe4B1zOsfuaCQcGAEtsd
 sbgqzCos2p+BUPYCzqVT0N+gFht8YWfL9pYUP74ketwkEJUAIsjfMexCMxuNjNXQT2jd
 whpzNRn2OHLx7x/Afg9wrBX4xvu9PjYpP85W/Rg+FkkYGalBh9YkO9pycYttG/lh6rSX
 mGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742572688; x=1743177488;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zJIKqcqwKhfvCB2m7BH5xanx5S5b/Y8o9jvPbTHs/+M=;
 b=Dt3jVi6Iy8QLXQtBe8u0fCNHLLOOI1DwcFZM+8p000K5ejk07Wvhg8w0vc+DZmVSA3
 T7JUD7Angstt0bCwWlrVddVhaTwxoXMvHIAr+K3AnlEdP9exkJdb1MrnKKaEBgwhvLGB
 Hpmz4e+Q/OmSF79l0XFG0LUWCE95Cis8LywessDZIqB2rHtY5FU3oUnfvaCsxTFYsSJF
 iddB+qyZYSNewD8RgxCcRUlApzoMLP6eAkzIy/A+Nq02zxLsjEaJ2Nog9X7U8tvklRoz
 j0kb7nSFz02B8XSjFJ24rLW9bkR66Ws9DiqPGDPBPEboV8cPZfS463owqP9m2r1vxjhd
 WosQ==
X-Gm-Message-State: AOJu0Yyg+PT5L3qTY3slhUXKoYnjSIpeMfilCMHjddvm1WzRZMhRv2Kh
 iTNpsAodCoiayWqPjVpdpKZ4jP6bjBfIlK1AXGWIVCdZhjJ8IX+Z9Tu9hljuDvd3oZeGsQawM5m
 R
X-Gm-Gg: ASbGncun0OGNXcv6HvUmmvJxAspg4AvIVqkMcSNwemicPprN85wrWCAeViocC3qknsP
 NsQgu4Mmom48+pZmT8k1g0Sp+wPtwditHUUwhTdMz7XFsucI3ADAR1VNycgPlG/BlNGiQJ+BZYs
 ZlJzOouse8Q4bEnv9nvC8MXuA8c3xE+PZw8/h9F9rLRRz50KG8f4fbEH0V/FgDZIhDrIpnU+YJc
 UhSMKbaoXgUMyy1X6B/YO+oWohC2n+ixcX99Si/HGvkPRGRdEopi049LGx346QzU6FgpGRq/m7s
 J6cdrlmvLFNgNHM/N8ZaM9RKSMbchzoD+eQogO9DsdSJsYrDClQ=
X-Received: by 2002:a05:6000:1fa4:b0:391:952:c730 with SMTP id
 ffacd0b85a97d-3997f8f8c1fmr3686221f8f.11.1742572688435; 
 Fri, 21 Mar 2025 08:58:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9efd61sm2731049f8f.91.2025.03.21.08.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Mar 2025 08:58:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
Subject: [PATCH] tests/functional/meson.build: Bump arm_aspeed_bletchley
 timeout
Date: Fri, 21 Mar 2025 15:58:06 +0000
Message-ID: <20250321155806.1888867-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7YLr6rVC/H1c

The arm_aspeed_bletchley timeout takes more than its
current 120s timeout on a debug Rust config:

$ time (cd build/rust; PYTHONPATH=../../python:../../tests/functional QEMU_TEST_QEMU_BINARY=./qemu-system-arm ./pyvenv/bin/python3 ../../tests/functional/test_arm_aspeed_bletchley.py)
TAP version 13
ok 1 test_arm_aspeed_bletchley.BletchleyMachine.test_arm_ast2600_bletchley_openbmc
1..1

real    2m15.536s
user    3m21.444s
sys     0m11.558s

Bump it up to 480s, same as arm_aspeed_rainier.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/functional/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 96d28289279..0f8be30fe27 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -26,7 +26,7 @@ test_timeouts = {
   'arm_aspeed_witherspoon' : 120,
   'arm_aspeed_ast2500' : 720,
   'arm_aspeed_ast2600' : 1200,
-  'arm_aspeed_bletchley' : 120,
+  'arm_aspeed_bletchley' : 480,
   'arm_aspeed_rainier' : 480,
   'arm_bpim2u' : 500,
   'arm_collie' : 180,
-- 
2.43.0

