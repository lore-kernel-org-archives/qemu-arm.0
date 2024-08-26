Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp1207506njb;
        Mon, 26 Aug 2024 15:11:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXwWgi8v2dGTXi/iuCXI9nMbv8fAK+Uuc6Ze7UjICumYmKwdAArKtwyZ1O9dmhwNtJRndNeD+bDRZMa5A==@linaro.org
X-Google-Smtp-Source: AGHT+IG0vQNRamv8cmKFfHCNJbd95zd2OHRLej3CxIoisQROc+F/Nj1FD5IdScd/nqLu0Pg0Q7fg
X-Received: by 2002:a05:6902:140b:b0:e08:664c:dd23 with SMTP id 3f1490d57ef6-e1a2a57ac9emr1058948276.11.1724710300687;
        Mon, 26 Aug 2024 15:11:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724710300; cv=none;
        d=google.com; s=arc-20160816;
        b=ayHZtTcnb7xAj9l6zQJMS1WTp5uJc9sFMQwTY3mYhKGDzpGB6O4PGDjjZci5N0NqxP
         a2illk6lyxztQ22uFbN/WeVQU2nr+GJV3qFlyymnB5G3GuxdcFHDWmnPNnZ1jXvfi9/n
         AAfY465ae8beJHw47lhM7w2vAoJhpDQGu4b46DuHsgcoy5NOzTrCze8KDQ4vSmsfLqM5
         ZUSayLB5ty9oNzIfG4+Erc4450zb4O8OyG5nD+Y3T96zscXI31SQKVfxe3/h7ZVRckyL
         ARkebi4yaurIRsjNtYYEdLRk0zJUx2TExmya3xqfCALukxNqlCgOje+Rt7zwuP5Fneir
         FHaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=33v1eQT9GnPGoXvY61UfarMCNAR9O1t+ASdJzKFEsFA=;
        fh=mB0gIsrlvTHPNYHA7EsQsopWs30mE/yqE1d41xsgm4U=;
        b=0AQqmcEZQfXabJgqF6hfHXsvrATybRRI/nPBg96hymmwJaHpp/zH2P+KFkM9Mnx8Nq
         4aVECMXACxo22xhMbXCQwcpXEZxXTFns26NcswBwWDwUmoge3CAb4AKjOQOiW6TVavOc
         m+GHblIDwoO1TzLA5Q5Tz0o0ycaL546cywuVltCWfakWFlG3QKJhSVRu1CVxK5h2i9Lr
         sIZ7Nc9/m4ixlmc7bJyEZOZTkBlqzDuUMPsiytePJlHC9b6TIahNQT9If3n/KSZzx6mP
         nAGTx+CNYSxxM8Egi6RvVVb7sPZRVSo/n6hIUTRyMa58pIW1ELRevc1VZot8ly7ztpKP
         RQ7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bIcSHJlz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c162db0adasi120784486d6.241.2024.08.26.15.11.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2024 15:11:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bIcSHJlz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sihvj-0000ju-JU; Mon, 26 Aug 2024 18:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sihva-0000cK-5C
 for qemu-arm@nongnu.org; Mon, 26 Aug 2024 18:11:10 -0400
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sihvU-0000mJ-Ig
 for qemu-arm@nongnu.org; Mon, 26 Aug 2024 18:11:08 -0400
