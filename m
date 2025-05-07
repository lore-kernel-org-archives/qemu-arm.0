Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp21173njb;
        Wed, 7 May 2025 13:44:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWGgwfNiQmCoOmebgh8DY7JFyRwZnEJpXUxu741dg2FJcAX90pHyIoHji2N91L8AwBKgG4DcZlc8YBu6g==@linaro.org
X-Google-Smtp-Source: AGHT+IHihte+l3DNP8/qvjjpWDeiBZZo/F+TIjiuxhp6Duhkh8Jx2pJW2fDUo2V56+N6I8qTg2I7
X-Received: by 2002:a05:620a:4250:b0:7c5:4454:6b05 with SMTP id af79cd13be357-7caf741d805mr676064385a.57.1746650676603;
        Wed, 07 May 2025 13:44:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746650676; cv=none;
        d=google.com; s=arc-20240605;
        b=N0Wuc+d7ugGe3WzaP4SGXbiGOJAywDIShzk2MjC/a6X1SfYd+6hPpAQDSu8Pnz9CRw
         zNWmKGMlGn7Ma3oxo3/Ffv/3kpRZKdMlT0F8EhsB5EHjfWCeaVsHyMRq925ADFAAKQ4p
         +W9Q01fQ5jaggEi0X2QvGRiH/+XkBCs9nP1YluAtnc58F60F7ZaZtOOqWoY82iritW1F
         NdQbloMtPC8LIOUpischDhqDzXagjEiYYv9kRsaKgl/7C6CEu1bwbkcPNhZJicg0iX02
         qLXZGE1AaeqgCTB1NKcoHxq1Z4Uh73MriifTAzG5Bkwn0TwRvsGTGTzbW3uKLJhOMLfN
         sawQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=MGKhtEtKmIv/iqo3Q0C370p+aaMvKjOJBkZGTD/hQ3I=;
        fh=EF4CZ1Q0OWq01n5Dd2eOfRtM+p4hu7A452gQpcr0Zb8=;
        b=QDhFFZdZbYc5ZZF+7RZy95vAIvXdruN9lmAjKIjOAcW9b9L7TjXclUbRLQacS1qzGq
         fKNvecPdI3UkNg3IHJ6JqLCr5sH8WV4KmLPTxu0aNODDNql+Ytuq3E+ugS21gJQh4o7c
         zKOiGSHQsBwUrXEpPLbLlZB6aacyYYyi2SgrwFDjocnp1illYkvGxaKBn/yfpFNQTZUi
         vESq/iN3bbrcyrNf06SNyI15ENNvVoOA1KRkhv2Es1POcFZ5tfPYh5WcslexrXerVtnf
         DowOINVNhi89C4/dT7BYk43m/e7kuvh1WyIfKcPeRwyf5/uZD3qVvOlTdsU4iaFGQ2bu
         a1MA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CwfPyzeD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7caf7596a88si278302185a.215.2025.05.07.13.44.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 May 2025 13:44:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CwfPyzeD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uClcs-00032h-1a; Wed, 07 May 2025 16:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uClcn-0002yi-DO
 for qemu-arm@nongnu.org; Wed, 07 May 2025 16:44:17 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uClcl-0002mr-Cb
 for qemu-arm@nongnu.org; Wed, 07 May 2025 16:44:17 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2295d78b433so3342805ad.2
 for <qemu-arm@nongnu.org>; Wed, 07 May 2025 13:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746650651; x=1747255451; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MGKhtEtKmIv/iqo3Q0C370p+aaMvKjOJBkZGTD/hQ3I=;
 b=CwfPyzeDpKPb/SapfzhWcYuOZH+wqDkyCPa1tKCJGvoO/T//OCUK2q3lna8CMcQdJQ
 GneB4z1dS2Em3dBdx+EbITnfH4spL/iIITsFnvnQFsWYXSdvgTbHKzIyis589hJqGwiX
 rKW+270B5tfie8wmbqpYszibYVb0yfiRgwxqZhTAA/BYrU0XquTEbBH8yU+56Kq8Mewk
 Jso6ew6z5BysvjpOVbACyVZcwVm1WgUF0ZylcLzDykWmBoTQafEECFd89Nc2HTC50gHl
 DwUrVMrV/XIXSdIgD1QPVMnw/VOZY4RPoEnMpUkP06fWi4WfdAShNcoy9VGPR4LyaDgS
 Lsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746650651; x=1747255451;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MGKhtEtKmIv/iqo3Q0C370p+aaMvKjOJBkZGTD/hQ3I=;
 b=FQfO9T9n1uE0BNcBdXYOjyqTUNXExpwMAiuc0pEXGA6JAL7r8kjfU+oIUM7cmAiDEY
 GB35muo/4eV/ZwysdBEhdKTdzqpuIK7F5tht1Ax+6bCqrMhVrYQsmw6FrNcmOAVTR/Um
 OUFqij61tnaHRCwdIGg0XeV9PHb8eoZkydb1A280WyWVXCcPAcBguyug2W6WJ2JLjW6q
 9d4hMiz7ohC7kjTcps4N0IUHi1GeNkOOf2BkLBmdlhesABOO1Haava/q1ArmBqr6F639
 KfhfIjdB8BvI/Dc1tfF++7mo8SpYPp87V4sQmsBx83PsJ7TsFVtVZzE83jAqaJd67HEu
 xQKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDal5RoAxL2aX1nHESeh2XjwUSix7C0pXAfWlaJBsmbu8o7ufR26u+lbSgPNNViCWSONhlTCb2+w==@nongnu.org
