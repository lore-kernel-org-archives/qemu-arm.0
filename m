Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4045211njc;
        Mon, 26 May 2025 01:05:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWbyxcJ0fO98bRZ7ge7D0ynMwuWUCXUX801fpbBVsFt2y9D8kcAiEw7LFCJcbIiXyvyKCCDi26KdN2USQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGWIFV6f2znZe/4FBo31f9ih/mYeC70g1CCSmPomJR4HG+91zcAlovVVZL4vtDjworoVZhH
X-Received: by 2002:a05:6214:4115:b0:6e8:9086:261 with SMTP id 6a1803df08f44-6fa9cfea47fmr120601856d6.3.1748246746884;
        Mon, 26 May 2025 01:05:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748246746; cv=none;
        d=google.com; s=arc-20240605;
        b=UdP6Pg9KTRnxhUVFoNmJlpYLMwncUS3Rj2R3yXMCr7awoTp9ajblG5xVRB8qPTgSNF
         iV9tJ4slWUiHC2j1MtWea/x0RW3gFSbQjSn/4LAvg7CxkMH+RJW+J7tn4TJjYue+8nv2
         LjiokOHzxAwwQnIyt+wN+N20Jkkvo5CWClJ3akNBrX21UcGzIr6M3orkcD6eolAoBCo0
         0/qoy0DQSJWmwamzqIhrzjr00zcUd4xWJUFw/Uob3GS/bdx/7SF1vTmCeAuSVn0Nzk0Y
         QkHl34478G011/WvmYQq3xSONHs9tYuuhA8qvof1lM7X3VhnnjdACkA7ALQjWabNORdL
         Af/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=zrXxCqajEB/hl4zQ60JHIbrPcY9/+oUVSUIWvsdz+MY=;
        fh=//RUmME8FDhHHOy0et2Cqja/I65gKN6UBnwN7MzepaQ=;
        b=AM8ms+hXDc7olrLuA7xJoQypFwxmzH7jXded/HqhSjNYPPTNeb43x48tUV9VQ8E1/E
         4e4Il/phJBm2ql4DN4S5stUimJSvsGdNQVNckVqZUjLfa2nCag+WlqX9XqKoDVwW7vN1
         2CzOXlCLr7renZ8PZXwOKLUKD8/q9ft5x/OzdSVA45dfSmHJbQ8+dMA7GnhjmgmTOaSm
         ZxqUuD/f8ErV+qJOv1VmaNUEtgld3YrdBrlfMVYfL8cTS/frywDosNgzEenhmyVP2ffB
         dBeHO4595cqQPUyHcKSASYM3C3NJGB2gNUkfkQvCHso1XCUKAsmgf/x9iXfAIslditrX
         41ww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QYGo4H9s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f8b09cde2bsi228403266d6.455.2025.05.26.01.05.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 May 2025 01:05:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QYGo4H9s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uJSpv-0004Dp-LZ; Mon, 26 May 2025 04:05:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uJSpq-00049Y-2g
 for qemu-arm@nongnu.org; Mon, 26 May 2025 04:05:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uJSpn-0002DB-U4
 for qemu-arm@nongnu.org; Mon, 26 May 2025 04:05:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748246722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zrXxCqajEB/hl4zQ60JHIbrPcY9/+oUVSUIWvsdz+MY=;
 b=QYGo4H9sQHT072kY66J96eR4anUdkPuw2YSZioanBVQ34HwLAiNJQXXjl7lKymC3q3nSFp
 dbyj0FC6Mp1TZYlrXAFOLakop+aIFkqXgYkd9c6uN2CMJ+82jlzPsU/fj732Tg5kq++iuY
 zNyF7JutD3+WtZ+NAhM+k8HmKkzEZLo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-327-_wR_JEipPES_aoOOsg__ew-1; Mon,
 26 May 2025 04:05:19 -0400
X-MC-Unique: _wR_JEipPES_aoOOsg__ew-1
X-Mimecast-MFC-AGG-ID: _wR_JEipPES_aoOOsg__ew_1748246718
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7936418001CC; Mon, 26 May 2025 08:05:18 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.45.224.49])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D1F3E1800DB9; Mon, 26 May 2025 08:05:16 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 00/39] aspeed queue
Date: Mon, 26 May 2025 10:04:33 +0200
Message-ID: <20250526080512.1697528-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.904,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ES3G7UONc4g5

The following changes since commit 3c5a5e213e5f08fbfe70728237f7799ac70f5b99:

  Merge tag 'audio-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2025-05-25 09:51:07 -0400)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20250526

for you to fetch changes up to 8eaea4012c215a610b2bd6dcc7812e805e14dd0c:

  docs: Remove ast2700fc from Aspeed family boards (2025-05-25 23:39:11 +0200)