Received: by mail-vk1-xa29.google.com with SMTP id
 71dfb90a1353d-4fcfcd21235so1250783e0c.1
 for <qemu-arm@nongnu.org>; Mon, 26 Aug 2024 15:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724710263; x=1725315063; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=33v1eQT9GnPGoXvY61UfarMCNAR9O1t+ASdJzKFEsFA=;
 b=bIcSHJlzjjsheFnk47han/DkTA/pgvap6uAZt2UAnhcFKh0OYCEdmq550GfhLNSdv6
 pwQiU4MigXSOPuh5XOjRXzXrv3gBY3wlIkY3IFWWZxorTEZIQjE+TQ+bFjAjjR5jUsuo
 k9/N7MqNkFHWhe6rmptteNBXwyx4GerP4JjBh1Oi5oQdn+7hIC0OW7c6IDZAllNr2ZQR
 2TH4+ExW0m6ZLtOf+Iw1oI/MlDv+Vohk62p5uFC5vROqNZRofIaCq2rqH9q297k2hx0I
 Q5XqUmxQUw8hoEMvzZHGVBUMi3R6iPEfbBwaSo/9i5EQB+oVNNHMfD+g1YkLl6gzgz+H
 8X1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724710263; x=1725315063;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=33v1eQT9GnPGoXvY61UfarMCNAR9O1t+ASdJzKFEsFA=;
 b=ZtJ9WqxFuOSzg7zCmbyqdU2S52iWGrZy4t906P2ADOujo628jvVDXUkKRDC+/a/2CV
 HhqoD8Cq6BpxbCw1llinl5mmy6cTD6xDY4MDNWOeUByWR3uSA4OnNz15NDvru0xPNV/I
 Rty2JwNXHMU2CY2yJNmus/eEl6sqg6V8jqPrw0I6tgs0HUSruDgnnTe1PYNTW6wL6Pm3
 x9qhQRkAcd9ZEnTo3NLQbNTM5VOP7aiK+a6ytm17gG5x3BNV0Jc2/4bsMK5m+RoStG65
 UvySSzRzmE6Igh3FiEgzVlN6JDojKhNjhOSVzz1VbIth45ntXkEvNPwgHo/Lb9NKy3K3
 XZ3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcwE4EzgMy5lv7AwszeCKRxS63+wL9yXoAKA9q+1q1vGkGfej+/UBQM48sWpsEw2tLsjfRrA+gGA==@nongnu.org
X-Gm-Message-State: AOJu0YxvCRVRf3Py8HXYxsZvUm17dmjYQhBrwUJvGUYRPNrbI+XJo492
 StwgqObEhc07fZ8GE9kgyt6mQD5xKzNW3QeCERA8m4ASsUMHhPKQomHwPBaWhkI=
X-Received: by 2002:a05:6122:1d51:b0:4fc:f1e3:d238 with SMTP id
 71dfb90a1353d-4fed5d63593mr1391597e0c.1.1724710263059; 
 Mon, 26 Aug 2024 15:11:03 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.216.241])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-454fe0f04adsm47913111cf.43.2024.08.26.15.11.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 26 Aug 2024 15:11:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Sergey Kambalin <sergey.kambalin@auriga.com>, qemu-arm@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/4] tests/functional: Convert Raspberry Pi avocado tests
Date: Tue, 27 Aug 2024 00:10:54 +0200
Message-ID: <20240826221058.75126-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a29;
 envelope-from=philmd@linaro.org; helo=mail-vk1-xa29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 4l8L80YoyE1K

▶ 4/5 test_aarch64_raspi3.Aarch64Raspi3Machine.test_aarch64_raspi3_atf                OK
4/5 qemu:func-thorough+func-aarch64-thorough+thorough / func-aarch64-aarch64_raspi3   OK   1.96s   1 subtests passed
▶ 5/5 test_aarch64_raspi4.Aarch64Raspi4Machine.test_arm_raspi4                        OK
5/5 qemu:func-thorough+func-aarch64-thorough+thorough / func-aarch64-aarch64_raspi4   OK   5.19s   1 subtests passed
▶ 6/6 test_arm_raspi2.ArmRaspi2Machine.test_arm_raspi2_initrd                         OK
▶ 6/6 test_arm_raspi2.ArmRaspi2Machine.test_arm_raspi2_uart0                          OK
6/6 qemu:func-thorough+func-arm-thorough+thorough / func-arm-arm_raspi2               OK   15.31s   2 subtests passed

Based-on: <20240821082748.65853-1-thuth@redhat.com>

Philippe Mathieu-Daudé (4):
  tests/functional: Add a class containing Linux kernel helpers
  tests/functional: Convert ARM Raspi2 avocado tests
  tests/functional: Convert Aarch64 Raspi3 avocado tests
  tests/functional: Convert Aarch64 Raspi4 avocado tests

 MAINTAINERS                                |   3 +
 tests/avocado/boot_linux_console.py        | 205 ---------------------
 tests/functional/meson.build               |   6 +
 tests/functional/qemu_test/linux_kernel.py |  19 ++
 tests/functional/test_aarch64_raspi3.py    |  42 +++++
 tests/functional/test_aarch64_raspi4.py    | 106 +++++++++++
 tests/functional/test_arm_raspi2.py        | 103 +++++++++++
 7 files changed, 279 insertions(+), 205 deletions(-)
 create mode 100644 tests/functional/qemu_test/linux_kernel.py
 create mode 100755 tests/functional/test_aarch64_raspi3.py
 create mode 100755 tests/functional/test_aarch64_raspi4.py
 create mode 100755 tests/functional/test_arm_raspi2.py

-- 
2.45.2