X-Gm-Message-State: AOJu0YzQPspGhDDMqpOT5BTfUwX3+Yt5tb1geuaEPhkBR2wR4ZbQXO5I
 bDW7Ena1sABOoxhd+aF4hlqtZJdwwrzn5AFhiCgqHI8dCv7ib8m2wdEWtQr+lCE=
X-Gm-Gg: ASbGncs2AEBLIJGZhTmbWQVGzDUq5LNXCOJ/8FWPu5k5J0AICLXF76Pjd/VIfQl7wMI
 ioCxBhWSUpKTwIhp/u4FvC7vbEI31TRSsn0xRQ6AIZLiYukRIBLMKYbziiHhaR2HCCa4b29x6Ut
 JMneNLu7BMk8ri3UNWlqt33C2WdKS3wMLSDVjUb1tzaqy4mwmfxQ2zr12K9nGxuW0R/z8v5geg5
 LUVkdT8qFk0g/OZEhIqFRnDuRDhaZe91RdPjWnmRit7ieZKVvwx+3xq1KClAx3FPo98xxJ+2sSk
 PR6zCPAK6dfEyLNQ6c8ZSxtBt8Sr7QYtpUx7IYuVYRwgc8JptrJ0X2Ci29RosqKcW+QXaTg3QBD
 EK15Ow85GjSI8vrPL922Z
X-Received: by 2002:a17:903:1a45:b0:220:f151:b668 with SMTP id
 d9443c01a7336-22e5ea8a5c2mr61177045ad.20.1746650651320; 
 Wed, 07 May 2025 13:44:11 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e1522a7e0sm98817315ad.208.2025.05.07.13.44.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 07 May 2025 13:44:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mads Ynddal <m.ynddal@samsung.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH] accel/hvf: Include missing 'hw/core/cpu.h' header
Date: Wed,  7 May 2025 22:44:01 +0200
Message-ID: <20250507204401.45379-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: ncr7pFhc9zEA

Since commit d5bd8d8267e ("hvf: only update sysreg from owning
thread") hvf-all.c accesses the run_on_cpu_data type and calls
run_on_cpu(), both defined in the "hw/core/cpu.h" header.
Fortunately, it is indirectly included via:

  "system/hvf.h"
    -> "target/arm/cpu.h"
         -> "target/arm/cpu-qom.h"
              -> "hw/core/cpu.h"

"system/hvf.h" however doesn't need "target/arm/cpu.h" and we
want to remove it there. In order to do that we first need to
include it in the hvf-all.c file.

Cc: Mads Ynddal <m.ynddal@samsung.com>
Reported-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/hvf/hvf-all.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
index 3fc65d6b231..8c387fda24d 100644
--- a/accel/hvf/hvf-all.c
+++ b/accel/hvf/hvf-all.c
@@ -12,6 +12,7 @@
 #include "qemu/error-report.h"
 #include "system/hvf.h"
 #include "system/hvf_int.h"
+#include "hw/core/cpu.h"
 
 const char *hvf_return_string(hv_return_t ret)
 {
-- 
2.47.1

