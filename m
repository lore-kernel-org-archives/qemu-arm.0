Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1237102lfb;
        Fri, 10 Sep 2021 07:41:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyMv1Kh7wTfZ8I4ah2LhPdB9zXLpnYidFCwoPj2HM3eaDp5O0oLWP8M+qOQgJ+ce06aSZ9
X-Received: by 2002:a05:6102:1012:: with SMTP id q18mr5998062vsp.3.1631284919221;
        Fri, 10 Sep 2021 07:41:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631284919; cv=none;
        d=google.com; s=arc-20160816;
        b=GNS2mIj5GQRmYKNpnUrbq68T/wChkDE1NuyacefGzArqICl14KxhgojO43LgGe86rS
         ra/zp2LlFAqxEeZclFZgrA1q+raf6n0Qm3FH6Fs0wT4GX42eKMgteCA0H7yVpBjMSAIR
         YvZLMRjVjcQHWosl7lePKEqdaRbL++WTsmvvVhEAHpYaOY3FldlslctKF6ST6ilmMIkN
         NVLf4QGFQgYtI7I5KCfAnUDQrpzchhpqKj1KwA6r7tsEqZ6491H1RpbeNZpC6PV06hjv
         +UMemGOVqBeAcHGIoCA3PTlOeHHk65KVlRvKmE8qIZC7tbWVCmZKPo7xeQs3p8tfOAzq
         5BtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kCylM2PJxf6V961yTwfP1rpV65wzYK9sB+B03vYoel8=;
        b=Aw9nvZjdrvvKiVoKBBB8/cR5RFfp91gyK1ZNOQ4irKKa5lJcVpo2nxl9akRCO687e/
         UbtmXhxtEUbAfKE3vCN6tHRgneupkifwn/ZXc6X/WRvD+qBxQs309fzFLzFVGPNDoOvx
         ueilm9VhSeNAgxEjE4SEtb8U1BivB0u1KbAaYBrVj7rYPq/N0LZfMihSqF4uyc6A6JPN
         Z7hrFswt5Z6/HrwYTcgKRGXMuWzRnUDfxSLSXTysta1xEPrPEPKLcPFU2C3xE4kmlB4P
         EaL3fpiwyql1Wh4hlkQwZIZupqqYN4xBtKoVPnrpxiWI+4AF/j0p16yGSa6PhgmD3s6z
         nKXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kSpjbkC3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18si1938315vsi.299.2021.09.10.07.41.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Sep 2021 07:41:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kSpjbkC3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mOhj4-0005MB-IL
	for alex.bennee@linaro.org; Fri, 10 Sep 2021 10:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mOhhF-0002Lm-OM
 for qemu-arm@nongnu.org; Fri, 10 Sep 2021 10:40:05 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:44626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mOhhA-0002xr-2L
 for qemu-arm@nongnu.org; Fri, 10 Sep 2021 10:40:05 -0400
Received: by mail-qk1-x72a.google.com with SMTP id c10so2138210qko.11
 for <qemu-arm@nongnu.org>; Fri, 10 Sep 2021 07:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kCylM2PJxf6V961yTwfP1rpV65wzYK9sB+B03vYoel8=;
 b=kSpjbkC31bkfre1vCjVYBRbqF13eumlTHhjS056hWRPpxjTE0fIdqBaRWkdvOpZLh7
 LHQrgCZd37q0lLERJZA5ah50qMqT/WcdRYHdIEqqBuZK9P2s74vl+f6808ZZmqxqDTdu
 b5Z++7yQWSc3Jpw4uY0m9h0v17L7GJoRoFNELpF7WoPKBmF5UrCq1GMQ2bRR8ezbDP9d
 t3cOE8wUjHknkyNrFAETBNNiUs44beWYgFj0jHjEt+DIwrq8IxRjx51m2zKvVELKx1bY
 xNdVdgHi3szCaelglT2qHs+QAXAqaKF9rc7LADo4oobzsJjxW27a5xSIqXUYugA+G3gT
 yCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kCylM2PJxf6V961yTwfP1rpV65wzYK9sB+B03vYoel8=;
 b=tX6PoAcCP6q5sMjUFtsiYSiOQh5V6TcVK0xoYi1T4lWdgXRnVkRx68z3vZFtYRN9dL
 HJUfGLFaF3aoI7tkGtykk/FGwe7RoQbz0otCZC5VkzY4sGmvUkMnwBOmV3+OTie91lTV
 conmsLQ7ZhkoEY6YMCu8p22F2KRJ2DwLbRNOswR9NAacUB1XpLRCLG3/qerSSG1x3Lyq
 ArWwTVrJ5sjjuY4RkVnDqcS7Sc3eXmC2KClULE4XNlmOYBrkoy4tC8UvdrypHZvpLAkx
 UbdHtCDceLXwcE6V1RGYwJL5BdiZOocShyhtgwf4hTycxexVby6jGVRysoCCRAQ3gwPK
 MkPg==
X-Gm-Message-State: AOAM532xuijGPHlZ2/CENtzsg4t3MSZpnh9JUWJ3wHUqj0BTBbgOBYQG
 nt0cQPoXxEK3Jjth2C1YQfoczg==
X-Received: by 2002:a05:620a:b0f:: with SMTP id
 t15mr8094687qkg.352.1631284799143; 
 Fri, 10 Sep 2021 07:39:59 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id a9sm3827042qkk.82.2021.09.10.07.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 07:39:58 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v9 7/9] tests/data/acpi/virt: Add IORT files for ITS
Date: Fri, 10 Sep 2021 10:39:49 -0400
Message-Id: <20210910143951.92242-8-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210910143951.92242-1-shashi.mallela@linaro.org>
References: <20210910143951.92242-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x72a.google.com
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 narmstrong@baylibre.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x5IExcR36GyT

Added expected IORT files applicable with latest GICv3
ITS changes.Temporarily differences in these files are
okay.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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

