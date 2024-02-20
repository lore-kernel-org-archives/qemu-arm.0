Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1481366ejb;
        Tue, 20 Feb 2024 10:42:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXcA2XPzXF6YBQk14g/7Jwvx3KwprkHgexfMEFmJiIVP0AO1zLbeSntnBqCs3TVvOggrQAgABqubPjUH9JbRHGf8PtGMKdq
X-Google-Smtp-Source: AGHT+IEE7632Jik86dixMDWCDuHawinzg8YiwNxfBDePvNVf9EXf9tSbAGp4CQODtvtpPL4yUMmN
X-Received: by 2002:a0c:f5cf:0:b0:68f:42c1:3b90 with SMTP id q15-20020a0cf5cf000000b0068f42c13b90mr10284559qvm.37.1708454539844;
        Tue, 20 Feb 2024 10:42:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708454539; cv=none;
        d=google.com; s=arc-20160816;
        b=eH8bFfASMd8By8t5PRZuPxSRuQ1LT3gJqWUqk2IocSR6V7MzTOQSYK7FLN++904hoz
         Hfe6romIOHnMJJfC0PS+jkKLCxLb4ckSx9LcpxRdIqbc8iAEFbQj636+vcO0U2HM/JJL
         W5i1TNZljBEYW6IoRETZj5iPVIxdeWLXfs6vAr8I8Epym9rYFbvxO19PclVLTqg3q4bp
         7joWQi3Fb8no6GONE8zoJkLQN08Ekd9wahiFu57cCU9zeDpRaDDnbDuoJO2VfPiRukOY
         HOdC8fO/MfkZ8k88Eh9QFOrUEwaZYQKayxq8I3z1Oy0nfH+bvvzDwPPlFNl27BxbJTnF
         eI9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-filter;
        bh=OTbBZYmQUWM13WJNxLCM/jwplynIgnpCD8rkYnjcGe0=;
        fh=31/rTn8oxDeRzQuTTj2k2aybEbC1vPrtdapSEyLy5Dw=;
        b=EqdPT9kR4Zr29fbwsRcE03aCng8l2N5PUlfm/RRVGyuryq3OP7hdfj03ErJgMf0KxI
         CaE2GV4ivVCcYRlXmkDum9YywsGkJkb0+ry5q0WyqmSyctpcXrux+IG85FbsBOOt+s08
         8n5T64sH2kONIlByisFeXaavHrLskE+BVjn5hC/pcr6AEhmDUyltsWjO6mEN7ZP9uyfI
         72ZxY1Oa/69i1NtZSn1BZwSHEEFJqGbFf1ADxqRWr0ZbD02JJzEgXNkKZhIN5CXfUZ0t
         nxsjpsxY3+913+9rsj6pT1s20XbjQh6Dj34ISmgo5khyF5Mf4XdR4LazVNdkbW3ccVAw
         9HVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=8Hrylc5s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id js5-20020a0562142aa500b0068f480d8aa2si7973867qvb.259.2024.02.20.10.42.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Feb 2024 10:42:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=8Hrylc5s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcV4B-0007vE-RS; Tue, 20 Feb 2024 13:42:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rcV46-0007rG-8r; Tue, 20 Feb 2024 13:42:05 -0500
Received: from zproxy2.enst.fr ([137.194.2.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rcV44-0007IK-AG; Tue, 20 Feb 2024 13:42:02 -0500
Received: from localhost (localhost [IPv6:::1])
 by zproxy2.enst.fr (Postfix) with ESMTP id 6873E80603;
 Tue, 20 Feb 2024 19:41:54 +0100 (CET)
Received: from zproxy2.enst.fr ([IPv6:::1])
 by localhost (zproxy2.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id W41KJoo3gUJq; Tue, 20 Feb 2024 19:41:54 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy2.enst.fr (Postfix) with ESMTP id E716980662;
 Tue, 20 Feb 2024 19:41:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy2.enst.fr E716980662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1708454514;
 bh=OTbBZYmQUWM13WJNxLCM/jwplynIgnpCD8rkYnjcGe0=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=8Hrylc5ssyoUTBoP/Aziit2/O32AMB9vy/N1Yogtd5e8FFeUbzJEYK+8W8DbrpPE1
 YGdW53l/PQphgehNRPQ3vztz5DKFweeX72RA051iXRneIVc1z/ykPXrLunneIRmTMs
 R99/E5k+GBzUSUseXTmsRcDm5sWQEvzoQ8BeTKbA=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy2.enst.fr ([IPv6:::1])
 by localhost (zproxy2.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id SpndP6v43cjW; Tue, 20 Feb 2024 19:41:53 +0100 (CET)
Received: from inesv-Inspiron-3501.lan (unknown
 [IPv6:2001:861:4680:b1b0:6f1f:d69d:dd9c:e973])
 by zproxy2.enst.fr (Postfix) with ESMTPSA id 52CA8805FE;
 Tue, 20 Feb 2024 19:41:53 +0100 (CET)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
Subject: [PATCH v2 0/2] hw/arm: Fix STM32L4x5 EXTI to CPU irq fan-in
 connections
Date: Tue, 20 Feb 2024 19:34:34 +0100
Message-ID: <20240220184145.106107-1-ines.varhol@telecom-paris.fr>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=137.194.2.221;
 envelope-from=ines.varhol@telecom-paris.fr; helo=zproxy2.enst.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: bp6+/AQ56/9P

The original code was connecting several outbounds qemu_irqs to the
same qemu_irq without using a TYPE_OR_IRQ.

This patch fixes the issue by using OR gates when necessary (1st commit).

I attempted to check that the problem is fixed by using a QTest (2nd comm=
it)
but actually the test is passing even before the fix :
when any fan-in input line is raised, the output is raised too.

Changes from v1 :
- using SoC State fields for EXTI OR gates
- correcting length of array `exti_or_gates_num_lines_in`
- using a for loop in the test for more clarity
- correcting typo in test comment

Fixes: 52671f69f7a4 ("[PATCH v8 0/3] Add device STM32L4x5 EXTI")
Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>

In=C3=A8s Varhol (2):
  hw/arm: Use TYPE_OR_IRQ when connecting STM32L4x5 EXTI fan-in IRQs
  tests/qtest: Check that EXTI fan-in irqs are correctly connected

 include/hw/arm/stm32l4x5_soc.h    |  4 ++
 hw/arm/stm32l4x5_soc.c            | 80 +++++++++++++++++++++++++++----
 tests/qtest/stm32l4x5_exti-test.c | 37 ++++++++++++++
 3 files changed, 111 insertions(+), 10 deletions(-)

--=20
2.43.2

