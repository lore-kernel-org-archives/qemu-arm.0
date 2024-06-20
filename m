Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp1870308ejb;
        Thu, 20 Jun 2024 03:20:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXLC9G5C0PMCmIkhjPUedU9y15UYpsdZTvFcgljrzS+108IwwOh/JaKmgQlseiwkZlCVfwM3mKdaGsdcZz00tnJ5WeMYmRV
X-Google-Smtp-Source: AGHT+IGhvnJns7KX21ZxSMylCUhb0NFLqMNOkhYMjOzVyB4rPL9KfGJ+qmvVHYro5i5KwkBLP5aZ
X-Received: by 2002:a05:620a:440e:b0:795:482f:768d with SMTP id af79cd13be357-79bb3eff722mr568755185a.78.1718878845935;
        Thu, 20 Jun 2024 03:20:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718878845; cv=none;
        d=google.com; s=arc-20160816;
        b=w5Rq+IAip3nFxZ3RgxtKjNKmqIq7NLyXOTfzCbPxvCCjrDVawRYThBfsCsWqqQl74Q
         CClN7drXeKZWM4UCeznebzgvvMOX5Jewm32s0D2nww729SPU+q/3TzAVBmAp37UdMb4x
         oQPZmFul0grjKxGskhFabkyKqUzpBs+/J5P0qi7duKXg8uoWBjm1eQYJ2l3J8W8fEUWq
         GbvGrR2KegEHepE+F4IrRs3OI0F9GeVByvGWc7bk98lvfuDFz4FRDuIk9EoRpQDBHr+8
         c08DcE35DfB8FPBwGFoXHyMdgCeqFqWeNn/jmWMxRYyn+Os2o53FYFl9O2h06VaK86me
         sgCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:in-reply-to:references
         :message-id:content-transfer-encoding:mime-version:subject:date:from;
        bh=LszU6mXtFizGbzBE7k89pBY/0/cMuQcq0Eex9qhrSh8=;
        fh=V5vxXQ+IqdfQGwyC5zGLWXOc0z8EtcFzLjSj1F25uQo=;
        b=ZhWMbvW1wMzdN4R2StsPXbXffnIqxgx/Yoqsi5kqGFVVsC4Gynofy/iQj8UWQY9G91
         qhKSbLBR5/6Lbz/7iS0/+XhLA5O7FLGQIFHAWKD2tczCoRsiw3MKWshN7MUMDkbILAZT
         9T7vll7xdPufhiQCJegN1B5MR5xRUdQO4SXpvO7XXjYD/6pcp6Yfy3T+jbFQiYIiuNAa
         gNmguvwDAlapy8Ew8ankwqYXSpWaMUA8h2L5mYETn2fGdaX9USSvOIIUKdm9g9wuNlYP
         GDzHSc0ORInya65JoVqcLbSZs/sRUFy+SVuMrXAZUHGPdbyk2nAsJEJMg2mwFgCuVMDz
         TN0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-798ab90315dsi1620628385a.299.2024.06.20.03.20.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2024 03:20:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sKEtj-00021i-Gy; Thu, 20 Jun 2024 06:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sKEth-00020A-0E; Thu, 20 Jun 2024 06:20:05 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sKEtf-0001Tm-60; Thu, 20 Jun 2024 06:20:04 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 9A85426071F;
 Thu, 20 Jun 2024 12:20:00 +0200 (CEST)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id aRRNqxGY3i09; Thu, 20 Jun 2024 12:19:58 +0200 (CEST)
Received: from applejack.lan (83.11.22.244.ipv4.supernova.orange.pl
 [83.11.22.244])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id AFCD12619B9;
 Thu, 20 Jun 2024 12:19:57 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Thu, 20 Jun 2024 12:19:49 +0200
Subject: [PATCH v3 2/2] tests/avocado: use default amount of cores on sbsa-ref
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240620-b4-new-firmware-v3-2-29a3a2f1be1e@linaro.org>
References: <20240620-b4-new-firmware-v3-0-29a3a2f1be1e@linaro.org>
In-Reply-To: <20240620-b4-new-firmware-v3-0-29a3a2f1be1e@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Leif Lindholm <quic_llindhol@quicinc.com>, 
 Radoslaw Biernacki <rad@semihalf.com>, Cleber Rosa <crosa@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, Ard Biesheuvel <ardb+tianocore@kernel.org>, 
 Rebecca Cran <rebecca@bsdio.com>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: aKf+nDVR449K

The version of the sbsa-ref EDK2 firmware we used to use in this test
had a bug where it might make an unaligned access to the framebuffer,
which causes a guest crash on newer versions of QEMU where we enforce
the architectural requirement that unaligned accesses to Device memory
should take an exception.

We happened to not notice this because our test was booting with "-smp
1" and through luck this didn't write the boot logo to the framebuffer
at an unaligned address; but trying to boot the same firmware with two
CPUs would result in a guest crash. Now we have updated the firmware
we're using for the test, we can make the test use all the cores on the
board, so we are testing the SMP boot path.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 tests/avocado/machine_aarch64_sbsaref.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index e854ec6a1a..e920bbf08c 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -75,8 +75,6 @@ def fetch_firmware(self):
             f"if=pflash,file={fs0_path},format=raw",
             "-drive",
             f"if=pflash,file={fs1_path},format=raw",
-            "-smp",
-            "1",
             "-machine",
             "sbsa-ref",
         )

-- 
2.45.1

