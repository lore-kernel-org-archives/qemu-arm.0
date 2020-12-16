Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp740570lfq;
        Wed, 16 Dec 2020 14:13:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz09Vltcynifr4n99nF4N0qLOevljmxVGnV2WCWTZ0Vonf0s45/Rmj7rDX9uiQ0UArvqf+B
X-Received: by 2002:a25:a28d:: with SMTP id c13mr53111343ybi.420.1608156806306;
        Wed, 16 Dec 2020 14:13:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608156806; cv=none;
        d=google.com; s=arc-20160816;
        b=P4j5uOxgFtsOoOv+fm8bok286Cr6Du7r8BA2uq5pvjTZv/cl7whO/dk0bJAsqqezgl
         z8ChlshltZleUP08ET0RJNKfSFO0CFWavS3FInvbnzY1fTf2WUt790TAG77JbZYcuJ78
         /pRiu4vsxqQyyvmV7ZUBmye6CE7JIysiTbOr6NdijzGzrhnewoTVfPjI8GRicKusxtg5
         FXYY78ccdwb//wWTxLWrfCNiXHB2kPButw9wJe+i7SJO9ENio0I/1/Jg/LcC/JHGfgI2
         vpbcbxlnL2sIKs/n7e53spv+4qEQqW5QPVYnEpCrF3Q1nxhnNyOl+5Rh2YqT3D0Saqva
         Rrlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=noNjayxQpF75JFubAK4FYqR5qvvPQGfOv7NJS/0Yp1o=;
        b=QaophN6c7aJCXh3rnvK53AZuX9T7AwNqFbiU9b4X/1UPL6lOy/errFG5x8xbkj2Gco
         74paklmZNV96Q35HyO6PUqUaKvLkQbeMHtPrJOLrZyWrqYeEgVdvtQvaOheA0eHIKQrh
         6zvxfL2EEGxRJzrORgR0kIFkWoFxADx3x9uBt2GrT1gf3GzR488sdxyD5KRpjerHG828
         IjIO1HNwGeTFsmNmw9cInsD0EwyPzOWoqjAQWisERi9mwJu3hb5qnLYRSIcedoBkPcpv
         66TrWmMMoBbMxn9TDJGUwlDhLUFaZ1LvUftnaqM6bFlfj22iXx5UcQsGKJBqrTm1RD6J
         qb/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UP1UpU1L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q185si3232410ybc.453.2020.12.16.14.13.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Dec 2020 14:13:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UP1UpU1L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kpf2x-00038J-M0
	for alex.bennee@linaro.org; Wed, 16 Dec 2020 17:13:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpf2V-00037w-4U
 for qemu-arm@nongnu.org; Wed, 16 Dec 2020 17:12:55 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:37039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpf2R-0006C8-D0
 for qemu-arm@nongnu.org; Wed, 16 Dec 2020 17:12:54 -0500
Received: by mail-oi1-x22e.google.com with SMTP id l207so29669087oib.4
 for <qemu-arm@nongnu.org>; Wed, 16 Dec 2020 14:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=noNjayxQpF75JFubAK4FYqR5qvvPQGfOv7NJS/0Yp1o=;
 b=UP1UpU1LkL4tekwz/J2OpH5fg5GtN/J8RhPGwMNs34nsLn/etGJaR4vV967vBdpm4R
 quhL+PNxN5diPQNmgo60AR52llWhjTjwQ/FPYd5Dsjx2WTRC3Aeuaek3R5MznJM032oN
 2VKbGrA6EOaFQmjHmTGEm5FTqXiA/Yq4F1fFCjpBlAtVZTZsggLYnsXS0cfwuT7ut/DB
 dHUNgppQsgq22Xkuz7IOhNubV+QkQoNoAiIVgTAhILcogITws1xpk0WuEu9C1Fq7sNwT
 PtEAxOCKqrsnwctEE8DW+7d87k8UuaP0BxgmQClAdKEuYCrxyID4wCddfJFIvMSqcc3m
 FwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=noNjayxQpF75JFubAK4FYqR5qvvPQGfOv7NJS/0Yp1o=;
 b=osHG5L0UD+CO67rVkhz7SjZCAZHAutE1vMUICVbZyNbbNeo2QzR5wa44nNqU7mKCOR
 2dK9uQXd+JI/2uOAsE3+DofMwpttZ/8O8HBlNB6Mn/iDxPUrzo4DyXT6qMJwnrYixXVP
 4EORQmv5olGL4rqVka7Fe650DazwvwUinUQOARDeknn98Wcgy1+X6z5OpXQ0TWkWYonC
 POlTMN5iQSTn+1ilcQ537XIggK+AHgdI4TSUIgwnOzPEk1kKCVF6IelIkhmx99MY1UuD
 okPo6RQ2dOD2+8Oh9MSJ6n+98YEBrNIcUrXhHzReL6xQzo/UxMW3W50QL1koZzo7GTp8
 re6g==
X-Gm-Message-State: AOAM5329dE16BOpufjCkgjJXuRqfKClrAzbZ7orKAYT30I6jmNFjRczX
 b+iFcclEp1Br9B7u2RTy3TQUMw==
X-Received: by 2002:aca:af4d:: with SMTP id y74mr3027908oie.105.1608156769534; 
 Wed, 16 Dec 2020 14:12:49 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id z9sm758965ote.13.2020.12.16.14.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 14:12:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/3] target/arm: Implement an IMPDEF pauth algorithm
Date: Wed, 16 Dec 2020 16:12:44 -0600
Message-Id: <20201216221247.522686-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ac2sIZdGU6Nl

The architected pauth algorithm is quite slow without
hardware support, and boot times for kernels that enable
use of the feature have been significantly impacted.

Version 1 blurb at
  https://lists.nongnu.org/archive/html/qemu-devel/2020-08/msg02172.html
which contains larger study of the tradeoffs.

Version 2 changes:
  * Use boolean properties, for qmp_query_cpu_model_expansion (drjones).
  * Move XXH64 implementation to xxhash.h (ajb).
  * Include a small cleanup to parsing the "sve" property
    that I noticed along the way.

Version 3 changes:
  * Swap order of patches (drjones).
  * Add properties test case (drjones).

Version 4 changes:
  * Rebase.


r~


Richard Henderson (3):
  target/arm: Implement an IMPDEF pauth algorithm
  target/arm: Add cpu properties to control pauth
  target/arm: Use object_property_add_bool for "sve" property

 include/qemu/xxhash.h          | 82 ++++++++++++++++++++++++++++++++++
 target/arm/cpu.h               | 25 +++++++++--
 target/arm/cpu.c               | 13 ++++++
 target/arm/cpu64.c             | 64 ++++++++++++++++++--------
 target/arm/monitor.c           |  3 +-
 target/arm/pauth_helper.c      | 41 ++++++++++++++---
 tests/qtest/arm-cpu-features.c | 13 ++++++
 7 files changed, 213 insertions(+), 28 deletions(-)

-- 
2.25.1