----------------------------------------------------------------
aspeed queue:

* Fixed memory leaks in qtest tests
* Reworked and fixed HACE (crypto) model for AST2700 SoC
* Extended HACE qtest tests
* Fixed RAM size detection on BE hosts
* Added network backends to ast2700fc machine
* Mapped main SoC memory into system memory on multi SoC machines

----------------------------------------------------------------
Fabiano Rosas (1):
      tests/qtest/ast2700-smc-test: Fix leak

Jamin Lin (32):
      tests/qtest/aspeed_smc-test: Fix memory leaks
      hw/misc/aspeed_hace: Remove unused code for better readability
      hw/misc/aspeed_hace: Improve readability and consistency in variable naming
      hw/misc/aspeed_hace: Ensure HASH_IRQ is always set to prevent firmware hang
      hw/misc/aspeed_hace: Extract direct mode hash buffer setup into helper function
      hw/misc/aspeed_hace: Extract SG-mode hash buffer setup into helper function
      hw/misc/aspeed_hace: Extract digest write and iov unmap into helper function
      hw/misc/aspeed_hace: Extract non-accumulation hash execution into helper function
      hw/misc/aspeed_hace: Extract accumulation-mode hash execution into helper function
      hw/misc/aspeed_hace: Introduce 64-bit hash source address helper function
      hw/misc/aspeed_hace: Rename R_HASH_DEST to R_HASH_DIGEST and introduce 64-bit hash digest address helper
      hw/misc/aspeed_hace: Support accumulative mode for direct access mode
      hw/misc/aspeed_hace: Move register size to instance class and dynamically allocate regs
      hw/misc/aspeed_hace: Add support for source, digest, key buffer 64 bit addresses
      hw/misc/aspeed_hace: Support DMA 64 bits dram address
      hw/misc/aspeed_hace: Add trace-events for better debugging
      hw/misc/aspeed_hace: Support to dump plaintext and digest for better debugging
      tests/qtest: Reorder aspeed test list
      test/qtest: Introduce a new aspeed-hace-utils.c to place common testcases
      test/qtest/hace: Specify explicit array sizes for test vectors and hash results
      test/qtest/hace: Adjust test address range for AST1030 due to SRAM limitations
      test/qtest/hace: Add SHA-384 test cases for ASPEED HACE model
      test/qtest/hace: Add SHA-384 tests for AST2600
      test/qtest/hace: Add tests for AST1030
      test/qtest/hace: Update source data and digest data type to 64-bit
      test/qtest/hace: Support 64-bit source and digest addresses for AST2700
      test/qtest/hace: Support to test upper 32 bits of digest and source addresses
      test/qtest/hace: Support to validate 64-bit hmac key buffer addresses
      test/qtest/hace: Add tests for AST2700
      hw/intc/aspeed: Set impl.min_access_size to 4
      hw/intc/aspeed Fix coding style
      hw/arm/aspeed_ast27x0: Fix RAM size detection failure on BE hosts

Steven Lee (6):
      hw/arm/aspeed_ast2700-fc: Add network support
      hw/arm/aspeed_ast2700-fc: Reduce ca35 ram size to align with ast2700a1
      hw/arm/aspeed_ast27x0: Fix unimplemented region overlap with vbootrom
      hw/arm/aspeed_ast27x0-fc: Map ca35 memory into system memory
      hw/arm/fby35: Map BMC memory into system memory
      docs: Remove ast2700fc from Aspeed family boards

 docs/system/arm/aspeed.rst      |   2 +-
 include/hw/misc/aspeed_hace.h   |  11 +-
 tests/qtest/aspeed-hace-utils.h |  84 ++++++
 hw/arm/aspeed_ast27x0-fc.c      |  10 +-
 hw/arm/aspeed_ast27x0.c         |  14 +-
 hw/arm/fby35.c                  |   1 +
 hw/intc/aspeed_intc.c           |  12 +-
 hw/misc/aspeed_hace.c           | 479 +++++++++++++++++++----------
 tests/qtest/aspeed-hace-utils.c | 646 ++++++++++++++++++++++++++++++++++++++++
 tests/qtest/aspeed_hace-test.c  | 577 +++++++----------------------------
 tests/qtest/aspeed_smc-test.c   |   5 +
 tests/qtest/ast2700-hace-test.c |  98 ++++++
 tests/qtest/ast2700-smc-test.c  |   1 +
 hw/misc/trace-events            |   8 +
 tests/qtest/meson.build         |  13 +-
 15 files changed, 1314 insertions(+), 647 deletions(-)
 create mode 100644 tests/qtest/aspeed-hace-utils.h
 create mode 100644 tests/qtest/aspeed-hace-utils.c
 create mode 100644 tests/qtest/ast2700-hace-test.c

