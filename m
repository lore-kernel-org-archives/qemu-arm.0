Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp205361eju;
        Thu, 14 Mar 2024 02:24:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWBa4TBP7AxIfqzuEXuiieuW7M3NJ0upiQFm8PzJs2QctJnDjimxIRsjCuvIRCFeYwTDdx46oj/vTWEFF+v9dtNAa6oXUrk
X-Google-Smtp-Source: AGHT+IGqrjUooPX0oW+bhRBYrLg73wmDi2ONbBnsK4hbgY8qqZhYCnm0F9hiSEsI1NkyK+K35laV
X-Received: by 2002:a05:6214:c8a:b0:690:c49f:7cb with SMTP id r10-20020a0562140c8a00b00690c49f07cbmr197492qvr.3.1710408261162;
        Thu, 14 Mar 2024 02:24:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710408261; cv=none;
        d=google.com; s=arc-20160816;
        b=cCRWsFfPkagNqN9m8gYMwUpmobiwhDLjcDZacU040cup6UoZUtDf9Y4NSJiE1KWC85
         0FcIiWK0iswMHyhvXu0uOv3v8a2Lt/Y6ewnobB6vEUlDTfTAndetLall4QH/wjW6Lgv7
         QHzmYaC+OFQwM/1e/sC+bjmupzv1LuV0wvAjQewpXov+jmumIdLZ0Cc5jHNaVQ0plP+o
         Gk8+78uuwi9vwWE8giRrzF5dg0tHU5SVu0uZ2Wb5hHMMgx8GQccCgVsd9S5s7Wp5/Q2f
         ExFQ/cUIOKB/xq6Xpu26H7m9pdiFRxwV6FxW1m6ss9lp/+Mgo3ahwtoLT74ovfx8HmQn
         WD7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:content-transfer-encoding
         :mime-version:message-id:date:subject:from;
        bh=thbu9xjL4yyUABSiAZ/h0mDTAVpECZJr3U743Quww7Y=;
        fh=LC/OdAGxp8XjCcxyMB5oH3DeKOnqJHpFVM0U3yCY+4A=;
        b=R1HXQ/TMspbJOQXhCIYU/xHC8VEAYDFIO3iUvYZCBYxFRN9b+M464gfCK7cYPRdthZ
         CN3bbUM6FYJPTXRz01itfsv6XmpebKO/M8BfRG5Ph02dWd9YaUU+Rzje4ghtz4FKeB2O
         BJqvXu66dBC5uCqlMv1H9hPmbfzBJiA3u+P099+KEINCtQKFLU69BEMf9UptJfj0rOCG
         b/qriRisRa3ZJaj9mz4DQNKZeKVTXnZxDcHvl3O//WcoYUtrZ4Hb327f72gEmWPEpINq
         0PrDS3Rxixj9Dc1AN6cnMsqZj4Vwd7cE7kil8ErvnerHbZhyW479deUT0Ti29AIjZJ3R
         Ab3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iv6-20020ad45ce6000000b0068f4553e43dsi245785qvb.39.2024.03.14.02.24.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Mar 2024 02:24:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rkhJN-0004oh-E0; Thu, 14 Mar 2024 05:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rkhJJ-0004nZ-OQ; Thu, 14 Mar 2024 05:23:37 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rkhJE-0007sI-Lc; Thu, 14 Mar 2024 05:23:37 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id C3C5A260BB2;
 Thu, 14 Mar 2024 10:23:29 +0100 (CET)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id OHE9iN8v3aOF; Thu, 14 Mar 2024 10:23:27 +0100 (CET)
Received: from [172.17.0.1] (83.11.22.169.ipv4.supernova.orange.pl
 [83.11.22.169])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 7DF2D260835;
 Thu, 14 Mar 2024 10:23:26 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v2 0/4] tests/avocado: update sbsa-ref firmware to latest
Date: Thu, 14 Mar 2024 10:23:23 +0100
Message-Id: <20240314-sbsa-ref-firmware-update-v2-0-b557c56559cd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAvC8mUC/42NTQ6CMBCFr0Jm7Zi2/AVX3sOwKHSASZSSKVYN4
 e5WTuDye3nvexsEEqYAl2wDociB/ZzAnDLoJzuPhOwSg1GmULnOMXTBotCAA8vjZYXwuTi7EtZ
 l3bhmqFzZdJDmSyrx+1Df2sQTh9XL53iK+pf+IY0aFZKuqlrlfVmY4nrn2Yo/exmh3ff9C81vx
 RrBAAAA
To: qemu-devel@nongnu.org
Cc: Radoslaw Biernacki <rad@semihalf.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Leif Lindholm <quic_llindhol@quicinc.com>, Cleber Rosa <crosa@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, Brad Smith <brad@comstyle.com>, 
 qemu-arm@nongnu.org, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
X-Mailer: b4 0.12.3
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: qBKBhYy8aUHr

Updating sbsa-ref firmware for QEMU CI was manual task. Now it is
replaced by CI job run on CodeLinaro Gitlab instance.

This patchset updates to current state:

- Trusted Firmware v2.10.2 (latest LTS)
- Tianocore EDK2 stable202402 (latest release)

And Tianocore EDK2-platforms commit 085c2fb (edk2-platforms does not
have releases).

Firmware images were built using Debian 'bookworm' cross gcc 12.2.0
compiler.

And while I am in that file I dropped use of 'virtio-rng-pci' device as
sbsa-ref is supposed to emulate physical hardware.

OpenBSD updated to 7.4 version.

(1/8) test_sbsaref_edk2_firmware: PASS (2.49 s)
(2/8) test_sbsaref_alpine_linux_cortex_a57: PASS (23.78 s)
(3/8) test_sbsaref_alpine_linux_neoverse_n1: PASS (23.38 s)
(4/8) test_sbsaref_alpine_linux_max_pauth_off: PASS (23.31 s)
(5/8) test_sbsaref_alpine_linux_max_pauth_impdef: PASS (29.27 s)
(6/8) test_sbsaref_alpine_linux_max: PASS (80.13 s)
(7/8) test_sbsaref_openbsd_cortex_a57: PASS (16.01 s)
(8/8) test_sbsaref_openbsd_neoverse_n1: PASS (16.05 s)

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
Changes in v2:
- disabled 'max' tests on OpenBSD
- moved tags to 'one tag per line'
- added 'os:linux' tags to Alpine ones
- Link to v1: https://lore.kernel.org/r/20240313-sbsa-ref-firmware-update-v1-0-e166703c5424@linaro.org

---
Marcin Juszkiewicz (4):
      tests/avocado: update sbsa-ref firmware
      tests/avocado: drop virtio-rng from sbsa-ref tests
      tests/avocado: use OpenBSD 7.4 for sbsa-ref
      tests/avocado: sbsa-ref: add Alpine tests for misc 'max' setup

 tests/avocado/machine_aarch64_sbsaref.py | 113 ++++++++++++++++++++-----------
 1 file changed, 73 insertions(+), 40 deletions(-)
---
base-commit: 0748129684be2773117b0b8fc3c60161abdb7bb8
change-id: 20240313-sbsa-ref-firmware-update-7579d9f6d59b

Best regards,
-- 
Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

