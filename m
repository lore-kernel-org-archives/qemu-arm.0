Received: by 2002:ac2:593b:0:0:0:0:0 with SMTP id v27csp486475lfi;
        Wed, 30 Jun 2021 08:41:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaiaX8Xa0OntJh5hknqsZ8UWgrkuKDCPXtWsBRz5BRcb5Kh7o7kG51w/6rzd5h3VpJfhOD
X-Received: by 2002:ab0:647:: with SMTP id f65mr33171908uaf.4.1625067717860;
        Wed, 30 Jun 2021 08:41:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625067717; cv=none;
        d=google.com; s=arc-20160816;
        b=lp4LM96i3/D23YbLSce9D6Yza+59fMBBDj13Lqqhxc/CIO2F6muBnlYk+IgjYobbXq
         Ydh72OpTQWAtkyEVGxe7EcTtma97kfySIdUSjw7VhNcw3gxLKAlLSxBafCSlMscgCQrL
         4VuWCpvwrr57Pi69TDli7bCNSPb1C2CpLnUcNUy8b9b/TRxVeeyt+MTOImYossoVXT5f
         lU4D6WbO8I7uXYLzrjFYQmbpvrKu9rYE29Zk4H9ZEzwObMXAa5qzanmmE5sNyUUTQBb1
         m/ey6PPcgiOhrqeIpaKCDRJUHoL4aJquG9+nhPKZpgQNMFblaBXmz2Detcn7SAdeODc3
         mzHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=axd5FwFxYr5TwF9xkQcmsEoUNJHQHfTsD3YGTro3Vwo=;
        b=NzixDo9nq/9+SqApCcK4FA1gsxgAvDqPFeM9LcYrv6pri3iD5ffgdEUGrPy1X3njDU
         gPfwxkQtySfMJZSnBloeomCFkW/lG579qNXJB5lJz3RvDQApPHZ76PfPGXrdPHVHC808
         h/Ulit+I6RybtcSB2WSr9uvWFJCKQKqYAQEtmRsGJX6EwaYxGF8Fd5yObryavV9cEaIf
         d7tV/wDadC4msjN5Lu9P2wqe0NmWUz/P9/FdQ7E9Gf6p3p8gznIZo0GsXB92Jqdmy3ku
         s38lpNLVo4mnm5kkhzbLPVUJWXKvVbIXKpfMPw1ysSNz+8hQ/vahRVQ1VIRci83Ihk20
         qZ0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BABfT5Ms;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q16si7559702uap.145.2021.06.30.08.41.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Jun 2021 08:41:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BABfT5Ms;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lycLd-0005FS-8M
	for alex.bennee@linaro.org; Wed, 30 Jun 2021 11:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lycCL-00054n-0b
 for qemu-arm@nongnu.org; Wed, 30 Jun 2021 11:32:21 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:42543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lycC6-00058p-4d
 for qemu-arm@nongnu.org; Wed, 30 Jun 2021 11:32:20 -0400
Received: by mail-qv1-xf31.google.com with SMTP id m15so1284726qvc.9
 for <qemu-arm@nongnu.org>; Wed, 30 Jun 2021 08:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=axd5FwFxYr5TwF9xkQcmsEoUNJHQHfTsD3YGTro3Vwo=;
 b=BABfT5Msj7iRC+F1umVpXp82ytJioCT3C0XrxJe1CKZg0Kl1HjAbrvOy5XCR6Fw42n
 l0ABX5t74auZpQHIhupuavLN0yC974QnmkGivpCUGALMss1yps7ngYGgKzxBGL8PHUf1
 cMhExlNA9nXUE+h5CJg110Dpz135mNGoY9+TNi5Pj4dPQ/B2VsJaOyugbLubqDw3qS8J
 9c+37aJ9Fj2HmkFFiPp1HBOw7NROT6XPC7MjdoXZ6f2NYoRKOdSwlg7F/LLp1C3bT1b5
 zX5j/siTeWg+RnvdWcAXioSZo0iz24Gaf09aSqG7cHwWL3vW/GGrlOHPNizzPbhtrcLZ
 uj5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=axd5FwFxYr5TwF9xkQcmsEoUNJHQHfTsD3YGTro3Vwo=;
 b=V8b6+laHxUYRZmST7n7uhiLLJMKjV+9eOj5EX0/lQqAAWcJyDx6PUW8wzDtoA9KB6n
 OZdZIJ/rcEriO2XPnFLAAbYrntAr4bEfU2lqMWocft8ywslFYL1sNB67yOm3gRScpMwv
 OoIpcTZQU7qJWJAdQ2BEQGEtD4eHaKFYgpanLPHy6TIv0B25UwSurWjzSxRCwK03rAps
 pi1NNULGqM78fxKw30XlgOOSmhiltwYicnHAcmIitC3J6tW1MYHaFrlrm91l7hyEQD37
 hZCLcEnThdqVT+AFyeEJC2tgGi7XJygTvEyolnhQawodqky+gv9SDaK4B43gz4a3h40m
 UbDA==
X-Gm-Message-State: AOAM531WKTlmI+F+bDlu8iOg7LLZ6VJ6FmSlc/lxKhJ12BhTW5Ykf2z4
 dQdEB4Y9Wg9WKO40W6e+fUdsPw==
X-Received: by 2002:a05:6214:c48:: with SMTP id r8mr787836qvj.62.1625067125156; 
 Wed, 30 Jun 2021 08:32:05 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id 4sm836131qkm.100.2021.06.30.08.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 08:32:04 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v5 08/10] tests/data/acpi/virt: Add IORT files for ITS
Date: Wed, 30 Jun 2021 11:31:54 -0400
Message-Id: <20210630153156.9421-9-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210630153156.9421-1-shashi.mallela@linaro.org>
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf31.google.com
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
X-TUID: 9BZkBSgcvFFF

Added expected IORT files applicable with latest GICv3
ITS changes.Temporarily differences in these files are
okay.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 tests/data/acpi/virt/IORT                   | 0
 tests/data/acpi/virt/IORT.memhp             | 0
 tests/data/acpi/virt/IORT.numamem           | 0
 tests/data/acpi/virt/IORT.pxb               | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
 5 files changed, 4 insertions(+)
 create mode 100644 tests/data/acpi/virt/IORT
 create mode 100644 tests/data/acpi/virt/IORT.memhp
 create mode 100644 tests/data/acpi/virt/IORT.numamem
 create mode 100644 tests/data/acpi/virt/IORT.pxb

diff --git a/tests/data/acpi/virt/IORT b/tests/data/acpi/virt/IORT
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/IORT.memhp b/tests/data/acpi/virt/IORT.memhp
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/IORT.numamem b/tests/data/acpi/virt/IORT.numamem
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/IORT.pxb b/tests/data/acpi/virt/IORT.pxb
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..2ef211df59 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/IORT",
+"tests/data/acpi/virt/IORT.memhp",
+"tests/data/acpi/virt/IORT.numamem",
+"tests/data/acpi/virt/IORT.pxb",
-- 
2.27.0

