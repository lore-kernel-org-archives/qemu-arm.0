Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp2354476ejc;
        Wed, 13 Mar 2024 03:09:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXKsbp0Eg4ok5iC2Aqly1rhn3fNMK39LxcI6fu2YYcBVoOl1un9K+LETxEjquQdiCJtHKq0lmEXsnsBceMEXRj+/HIhGm6P
X-Google-Smtp-Source: AGHT+IHqpZFLkCHI9f5RYtVKXkGHJfhrLUURGix7yXFgsDdsp+RuMPSBbp7ASUKd6O9TLJ+4NH9Z
X-Received: by 2002:a05:6808:f92:b0:3c3:4ce4:8a44 with SMTP id o18-20020a0568080f9200b003c34ce48a44mr56713oiw.46.1710324576206;
        Wed, 13 Mar 2024 03:09:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710324576; cv=none;
        d=google.com; s=arc-20160816;
        b=GmgnLlvkmXNeyBuv+M6/HErgFj6IlDWPH0DbGDSbwJqOQUv35hPV7Iylx97/Ydm09r
         biPXRKusy+rLmG6wR+EgIWQ6WeAFaRczEsBojOs6god7PtJEc9guf8GQ9MSH8UDgOdor
         5tmDbU2W53ZfD/79X8oRIF3rCv6ZnSwLzNg5CDtDj6ZRKRKeRDuTEeiq3at8v+/Lu8Q+
         8sVewMMLCi18lXSoj8NWJooqwTNusxQHb+UPnWSzwP9yyP6IjDZaMPbeCnALT2qCs9Bj
         mCtu7+2mWg5uWrW4vFbiTpMPucz5pt/o2aIEJj3UAzZu7bI2QBlqGd4AXJ5nXb5pXqSx
         WKRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:content-transfer-encoding
         :mime-version:message-id:date:subject:from;
        bh=uYrgqLjQd/0Y2B70CQn6QEqSrvs9RKgQQziKXlv9pA0=;
        fh=LC/OdAGxp8XjCcxyMB5oH3DeKOnqJHpFVM0U3yCY+4A=;
        b=VaLlbatk83QYIirN4EVHkXtYKh76Xs4Lh1+YDIdlBUgbOEM/XfB4GZiFfv1xw78yEJ
         ECqcuBZsHEWQ5mVKvq2ARnGRfikztTn1l7E60seHZ2zqqzIK19RThNEQNW3MdEqYjwKn
         mtZyN6jerxa7PXS+Ka3sL22EdM28ABXIzSS5xikobXUDWXen421y1n1M/EOSWfZGANId
         E3ka3mIjh8845c9l3e4We8BGEQxAQOM9vQ1mZ+LyW336ChbvIH2tNU8p+cOFy6pRsE+n
         QM9G7QdZ4Ps2mIO9R7G9u9YpZPkD/N/iAXPbOzlSsxXZcQGXYhQo/llDa83rk5KQQNGT
         9NpA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pf16-20020a056214499000b0068f2ffd3a56si9481991qvb.588.2024.03.13.03.09.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Mar 2024 03:09:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rkLXN-0001qI-GT; Wed, 13 Mar 2024 06:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rkLXF-0001pR-IG; Wed, 13 Mar 2024 06:08:35 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rkLXA-0006UK-T7; Wed, 13 Mar 2024 06:08:33 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 76F3726084A;
 Wed, 13 Mar 2024 11:08:23 +0100 (CET)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id NFR7it6ewZO2; Wed, 13 Mar 2024 11:08:21 +0100 (CET)
Received: from [172.17.0.1] (83.11.22.169.ipv4.supernova.orange.pl
 [83.11.22.169])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id B39032601CE;
 Wed, 13 Mar 2024 11:08:20 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 0/3] tests/avocado: update sbsa-ref firmware to latest
Date: Wed, 13 Mar 2024 11:08:18 +0100
Message-Id: <20240313-sbsa-ref-firmware-update-v1-0-e166703c5424@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABJ78WUC/x2MSQqAMAwAvyI5G3CX+hXxUG2qObiQuIH4d4vHg
 Zl5QEmYFJroAaGTldclQBpHMEx2GQnZBYYsyYokT3PUXi0KefQs82WF8Nic3QnrsjbO+MqVpoe
 Qb0Hi+1+33ft+NPfWumoAAAA=
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
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: yHd+iQN6gpDk

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

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
Marcin Juszkiewicz (3):
      tests/avocado: update sbsa-ref firmware
      tests/avocado: drop virtio-rng from sbsa-ref tests
      tests/avocado: use OpenBSD 7.4 for sbsa-ref

 tests/avocado/machine_aarch64_sbsaref.py | 74 +++++++++++++++-----------------
 1 file changed, 34 insertions(+), 40 deletions(-)
---
base-commit: 0748129684be2773117b0b8fc3c60161abdb7bb8
change-id: 20240313-sbsa-ref-firmware-update-7579d9f6d59b

Best regards,
-- 
Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

